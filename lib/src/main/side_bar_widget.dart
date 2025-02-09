import 'package:flutter/material.dart';
import 'package:flutter_basics/core/app_cubit/app_cubit.dart';
import 'package:flutter_basics/core/ext/ext_build_context.dart';
import 'package:flutter_basics/core/routes/app_side_bar_pages.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

/// Side Bar Widget
class SideBarWidget extends StatelessWidget {
  /// Default constructor
  const SideBarWidget({required this.child, super.key});

  /// Shell widget
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: 220,
            child: DecoratedBox(
              decoration: BoxDecoration(color: context.appColor.sideBarBgColor),
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: BlocBuilder<AppCubit, AppState>(
                  builder: (context, state) {
                    final cubit = context.read<AppCubit>();
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 50),
                        for (int index = 0;
                            index < SideBarPage.values.length;
                            index++) ...[
                          SideMenuWidget(
                            menuName: SideBarPage.values[index].title,
                            onItemTap: () {
                              context.goNamed(SideBarPage.values[index].path);
                            },
                            isSelected:
                                cubit.sideBarPage == SideBarPage.values[index],
                          ),
                        ],
                        const SizedBox(height: 12),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          const VerticalDivider(width: 2),
          Expanded(child: child),
        ],
      ),
    );
  }
}

/// For Side bar menu widget
class SideMenuWidget extends StatelessWidget {
  /// Default constructor
  const SideMenuWidget({
    required this.menuName,
    required this.isSelected,
    this.onItemTap,
    super.key,
  });

  /// For menu name
  final String menuName;

  /// For Side menu item tap event
  final void Function()? onItemTap;

  /// For Side menu selected or not
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onItemTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        height: 42,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: isSelected
                ? Border(
                    right: BorderSide(
                      color: context.appColor.sideBarSelectedColor,
                      width: 2,
                    ),
                  )
                : null,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                menuName,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18,
                  color: isSelected
                      ? context.appColor.sideBarSelectedColor
                      : Colors.white70,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
