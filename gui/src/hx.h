#ifndef STATIC_LINK
#define IMPLEMENT_API
#endif

#if defined(HX_WINDOWS) || defined(HX_MACOS) || defined(HX_LINUX)
#define NEKO_COMPATIBLE
#endif

#include <hx/CFFI.h>

// Haxe CFFI
extern "C" value init_sdl_hx(value name, value width, value height);
extern "C" value close_sdl_hx();
extern "C" value clear_screen_hx();
extern "C" value render_screen_hx();
extern "C" value play_music_hx(value music, value action);
extern "C" value poll_event_hx();
extern "C" value render_text_hx(value* args, int nargs);
extern "C" value render_quad_hx(value* args, int nargs);
extern "C" value render_texture_hx(value* args, int nargs);
