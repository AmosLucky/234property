import 'package:dd_property/constatnts/assets.dart';
import 'package:dd_property/constatnts/dimentions.dart';
import 'package:dd_property/repos/user_repo.dart';
import 'package:dd_property/screens/mainscreen.dart';
import 'package:dd_property/screens/signup.dart';
import 'package:dd_property/widgets/opacitybg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constatnts/colors.dart';
import '../functions/navigate.dart';
import '../widgets/bottons.dart';
import '../widgets/text_input.dart';
import 'homescreen.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  var _formKey = GlobalKey();
  var emailController = new TextEditingController();
  var passwordController = new TextEditingController();
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
                          "Sign In",
                          style: TextStyle(
                              fontSize: 25,
                              color: MColors.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
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
                                margin: EdgeInsets.only(
                                    top: 10, right: 20, left: 20),
                                child: LinearProgressIndicator())),
                        SizedBox(
                          height: 25,
                        ),
                        roundBotton(
                            context: context,
                            bgColor: MColors.primaryColor,
                            text: "Sign In",
                            textColor: Colors.white,
                            onTap: () async {
                              var email = emailController.text;
                              var password = passwordController.text;
                              msg = "";
                              setState(() {});
                              isLoding = true;
                              msg = await UserRepo().signin(email, password);
                              print(msg);
                              if (msg == "success") {
                                isLoding = false;
                                NavigateLeftToRight(context, MainScreen());
                              }
                              isLoding = false;
                              setState(() {});
                            }),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forget Password?",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            NavigateLeftToRight(context, SignUp());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Dont have an account",
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Sign Up",
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
