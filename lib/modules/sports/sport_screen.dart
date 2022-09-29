import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsApp/shared/components/components.dart';
import 'package:newsApp/shared/cubit/news_cubit.dart';
import 'package:newsApp/shared/cubit/news_states.dart';

class SportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = NewsCubit.get(context);
    return BlocConsumer<NewsCubit, NewsAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
            condition: cubit.sportsList.length > 0,
            builder: (context) => ListView.separated(
                  itemBuilder: (context, index) =>
                      buildArticleItem(cubit.sportsList[index], context),
                  separatorBuilder: (context, index) => listDivider(),
                  physics: BouncingScrollPhysics(),
                  itemCount: cubit.sportsList.length,
                ),
            fallback: (context) => Center(child: CircularProgressIndicator()));
      },
    );
  }
}
