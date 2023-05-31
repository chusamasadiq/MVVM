import 'package:flutter/material.dart';

void main() {
  runApp(const MVVMStructure());
}

class MVVMStructure extends StatelessWidget {
  const MVVMStructure({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
}
