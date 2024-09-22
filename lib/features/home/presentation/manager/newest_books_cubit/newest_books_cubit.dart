import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_book/features/home/data/repos/home_repo.dart';

import '../../../data/models/books/books.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await homeRepo.fetchNewestBooks();
    result.fold((Failures) {
      emit(NewestBooksFailure(Failures.errMessage));
    }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }
}
