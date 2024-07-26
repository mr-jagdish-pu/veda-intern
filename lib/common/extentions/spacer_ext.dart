import 'package:flutter/cupertino.dart';

extension SpacerExt on num
{
   SizedBox get ht => SizedBox(height: toDouble(),);
   SizedBox get wd => SizedBox(width: toDouble(),);
}