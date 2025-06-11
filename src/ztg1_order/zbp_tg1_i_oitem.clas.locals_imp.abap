CLASS lhc_OrderItem DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS calculateItemId FOR DETERMINE ON SAVE
      IMPORTING keys FOR OrderItem~calculateItemId.

ENDCLASS.

CLASS lhc_OrderItem IMPLEMENTATION.

  METHOD calculateItemId.

    READ ENTITIES OF ztg1_i_order IN LOCAL MODE
    ENTITY OrderItem ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_entity_order_item).
    LOOP AT lt_entity_order_item ASSIGNING FIELD-SYMBOL(<order_item>).
      DATA(lt_entity_order_item_count) = lt_entity_order_item.
      DELETE lt_entity_order_item_count WHERE OrderID NE <order_item>-OrderID.
      SORT lt_entity_order_item_count BY ItemID DESCENDING.
      IF lt_entity_order_item_count IS NOT INITIAL.
        DATA(lv_max_itemid) = lt_entity_order_item_count[ 1 ]-OrderID.
      ENDIF.

      MODIFY ENTITIES OF ztg1_i_order IN LOCAL MODE
      ENTITY OrderItem
      UPDATE FIELDS ( ItemID )
      WITH VALUE #(
        FOR entity_order_item IN lt_entity_order_item_count INDEX INTO i (
        %tky = entity_order_item-%tky
        ItemID = lv_max_itemid + i
        )
        ).

    ENDLOOP.


  ENDMETHOD.

ENDCLASS.
