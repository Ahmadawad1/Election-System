import 'dart:convert';
import 'package:elections_app/candidate_reg(g).dart';
import 'package:elections_app/citizens_Details(d).dart';
import 'package:elections_app/Models/candidate.dart';
import 'package:elections_app/government(g).dart';
import 'package:elections_app/voterpage(v).dart';
import 'package:elections_app/candidate_details(v).dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class reg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Registration';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
          backgroundColor: Colors.red,
        ),
        body: const MyCustomForm(),
      ),
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
              child: TextFormField(
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Location';
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Location',
                ),
              ),
              
            ),
            SizedBox(
                width: 20,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:<Widget> [
                 Padding(
                   padding: EdgeInsets.only(right: 10,bottom: 10),
                   child: ElevatedButton( 
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shadowColor: Colors.black,
                      elevation: 10,
                      textStyle: TextStyle(fontSize: 16, color: Colors.black26)),
                onPressed: () {  },
                child: Text("Save",)),
               
                 ) 
              ], ),
            )
            ]),
        ],
        
      ),
      
    );
  
  }
}
