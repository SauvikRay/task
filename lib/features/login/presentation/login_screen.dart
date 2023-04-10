import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:softic_task/helpers/keyboard_hide.dart';

import '../../../helpers/theme_helper.dart';
import '../../../widgets/login_header.dart';
import '../data/login_functions.dart';



class LoginScreen extends StatefulWidget{
  const LoginScreen({Key? key}): super(key:key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
  double _headerHeight = 250;
  Key _formKey = GlobalKey<FormState>();
  TextEditingController userController =TextEditingController();
  TextEditingController passwordController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true, Icons.login), //let's create a common header widget
            ),
            SafeArea(
              child: Container( 
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),// This will be the login form
                child: Column(
                  children: [
                    const Text(
                      'SIGN IN',
                      style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Signin into your account',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 30.0),
                    Form(
                      key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              child: TextField(
                                decoration: ThemeHelper().textInputDecoration('User Name', 'Enter your user name'),
                                controller: userController,
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            Container(
                              decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              child: TextField(
                                obscureText: true,
                                decoration: ThemeHelper().textInputDecoration('Password', 'Enter your password'),
                                controller: passwordController,
                              ),
                            ),
                            const SizedBox(height: 15.0),
                            Container(
                              margin: const EdgeInsets.fromLTRB(10,0,10,20),
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                onTap: () {
                                  
                                },
                                child: const Text( "Forgot your password?", style: TextStyle( color: Colors.grey, ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: ThemeHelper().buttonBoxDecoration(context),
                              child: ElevatedButton(
                                style: ThemeHelper().buttonStyle(),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                  child: Text('Sign In'.toUpperCase(), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                                ),
                                onPressed: (){
                                FocusManager.instance.primaryFocus!.unfocus();
                                  //After successful login we will redirect to profile page. Let's create profile page now
                                    EasyLoading.show();
                                   onpressedSignin(context: context,userName: userController.text,password: passwordController.text,rememberMe: true);
                                 
                                },
                              ),
                            ),
                            // Container(
                            //   margin: const EdgeInsets.fromLTRB(10,20,10,20),
                            //   //child: Text('Don\'t have an account? Create'),
                            //   child: Text.rich(
                            //     TextSpan(
                            //       children: [
                            //         const TextSpan(text: "Don\'t have an account? "),
                            //         TextSpan(
                            //           text: 'Create',
                            //           recognizer: TapGestureRecognizer()
                            //             ..onTap = (){
                            //               Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                            //             },
                            //           style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.secondary),
                            //         ),
                            //       ]
                            //     )
                            //   ),
                            // ),
                          ],
                        )
                    ),
                  ],
                )
              ),
            ),
          ],
        ),
      ),
    );

  }
}