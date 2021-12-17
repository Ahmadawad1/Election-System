import 'dart:convert';
import 'package:elections_app/Models/candidates.dart';
import 'package:elections_app/Models/citiezens.dart';
import 'package:elections_app/voterpage(v).dart';
import 'package:elections_app/candidate_details(v).dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CandidateDetails extends StatefulWidget {
  const CandidateDetails({Key? key, this.candidate}) : super(key: key);
  final Candidate? candidate;

  @override
  _CandidateDetailsState createState() => _CandidateDetailsState();
}

class _CandidateDetailsState extends State<CandidateDetails> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Candidate Details "),
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
                widget.candidate!.image!,
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
                              fontSize: 20.0, fontWeight: FontWeight.bold)),
                      Text(widget.candidate!.name!,
                          style: TextStyle(
                            fontSize: 18.0,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text("National ID :" + "  ",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold)),
                      Text(widget.candidate!.nationalID!.toString(),
                          style: TextStyle(fontSize: 18.0)),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text("Nationality :" + "  ",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold)),
                      Text(widget.candidate!.nationality!.toString(),
                          style: TextStyle(
                            fontSize: 18.0,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text("Location :" + "  ",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold)),
                      Text(
                        widget.candidate!.location!.toString(),
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text("Email :" + "  ",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold)),
                      Text(
                        widget.candidate!.email!,
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text("Bio :  ",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold)),
                      Text(
                        widget.candidate!.bio!,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18.0,
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
                              fontSize: 20.0, fontWeight: FontWeight.bold)),
                      Text(
                        widget.candidate!.age!.toString(),
                        style: TextStyle(
                          fontSize: 18.0,
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
                              fontSize: 20.0, fontWeight: FontWeight.bold)),
                      Text(
                        widget.candidate!.gender!.toString(),
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
