import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Vidio/provider/Video_Provider.dart';
import 'Vidio/view/Video_Play.dart';
import 'Vidio/view/Video_Screen.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => VideoProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => VideoScreen(),
          'playscreen':(context) => PlayScreen(),
        },
      ),
    ),
  );
}