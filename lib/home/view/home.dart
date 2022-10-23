import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:hasantunahanak_biz/home/viewmodel/home_viewmodel.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late final HomeViewModel viewModel = HomeViewModel(setState: setState);

  @override
  void initState() {
    super.initState();
    viewModel.fetchAll();
  }

  Widget _mobileBuilder() {
    return Container();
  }

  Widget _tabletBuilder() {
    return Container();
  }

  Widget _webBuilder() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  _renderStandartButton(
                    text: "Resume",
                  ),
                  const SizedBox(width: 12),
                  _renderStandartButton(
                    text: "Projects",
                  ),
                  const SizedBox(width: 12),
                  _renderStandartButton(
                    text: "Contact",
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _renderCardDesign(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 16,
                      decoration: const BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          )),
                    ),
                    const SizedBox(height: 16),
                    DelayedDisplay(
                      slidingBeginOffset: const Offset(0, -1),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(99.0),
                            border: Border.all(
                              color: Colors.redAccent,
                              width: 2,
                            )),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(99.0),
                          child: Image.network(
                            viewModel.myUser.value.photo_url!,
                            width: 144,
                            height: 144,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    DelayedDisplay(
                      slidingBeginOffset: const Offset(0, 1),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FittedBox(
                            child: Text(
                              viewModel.myUser.value.name!,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const SizedBox(
                              width: 72,
                              child: Divider(
                                thickness: 1,
                              )),
                          Text(
                            viewModel.myUser.value.description!,
                            textAlign: TextAlign.center,
                            maxLines: 6,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          const SizedBox(height: 16),
                          const SizedBox(
                              width: 72,
                              child: Divider(
                                thickness: 1,
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    DelayedDisplay(
                      delay: const Duration(milliseconds: 512),
                      slidingBeginOffset: const Offset(0, 1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              launchUrl(Uri.parse(viewModel.myUser.value.github!));
                            },
                            child: Image.network(
                              'assets/image/github.png',
                              width: 32,
                              height: 32,
                            ),
                          ),
                          const SizedBox(width: 12),
                          GestureDetector(
                            onTap: () {
                              launchUrl(Uri.parse(viewModel.myUser.value.linked_in!));
                            },
                            child: Image.asset(
                              'assets/image/linkedin.png',
                              width: 32,
                              height: 32,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Column(
                children: viewModel.repos.value.map((e) {
                  return Text(e.name!);
                }).toList(),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _renderStandartButton({required String text, VoidCallback? onPress}) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 36,
        decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget _renderCardDesign({required Widget child}) {
    return Container(
      width: MediaQuery.of(context).size.width * .96,
      constraints: const BoxConstraints(maxWidth: 968),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.grey.withOpacity(0.4),
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.redAccent,
              width: MediaQuery.of(context).size.width,
              height: 8,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              'assets/image/shape_4.png',
              width: MediaQuery.of(context).size.width * .2,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              'assets/image/shape_3.png',
              width: MediaQuery.of(context).size.width * .1,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Opacity(
              opacity: 0.1,
              child: RotatedBox(
                quarterTurns: 2,
                child: Image.asset(
                  'assets/image/shape_3.png',
                  width: MediaQuery.of(context).size.width * .24,
                ),
              ),
            ),
          ),
          if (viewModel.loading.value) ...[
            const Center(
              child: CircularProgressIndicator.adaptive(
                backgroundColor: Colors.redAccent,
              ),
            ),
          ] else ...[
            LayoutBuilder(builder: (context, constrait) {
              if (constrait.maxWidth >= 1100) {
                return _webBuilder();
              } else if (constrait.maxWidth >= 650) {
                return _tabletBuilder();
              } else {
                return _mobileBuilder();
              }
            }),
          ],
        ],
      ),
    );
  }
}
