import 'package:lawan/features/admin/admin_add_arena.dart';
import 'package:lawan/features/admin/admin_main_state.dart';

class AdminMainLogic {
  AdminMainState state = AdminMainState();

  void createNewArena() {
    AdminAddArena(state: state).createNewArena();
  }
}
