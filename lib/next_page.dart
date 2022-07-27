import 'package:flutter/material.dart';

import 'package:twitter_api_1/api_service.dart';
import 'package:twitter_api_1/location_page.dart';
import 'package:twitter_api_1/new_page.dart';
import 'package:intl/intl.dart';
import 'package:twitter_api_1/pinned_tweet_info.dart';

import 'api_model.dart';

class NextPage extends StatefulWidget {
  NextPage({Key? key, required this.nameUser}) : super(key: key);

  String nameUser;

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    print('initstate called');
    apiService;
  }

  @override
  void dispose() {
    apiService;
    print('dispose used');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('result'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: FutureBuilder<List<ApiModel>>(
                future: apiService.getApi(widget.nameUser),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData) {
                    var now = snapshot.data![0].data!.createdAt;
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          SelectableText('Id: ${snapshot.data![0].data!.id}'),
                          Text('Name: ${snapshot.data![0].data!.name}'),
                          Text('Username: ${snapshot.data![0].data!.username}'),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'Account Information',
                            style: TextStyle(fontSize: 22),
                          ),
                          Text(
                              'Followers count: ${snapshot.data![0].data!.publicMetrics?.followersCount}'),
                          Text(
                              'Following count: ${snapshot.data![0].data!.publicMetrics?.followingCount}'),
                          Text(
                              'Tweet count: ${snapshot.data![0].data!.publicMetrics?.tweetCount}'),
                          Text(
                              'Created at: ${DateFormat('yyyy-MM-dd KK:mm:ss a').format(DateTime.parse(now!)).toString()}'),
                          Text(
                              'Description: ${snapshot.data![0].data!.description}'),
                          Text(
                              'Profile image: ${snapshot.data![0].data!.profileImageUrl}'),
                          Text('Location: ${snapshot.data![0].data!.location}'),
                          Text(
                              'Protected: ${snapshot.data![0].data!.protected}'),
                          // Text(
                          //     'URL: ${snapshot.data![0].data!.entities!.url!.urls![0].displayUrl}'),
                          Text('Verified: ${snapshot.data![0].data!.verified}'),
                          Text(
                              'Pinned tweet: ${snapshot.data![0].data!.pinnedTweetId}'),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (snapshot.data![0].data!.pinnedTweetId ==
                                  'No pinned tweet in this account') {
                                print('none');
                                showDialog(
                                  context: context,
                                  builder: (context) => const AlertDialog(
                                    title: Text('No data'),
                                  ),
                                );
                              } else if (snapshot
                                      .data![0].data!.pinnedTweetId !=
                                  'No pinned tweet in this account') {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PinnedTweetInfo(
                                          pinnedTweetId: snapshot
                                              .data![0].data!.pinnedTweetId!, userName: snapshot.data![0].data!.username!,),
                                    ));
                              }
                            },
                            child: Text(snapshot.data![0].data!.pinnedTweetId ==
                                    'No pinned tweet in this account'
                                ? 'No pinned tweet'
                                : 'Get tweet info'),
                          ),
                        ],
                      ),
                    );
                  }

                  return const Center(
                    child: Text('Loading..'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
