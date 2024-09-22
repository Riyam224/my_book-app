import 'package:my_book/core/errors/failures.dart';

import '../models/books/books.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<Books>>> fetchNewestBooks();
}
