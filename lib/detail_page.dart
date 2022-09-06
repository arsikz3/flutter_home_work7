import 'package:flutter/material.dart';
import 'package:flutter_home_work7/model.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final Artist? art = arguments['artist'] ?? null;
    return Scaffold(
      appBar: AppBar(
        title: (art != null) ? Text(art.name) : const Text(''),
      ),
      body: SingleChildScrollView(
        child: (art != null) ? Text(art.about ?? '') : Text(''),
      ),
    );
  }
}
