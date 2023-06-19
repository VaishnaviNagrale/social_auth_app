import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_auth_app/auth/facebook/user_model_facebook.dart';
import '../google/control_login.dart';

class FacebookLoginScreen extends StatelessWidget {
  
  final UserDetailsModelFacebook userDetails;
const FacebookLoginScreen({required this.userDetails});
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
                    // Provider.of<ControllerLogin>(context, listen: false)
                    //           .AllowUserSignOutFB(context);
                  },
                ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
