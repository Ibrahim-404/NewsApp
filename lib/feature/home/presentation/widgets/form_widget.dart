import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_clean_architecture/feature/home/presentation/manager/bloc/delete_update_create_bloc.dart';
import 'package:news_clean_architecture/feature/postes/data/model/post_model.dart';
import 'package:news_clean_architecture/feature/postes/domain/entities/post.dart';

class FormWidgetState extends StatefulWidget {
  final Post? editPost;
  final bool? isUpdate;
  FormWidgetState({super.key, this.editPost, this.isUpdate});

  @override
  State<FormWidgetState> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidgetState> {
  late TextEditingController titleController;
  late TextEditingController contentController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.editPost?.title ?? '');
    contentController = TextEditingController(text: widget.editPost?.body ?? '');
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
            Hero(
              tag: 'title-${widget.editPost?.id ?? "new"}',
              child: Material(
                color: Colors.transparent,
                child: TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    labelText: 'Title',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Hero(
              tag: 'content-${widget.editPost?.id ?? "new"}',
              child: Material(
                color: Colors.transparent,
                child: TextFormField(
                  controller: contentController,
                  maxLines: 8,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    labelText: 'Content',
                  ),
                ),
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
                    context.read<DeleteUpdateCreateBloc>().add(
                      UpdatePostEvent(
                        PostModel(
                          id: widget.editPost!.id,
                          title: titleController.text,
                          content: contentController.text,
                        ),
                      ),
                    );
                  } else {
                    context.read<DeleteUpdateCreateBloc>().add(
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
              icon: Icon(
                widget.isUpdate == false ? Icons.add : Icons.update,
                color: Colors.white,
              ),
              label: Text(
                widget.isUpdate == false ? 'Add Post' : 'Update Post',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
