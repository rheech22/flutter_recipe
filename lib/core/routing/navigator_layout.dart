import 'package:flutter/material.dart';
import 'package:flutter_recipe/ui/color_styles.dart';
import 'package:flutter_svg/svg.dart';

// TODO: 작은 화면에서 UI 벗어나는 현상 수정
class NavigatorLayout extends StatelessWidget {
  final Widget body;
  final int currentPageIndex;
  final void Function(int index) onChangeIndex;

  const NavigatorLayout({
    super.key,
    required this.body,
    required this.currentPageIndex,
    required this.onChangeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
        ),
        backgroundColor: ColorStyles.primary100,
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 60,
        color: Colors.white,
        child: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          selectedIndex: currentPageIndex,
          onDestinationSelected: (index) {
            final realIndex = index > 1 ? index - 1 : index;
            onChangeIndex(realIndex);
          },
          backgroundColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          destinations: [
            NavigationDestination(
              icon: SvgPicture.asset('assets/icons/home.svg'),
              selectedIcon: SvgPicture.asset(
                'assets/icons/home_selected.svg',
              ),
              label: 'home',
            ),
            NavigationDestination(
              icon: SvgPicture.asset('assets/icons/bookmark.svg'),
              selectedIcon: SvgPicture.asset(
                'assets/icons/bookmark_selected.svg',
              ),
              label: 'saved recipes',
            ),
            SizedBox.shrink(),
            NavigationDestination(
              icon: SvgPicture.asset('assets/icons/notification.svg'),
              selectedIcon: SvgPicture.asset(
                'assets/icons/notification_selected.svg',
              ),
              label: 'notifications',
            ),
            NavigationDestination(
              icon: SvgPicture.asset('assets/icons/profile.svg'),
              selectedIcon: SvgPicture.asset(
                'assets/icons/profile_selected.svg',
              ),
              label: 'profile',
            ),
          ],
        ),
      ),
    );
  }
}
