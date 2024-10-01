import 'package:lawan/features/admin/session/admin_session_bottom_sheet.dart';
import 'package:lawan/features/admin/session/session_state.dart';

class SessionLogic {
  SessionState state = SessionState();

  void showDetailArena() {
    AdminSessionBottomSheet().showDetailSessionSheet();
  }
}
