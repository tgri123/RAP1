CLASS lhc_ztg3_i_atrav DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR Travel
        RESULT result,
      earlynumbering_create FOR NUMBERING
        IMPORTING entities FOR CREATE Travel.
ENDCLASS.

CLASS lhc_ztg3_i_atrav IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.
  METHOD earlynumbering_create.

*    DATA: entity TYPE STRUCTURE FOR CREATE ztg3_i_atrav.
*    LOOP AT entities INTO entity WHERE TravelId IS NOT INITIAL.
*      APPEND CORRESPONDING #( entity ) TO mapped-travel.
*    ENDLOOP.
*
*    DATA(entities_wo_id) = entities.
*    DELETE entities_wo_id WHERE TravelId IS NOT INITIAL.
*
*    SELECT SINGLE FROM ztg3_atrav FIELDS MAX( travel_id ) AS travelID INTO @DATA(lv_travel_id_max).
*    SELECT SINGLE FROM ztg3_atrav_d FIELDS MAX( travelid ) AS travelID INTO @DATA(lv_travel_id_draft_max).
*    IF lv_travel_id_draft_max > lv_travel_id_max.
*      lv_travel_id_max = lv_travel_id_draft_max.
*    ENDIF.
*
*    LOOP AT entities_wo_id INTO entity.
*      lv_travel_id_max += 1.
*      entity-TravelId = lv_travel_id_max.
*      APPEND VALUE #( %cid = entity-%cid
*                      %key = entity-%key
*                      %is_draft = entity-%is_draft
*                      ) TO mapped-travel.
*    ENDLOOP.

    DATA: entity TYPE STRUCTURE FOR CREATE ztg3_i_atrav.
    SELECT SINGLE FROM ztg3_atrav FIELDS MAX( travel_id ) AS travelID INTO @DATA(lv_travel_id_max).
    SELECT SINGLE FROM ztg3_atrav_d FIELDS MAX( travelid ) AS travelID INTO @DATA(lv_travel_id_draft_max).
    IF lv_travel_id_draft_max > lv_travel_id_max.
      lv_travel_id_max = lv_travel_id_draft_max.
    ENDIF.

    LOOP AT entities INTO entity.
      IF entity-TravelId IS NOT INITIAL.
        APPEND CORRESPONDING #( entity ) TO mapped-travel.
      ELSE.
        lv_travel_id_max += 1.
        entity-TravelId = lv_travel_id_max.
      ENDIF.
      APPEND CORRESPONDING #( entity ) TO mapped-travel.
    ENDLOOP.


  ENDMETHOD.

ENDCLASS.
