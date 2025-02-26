import 'package:flutter/material.dart';

/// Flutter code sample for [SearchBar].

class Homepage_SearchBar extends StatefulWidget {
  const Homepage_SearchBar({super.key});

  @override
  State<Homepage_SearchBar> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<Homepage_SearchBar> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    // final ThemeData themeData = ThemeData(
    //     useMaterial3: true,
    //     brightness: isDark ? Brightness.dark : Brightness.dark);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SearchAnchor(
          builder: (BuildContext context, SearchController controller) {
        return SearchBar(
          backgroundColor: const MaterialStatePropertyAll(
            Color.fromARGB(255, 143, 143, 143),
          ),
          controller: controller,
          padding: const MaterialStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 16.0)),
          onTap: () {
            controller.openView();
          },
          onChanged: (_) {
            controller.openView();
          },
          leading: const Icon(Icons.search),
          trailing: <Widget>[
            Tooltip(
              message: 'Change brightness mode',
              child: IconButton(
                isSelected: isDark,
                onPressed: () {
                  setState(() {
                    isDark = !isDark;
                  });
                },
                icon: const Icon(Icons.wb_sunny_outlined),
                selectedIcon: const Icon(Icons.brightness_2_outlined),
              ),
            )
          ],
        );
      }, suggestionsBuilder:
              (BuildContext context, SearchController controller) {
        return List<ListTile>.generate(5, (int index) {
          final String item = 'item $index';
          return ListTile(
            title: Text(item),
            onTap: () {
              setState(() {
                controller.closeView(item);
              });
            },
          );
        });
      }),
    );
  }
}
