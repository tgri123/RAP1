@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Status Value Help'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #CUSTOMIZING
}
define view entity ztg1_i_status_vh
  as select from ztg1_cstatus
{
        @Search.defaultSearchElement: true
        @UI.lineItem: [{importance: #HIGH}]
  key   status as status,
        status_description
}
