import 'package:flutter/material.dart';
import 'package:opinio_application/model/user.dart';
import 'package:opinio_application/service/image_service.dart';
import 'package:opinio_application/service/user_service.dart';

class UserProfileHeader extends StatefulWidget {
  const UserProfileHeader({super.key, required this.user});

  final UserProfile user;

  @override
  State<UserProfileHeader> createState() => _UserProfileHeaderState();
}

class _UserProfileHeaderState extends State<UserProfileHeader> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          (widget.user.wallpaper.isEmpty)
              ? Container(
                  color: Colors.primaries[
                      widget.user.name.hashCode % Colors.primaries.length],
                  width: double.infinity,
                )
              : Image.network(
                  widget.user.wallpaper,
                  fit: BoxFit.contain,
                  height: 300,
                ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              color: Colors.black.withOpacity(0.5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: MouseRegion(
                      onEnter: (event) {
                        if (mounted) {
                          setState(() {
                            isHovered = true;
                          });
                        }
                      },
                      onExit: (event) {
                        if (mounted) {
                          setState(() {
                            isHovered = false;
                          });
                        }
                      },
                      child: GestureDetector(
                        onTap: () async {
                          var raw = await ImageService().getRawImage();
                          if (raw == null) return;
                          var path = await ImageService().uploadImage([raw]);
                          setState(() {
                            widget.user.imageID = path[0];
                            UserService().updateUser({'imageID': path[0]});
                          });
                        },
                        child: Stack(
                          children: [
                            Hero(
                              tag: widget.user.imageID,
                              child: Image.network(
                                widget.user.imageID,
                              ),
                            ),
                            if (isHovered)
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  color: theme.colorScheme.secondary,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "Edit",
                                          style: theme.textTheme.labelLarge
                                              ?.copyWith(
                                            color:
                                                theme.colorScheme.onSecondary,
                                          ),
                                        ),
                                        const Icon(
                                          Icons.edit,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.user.name,
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
