import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Item {
  
  int id;
  String title;
  String content;
  
  Item({this.id, this.title, this.content});

  factory Item.fromJson(dynamic item, menu) => _$ItemFromJson(item, menu);
}

Item _$ItemFromJson(dynamic json, menu) {
  //print("json ${json}");
  //print(json["id"].runtimeType);
  int id; String title; String content;

    if(menu=='Doctors'){
      id = json["id"];
      title = json["doctor_name"];
      content = json["doctor_description"];
    }else if(menu=='Explore'){
      id = json["id"];
      title = json["listingtitle"];
      content = json["listingdescription"];
    }
  
  
  return Item(
    id: id,
    title: title,
    content: content
  );
}

Map<dynamic, dynamic> _$ItemToJson(Item instance) => <dynamic, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content
    };