import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:final_flutter_project/features/login/view.dart';
import 'package:final_flutter_project/features/profile/cubit.dart';
import 'package:final_flutter_project/features/profile/state.dart';
import 'package:final_flutter_project/features/widgets/loading_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is LogoutSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Logged out successfully!"),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) {
                  return LoginScreen();
                },
              ),
            );
          } else if (state is LogoutFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("${state.errorMessage}"),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<ProfileCubit>();
          if (state is LogoutLoading) {
            return LoadingScreen(message: "Logging out...");
          }
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 36, 0, 36),
                child: Column(
                  spacing: 40,
                  children: [
                    Column(
                      spacing: 8,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(
                            "assets/images/profile_picture.png",
                          ),
                        ),
                        Text(
                          "Ahmed Hany",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: ListView(
                          children: [
                            ListTile(
                              leading: SvgPicture.asset(
                                "assets/icons/profile.svg",
                              ),
                              title: Text(
                                "Profile",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              trailing: SvgPicture.asset(
                                "assets/icons/profile_arrow_forward.svg",
                              ),
                              tileColor: Color(0xffF8F7F7),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            SizedBox(height: 16),
                            ListTile(
                              leading: SvgPicture.asset(
                                "assets/icons/settings.svg",
                              ),
                              title: Text(
                                "Settings",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              trailing: SvgPicture.asset(
                                "assets/icons/profile_arrow_forward.svg",
                              ),
                              tileColor: Color(0xffF8F7F7),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            SizedBox(height: 16),
                            ListTile(
                              leading: SvgPicture.asset(
                                "assets/icons/contact.svg",
                              ),
                              title: Text(
                                "Contact",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              trailing: SvgPicture.asset(
                                "assets/icons/profile_arrow_forward.svg",
                              ),
                              tileColor: Color(0xffF8F7F7),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            SizedBox(height: 16),
                            ListTile(
                              leading: SvgPicture.asset(
                                "assets/icons/share_app.svg",
                              ),
                              title: Text(
                                "Share App",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              trailing: SvgPicture.asset(
                                "assets/icons/profile_arrow_forward.svg",
                              ),
                              tileColor: Color(0xffF8F7F7),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            SizedBox(height: 16),
                            ListTile(
                              leading: SvgPicture.asset(
                                "assets/icons/help.svg",
                              ),
                              title: Text(
                                "Help",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              trailing: SvgPicture.asset(
                                "assets/icons/profile_arrow_forward.svg",
                              ),
                              tileColor: Color(0xffF8F7F7),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        cubit.logout();
                      },
                      child: Text(
                        "Sign Out",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffF55F1F),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
