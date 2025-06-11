CLASS lhc_Order DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR _Order RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR _Order RESULT result.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR _Order RESULT result.

    METHODS setCompleted FOR MODIFY
      IMPORTING keys FOR ACTION _Order~setCompleted RESULT result.

ENDCLASS.

CLASS lhc_Order IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD get_instance_features.

    READ ENTITIES OF ztg2_i_order IN LOCAL MODE
    ENTITY _order
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(order_data)
    FAILED failed.

    result = VALUE #( FOR order_record IN order_data
    LET setCompleted_value = COND #( WHEN order_record-Status = 04
                                     THEN if_abap_behv=>fc-o-disabled
                                     ELSE if_abap_behv=>fc-o-enabled )
    IN ( %tky = order_record-%tky %action-setCompleted = setcompleted_value ) ).

  ENDMETHOD.

  METHOD setCompleted.

    MODIFY ENTITIES OF ztg2_i_order IN LOCAL MODE
    ENTITY _Order
    UPDATE FIELDS ( status )
    WITH VALUE #( FOR key IN keys ( %tky =  key-%tky status = 4 ) )
    FAILED failed
    REPORTED reported.

    READ ENTITIES OF ztg2_i_order IN LOCAL MODE
    ENTITY _order
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(order_data).

    result = VALUE #( FOR order_record IN order_data ( %tky = order_record-%tky %param = order_record ) ).




  ENDMETHOD.

ENDCLASS.
