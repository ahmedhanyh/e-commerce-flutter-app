import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_flutter_project/features/category_item/state.dart';

import '../../core/resources/dio_helper.dart';

class CategoryItemCubit extends Cubit<CategoryItemState> {
  CategoryItemCubit(): super(CategoryItemInitial());

  void getCategoryProducts(endpoint) async {
    try {
      emit(CategoryProductsLoading());
      final productsResponse = await DioHelper.getRequest(
          endPoint: endpoint);
      emit(CategoryProductsLoaded(productsResponse.data["products"]));
    } catch(e) {
      emit(CategoryProductsFailure(e.toString()));
    }
  }
}