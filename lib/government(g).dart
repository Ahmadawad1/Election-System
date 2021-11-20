import 'dart:convert';
import 'package:elections_app/candidate_reg(g).dart';
import 'package:elections_app/citizens_Details(d).dart';
import 'package:elections_app/Models/candidate.dart';
import 'package:elections_app/government(g).dart';
import 'package:elections_app/voterpage(v).dart';
import 'package:elections_app/candidate_details(v).dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class gov extends StatelessWidget {
  const gov({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Registration';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Information Page",style: TextStyle(fontSize: 22),),
            backgroundColor: Colors.blue[700],
          ),
          body: Container(
              decoration: BoxDecoration(
                // Box decoration takes a gradient
                gradient: LinearGradient(
                  // Where the linear gradient begins and ends
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  // Add one stop for each color. Stops should increase from 0 to 1
                  colors: [
                    // Colors are easy thanks to Flutter's Colors class.
                    Colors.grey,
                    Colors.lightBlue.shade900,
                  ],
                ),
              ),
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.lightBlue[900],
                      child: Container(
                        child: InkWell(
                            onTap: () {
                              
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    'https://img.icons8.com/office/452/statistics.png',
                                    height: 80,
                                    width: 80,
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                const Text(
                                  "Statistics",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                      color: Colors.white),
                                ),
                              ],
                            )),
                      )),
                  Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.lightBlue[900],
                      child: Container(
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                              context,
                               MaterialPageRoute(
                               builder: (ctx) =>reg()));
                               },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    'https://img.icons8.com/officel/80/000000/edit-user-male.png',
                                    height: 80,
                                    width: 80,
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                const Text(
                                  "Registration",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                      color: Colors.white),
                                ),
                              ],
                            )),
                      )),
                ],
              ))),
    );
  }
}
