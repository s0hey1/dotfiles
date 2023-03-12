
// build command:  gcc get_currtime.c -shared -o get_currtime.so -fPIC  -llua}
// import library:  local currtime = require("plugins.get_currtime")

#ifdef __cplusplus
#include "lua.hpp"
#else
#include "lauxlib.h"
#include "lua.h"
#include "lualib.h"
#endif
#include <math.h>

// so that name mangling doesn't mess up function names
#ifdef __cplusplus
extern "C" {
#endif

#include <time.h>

/// Convert seconds to milliseconds
#define SEC_TO_MS(sec) ((sec)*1000)
/// Convert seconds to microseconds
#define SEC_TO_US(sec) ((sec)*1000000)
/// Convert seconds to nanoseconds
#define SEC_TO_NS(sec) ((sec)*1000000000)

/// Convert nanoseconds to seconds
#define NS_TO_SEC(ns) ((ns) / 1000000000)
/// Convert nanoseconds to milliseconds
#define NS_TO_MS(ns) ((ns) / 1000000)
/// Convert nanoseconds to microseconds
#define NS_TO_US(ns) ((ns) / 1000)

static int millis(lua_State *L) {
    struct timespec ts;
    int return_code = timespec_get(&ts, TIME_UTC);
    uint64_t ms = 0;
    if (return_code == 0) {
        printf("Failed to obtain timestamp.\n");
        ms = UINT64_MAX; // use this to indicate error
    } else {
        ms = SEC_TO_MS((uint64_t)ts.tv_sec) + NS_TO_MS((uint64_t)ts.tv_nsec);
    }
    // push the results
    lua_pushnumber(L, ms);

    // return number of results
    return 1;
}
static int micros(lua_State *L) {
    struct timespec ts;
    int return_code = timespec_get(&ts, TIME_UTC);
    uint64_t us = 0;
    if (return_code == 0) {
        printf("Failed to obtain timestamp.\n");
        us = UINT64_MAX; // use this to indicate error
    } else {
        us = SEC_TO_US((uint64_t)ts.tv_sec) + NS_TO_US((uint64_t)ts.tv_nsec);
    }
    // push the results
    lua_pushnumber(L, us);

    // return number of results
    return 1;
}
static int nanos(lua_State *L) {
    struct timespec ts;
    uint64_t ns;
    int return_code = timespec_get(&ts, TIME_UTC);
    if (return_code == 0) {
        printf("Failed to obtain timestamp.\n");
        ns = UINT64_MAX; // use this to indicate error
        //
    } else {
        // `ts` now contains your timestamp in seconds and nanoseconds! To
        // convert the whole struct to nanoseconds, do this:
        ns = SEC_TO_NS((uint64_t)ts.tv_sec) + (uint64_t)ts.tv_nsec;
    }
    // push the results
    lua_pushnumber(L, ns);

    // return number of results
    return 1;
}

// library to be registered
static const struct luaL_Reg currtime_lib[] = {
    {"millis", millis},
    {"micros", micros},
    {"nanos", nanos},
    {NULL, NULL} /* sentinel */
};

// name of this function is not flexible
int luaopen_plugins_get_currtime(lua_State *L) {
    luaL_newlib(L, currtime_lib);
    return 1;
}

#ifdef __cplusplus
}
#endif
