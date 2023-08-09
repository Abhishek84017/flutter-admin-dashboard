import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

extension Path on String {
  bool isActive(BuildContext context) {
    if (context.router.currentPath.split('/').last == 'ingrid' &&
        this == 'Dashboard') {
      return true;
    }
    return context.router.currentPath.split('/').last == toLowerCase();
  }

  String get _capitalizeFirst =>
      this[0].toUpperCase() + substring(1).toLowerCase();

  String get capitalize =>
      trim().split(' ').map((e) => e.trim()._capitalizeFirst).join(' ');

  String get route =>
      trim().split('-').map((e) => e.trim()._capitalizeFirst).join(' ');
}

extension Iterables<E> on Iterable<E> {
  Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) => fold(
      <K, List<E>>{},
      (Map<K, List<E>> map, E element) =>
          map..putIfAbsent(keyFunction(element), () => <E>[]).add(element));
}
