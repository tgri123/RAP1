@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View Order Item'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@Search.searchable: true
define view entity ztg1_c_oitem
  as projection on ztg1_i_oitem
{

      @Search.defaultSearchElement: true
  key OrderID,

      @Search.defaultSearchElement: true
  key ItemID,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.90
      ItemDescription,

      @Semantics.amount.currencyCode: 'Currency'
      UnitPrice,
      @Consumption.valueHelpDefinition: [{
          entity: {
           name: 'I_Currency',
           element: 'Currency' }
           }]
      Currency,
      CreatedBy,
      LastChangedBy,
      LocalLastChangedAt,
      _order: redirected to parent ztg1_c_order

}
