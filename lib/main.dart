import 'package:arquitecture/data/repositories/character_repository_impl.dart';
import 'package:arquitecture/data/source/character_remote_data_source.dart';
import 'package:arquitecture/domain/usecase/get_all_characters.dart';
import 'package:arquitecture/presentation/using_provider/list_page/change_notifier/change_notifier.dart';
import 'package:arquitecture/presentation/using_provider/list_page/widgets/character_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/source/network/api.dart';
import 'injection_container.dart';

void main()  async{
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    // Api api = Api();
    // CharacterRemoteDataSourceImpl characterRemoteDataSourceImpl = CharacterRemoteDataSourceImpl(api);
    // CharacterRepositoryImpl characterRepositoryImpl = CharacterRepositoryImpl(characterRemoteDataSourceImpl: characterRemoteDataSourceImpl);
    // GetAllCharacters getAllCharacters=GetAllCharacters(repository: characterRepositoryImpl);

    return ChangeNotifierProvider( create: (_)
    => CharacterChangeNotifier(), child:  Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: CharacterList(),
    ));
  }
}
