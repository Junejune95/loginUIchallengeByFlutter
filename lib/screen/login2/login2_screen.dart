import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loginUIchallenge/screen/list/list_screen.dart';

class Login2 extends StatefulWidget {
  @override
  _Login2State createState() => _Login2State();
}

class _Login2State extends State<Login2> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  final _lowColor = Colors.grey[400]; // use your own colors
  final _highColor = Colors.blueGrey;

  Color _field1Color = Colors.grey[400];
  Color _field2Color = Colors.grey[400];

  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  height: size.height * 0.35,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        _buildHeaderRow(),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              _buildEmailTextForm(),
                              SizedBox(
                                height: 20,
                              ),
                              _buildPasswordTextForm(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal: 50, vertical: 14)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blueGrey),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                          side: BorderSide(color: Colors.blueGrey),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => ListScreen()),
                        );
                      }
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 100,
            child: Container(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login with',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    iconSize: 40,
                    icon: Icon(
                      FontAwesomeIcons.facebook,
                      color: Colors.blue,
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    iconSize: 40,
                    icon: Icon(
                      FontAwesomeIcons.googlePlusSquare,
                      color: Colors.redAccent,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  //Focus widget use for change when text form filed foucs
  //when foucs change color
  Focus _buildPasswordTextForm() {
    return Focus(
      onFocusChange: (hasFocus) {
        setState(() => _field2Color = hasFocus ? _highColor : _lowColor);
      },
      child: TextFormField(
        obscureText: true,
        validator: (value) {
          _password = value;
          // should contain at least one digit
          final RegExp digit = RegExp(r"^(?=.*?[0-9])");
          if (value == null || value.isEmpty) {
            return 'Please Enter Your Password!';
          } else if (!digit.hasMatch(value)) {
            return 'Should contain at least one digit!';
          } else if (value.length < 6) {
            return 'Should contain at least 5 characters!';
          }
          return null;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black12,
            ),
          ),
          prefixIcon: Icon(
            Icons.visibility_off_outlined,
            color: _field2Color,
          ),
          labelText: 'Password',
          labelStyle: TextStyle(
            color: _field2Color,
            fontSize: 18,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: Colors.blueGrey),
          ),
        ),
      ),
    );
  }

  Focus _buildEmailTextForm() {
    return Focus(
      onFocusChange: (hasFocus) {
        setState(() => _field1Color = hasFocus ? _highColor : _lowColor);
      },
      child: TextFormField(
        validator: (value) {
          _email = value;
          if (value == null || value.isEmpty) {
            return 'Please Enter Your Email!';
          } else if (!value.contains('@')) {
            //check email format
            return 'Please Enter Valid Email!';
          }
          return null;
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.email_outlined,
            color: _field1Color,
          ),
          labelText: 'Email',
          labelStyle: TextStyle(
            color: _field1Color,
            fontSize: 18,
          ),
          border: UnderlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black12,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: Colors.blueGrey),
          ),
        ),
      ),
    );
  }

  Row _buildHeaderRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Login',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.blueGrey,
          ),
        ),
        Text(
          'Sign Up',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.grey[600],
          ),
        )
      ],
    );
  }
}
