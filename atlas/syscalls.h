#define ATLAS_VERSION 440

#if ATLAS_VERSION == 400

#if defined(__x86_64__)
#define SYS_atlas_next 323
#define SYS_atlas_submit 324
#define SYS_atlas_update 325
#define SYS_atlas_remove 326
#define SYS_atlas_tp_create 327
#define SYS_atlas_tp_destroy 328
#define SYS_atlas_tp_join 329
#define SYS_atlas_tp_submit 330
#elif defined(__i386__)
#define SYS_atlas_next 359
#define SYS_atlas_submit 360
#define SYS_atlas_update 361
#define SYS_atlas_remove 362
#elif defined(__arm__)
#define SYS_atlas_next 388
#define SYS_atlas_submit 389
#define SYS_atlas_update 390
#define SYS_atlas_remove 391
#define SYS_atlas_tp_create 392
#define SYS_atlas_tp_destroy 393
#define SYS_atlas_tp_join 394
#define SYS_atlas_tp_submit 395
#else
#error Architecture not supported.
#endif

#elif ATLAS_VERSION == 440

#define SYS_atlas_next 326
#define SYS_atlas_submit 327
#define SYS_atlas_update 328
#define SYS_atlas_remove 329
#define SYS_atlas_tp_create 330
#define SYS_atlas_tp_destroy 331
#define SYS_atlas_tp_join 332
#define SYS_atlas_tp_submit 333
#elif defined(__i386__)
#define SYS_atlas_next 377
#define SYS_atlas_submit 378
#define SYS_atlas_update 379
#define SYS_atlas_remove 380
#elif defined(__arm__)
#define SYS_atlas_next 388
#define SYS_atlas_submit 389
#define SYS_atlas_update 390
#define SYS_atlas_remove 391
#define SYS_atlas_tp_create 392
#define SYS_atlas_tp_destroy 393
#define SYS_atlas_tp_join 394
#define SYS_atlas_tp_submit 395

#else
#error ATLAS version not supported.
#endif
