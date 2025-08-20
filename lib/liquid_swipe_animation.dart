import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class LiquidSwipeAnimation extends StatefulWidget {
  const LiquidSwipeAnimation({super.key});

  @override
  State<LiquidSwipeAnimation> createState() => _LiquidSwipeAnimationState();
}

class _LiquidSwipeAnimationState extends State<LiquidSwipeAnimation> {

  final controller = LiquidController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
            liquidController: controller,
            enableSideReveal: true,
            slideIconWidget: Icon(Icons.arrow_back_ios,color: Colors.white,),
              pages: [
                 Container(
                   color: Colors.black,
                   child: Center(child: Text('Pgae1'),),
                 ),
                 Container(
                   color: Colors.blue.shade800,
                   child: Center(child: Text('Pgae2'),),
                 ),
                 Container(
                   color: Colors.deepPurple.shade900,
                   child: Center(child: Text('Pgae3'),),
                 ),
              ]
          ),
          Positioned(
            bottom: 0,
              left: 16,
              right: 32,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: (){
                        controller.jumpToPage(page: 2);
                      },
                      child: Text("SKIP")
                  ),
                  TextButton(
                      onPressed: (){
                        final page = controller.currentPage + 1;

                        controller.animateToPage(
                            page: page > 3 ? 0 : page,
                            duration: 400,
                        );
                      },
                      child: Text("NEXT")
                  ),
                ],
              )
          )
        ],
      ),
    );
  }
}
