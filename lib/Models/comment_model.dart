class CommentModel {
  bool commentIsUpVoted;
  bool commentIsDownVoted;
  String commentText;
  int voteCommentCount;
  int index = 0;

  CommentModel({
    this.commentIsUpVoted = false,
    this.commentIsDownVoted = false,
    this.voteCommentCount = 1,
    required this.commentText,
    required this.index,
  });
}
