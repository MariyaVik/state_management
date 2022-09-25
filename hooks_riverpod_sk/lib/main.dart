import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod_sk/ui/app.dart';

void main() {
  runApp(const ProviderScope(child: App()));
}
