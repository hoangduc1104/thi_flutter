import 'package:hive/hive.dart';

class Token {
  Future<void> writeToken({required value}) async {
    var box = await Hive.openBox('tokenBox');

    box.put('token', value);
  }

  Future<String> readToken() async {
    var box = await Hive.openBox('tokenBox');

    final token = box.get('token');
    print(token);

    return token;
  }
}