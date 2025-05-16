import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/user_entity.dart';

class UserTile extends StatelessWidget {
  final UserDataEntity user;
  final VoidCallback onTap;

  const UserTile({super.key, required this.user, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 12.w),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
          child: Row(
            children: [
              CircleAvatar(
                radius: 40.r,
                backgroundImage: NetworkImage(user.avatar ?? ''),
              ),
              SizedBox(width: 10.w,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${user.firstName!} ${user.lastName!}'),
                  SizedBox(height: 5.h,),
                  Text(user.email ?? ''),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
