import 'package:flutter/material.dart';
import 'dart:math';

int _answer = 0;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Count Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Count Game'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _setAnswer() {
    setState(() {
      _answer = Random().nextInt(10);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: CustomPaint(
                painter: MyPainter(),
              ),
            ),
            FloatingActionButton.extended(
              onPressed: _setAnswer,
              tooltip: 'Start',
              label: const Text('Start'),
            ),
            Text(
              '$_answer',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint p = Paint();
    for (int i = 0; i < _answer; i++) {
      // 正円の描画
      p.style = PaintingStyle.fill;
      p.color = Color.fromARGB(150, 0, 200, 255);
      Offset ctr =
          Offset(Random().nextDouble() * 100, Random().nextDouble() * 100);
      canvas.drawCircle(ctr, 15.0, p);
    }
    // 楕円１の描画
    p.style = PaintingStyle.stroke;
    p.color = Color.fromARGB(150, 200, 0, 255);
    p.strokeWidth = 10.0;
    Rect r = Rect.fromLTWH(100.0, 50.0, 200.0, 150.0);
    canvas.drawOval(r, p);

    // 楕円２の描画
    r = Rect.fromLTWH(50.0, 100.0, 150.0, 200.0);
    canvas.drawOval(r, p);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
