import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_clean_architecture/feature/home/presentation/manager/bloc/delete_update_create_bloc.dart';
import 'package:news_clean_architecture/feature/postes/data/model/post_model.dart';
import 'package:news_clean_architecture/feature/postes/domain/entities/post.dart';

class FormWidgetState extends StatefulWidget {
  Post? editPost;
  bool? isUpdate;
  FormWidgetState({super.key, this.editPost, this.isUpdate});
  @override
  State<FormWidgetState> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidgetState> {
  TextEditingController titleController = TextEditingController();

  TextEditingController contentController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    if (widget.isUpdate == true) {
      log('Edit Post Id: ${widget.editPost?.title}');
      titleController.text = widget.editPost?.title ?? '';
      contentController.text = widget.editPost?.body ?? '';
    }
    if (widget.isUpdate == false) {
      titleController.text = '';
      contentController.text = '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                labelText: 'Title',
              ),
              controller: titleController,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: contentController,
              maxLines: 8,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                labelText: 'Content',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  if (widget.isUpdate == true) {
                    BlocProvider.of<DeleteUpdateCreateBloc>(context).add(
                      UpdatePostEvent(
                        PostModel(
                          id: widget.editPost!.id,
                          title: titleController.text,
                          content: contentController.text,
                        ),
                      ),
                    );
                  } else {
                    BlocProvider.of<DeleteUpdateCreateBloc>(context).add(
                      CreatePostEvent(
                        PostModel(
                          title: titleController.text,
                          content: contentController.text,
                        ),
                      ),
                    );
                  }
                }
              },

              label: Text(
                widget.isUpdate == false ? 'Add Post' : 'Update post',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              icon: Icon(
                widget.isUpdate == false ? Icons.add : Icons.update,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
