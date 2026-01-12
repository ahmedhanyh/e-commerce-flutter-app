import 'package:final_flutter_project/core/resources/dio_helper.dart';
import 'package:final_flutter_project/features/search/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  TextEditingController searchController = TextEditingController();

  void getResults() async {
    emit(GettingResults());
    final response = await DioHelper.getRequest(endPoint: "https://dummyjson.com/products/search?q=${searchController.text}");
    emit(ResultsObtained(response.data["products"]));
  }
}
