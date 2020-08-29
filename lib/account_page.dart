import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AccountPage extends StatefulWidget {
  final User user;

  AccountPage(this.user);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  int _postCount = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance.collection('post').where('email', isEqualTo: widget.user.email).get().then((snapShot) {
      setState(() {
        _postCount = snapShot.docs.length;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      actions: [
        IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            FirebaseAuth.instance.signOut();
            _googleSignIn.signOut();
          },
        )
      ],
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Stack(children: [
                SizedBox(
                  width: 80,
                  height: 80,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(widget.user.photoURL),
                  ),
                ),
                Container(
                  width: 80,
                  height: 80,
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    width: 25,
                    height: 25,
                    child: FloatingActionButton(
                      backgroundColor: Colors.blueAccent,
                      child: Icon(Icons.add),
                      onPressed: (){},
                    ),
                  ),
                )
              ]),
              Padding(padding: EdgeInsets.all(4.0)),
              Text(
                widget.user.displayName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )
            ],
          ),
          Padding(padding: EdgeInsets.all(18)),
          Text(
            '$_postCount\n게시물',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          Padding(padding: EdgeInsets.all(18)),
          Text(
            '0\n팔로워',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          Padding(padding: EdgeInsets.all(18)),
          Text(
            '0\n팔로잉',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
