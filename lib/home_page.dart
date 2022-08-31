import 'package:flutter/material.dart';

import 'next_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Twitter username'),
      ),
      body: Container(
        padding: const EdgeInsets.all(25),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
            ),
            const SizedBox(
              height: 9,
            ),
            ElevatedButton(
              onPressed: () {
                var name = _controller.text;

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => NextPage(nameUser: name)),
                  ),
                );
              },
              child: const Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}
