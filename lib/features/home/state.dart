abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}
class HomeLoaded extends HomeState {
  final products;
  HomeLoaded(this.products);
}
class HomeFailure extends HomeState {
  final errorMessage;
  HomeFailure(this.errorMessage);
}
