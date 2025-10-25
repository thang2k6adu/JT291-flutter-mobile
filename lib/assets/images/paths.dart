enum ImagePath {
  //Image Name
  splash,
  profileBackground,
  // notFound
}

class ImagePaths {
  static const Map<ImagePath, String> images = {
    //Icons
    // ImagePath.notFound1: 'lib/assets/images/common/not-found.png',
    ImagePath.splash: 'lib/assets/images/splash/splash.png',
    ImagePath.profileBackground: 'lib/assets/images/demo3.jpg',
  };

  static String getPath(ImagePath key) {
    if (!images.containsKey(key)) {
      return '';
    }
    return images[key]!;
  }
}