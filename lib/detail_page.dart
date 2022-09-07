import 'package:flutter/material.dart';
import 'package:flutter_home_work7/model.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key, this.art}) : super(key: key);
  final Artist? art;
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
    //final arguments = (ModalRoute.of(context)?.settings.arguments ??
    //   <String, dynamic>{}) as Map;
    //final Artist? art = arguments['artist'] ?? null;
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(icon: on),
        title:
            (widget.art != null) ? Text(widget.art!.name) : Text('не указан'),
      ),
      body: Container(
        color: Colors.blue.shade100,
        child: SingleChildScrollView(
          child: (widget.art != null)
              ? Center(child: Text(widget.art!.about ?? ''))
              : Center(child: const Text('не указан')),
        ),
      ),
    );
  }
}
