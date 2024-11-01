import 'package:colonial/src/theme/colors.dart';
import 'package:flutter/material.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      color: primaryColor,
      child: SizedBox(
        height: 120,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                "Hoje estamos no Bairro",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                color: Colors.white,
                child: SizedBox(
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
