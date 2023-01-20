import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/modecubit/appmodecubit.dart';
import 'package:news_app/cubit/appcubit/cubit.dart';
import 'package:news_app/cubit/appcubit/states.dart';
import 'package:news_app/modules/searchscreen/search_screen.dart';
import 'package:news_app/shared/components/components.dart';

class NewsLayout extends StatefulWidget {
  const NewsLayout({super.key});

  @override
  State<NewsLayout> createState() => _NewsLayoutState();
}

class _NewsLayoutState extends State<NewsLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        var isDark = AppModeCubit.get(context).isDark;
        Icon darkIcon = Icon(Icons.dark_mode);
        Icon lightIcon = Icon(Icons.sunny);
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  navigatTO(
                    context,
                    SearchScreen(),
                  );
                },
                icon: const Icon(Icons.search),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {});
                    AppModeCubit.get(context).changeAppMode();
                  },
                  icon: isDark ? lightIcon : darkIcon),
            ],
            title: const Text('Trending News'),
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomNavBarItems,
            currentIndex: cubit.currentIndex,
            onTap: ((index) {
              cubit.navBottomChanged(index);
            }),
          ),
        );
      },
    );
  }
}
