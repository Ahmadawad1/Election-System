import 'dart:convert';
import 'package:elections_app/Models/candidates.dart';
import 'package:elections_app/citizens_Details(d).dart';
import 'package:elections_app/Models/citiezens.dart';
import 'package:elections_app/candidate_details(v).dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VoterPage extends StatelessWidget {
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
  List<Candidate> futureCandidates = [];
  bool? isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    fetchCandidates();
  }

  fetchCandidates() async {
    var url = Uri.parse(
        "https://electionsystembackend.azurewebsites.net/candids/AllCandids");
    try {
      var response = await http.get(
        url,
        headers: {
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept",
        },
      );
      var parsedResponse = jsonDecode(response.body);
      List<Candidate> candidates = [];
      int counter = 0;
      parsedResponse.forEach((candidate) {
        candidates.add(Candidate.fromJson(candidate));
      });
      setState(() {
        isLoading = false;
        futureCandidates = candidates;
      });
    } catch (e, st) {
      print("Error: $e");
      print("Stacktrace: $st");
    }
  }

  @override
  Widget build(BuildContext context) {
    return (isLoading == true)
        ? CircularProgressIndicator()
        : ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: futureCandidates.length,
            itemBuilder: (context, index) {
              Candidate candidate = futureCandidates[index];
              return Container(
                child: Card(
                  elevation: 10.0,
                  color: Colors.grey[100],
                  child: ListTile(
                    contentPadding: EdgeInsets.all(15),
                    title: Center(
                      child: Row(
                        children: [
                          Text(
                            candidate.name!,
                            style: TextStyle(fontSize: 22),
                            overflow: TextOverflow.ellipsis,
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
                                      CandidateDetails(candidate: candidate),
                                ),
                              );
                            },
                            child: Icon(
                              Icons.info_outline_rounded,
                              size: 20,
                              color: Colors.lightBlue[800],
                            ),
                          )
                        ],
                      ),
                    ),
                    subtitle: Text(
                      candidate.location!.toString(),
                      style:
                          TextStyle(color: Colors.blueGrey[700], fontSize: 12),
                    ),
                    leading: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.network(
                            candidate.image!,
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ],
                    ),
                    trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        shadowColor: Colors.black,
                        elevation: 10,
                        textStyle:
                            TextStyle(fontSize: 16, color: Colors.black26),
                      ),
                      child: Text(
                        "VOTE",
                      ),
                      onLongPress: null,
                      onPressed: () async {
                        var url = Uri.parse(
                            "https://electionsystembackend.azurewebsites.net/voters/ChangeStatus?status=0&nationalID=9991043225");
                        await http.post(url, body: {"IsVoted": "1"});
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                titlePadding: EdgeInsets.only(top: 15),
                                title: Center(
                                  child: Icon(
                                    Icons.check_circle_outline_rounded,
                                    color: Colors.green[800],
                                    size: 100,
                                  ),
                                ),
                                content: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 120,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "You Voted for ",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            candidate.name!,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.red[900]),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              color: Colors.green,
                                              width: 40,
                                              height: 20,
                                              child: Center(
                                                child: Text(
                                                  "Okay",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                    ),
                  ),
                ),
              );
            },
          );
  }
}
