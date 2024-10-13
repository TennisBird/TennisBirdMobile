import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideUpTransitionPage<T> extends CustomTransitionPage<T> {
  SlideUpTransitionPage({
    required super.child,
  }) : super(
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset(0.0, 0.0);  
            const curve = Curves.easeInOut; 

            var tween = Tween(begin: begin, end: end)
                .chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          opaque: false,
          barrierColor: Colors.black.withOpacity(0.3), 
        );
}