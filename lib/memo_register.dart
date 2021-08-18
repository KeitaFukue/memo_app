import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MemoRegister extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '登録'
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: (){},
          ),
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: (){},
          )
        ],
      ),
      body: SafeArea(
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'title',
                ),
              ),
              Container(
                padding: EdgeInsets.only(top:20),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'memo',
                  ),
                  maxLines: null,
                  minLines: 5,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text('文字'),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
  
}