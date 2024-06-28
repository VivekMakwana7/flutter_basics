import 'package:flutter/material.dart';import 'package:flutter_basics/core/ext/ext_build_context.dart';/// Side Bar Widgetclass SideBarWidget extends StatelessWidget {  /// Default constructor  const SideBarWidget({super.key});  @override  Widget build(BuildContext context) {    return SizedBox(      width: 240,      child: DecoratedBox(        decoration: BoxDecoration(          color: context.appColor.sideBarBgColor,        ),        child: const Padding(          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),          child: Column(            crossAxisAlignment: CrossAxisAlignment.stretch,            children: [              SideMenuWidget(menuName: 'Text'),              SizedBox(height: 12),              SideMenuWidget(menuName: 'Text'),              SizedBox(height: 12),              SideMenuWidget(menuName: 'Text'),              SizedBox(height: 12),              SideMenuWidget(menuName: 'Text'),            ],          ),        ),      ),    );  }}/// For Side bar menu widgetclass SideMenuWidget extends StatelessWidget {  /// Default constructor  const SideMenuWidget({    required this.menuName,    super.key,  });  /// For menu name  final String menuName;  @override  Widget build(BuildContext context) {    return DecoratedBox(      decoration: BoxDecoration(        borderRadius: BorderRadius.circular(8),        color: context.appColor.sideBarSelectedColor,      ),      child: Padding(        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),        child: Text(          menuName,          style: context.text.bodyMedium,        ),      ),    );  }}