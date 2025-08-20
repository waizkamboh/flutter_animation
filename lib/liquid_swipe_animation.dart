import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
            onPageChangeCallback: (index){
             setState(() {

             });
            },
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
                  AnimatedSmoothIndicator(
                      activeIndex: controller.currentPage,
                      count: 3,
                      effect: SwapEffect(
                        spacing: 16,
                        dotColor: Colors.white54,
                        activeDotColor: Colors.white,
                      ),
                    onDotClicked: (index){
                         controller.animateToPage(page: index);
                    },
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
