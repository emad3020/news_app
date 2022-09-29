import 'package:flutter/material.dart';
import 'package:newsApp/modules/news_details/news_details_screen.dart';

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType inputType,
  required FormFieldValidator<String> validator,
  required String hintText,
  bool isPassword = false,
  bool focusInTouchMode = false,
  Widget? prefixIcon,
  IconData? suffixIcon,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onTextChanged,
  Function()? onSuffixPressed,
  Function()? onTap,
}) =>
    TextFormField(
        validator: validator,
        controller: controller,
        readOnly: focusInTouchMode,
        decoration: InputDecoration(
          labelText: hintText,
          border: OutlineInputBorder(),
          prefixIcon: prefixIcon != null ? prefixIcon : null,
          suffixIcon: suffixIcon != null
              ? IconButton(
                  onPressed: onSuffixPressed,
                  icon: Icon(suffixIcon),
                )
              : null,
        ),
        keyboardType: inputType,
        obscureText: isPassword,
        onFieldSubmitted: onSubmit,
        onChanged: onTextChanged,
        onTap: onTap);

Widget buildArticleItem(articles, context) {
  String? url = articles['urlToImage'];
  return InkWell(
    onTap: () {
      print('Item clicked');
      navigateTo(
          context, NewsDetailsScreen(articles['title'], articles['url']));
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: url != null
                    ? DecorationImage(
                        image: NetworkImage(url), fit: BoxFit.cover)
                    : DecorationImage(
                        image:
                            AssetImage('assets/images/placeholder_image.jpg'),
                        fit: BoxFit.cover)),
          ),
          SizedBox(width: 20.0),
          Expanded(
            child: Container(
              height: 120.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${articles['title']}',
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${articles['publishedAt']}',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget listDivider() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        height: 1,
        width: double.infinity,
        color: Colors.grey[300],
      ),
    );

void navigateTo(context, destination) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => destination),
    );
