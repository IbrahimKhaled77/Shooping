abstract class NewsAppStates {}

class NewsAppInitialStates extends NewsAppStates{}

class NewsAppChangeBottomBarStates extends NewsAppStates{}


class NewsAppGetDataSuccessAllStates extends NewsAppStates{}


class NewsAppGetDataBusinessLoadingStates extends NewsAppStates{}

class NewsGetDataBusinessSuccessStates extends NewsAppStates{}

class NewsGetDataBusinessErrorStates extends NewsAppStates{
  final String error;

  NewsGetDataBusinessErrorStates(this.error);
}

class NewsAppGetDataBusinessArbicLoadingStates extends NewsAppStates{}

class NewsGetDataBusinessArbicSuccessStates extends NewsAppStates{}

class NewsGetDataBusinessArbicErrorStates extends NewsAppStates{
  final String error;

  NewsGetDataBusinessArbicErrorStates(this.error);
}


class NewsAppGetDataSportLoadingStates extends NewsAppStates{}

class NewsGetDataSportSuccessStates extends NewsAppStates{}

class NewsGetDataSportErrorStates extends NewsAppStates{
  final String error;

  NewsGetDataSportErrorStates(this.error);
}

class NewsAppGetDataSportArbicLoadingStates extends NewsAppStates{}

class NewsGetDataSportArbicSuccessStates extends NewsAppStates{}

class NewsGetDataSportArbicErrorStates extends NewsAppStates{
  final String error;

  NewsGetDataSportArbicErrorStates(this.error);
}

class NewsAppGetDataScienceLoadingStates extends NewsAppStates{}

class NewsGetDataSuccessScienceStates extends NewsAppStates{}

class NewsGetDataErrorScienceStates extends NewsAppStates{
  final String error;

  NewsGetDataErrorScienceStates(this.error);
}

class NewsAppGetDataScienceArbicLoadingStates extends NewsAppStates{}

class NewsGetDataSuccessScienceArbicStates extends NewsAppStates{}

class NewsGetDataErrorScienceArbicStates extends NewsAppStates{
  final String error;

  NewsGetDataErrorScienceArbicStates(this.error);
}


class NewsGetDataSuccessChangeModeStates extends NewsAppStates{}

class NewsGetDataSuccessChangeLanguageStates extends NewsAppStates{}

class NewsGetDataSuccessChangeDarkModeStates extends NewsAppStates{}


class NewsAppGetDataSearchLoadingStates extends NewsAppStates{}

class NewsGetDataSearchSuccessStates extends NewsAppStates{}

class NewsGetDataSearchErrorStates extends NewsAppStates{
  final String error;

  NewsGetDataSearchErrorStates(this.error);
}




