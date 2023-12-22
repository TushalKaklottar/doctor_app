import 'package:flutter/services.dart';
import 'export_app.dart';

 void main () async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp
    ]
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: primary,
        statusBarBrightness: Brightness.light,
      )
    );
    return ScreenUtilInit(
      designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_,child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
              useMaterial3: true,
              primaryColor: primary,
                textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
              ),
            home: child,
          );
        },
      // child: ,
    );
  }
}
