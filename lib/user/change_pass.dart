import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_auth_app/auth/email/email_pass_login.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();
  String newPassword = '';
  final newPassController = TextEditingController();
  final currentUser = FirebaseAuth.instance.currentUser;

  ChangePassword() async {
    try {
      await currentUser!.updatePassword(newPassword);
      FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => EmailPassLoginScreen(),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.black45,
        content: Text('Your password hase been chnaged please Login again'),
      ));
    } on FirebaseAuthException catch (error) {
      print(error);
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text('Something went wrong'),
      ));
    }
  }

  @override
  void dispose() {
    newPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Image.asset('assets/images/change.jpg'),
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'New Password',
                    hintText: 'Enter new password',
                    labelStyle: TextStyle(
                      fontSize: 20.0,
                    ),
                    border: OutlineInputBorder(),
                    errorStyle: TextStyle(
                      color: Colors.black54,
                      fontSize: 15.0,
                    ),
                  ),
                  controller: newPassController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter password';
                    }
                    return null;
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        newPassword = newPassController.text;
                      });
                      ChangePassword();
                    }
                  },
                  child: Text(
                    'Change password',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
