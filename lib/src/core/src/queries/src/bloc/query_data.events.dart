part of 'query_data.bloc.dart';

abstract class QueryDataEvent {}

class QueryDataStarted<Query> extends QueryDataEvent {
  final Query query;

  QueryDataStarted(Query query) : query = query;
}

/// Re-runs the last [QueryDataStarted] query without passing through
/// [QueryDataLoading], so a view showing the data keeps it on screen (and
/// keeps its own widget state) while the fresh copy loads. A failed refresh
/// leaves the current data in place. Before anything has loaded, it is an
/// ordinary load.
class QueryDataRefreshed extends QueryDataEvent {}
