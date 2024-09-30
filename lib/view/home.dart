
import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:learn_api/Services/api.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _number = TextEditingController();
  String fact = 'The fact will be here';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 69, 0, 133),
        title: const Text('The Number Facts '),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/bg.jpg'))),
        child: Center(
          child: SizedBox(
            height: 480,
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  'Type any number to get a fact about that it...',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 69, 0, 133),
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      fontFamily: 'Comic Sans MS'),
                ),
                Spacer(),
                TextField(
                  controller: _number,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                  cursorColor: Color.fromARGB(255, 69, 0, 133),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: 'Enter a number...',
                      hintStyle: TextStyle(color: Colors.white),
                      fillColor: Color.fromARGB(58, 69, 0, 133),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 5,
                              color: Color.fromARGB(255, 69, 0, 133))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 5,
                              color: Color.fromARGB(255, 69, 0, 133)))),
                ),
                const Spacer(),
                ClipRect(
                  clipBehavior: Clip.hardEdge,
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                      child: IntrinsicHeight(
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border:
                                    Border.all(width: 4, color: Colors.white)),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                textAlign: TextAlign.center,
                                fact,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 69, 0, 133),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 24,
                                    fontFamily: 'Comic Sans MS'),
                              ),
                            ))),
                      )),
                ),
                const Spacer(),
                FilledButton(
                    style: FilledButton.styleFrom(
                        minimumSize: const Size(370, 52),
                        backgroundColor: Color.fromARGB(255, 69, 0, 133),
                        textStyle: const TextStyle(
                          fontSize: 22,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () async {
                      String number = _number.text;
                      log(number);
                      String text = await getResponse(number);
                      setState(() {
                        fact = text;
                      });
                    },
                    child: const Text(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      'Get The Fact',
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
