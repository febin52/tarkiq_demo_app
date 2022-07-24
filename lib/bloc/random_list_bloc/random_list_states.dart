

import 'package:example_app/data/models/random_list_model.dart';

abstract class RandomListViewState {}

class GetRandomListViewInitial extends RandomListViewState {}

class GettingRandomListView extends RandomListViewState {}

class RandomListViewSuccess extends RandomListViewState {
  final RandomListModel? randomListModel;
  RandomListViewSuccess({required this.randomListModel});
}

class RandomListViewError extends RandomListViewState {
  final String error;
  RandomListViewError({required this.error});
}
