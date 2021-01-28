import 'package:flutter_app/model/system_status_entity.dart';

systemStatusEntityFromJson(SystemStatusEntity data, Map<String, dynamic> json) {
	if (json['status'] != null) {
		data.status = json['status'] is String
				? int.tryParse(json['status'])
				: json['status'].toInt();
	}
	if (json['desc'] != null) {
		data.desc = json['desc'].toString();
	}
	if (json['data'] != null) {
		data.data = json['data'];
	}
	return data;
}

Map<String, dynamic> systemStatusEntityToJson(SystemStatusEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['status'] = entity.status;
	data['desc'] = entity.desc;
	data['data'] = entity.data;
	return data;
}