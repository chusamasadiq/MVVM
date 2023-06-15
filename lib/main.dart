import 'package:flutter/material.dart';
import 'package:mvvm/resources/theme.dart';
import 'package:mvvm/utils/routes/routes.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/viewmodel/auth_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MVVMStructure());
}

class MVVMStructure extends StatelessWidget {
  const MVVMStructure({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
      ],
      child: MaterialApp(
        theme: myAppTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
