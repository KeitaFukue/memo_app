import 'package:flutter/material.dart';
import 'package:memo_app/memo_list_view_model.dart';
import 'package:provider/provider.dart';

import 'memo_detail.dart';

class MemoList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    //final vm = MemoListViewModel(MemoRepository(AppDatabase()))

    return ChangeNotifierProvider(
      create: (_) => MemoListViewModel(),
      child: Scaffold(
        appBar: AppBar(
          ///AppBarにTextFieldを設置することで，検索バーを作れる
          title: TextField(
            style: const TextStyle(
              color: Colors.white,
              backgroundColor: Colors.greenAccent
            ),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: Colors.white),
              hintText: 'タイトルを検索',
              hintStyle: const TextStyle(color: Colors.white)
            ),
            //onChanged: (value) => vm.search(value),
          ),
        ),
        backgroundColor: Color(0xffF2F2F2),
        body: ListView.builder(
          itemCount: 3 /*vm.memos.length*/,
          itemBuilder: (BuildContext context, int index){
            var memo = index /*vm.memo[index]*/;
            return Card(
              child: ListTile(
                leading: FlutterLogo(),
                title: Text('One-line with both widgets'),
                trailing: Icon(Icons.more_vert),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          // メモ登録画面に遷移する
          onPressed:() {
            Navigator.push(
                context,
                MaterialPageRoute(
                  settings: RouteSettings(name: '/ui.memo_detail'),
                  builder: (context) => MemoDetail(),
                ),
            );
          }
        ),
      ),
    );
  }
}
