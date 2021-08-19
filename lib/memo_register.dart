import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MemoRegister extends StatelessWidget{
  String titleText = '';
  String memoText = '';

  Future<void> insertDB(tableName) async{
    final db = await openDatabase(
        join(await getDatabasesPath(), 'memo.db'),
        version: 1,
        onCreate: (db, version){
          return db.execute(''
              'CREATE TABLE memo(title TEXT, memo TEXT)'
          );
        }
    );
    final value = <String, String>{
      'title': titleText,
      'memo': memoText,
    };

    db.insert(tableName, value);
  }


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
              onPressed: ()async{
                await insertDB('memo');
                Navigator.pop(context);
              },
          ),
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
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