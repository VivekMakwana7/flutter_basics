import 'package:flutter/material.dart';import 'package:flutter_basics/core/ext/ext_build_context.dart';/// Side Bar Widgetclass SideBarWidget extends StatelessWidget {  /// Default constructor  const SideBarWidget({super.key});  @override  Widget build(BuildContext context) {    return DecoratedBox(      decoration: BoxDecoration(        color: context.appColor.sideBarColor,      ),      child: Padding(        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),        child: Column(          children: [            Text(              'Text',              style: TextStyle(color: Colors.white),            )          ],        ),      ),    );  }}