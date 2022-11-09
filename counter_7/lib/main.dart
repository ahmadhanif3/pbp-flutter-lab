import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: "Program Counter"),
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
  int _counter = 0;

  Text genap = const Text(
    'GENAP',
    style: TextStyle(color: Color.fromRGBO(255, 0, 0, 100)),
  );

  Text ganjil = const Text(
    'GANJIL',
    style: TextStyle(color: Color.fromRGBO(0, 0, 255, 100)),
  );

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter != 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            (_counter % 2 == 0)? genap:ganjil,
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
             Align(
                alignment: Alignment.bottomLeft,
                child: Opacity( // Bisa dengan Visibility()
                  opacity: (_counter > 0)? 1:0.2,
                  child:  FloatingActionButton(
                      onPressed: _decrementCounter,
                      tooltip: (_counter > 0)? 'Decrement':'',
                      child: const Icon(Icons.remove),
                    )
                )
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: _incrementCounter,
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                )
            ),
          ],
        ),
      )
    );
  }
}
