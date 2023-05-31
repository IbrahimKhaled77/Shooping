import 'package:shopping/models/model_search.dart';
import 'package:shopping/models/modle_login.dart';

abstract class SearchStates {}


class InitSearchState extends SearchStates{}

class SearchLoadingSearchState extends SearchStates{}

class SearchSuccessSearchState extends SearchStates{
  final SearchModlesSCreeen model;

  SearchSuccessSearchState(this.model);
}

class SearchErrorSearchState extends SearchStates {
  final String Error;

  SearchErrorSearchState(this.Error);

}
