class CommentModel {
  bool commentIsUpVoted;
  bool commentIsDownVoted;
  String commentText;
  int voteCommentCount;
  int index = 0;
  CommentActionsModel? commentActionsModel;

  CommentModel({
    this.commentIsUpVoted = false,
    this.commentIsDownVoted = false,
    this.voteCommentCount = 1,
    required this.commentText,
    required this.index,
    CommentActionsModel? commentActionsModel,
  }) : commentActionsModel = commentActionsModel ?? CommentActionsModel();
}

class CommentActionsModel {
  final Function(int) onDeleteConfirmed;

  CommentActionsModel({Function(int)? onDeleteConfirmed})
      : onDeleteConfirmed = onDeleteConfirmed ?? ((index) {});
}
