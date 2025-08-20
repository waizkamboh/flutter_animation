import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';

class LiquidSwipeAnimation extends StatefulWidget {
  const LiquidSwipeAnimation({super.key});

  @override
  State<LiquidSwipeAnimation> createState() => _LiquidSwipeAnimationState();
}

class _LiquidSwipeAnimationState extends State<LiquidSwipeAnimation> {

  final controller = LiquidController();

  final pages = [
    SizedBox(
      height: double.infinity,
      child: CachedNetworkImage(
        imageUrl:
        'https://plus.unsplash.com/premium_photo-1675200124904-dfadce24119f?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        fit: BoxFit.cover,
        placeholder: (context, url) =>
        const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) =>
        const Center(child: Icon(Icons.error)),
      ),
    ),
    SizedBox(
      height: double.infinity,
      child: CachedNetworkImage(
        imageUrl:
        'https://plus.unsplash.com/premium_photo-1668485968521-4e182e8093d8?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        fit: BoxFit.cover,
        placeholder: (context, url) =>
        const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) =>
        const Center(child: Icon(Icons.error)),
      ),
    ),
    SizedBox(
      height: double.infinity,
      child: CachedNetworkImage(
        imageUrl:
        'https://images.unsplash.com/photo-1578979879663-4ba6a968a50a?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        fit: BoxFit.cover,
        placeholder: (context, url) =>
        const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) =>
        const Center(child: Icon(Icons.error)),
      ),
    ),
    SizedBox(
      height: double.infinity,
      child: CachedNetworkImage(
        imageUrl:
        'https://images.unsplash.com/photo-1521567097888-2c5fc40a8660?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTl8R0UzbVRqanpQRWd8fGVufDB8fHx8fA%3D%3D',
        fit: BoxFit.cover,
        placeholder: (context, url) =>
        const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) =>
        const Center(child: Icon(Icons.error)),
      ),
    ),
    SizedBox(
      height: double.infinity,
      child: CachedNetworkImage(
        imageUrl:
        'https://images.unsplash.com/photo-1524626050212-92f72d69a67b?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        fit: BoxFit.cover,
        placeholder: (context, url) =>
        const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) =>
        const Center(child: Icon(Icons.error)),
      ),
    ),
  ];
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
              pages: pages
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
