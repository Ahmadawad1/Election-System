import 'package:flutter/material.dart';
import '../src/get_candidates.dart';
import '../src/Widget/bezierContainer.dart';
import 'package:http/http.dart';

enum ResponseType { Success, NotFoundEmail, IncorrectPassword }

class GlobalValues {
  static String? userAdmin;

  static void setLoginStatus(String val) {
    userAdmin = val;
  }

  static String? getLoginStatus() {
    return userAdmin;
  }
}

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String errorMsg = '';
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _passField() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Password',
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _errorMsg() {
    return Container(
        child: Column(children: [
      Text(('$errorMsg'), style: TextStyle(color: Colors.red))
    ]));
  }

  void changeVariableOnUI(String value) {
    setState(() => errorMsg = value);
  }

  Widget _emailField() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          TextField(
              controller: emailController,
              obscureText: false,
              decoration: InputDecoration(
                  hintText: 'Admin Email',
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Future<void> makePostRequest() async {
    var urlPrefix =
        'https://electionsystembackend.azurewebsites.net/Auth/AdminLogin?email=' +
            emailController.text +
            '&password=' +
            passwordController.text;
    Map<String, String> headers = {
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'GET, POST, DELETE, OPTIONS',
      'Access-Control-Allow-Headers': '*',
    };
    final url = Uri.parse('$urlPrefix');
    Response response = await post(url, headers: headers);
    switch (response.body) {
      case "0":
        {
          changeVariableOnUI('Not Found Email');
          break;
        }
      case "1":
        {
          changeVariableOnUI('Incorrect Password');
          break;
        }
      case "2":
        {
          GlobalValues.setLoginStatus(emailController.text);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => GetCandids()));
          break;
        }
      case "4":
        {
          changeVariableOnUI('Something Went Wrong');
          break;
        }
    }
  }

  Widget _submitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          makePostRequest();
        },
        child: Text(
          'Confirm',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Admin ',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Color(0xff81d4fa)),
          children: [
            TextSpan(
              text: 'Login',
              style: TextStyle(color: Color(0xff81d4fa), fontSize: 30),
            ),
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _emailField(),
        _passField(),
        _errorMsg(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    _title(),
                    SizedBox(
                      height: 50,
                    ),
                    _emailPasswordWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    _submitButton(),
                    SizedBox(height: height * .14),
                  ],
                ),
              ),
            ),
            Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      ),
    );
  }
}
