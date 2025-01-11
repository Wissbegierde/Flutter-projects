import 'package:flutter/material.dart';
import 'package:prueba/themes/theme.dart';


class ThemeProvider with ChangeNotifier {

  //initalially, theme is light mode
  ThemeData _themeData = lightMode;

  //getter
  ThemeData get themeData => _themeData;

  //know if the theme is dark mode
  bool get isDarkMode => themeData == darktMode;

  //setter
  set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }
  
  //toggle theme
  void toggleTheme(){
    if (_themeData == lightMode){
      themeData = darktMode;
    }
    else{
      themeData = lightMode;
    }
  }


}