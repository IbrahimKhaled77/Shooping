import 'package:shopping/models/models_Favortes.dart';
import 'package:shopping/models/modle_login.dart';

abstract class LayoutStates{}

class InitialStates extends LayoutStates{}

class ChangeNavigationBottomStates extends LayoutStates{}

class GetDataHomeLoadingState extends LayoutStates{}

class GetDataHomeSuccessState extends LayoutStates{}

class GetDataHomeErrorState extends LayoutStates{}


class GetGategorLoadingState extends LayoutStates{}

class GetGategorSuccessState extends LayoutStates{}

class GetGategorErrorState extends LayoutStates{}



class PostFavoritesLoadingState extends LayoutStates{}

class PostFavoritesSuccessState extends LayoutStates{
  final ModelChangeFavortes modle;

  PostFavoritesSuccessState(this.modle);
}

class PostFavoritesErrorState extends LayoutStates{}



class GetFavoritesLoadingState extends LayoutStates{}

class GetFavoritesSuccessState extends LayoutStates{}

class GetFavoritesErrorState extends LayoutStates{}




class GetProfileLoadingState extends LayoutStates{}

class GetProfileSuccessState extends LayoutStates{}

class GetProfileErrorState extends LayoutStates{}


class putUpdateLoadingState extends LayoutStates{}

class putUpdateSuccessState extends LayoutStates{
  final ModelsLogin modle;

  putUpdateSuccessState(this.modle);
}

class putUpdateErrorState extends LayoutStates{}



