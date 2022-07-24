import 'dart:async';


import 'package:example_app/bloc/random_list_bloc/random_list_events.dart';
import 'package:example_app/bloc/random_list_bloc/random_list_states.dart';
import 'package:example_app/data/models/random_list_model.dart';
import 'package:example_app/data/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RandomListViewBloc extends Bloc<GetRandomListViewEvent, RandomListViewState> {
  RandomListViewBloc() : super(GetRandomListViewInitial()) {
    on<GetRandomListView>(getRandomListView);
  }

  Future<FutureOr<void>> getRandomListView(
      GetRandomListView event, Emitter<RandomListViewState> emit) async {
    emit(GettingRandomListView());
    RandomListModel randomListModel;

    var url = 'https://randomuser.me/api?results=100';
    randomListModel = await Repository().viewRandomList(url: url);

    emit(RandomListViewSuccess(randomListModel: randomListModel));
  }
}
