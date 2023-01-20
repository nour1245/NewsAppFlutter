import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/appcubit/cubit.dart';
import 'package:news_app/cubit/appcubit/states.dart';
import 'package:news_app/shared/components/components.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var style = Theme.of(context).textTheme.bodyText1;
        var list = NewsCubit.get(context).business;
        return articalBuilder(list, context, style);
      },
    );
  }
}
