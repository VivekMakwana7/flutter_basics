part of 'container_cubit.dart';

/// Container Main State
@immutable
sealed class ContainerState {}

/// Container Initial State
final class ContainerInitial extends ContainerState {}

/// Container property update State
final class ContainerPropertyUpdateState extends ContainerState {}
