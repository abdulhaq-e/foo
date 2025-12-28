part of 'query_data.bloc.dart';

@Freezed(genericArgumentFactories: true)
sealed class QueryDataState<Data> with _$QueryDataState<Data> {
  factory QueryDataState.initial() = QueryDataInitial;
  factory QueryDataState.loading() = QueryDataLoading;
  factory QueryDataState.loaded({
    required Data data,
  }) = QueryDataLoaded;
  factory QueryDataState.failedLoading() = QueryDataFailedLoading;
}
