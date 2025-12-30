part of 'paginated_query_data.bloc.dart';

sealed class PaginatedQueryDataEvent {}

class PaginatedQueryStarted<Query> extends PaginatedQueryDataEvent {
  final Query query;
  final int pageSize;

  PaginatedQueryStarted(this.query, {this.pageSize = 30});
}

class PaginatedQueryNextPageRequested extends PaginatedQueryDataEvent {}

class PaginatedQueryPreviousPageRequested extends PaginatedQueryDataEvent {}
