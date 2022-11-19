import 'package:clean_architecture/presentation/pages/settings/settings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SettingPageState();
  }
}

class SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsVM>(builder: (context, data, child) {
      return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  data.swapTheme();
                },
                icon: const Icon(Icons.add)),
            DropdownButton(
                hint:  Text(data.settingsState.settingLocalizations),
                items: <String>['vi', 'en']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  data.swapLanguage(value!);
                })
          ],
        ),
        body: Column(
          children: [
            Center(
              child: data.settingsState.darkMode
                  ? const Text("aaa")
                  : const Text("bbbbbb"),
            ),
            Text(S.of(context).hello)
          ],
        ),
      );
    });
  }
}
