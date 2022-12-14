import 'package:flutter/material.dart';

import '../constants/textStyle3.dart';
import '../constants/vertSpacer5.dart';

var chatButton = GestureDetector(
  child: Expanded(
      child: Container(
    width: 175,
    height: 80,
    decoration: BoxDecoration(
      color: Colors.green,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.chat, color: Colors.white),
        spacer5v,
        Text(
          'Написать',
          style: textStyle3,
        )
      ],
    ),
  )),
);
