import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_beautifull_app/ui/pages/child_page.dart';

enum TypeCard { experince, information, place }

class SlidingCard extends StatelessWidget {
  const SlidingCard(
      {super.key,
      required this.name,
      required this.assetName,
      this.price,
      required this.type,
      required this.offset});

  final double offset;
  final String name;
  final String assetName;
  final String? price;
  final TypeCard type;

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08));

    return Transform.translate(
        offset: Offset(-32 * gauss * offset.sign, 0),
        child: Card(
          margin: EdgeInsets.only(right: 16, bottom: 24),
          elevation: 20,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Hero(
                  tag: name,
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(32)),
                    child: Image.asset(
                      'assets/$assetName',
                      alignment: Alignment(-offset.abs(), 0),
                      height: MediaQuery.of(context).size.height * 0.4,
                      //alignment: Alignment(-offset.abs(), 0),
                      fit: BoxFit.cover,
                    ),
                  )),
              SizedBox(height: 8),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  child: Column(
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: <Widget>[
                          MaterialButton(
                            color: Color(0xFF162A49),
                            child: Text('Discover'),
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ChildPage(
                                  name_image: assetName,
                                  name: name,
                                ),
                              ));
                            },
                          ),
                          Spacer(),
                          Icon(
                            Icons.place_rounded,
                            color: Color(0xFF162A49),
                          ),
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ));
  }
}

class CardContent extends StatelessWidget {
  const CardContent(
      {super.key,
      required this.name,
      required this.offset,
      required this.name_image});

  final String name;
  final name_image;
  final double offset;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Hero(
              tag: "text_$name",
              child: Text(name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          SizedBox(height: 8),
          Spacer(),
          Row(
            children: <Widget>[
              MaterialButton(
                color: Color(0xFF162A49),
                child: Text('Discover'),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ChildPage(
                      name_image: name_image,
                      name: name,
                    ),
                  ));
                },
              ),
              Spacer(),
              Icon(
                Icons.place_rounded,
                color: Color(0xFF162A49),
              ),
              SizedBox(width: 16),
            ],
          )
        ],
      ),
    );
  }
}
