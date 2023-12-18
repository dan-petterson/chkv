import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyC_USpRNkeQ_hisaV6yKBBZsf1KW9CN7ps",
            authDomain: "c-h-kv-fhyvkm.firebaseapp.com",
            projectId: "c-h-kv-fhyvkm",
            storageBucket: "c-h-kv-fhyvkm.appspot.com",
            messagingSenderId: "277404775820",
            appId: "1:277404775820:web:c42a2688c82781332f92a9"));
  } else {
    await Firebase.initializeApp();
  }
}
