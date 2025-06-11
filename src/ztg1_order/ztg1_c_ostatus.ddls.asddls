@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View Order Item'
@Metadata.ignorePropagatedAnnotations: true
define view entity ztg1_c_ostatus
  as projection on ztg1_i_ostatus
{

      @Search.defaultSearchElement: true
  key OrderID,

      @Search.defaultSearchElement: true
  key Status,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.90
      AdditionalText,
      createdBy,

      CreatedAT,
      _order : redirected to parent ztg1_c_order

}
