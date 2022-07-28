part of 'reducers.dart';

final authReducer = combineReducers<AuthState?>([
  TypedReducer<AuthState?, SignInAction>(_signInAction),
  TypedReducer<AuthState?, ClearSignInAction>(_clearSignInAction),
  TypedReducer<AuthState?, SignUpAction>(_signUpAction),
  TypedReducer<AuthState?, ClearSignUpAction>(_clearSignUpAction),
]);

AuthState? _signInAction(AuthState? state, SignInAction action) {
  return state?.copyWith(email: action.email, password: action.password);
}

AuthState? _clearSignInAction(AuthState? state, ClearSignInAction action) {
  return state?.copyWith(email: '', password: '');
}

AuthState? _signUpAction(AuthState? state, SignUpAction action) {
  return state?.copyWith(
      name: action.name, email: action.email, password: action.password);
}

AuthState? _clearSignUpAction(AuthState? state, ClearSignUpAction action) {
  return state?.copyWith(name: '', email: '', password: '');
}
