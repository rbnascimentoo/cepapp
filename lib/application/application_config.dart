import 'package:flutter/services.dart';

class ApplicationConfig {

  ApplicationConfig(){
     SystemChrome.setPreferredOrientations(
       [
         DeviceOrientation.portraitUp
       ]
     ) ;
  }

}