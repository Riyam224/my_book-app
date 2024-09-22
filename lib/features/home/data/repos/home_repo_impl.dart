import 'package:dartz/dartz.dart';
import 'package:my_book/core/errors/failures.dart';
import 'package:my_book/features/home/data/models/books/books.dart';
import 'package:my_book/features/home/data/repos/api_service.dart';
import 'package:my_book/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  HomeRepoImpl(this.apiService);

  Future<Either<Failures, List<Books>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
          endPoints:
              'volumes?Filtering=free-ebooks&q=subject:Programming&Sorting=newest');
      List<Books> books = [];
      for (var item in data['items']) {
        books.add(Books.fromJson(item));
      }
      return right(books);
    } catch (e) {
      return left(ServerFailure());
    }
  }
}
