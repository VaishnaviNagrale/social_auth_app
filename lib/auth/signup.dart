import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:social_auth_app/Auth/signin.dart';
import 'package:social_auth_app/auth/email/email_pass_signup.dart';
import 'package:social_auth_app/auth/mobile_no/mobile_signIn.dart';
import 'google/control_login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

final GoogleSignIn googleSignIn = GoogleSignIn();

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ControllerLogin(),
        builder: (context, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            body:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Create an account',
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
                            builder: (context) => EmailPassSignUp(),
                          ),
                        );
                      },
                      child: Text(
                        'Sign up with email',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
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
                      onPressed: () {
                        Provider.of<ControllerLogin>(context, listen: false)
                            .AllowUserLoginWithGoogle(context);
                      },
                      child: Text(
                        'Sign up with Google',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
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
                      child: Image.asset('assets/images/facebook-logo.png'),
                    ),
                    TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
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
                        'Sign up with Facebook',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
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
                                builder: (context) => MobileSignInScreen(),),);
                      },
                      child: Text(
                        'Sign up with Mobile Number',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
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
                    Text('Have an account?'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, a, b) => SignInScreen(),
                            transitionDuration: Duration(seconds: 0),
                          ),
                        );
                      },
                      child: Text(
                        'Sign In',
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          );
        });
  }
}
