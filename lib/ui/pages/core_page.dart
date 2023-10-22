import 'package:flutter/material.dart';
import 'package:flutter_beautifull_app/ui/components/bottom_sheet_beautifull.dart';
import 'package:flutter_beautifull_app/ui/components/experiences_view.dart';
import 'package:flutter_beautifull_app/ui/components/informations_view.dart';
import 'package:flutter_beautifull_app/ui/components/places_view.dart';
import 'package:flutter_beautifull_app/ui/components/point_tab_indicator.dart';

class CorePage extends StatefulWidget {
  const CorePage({super.key});

  @override
  State<CorePage> createState() => _CorePageState();
}

class _CorePageState extends State<CorePage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  static const List<Widget> myTabs = [
    Tab(text: 'Places'),
    Tab(text: 'Experiences'),
    Tab(text: 'Informations'),
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: myTabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 60,
                ),
                Container(
                    padding: EdgeInsets.only(left: 20),
                    child: const Text(
                      'Your journey',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    )),
                const SizedBox(
                  height: 20,
                ),
                TabBar(
                  isScrollable: true,
                  tabs: myTabs,
                  controller: _controller,
                  labelStyle: TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.bold),
                  unselectedLabelStyle: TextStyle(fontSize: 14),
                  indicator: const PointTabIndicator(),
                  indicatorWeight: 1,
                  padding: EdgeInsets.zero,
                  labelColor: Colors.black,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  
                 height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width ,
                  child: TabBarView(controller: _controller, children: const [
                    PlacesView(),
                    InformationsView(),
                    ExperiencesView()
                  ]),
                ),
              ],
            ),
          ),
           ExhibitionBottomSheet(),
        ],
      ),
    );
  }
}
