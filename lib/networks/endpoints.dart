// ignore_for_file: constant_identifier_names
//live url
// const String url = "https://wedeapp.eu";
//test test
//const String url = "";
//staging

const String url = "https://crm-api.themvp.online";
// const String url = "https://wedeli-shop.dev.squaredbyte.com";

class NetworkConstants {
  static const ACCEPT = "Accept";
  static const APP_KEY = "App-Key";
  static const ACCEPT_LANGUAGE = "Accept-Language";
  static const ACCEPT_LANGUAGE_VALUE = "pt";
  static const TOKEN = "token";
  static const ACCEPT_TYPE = "application/json";
  static const AUTHORIZATION = "Authorization";
  static const CONTENT_TYPE = "content-Type";
}

class Endpoints {
  static String postlogin() => "/api/login";
  static String getLogout() => "/api/logout";
  static String getIgList() => "/api/order/getIGName";
  static String getAppStock() => "/api/order/getAppStock";
  static String getSalesReport() => "/api/PartyTDSD/get_BillAmt";
  static String getLedgerReport() => "/api/LedgerMast/Ledger";
  static String getOutStandingReport() => "/api/Party/getOutstanding";
  static String getPartyNameList() => "/api/LedgerMast/PartyName";
  static String getDashBoard() => "/api/dashboard/AppDashboardSale";
  static String getProduct() => "/api/Products/getProducts";
  ////////////////////
  static String postShopSchedule() => "/api/save-shop-schedule";
  static String getShopSchedule(String shop) => "/api/shop-schedule/$shop";
  static String postShopHolidays() => "/api/save-shop-holiday";
  static String postShopHolidaysDelete() => "/api/delete-shop-holiday";
  static String deleteShop(String shop) => "/api/shop-delete/$shop";
  static String getAllShopHolidaysList(String shop) =>
      "/api/shop-holiday-list/$shop";
  static String getShopHolidaysList(String shop,
          {int record = 10, int page = 1}) =>
      "/api/shop-holidays/$shop?number=$record&page=$page";
  static String getOrders(String status, {int record = 10, int page = 1}) =>
      "/api/order-list/$status?number=$record&page=$page";
  static String getBalanceRecord(String shop,
          {int record = 10, int page = 1}) =>
      "/api/shop-balance-record/$shop?number=$record&page=$page";
  static String getItemList(String shop, {int record = 10, int page = 1}) =>
      "/api/shop-product/$shop?number=$record&page=$page";
  static String postProductCategory() => "/api/shop-product-category-save";
  static String postOrderStatus() => "/api/order/order-status";
  static String getOrderDetails(String orderID) =>
      "/api/restaurant-order-details/$orderID";
  static String getProductCategory(String restaurantId) =>
      "/api/shop-product-category/$restaurantId";
  static String postProductCategorySave() => "/api/shop-product-category-save";
  static String getShopCategory() => "/api/shop-categories";
  static String getShopSubCategoryPopUpList(String categoriesId) =>
      "/api/shop-subcategories/$categoriesId";
  static String updateShopCategory() => "/api/shop-product-category-save";
  static String deleteProductCategory(String productCatID) =>
      "/api/shop-product-category-delete/$productCatID";
  static String getOrderCount() => "/api/shop-order-count";
  static String postSaveShopBasic() => "/api/save-shop-basic";
  static String getCustomerRange() => "/api/shop-customer-range";
  static String postShopCustomerRange(String shop) =>
      "/api/save-shop-customer-range/$shop";
  static String postProductBasic() => "/api/save-product-basic";
  static String postProductPriching() => "/api/save-product-pricing";
  static String postProductAddonSave() => "/api/product-addon-save";
  static String postShowProductAddon(String foodId,
          {int record = 10, int page = 1}) =>
      "/api/product-addon-list/$foodId?number=$record&page=$page";
  static String deleteProductAddon(String addonId) =>
      "/api/product-addon-delete/$addonId";
  static String getShowShopProduct(String foodId) =>
      "/api/show-shop-product/$foodId";

  static String postDeviceToken() => "/api/device-token";
  static String deleteProductOptionPrice() => "/api/delete-product-pricing";
  static String postOrderAcceptReject(String orderNO, int status) =>
      "/api/order/$orderNO/accept-reject/$status";
}
