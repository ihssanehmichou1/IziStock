import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/images/t_circular_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../controllers/user_controller.dart';

class TUserProfileTitle extends StatelessWidget {
  const TUserProfileTitle({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: const TCircularImage(
        image: TImages.user,
        width: 50,
        height: 50,
        padding: 0,
        isNetWorkImage: false,
      ),
      title: Text(
        controller.username.value.fullName,
        style: Theme.of(context).textTheme.headline6!.apply(color: TColors.white),
      ),
      subtitle: Text(
        controller.username.value.email,
        style: Theme.of(context).textTheme.bodyText2!.apply(color: TColors.white),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(Iconsax.edit, color: TColors.white),
      ),
    );
  }
}
