import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';

class SaveFolder extends StatefulWidget {
  const SaveFolder({Key? key}) : super(key: key);

  // final String? data;
  // final String? id;

  @override
  State<SaveFolder> createState() => _SaveFolderState();
}

class _SaveFolderState extends State<SaveFolder> {
  final saveBox = Hive.box('transactions');

  // @override
  // void initState() {
  //   super.initState();
  //   saveBox = Hive.box('transactions');
  //   print('saves: ${saveBox.values}');
  // }

  // @override
  // void dispose() {
  //   saveBox.close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // String tweet = widget.data.toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text('save'),
      ),
      body: ValueListenableBuilder(
          valueListenable: Hive.box('transactions').listenable(),
          builder: (context, Box box, _) {
            return ListView.builder(
                itemCount: Hive.box('transactions').length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(
                        Hive.box('transactions').getAt(index),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await Hive.box('transactions').deleteAt(index);
                          print('deleted');
                        },
                        child: const Text('delete'),
                      ),
                    ],
                  );
                });

            //     return

            //   },
            // ),

            // floatingActionButton: FloatingActionButton(
            //   onPressed: () async {
            //     saveBox.add(widget.data);
            //     // await saveBox.put(widget.id, widget.data);
            //   },
            //   child: const Text('save'),
            // ),

            //     Column(
            //   children: [
            //     Text(data),
            //     const SizedBox(
            //       height: 300,
            //     ),
            //     ElevatedButton(
            //       onPressed: () {
            //         print(data);
            //       },
            //       child: const Text('show'),
            //     ),
            //   ],
            // ),
          }),
    );
  }
}
