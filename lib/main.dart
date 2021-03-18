import 'dart:math';

import 'package:flutter/material.dart';

void main() => {
      runApp(MaterialApp(
        theme: ThemeData(primarySwatch: Colors.purple),
        title: "Flutte Age Calculator",
        home: HomePage(),
      ))
    };

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int age = 0;
  var selectedYear = 0;

  void _showPicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime(2021),
            firstDate: DateTime(1990),
            lastDate: DateTime.now())
        .then((DateTime dt) {
      setState(() {
        selectedYear = dt.year;
        calculateAge();
      });
    });
  }

  void calculateAge() {
    setState(() {
      age = (2021 - selectedYear).toDouble() as int;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text("Age Calculator"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Center(child: Container(child: Text("drawer borad"))),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlineButton(
              child: Text(
                selectedYear != null
                    ? selectedYear.toString()
                    : "Tap to select your birth",
              ),
              //style: TextStyle(color: Colors.white),
              onPressed: _showPicker,
              borderSide: BorderSide(color: Colors.white10, width: 4),
            ),
            Padding(padding: EdgeInsets.all(20.0)),
            Text("Your Current Age is:$age ",
                style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
//${age.toStringAsFixed(0)}