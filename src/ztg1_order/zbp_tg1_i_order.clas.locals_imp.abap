CLASS lhc_ztg1_i_order DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Order RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Order RESULT result.
    METHODS calculateorderid FOR DETERMINE ON SAVE
      IMPORTING keys FOR order~calculateOrderId.

ENDCLASS.

CLASS lhc_ztg1_i_order IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD calculateOrderId.

    "Next OrderId
    READ ENTITIES OF ztg1_i_order IN LOCAL MODE
     ENTITY Order ALL FIELDS WITH CORRESPONDING #( keys )
     RESULT DATA(lt_entity_order).
    DELETE lt_entity_order WHERE OrderId IS NOT INITIAL.
    SELECT MAX( order_id ) FROM ztg1_order INTO @DATA(lv_max_order_id).

    MODIFY ENTITIES OF ztg1_i_order IN LOCAL MODE
    ENTITY Order
    UPDATE FIELDS ( Orderid  )
    WITH VALUE #( FOR entity IN lt_entity_order INDEX INTO i (
    %tky = entity-%tky
    OrderId = lv_max_order_id + 1  ) ).


  ENDMETHOD.

ENDCLASS.
