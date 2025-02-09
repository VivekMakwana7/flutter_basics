import 'package:bloc/bloc.dart';
import 'package:flutter_basics/core/ext/ext_string.dart';
import 'package:flutter_basics/core/routes/app_side_bar_pages.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

/// App Cubit is for over all app functionality changes & usages
class AppCubit extends Cubit<AppState> {
  /// Default constructor
  AppCubit() : super(AppInitial());

  /// Selected side bar page
  SideBarPage sideBarPage = SideBarPage.text;

  /// On Sidebar page changed
  void onSideBarPageChanged(SideBarPage sideBar) {
    sideBarPage = sideBar;
    emit(AppSideBarMenuChangeState());
  }

  /// Find Current path and set Side bar
  void findCurrentPathAndSetSideBar(String path) {
    for (final e in SideBarPage.values) {
      if (e.path.path == path) {
        onSideBarPageChanged(e);
      }
    }
  }
}
