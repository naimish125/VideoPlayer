import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/Video_Provider.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  VideoProvider?  VT,VF;
  @override

  Widget build(BuildContext context) {
    VT = Provider.of<VideoProvider>(context,listen: true);
    VF = Provider.of<VideoProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Video Player",style:TextStyle(color: Colors.black
          )),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                var m1 = VF!.videoload(index);
                Navigator.pushNamed(context, 'playscreen');
              },
              child: Container(
                margin: EdgeInsets.all(8),
                height: 280,
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      height: 180,
                      width: double.infinity,
                      child: ClipRRect(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)),
                          child: Image.asset("${VT!.Images[index]}",fit: BoxFit.cover,)),
                    ),
                    Container(
                      height: 100,
                      width: double.infinity,
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          Container(
                            height: 45,
                            width: 45,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset("assets/images/T-series-logo.png",fit: BoxFit.fill,)
                            ),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle
                            ),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("T Series"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white,
                          blurRadius: 4,
                          spreadRadius: -1,
                      ),
                    ]
                ),
              ),
            );
          },
        ),
      ),
    );
  }
  @override
  void deactivate() {
    super.deactivate();
    VF!.pausesong();
  }
}

