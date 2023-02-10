import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
  home:MyWidget()
  )
  );
}
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  TextEditingController controller = TextEditingController();
  Widget exp (String b,[Color colo=Colors.red]){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: colo,
        fixedSize: Size(50, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
      ),
      onPressed: (){
if(controller.text[controller.text.length -1]=='*'){
  controller.text = 
  controller.text.substring(0,controller.text.length -1);
}
else if(controller.text[controller.text.length -1]=='/'){
  controller.text =
  controller.text.substring(0,controller.text.length -1);
}
else if(
  controller.text[controller.text.length -1]=='+'){
    controller.text =
    controller.text.substring(0,controller.text.length -1);
  }else 
  if(controller.text[controller.text.length -1]=='-'){
    controller.text =
    controller.text.substring(0,controller.text.length -1);
  }
   controller.text +=b;
    }, child: Text(b));  
  }
  Widget wid (String a,[Color col = Colors.amber]){
    return ElevatedButton(
       style: ElevatedButton.styleFrom(
        backgroundColor: col,
        fixedSize: Size(50, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
      ),onPressed: (){
      controller.text +=a;
    }, child: (Text(a)));
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Calculator'))),
        body: Scaffold(
          backgroundColor: Colors.grey,
          body: 
        Container(child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          Padding(
            padding: const EdgeInsets.all(50),
            child: TextField(
              textAlign: TextAlign.end,
              readOnly: true,
              controller: controller,
              style: TextStyle(fontSize: 40,color: Colors.white),
              decoration: InputDecoration(hintText: '0',hintStyle: TextStyle(color: Colors.white)),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
          wid('1'),
          wid('2'),
          wid('3'),
          wid('4'),
          ],),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
         exp('/'),
         exp('*'),
         exp('+'),
         exp('-'),
          ],),
           Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
       ElevatedButton(onPressed: (){
      String exp ='*/+-';
      List<int>ind = [];
      for (int i = 0; i<controller.text.length; i++){
        if(exp.contains(controller.text[i])){
          ind.add(i);
        }
      }
      List<num> numbers =[];
      int q =0;
      for(int i in ind){
        numbers.add(num.parse(controller.text.substring(q,i)));
        q = i + 1;
      }
      numbers.add(
        num.parse(controller.text.substring(ind.last +1)),
      );
      for (int i = 0; i<ind.length;i++){
        if(controller.text[ind[i]] == '*'){
          numbers[i] = numbers[i] * numbers[i +1];
          numbers.removeAt(i +1);
          ind.removeAt(i);
          i--;
        }else
        if(controller.text[ind[i]] == '/'){
          numbers[i] = numbers[i] / numbers[i +1];
          numbers.removeAt(i +1);
          ind.removeAt(i);
          i--;
          }
      }
      for(int i =0; i<ind.length;i++){
        if(controller.text[ind[i]] =='+'){
          numbers[i] = numbers[i] + numbers[i +1];
          numbers.removeAt(i+1);
          ind.removeAt(i);
          i--;
        }else 
        if(controller.text[ind[i]] == '-'){
          numbers[i] = numbers[i]-numbers[i +1];
          numbers.removeAt(i+1);
          ind.removeAt(i);
          i--;
        }

      }
      controller.text = numbers[0].toStringAsFixed(2);

       }, child: Text('='))
          ],)
        ]),)
        ),
        ),);
  }
}

