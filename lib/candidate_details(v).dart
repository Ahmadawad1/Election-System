import 'dart:convert';
import 'package:elections_app/Models/candidate.dart';
import 'package:elections_app/voterpage(v).dart';
import 'package:elections_app/candidate_details(v).dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class candidate_details extends StatefulWidget {
  const candidate_details({Key? key}) : super(key: key);

  @override
  _candidate_detailsState createState() => _candidate_detailsState();
}

class _candidate_detailsState extends State<candidate_details> {
  List<Citizen> futureCitizens = [];
  bool? isLoading;
  Map<int, bool> isAuth = {};
  List<bool> isDeleted = [];
  bool switchValue = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    fetchCitizens();
  }

  fetchCitizens() async {
    var url =
        Uri.parse("https://mocki.io/v1/9a155451-c025-4c24-b63a-15d7e79ede43");
    var response = await http.get(url);
    var parsedResponse = jsonDecode(response.body);
    List<Citizen> citizens = [];
    int counter = 0;
    parsedResponse.forEach((citizen) {
      citizens.add(Citizen.fromJson(citizen));
    });
    setState(() {
      isLoading = false;
      futureCitizens = citizens;
    });

    for (int i = 0; i < futureCitizens.length; i++) {
      setState(() {
        //TODO: delete the if statment and make it like this
        /*
          isAuth[futureCitizens[index].id] = futureCitizens[index].isVoted;
        */

        if (futureCitizens[i].isVoted == 1) {
          isAuth[futureCitizens[i].id!.toInt()] = true;
        } else {
          isAuth[futureCitizens[i].id!.toInt()] = false;
        }
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("candidate details "),
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
                'https://th.bing.com/th/id/OIP.rojxhaq0suOFtySn_lbWvAHaLH?w=185&h=278&c=7&r=0&o=5&pid=1.7',
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
                        Text("Mohammad Jaber",
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
                        Text("9910234525", style: TextStyle(fontSize: 18.0)),
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
                        Text("Jordainian",
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
                        Text("Amman",
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
                        Text("Email :" + "  ",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold)),
                        Text("exampel@gmail.com",
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
                        Text("Bio :" + "  ", //شعار المرشح
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold)),
                        Text("We work for you, and in your name we speak",
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
                        Text("Age :" + "  ",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold)),
                        Text("31",
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
                        Text("Gender :" + "  ",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold)),
                        Text("Male",
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
                        Text("Education :" + "  ",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold)),
                        Text("BBA of Business Administration",
                            style: TextStyle(
                              fontSize: 18.0,
                            )),
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
