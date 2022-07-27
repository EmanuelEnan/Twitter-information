import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

import 'package:twitter_api_1/api_model_recent_search.dart';

import 'package:twitter_api_1/api_service_recent_search.dart';

import 'package:url_launcher/link.dart';

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
                                      //                   Link(
                                      //   target: LinkTarget.blank,
                                      //   uri: Uri.parse(
                                      //       'https://twitter.com/${widget.userName}/status/${snapshot.data![0].data!.conversationId!}'),
                                      //   builder: (context, followLink) => TextButton(
                                      //     onPressed: followLink,
                                      //     child: const Text('go to the tweet'),
                                      //   ),
                                      // ),
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
