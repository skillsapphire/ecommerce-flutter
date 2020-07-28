import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:listing_app/constants/ui_constants.dart';
import 'package:listing_app/models/api_response.dart';
import 'package:listing_app/models/item.dart';
import 'package:listing_app/models/item_category.dart';
import 'package:listing_app/services/item_category_service.dart';
import 'package:listing_app/services/item_service.dart';
import 'package:listing_app/views/detail/item_details.dart';
import 'item_card.dart';

class Body extends StatefulWidget {

  final menu;
  Body({Key key, @required this.menu}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  ItemCategoryService get itemCategoryService => GetIt.I<ItemCategoryService>();
  ItemService get itemService => GetIt.I<ItemService>();

  APIResponse<List<Item>> _apiItemResponse;
  APIResponse<List<ItemCategory>> _apiItemCategoryResponse;

  List<Item> itemList = new List<Item>();
  List<ItemCategory> itemCategoryList = new List<ItemCategory>();

  // By default our first item will be selected
  int selectedIndex = 0;

  bool _isLoadingItem = false;
  bool _isLoadingCategory = false;
  bool _isGridMenu = false;

  @override
  void initState() {
    //print("Menu clicked is ${widget.menu}");
    if(widget.menu == 'Explore'){
      _isGridMenu = true;
    }
    _fetchCategoryData();
    super.initState();
  }

  _fetchItemData(var categoryId) async {
    setState(() {
      _isLoadingItem = true;
    });

    _apiItemResponse = await itemService.getItemList(categoryId, widget.menu);
    this.itemList = _apiItemResponse.data;

    setState(() { 
      _isLoadingItem = false;
    });
  }

  _fetchCategoryData() async {
    setState(() {
      _isLoadingCategory = true;
    });

    _apiItemCategoryResponse = await itemCategoryService.getItemCategoryList(widget.menu);
    this.itemCategoryList = _apiItemCategoryResponse.data;
    _fetchItemData(this.itemCategoryList[selectedIndex].id);

    setState(() {
      _isLoadingCategory = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
         Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
            child: SizedBox(
              height: 26,
              child: _isLoadingCategory ? Center(child: Text("Loading categories...",style: TextStyle(fontFamily:  appFontFamily))) : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: this.itemCategoryList.length,
                itemBuilder: (context, index) => buildCategory(index),
              ),
            ),
          ),
        Expanded(
          child: _isLoadingItem ? Center(child: CircularProgressIndicator()) :Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: this.itemList.length == 0 ? Center(child: Text("No data found.", style: TextStyle(fontFamily:  appFontFamily),)) :
            _isGridMenu ? GridView.builder(
                itemCount: this.itemList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: kDefaultPaddin,
                  crossAxisSpacing: kDefaultPaddin,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => ItemCard(
                      item: this.itemList[index],
                      press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              item: this.itemList[index],
                            ),
                          )),
                    )
            ): ListView.builder(
                itemCount: this.itemList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              item: this.itemList[index],
                            ),
                          ));
                    },
                    child: Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 8),
                        child: Text(
                          this.itemList[index].title,
                          style: TextStyle(fontFamily: appFontFamily, fontSize: 18),
                        ),
                      ),
                    ),
             );
            })
          ),
        ),
      ],
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        _fetchItemData(this.itemCategoryList[index].id);
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              this.itemCategoryList[index].name,
              style: TextStyle(
                fontFamily: appFontFamily,
                fontWeight: FontWeight.w900,
                fontSize: 12,
                color: selectedIndex == index ? kTextColor : kTextLightColor,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultPaddin / 4), //top padding 5
              height: 2,
              width: 30,
              color: selectedIndex == index ? Colors.black : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
