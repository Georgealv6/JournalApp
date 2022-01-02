import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:journalapp/models/classes/user.dart';

class UserBloc {
  final _repository = Repository();
  final _userGetter = PublishSubject<User>();

  Stream<User> get getUser => _userGetter.stream;

  registerUser(String username, String email, String password) async {
    User user = await _repository.registerUser(username, email, password);
    _userGetter.sink.add(user);
  }

  loginUser(String username, String password) async {
    User user = await _repository.loginUser(username, password);
    _userGetter.sink.add(user);
  }

  dispose() {
    _userGetter.close();
  }
}

final userBloc = UserBloc();
