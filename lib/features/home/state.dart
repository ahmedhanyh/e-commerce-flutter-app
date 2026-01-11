abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}
class HomeLoaded extends HomeState {
  final products;
  final categories;
  HomeLoaded(this.products, this.categories);
}
class HomeFailure extends HomeState {
  final errorMessage;
  HomeFailure(this.errorMessage);
}
