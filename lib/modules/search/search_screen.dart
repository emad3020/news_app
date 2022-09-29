import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsApp/shared/components/components.dart';
import 'package:newsApp/shared/cubit/news_cubit.dart';
import 'package:newsApp/shared/cubit/news_states.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultTextFormField(
                    onTextChanged: (value) {
                      cubit.searchNews(searchKey: value);
                    },
                    controller: searchController,
                    inputType: TextInputType.text,
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Enter a search word';
                      }
                      return null;
                    },
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search News'),
              ),
              Expanded(
                child: ConditionalBuilder(
                  condition: cubit.searchList.length > 0,
                  builder: (context) => ListView.separated(
                      itemBuilder: (context, index) =>
                          buildArticleItem(cubit.searchList[index], context),
                      separatorBuilder: (context, index) => listDivider(),
                      itemCount: cubit.searchList.length),
                  fallback: (context) => cubit.searchList.length > 0
                      ? Center(child: CircularProgressIndicator())
                      : Container(),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
