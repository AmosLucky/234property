import 'package:dd_property/constatnts/assets.dart';
import 'package:dd_property/constatnts/dimentions.dart';
import 'package:dd_property/repos/user_repo.dart';
import 'package:dd_property/screens/homescreen.dart';
import 'package:dd_property/screens/mainscreen.dart';
import 'package:dd_property/screens/signin.dart';
import 'package:dd_property/screens/signup.dart';
import 'package:dd_property/widgets/opacitybg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constatnts/colors.dart';
import '../functions/navigate.dart';
import '../widgets/buttons.dart';
import '../widgets/text_input.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var _formKey = GlobalKey();
  var emailController = new TextEditingController();
  var passwordController = new TextEditingController();
  var usernameController = new TextEditingController();
  String msg = "";
  bool isLoding = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: OpacityBg(
              context,
              SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: Dimentions.getSize(context).height / 6.5),
                          //color: Colors.amber,
                          child: Image.asset(
                            GetAssts.getDarkLogo(),
                            width: Dimentions.getSize(context).width / 1.5,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 25,
                              color: MColors.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        textInput(
                          controller: usernameController,
                          labelText: "Username",
                          isPassword: false,
                          textInputType: TextInputType.text,
                          icon: Icons.person,
                        ),
                        textInput(
                          controller: emailController,
                          labelText: "Enter your email",
                          isPassword: false,
                          textInputType: TextInputType.emailAddress,
                          icon: Icons.email,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        textInput(
                          controller: passwordController,
                          labelText: "Enter your password",
                          isPassword: true,
                          textInputType: TextInputType.visiblePassword,
                          icon: Icons.lock,
                        ),
                        Visibility(
                            child: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            msg,
                            style: TextStyle(color: Colors.red),
                          ),
                        )),
                        Visibility(
                            visible: isLoding,
                            child: Container(
                                margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                                child: LinearProgressIndicator())),
                        SizedBox(
                          height: 25,
                        ),
                        roundButton(
                            context: context,
                            bgColor: MColors.primaryColor,
                            text: "Sign Up",
                            textColor: Colors.white,
                            onTap: () async {
                              var email = emailController.text;
                              var password = passwordController.text;
                              var username = usernameController.text;
                              setState(() {
                                isLoding = true;
                                msg = "";
                              });
                              msg = await UserRepo()
                                  .signUp(email, password, username);
                              print(msg);
                              if (msg == "success") {
                                NavigateLeftToRight(context, MainScreen());
                              }
                              isLoding = false;
                              setState(() {});
                            }),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            NavigateLeftToRight(context, SignIn());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account",
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Sign In",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 50,
                        )
                      ]),
                ),
              ))),
    );
  }
}
