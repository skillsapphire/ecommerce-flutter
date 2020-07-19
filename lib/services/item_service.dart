
import 'package:listing_app/models/api_response.dart';
import 'package:listing_app/models/item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:listing_app/constants/app_constants.dart';

class ItemService{

  Future<APIResponse<List<Item>>> getItemList(var categoryId) {
    return http.get(API_BASE_URL + '/listing?per_page=30&listingcategory=$categoryId').then((data) {
      if (data.statusCode == 200) {
        final jsonData = jsonDecode(data.body);
        final items = <Item>[];
        for (var item in jsonData) {
          //print(item["listingtitle"]);
          Item itemModel = Item.fromJson(item);
          items.add(itemModel);
        }
        return APIResponse<List<Item>>(data: items);
      }
      return APIResponse<List<Item>>(error: true, errorMessage: 'An error occured while fetching listings');
    })
    .catchError((_) => APIResponse<List<Item>>(error: true, errorMessage: 'An error occured while fetching listings'));
  }

}