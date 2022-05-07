import 'package:flutter/material.dart';
import 'package:flutter_bloc_fake_store/product/constant/application_constants.dart';
import '../../mixin/image_mixin.dart';

class ProjectNetwrokImage extends Image with ImageMixin {
  ProjectNetwrokImage.network({Key? key, String? src})
      : super.network(src ?? ApplicationConstant.instance.dummyImage, key: key);
}
