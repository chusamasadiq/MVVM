import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes.dart';
import 'package:mvvm/utils/routes/routes_name.dart';

void main() {
  runApp(const MVVMStructure());
}

class MVVMStructure extends StatelessWidget {
  const MVVMStructure({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 5
        )
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesName.login,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
