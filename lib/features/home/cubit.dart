import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/resources/dio_helper.dart';
import 'package:final_flutter_project/features/home/state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(): super(HomeInitial());

  void getProducts() async {
    try {
      emit(HomeLoading());
      final productsResponse = await DioHelper.getRequest(
          endPoint: "https://api.escuelajs.co/api/v1/products");
      // final categoriesResponse = await DioHelper.getRequest(
      //     endPoint: "https://api.escuelajs.co/api/v1/categories");
      emit(HomeLoaded(productsResponse.data));
    } catch(e) {
      emit(HomeFailure(e.toString()));
    }
  }
}