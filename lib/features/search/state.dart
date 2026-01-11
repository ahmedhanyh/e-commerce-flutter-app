abstract class SearchState {}

class SearchInitial extends SearchState {}
class GettingResults extends SearchState {}
class ResultsObtained extends SearchState {
  final results;
  ResultsObtained(this.results);
}
