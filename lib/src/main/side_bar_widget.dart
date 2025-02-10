import 'package:flutter/material.dart';
import 'package:flutter_basics/core/app_cubit/app_cubit.dart';
import 'package:flutter_basics/core/ext/ext_build_context.dart';
import 'package:flutter_basics/core/routes/app_side_bar_pages.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

/// Side Bar Widget
class SideBarWidget extends StatefulWidget {
  /// Default constructor
  const SideBarWidget({required this.child, super.key});

  /// Shell widget
  final Widget child;

  @override
  State<SideBarWidget> createState() => _SideBarWidgetState();
}

class _SideBarWidgetState extends State<SideBarWidget> with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 800),
    reverseDuration: const Duration(milliseconds: 800),
  );

  late final _railAnimation = SideBarAnimation(parent: _controller);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final width = MediaQuery.sizeOf(context).width;
    final status = _controller.status;
    if (width > 800) {
      if (status != AnimationStatus.forward && status != AnimationStatus.completed) {
        _controller.forward();
      }
    } else {
      if (status != AnimationStatus.reverse && status != AnimationStatus.dismissed) {
        _controller.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideBarTransition(
            animation: _railAnimation,
            backgroundColor: context.appColor.sideBarBgColor,
            child: SizedBox(
              width: 220,
              child: ColoredBox(
                color: context.appColor.sideBarBgColor,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: BlocBuilder<AppCubit, AppState>(
                    builder: (context, state) {
                      final cubit = context.read<AppCubit>();
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 50),
                          for (int index = 0; index < SideBarPage.values.length; index++) ...[
                            SideMenuWidget(
                              menuName: SideBarPage.values[index].title,
                              onItemTap: () {
                                context.goNamed(SideBarPage.values[index].path);
                              },
                              isSelected: cubit.sideBarPage == SideBarPage.values[index],
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
          ),
          if (_railAnimation.value == 1) const VerticalDivider(width: 2),
          Expanded(child: widget.child),
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
                  color: isSelected ? context.appColor.sideBarSelectedColor : Colors.white70,
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

/// Property Widget
class PropertyWidget extends StatelessWidget {
  /// Default constructor
  const PropertyWidget({required this.children, super.key});

  /// For List of property widget passes
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(color: context.appColor.sideBarBgColor.withValues(alpha: 0.5)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}

/// Side Bar Transitions
class SideBarTransition extends StatefulWidget {
  /// Default constructor
  const SideBarTransition({required this.animation, required this.backgroundColor, required this.child, super.key});

  /// The animation for the transition
  final Animation<double> animation;

  /// Child
  final Widget child;

  /// Background color
  final Color backgroundColor;

  @override
  State<SideBarTransition> createState() => _SideBarTransitionState();
}

class _SideBarTransitionState extends State<SideBarTransition> {
  // The animations are only rebuilt by this method when the text
  // direction changes because this widget only depends on Directionality.
  late final bool ltr = Directionality.of(context) == TextDirection.ltr;
  late final Animation<Offset> offsetAnimation = Tween<Offset>(
    begin: ltr ? const Offset(-1, 0) : const Offset(1, 0),
    end: Offset.zero,
  ).animate(OffsetAnimation(parent: widget.animation));
  late final Animation<double> widthAnimation = Tween<double>(
    begin: 0,
    end: 1,
  ).animate(SizeAnimation(parent: widget.animation));

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: DecoratedBox(
        decoration: BoxDecoration(color: widget.backgroundColor),
        child: AnimatedBuilder(
          animation: widthAnimation,
          builder: (context, child) {
            return Align(
              alignment: Alignment.topLeft,
              widthFactor: widthAnimation.value,
              child: FractionalTranslation(
                translation: offsetAnimation.value,
                child: widget.child,
              ),
            );
          },
        ),
      ),
    );
  }
}

/// Offset Animation
class OffsetAnimation extends CurvedAnimation {
  /// Default constructor
  OffsetAnimation({required super.parent})
      : super(
          curve: const Interval(
            2 / 5,
            3 / 5,
            curve: Curves.easeInOutCubicEmphasized,
          ),
          reverseCurve: Interval(
            4 / 5,
            1,
            curve: Curves.easeInOutCubicEmphasized.flipped,
          ),
        );
}

/// Size Animation
class SizeAnimation extends CurvedAnimation {
  /// Default constructor
  SizeAnimation({required super.parent})
      : super(
          curve: const Interval(
            0 / 5,
            3 / 5,
            curve: Curves.easeInOutCubicEmphasized,
          ),
          reverseCurve: Interval(
            2 / 5,
            1,
            curve: Curves.easeInOutCubicEmphasized.flipped,
          ),
        );
}

/// Side Bar animation
class SideBarAnimation extends CurvedAnimation {
  /// Default constructor
  SideBarAnimation({required super.parent})
      : super(
          curve: const Interval(0 / 5, 4 / 5),
          reverseCurve: const Interval(3 / 5, 1),
        );
}
