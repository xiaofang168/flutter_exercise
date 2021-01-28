import 'package:flutter_app/generated/json/base/json_convert_content.dart';

class SystemStatusEntity with JsonConvert<SystemStatusEntity> {
	int status;
	String desc;
	bool data;
}
