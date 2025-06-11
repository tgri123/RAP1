@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View Order Item'
@Metadata.allowExtensions: true
define view entity ztg2_c_oitem as projection on ztg2_i_oitem
{
    key OrderId,
    key ItemId,
    ItemDescription,
    @Semantics.amount.currencyCode: 'Currency'
    UnitPrice,
    Currency,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    LocalLastChangedAt,
    /* Associations */
    _Order: redirected to parent ztg2_c_order
}
