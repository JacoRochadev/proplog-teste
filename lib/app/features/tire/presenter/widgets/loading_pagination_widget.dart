import 'package:flutter/material.dart';

class LoadingPaginationWidget extends StatefulWidget {
  const LoadingPaginationWidget({super.key});

  @override
  State<LoadingPaginationWidget> createState() =>
      _LoadingPaginationWidgetState();
}

class _LoadingPaginationWidgetState extends State<LoadingPaginationWidget> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 25,
        ),
        CircularProgressIndicator(),
        SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
