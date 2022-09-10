import 'package:flutter/material.dart';
import 'package:flutter_home_work7/detail_page.dart';
import 'package:get/get.dart';

class LeftMenu extends StatelessWidget {
  const LeftMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Home'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.details),
              title: const Text('Albums'),
              onTap: () {
                Get.to(DetailPage(),
                    duration: Duration(seconds: 1),
                    transition: Transition.leftToRight);
              },
            ),
          ],
        ),
      ),
    );
  }
}
