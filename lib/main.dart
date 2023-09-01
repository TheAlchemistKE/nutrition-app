import 'package:flutter/material.dart';
import 'package:nutrinowapp/app/application.dart';
import 'package:nutrinowapp/helper/hash.dart';
import 'package:nutrinowapp/provider/account/account_provider.dart';
import 'package:nutrinowapp/provider/account/profile_setup_provider.dart';
import 'package:nutrinowapp/provider/application/application_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ApplicationProvider>(
          create: (context) => ApplicationProvider(),
        ),
        ChangeNotifierProvider<AccountProvider>(
          create: (context) => AccountProvider(),
        ),
        ChangeNotifierProvider<ProfileSetupProvider>(
          create: (context) => ProfileSetupProvider(hash()),
        ),
      ],
      child: Application(),
    );
  }
}
