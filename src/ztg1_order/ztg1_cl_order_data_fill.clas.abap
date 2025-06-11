CLASS ztg1_cl_order_data_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ztg1_cl_order_data_fill IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: lt_data_order     TYPE STANDARD TABLE OF ztg1_order,
          lt_data_item      TYPE STANDARD TABLE OF ztg1_oitem,
          lt_data_status    TYPE STANDARD TABLE OF ztg1_ostatus,
          lt_data_status_c  TYPE STANDARD TABLE OF ztg1_cstatus,
          lt_data_customer  TYPE STANDARD TABLE OF ztg1_customer,
          lv_create_at      TYPE abp_creation_tstmpl,
          lv_update_at      TYPE abp_creation_tstmpl,
          lv_counter        TYPE i,
          lv_unit_price     TYPE ztg1_oitem-unit_price,
          lv_total_price    TYPE ztg1_order-total_price,
          lv_counter_status TYPE ztg1_ostatus-status,
          lv_counter_item   TYPE ztg1_oitem-item_id.

    DELETE FROM ztg1_cstatus.
    DELETE FROM ztg1_order.
    DELETE FROM ztg1_oitem.
    DELETE FROM ztg1_ostatus.
    DELETE FROM ztg1_customer.

    DO 100 TIMES.
      GET TIME STAMP FIELD lv_create_at.
      GET TIME STAMP FIELD lv_update_at.

      lv_counter = lv_counter + 1.
      CLEAR lv_counter_item.
      DO 10 TIMES.

        lv_counter_item = lv_counter_item + 1.
        lv_unit_price = 100 + lv_counter_item.
        lv_unit_price = lv_unit_price + lv_total_price.
        APPEND VALUE ztg1_oitem( order_id = lv_counter item_id = lv_counter_item currency = 'EUR'
                                item_description = |Order { lv_counter } Item { lv_counter_item } Description|
                                created_by = sy-uname unit_price = lv_unit_price ) TO lt_data_item.

      ENDDO.

      APPEND VALUE ztg1_order( order_id = lv_counter created_at = lv_create_at created_by = sy-uname currency = 'EUR' customer_id = CONV #( lv_counter )
                                 order_description = |Order { lv_counter } Description| status = '1' total_price = 200 + lv_counter ) TO lt_data_order.

      CLEAR lv_counter_status.
      DO 4 TIMES.
        lv_counter_status = lv_counter_status + 1.
        APPEND VALUE ztg1_ostatus( order_id = lv_counter created_at = lv_create_at created_by = sy-uname
                                  additional_text = |AdditionalText Status { lv_counter }| status = lv_counter_status ) TO lt_data_status.

      ENDDO.

    ENDDO.

    lt_data_status_c = VALUE #(
    ( status = '1' status_description = 'Created' )
    ( status = '2' status_description = 'Processed' )
    ( status = '3' status_description = 'Paid' )
    ( status = '4' status_description = 'Completed' ) ).


    SELECT * FROM /dmo/customer INTO CORRESPONDING FIELDS OF TABLE @lt_data_customer UP TO 100 ROWS.


    INSERT ztg1_cstatus FROM TABLE @lt_data_status_c.
    INSERT ztg1_order FROM TABLE @lt_data_order.
    INSERT ztg1_oitem FROM TABLE @lt_data_item.
    INSERT ztg1_ostatus FROM TABLE @lt_data_status.
    INSERT ztg1_customer FROM TABLE @lt_data_customer.

  ENDMETHOD.
ENDCLASS.
