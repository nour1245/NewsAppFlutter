import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/cubit/appcubit/cubit.dart';
import 'package:news_app/modules/web_view_screen.dart';

Widget buildArticalItem(article, context, TextStyle style) => InkWell(
      onTap: (() {
        navigatTO(context, WebViewScreen(article['url']));
      }),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: article['urlToImage'] != null
                      ? NetworkImage('${article['urlToImage']}')
                      : const AssetImage('assets/images/noimage.png')
                          as ImageProvider,
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: SizedBox(
                height: 120.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']} ',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: style,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 10.0,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget articalBuilder(list, context, TextStyle? style, {isSearch = false}) =>
    ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: NewsCubit.get(context).sports.length,
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return buildArticalItem(list[index], context, style!);
        },
      ),
      fallback: (context) => isSearch
          ? Container()
          : const Center(child: CircularProgressIndicator()),
    );

Widget DefultTFF({
  required TextEditingController controrller,
  required String label,
  required IconData prefix,
  required TextInputType keyboardtype,
  required Function validate,
  bool isPassword = false,
  IconData? suffix,
  Function? ontap,
  Function? onchange,
  Function? onfield,
  Function? onsubmit,
  Function? suffixpresed,
  isclickable = true,
  var style,
}) =>
    TextFormField(
      style: style,
      enabled: isclickable,
      onChanged: onchange != null
          ? (value) {
              onchange(value);
            }
          : null,
      onTap: ontap != null
          ? () {
              ontap();
            }
          : null,
      onFieldSubmitted: onsubmit != null ? (value) => onsubmit() : null,
      obscureText: isPassword,
      controller: controrller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(suffix),
                onPressed: () {
                  suffixpresed!();
                },
              )
            : null,
      ),
      keyboardType: keyboardtype,
      validator: (value) {
        return validate(value);
      },
    );

void navigatTO(context, Widget) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Widget,
    ),
  );
}
