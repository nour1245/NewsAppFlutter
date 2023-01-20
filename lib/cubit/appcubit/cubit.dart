import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/apikey.dart';
import 'package:news_app/cubit/appcubit/states.dart';
import 'package:news_app/modules/newsscreen/business_screen.dart';
import 'package:news_app/modules/newsscreen/science_screen.dart';
import 'package:news_app/modules/newsscreen/sports_screen.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(InitState());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  //bottom nav bar items setup
  List<BottomNavigationBarItem> bottomNavBarItems = [
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.business,
        ),
        label: 'Business'),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Sciences',
    ),
  ];

  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
  ];

  void navBottomChanged(index) {
    currentIndex = index;
    emit(BottomNavState());
  }

  List business = [];
  List sports = [];
  List sciences = [];
  List search = [];

//business Data loading
  void getBusiness() {
    emit(BusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': apiKey,
      },
    ).then((value) {
      business = value.data['articles'];
      emit(BusinessLoadedSuccessState());
    }).catchError((error) {
      emit(BusinessErrorState(error.toString()));
    });
  }

//sports data loading
  void getsports() {
    emit(SportLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': apiKey,
      },
    ).then((value) {
      sports = value.data['articles'];

      emit(SportLoadedSuccessState());
    }).catchError((error) {
      emit(SportErrorState(error.toString()));
    });
  }

  //sceince data loading
  void getscience() {
    emit(ScienceLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': apiKey,
      },
    ).then((value) {
      sciences = value.data['articles'];

      emit(ScienceLoadedSuccessState());
    }).catchError((error) {
      emit(ScienceErrorState(error.toString()));
    });
  }

  void getSearch(value) {
    emit(SearchLoadingState());
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '$value',
        'apiKey': apiKey,
      },
    ).then((value) {
      search = value.data['articles'];

      emit(SearchLoadedSuccessState());
    }).catchError((error) {
      emit(SearchErrorState(error.toString()));
    });
  }
}
