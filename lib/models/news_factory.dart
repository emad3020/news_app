import 'package:dio/dio.dart';
import 'package:newsApp/models/news_type.dart';
import 'package:newsApp/shared/network/remote/dio_helper.dart';

abstract class News {
  factory News({required NewsType type, String? searchKey}) {
    switch (type) {
      case NewsType.business:
        return BussniessNews();
      case NewsType.sports:
        return SportsNews();
      case NewsType.science:
        return ScienceNews();
      case NewsType.search:
        return SearchNews(searchKey: searchKey);
    }
  }

  Future<Response?> getData();
}

class BussniessNews implements News {
  @override
  Future<Response?> getData() async {
    return DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '241380e680fd457ca28ec918ee92e1b8',
      },
    );
  }
}

class SportsNews implements News {
  @override
  Future<Response?> getData() async {
    return DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '241380e680fd457ca28ec918ee92e1b8'
      },
    );
  }
}

class ScienceNews implements News {
  @override
  Future<Response?> getData() async {
    return DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '241380e680fd457ca28ec918ee92e1b8'
      },
    );
  }
}

class SearchNews implements News {
  final String? searchKey;
  SearchNews({this.searchKey});

  @override
  Future<Response?> getData() async {
    return DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '$searchKey',
        'apiKey': '241380e680fd457ca28ec918ee92e1b8',
      },
    );
  }
}
