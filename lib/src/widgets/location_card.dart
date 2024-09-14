import 'package:colonial/src/theme/colors.dart';
import 'package:flutter/material.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: primaryColor,
      child: Container(
        height: 120,
        child: Column(
          children: [
            Text("Hoje estamos no Bairro"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.white,
                child: Container(
                  height: 56,
                  width: double.maxFinite,
                  child: Center(child: Text("{localização}")),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
