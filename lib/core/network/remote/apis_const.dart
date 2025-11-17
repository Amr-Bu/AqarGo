
class ApiConstance{
  static const String basUrl="http://192.168.2.111:8000/api/";
  static const String basUrlImage="http://192.168.2.111:8000/storage/";
  static String urlImage(String? path)=>"${basUrlImage}$path";
  static const String login="${basUrl}User/login";
  static const String register="${basUrl}User/register";
  static const String homeData="${basUrl}home-data";
  static String officeProperty(int? id)=>"${basUrl}office/getPropertyToOffice/$id";
  static String officeFollow(int? id)=>"${basUrl}followOfficeNotification/$id";
  static String officeUnFollow(int? id)=>"${basUrl}office/Unfollow/$id";
  static String getPropertyDetailes(int? id)=>"${basUrl}property/getPropertywithimageAndOffice/$id";
  static const String getStateForAdd='${basUrl}property/allstates';
  static const String getRegionForAdd='${basUrl}property/allregion';
  static const String getOfficeForAdd='${basUrl}office/indexAllOffices';
  static const String storeProperty='${basUrl}property/storePropertyWithImages';
  static const String categories="${basUrl}/categories";
  static const String profileData="${basUrl}User/UpdateProfile";
  static const String uploadProfileImage="${basUrl}User/uploadProfileImageToUser/";
  static const String addToFavorite="${basUrl}addTOFavorite";
  static const String removeFromFavorite="${basUrl}removeFromFavorite";
  static const String getFavorite="${basUrl}getFavorites";
  static const String getAreasToState="${basUrl}property/getregionToState/";
  static const String getPropertyToRegion="${basUrl}property/getPropretyToRegion/";
  static String categoriesDetailsPath(int categoryId)=>"${basUrl}/categories/$categoryId";
  static const String logOut="${basUrl}User/logout";
  static const String deleteProperty="${basUrl}property/destroyProperty/";
  static const String searchProperty="${basUrl}property/searchProperty";
  static const String addProperty="${basUrl}property/storePropertyWithImages";
  static const String saveUserToken="${basUrl}saveUserToken";


}