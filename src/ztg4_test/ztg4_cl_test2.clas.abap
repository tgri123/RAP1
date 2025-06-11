CLASS ztg4_cl_test2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: test.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ztg4_cl_test2 IMPLEMENTATION.
  METHOD test.

    DATA(lo) = NEW ztg4_cl_test( ).
    lo->test_method_b(  ).
    ztg4_cl_test=>test_method_b(  ).

  ENDMETHOD.

ENDCLASS.
