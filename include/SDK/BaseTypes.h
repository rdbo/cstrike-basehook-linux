#include <SDL2/SDL.h>

#ifdef _WIN
#include <Windows.h>
#else
typedef void* HWND;
typedef int   BOOL;
typedef unsigned long ULONG;
#endif

typedef float vec3_t[3];
typedef unsigned int string_t;
typedef float vec_t;
typedef int int32;
typedef int qboolean;
typedef unsigned char byte;
typedef unsigned long long uint64;