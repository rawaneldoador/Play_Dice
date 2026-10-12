import 'package:flutter/material.dart';
import 'dice.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Play Dice',
      theme: ThemeData(
         
        colorScheme: .fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),
      home: const DiceScreen (),
    );
  }
}

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});
 
  @override
  State<DiceScreen> createState() => _DiceScreenState();
}




class _DiceScreenState extends State<DiceScreen> {

  int value_1 = 1;
  int value_2 = 1;
  int total = 2;

  String imagepath = 'assets/sad.jpg';



  void roll() {
    setState(() {
       value_1 = Random().nextInt(6)+ 1;
       value_2 = Random().nextInt(6)+ 1;
       total = value_1 + value_2;


       if (total >= 10){
        imagepath = 'assets/happy.png';
       }else{
        imagepath = 'assets/sad.jpg';
       }

    });
  }

  void reset(){
    setState(() {
      value_1 = 1;
      value_2 = 1;
      total = 2;
      imagepath= 'assets/sad.jpg';
    });
  }



  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      leading: const Padding(
        padding: EdgeInsets.all(8),
        child: Icon(Icons.casino),
      ),
      title: const Text("Play Dice"),
      backgroundColor:Theme.of(context).colorScheme.primary ,
      centerTitle: true,
    ),
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            "Total: $total",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 20),
          Image.asset(imagepath, height: 150),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Dice(value: value_1),
              Dice(value: value_2),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: roll,
                  child: const Text('Roll'),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: ElevatedButton(
                  onPressed: reset,
                  child: const Text('Reset'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),
        ],
      ),
    ),
  );
}
}