part of 'column_cubit.dart';

/// Column Main State
@immutable
sealed class ColumnState {}

/// Column Initial State
final class ColumnInitial extends ColumnState {}

/// Column Box Increase State
final class ColumnBoxIncreaseState extends ColumnState {}

/// Column Property Update State
final class ColumnPropertyUpdatetState extends ColumnState {}
