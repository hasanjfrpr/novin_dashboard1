
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

static Future setBookId(String bookId) async{
 await _sharedPreferences?.setString("bookId",bookId );
}
static String? getBookId()=> _sharedPreferences?.getString("bookId") ?? "";

static Future setUsername(String userName) async{
  await _sharedPreferences?.setString("userName", userName);
}
static String? getUsername()=> _sharedPreferences?.getString("userName") ?? "";

static Future setPassword(String password) async{
  await _sharedPreferences?.setString("password", password);
}
static String? getPassword()=> _sharedPreferences?.getString("password") ?? "";

static Future setShowCaseModeHelp(String status) async{
  await _sharedPreferences?.setString("showCase", status);
}
static String? getShowCaseModeHelp()=> _sharedPreferences?.getString("showCase") ?? "";
}