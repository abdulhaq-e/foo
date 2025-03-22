part of 'form.bloc.dart';

abstract class FooFormEvent {}

class FooFormDataLoaded extends FooFormEvent {}

class FooFormDataReloaded extends FooFormEvent {}

class FooFormSubmitted extends FooFormEvent {}
