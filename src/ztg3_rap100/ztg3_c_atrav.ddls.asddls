@Metadata.allowExtensions: true
@EndUserText.label: 'Travel Data'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ObjectModel.sapObjectNodeType.name: 'ZTG3_ATRAV'
@ObjectModel.semanticKey: [ 'TravelId' ]
@Search.searchable: true

define root view entity ZTG3_C_ATRAV
  provider contract transactional_query
  as projection on ZTG3_I_ATRAV
{
      @Search.fuzzinessThreshold: 0.90
      @Search.defaultSearchElement: true
  key TravelId,

      @Consumption.valueHelpDefinition: [{ entity:{ name: '/DMO/I_Agency', element: 'AgencyID'} }]
      @ObjectModel.text.element: [ 'AgencyName' ]
      @Search.defaultSearchElement: true
      AgencyId,
      _Agency.Name       as AgencyName,

      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'CustomerLastName' ]
      @Consumption.valueHelpDefinition: [{ entity:{ name: '/DMO/I_Customer_StdVH', element: 'CustomerID'} }]
      CustomerId,

      _Customer.LastName as CustomerLastName,
      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,
      
      @Semantics.currencyCode: true
      @Consumption.valueHelpDefinition: [{ entity:{ name: 'I_Currency', element: 'Currency'}, useForValidation: true }]
      CurrencyCode,
      
      @Search.defaultSearchElement: true
      Description,
      
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'OverAllStatusText' ]
      @Consumption.valueHelpDefinition: [{ entity:{ name: '/DMO/I_Overall_Status_VH', element: 'OverallStatus'}, useForValidation: true }]
      OverallStatus,
      _OverallStatus._Text.Text as OverAllStatusText: localized,
      
      Attachment,
      MimeType,
      FileName,
      CreatedBy,
      CreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt

}
