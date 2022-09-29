import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsApp/shared/components/components.dart';
import 'package:newsApp/shared/cubit/news_cubit.dart';
import 'package:newsApp/shared/cubit/news_states.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return ConditionalBuilder(
            condition: state is! NewsLoadingState,
            builder: (context) => ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      buildArticleItem(cubit.businessList[index], context),
                  separatorBuilder: (context, index) => listDivider(),
                  itemCount: cubit.businessList.length,
                ),
            fallback: (context) => Center(child: CircularProgressIndicator()));
      },
    );
  }
}
