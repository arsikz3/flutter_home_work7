import 'package:flutter/material.dart';
import 'package:flutter_home_work7/detail_page.dart';
import 'dart:convert';
import 'package:flutter_home_work7/drawer_page.dart';
import 'package:flutter_home_work7/fetch_file.dart';
import 'package:flutter_home_work7/model.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Artist> artists = [];

  Future<List<Artist>> fetchData() async {
    final str = await fetchFileFromAssets('assets/artists.json');
    final list = json.decode(str) as List<dynamic>;
    artists = list.map((e) => Artist.fromJson(e)).toList();
    return artists;
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Artists'),
      ),
      drawer: const LeftMenu(),
      body: Container(
        color: Colors.blue.shade200,
        child: FutureBuilder<List<Artist>>(
          future: fetchData(),
          initialData: [],
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: Text('Please wait its loading...'));
            } else {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                List<Artist> art = snapshot.data;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                        onTap: (() {
                          Get.to(DetailPage(art: art[index]),
                              duration: Duration(seconds: 1),
                              transition: Transition.leftToRight);
                          //Navigator.of(context).pushNamed(
                          // '/detail', arguments: {'artist': art[index]},);
                        }),
                        title: Text(
                          art[index].name,
                        ));
                  },
                  itemCount: artists.length,
                );
              }
            }
          },
        ),
      ),
    );
  }
}
