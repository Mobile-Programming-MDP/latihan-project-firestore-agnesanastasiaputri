import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterlistagnes/userdata.dart';

class FirebaseService{
  static final COLLECTION_REF = 'user';
  
  final firestore = FirebaseFirestore.instance;
  late final CollectionReference userRef;

  FirebaseService(){
    userRef = firestore.collection(COLLECTION_REF);
  }

  void tambah(userData){
    DocumentReference documentReference = userRef.doc(userData.nama);
    documentReference.set(userData.toJson());
  }

  Stream<QuerySnapshot<Object?>> ambilData(){
    return userRef.snapshots();
  }

  void hapus(UserData userData){
    DocumentReference documentReference = userRef.doc(userData.nama);
    documentReference.delete();
  }

  void ubah(UserData userData){
    DocumentReference documentReference = userRef.doc(userData.nama);
    documentReference.update(userData.toJson());
  }
}