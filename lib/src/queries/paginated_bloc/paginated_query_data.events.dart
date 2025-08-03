part of 'paginated_query_data.bloc.dart';

sealed class PaginatedQueryDataEvent {}

class PaginatedQueryStarted<Query> extends PaginatedQueryDataEvent {
  final Query query;
  PaginatedQueryStarted(this.query);
}

class PaginatedQueryNextPageRequested extends PaginatedQueryDataEvent {}

class PaginatedQueryPreviousPageRequested extends PaginatedQueryDataEvent {}
