///
/// Define const value for working with master data values.
/// This value need equal to ID of status inside master data
///

class ServerUrlEnum {
  static const String SUPER_SHIP = "https://api.mysupership.vn/v1/partner";
  static const String GHN = "https://dev-online-gateway.ghn.vn/apiv3-api/api/v1/apiv3";
}

class SuffixEstimateFee{
  static const String SUPER_SHIP = "orders/fee";
  static const String GHN = "CalculateFee";

}

class SuffixOrderCreate{
  static const String SUPER_SHIP = "orders/add";
  static const String GHN = "CreateOrder";
}

class ShipProviderEnum{
  static const int SUPER_SHIP = 1;
  static const int GHN = 2;

}
