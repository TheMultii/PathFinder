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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF3690),
          primary: const Color(0xFFFF3690),
          background: const Color.fromARGB(255, 18, 18, 18),
          brightness: Brightness.dark,
        ),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: const Color.fromARGB(255, 248, 248, 248),
              displayColor: const Color.fromARGB(255, 248, 248, 248),
            ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.white,
          selectionColor: Color.fromARGB(100, 100, 100, 100),
          selectionHandleColor: Color(0xFFFF3690),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '🧑‍🦯'),
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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 400,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  image: NetworkImage(
                    "https://api.mganczarczyk.pl/tairiku/random/streetmoe?safety=true",
                  ),
                ),
              ),
            ),
            const Dupa(text: "🤡🤡🤡🤡🤡🤡"),
            Text(
              'You have ${_counter % 2 == 0 ? "ligma" : "sugma"}',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        backgroundColor: Colors.green,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Dupa extends StatelessWidget {
  final String text;

  const Dupa({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text("amine $text");
  }
}
