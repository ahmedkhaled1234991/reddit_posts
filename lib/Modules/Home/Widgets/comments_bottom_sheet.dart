import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart' as mvc;

import '../../../Models/comment_model.dart';
import '../home_controller.dart';
import 'comment_widget.dart';

class CommentsBottomSheet extends StatefulWidget {
  const CommentsBottomSheet({super.key});

  @override
  _CommentsBottomSheetState createState() => _CommentsBottomSheetState();
}

class _CommentsBottomSheetState extends mvc.StateMVC<CommentsBottomSheet> {
  _CommentsBottomSheetState() : super(HomeController()) {
    con = HomeController();
  }
  late HomeController con;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: [
              Flexible(
                child: ListView.builder(
                  itemCount: con.commentsList.length,
                  itemBuilder: (context, index) {
                    return CommentWidget(
                      commentModel: CommentModel(
                        commentIsUpVoted:
                            con.commentsList[index].commentIsUpVoted,
                        commentIsDownVoted:
                            con.commentsList[index].commentIsDownVoted,
                        index: index,
                        commentText: 'Content of the comment',
                        commentActionsModel: CommentActionsModel(
                          onDeleteConfirmed: (index) {
                            setState(() {
                              con.deleteComment(index);
                            });
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                width: double.infinity,
                height: 55,
                padding: const EdgeInsets.all(8.0),
                color: Colors.grey[900],
                child: TextFormField(
                  cursorColor: Colors.white,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    contentPadding: const EdgeInsets.all(10),
                    fillColor: Colors.grey[700],
                    hintText: 'Add a comment',
                    hintStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        con.addNewComment();
                      },
                      icon: const Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                  controller: con.commentController,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
