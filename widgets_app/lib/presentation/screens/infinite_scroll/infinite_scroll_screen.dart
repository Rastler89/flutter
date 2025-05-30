import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {

  static const name = 'infinite-screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {

  List<int> imagesIds = [1,2,3,4,5,6,7,8,9,10];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if ((scrollController.position.pixels+500) >= scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  void moveScrollToBottom() {
    if(scrollController.position.pixels + 150 <= scrollController.position.maxScrollExtent) return;
    scrollController.animateTo(
      scrollController.position.pixels + 120,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn
    );
  }

  void addFive() {
    final lastId = imagesIds.last;
    imagesIds.addAll([lastId + 1, lastId + 2, lastId + 3, lastId + 4, lastId + 5]);
  }

  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));
    addFive();
    isLoading = false;
    //Todo: revisar si esta montado el componente / widget
    if (!isMounted) return;
    setState(() {});
    moveScrollToBottom();
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));
    if (!isMounted) return;

    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFive();
    isLoading = false;
    setState(() {});
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          child: ListView.builder(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: AssetImage('assets/images/jar-loading.gif'),
                image: NetworkImage('https://picsum.photos/id/${imagesIds[index]}/500/300'),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: isLoading
            ? SpinPerfect(
                infinite: true,
                child: const Icon(Icons.refresh_rounded),
              )
            : FadeIn(child: const Icon(Icons.arrow_back_ios_new_rounded)),
        onPressed: () => context.pop(),
      ),
    );
  }
}