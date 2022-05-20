import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class FloatingBackButton extends StatelessWidget {
  const FloatingBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      margin: const EdgeInsets.only(top: 20),
      child: FloatingActionButton(
        backgroundColor: Colors.black.withOpacity(0.3),
        onPressed: () {
          context.popRoute();
        },
        child: const Padding(
          padding: EdgeInsets.only(left: 8),
          child: Icon(Icons.arrow_back_ios),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
        ),
      ),
    );
  }
}
