import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maplespy/config/color_config.dart';
import 'package:maplespy/util/main_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');

  runApp(const ProviderScope(child: MaplespyApp()));
}

class MaplespyApp extends ConsumerWidget {
  const MaplespyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: "Maple Charactor Information Application",
      theme: ThemeData(
        fontFamily: 'NotoSansKR',
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      themeMode: ThemeMode.light,
      routerConfig: mainRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
