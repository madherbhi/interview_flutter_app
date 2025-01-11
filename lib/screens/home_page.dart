import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task_app/helpers/image_helper.dart';
import 'package:task_app/screens/widgets/garage_widget.dart';
import 'package:task_app/screens/widgets/maraket_widget.dart';
import 'package:task_app/screens/widgets/riders_widget.dart';
import 'package:task_app/screens/widgets/stories_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  final List<Widget> _tabs = [
    const RidersTab(),
    const StoriesTab(),
    const MaraketTab(),
    const GarageTab(),
  ];
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 251, 244),
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      automaticallyImplyLeading: true,
      toolbarHeight: 60,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color.fromARGB(255, 250, 39, 2), Colors.orange.shade700],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      title: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
          const Gap(10),
          const Text(
            "Madherbhi",
            style: TextStyle(fontSize: 18, color: Colors.white, letterSpacing: 0.5),
          ),
        ],
      ),
      actions: [
        CircleAvatar(
          radius: 18,
          backgroundImage: AssetImage(ImageHelper.hpPay),
        ),
        IconButton(
          icon: const Icon(Icons.notifications, color: Colors.white),
          onPressed: () {},
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            "SOS",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
              color: Color.fromARGB(255, 250, 39, 2),
            ),
          ),
        ),
      ],
      elevation: 4.0,
      shadowColor: Colors.orange.withOpacity(0.5),
    );
  }

  Widget _body() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: _featuredTripCard()),
        SliverToBoxAdapter(child: _eventCard()),
        SliverPersistentHeader(
          pinned: true,
          delegate: _StickyTabBarDelegate(
            child: _tabSelectionHeader(),
          ),
        ),
        SliverFillRemaining(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            children: _tabs,
          ),
        ),
      ],
    );
  }

  Widget _tabSelectionHeader() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(4, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _currentIndex = index;
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInCirc,
                );
              });
            },
            child: Container(
              width: 120,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: Column(
                children: [
                  Text(
                    _getTabTitle(index),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: _currentIndex == index ? Colors.black : Colors.grey,
                      fontSize: 20,
                      fontWeight: _currentIndex == index ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  const Gap(3),
                  Container(
                    height: 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: _currentIndex == index ? Colors.black : Colors.transparent,
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _featuredTripCard() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage(ImageHelper.banner),
            fit: BoxFit.cover,
          ),
        ),
        height: 180,
        child: Stack(
          children: [
            const Positioned(
              top: 20,
              left: 30,
              child: Text(
                "8 DAY BIKE TRIP TO LEH LADAKH",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 0.5),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 30,
              child: SizedBox(
                height: 30,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 208, 186, 60),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Register Now",
                    style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white, letterSpacing: 0.5),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _eventCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Evenets For you".toUpperCase(),
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black, letterSpacing: 0.5),
          ),
          Container(
            margin: const EdgeInsets.only(top: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(ImageHelper.banner),
                fit: BoxFit.cover,
              ),
            ),
            height: 180,
            child: Stack(
              children: [
                const Positioned(
                  top: 20,
                  left: 30,
                  child: Text(
                    "HAYABUSA\n2019HYDERABAD\nRIDERS MEETUP",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 0.5),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 30,
                  child: Container(
                    height: 30,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 208, 186, 60),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      "2000-8000 INR",
                      style:
                          TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 0.5),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    height: 30,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 208, 186, 60),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), topRight: Radius.circular(12)),
                    ),
                    child: const Text(
                      "invited",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getTabTitle(int index) {
    switch (index) {
      case 0:
        return "RIDERES";
      case 1:
        return "STORIES";
      case 2:
        return "MARKET";
      case 3:
        return "GARAGE";
      default:
        return "";
    }
  }
}

class _StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _StickyTabBarDelegate({required this.child});

  @override
  double get minExtent => 50.0;

  @override
  double get maxExtent => 50.0;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(
      elevation: 0.0,
      child: child,
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
