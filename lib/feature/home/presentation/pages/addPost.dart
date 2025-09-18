import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_clean_architecture/feature/home/presentation/manager/bloc/delete_update_create_bloc.dart';
import 'package:news_clean_architecture/feature/home/presentation/widgets/customSnackbar.dart';
import 'package:news_clean_architecture/feature/home/presentation/widgets/form_widget.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  late Map<String, dynamic>? args;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
        
  if (args == null) {
      args = {
        'isUpdate': false,
        'post': null,
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isUpdate = args?['isUpdate'] ?? false;
    final post = args?['post'];
    log('Is Update: $isUpdate');
    log("Post: $post");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(isUpdate ? 'Update Post' : 'Add Post'),
      ),
      body: BlocConsumer<DeleteUpdateCreateBloc, DeleteUpdateCreateState>(
        listener: (context, state) {
          if (state is SuccessProcessState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(CustomSnackbar.successSnackbar(state.message));
            Navigator.pop(context);
          } else if (state is FailureProcessState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(CustomSnackbar.failureSnackbar(state.message));
          }
        },
        builder: (context, state) {
          if (state is LoadingProcessState) {
            return const Center(child: CircularProgressIndicator());
          }

          return FormWidgetState(isUpdate: isUpdate, editPost: post);
        },
      ),
    );
  }
}
