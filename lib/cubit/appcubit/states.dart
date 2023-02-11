abstract class NewsStates {}

class InitState extends NewsStates {}

class BottomNavState extends NewsStates {}

class BusinessLoadingState extends NewsStates {}

class BusinessLoadedSuccessState extends NewsStates {}

class BusinessErrorState extends NewsStates {
  final String error;
  BusinessErrorState(this.error);
}

class SportLoadingState extends NewsStates {}

class SportLoadedSuccessState extends NewsStates {}

class SportErrorState extends NewsStates {
  final String error;
  SportErrorState(this.error);
}

class ScienceLoadingState extends NewsStates {}

class ScienceLoadedSuccessState extends NewsStates {}

class ScienceErrorState extends NewsStates {
  final String error;
  ScienceErrorState(this.error);
}

class SearchLoadingState extends NewsStates {}

class SearchLoadedSuccessState extends NewsStates {}

class SearchErrorState extends NewsStates {
  final String error;
  SearchErrorState(this.error);
}

class AllBusinessLoadingState extends NewsStates {}

class AllBusinessLoadedSuccessState extends NewsStates {}

class AllBusinessErrorState extends NewsStates {
  final String error;
  AllBusinessErrorState(this.error);
}

class AllSportsLoadingState extends NewsStates {}

class AllSportsLoadedSuccessState extends NewsStates {}

class AllSportsErrorState extends NewsStates {
  final String error;
  AllSportsErrorState(this.error);
}

class AllScienceLoadingState extends NewsStates {}

class AllScienceLoadedSuccessState extends NewsStates {}

class AllScienceErrorState extends NewsStates {
  final String error;
  AllScienceErrorState(this.error);
}

class DATALoadingState extends NewsStates {}

class DATALoadedSuccessState extends NewsStates {}

class DATAErrorState extends NewsStates {
  final String error;
  DATAErrorState(this.error);
}
