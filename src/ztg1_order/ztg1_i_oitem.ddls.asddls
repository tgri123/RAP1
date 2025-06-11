@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Entity View Order Items'
@Metadata.allowExtensions: true

define view entity ztg1_i_oitem
  as select from ztg1_oitem
  association to parent ZTG1_I_ORDER as _order on $projection.OrderID = _order.OrderId

{

  key order_id              as OrderID,
  key item_id               as ItemID,
      item_description      as ItemDescription,
      @Semantics.amount.currencyCode: 'Currency'
      unit_price            as UnitPrice,
      currency              as Currency,
      @Semantics.user.createdBy: true
      created_by            as CreatedBy,
      @Semantics.user.lastChangedBy: true
      last_changed_by       as LastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      _order

}
