import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_auth_app/auth/email/email_pass_login.dart';
import 'package:social_auth_app/auth/mobile_no/mobile_signIn.dart';
import 'package:social_auth_app/auth/signup.dart';
import 'google/control_login.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Provider.of<ControllerLogin>(context, listen: false)
            .AllowUserToLogOutWithGoogle(context);
        return true;
      },
      child: ChangeNotifierProvider(
          create: (_) => ControllerLogin(),
          builder: (context, child) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign In',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          border: Border.all(
                        width: 2,
                        color: Colors.black,
                      )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset('assets/images/email-logo.png'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EmailPassLoginScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Sign in with email',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          border: Border.all(
                        width: 2,
                        color: Colors.black,
                      )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 30,
                            width: 30,
                            child: Image.asset('assets/images/google-logo.png'),
                          ),
                          TextButton(
                            onPressed: () async {
                              try {
                                await Provider.of<ControllerLogin>(context,
                                        listen: false)
                                    .AllowUserLoginWithGoogle(context);
                              } catch (error) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Error'),
                                      content: Text(
                                          'There was a problem. Please sign in again.'),
                                      actions: [
                                        TextButton(
                                          child: Text('Close'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                            child: Text(
                              'Sign in with Google',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          border: Border.all(
                        width: 2,
                        color: Colors.black,
                      )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 30,
                            width: 30,
                            child:
                                Image.asset('assets/images/facebook-logo.png'),
                          ),
                          TextButton(
                            onPressed: () async {
                              ScaffoldMessenger.of(context).showSnackBar(
                               const SnackBar(
                                  backgroundColor: Colors.cyan,
                                  content: Text(
                                    'Sorry this is currently not avaliable',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            },
                            child: Text(
                              'Sign in with Facebook',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          border: Border.all(
                        width: 2,
                        color: Colors.black,
                      )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 30,
                            width: 30,
                            child: Image.asset('assets/images/mobile-logo.png'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MobileSignInScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Sign in with Mobile Number',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('New here?'),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, a, b) => SignUp(),
                                  transitionDuration: Duration(seconds: 0),
                                ),
                              );
                            },
                            child: Text(
                              'Create an account',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            );
          }),
    );
  }
}
