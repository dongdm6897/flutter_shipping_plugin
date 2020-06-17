class ApiList {
  static const String API_GET_PROVINCE = "get_province";
  static const String API_GET_DISTRICT = "get_district";
  static const String API_GET_WARD = "get_ward";
  static const String API_GET_SHIPPING_INFORMATION = "get_shipping_information";
  static const String API_SET_SHIPPING_STATUS = "set_shipping_status";
//  static const String API_GET_STREET = "get_street";

  ///GHN
  static const String API_GHN_CALCULATE_FEE = "CalculateFee";
  static const String API_GHN_CREATE_ORDER = "CreateOrder";
//  static const String API_GHN_GET_PROVINCE= "/areas/province";
  static const String API_GHN_GET_DISTRICT = "GetDistricts";
  static const String API_GHN_GET_COMMUNE = "GetWards";
  static const String API_GHN_FIND_AVAILABLE_SERVICES = 'FindAvailableServices';

  ///SUPER SHIP
  static const String API_SUPERSHIP_CALCULATE_FEE = "orders/fee";
  static const String API_SUPERSHIP_CREATE_ORDER = "orders/add";
  static const String API_SUPERSHIP_GET_PROVINCE = "areas/province";
  static const String API_SUPERSHIP_GET_DISTRICT = "areas/district";
  static const String API_SUPERSHIP_GET_COMMUNE = "areas/commune";

  ///GHTK
  static const String API_GHTK_CALCULATE_FEE = "shipment/fee";
}
