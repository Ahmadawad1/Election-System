import 'dart:convert';
import 'package:elections_app/update_candidates.dart';
import 'Models/candidates.dart';
import 'package:elections_app/Models/candidates.dart';
import 'package:elections_app/candidate_details(v).dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetCandids extends StatefulWidget {
  const GetCandids({Key? key}) : super(key: key);

  @override
  _GetCandidsState createState() => _GetCandidsState();
}

class _GetCandidsState extends State<GetCandids> {
  List<Candidate> futureCandidates = [];
  bool? isLoading;
  Map<int, bool> isDeleted = new Map();

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
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'GET, POST, DELETE, OPTIONS',
          'Access-Control-Allow-Headers': '*',
        },
      );
      var parsedResponse = jsonDecode(response.body);
      List<Candidate> candidates = [];
      int counter = 0;
      parsedResponse.forEach((candidate) {
        candidates.add(Candidate.fromJson(candidate));
        setState(() {
          isDeleted[candidates[counter++].id!] = false;
        });
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
              if (!isDeleted[candidate.id]!) {
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
                        style: TextStyle(
                            color: Colors.blueGrey[700], fontSize: 12),
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
                      trailing: Row(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              shadowColor: Colors.black,
                              elevation: 10,
                              textStyle: TextStyle(
                                  fontSize: 16, color: Colors.black26),
                            ),
                            child: Text(
                              "EDIT",
                            ),
                            onLongPress: null,
                            onPressed: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) =>
                                      UpdateCandid(candidate: candidate),
                                ),
                              );
                            },
                          ),
                          SizedBox(width: 10),
                          InkWell(
                            child: Text(
                              "X",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                              ),
                            ),
                            onTap: () async {
                              //TODO: Fill the delete url
                              var url = Uri.parse("PUT URL HERE INSIDE QUTOES"); 
                              var response = await http.post(url);
                              setState((){
                                isDeleted[candidate.id!] = true;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }else{
                return SizedBox(width: 0, height: 0);
              }
            },
          );
  }
}
