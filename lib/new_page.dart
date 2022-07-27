import 'package:flutter/material.dart';

import 'location_page.dart';

class NewPage extends StatelessWidget {
  NewPage({Key? key}) : super(key: key);

  final TextEditingController _locController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('data'),
      ),
      body: Column(
        children: [
          const Text('Put id below to get the followers locations'),
          TextField(
            controller: _locController,
          ),
          ElevatedButton(
            onPressed: () {
              var id = int.parse(_locController.text);

              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => LocationPage(id: id)),
              );
            },
            child: const Text('search'),
          ),
        ],
      ),
    );
  }
}
