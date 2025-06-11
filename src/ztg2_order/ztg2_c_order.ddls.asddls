@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View Order'
@Metadata.allowExtensions: true
define root view entity ztg2_c_order
  provider contract transactional_query
  as projection on ztg2_i_order
{
      @Search.defaultSearchElement: true
  key OrderId,
      @Search.defaultSearchElement: true
      OrderDescription,
      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ztg1_i_customer_vh', element: 'CustomerID'} }]
      CustomerId,
      
      @Search.defaultSearchElement: true
      CustomerFirstName,
      @Search.defaultSearchElement: true
      CustomerLastName,
      @Semantics.amount.currencyCode: 'Currency'
      @Search.defaultSearchElement: true
      TotalPrice,

      @Semantics.currencyCode: true
      @Consumption.valueHelpDefinition: [{
      entity: { element: 'Currency', name: 'I_Currency'} }]
      Currency,

      @Search.defaultSearchElement: true
      Status,
      @Search.defaultSearchElement: true
      StatusDescription,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      LocalLastChangedAt,
      _items_test: redirected to composition child ztg2_c_oitem   
      
      
}
