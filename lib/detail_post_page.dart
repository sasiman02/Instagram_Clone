import 'package:flutter/material.dart';

class DetailPostPage extends StatelessWidget {
  final dynamic document;

  DetailPostPage(this.document);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('둘러보기'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(document.get('userPhotoUrl')),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        document.get('email'),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(document.get('displayName'))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Hero(
              tag: document.get('photoUrl'),
              child: Image.network(document.get('photoUrl'))),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(document.get('contents')),
          )
        ],
      ),
    ));
  }
}
