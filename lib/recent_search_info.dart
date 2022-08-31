import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:intl/intl.dart';

import 'package:twitter_api_1/api_model_recent_search.dart';

import 'package:twitter_api_1/api_service_recent_search.dart';

import 'package:url_launcher/link.dart';

import 'save_folder.dart';

class RecentSearchInfo extends StatefulWidget {
  RecentSearchInfo({Key? key, required this.searchInfo}) : super(key: key);

  String searchInfo;

  @override
  State<RecentSearchInfo> createState() => _RecentSearchInfoState();
}

class _RecentSearchInfoState extends State<RecentSearchInfo> {
  ApiServiceRecentSearch apiServiceRecentSearch = ApiServiceRecentSearch();

  @override
  void initState() {
    super.initState();
    print('initstate called');
    apiServiceRecentSearch;
  }

  @override
  void dispose() {
    apiServiceRecentSearch;
    print('dispose used');
    super.dispose();
  }

  final myBox = Hive.box('transactions');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('result'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: FutureBuilder<List<ApiModelRecentSearch>>(
              future: apiServiceRecentSearch.getApi(widget.searchInfo),
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
                              return SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Card(
                                  child: Column(
                                    children: [
                                      Text(
                                          'Tweet created at: ${DateFormat('yyyy-MM-dd KK:mm:ss a').format(DateTime.parse(snapshot.data![index].data![index1].createdAt!)).toString()}'),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                          'Tweet: ${snapshot.data![index].data![index1].text!}'),
                                      Link(
                                        target: LinkTarget.blank,
                                        uri: Uri.parse(
                                            'https://twitter.com/${snapshot.data![index].includes!.users![index].username}/status/${snapshot.data![index].data![index1].conversationId!}'),
                                        builder: (context, followLink) =>
                                            TextButton(
                                          onPressed: followLink,
                                          child: const Text('go to the tweet'),
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          var data = snapshot
                                              .data![index].data![index1].text!;

                                          // var id = snapshot
                                          //     .data![index].data![index1].id!;

                                          // myBox.add(data);
                                          Hive.box('transactions').add(data);

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const SaveFolder(),
                                            ),
                                          );
                                        },
                                        child: const Text('save the tweet'),
                                      ),
                                    ],
                                  ),
                                ),
                              );
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
