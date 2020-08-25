import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<FirebaseUser> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential authCredential = GoogleAuthProvider.getCredential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken);

  final AuthResult authResult =
      await _auth.signInWithCredential(authCredential);
  final FirebaseUser firebaseUser = authResult.user;

  assert(!firebaseUser.isAnonymous);
  assert(await firebaseUser.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(currentUser.uid == firebaseUser.uid);

  return firebaseUser;
}
