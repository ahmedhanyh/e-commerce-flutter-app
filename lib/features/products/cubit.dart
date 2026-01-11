import 'package:final_flutter_project/core/resources/app_endpoints.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_flutter_project/features/products/state.dart';
import '../../core/resources/dio_helper.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(): super(ProductsInitial());

  void getProducts() async {
    try {
      emit(ProductsLoading());
      final response = await DioHelper.getRequest(
          endPoint: "https://api.escuelajs.co/api/v1/products");
      emit(ProductsLoaded(response.data));
    } catch(e) {
      emit(ProductsFailure(e.toString()));
    }
  }
}