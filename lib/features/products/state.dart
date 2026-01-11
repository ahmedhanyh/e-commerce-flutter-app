abstract class ProductsState {}

class ProductsInitial extends ProductsState {}
class ProductsLoading extends ProductsState {}
class ProductsLoaded extends ProductsState {
  final products;
  ProductsLoaded(this.products);
}
class ProductsFailure extends ProductsState {
  final errorMessage;
  ProductsFailure(this.errorMessage);
}
