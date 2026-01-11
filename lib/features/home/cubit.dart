import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/resources/dio_helper.dart';
import 'package:final_flutter_project/features/home/state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(): super(HomeInitial());

  void getProducts() async {
    try {
      emit(HomeLoading());
      final productsResponse = await DioHelper.getRequest(
          endPoint: "https://dummyjson.com/products");
      final categoriesResponse = await DioHelper.getRequest(
          endPoint: "https://dummyjson.com/products/categories");
      print(categoriesResponse.data[0]);
      emit(HomeLoaded(productsResponse.data["products"], categoriesResponse.data));
    } catch(e) {
      emit(HomeFailure(e.toString()));
    }
  }
}