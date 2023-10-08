import 'package:flutter/material.dart';

import '../../../Models/comment_model.dart';
import 'delete_dialog.dart';

class CommentActionsWidget {
  Future showCommentActionsBottomSheet(BuildContext context, int index,
      CommentActionsModel commentActionsModel) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      backgroundColor: Colors.grey[900],
      context: context,
      barrierColor: Colors.transparent,
      enableDrag: true,
      showDragHandle: true,
      builder: (BuildContext context) {
        return SizedBox(
          width: double.infinity,
          height: 300,
          child: Column(
            children: [
              commentActionsItemWidget(
                Icons.file_upload_outlined,
                'Share',
                () {},
              ),
              commentActionsItemWidget(
                Icons.bookmark_border,
                'Save',
                () {},
              ),
              commentActionsItemWidget(
                Icons.notifications,
                'Stop reply notifications',
                () {},
              ),
              commentActionsItemWidget(
                Icons.copy,
                'Copy text',
                () {},
              ),
              commentActionsItemWidget(
                Icons.compare_arrows,
                'Collapse thread',
                () {},
              ),
              commentActionsItemWidget(
                Icons.edit,
                'Edit',
                () {},
              ),
              commentActionsItemWidget(
                Icons.delete_outline,
                'Delete',
                () {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return DeleteDialog(
                        index: index,
                        onDeleteConfirmed:
                            commentActionsModel.onDeleteConfirmed,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget commentActionsItemWidget(
      IconData icon, String title, Function() onTap) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      dense: true,
      visualDensity: const VisualDensity(vertical: -3),
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
      ),
      onTap: onTap,
    );
  }
}
