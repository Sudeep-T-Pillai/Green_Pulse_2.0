import 'package:flutter/material.dart';
import 'package:greenpulse/Text/text_info.dart';
import 'package:rive/rive.dart';

import '../Data/Rive_Animation/rive_animation.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),

      body: Column(
        children: [

          const SizedBox(
            height: 10,
            width: 500,
          ),

          Container(
            height: 570,
            width: 500,
            color: Color.fromARGB(255, 243, 237, 235), 
            child: RiveHappySad(),
            ),
          


          const SizedBox(
            height: 5,
            width: 500,
          ),

          const SizedBox(
            width: 500,
            height: 70,
           child: TextInfo("Today's Emission"),
          )
        ],
      ),
    );
  }
}