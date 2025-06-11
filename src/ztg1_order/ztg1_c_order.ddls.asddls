@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View Order'
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: [ 'OrderId' ]
@Search.searchable: true
define root view entity ztg1_c_order
  provider contract transactional_query
  as projection on ztg1_i_order as _Order
{
      @Search.defaultSearchElement: true
  key OrderId,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.90
      OrderDescription,

      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{
        entity : {
        element: 'CustomerID',
        name: 'ztg1_i_customer_vh'} }]
      CustomerId,

      @Search.defaultSearchElement: true
      @Semantics.amount.currencyCode: 'Currency'
      TotalPrice,
      @Consumption.valueHelpDefinition: [{
          entity: {
              name: 'I_Currency',
              element: 'Currency' }
          }]
      Currency,
      @Search.defaultSearchElement: true

      @Consumption.valueHelpDefinition: [{
        entity: {
            name: 'ztg1_i_status_vh',
            element: 'status' } }]
      Status,

      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      LocalLastChangedAt,
      _status,

      @Search.defaultSearchElement: true
      StatusDescription,

      @Search.defaultSearchElement: true
      CustomerFirstName,
      @Search.defaultSearchElement: true
      CustomerLastname,
      @Search.defaultSearchElement: true
      CustomerEmailAddress,

      _items    : redirected to composition child ztg1_c_oitem,
      _statuses : redirected to composition child ztg1_c_ostatus
}
