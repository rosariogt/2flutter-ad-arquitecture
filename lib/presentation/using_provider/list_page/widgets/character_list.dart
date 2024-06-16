import 'package:arquitecture/domain/entity/character.dart';
import 'package:arquitecture/presentation/using_provider/list_page/change_notifier/change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CharacterList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CharacterListState();
}

class CharacterListState extends State<CharacterList> {
  
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      print("first");
      Provider.of<CharacterChangeNotifier>(context, listen: false).fetchNextPage();
    });
  }
  
  
  @override
  Widget build(BuildContext context) {
    final characterNotifier = Provider.of<CharacterChangeNotifier>(context);
    final list = characterNotifier.characters;
    print("lista notifier ${list}" );

    final status = characterNotifier.status;
    print(status);
    return (status == CharacterStatus.loading || status == CharacterStatus.initial  )
        ? const LinearProgressIndicator()
        : ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              Character character = list[index];
              print("lista ${list[0]}" );
              print("lista ${character.name}");
              return Text(character.name!);
            });
  }
}
