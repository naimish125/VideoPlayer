import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/Video_Provider.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({Key? key}) : super(key: key);

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  @override
  @override
  VideoProvider? T, F;

  Widget build(BuildContext context) {
    var m1 = ModalRoute.of(context)!.settings.arguments;
    T = Provider.of(context, listen: false);
    F = Provider.of(context, listen: true);
    return SafeArea(
      child: Scaffold(
        body: Container(child: Chewie(controller: T!.song!,)),
      ),
    );
  }

  @override
  void deactivate() {
    super.deactivate();
    F!.pausesong();
  }
}
