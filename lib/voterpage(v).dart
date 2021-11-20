import 'dart:convert';
import 'package:elections_app/citizens_Details(d).dart';
import 'package:elections_app/Models/candidate.dart';
import 'package:elections_app/candidate_details(v).dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class votepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'List of candidate',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('List of candidate', style: TextStyle(fontSize: 23)),
        ),
        body: BodyLayout(),
      ),
    );
  }
}

class BodyLayout extends StatefulWidget {
  @override
  State<BodyLayout> createState() => _BodyLayoutState();
}

class _BodyLayoutState extends State<BodyLayout> {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

Widget _myListView(BuildContext context) {
  final names = [
    'Mohammed Jaber',
    'Ahmad Nedal',
    'Feras Awad',
    'Ammar Dolat',
    'Mahmoud mustafa',
    'moayad ahmad',
    'samer samera',
    'khalid omar',
    'khalel omar',
    'sohaib khalid',
    'saleem ammar'
  ];

  final District = [
    'Amman, 1st Electoral District',
    'Amman, 1st Electoral District',
    'Amman, 1st Electoral District',
    'Amman, 1st Electoral District',
    'Amman, 1st Electoral District',
    'Amman, 1st Electoral District',
    'Amman, 1st Electoral District',
    'Amman, 1st Electoral District',
    'Amman, 1st Electoral District',
    'Amman, 1st Electoral District',
    'Amman, 1st Electoral District'
  ];

  return  ListView.builder(
    padding: const EdgeInsets.all(8.0),
    itemCount: names.length,
    itemBuilder: (context, index) {
      return Container(
          child: Card(
              elevation: 10.0,
              color: Colors.grey[100],
              child: ListTile(
                contentPadding: EdgeInsets.all(15),
                title: Center(
                  child: Row(
                    children: [
                      Text(names[index], style: TextStyle(fontSize: 22)),
                      SizedBox(width: 5,),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => candidate_details()));
                        },
                        child: Icon(
                          Icons.info_outline_rounded,
                          size: 20,
                          color:Colors.lightBlue[800],
                        ),
                      )
                    ],
                  ),
                ),
                subtitle: Text(
                  District[index],
                  style: TextStyle(color: Colors.blueGrey[700], fontSize: 12),
                ),
                leading:ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.network(
                                        'https://th.bing.com/th/id/OIP.rojxhaq0suOFtySn_lbWvAHaLH?w=185&h=278&c=7&r=0&o=5&pid=1.7',
                                        height: 90,
                                        width: 90,
                                      ),
                                    ),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shadowColor: Colors.black,
                      elevation: 10,
                      textStyle:
                          TextStyle(fontSize: 16, color: Colors.black26)),
                  child: Text(
                    "VOTE",
                  ),
                  onLongPress: null,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            titlePadding: EdgeInsets.only(top: 15),
                            title: Center(
                              child: Icon(Icons.check_circle_outline_rounded,
                              color: Colors.green[800],
                              size: 100,)
                            ),


                            content: 
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("You Voted for ",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                Text(names[index],
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.red[900])),
                              ],
                            ),


                          );
                        });
                  },
                ),
              )));
    },
  );
}
