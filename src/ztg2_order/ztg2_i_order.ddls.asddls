@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@EndUserText.label: 'Order'
define root view entity ztg2_i_order
  as select from ztg2_order 
  association [0..1] to ztg1_i_status_vh as _status on $projection.Status = _status.status
  association [0..1] to ztg1_i_customer_vh as _customer on $projection.CustomerId = _customer.CustomerID
  composition [0..*] of ztg2_i_oitem as _items_test  
  
{

  key order_id                   as OrderId,
      order_description          as OrderDescription,
      customer_id                as CustomerId,
      @Semantics.amount.currencyCode: 'Currency'
      total_price                as TotalPrice,
      currency                   as Currency,
      status                     as Status,
      @Semantics.user.createdBy: true
      created_by                 as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at                 as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by            as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at            as LastChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at      as LocalLastChangedAt,
      _status,
      _status.status_description as StatusDescription, 
      _customer, 
      _customer.FirstName as CustomerFirstName,
      _customer.LastName as CustomerLastName,
      _items_test 
}
