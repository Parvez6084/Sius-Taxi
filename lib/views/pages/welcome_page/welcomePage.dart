import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sisutaxi/views/pages/welcome_page/welcomePageController.dart';

import '';

class WelcomePage extends GetView<WelcomePageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned( top: 40, left: 40,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Welcome to', textAlign: TextAlign.center, style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.w400),),
                  Text('Sisu Taxi', textAlign: TextAlign.center, style: TextStyle(fontSize: 40, color: Colors.deepOrange, fontWeight: FontWeight.w400),),
                ],
              ),
            ),
            Positioned(bottom: 40, left: 40, right: 40,
                child: Text(controller.text.value, style: TextStyle(color: Colors.deepOrange))),
          ],
        ),
      ),
    );
  }
}
