import 'package:carousel_slider/carousel_slider.dart';
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
        var usData = NewsCubit.get(context).usData;

        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CarouselSlider(
                items: List.generate(
                  usData.length,
                  (index) => InkWell(
                    onTap: (() {
                      navigatTO(context, WebViewScreen(usData[index]['url']));
                    }),
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        usData[index]['urlToImage'] != null
                            ? SizedBox(
                                height: 400,
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        '${usData[index]['urlToImage']}'),
                                  ),
                                ),
                              )
                            : const SizedBox(
                                height: 400,
                                width: double.infinity,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Image(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage('assets/images/noimage.png'),
                                  ),
                                ),
                              ),
                        Container(
                          color: AppModeCubit.get(context).isDark
                              ? Colors.black
                              : Colors.white,
                          child: Text(
                            '${usData[index]['title']}',
                            style: TextStyle(
                              color: AppModeCubit.get(context).isDark
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                options: CarouselOptions(
                  height: 350,
                  enableInfiniteScroll: true,
                  viewportFraction: 0.8,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayAnimationDuration: const Duration(
                    seconds: 2,
                  ),
                ),
              ),
              Container(
                color: Colors.grey,
                child: const SizedBox(
                  height: 1,
                  width: double.infinity,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                child: Text(
                  '     Business',
                  style: TextStyle(
                    color: AppModeCubit.get(context).isDark
                        ? Colors.white
                        : Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Flexible(child: articalBuilder(list, context, style)),
            ],
          ),
        );
      },
    );
  }
}
