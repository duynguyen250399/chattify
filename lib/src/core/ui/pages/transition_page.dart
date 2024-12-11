import 'package:flutter/material.dart';

class TransitionPage<T> extends Page<T> {
  final Widget child;

  const TransitionPage({
    super.key,
    required this.child,
  });

  @override
  Route<T> createRoute(BuildContext context) {
    return _TransitionPageRoute(this);
  }
}

class _TransitionPageRoute<T> extends PageRoute<T> {
  _TransitionPageRoute(TransitionPage<T> page) : super(settings: page) {
    _page = page;
  }

  late final TransitionPage<T> _page;

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return GestureDetector(
      child: _page.child,
    );
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    const begin = Offset(1, 0);
    const end = Offset.zero;
    final tween = Tween(begin: begin, end: end).chain(
      CurveTween(curve: Curves.linear),
    );
    final offsetAnimation = animation.drive(tween);

    return SlideTransition(position: offsetAnimation, child: child);
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);
}
