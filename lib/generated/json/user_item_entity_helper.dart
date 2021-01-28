import 'package:flutter_app/model/user_item_entity.dart';

userItemEntityFromJson(UserItemEntity data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['user_name'] != null) {
		data.userName = json['user_name'].toString();
	}
	if (json['sex'] != null) {
		data.sex = json['sex'] is String
				? int.tryParse(json['sex'])
				: json['sex'].toInt();
	}
	if (json['avatar'] != null) {
		data.avatar = json['avatar'].toString();
	}
	return data;
}

Map<String, dynamic> userItemEntityToJson(UserItemEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['user_name'] = entity.userName;
	data['sex'] = entity.sex;
	data['avatar'] = entity.avatar;
	return data;
}