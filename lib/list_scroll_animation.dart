import 'package:flutter/material.dart';

class ListScrollAnimation extends StatefulWidget {
  const ListScrollAnimation({super.key});

  @override
  State<ListScrollAnimation> createState() => _ListScrollAnimationState();
}

class _ListScrollAnimationState extends State<ListScrollAnimation> {
  bool closeContainer = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SizedBox(
              height: size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedOpacity(
                      opacity: closeContainer ? 0 : 2,
                      duration: Duration(milliseconds: 500),
                    child: AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                       width: size.width,
                      alignment: Alignment.topCenter,
                      height: closeContainer ? 0 : size.height * 0.31,
                    ),
                  )
                ],
              ),
            )
        ),
    );
  }
}
