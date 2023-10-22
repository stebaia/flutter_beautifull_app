import 'package:flutter/material.dart';
import 'package:flutter_beautifull_app/ui/components/sliding_card_view.dart';

class PlacesView extends StatefulWidget {
  const PlacesView({super.key});

  @override
  State<PlacesView> createState() => _PlacesViewState();
}

class _PlacesViewState extends State<PlacesView> {
  late PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
    pageController.addListener(() {
      setState(() => pageOffset = pageController.page!);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: PageView(
            controller: pageController,
            children: <Widget>[
              SlidingCard(
                name: 'White Mountain - National Forest in Italy',
                type: TypeCard.place,
                assetName: 'japan.jpg',
                offset: pageOffset,
              ),
              SlidingCard(
                name: 'Lake Como - A world within a world',
                type: TypeCard.place,
                assetName: 'lake.jpg',
                offset: pageOffset - 1,
              ),
              SlidingCard(
                name: 'Sestola Cimone - A beautifull snowing day',
                type: TypeCard.place,
                assetName: 'thai.jpg',
                offset: pageOffset - 1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}