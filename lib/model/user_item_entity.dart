import 'package:flutter_app/generated/json/base/json_convert_content.dart';
import 'package:flutter_app/generated/json/base/json_field.dart';

class UserItemEntity with JsonConvert<UserItemEntity> {
	int id;
	@JSONField(name: "user_name")
	String userName;
	int sex;
	String avatar;
}
