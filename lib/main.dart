// import 'package:first_project/calc.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
      List<Widget> list = [];
  @override
  Widget build(BuildContext context) {

   for(int i = 0; i<100; i++){
    list.add(

   Padding(
     padding: const EdgeInsets.all(8.0),
     child: Container(color: Colors.green,
      height: 100,
      child: Text('hello $i'),
      ),
   ),
    );
    } 
    return MaterialApp(
      home: SafeArea(child: 
      Scaffold(body:ListView(
        children:  list
      ),)
      ),);
  }
}