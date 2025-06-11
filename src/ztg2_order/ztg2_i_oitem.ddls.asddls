@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Entity View Order Item'
@Metadata.allowExtensions: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ztg2_i_oitem as select from ztg2_oitem 
association to parent ztg2_i_order as _Order on $projection.OrderId = _Order.OrderId
{
    key order_id as OrderId,
    key item_id as ItemId,
   
    item_description as ItemDescription,
    
    @Semantics.amount.currencyCode: 'Currency'
    unit_price as UnitPrice,
    
    currency as Currency,
    
    @Semantics.user.createdBy: true
    created_by as CreatedBy,
    
    @Semantics.systemDateTime.createdAt: true
    created_at as CreatedAt,
        
    @Semantics.user.lastChangedBy: true
    last_changed_by as LastChangedBy,
    
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed_at as LastChangedAt,
    
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    local_last_changed_at as LocalLastChangedAt, 
    _Order
    
    
}
