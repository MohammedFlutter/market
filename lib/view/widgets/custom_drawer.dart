import 'package:flutter/material.dart';
import 'package:market/model/user_info.dart';
import 'package:market/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key,  this.user});

  final UserInfo? user;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          (user==null)?const CircularProgressIndicator(): UserAccountsDrawerHeader(
            accountName: Text('${user!.firstName} ${user!.lastName}',
                style: const TextStyle(color: Colors.white)),
            accountEmail: Text(user!.email ?? "",
                style: const TextStyle(color: Colors.white)),
            currentAccountPicture: CircleAvatar(
              child: (user!.image != null)
                  ? Image.network(user!.image!)
                  : const Icon(Icons.person),
            ),
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: () async => await
              context.read<HomeViewModel>().logout(context),
            trailing: const Icon(Icons.logout),
          )
        ],
      ),
    );
  }
}
