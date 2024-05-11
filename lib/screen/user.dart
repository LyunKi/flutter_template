import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/models/common.dart';
import 'package:flutter_template/common/utils/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/user.dart';

part 'user.g.dart';

@riverpod
class UserListState extends _$UserListState {
  @override
  Future<List<User>> build() async {
    return _fetchUserList();
  }

  Future<List<User>> _fetchUserList() async {
    try {
      final response = await api.get('/demo/users?page=1');
      final userListJson = response.data;
      print("userListJson, $userListJson");
      final result =
          Paginated<User>.fromJson(userListJson, (json) => User.fromJson(json));
      return result.items;
    } catch (e) {
      print("e, $e");
      return [];
    }
  }
}

class UserScreen extends ConsumerStatefulWidget {
  const UserScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserScreenState();
}

class _UserScreenState extends ConsumerState<UserScreen> {
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

  void _deleteUser(User user) {}

  @override
  Widget build(BuildContext context) {
    final users = ref.watch(userListStateProvider);
    print('users, ${users.value?.length}');
    return users.isLoading
        ? Container()
        : Scaffold(
            appBar: AppBar(
              title: const Text('User Management'),
            ),
            body: RefreshIndicator(
                onRefresh: () => ref.refresh(userListStateProvider.future),
                child: ListView(
                  children:
                      users.value!.map((user) => Text(user.name)).toList(),
                )));
  }
}
