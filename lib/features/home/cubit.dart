import 'package:final_flutter_project/core/resources/app_endpoints.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/resources/dio_helper.dart';
import 'package:final_flutter_project/features/home/state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void getProducts() async {
    try {
      emit(HomeLoading());
      final productsResponse = await DioHelper.getRequest(
        endPoint: AppEndpoints.allProducts,
      );
      final categoriesResponse = await DioHelper.getRequest(
        endPoint: AppEndpoints.allCategories,
      );
      emit(
        HomeLoaded(productsResponse.data["products"], categoriesResponse.data),
      );
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }
}
