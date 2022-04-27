import 'package:flutter/material.dart';


Future navigate(BuildContext context, Widget page, {bool replace =  false }){
  final Function nav =  replace ? Navigator.pushReplacement : Navigator.push ;
  return nav(context, MaterialPageRoute(builder: (BuildContext context){
    return page;
  }));
}