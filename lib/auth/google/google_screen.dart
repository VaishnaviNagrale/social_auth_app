import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_auth_app/user/dashbord.dart';
import 'control_login.dart';
import 'userdetails_model.dart';

class GoogleLoginUI extends StatelessWidget {
  final UserDetailsModelGoogle userDetails;

  const GoogleLoginUI({required this.userDetails});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ControllerLogin(),
        builder: (context, child) {
          return Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: Image.network(
                        userDetails.photoUrl ?? '',
                      ).image,
                      radius: 60,
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            userDetails.displyName ?? '',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            userDetails.email ?? '',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    ActionChip(
                      avatar: Padding(
                        padding: EdgeInsets.only(right: 5, left: 5),
                        child: Icon(
                          Icons.input,
                          color: Colors.white,
                        ),
                      ),
                      label: Text(
                        'Logout',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      backgroundColor: Colors.black,
                      onPressed: () {
                        Provider.of<ControllerLogin>(context, listen: false)
                            .AllowUserToLogOutWithGoogle(context);
                      },
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ActionChip(
                        avatar: Icon(
                          Icons.navigate_next,
                          color: Colors.black,
                        ),
                        label: Text(
                          'GO TO HomeScreen',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        backgroundColor: Colors.orange,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DashBoard()
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
