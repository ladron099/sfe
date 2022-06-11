import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:permis/const/input.dart';

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  var cntrl=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: input('text', false, IconlyBroken.search , cntrl, false),
    );
  }
}
