import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../Models/comment_model.dart';
import '../home_controller.dart';
import 'comment_actions_widget.dart';

class CommentWidget extends StatefulWidget {
  CommentModel commentModel;

  CommentWidget({super.key, required this.commentModel});

  @override
  _CommentWidgetState createState() => _CommentWidgetState();
}

class _CommentWidgetState extends StateMVC<CommentWidget> {
  _CommentWidgetState() : super(HomeController()) {
    con = HomeController();
  }
  late HomeController con;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: 147,
        child: Card(
            color: Colors.black.withOpacity(0.7),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 18,
                        child: Icon(Icons.person, size: 20),
                      ),
                      SizedBox(width: 6),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Ahmed Khaled',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 6),
                              Text(
                                '. 1h',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          Text(
                            'Flutter developer',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    con.commentsList[widget.commentModel.index].commentText,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6),
                  StatefulBuilder(builder: (BuildContext context, stateSetter) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            CommentActionsWidget()
                                .showCommentActionsBottomSheet(
                                    context,
                                    widget.commentModel.index,
                                    widget.commentModel.commentActionsModel!);
                          },
                          icon: const Icon(
                            Icons.more_horiz,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.undo,
                              color: Colors.white, size: 20),
                          label: const Text(
                            'Reply',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            if (con.commentsList[widget.commentModel.index]
                                    .commentIsUpVoted ==
                                false) {
                              stateSetter(() {
                                con.upVoteComment(widget.commentModel.index);
                              });
                            }
                          },
                          icon: SvgPicture.asset(
                            con.commentsList[widget.commentModel.index]
                                    .commentIsUpVoted
                                ? 'assets/icons/upvote.svg'
                                : 'assets/icons/upvote_outline.svg',
                            width: 20,
                            color: con.commentsList[widget.commentModel.index]
                                    .commentIsUpVoted
                                ? Colors.red
                                : Colors.white,
                          ),
                        ),
                        Text(
                          con.commentsList[widget.commentModel.index]
                              .voteCommentCount
                              .toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            if (con.commentsList[widget.commentModel.index]
                                    .commentIsDownVoted ==
                                false) {
                              stateSetter(() {
                                con.downVoteComment(widget.commentModel.index);
                              });
                            }
                          },
                          icon: SvgPicture.asset(
                            con.commentsList[widget.commentModel.index]
                                    .commentIsDownVoted
                                ? 'assets/icons/downvote.svg'
                                : 'assets/icons/downvote_outline.svg',
                            width: 20,
                            color: con.commentsList[widget.commentModel.index]
                                    .commentIsDownVoted
                                ? Colors.lightBlue
                                : Colors.white,
                          ),
                        ),
                      ],
                    );
                  })
                ],
              ),
            )),
      ),
    );
  }
}
