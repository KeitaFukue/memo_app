import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'memo_register.dart';

class MemoList extends StatefulWidget{

  @override
  _MemoListState createState() => _MemoListState();
}

class _MemoListState extends State<MemoList> {
  Future<List> queryDB(tableName) async {//必ずopenDatabaseをしてDatabaseインスタンスを作る。そのインスタンスでqueryなどをする
    final db = await openDatabase(
        join(await getDatabasesPath(), 'memo.db'),
        version: 1,
        onCreate: (db, version){
          return db.execute(''
              'CREATE TABLE memo(title TEXT, memo TEXT)'
          );
        }
    );

    final table = await db.query(tableName);//dbがDatabaseでなくfutureだとエラーがでる
    return table;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        ///AppBarにTextFieldを設置することで，検索バーを作れる
        title: Text(
          'メモ一覧'
        )
      ),
      backgroundColor: Color(0xffF2F2F2),
      body: FutureBuilder(
          future:queryDB('memo'),
          builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,//db.query('memo').length /*vm.memos.length*/
                itemBuilder: (BuildContext context, int index){
                  return Card(
                      child: ListTile(
                        leading: FlutterLogo(),
                        title: Text('One-line with both widgets'),
                        trailing: Icon(Icons.more_vert),
                      )
                  );
                },
              );
            }else{
              return Center(
                  child: CircularProgressIndicator()
              );
            }
            },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        // メモ登録画面に遷移する
        onPressed:() async{
          await Navigator.push(
              context,
              MaterialPageRoute(
                settings: RouteSettings(name: '/ui.memo_detail'),
                builder: (context) => MemoRegister(),
              ),
          );
          //TODO:ここでsetState()すればいい説
          setState((){});
        }
      ),
    );
  }
}
