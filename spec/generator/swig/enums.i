%module enum_test

enum e { PREFIX_FIRST, PREFIX_SECOND, PREFIX_THIRD };
enum e_2 { COMMON_FIRST = 2, COMMON_SECOND, COMMON_THIRD };
enum e_3 { AGAIN_FIRST, AGAIN_SECOND = 5, AGAIN_THIRD };
enum e_4 { E3_0, E3_1, E3_2 };
enum e_5 { ABSURD_ENUM_WITH_ONE_KEY };
enum { ANON_FIRST, ANON_SECOND, ANON_THIRD };
typedef enum { TYPEDEF_FIRST, TYPEDEF_SECOND, TYPEDEF_THIRD } e_7_t;
typedef enum e_8 { BOTH_FIRST, BOTH_SECOND, BOTH_THIRD } e_8_t;
enum e_9 { DUPLICATE_FIRST, DUPLICATE_SECOND = DUPLICATE_FIRST };
