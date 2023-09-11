import 'package:flutter/material.dart';

import 'data.dart';
import 'the_drawer.dart';

class ScreenListGroups extends StatefulWidget {
  List<UserGroup> userGroups;

  ScreenListGroups({super.key, required this.userGroups});

  @override
  State<ScreenListGroups> createState() => _ScreenListGroupsState();
}

class _ScreenListGroupsState extends State<ScreenListGroups> {
  late List<UserGroup> userGroups;

  @override
  void initState() {
    super.initState();
    userGroups = widget.userGroups; // the userGroups of ScreenListGroups
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // TODO: assign names like New group 1, New group 2...
          UserGroup newUserGroup = UserGroup(
              Data.defaultName,
              Data.defaultDescription,
              Data.defaultAreas,
              Data.defaultSchedule,
              Data.defaultActions, <User>[]);
          userGroups.add(newUserGroup);
          setState(() {});
        },
      ),
      drawer: TheDrawer(context).drawer,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text("User groups"),
      ),
      body: ListView.separated(
        // it's like ListView.builder() but better
        // because it includes a separator between items
        padding: const EdgeInsets.all(16.0),
        itemCount: userGroups.length,
        itemBuilder: (BuildContext context, int index) =>
            _buildRow(userGroups[index], index),
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }

  Widget _buildRow(UserGroup userGroup, int index) {
    return ListTile(
      title: Text(userGroup.name),
      trailing: Text('${userGroup.users.length}'),
      onTap: () {},
    );
  }
}
