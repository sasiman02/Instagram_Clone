import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final User user;

  HomePage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildeBody(),
      appBar: AppBar(
        title: Text(
          'Hyunstagram',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildeBody() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Text(
                  'Hyunstargram에 오신 것을 환영합니다.',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text('사진과 동영상을 보려면 팔로우하세요'),
                SizedBox(
                  width: 260,
                  child: Card(
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.all(4.0)),
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: CircleAvatar(
                              backgroundImage: NetworkImage(user.photoURL)),
                        ),
                        Text(
                          user.email,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(user.displayName),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: 70,
                                height: 70,
                                child: Image.network(
                                    'https://image.dongascience.com/Photo/2017/10/15076010680571.jpg')),
                            Padding(padding: EdgeInsets.all(1.0)),
                            SizedBox(
                                width: 70,
                                height: 70,
                                child: Image.network(
                                    'https://image.dongascience.com/Photo/2017/10/15076010680571.jpg')),
                            Padding(padding: EdgeInsets.all(1.0)),
                            SizedBox(
                                width: 70,
                                height: 70,
                                child: Image.network(
                                    'https://image.dongascience.com/Photo/2017/10/15076010680571.jpg')),
                            Padding(padding: EdgeInsets.all(1.0)),
                          ],
                        ),
                        Text('Facebook 친구'),
                        Padding(padding: EdgeInsets.all(4.0)),
                        RaisedButton(
                          child: Text(
                            '팔로우',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {},
                          color: Colors.blueAccent,
                        ),
                        Padding(padding: EdgeInsets.all(4.0)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
