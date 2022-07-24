
import 'package:example_app/bloc/random_list_bloc/random_list_bloc.dart';
import 'package:example_app/bloc/random_list_bloc/random_list_events.dart';
import 'package:example_app/bloc/random_list_bloc/random_list_states.dart';
import 'package:example_app/ui/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class RandomList extends StatefulWidget {
  const RandomList({Key? key}) : super(key: key);

  @override
  State<RandomList> createState() => _RandomListState();
}

class _RandomListState extends State<RandomList> {
  @override
  void initState() {
    BlocProvider.of<RandomListViewBloc>(context).add(GetRandomListView());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text(
              'Home',
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [_categorylist(context)],
            ),
          )),
    );
  }

  Widget _categorylist(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BlocConsumer<RandomListViewBloc, RandomListViewState>(
            builder: (context, state) {
              if (state is RandomListViewSuccess) {
                if (state.randomListModel!.results!.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Center(
                      child: Text("No Items",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600)),
                    ),
                  );
                } else {
                  return Column(
                    children: List.generate(state.randomListModel!.results!.length,
                        (index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: InkWell(
                              child: SizedBox(
                                height: 120,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .55,
                                          child: Text(
                                            state.randomListModel!.results![index]
                                                .name!.first
                                                .toString(),
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            textAlign: TextAlign.start,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: true,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .55,
                                          child: Text(
                                            "Rs.${state.randomListModel!.results![index].email.toString()}",
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                            ),
                                            textAlign: TextAlign.start,
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: true,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .55,
                                          child: Text(
                                            state.randomListModel!.results![index]
                                                .gender
                                                .toString(),
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                            ),
                                            textAlign: TextAlign.start,
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: true,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Column(
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(12)),
                                              child: SizedBox(
                                                height: 90,
                                                width: 90,
                                                child: Image.network(
                                                  state
                                                      .randomListModel!
                                                      .results![index]
                                                      .picture!.medium!,
                                                  height: 90,
                                                  width: 90,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => RandomListView(
                                              result: state.randomListModel!
                                                  .results![index],
                                            ))));
                              },
                            ),
                          ),
                          const Divider(
                            endIndent: 0,
                            indent: 0,
                          )
                        ],
                      );
                    }),
                  );
                }
              } else {
                return Shimmer.fromColors(
                    direction: ShimmerDirection.rtl,
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(12)),
                                        child: Container(
                                          width: 90.0,
                                          height: 90.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8),
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(12)),
                                              child: Container(
                                                width: 240,
                                                height: 20.0,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8),
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(12)),
                                              child: Container(
                                                width: 200,
                                                height: 20.0,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8),
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(12)),
                                              child: Container(
                                                width: 150,
                                                height: 20.0,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ]),
                          );
                        }));
              }
            },
            listener: (context, state) {}),
        const SizedBox(
          height: 80,
        )
      ],
    );
  }
}
