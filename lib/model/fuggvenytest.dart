import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:paperworks/model/users.dart';
import 'package:http/http.dart' as http;
import '../firebase_options.dart';

class DatabaseService {
  String url = "localhost:3000";

  Future<String?> addUser({
    required String fullName,
    required String age,
    required String email,
  }) async {
    try {
      final requrl = Uri.http(url, "User");
      final response = await http
          .post(requrl, body: {'name': fullName, 'age': age, 'email': email});

      print(response.statusCode);
      print(response.body);

      return response.body;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> updateUser({
    required String fullName,
    required String age,
    required String email,
  }) async {
    try {
      final requrl = Uri.http(url, "User");
      final response = await http
          .put(requrl, body: {'name': fullName, 'age': age, 'id': email});

      print(response.statusCode);
      print(response.body);

      return response.body;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> getUser(String email) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      final snapshot = await users.doc(email).get();
      final data = snapshot.data() as Map<String, dynamic>;
      return data['full_name'];
    } catch (e) {
      return 'Error fetching user';
    }
  }

  Future<List<User>> getUsers() async {
    List<User> users = [];

    final requrl = Uri.http("localhost:3000", "User");
    final response = await http.get(requrl);

    var user = response.body;
    var userObjsJson = jsonDecode(user)['data'] as List;
    List<User> userObjs =
        userObjsJson.map((tagJson) => User.fromJson(tagJson)).toList();
    return userObjs;
  }
}
