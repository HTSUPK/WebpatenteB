import 'package:flutter/material.dart';

/// To convert from hex, just change # to 0xff. #85D033 will become 0xff85D033*/
/// https://stackoverflow.com/questions/15852122/hex-transparency-in-colors to check hex codes for opacity

const Color colorPrimary = Color(0xFF39B273);
const Color colorWhite = Color(0xFFFFFFFF);
const Color colorBlack = Color(0xFF000000);
const Color colorBackground = Color(0xFFD3D3D3);


List<Color> shadowGradient = [
  colorBlack.withOpacity(0.93),
  colorBlack,
];
