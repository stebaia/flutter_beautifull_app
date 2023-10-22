import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beautifull_app/utils_string.dart';

class ChildPage extends StatefulWidget {
  const ChildPage({super.key, required this.name_image, required this.name});
  final String name_image;
  final String name;

  @override
  State<ChildPage> createState() => _ChildPageState();
}

class _ChildPageState extends State<ChildPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        children: [
          
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.chevron_left)),
                    Text(
                      widget.name,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  margin: EdgeInsets.all(20),
                  child: Hero(
                    tag: widget.name,
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                        child: Image.asset('assets/${widget.name_image}')),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.timer_outlined, color: Color(0xFF162A49),),
                          SizedBox(width: 6,),
                          Text('2-3 hours', style: TextStyle(color: Colors.blueGrey, fontSize: 18),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Icon(Icons.travel_explore, color: Color(0xFF162A49),),
                          SizedBox(width: 6,),
                          Text('A wonderfull trip', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                        ],
                      ),
                      
                      SizedBox(height: 10,),
                      Text(
                        bigDescription,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 120,)
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF162A49),
            ),
          ),
        ],
      ),
    );
  }
}
