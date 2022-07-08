import 'package:flutter/material.dart';
import 'package:yes/utils/routes.dart';

// ignore: use_key_in_widget_constructors
class Loginpage extends StatefulWidget {
  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String name = "";
  // ignore: non_constant_identifier_names
  bool ChangeButton = false;
  // ignore: non_constant_identifier_names
  final _Formkey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_Formkey.currentState!.validate()) {
      setState(() {
        ChangeButton = true;
      });
      // ignore: prefer_const_constructors
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeroute);

      setState(() {
        ChangeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _Formkey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/1.png",
                  height: 200,
                  width: 150,
                  fit: BoxFit.cover,
                ),
                Text(
                  "welcome $name",
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  ),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 30.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                            hintText: "Enter the username",
                            labelText: "username"),
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username canoot be empty";
                          }
                          return null;
                        },
                      ),

                      TextFormField(
                        obscureText: true,
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                            hintText: "Enter the password",
                            labelText: "password"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please input password";
                          } else if (value.length < 6) {
                            return "password length should be atleast 6";
                          }
                          return null;
                        },
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(
                        height: 40.0,
                      ),
                      Material(
                        color: Colors.deepPurple,
                        borderRadius:
                            BorderRadius.circular(ChangeButton ? 50 : 10),
                        child: InkWell(
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            // ignore: prefer_const_constructors
                            duration: Duration(seconds: 1),
                            width: ChangeButton ? 50 : 150,
                            height: 40,

                            alignment: Alignment.center,
                            // ignore: prefer_const_constructors
                            child: ChangeButton
                                // ignore: prefer_const_constructors
                                ? Icon(
                                    Icons.done,
                                    color: Colors.amber,
                                  )
                                // ignore: prefer_const_constructors
                                : Text("login",
                                    // ignore: prefer_const_constructors
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    )),
                            // ignore: prefer_const_constructors
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    throw UnimplementedError();
  }
}
