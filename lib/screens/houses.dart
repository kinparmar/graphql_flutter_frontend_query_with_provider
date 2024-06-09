import 'package:flutter/material.dart';
import '../providers/get_houses_provider.dart';

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isFetched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avilable Houses'),
      ),
      body: Consumer<GetHousesProviders>(builder: (context, task, child) {
        if (isFetched == false) {
          ///Fetch the data
          task.getHouses(true);

          Future.delayed(const Duration(seconds: 3), () => isFetched = true);
        }
        return RefreshIndicator(
          onRefresh: () {
             task.getHouses(false);
            return Future.delayed(const Duration(seconds: 3));
          },
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(20),
                        child: const Text("Available houses"),
                      ),
                      if (task.getResponseData().isEmpty)
                        const Text('No houses found'),
                        Expanded(
                          child: ListView(
                        children: List.generate(task.getResponseData().length,
                            (index) {
                          final data = task.getResponseData()[index];
                          return ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            title: Text(data['address']),
                            subtitle: Text(data['description'].toString()),
                            leading: CircleAvatar(
                              backgroundColor: Colors.grey,
                              child: Text(data['id'].toString()),
                            ),
                          );
                        }),
                      )), 
                      const SizedBox(height: 150),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
