import 'package:flutter/material.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child:ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
            return Container(
              height: 100,
              color: Colors.blue,
              margin: const EdgeInsets.all(10),
              child: Center(child: Text('Item $index')),
            );
          },)
          
        ),
      ],
    );
  }
}