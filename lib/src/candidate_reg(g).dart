import 'dart:convert';
import 'package:elections_app/src/candidate_reg(g).dart';
import 'package:elections_app/src/citizens_Details(d).dart';
import '../Models/citiezens.dart';
import 'package:elections_app/src/government(g).dart';
import 'package:elections_app/src/voterpage(v).dart';
import 'package:elections_app/src/candidate_details(v).dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterCandid extends StatefulWidget {
  @override
  State<RegisterCandid> createState() => _RegisterCandidState();
}

class _RegisterCandidState extends State<RegisterCandid> {
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Registration';

    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
        backgroundColor: Colors.red,
      ),
      body: const MyCustomForm(),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  List<TextEditingController> textControllers = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 9; i++) {
      TextEditingController controller = TextEditingController();
      textControllers.add(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Full Name';
                }
              },
              controller: textControllers[0],
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: TextFormField(
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter National ID';
                }
              },
              controller: textControllers[1],
              maxLength: 10,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'National ID',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Email';
                }
              },
              controller: textControllers[2],
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(children: [
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.number,
                maxLength: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Age';
                  }
                },
                controller: textControllers[3],
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Age',
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            //---------------------------------------------------------------------------------
            Expanded(
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Gender';
                  }
                },
                controller: textControllers[4],
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Gender',
                ),
              ),
            )
          ]),
          SizedBox(
            height: 10,
          ),
          //---------------------------------------------------------------------------------
          Row(children: [
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Nationality';
                  }
                },
                controller: textControllers[5],
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nationality',
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            //--------------------------------------------------------------------------------
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.none,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Bio';
                  }
                },
                controller: textControllers[6],
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Bio',
                ),
              ),
            )
          ]),
          SizedBox(
            height: 10,
          ),
          Row(children: [
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Location';
                  }
                },
                controller: textControllers[7],
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Location',
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            //--------------------------------------------------------------------------------
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.none,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Status';
                  }
                },
                controller: textControllers[8],
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Status',
                ),
              ),
            )
          ]),
          SizedBox(
            height: 10,
          ),
          Row(children: [
            Expanded(
              child: InkWell(
                child: Container(
                  width: 200,
                  height: 50,
                  color: Colors.blue,
                  child: Center(child: Text("Upload image")),
                ),
                onTap: () {
                  //TODO: Upload images
                },
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 10, bottom: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          shadowColor: Colors.black,
                          elevation: 10,
                          textStyle:
                              TextStyle(fontSize: 16, color: Colors.black26)),
                      onPressed: () async {
                        try {
                          var url = Uri.parse(
                            "https://electionsystembackend.azurewebsites.net/candids/AddCandid",
                          );
                          await http.post(url, body: {
                            "Name": textControllers[0].text,
                            "Email": textControllers[2].text,
                            "NationalID": textControllers[1].text,
                            "Location": textControllers[7].text,
                            "Nationality": textControllers[5].text,
                            "Gender": textControllers[4].text,
                            "Status": textControllers[8].text,
                            "Age": textControllers[3].text,
                            "Bio": textControllers[6].text,
                          });
                        } catch (e) {
                          print("Error: $e");
                        } finally {
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        "Save",
                      ),
                    ),
                  )
                ],
              ),
            )
          ]),
        ],
      ),
    );
  }
}
