import 'dart:convert';
import 'package:elections_app/Models/citiezens.dart';
import 'package:elections_app/voterpage(v).dart';
import 'package:elections_app/candidate_details(v).dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CitizenDetails extends StatefulWidget {
  const CitizenDetails({Key? key, this.citizen}) : super(key: key);
  final Citizen? citizen;

  @override
  _CitizenDetailsState createState() => _CitizenDetailsState();
}

class _CitizenDetailsState extends State<CitizenDetails> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("details of citizen"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                widget.citizen!.image!,
                height: 200,
                width: 200,
              ),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(30, 40, 20, 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Name :" + "  ",
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.bold)),
                        Text(
                          widget.citizen!.name!,
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text("National ID :" + "  ",
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.bold)),
                        Text(
                          widget.citizen!.nationalID!.toString(),
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text("Nationality :" + "  ",
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.bold)),
                        Text(
                          widget.citizen!.nationality!.toString(),
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          "Location :   ",
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.citizen!.location!.toString(),
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text("Age :" + "  ",
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.bold)),
                        Text(
                          widget.citizen!.age!.toString(),
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text("Gender :" + "  ",
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.bold)),
                        Text(
                          widget.citizen!.gender!.toString(),
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text("is Voted :" + "  ",
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.bold)),
                        (widget.citizen!.isVoted == 1)
                            ? Row(
                                children: [
                                  Icon(
                                    Icons.check_rounded,
                                    color: Colors.green,
                                  ),
                                  SizedBox(width: 3),
                                  Text(
                                    "Voted.",
                                    style: TextStyle(
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              )
                            : Row(
                                children: [
                                  Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  ),
                                  SizedBox(width: 3),
                                  Text(
                                    "Didn't vote.",
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          "Allow to Vote :" +
                              "  " +
                              widget.citizen!.status!.toString(),
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
