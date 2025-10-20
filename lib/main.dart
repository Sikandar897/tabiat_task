import 'src.dart'; 
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tabiat Interview Task',
      debugShowCheckedModeBanner: false,
      initialBinding: TaskBinding(),
      initialRoute: Routes.home,
      getPages: AppPages.pages,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
    );
  }
}
