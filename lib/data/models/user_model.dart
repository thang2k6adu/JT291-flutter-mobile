class UserModel {
  final String uid;
  final String? email;
  final String? displayName;
  final String? photoUrl;

  const UserModel({
    required this.uid,
    this.email,
    this.displayName,
    this.photoUrl,
  });

  // Chuyển đổi từ Firebase User sang UserModel
  // Khi đăng nhập với firebase auth, bạn nhận được UserObject
  // CHuyển object đó sang model của ứng dụng
  factory UserModel.fromFirebaseUser(dynamic user) {
    if (user == null) return const UserModel(uid: '');
    return UserModel(
      uid: user.uid,
      email: user.email,
      displayName: user.displayName,
      photoUrl: user.photoURL,
    );
  }

  // Chuyển user model sang dạng json (lưu vào Firestore hoặc là database, gửi data qua API)
  Map<String, dynamic> toJson() => {
    'uid': uid,
    'email': email,
    'displayName': displayName,
    'photoUrl': photoUrl,
  };

  // Chuyển từ json sang user model (Đọc data từ Firestore, database, API Respons)
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    uid: json['uid'],
    email: json['email'],
    displayName: json['displayName'],
    photoUrl: json['photoUrl'],
  );
}
