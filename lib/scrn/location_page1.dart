import 'package:flutter/material.dart';
import 'package:twitter_api_1/api_model_location.dart';

import 'package:twitter_api_1/api_service_location1.dart';

class LocationPage1 extends StatefulWidget {
  LocationPage1({Key? key, required this.id, required this.token})
      : super(key: key);

  int id;
  String token;

  @override
  State<LocationPage1> createState() => _LocationPage1State();
}

class _LocationPage1State extends State<LocationPage1> {
  ApiServiceLocation1 apiServiceLocation1 = ApiServiceLocation1();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('data'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: apiServiceLocation1.getApi1(widget.id, widget.token),
              builder: (context, AsyncSnapshot<ApiModelLoc> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Card(
                            child: Column(
                              children: [
                                Text(
                                    'name: ${snapshot.data!.data![index].name}'),
                                Text(
                                    'location: ${snapshot.data!.data![index].location}'),
                                Text(
                                    'Follower count: ${snapshot.data!.data![index].publicMetrics!.followersCount}'),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                } else if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
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
    );
  }
}
