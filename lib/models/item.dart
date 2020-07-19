import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Item {
  
  int id;
  String title;
  String content;
  
  Item({this.id, this.title, this.content});

  factory Item.fromJson(dynamic item) => _$ItemFromJson(item);
}

Item _$ItemFromJson(dynamic json) {
  //print("json ${json}");
  //print(json["id"].runtimeType);

  int id = json["id"];
  String title = json["listingtitle"];
  String content = json["listingdescription"];
  
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