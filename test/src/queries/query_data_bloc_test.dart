import 'package:bloc_test/bloc_test.dart';
import 'package:foo/core.dart';
import 'package:foo/queries.dart';
import 'package:test/test.dart';
import 'dart:async';

void main() {
  late StreamController<fool> refreshController;
  late QueryHandling<String, int> queryHandler;

  setUp(() {
    refreshController = StreamController<fool>.broadcast();
    queryHandler = (query) async => int.parse(query);
  });

  tearDown(() {
    refreshController.close();
  });

  blocTest<QueryDataBloc<String, int>, QueryDataState<int>>(
    'emits loading and loaded states on initial query',
    build: () => QueryDataBloc<String, int>(queryHandler: queryHandler),
    act: (bloc) => bloc.add(QueryDataStarted('42')),
    expect: () => [
      QueryDataState<int>.loading(),
      QueryDataState<int>.loaded(data: 42),
    ],
  );

  blocTest<QueryDataBloc<String, int>, QueryDataState<int>>(
    'emits new states when refresh trigger fires true',
    build: () => QueryDataBloc<String, int>(
      queryHandler: queryHandler,
      refreshTrigger: refreshController.stream,
    ),
    act: (bloc) async {
      bloc.add(QueryDataStarted('42'));
      await Future<void>.delayed(Duration(milliseconds: 100));
      refreshController.add(true);
    },
    expect: () => [
      QueryDataState<int>.loading(),
      QueryDataState<int>.loaded(data: 42),
      QueryDataState<int>.loading(),
      QueryDataState<int>.loaded(data: 42),
    ],
  );

  blocTest<QueryDataBloc<String, int>, QueryDataState<int>>(
    'does not emit new states when refresh trigger fires false',
    build: () => QueryDataBloc<String, int>(
      queryHandler: queryHandler,
      refreshTrigger: refreshController.stream,
    ),
    act: (bloc) async {
      bloc.add(QueryDataStarted('42'));
      await Future<void>.delayed(Duration(milliseconds: 100));
      refreshController.add(false);
    },
    expect: () => [
      QueryDataState<int>.loading(),
      QueryDataState<int>.loaded(data: 42),
    ],
  );

  blocTest<QueryDataBloc<String, int>, QueryDataState<int>>(
    'emits error state when query handler fails',
    build: () => QueryDataBloc<String, int>(
      queryHandler: (_) => Future.error('Error'),
    ),
    act: (bloc) => bloc.add(QueryDataStarted('invalid')),
    expect: () => [
      QueryDataState<int>.loading(),
      QueryDataState<int>.failedLoading(),
    ],
  );
}
