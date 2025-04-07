import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'DICE GAME!',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int Dicenum  = 1;

  List<int> prevThrows = [];
  void keepThrows(){
    setState(() {
      prevThrows.add(Dicenum);
    });
  }
  String displayDice(int DiceNum) {
    return 'assets/images/dice_$DiceNum.png';

  }

  void diceroll() {
    setState(() {

      Dicenum = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child:
          Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Push The Button To Throw the dice',style: TextStyle(fontSize: 25)),
            Image.asset(
              displayDice(Dicenum),
              width: 150,
              height: 150,)

            ,Text('Previous throws:' ,style: TextStyle(fontSize: 20),),
            Text( '${prevThrows.join(', ')}',style: TextStyle(fontSize: 20),),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          diceroll();
          keepThrows();
        },
        tooltip: 'Roll dice',
        child: Icon(Icons.diamond_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
