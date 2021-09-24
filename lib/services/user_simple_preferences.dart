import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static SharedPreferences _preferences;

  static const _keyEmail = 'email_user';
  static const _keyCity = 'city_filter';
  static const _keyCategory = 'category';
  static const _keyUserName = 'user_name';
  static const _keyPhoneNum = 'phnum';
  static const _keyVerify = 'verify';
  static const _keyImagePath = 'imgpath';
  static const _keyUserPoints = 'user_points';
  static const _keyImagelink = 'image_link';
  static const _keyAuth = 'authkey';
  static const _keyUserPhone = 'userphone';
  static const _keyIsBenefeciary = 'isBenefeciary';
  static const _keyIsFirst = 'isFirst';
  static const _keyIsFirst1 = 'isFirst1';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setAuthKey(String status) async =>
      await _preferences.setString(_keyAuth, status);

  static String getAuthKey() => _preferences.getString(_keyAuth);

  static Future setUserPhnum(String status) async =>
      await _preferences.setString(_keyUserPhone, status);

  static String getUserPhnum() => _preferences.getString(_keyUserPhone);

  static Future setImageLink(String link) async =>
      await _preferences.setString(_keyImagelink, link);

  static String getImageLink() => _preferences.getString(_keyImagelink);

  static Future setEmail(String email) async =>
      await _preferences.setString(_keyEmail, email);

  static String getEmail() => _preferences.getString(_keyEmail);

  static Future setFirst(String status) async =>
      await _preferences.setString(_keyIsFirst, status);

  static String getFirst() => _preferences.getString(_keyIsFirst);

  static Future setisFirst1(String status) async =>
      await _preferences.setString(_keyIsFirst1, status);

  static String getisFirst1() => _preferences.getString(_keyIsFirst1);

  static Future setCity(String city) async =>
      await _preferences.setString(_keyCity, city);

  static String getCity() => _preferences.getString(_keyCity);

  static Future setCategory(String cat) async =>
      await _preferences.setString(_keyCategory, cat);

  static String getCategory() => _preferences.getString(_keyCategory);

  static Future setUserName(String name) async =>
      await _preferences.setString(_keyUserName, name);

  static String getUserName() => _preferences.getString(_keyUserName);

  static Future setphonenumber(String phnum) async =>
      await _preferences.setString(_keyPhoneNum, phnum);

  static String getphonenumber() => _preferences.getString(_keyPhoneNum);

  static Future setVerifyStatus(String vf) async =>
      await _preferences.setString(_keyVerify, vf);

  static String getVerifyStatus() => _preferences.getString(_keyVerify);

  static Future setImagePath(String ip) async =>
      await _preferences.setString(_keyImagePath, ip);

  static String getImagePath() => _preferences.getString(_keyImagePath);
}
