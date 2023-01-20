import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/appcubit/cubit.dart';
import 'package:news_app/cubit/appcubit/states.dart';
import '../../shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  final searchController = TextEditingController();

  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var style = Theme.of(context).textTheme.bodyText1;
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: DefultTFF(
                  style: Theme.of(context).textTheme.subtitle1,
                  onchange: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                  controrller: searchController,
                  keyboardtype: TextInputType.text,
                  label: 'search',
                  prefix: Icons.search,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'search cant be empty';
                    }
                    return null;
                  },
                ),
              ),
              Expanded(
                  child: articalBuilder(
                list,
                context,
                style,
                isSearch: true,
              )),
            ],
          ),
        );
      },
    );
  }
}
