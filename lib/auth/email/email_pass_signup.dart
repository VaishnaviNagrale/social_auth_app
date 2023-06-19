import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_auth_app/Auth/signin.dart';
import 'package:social_auth_app/auth/email/email_pass_login.dart';

class EmailPassSignUp extends StatefulWidget {
  const EmailPassSignUp({Key? key}) : super(key: key);

  @override
  State<EmailPassSignUp> createState() => _EmailPassSignUpState();
}

class _EmailPassSignUpState extends State<EmailPassSignUp> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String confromPass = '';

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    conformpassController.dispose();
    super.dispose();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conformpassController = TextEditingController();

  Registration() async {
    if (password == confromPass) {
      try {
        UserCredential userCredentials = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        print(userCredentials);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.blueGrey,
            content: Text(
              'Registration Successfully, Please Sign In',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EmailPassLoginScreen(),
          ),
        );
      } on FirebaseAuthException catch (error) {
        if (error.code == 'weak-password') {
          print('Password is too weak');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.black26,
              content: Text(
                'Password is too weak',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.amberAccent,
                ),
              ),
            ),
          );
        } else if (error.code == 'email-already-in-use') {
          print('Account is already exits');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.black26,
              content: Text(
                'Account is already exits',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.amber,
                ),
              ),
            ),
          );
        } else {
          print('Password and Conform Password does not matched');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.black26,
              content: Text(
                'Password and Conform Password does not matched',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.red,
                ),
              ),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 64, horizontal: 20),
          child: ListView(children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage('assets/images/signup.png'),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                autofocus: false,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(fontSize: 15),
                  border: OutlineInputBorder(),
                  errorStyle: TextStyle(color: Colors.black54, fontSize: 15),
                ),
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter email';
                  } else if (!value.contains('@')) {
                    return "please enter 'Valid Email'";
                  }
                  return null;
                },
                onSaved: (value) {
                  email = value!;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: TextFormField(
                autofocus: false,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Password (8+ characters)',
                  labelStyle: TextStyle(fontSize: 20),
                  border: OutlineInputBorder(),
                  errorStyle: TextStyle(color: Colors.black54, fontSize: 15),
                ),
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter password';
                  }
                  return null;
                },
                onSaved: (value) {
                  password = value!;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                autofocus: false,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Conform Password',
                  hintText: 'Password (8+ characters)',
                  labelStyle: TextStyle(fontSize: 15),
                  border: OutlineInputBorder(),
                  errorStyle: TextStyle(color: Colors.black54, fontSize: 15),
                ),
                controller: conformpassController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter password again';
                  }
                  return null;
                },
                onSaved: (value) {
                  confromPass = value!;
                },
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        setState(() {
                          email = emailController.text;
                          password = passwordController.text;
                          confromPass = conformpassController.text;
                        });
                        Registration();
                      }
                    },
                    child: const Text(
                      'SignUp',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                ],
              ),
            ),
            Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account ?'),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation1, animation2) =>
                                        SignInScreen(),
                                        transitionDuration: Duration(seconds: 0),
                              ),
                            );
                          },
                          child: Text('Login'),
                        ),
                      ],
                    ),
                  ),
          ],),
        ),
      ),
    );
  }
}
