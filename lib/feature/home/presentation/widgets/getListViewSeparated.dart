import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_clean_architecture/core/routes/routes_name.dart';
import 'package:news_clean_architecture/feature/home/presentation/manager/bloc/delete_update_create_bloc.dart';
import 'package:news_clean_architecture/feature/postes/domain/entities/post.dart';

Widget GetListViewSeparated(List<Post> posts) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListView.builder(
      itemCount: posts.length,
      // separatorBuilder: (context, index) => Divider(thickness: 1),
      itemBuilder: (context, index) {
        final post = posts[index];
        return Dismissible(
          key: Key(post.id.toString()),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            context.read<DeleteUpdateCreateBloc>().add(
              DeletePostEvent(post.id?.toString() ?? '0'),
            );
          },
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.delete, color: Colors.white),
          ),
          child: Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                child: Text(post.id.toString()),
              ),
              title: Hero(
                tag: 'title-${post.id}',
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    post.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
              subtitle: Hero(
                tag: 'content-${post.id}',
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    post.body,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RoutesName.addDeleteUpdate,
                  arguments: {"post": post, "isUpdate": true},
                );
              },
            ),
          ),
        );
      },
    ),
  );
}
