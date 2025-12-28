part of 'query_data.bloc.dart';

abstract class QueryDataEvent {}

class QueryDataStarted<Query> extends QueryDataEvent {
  final Query query;

  QueryDataStarted(Query query) : query = query;
}
