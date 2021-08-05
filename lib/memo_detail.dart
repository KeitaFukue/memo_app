import 'package:flutter/material.dart';

class MemoDetail extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'メモ入力しとけって'
        ),
      ),
      body: Center(
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Write something',
          ),
          maxLines: 3,
          minLines: 3,
        ),
      ),
    );
  }
  
}