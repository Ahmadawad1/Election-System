import 'dart:convert';
import 'package:elections_app/candidate_reg(g).dart';
import 'package:elections_app/citizens_Details(d).dart';
import 'package:elections_app/Models/candidate.dart';
import 'package:elections_app/government(g).dart';
import 'package:elections_app/voterpage(v).dart';
import 'package:elections_app/candidate_details(v).dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(gov());
}

class ElectionApp extends StatefulWidget {
  const ElectionApp({Key? key}) : super(key: key);

  @override
  _ElectionAppState createState() => _ElectionAppState();
}

class _ElectionAppState extends State<ElectionApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: citizenPage(),
      debugShowCheckedModeBanner: false,
      
    );
  }
}

class citizenPage extends StatefulWidget {
  const citizenPage({Key? key}) : super(key: key);

  @override
  _VoterPageState createState() => _VoterPageState();
}

class _VoterPageState extends State<citizenPage> {
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
        isDeleted.add(false);
        if (futureCitizens[i].isVoted == 1) {
          isAuth[futureCitizens[i].id!.toInt()] = true;
        } else {
          isAuth[futureCitizens[i].id!.toInt()] = false;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "list of citizens",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: (isLoading == true)
            ? Center(
                child: Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[CircularProgressIndicator()])))
            : Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: futureCitizens.length,
                    itemBuilder: (ctx, index) {
                      if (!isDeleted[index]) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 150,
                              decoration: BoxDecoration(
                                  border: Border(
                                      left: BorderSide(
                                          color: Colors.blue, width: 5))),
                              child: Card(
                                color: Colors.grey[150],
                                elevation: 30,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                )),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.network(
                                        futureCitizens[index].image.toString(),
                                        height: 90,
                                        width: 90,
                                      ),
                                    ),
                                    SizedBox(width: 30),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  "${futureCitizens[index].name}",
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (ctx) =>
                                                                citizen_details()));
                                                  },
                                                  child: Icon(
                                                    Icons.info_outline_rounded,
                                                    color:
                                                        Colors.lightBlue[800],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 4),
                                        //TODO(Khalifa): Remove the .toString after changing the location to string.
                                        Text(
                                            "National ID :   ${futureCitizens[index].nationalID}",
                                            style: TextStyle(fontSize: 15)),
                                        SizedBox(height: 4),
                                        //TODO(Khalifa): Remove the .toString after changing the location to string.
                                        Text(
                                            "Location:   ${futureCitizens[index].location.toString()}",
                                            style: TextStyle(fontSize: 15)),
                                        SizedBox(height: 4),
                                        (futureCitizens[index].isVoted == 1)
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

                                        Row(
                                          children: [
                                            Text(
                                              "Allow to vote :",
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            Switch(
                                              value: isAuth[
                                                      futureCitizens[index]
                                                          .id] ??
                                                  false,
                                              activeColor: Colors.green,
                                              inactiveThumbColor: Colors.red,
                                              inactiveTrackColor: Colors.red,
                                              //TODO: Make the function async
                                              onChanged: (value) {
                                                print("Changed value: $value");
                                                setState(() {
                                                  isAuth[futureCitizens[index]
                                                      .id!] = value;
                                                  print(
                                                      "Map value after changing: ${isAuth[futureCitizens[index].id!]}");
                                                });
                                                /*
                                              var url = Uri.parse("TODO: PUT THE ENDPOINT FOR THE CITIZEN");
                                              int status;
                                              if(value == true) status = 1; else status = 0;
                                              await http.post(url, body: {"Status": "$status"});
                                            */
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return SizedBox(
                          height: 0,
                        );
                      }
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
