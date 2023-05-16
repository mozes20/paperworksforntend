import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:collection/collection.dart'; // hozzáadtuk az extension csomagot

import '../../model/fuggvenytest.dart';
import '../../model/users.dart';

class DynamicDropdownWidget extends StatefulWidget {
  @override
  _DynamicDropdownWidgetState createState() => _DynamicDropdownWidgetState();
}

class _DynamicDropdownWidgetState extends State<DynamicDropdownWidget> {
  String? _selectedValue;
  List<String> _dropdownValues = [""];
  List<User> ListOfUsers = [];
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  final fire = DatabaseService();
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() async {
    final data = await fire.getUsers();
    List<String> list = [];
    data.forEach(
      (element) {
        list.add(element.id);
      },
    );

    setState(() {
      _dropdownValues = list;
      ListOfUsers.addAll(data);
      _selectedValue = (list.isNotEmpty ? list.first : null)!;
      print(ListOfUsers);
    });
    print(ListOfUsers);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Dropdown'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              value: _selectedValue,
              items: _dropdownValues.map((value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedValue = value!;
                  User foundUser = ListOfUsers.firstWhere(
                      (person) => person.id == _selectedValue);

                  print(ListOfUsers);
                  print(_selectedValue);
                  _fullNameController.text = foundUser.fullName;
                  _ageController.text = foundUser.age;
                });
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _fullNameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _ageController,
              decoration: InputDecoration(
                labelText: 'Age',
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final name = _fullNameController.text;
                final age = _ageController.text;
                var adat = fire.updateUser(
                    fullName: name, age: age, email: _selectedValue!);
                adat.then((value) => {_showDialog(context, value!)});
                //_fullNameController.clear();
                //_ageController.clear();
              },
              child: Text('Mentés'),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Üzenet'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Bezárás'),
            ),
          ],
        );
      },
    );
  }
}
