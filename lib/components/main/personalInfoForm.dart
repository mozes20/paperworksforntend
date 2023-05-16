import 'package:flutter/material.dart';

import '../../model/fuggvenytest.dart';

class PersonalInfoForm extends StatefulWidget {
  @override
  _PersonalInfoFormState createState() => _PersonalInfoFormState();
}

class _PersonalInfoFormState extends State<PersonalInfoForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final fire = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'E-mail cím',
              hintText: 'example@example.com',
            ),
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Teljes név',
              hintText: 'Kovács János',
            ),
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _ageController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Életkor',
              hintText: '30',
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              final email = _emailController.text;
              final name = _nameController.text;
              final age = _ageController.text;
              var adat = fire.addUser(fullName: name, age: age , email: email);
              adat.then((value) => {
              _showDialog(context,value!)
              });
              _emailController.clear();
              _nameController.clear();
              _ageController.clear();
            },
            child: Text('Mentés'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  void _showDialog(BuildContext context,String message) {
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