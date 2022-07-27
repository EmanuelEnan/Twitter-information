import 'package:flutter/material.dart';
import 'package:twitter_api_1/api_model_pinnedtweet.dart';

import 'package:twitter_api_1/api_service_pinnedtweet.dart';

import 'package:url_launcher/link.dart';

class PinnedTweetInfo extends StatefulWidget {
  PinnedTweetInfo(
      {Key? key, required this.pinnedTweetId, required this.userName})
      : super(key: key);

  String pinnedTweetId;
  String userName;

  @override
  State<PinnedTweetInfo> createState() => _PinnedTweetInfoState();
}

class _PinnedTweetInfoState extends State<PinnedTweetInfo> {
  ApiServicePinnedTweet apiServicePinnedTweet = ApiServicePinnedTweet();

  @override
  void initState() {
    super.initState();
    print('initstate called');
    apiServicePinnedTweet;
  }

  @override
  void dispose() {
    apiServicePinnedTweet;
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
            child: FutureBuilder<List<ApiModelPinnedTweet>>(
              future: apiServicePinnedTweet.getApi(widget.pinnedTweetId),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData) {
                  // var now = snapshot.data![0].data!.createdAt;
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Id: ${snapshot.data![0].data!.id}'),
                        Text('Text: ${snapshot.data![0].data!.text}'),
                        Text(
                            'Who can reply: ${snapshot.data![0].data!.replySettings}'),
                        Text(
                            'Like count: ${snapshot.data![0].data!.publicMetrics!.likeCount}'),
                        Link(
                          target: LinkTarget.blank,
                          uri: Uri.parse(
                              'https://twitter.com/${widget.userName}/status/${snapshot.data![0].data!.conversationId!}'),
                          builder: (context, followLink) => TextButton(
                            onPressed: followLink,
                            child: const Text('go to the tweet'),
                          ),
                        ),
                        //
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
