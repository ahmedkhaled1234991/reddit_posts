import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../home_controller.dart';
import 'comments_bottom_sheet.dart';

class ActionsWidget extends StatefulWidget {
  const ActionsWidget({super.key});

  @override
  createState() => _ActionsWidgetState();
}

class _ActionsWidgetState extends StateMVC<ActionsWidget> {
  _ActionsWidgetState() : super(HomeController()) {
    con = HomeController();
  }
  late HomeController con;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 16,
                            child: Icon(Icons.person, size: 22),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Xury46',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      SizedBox(
                        width: 250,
                        child: Text(
                          'After a year of collecting parts for this build, I present my finished Heavy-9 (Thocky typing test at the end!)',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        if (con.postIsUpVoted == false) {
                          con.upVotePost();
                        }
                      },
                      icon: SvgPicture.asset(
                        con.postIsUpVoted
                            ? 'assets/icons/upvote.svg'
                            : 'assets/icons/upvote_outline.svg',
                        width: 24,
                        color: con.postIsUpVoted ? Colors.red : Colors.white,
                      ),
                    ),
                    Text(
                      con.voteCount.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        if (con.postIsDownVoted == false) {
                          con.downVotePost();
                        }
                      },
                      icon: SvgPicture.asset(
                        con.postIsDownVoted
                            ? 'assets/icons/downvote.svg'
                            : 'assets/icons/downvote_outline.svg',
                        width: 24,
                        color: con.postIsDownVoted
                            ? Colors.lightBlue
                            : Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        con.toggleComments(context);
                        showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          backgroundColor: Colors.grey[900],
                          context: context,
                          barrierColor: Colors.transparent,
                          enableDrag: true,
                          showDragHandle: true,
                          builder: (BuildContext context) {
                            return const CommentsBottomSheet();
                          },
                        ).whenComplete(() {
                          con.toggleComments(context);
                        });
                      },
                      icon: const Icon(
                        Icons.mode_comment_outlined,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      '61',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.file_upload_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
