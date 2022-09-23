import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:opinio_application/component/upload_image_button.dart';
import 'package:opinio_application/mixin/form_field_required.dart';
import 'package:opinio_application/model/post.dart';
import 'package:opinio_application/service/image_service.dart';
import 'package:opinio_application/service/post_service.dart';
import 'package:opinio_application/views/base_page.dart';

class PostPostPage extends StatefulWidget {
  const PostPostPage({super.key});

  @override
  State<PostPostPage> createState() => _PostPostPageState();
}

class _PostPostPageState extends State<PostPostPage>
    with RequiredFormFieldMixin {
  final _formKey = GlobalKey<FormState>();

  final Post _toPost = Post.empty();

  List<Uint8List> images = [];

  bool isUploading = false;

  Future _post() async {
    if (!mounted) return;
    if (!_formKey.currentState!.validate()) {
      throw Exception("Invalid Form");
    }
    _formKey.currentState!.save();
    setState(() {
      isUploading = true;
    });

    var paths = await ImageService().uploadImage(images);
    if (paths.isNotEmpty) _toPost.images = paths;
    PostService().addPost(_toPost);
    images = [];
    setState(() {
      isUploading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var texttheme = Theme.of(context).textTheme;
    return BasePage(
      actionAlignment: MainAxisAlignment.spaceBetween,
      floatingAction: FloatingActionButton.extended(
        onPressed: !isUploading
            ? () => _post().then((value) => Navigator.of(context).pop(true))
            : null,
        icon: !isUploading
            ? const Icon(Icons.speaker_notes_sharp)
            : const CircularProgressIndicator(),
        label: const Text("Post your Opinio"),
        tooltip: "Share your Opinio to the world",
      ),
      actions: [
        Container(
          color: Colors.black.withOpacity(0.5),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_sharp,
              ),
            ),
          ),
        )
      ],
      child: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Center(
            heightFactor: 1,
            child: Form(
              key: _formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Text(
                        "Speak Up!",
                        style: texttheme.displaySmall,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: TextFormField(
                        autofocus: true,
                        keyboardType: TextInputType.multiline,
                        enableSuggestions: false,
                        maxLines: 7,
                        validator: requiredField,
                        textInputAction: TextInputAction.done,
                        onSaved: (newValue) {
                          if (newValue == null) return;
                          _toPost.content = newValue;
                        },
                        decoration: const InputDecoration(
                          labelText: "message",
                          hintText: "What do YOU have to say?",
                          alignLabelWithHint: true,
                        ),
                        onFieldSubmitted: (value) => _post()
                            .then((value) => Navigator.of(context).pop(true)),
                      ),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      itemCount: images.length + 1,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemBuilder: (context, index) {
                        return (index >= images.length)
                            ? UploadImageButton(
                                onPressed: () {
                                  var f = ImageService().getRawImage();
                                  f.then((value) {
                                    if (value == null) return;
                                    if (!mounted) return;
                                    setState(() {
                                      images.add(value);
                                    });
                                  });
                                },
                              )
                            : Image.memory(
                                fit: BoxFit.cover,
                                images[index],
                              );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
