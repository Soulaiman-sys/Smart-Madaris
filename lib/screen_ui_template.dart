import 'package:flutter/material.dart';

class ScreenUiTemplate extends StatelessWidget {
  const ScreenUiTemplate({
    super.key,
    required this.screenTitle,
    required this.body,
  });

  final String screenTitle;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height * .1,
        ),
        child: AppBar(
          backgroundColor: const Color(0xFFF97A25),
          centerTitle: true,
          title: Text(
            screenTitle,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          iconTheme: IconThemeData(color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(
                MediaQuery.of(context).size.width,
                100.0,
              ),
            ),
          ),
        ),
      ),

      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/2.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: body,
      ),
    );
  }
}
