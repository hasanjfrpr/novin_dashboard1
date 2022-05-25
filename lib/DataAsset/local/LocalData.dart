
import 'package:shared_preferences/shared_preferences.dart';


class LocalData{

static SharedPreferences? _sharedPreferences;


static Future getSharedInstance() async{
  _sharedPreferences ??= await SharedPreferences.getInstance();

}

static String? getIp()=>_sharedPreferences?.getString("ip") ?? "";

static Future setIp(String ip) async{
  await _sharedPreferences?.setString("ip", ip);
}
static Future setSerialSocket(String serial) async{
  await _sharedPreferences?.setString("serial", serial);
}
static String? getSerial()=> _sharedPreferences?.getString("serial") ?? "";

static Future setConnectMethode(String connectionMethodeName) async{
  await _sharedPreferences?.setString("connectionMethode", connectionMethodeName);
}

static String? getConnectionMethode()=> _sharedPreferences?.getString("connectionMethode") ?? "ip";



}