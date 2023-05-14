import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'regestration_state.dart';

class RegestrationCubit extends Cubit<RegestrationState> {
  RegestrationCubit() : super(RegestrationInitial());
  Future<void> registerWithEmailAndPassword(
      {required String email, required String password}) async {
    emit(RegestrationLoding());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(RegestrationSuccess(successMessage: 'You have been registered'));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegestrationFailure(
            failureMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegestrationFailure(
            failureMessage: 'The account already exists for that email.'));
      }
    } catch (e) {
      emit(RegestrationFailure(failureMessage: '$e'));
    }
  }
}
