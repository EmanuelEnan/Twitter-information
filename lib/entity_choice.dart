import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:twitter_api_1/api_model_entity_choice.dart';
import 'package:twitter_api_1/api_service_entity_choice.dart';

class EntityChoice extends StatefulWidget {
  const EntityChoice({Key? key}) : super(key: key);

  @override
  State<EntityChoice> createState() => _EntityChoiceState();
}

class _EntityChoiceState extends State<EntityChoice> {
  ApiServiceEntityChoice apiServiceEntityChoice = ApiServiceEntityChoice();

  @override
  void initState() {
    apiServiceEntityChoice;
    super.initState();
  }

  @override
  void dispose() {
    apiServiceEntityChoice;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('entity'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: FutureBuilder<List<ApiModelEntityChoice>>(
              future: apiServiceEntityChoice.getApi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData) {
                  // var now = snapshot.data![0].data!.createdAt;
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: ((context, index) {
                        return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data![index].data!.length,
                            itemBuilder: ((context, index1) {
                              // if (snapshot
                              //         .data![index]
                              //         .data![index1]
                              //         .contextAnnotations![index]
                              //         .entity!
                              //         .name ==
                              //     "Actor") {
                                return SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Card(
                                    child: Column(
                                      children: [
                                        Text(snapshot
                                            .data![index].data![index1].text!),
                                      ],
                                    ),
                                  ),
                                );
                              // } else {
                              //   const Text('no value');
                              // }
                              // return const Text('none');
                            }));
                      }),
                    ),
                  );
                }

                return const Center(
                  child: Text('Loading..'),
                );
              },
            ),
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(builder: (context) => NewPage()),
          //     );
          //   },
          //   child: const Text('copy the id value and go to next page'),
          // ),
          // const SizedBox(
          //   height: 25,
          // ),
        ],
      ),
    );
  }
}
