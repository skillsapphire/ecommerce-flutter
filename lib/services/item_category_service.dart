
import 'package:listing_app/models/api_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:listing_app/constants/app_constants.dart';
import 'package:listing_app/models/item_category.dart';

class ItemCategoryService{

  Future<APIResponse<List<ItemCategory>>> getItemCategoryList() {
    return http.get(API_BASE_URL + '/listingcategory/?_fields=id,name').then((data) {
      if (data.statusCode == 200) {
        final jsonData = jsonDecode(data.body);
        final itemCategories = <ItemCategory>[];
        for (var itemCategory in jsonData) {
          ItemCategory itemCategoryModel = ItemCategory.fromJson(itemCategory);
          itemCategories.add(itemCategoryModel);
        }
        return APIResponse<List<ItemCategory>>(data: itemCategories);
      }
      return APIResponse<List<ItemCategory>>(error: true, errorMessage: 'An error occured while fetching categories');
    })
    .catchError((_) => APIResponse<List<ItemCategory>>(error: true, errorMessage: 'An error occured while fetching categories'));
  }

}