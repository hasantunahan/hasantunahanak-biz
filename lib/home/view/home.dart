import 'package:flutter/material.dart';
import 'package:hasantunahanak_biz/home/viewmodel/home_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late final HomeViewModel viewModel = HomeViewModel(setState: setState);

  Widget _mobileBuilder() {
    return Center(
      child: Column(
        children: [],
      ),
    );
  }

  Widget _tabletBuilder() {
    return Container();
  }

  Widget _webBuilder() {
    return Center(
      child: _renderCardDesign(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/image/hasan.png',
                  width: 100,
                  height: 100,
                ),
              )
            ],
          )
        ],
      )),
    );
  }

  Widget _renderCardDesign({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: const [
          BoxShadow(blurRadius: 5, color: Colors.grey, offset: Offset(1, 1)),
        ],
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: LayoutBuilder(builder: (context, constrait) {
        if (constrait.maxWidth >= 1100) {
          return _webBuilder();
        } else if (constrait.maxWidth >= 650) {
          return _tabletBuilder();
        } else {
          return _mobileBuilder();
        }
      }),
    );
  }
}
