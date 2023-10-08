import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:reddit_posts/Models/comment_model.dart';

import 'home_screen.dart';

class HomeController extends ControllerMVC {
  // singleton
  factory HomeController() {
    _this ??= HomeController._();
    return _this!;
  }
  static HomeController? _this;
  HomeController._();

  bool commentsClosed = true;

  bool postIsUpVoted = false;
  bool postIsDownVoted = false;
  int voteCount = 2;
  TextEditingController commentController = TextEditingController();
  List<CommentModel> commentsList = [
    CommentModel(
      commentIsUpVoted: false,
      commentIsDownVoted: false,
      index: 0,
      commentText: 'Content of the comment',
    ),
    CommentModel(
      commentIsUpVoted: false,
      commentIsDownVoted: false,
      index: 1,
      commentText: 'Content of the comment',
    ),
    CommentModel(
      commentIsUpVoted: false,
      commentIsDownVoted: false,
      index: 2,
      commentText: 'Content of the comment',
    ),
    CommentModel(
      commentIsUpVoted: false,
      commentIsDownVoted: false,
      index: 3,
      commentText: 'Content of the comment',
    ),
    CommentModel(
      commentIsUpVoted: false,
      commentIsDownVoted: false,
      index: 4,
      commentText: 'Content of the comment',
    ),
    CommentModel(
      commentIsUpVoted: false,
      commentIsDownVoted: false,
      index: 5,
      commentText: 'Content of the comment',
    ),
    CommentModel(
      commentIsUpVoted: false,
      commentIsDownVoted: false,
      index: 6,
      commentText: 'Content of the comment',
    ),
    CommentModel(
      commentIsUpVoted: false,
      commentIsDownVoted: false,
      index: 7,
      commentText: 'Content of the comment',
    ),
    CommentModel(
      commentIsUpVoted: false,
      commentIsDownVoted: false,
      index: 8,
      commentText: 'Content of the comment',
    ),
    CommentModel(
      commentIsUpVoted: false,
      commentIsDownVoted: false,
      index: 9,
      commentText: 'Content of the comment',
    ),
  ];

  void upVotePost() {
    postIsUpVoted = !postIsUpVoted;
    postIsDownVoted = false;
    voteCount = voteCount + 2;
    setState(() {});
  }

  void downVotePost() {
    postIsDownVoted = !postIsDownVoted;
    postIsUpVoted = false;
    voteCount = voteCount - 2;
    setState(() {});
  }

  void toggleComments(BuildContext context) {
    if (!commentsClosed) {
      commentsClosed = !commentsClosed;
      Navigator.pop(context);
    } else {
      Future.delayed(const Duration(milliseconds: 800), () {
        commentsClosed = !commentsClosed;
      });
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }

  void upVoteComment(int index) {
    commentsList[index].commentIsUpVoted =
        !commentsList[index].commentIsUpVoted;
    commentsList[index].commentIsDownVoted = false;
    commentsList[index].voteCommentCount++;
    setState(() {});
  }

  void downVoteComment(int index) {
    commentsList[index].commentIsDownVoted =
        !commentsList[index].commentIsDownVoted;
    commentsList[index].commentIsUpVoted = false;
    commentsList[index].voteCommentCount--;
    setState(() {});
  }

  void addNewComment() {
    if (commentController.text.isNotEmpty) {
      setState(() {
        commentsList.add(CommentModel(
          commentIsUpVoted: false,
          commentIsDownVoted: false,
          index: commentsList.length,
          commentText: commentController.text,
        ));
      });
    }
    commentController.clear();
  }

  void deleteComment(int index) {
    setState(() {
      commentsList.removeAt(index);
    });
  }
}
