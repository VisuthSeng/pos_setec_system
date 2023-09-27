import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('POS System'),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: SizedBox(
                height: 50,
                width: 150,
                child: TextField(
                  style: Theme.of(context).primaryTextTheme.bodyLarge!.copyWith(
                        fontSize: 14,
                      ),
                  readOnly: false,
                  cursorHeight: 20,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.add),
                    labelText: 'Product Name',
                    labelStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 14,
                        ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: SizedBox(
                height: 50,
                width: 150,
                child: TextField(
                  style: Theme.of(context).primaryTextTheme.bodyLarge!.copyWith(
                        fontSize: 14,
                      ),
                  readOnly: false,
                  cursorHeight: 20,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.add),
                    labelText: 'Product Qty',
                    labelStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 14,
                        ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: SizedBox(
                height: 50,
                width: 150,
                child: TextField(
                  style: Theme.of(context).primaryTextTheme.bodyLarge!.copyWith(
                        fontSize: 14,
                      ),
                  readOnly: false,
                  cursorHeight: 20,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.add),
                    labelText: 'Category',
                    labelStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 14,
                        ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: SizedBox(
                height: 50,
                width: 150,
                child: TextField(
                  style: Theme.of(context).primaryTextTheme.bodyLarge!.copyWith(
                        fontSize: 14,
                      ),
                  readOnly: false,
                  cursorHeight: 20,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.add),
                    labelText: 'Price',
                    labelStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 14,
                        ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
