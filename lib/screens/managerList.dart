import 'package:flutter/material.dart';
import 'package:flutter_app/manager/manager_list_detail.dart';
import 'package:flutter_app/manager/manager_info.dart';

// *ManagerList Page: NavigationBar 2번째 페이지*

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: walkerlist.length,
          itemBuilder: (context, index) {
            Walker walker = walkerlist[index];
            return Card(
              //                                              리스트 타일
              child: ListTile(
                title: Text(walker.title), //                  매니저 프로필 title
                subtitle: Text(walker.year.toString()),
                leading: Image.asset(walker.imageUrl), //      사진
                trailing: Icon(Icons.arrow_forward_rounded), //화살표
                //                                             매니저 상세페이지 이동 Navigator
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WalkerDetailPage(walker)));
                },
              ),
            );
          }),
    );
  }
}
