import 'package:flutter/material.dart';
import 'dart:ui';

import 'Model/scrol_list_model.dart';

class ScrollListAnimatedScreen extends StatefulWidget {
  const ScrollListAnimatedScreen({super.key});

  @override
  _ScrollListAnimatedScreenState createState() =>
      _ScrollListAnimatedScreenState();
}

class _ScrollListAnimatedScreenState extends State<ScrollListAnimatedScreen> {
  ScrollController controller = ScrollController();
  bool closeContainer = false;
  double myTopContainer = 0;
  List<Widget> myItems = [];

  @override
  void initState() {
    super.initState();
    myBodyItems();
    controller.addListener(() {
      double myData = controller.offset / 120;
      setState(() {
        myTopContainer = myData;
        closeContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedOpacity(
              opacity: closeContainer ? 0 : 1,
              duration: const Duration(milliseconds: 500),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: size.width,
                alignment: Alignment.topCenter,
                height: closeContainer ? 0 : size.height * 0.28,
                child: ListView(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        children: [
                          Text(
                            "🔥 Discover",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.black87,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "view all",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.blueGrey,
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(Icons.arrow_forward_ios,
                              size: 15, color: Colors.blueGrey),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        child: Row(
                          children: [
                            discoverItems(size, Colors.orange, "Most Favorite",
                                "20 Items"),
                            discoverItems(
                                size, Colors.blue, "Newest", "15 Items"),
                            discoverItems(size, Colors.purple,
                                "Super Saving", "10 Items"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 22, bottom: 30),
              child: Text(
                "🎟 My Coupons",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: controller,
                itemCount: myItems.length,
                itemBuilder: (context, index) {
                  double opacity = 1.0;
                  if (myTopContainer > 0.5) {
                    opacity = index + 0.5 - myTopContainer;
                    if (opacity < 0) opacity = 0;
                    else if (opacity > 1) opacity = 1;
                  }
                  return Opacity(
                    opacity: opacity,
                    child: Transform(
                      transform: Matrix4.identity()
                        ..scale(opacity, opacity)
                        ..rotateZ((1 - opacity) * 0.1),
                      alignment: Alignment.center,
                      child: Align(
                        heightFactor: 0.8,
                        child: myItems[index],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void myBodyItems() {
    List<Widget> listItems = [];
    for (ScrollItems items in dataItems) {
      listItems.add(
        Container(
          height: 160,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(items.color).withOpacity(0.8),
                Color(items.color).withOpacity(0.5),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(4, 6),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      items.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                    Image.asset(
                      items.image,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
    setState(() {
      myItems = listItems;
    });
  }

  Container discoverItems(Size size, Color color, name, items) {
    return Container(
      height: size.height * 0.23,
      width: 170,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(0.9), color.withOpacity(0.6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.4),
            blurRadius: 10,
            offset: const Offset(3, 6),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    height: 1.2,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  items,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
            const Positioned(
              bottom: 10,
              right: 10,
              child: Icon(
                Icons.favorite,
                color: Colors.white70,
                size: 34,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


