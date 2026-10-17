import 'package:bloc_test/bloc_test.dart';
import 'package:foo/core.dart';
import 'package:test/test.dart';
import 'dart:async';

void main() {
  late StreamController<bool> refreshController;
  late QueryHandling<String, int> queryHandler;

  setUp(() {
    refreshController = StreamController<bool>.broadcast();
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
    'emits error state when query handler fails',
    build: () =>
        QueryDataBloc<String, int>(queryHandler: (_) => Future.error('Error')),
    act: (bloc) => bloc.add(QueryDataStarted('invalid')),
    expect: () => [
      QueryDataState<int>.loading(),
      QueryDataState<int>.failedLoading(),
    ],
  );

  group('QueryDataRefreshed', () {
    blocTest<QueryDataBloc<String, int>, QueryDataState<int>>(
      'reloads without a loading state in between',
      build: () {
        var calls = 0;
        return QueryDataBloc<String, int>(
          queryHandler: (query) async => int.parse(query) + calls++,
        );
      },
      act: (bloc) async {
        bloc.add(QueryDataStarted('42'));
        await Future<void>.delayed(Duration.zero);
        bloc.add(QueryDataRefreshed());
      },
      expect: () => [
        QueryDataState<int>.loading(),
        QueryDataState<int>.loaded(data: 42),
        QueryDataState<int>.loaded(data: 43),
      ],
    );

    blocTest<QueryDataBloc<String, int>, QueryDataState<int>>(
      'keeps the current data when the refresh fails',
      build: () {
        var calls = 0;
        return QueryDataBloc<String, int>(
          queryHandler: (query) async =>
              calls++ == 0 ? int.parse(query) : throw Exception('down'),
        );
      },
      act: (bloc) async {
        bloc.add(QueryDataStarted('42'));
        await Future<void>.delayed(Duration.zero);
        bloc.add(QueryDataRefreshed());
      },
      expect: () => [
        QueryDataState<int>.loading(),
        QueryDataState<int>.loaded(data: 42),
      ],
    );

    blocTest<QueryDataBloc<String, int>, QueryDataState<int>>(
      'is an ordinary load when nothing has loaded yet',
      build: () {
        var calls = 0;
        return QueryDataBloc<String, int>(
          queryHandler: (query) async =>
              calls++ == 0 ? throw Exception('down') : int.parse(query),
        );
      },
      act: (bloc) async {
        bloc.add(QueryDataStarted('42'));
        await Future<void>.delayed(Duration.zero);
        bloc.add(QueryDataRefreshed());
      },
      expect: () => [
        QueryDataState<int>.loading(),
        QueryDataState<int>.failedLoading(),
        QueryDataState<int>.loading(),
        QueryDataState<int>.loaded(data: 42),
      ],
    );

    blocTest<QueryDataBloc<String, int>, QueryDataState<int>>(
      'does nothing before any query has started',
      build: () => QueryDataBloc<String, int>(queryHandler: queryHandler),
      act: (bloc) => bloc.add(QueryDataRefreshed()),
      expect: () => <QueryDataState<int>>[],
    );
  });
}
