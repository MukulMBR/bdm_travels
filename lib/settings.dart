import 'package:flutter/material.dart';
import '../main.dart';
import 'home.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);

  // Define a list of questions and answers
  final List<Map<String, String>> helpDeskData = [
    {
      'question': 'How do I reset my password?',
      'answer': 'To reset your password, go to the login screen and click on the "Forgot password" link.'
    },
    {
      'question': 'How can I update my profile information?',
      'answer': 'To update your profile information, navigate to the Profile section in the app and click on the "Update" button.'
    },
    // Add more questions and answers as needed
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Handle back button press
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Theme',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  const Icon(Icons.lightbulb),
                  const SizedBox(width: 16),
                  Text(
                    MyApp.themeNotifier.value == ThemeMode.light
                        ? 'Light mode'
                        : 'Dark mode',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: Icon(MyApp.themeNotifier.value == ThemeMode.light
                        ? Icons.dark_mode
                        : Icons.light_mode),
                    onPressed: () {
                      MyApp.themeNotifier.value =
                          MyApp.themeNotifier.value == ThemeMode.light
                              ? ThemeMode.dark
                              : ThemeMode.light;
                    },
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Language',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  const Icon(Icons.language),
                  const SizedBox(width: 16),
                  Text(
                    MyApp.languageNotifier.value == 'English'
                        ? 'English'
                        : 'Spanish',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: Icon(Icons.translate),
                    onPressed: () {
                      MyApp.languageNotifier.value =
                          MyApp.languageNotifier.value == 'English'
                              ? 'Spanish'
                              : 'English';
                    },
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Help Desk',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Contact Support'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Help Desk'),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var data in helpDeskData) ...[
                            Text(
                              data['question'] ?? '',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              data['answer'] ?? '',
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Close'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
