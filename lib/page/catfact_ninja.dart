import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_future_builder/providers/catfact_provider.dart';


class CatfactNinja extends ConsumerWidget {
  const CatfactNinja({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final catfact = ref.watch(catFactProvider);

    return Scaffold(
      body: Center(
        child: catfact.when(
          data: (data) {
          return Text(data);
          }, 
          error: ( error, _ ) {
            return const Text('Error getting data');
          },
          loading: () => const CircularProgressIndicator()
        ),
      ),
    );
  }
}