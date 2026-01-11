abstract class CategoryItemState {}

class CategoryItemInitial extends CategoryItemState {}
class CategoryProductsLoading extends CategoryItemState {}
class CategoryProductsLoaded extends CategoryItemState {
  final products;
  CategoryProductsLoaded(this.products);
}
class CategoryProductsFailure extends CategoryItemState {
  final errorMessage;
  CategoryProductsFailure(this.errorMessage);
}
