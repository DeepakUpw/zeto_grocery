import 'package:flutter/cupertino.dart';

class ZetoProducts {
  final NetworkImage productimage;
  final String productname;
  final String netweight;
  final String? oldprice;
  final String newprice;
  final String? offer;

  ZetoProducts(
      {required this.productimage,
      required this.productname,
      required this.netweight,
      this.oldprice,
      required this.newprice,
      this.offer});
}
