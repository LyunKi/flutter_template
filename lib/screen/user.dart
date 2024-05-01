import 'dart:math';

import 'package:flutter/material.dart';

import '../models/user.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final List<User> _users = [];

  void _showAddUserDialog(BuildContext context) {
    String newUsername = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add User'),
          content: TextField(
            onChanged: (value) {
              newUsername = value;
            },
            decoration: const InputDecoration(labelText: 'Username'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (newUsername.isNotEmpty) {
                  setState(() {
                    _users.add(User(
                        id: Random().nextInt(10000).toString(),
                        name: newUsername));
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _showEditUserDialog(BuildContext context, User user) {
    String editedUsername = user.name;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit User'),
          content: TextField(
            onChanged: (value) {
              editedUsername = value;
            },
            controller: TextEditingController(text: user.name),
            decoration: const InputDecoration(labelText: 'Username'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (editedUsername.isNotEmpty) {
                  setState(() {
                    user = user.copyWith(name: editedUsername);
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _deleteUser(User user) {
    setState(() {
      _users.remove(user);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('User Management'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 150,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    label: const Text('新增用户'),
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      _showAddUserDialog(context);
                    },
                  ),
                ],
              ),
            ),
            DataTable(
              columns: const [
                DataColumn(label: Text('Username')),
                DataColumn(label: Text('Actions')),
              ],
              rows: _users.map((user) {
                return DataRow(cells: [
                  DataCell(Text(user.name)),
                  DataCell(Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          _showEditUserDialog(context, user);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          _deleteUser(user);
                        },
                      ),
                    ],
                  )),
                ]);
              }).toList(),
            ),
          ],
        ));
  }
}
