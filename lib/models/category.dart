import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'package:sos_services/repositories/table_keys.dart';

class Category {
  Category({this.id, this.description});

  Category.fromParse(ParseObject parseObject)
      : id = parseObject.objectId,
        description = parseObject.get(keyCategoryDescription);

  final String id;
  final String description;

  @override
  String toString() => 'Category(id: $id, description: $description)';
}
