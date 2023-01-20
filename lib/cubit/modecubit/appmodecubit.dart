import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/modecubit/modestates.dart';
import 'package:news_app/cubit/appcubit/states.dart';
import 'package:news_app/shared/network/local/cash_helper.dart';

class AppModeCubit extends Cubit<ModeStates> {
  AppModeCubit() : super(initModeState());
  static AppModeCubit get(context) => BlocProvider.of(context);

  bool isDark = false;
  changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
    } else {
      isDark = !isDark;
      ChachHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(ModeState());
      });
    }
  }
}
