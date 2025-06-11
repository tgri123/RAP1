@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Entity View Order Status'
@Metadata.allowExtensions: true

define view entity ztg1_i_ostatus as select from ztg1_ostatus
association to parent ztg1_i_order as _order on $projection.OrderID = _order.OrderId 
{
     
  key order_id    as OrderID,
  key status     as Status,
  additional_text as AdditionalText,
  @Semantics.user.createdBy: true
  created_by      as createdBy,
  @Semantics.systemDateTime.createdAt: true
  created_at       as CreatedAT,
  _order
}
