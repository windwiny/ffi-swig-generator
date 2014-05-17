%module mod1

%{
require 'ffi'
module Mod1
  extend FFI::Library
  #ffi_lib 'mod1'
%}



typedef struct test_stt_1 {
        int i;
        float f;
        double df;
} test_stt_2;
typedef struct test_stt_1 test_stt_3;
typedef        test_stt_2 test_stt_4;



typedef union test_unn_1 {
        char msg[8];
        char c;
        short s;
        int i;
        long long l;
} test_unn_2;
typedef union  test_unn_1 test_unn_3;
typedef        test_unn_2 test_unn_4;



typedef enum test_enm_1 {
	AA,  BB=11,  CC,  DD=33,  EE
} test_enm_2;
typedef enum   test_enm_1 test_enm_3;
typedef        test_enm_2 test_enm_4;



struct test_stt_1 * func_st_11(struct test_stt_1 x, struct test_stt_1 *y);
       test_stt_2 * func_st_12(       test_stt_2 x,        test_stt_2 *y);
       test_stt_3   func_st_13(       test_stt_3 x,        test_stt_3 *y);
       test_stt_4   func_st_14(       test_stt_4 x,        test_stt_4 *y);

union  test_unn_1 * func_un_11(union  test_unn_1 x, union  test_unn_1 *y);
       test_unn_2 * func_un_12(       test_unn_2 x,        test_unn_2 *y);
       test_unn_3   func_un_13(       test_unn_3 x,        test_unn_3 *y);
       test_unn_4   func_un_14(       test_unn_4 x,        test_unn_4 *y);

enum   test_enm_1 * func_em_11(enum   test_enm_1 x, enum   test_enm_1 *y);
       test_enm_2 * func_em_12(       test_enm_2 x,        test_enm_2 *y);
       test_enm_3   func_em_13(       test_enm_3 x,        test_enm_3 *y);
       test_enm_4   func_em_14(       test_enm_4 x,        test_enm_4 *y);


%{
end
%}
