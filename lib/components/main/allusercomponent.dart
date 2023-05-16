import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:paperworks/model/users.dart';

import '../../model/fuggvenytest.dart';

class AllUserComponent extends StatefulWidget {
  const AllUserComponent({super.key});

  @override
  State<AllUserComponent> createState() => _AllUserComponentState();
}

class _AllUserComponentState extends State<AllUserComponent> {
  var fire = DatabaseService();
  List<User> users = [];

  Future<List<User>> _getListData() async {
    // itt lekérjük az adatokat valahonnan, majd visszaadjuk az eredményt egy List<String>-ként
    return Future.delayed(Duration(seconds: 1), () {
      return fire.getUsers();
    });
  }

  @override
  void initState() {
    super.initState();
  }

  void getAllUser() async {
    await fire.getUsers().then((value) => users.addAll(value));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getListData(),
      builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(snapshot.data![index].id),
                    Text(snapshot.data![index].fullName),
                    Text(snapshot.data![index].age),
                  ],
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Hiba történt: ${snapshot.error}"),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
