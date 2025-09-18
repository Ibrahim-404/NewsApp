import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_clean_architecture/core/routes/routes_name.dart';
import 'package:news_clean_architecture/feature/home/presentation/manager/bloc/delete_update_create_bloc.dart';
import 'package:news_clean_architecture/feature/postes/domain/entities/post.dart';

Widget GetListViewSeparated(List<Post> posts) {
  return ListView.separated(
    itemCount: posts.length,
    separatorBuilder: (context, index) => Divider(thickness: 1),
    itemBuilder: (context, index) {
      return Dismissible(
        
        key: Key(posts[index].id.toString()),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
context.read<DeleteUpdateCreateBloc>().add(
              DeletePostEvent(posts[index].id?.toString() ?? '0'),
            );
        },
        background: Container(
          color: Colors.red,
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 16.0),
          child: Icon(Icons.delete, color: Colors.white),
        ),
        child: ListTile(
          leading: Text('${index + 1}'),
          title: Text(
            'Post Title ${posts[index].title}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('Post Subtitle ${posts[index].body}'),
          onTap: ()async {
             Navigator.pushNamed(context, RoutesName.addDeleteUpdate, arguments: {
             "post": posts[index],
            "isUpdate": true,
            });
            log(  'Home Post Id: ${posts[index].id}');
            log(  'Home Post Title: ${posts[index].title}');
            log(  'Home Post Body: ${posts[index].body}');
          },
        ),
      );
    },
  );
}
