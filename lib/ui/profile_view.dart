// ignore_for_file: library_private_types_in_public_api

import 'package:example_app/data/models/random_list_model.dart';

import 'package:flutter/material.dart';

class RandomListView extends StatefulWidget {
  final Results? result;
  const RandomListView({
    Key? key,
    this.result,
  }) : super(key: key);

  @override
  _RandomListViewState createState() => _RandomListViewState();
}

class _RandomListViewState extends State<RandomListView> {
  get icon => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            backgroundColor: const Color(0xff2949F0),
            title: Text(widget.result!.name!.first!)),
        body: SafeArea(child: _bodyWidget(context, widget.result!)));
  }

  Widget _bodyWidget(BuildContext context, Results results) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 105,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              ("${results.name!.first} ${results.name!.last}"),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 19),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.call,
                                  size: 15,
                                  color: Color(0xff8E8E8E),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(results.phone!,
                                    style: const TextStyle(
                                        color: Color(0xff8E8E8E),
                                        fontSize: 14)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage: NetworkImage(results.picture!.medium!),
                      radius: 31,
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              tileColor: Colors.white,
              title: Text(
                  'Address - ${results.location!.state},${results.location!.city},${results.location!.postcode}'),
              onTap: () {},
            ),
            ListTile(
              tileColor: Colors.white,
              title: Text('Email - ${results.email}'),
              onTap: () {},
            ),
            ListTile(
              tileColor: Colors.white,
              title: Text('Username - ${results.name!.title}'),
              onTap: () {},
            ),
            ListTile(
              tileColor: Colors.white,
              title: Text('Gender - ${results.gender}'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
