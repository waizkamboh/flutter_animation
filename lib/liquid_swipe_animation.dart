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
        'https://images.unsplash.com/photo-1506744038136-46273834b3fb?w=1200&q=80',
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
        'https://images.unsplash.com/photo-1516117172878-fd2c41f4a759?w=1200&q=80',
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
        'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=1200&q=80',
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
        'https://images.unsplash.com/photo-1501785888041-af3ef285b470?w=1200&q=80',
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
      body: LiquidSwipe(
          liquidController: controller,
           enableSideReveal: true,
           waveType: WaveType.liquidReveal,
          //positionSlideIcon: 0.8,
          onPageChangeCallback: (index){
            setState(() {

            });
          },
          slideIconWidget: Icon(Icons.arrow_back_ios,color: Colors.white,),
          pages: pages
      ),

    );
  }
}
