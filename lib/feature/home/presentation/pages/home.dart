import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_clean_architecture/feature/home/presentation/manager/bloc/get_all_post_bloc.dart';
import 'package:news_clean_architecture/feature/home/presentation/widgets/getListViewSeparated.dart';
import 'package:news_clean_architecture/feature/home/presentation/widgets/showMessages.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    floatingActionButton: FloatingActionButton(
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () {
        Navigator.pushNamed(context, '/addDeleteUpdate');
      },
      child: const Icon(Icons.add),
    ),

      appBar: AppBar(

        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Home'),
      ),
      body: BlocBuilder<GetAllPostBloc, GetAllPostState>(
        builder: (context, state) {
          if (state is GetAllPostInitial) {
            return const Center(child: Text('No Data'));
          } else if (state is GetAllPostLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetAllPostError) {
            return showMessages(context, state.message);
          } else if (state is GetAllPostLoaded) {
            return RefreshIndicator(
              onRefresh: _Refresh(context),
              child: GetListViewSeparated(state.posts),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

Future<void> Function() _Refresh(BuildContext context) {
  return () async {
    BlocProvider.of<GetAllPostBloc>(context).add(FetchAllPostsEvent());
  };
}
