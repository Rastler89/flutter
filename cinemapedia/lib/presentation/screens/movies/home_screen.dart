import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../views/views.dart';

class HomeScreen extends StatelessWidget {

  static const String name = 'home-screen';

  final int pageIndex;

  const HomeScreen({
    super.key,
    required this.pageIndex
  });

  final viewRoutes = const <Widget>[
    HomeView(),
    SizedBox(), //categories
    FavoritesView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes
      ),
      bottomNavigationBar: CustomBottomNavigation(currentIndex: pageIndex),
    );
  }
}