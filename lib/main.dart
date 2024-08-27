import 'package:exercicio01/HomeScreen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Aplicação Bancária',
      theme: ThemeData(
        primaryColor:Colors.blueAccent,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.redAccent),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
       home: HomeScreen(),
    );
  }
}