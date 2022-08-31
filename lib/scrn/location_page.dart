import 'package:flutter/material.dart';
import 'package:twitter_api_1/api_model_location.dart';
import 'package:twitter_api_1/api_service_location.dart';
import 'package:twitter_api_1/location_page1.dart';

class LocationPage extends StatefulWidget {
  LocationPage({Key? key, required this.id}) : super(key: key);

  int id;

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  ApiServiceLocation apiServiceLocation = ApiServiceLocation();

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
              future: apiServiceLocation.getApi(widget.id),
              builder: (context, AsyncSnapshot<ApiModelLoc> snapshot) {
                if (snapshot.hasData &&
                    snapshot.data!.meta!.resultCount! >= 100) {
                  return CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        floating: false,
                        expandedHeight: 60,
                        leadingWidth: MediaQuery.of(context).size.width,
                        backgroundColor: Colors.white,
                        flexibleSpace: FlexibleSpaceBar(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LocationPage1(
                                          id: widget.id,
                                          token:
                                              snapshot.data!.meta!.nextToken!),
                                    ),
                                  );
                                },
                                child: const Text('next page'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return Column(
                              children: [
                                Card(
                                  child: ListTile(
                                    title: Text(
                                        'name: ${snapshot.data!.data![index].name}'),
                                    subtitle: Text(
                                        'location: ${snapshot.data!.data![index].location}'),
                                  ),
                                ),
                                // Text(snapshot.data!.data![index].publicMetrics!
                                //     .followersCount
                                //     .toString()),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  );
                  // return ListView.builder(
                  //   itemCount: snapshot.data!.data!.length,
                  //   itemBuilder: (context, index) {
                  //     return Column(
                  //       children: [
                  //         Card(
                  //           child: Column(
                  //             children: [
                  //               Text(
                  //                   'name: ${snapshot.data!.data![index].name}'),
                  //               Text(
                  //                   'location: ${snapshot.data!.data![index].location}'),
                  //               Text(
                  //                   'Profile metrics: ${snapshot.data!.data![index].publicMetrics!.followersCount}'),

                  //               // ElevatedButton(
                  //               //   onPressed: () {
                  //               //     if (snapshot.data!.meta!.resultCount! ==
                  //               //         100) {
                  //               //       print('more values');
                  //               //     }
                  //               //   },
                  //               //   child: const Text('more'),
                  //               // ),
                  //             ],
                  //           ),
                  //         ),
                  //         // Text(snapshot.data!.meta!.nextToken!),
                  //       ],
                  //     );
                  //   },
                  // );
                } else if (snapshot.hasData) {
                  return CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        floating: false,
                        expandedHeight: 60,
                        leadingWidth: MediaQuery.of(context).size.width,
                        backgroundColor: Colors.white,
                        flexibleSpace: FlexibleSpaceBar(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Your followers count: ${snapshot.data!.meta!.resultCount}',
                                style: const TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return Column(
                              children: [
                                Card(
                                  child: ListTile(
                                    title: Text(
                                        'name: ${snapshot.data!.data![index].name}'),
                                    subtitle: Text(
                                        'location: ${snapshot.data!.data![index].location}'),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
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
