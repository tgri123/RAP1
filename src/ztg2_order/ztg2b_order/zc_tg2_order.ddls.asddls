@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
@ObjectModel.sapObjectNodeType.name: 'ZTG2B_ORDER'
define root view entity ZC_TG2_ORDER
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_TG2_ORDER
{
  key OrderId,
  OrderDescription,
  CustomerId,
  TotalPrice,
  @Semantics.currencyCode: true
  Currency,
  Status,
  CreatedBy,
  CreatedAt,
  LastChangedBy,
  LastChangedAt,
  LocalLastChangedAt
  
}
