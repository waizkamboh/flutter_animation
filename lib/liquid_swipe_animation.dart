import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:cached_network_image/cached_network_image.dart';

class LiquidSwipeAnimation extends StatefulWidget {
  const LiquidSwipeAnimation({super.key});

  @override
  State<LiquidSwipeAnimation> createState() => _LiquidSwipeAnimationState();
}

class _LiquidSwipeAnimationState extends State<LiquidSwipeAnimation> {

  final controller = LiquidController();

  Widget _buildPage(String imageUrl, String text){
    return SizedBox(
      height: double.infinity,
      child: Stack(
        children: [
          CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              placeholder: (context, url) => const Center(child: CircularProgressIndicator(),),
              errorWidget: (context, url, error) =>  Center(child: Icon(Icons.error),),
          ),
          Positioned(
              bottom: 30,
              left: 20,
              right: 20,
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 6,
                      color: Colors.black.withOpacity(0.6),
                      offset: const Offset(2, 2),
                    ),
                  ]

                ),
              ),

          )
        ],
      ),
    );
  }

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
          pages: [
            _buildPage("https://images.unsplash.com/photo-1506744038136-46273834b3fb?w=1200&q=80","Embrace the beauty of nature 🌿",),
            _buildPage("https://images.unsplash.com/photo-1516117172878-fd2c41f4a759?w=1200&q=80", "Where the mountains touch the sky 🏔️",),
            _buildPage("https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=1200&q=80", "Feel the waves, feel alive 🌊",),
            _buildPage("https://images.unsplash.com/photo-1501785888041-af3ef285b470?w=1200&q=80", "Adventure begins where the forest whispers 🌲",),
          ]
      ),

    );
  }
}
