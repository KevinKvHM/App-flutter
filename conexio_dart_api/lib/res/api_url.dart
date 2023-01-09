class AppUrl {
  static var baseUrl = "https://api-render-production.up.railway.app";
  //static var baseUrl = "https://becas-api.onrender.com";
  // static var baseUrl = "http://localhost:5000";

  static var loginEndPoint = "$baseUrl/api/users/signin";
  static var registerEndPoint = "$baseUrl/api/users/signup";

  static var userListGellAllEndPoint = "$baseUrl/api/users";

  static var userUpdateRole = '$baseUrl/api/user-role/update/';
  static var userDeleteUser = '$baseUrl/api/users/delete/';
  static var userUpdatePassword = '$baseUrl/api/users/update/';
  static var employeeDataUpdate = '$baseUrl/api/employee-data/';
  static var userIdDataEndPoint = "$baseUrl/api/user-data/";

  static var sareListGellAllEndPoint = "$baseUrl/api/v1/sares";
  //rutas para region
  static var addRegionEndPoint = "$baseUrl/api/v1/region";
  static var regionListGellAllEndPoint = "$baseUrl/api/v1/regiones";
  static var regionUpdateEndPoint = "$baseUrl/api/v1/region/";
  static var regionGetIdEndPoint = "$baseUrl/api/v1/region/";
  static var regionDeleteEndPoint = "$baseUrl/api/v1/region/";
  //rutas para municipio
  static var addMunicipioEndPoint = "$baseUrl/api/v1/municipio";
  static var municipioListGellAllEndPoint = "$baseUrl/api/v1/municipios";
  static var municipioUpdateAllEndPoint = "$baseUrl/api/v1/municipio/";
  static var municipioDeleteEndPoint = "$baseUrl/api/v1/municipio/";

  //rutas para localidad
  static var addLocalidadEndPoint = "$baseUrl/api/v1/localidad";
  static var localidadListGellAllEndPoint = "$baseUrl/api/v1/localidades";
  static var localidadUpdateEndPoint = "$baseUrl/api/v1/localidades/";
  static var localidDeleteEndPoint = "$baseUrl/api/v1/localidades/";

  // rutas para Scholls
  static var schoolListGellAllEndPoint = "$baseUrl/api/v1/schools";
  static var addSchollEndPoint = "$baseUrl/api/v1/school";
  static var schoolUpdateEndPoint = "$baseUrl/api/v1/school/";
  static var directorUpdateEndPoint = "$baseUrl/api/v1/directorUpdate/";
  static var supervisorUpdateEndPoint = "$baseUrl/api/v1/supervisorUpdate/";
  static var schoollDeleteEndPoint = "$baseUrl/api/v1/school/";

  //todas los municipios que le pertenecen a una region
  static var muniRegionListGellAllEndPoint =
      "$baseUrl/api/v1/regiones/1/municipios";
  // ruta para traer todas las localides que le pertenecen a un municipio
  static var localidadMuniListGellAllEndPoint =
      "$baseUrl/api/v1/municipios/:id/localidades";
  static var addSaresEndPoint = "$baseUrl/api/v1/sare";
  static var deleteSaresEndPoint = "$baseUrl/api/v1/sare/";

//rol
  static var listAllRoles = "$baseUrl/api/roles";
  static var updateSares = "$baseUrl/api/v1/sare/";
}
