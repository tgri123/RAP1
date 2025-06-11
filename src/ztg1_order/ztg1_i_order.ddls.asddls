@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Entity View Order'
@Metadata.allowExtensions: true
//@ObjectModel.sapObjectNodeType.name: 'ZFE_Travel_001521'

define root view entity ztg1_i_order
  as select from ztg1_order
  association [0..1] to ztg1_i_status_vh      as _status   on $projection.Status = _status.status
  association [0..1] to ztg1_i_customer_vh as _customer on $projection.CustomerId = _customer.CustomerID
  composition [0..*] of ztg1_i_oitem          as _items
  composition [0..*] of ztg1_i_ostatus        as _statuses

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
      _items,
      _statuses,
      _customer,
      _customer.FirstName        as CustomerFirstName,
      _customer.LastName         as CustomerLastname,
      _customer.EMailAddress     as CustomerEmailAddress
}
