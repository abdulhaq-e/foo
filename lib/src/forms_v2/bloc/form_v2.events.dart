part of 'form_v2.bloc.dart';

abstract class FooFormV2Event {}

class FooFormV2DataLoaded extends FooFormV2Event {}

class FooFormV2DataReloaded extends FooFormV2Event {}

class FooFormV2Submitted extends FooFormV2Event {}
