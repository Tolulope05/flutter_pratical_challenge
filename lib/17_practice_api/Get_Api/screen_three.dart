import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Models/user_model.dart';

class ScreenThree extends StatefulWidget {
  const ScreenThree({Key? key}) : super(key: key);

  @override
  _ScreenThreeState createState() => _ScreenThreeState();
}

class _ScreenThreeState extends State<ScreenThree> {
  List<UserModel> userList = [];

  Future<List<UserModel>> getUserApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Complex-Api | Model with plugin'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserApi(),
              builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                      itemCount: userList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                ReusableRow(
                                  title: 'Name',
                                  value: snapshot.data![index].name.toString(),
                                ),
                                ReusableRow(
                                  title: 'UserName',
                                  value:
                                      snapshot.data![index].username.toString(),
                                ),
                                ReusableRow(
                                  title: 'Email',
                                  value: snapshot.data![index].email.toString(),
                                ),
                                ReusableRow(
                                  title: 'city',
                                  value: snapshot.data![index].address!.city
                                      .toString(),
                                ),
                                ReusableRow(
                                  title: 'Street',
                                  value: snapshot.data![index].address!.street
                                      .toString(),
                                ),
                                ReusableRow(
                                  title: 'Suite',
                                  value: snapshot.data![index].address!.suite
                                      .toString(),
                                ),
                                ReusableRow(
                                  title: 'ZipCode',
                                  value: snapshot.data![index].address!.zipcode
                                      .toString(),
                                ),
                                ReusableRow(
                                  title: 'Latitude',
                                  value: snapshot.data![index].address!.geo!.lat
                                      .toString(),
                                ),
                                ReusableRow(
                                  title: 'Longitude',
                                  value: snapshot.data![index].address!.geo!.lng
                                      .toString(),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
