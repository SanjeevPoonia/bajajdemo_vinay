
class AppModel{


  static bool isLogin=false;
  static String token='';
  static String deviceID='';
  static bool loginStatus=false;


  static bool setLoginToken(bool value)
  {
    isLogin=value;
    return isLogin;
  }
  static String setTokenValue(String value)
  {
    token=value;
    return token;
  }

  static String setDeviceID(String id)
  {
    deviceID=id;
    return deviceID;
  }
  static bool setLoginStatus(bool value)
  {
    loginStatus=value;
    return loginStatus;
  }

}
class TimePeriodData {
  final String timePeriod;
  final int value;

  TimePeriodData(this.timePeriod, this.value);
}