import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageUrl = "https://qph.fs.quoracdn.net/main-thumb-10123010-200-nicepllmsetpwafnmcueyhkynfldgbcu.jpeg";
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                accountName: Text("Bhupendra Pandey"),
                accountEmail: Text("bprincepandey@gmail.com"),
                // currentAccountPicture: Image.network(imageUrl),
                currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage(imageUrl),),
              )
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
              ),
              title: Text("Home")
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
              ),
              title: Text("Profile")
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.power,
              ),
              title: Text("Logout")
            ),
          ],
        ),
      ),
    );
  }
}