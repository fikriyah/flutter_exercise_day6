//import 'package:bloc_5/capitalize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/capcubit.dart';

class Exercise2 extends StatelessWidget {
  const Exercise2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          create: (context) => Capitalize(),
          child: const MyHomePage(title: 'Flutter Cubit Capitalize')),
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
  var textInput;

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
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Write something',
                ),
                onChanged: (String text) {
                  setState(() {
                    textInput = text;
                  });
                },
              ),
            ),
            ElevatedButton(
                onPressed: () => context.read<Capitalize>().capIt(textInput),
                child: const Text('Capitalize it!')),
            BlocBuilder<Capitalize, String>(
              builder: (context, caps) => Center(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Text(caps),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
