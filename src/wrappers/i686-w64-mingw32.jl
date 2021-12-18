# Autogenerated wrapper script for gdk_pixbuf_jll for i686-w64-mingw32
export gdk_pixbuf_loaders_dir, gdk_pixbuf_query_loaders, libgdkpixbuf

using Glib_jll
using JpegTurbo_jll
using libpng_jll
using Libtiff_jll
JLLWrappers.@generate_wrapper_header("gdk_pixbuf")
JLLWrappers.@declare_file_product(gdk_pixbuf_loaders_dir)
JLLWrappers.@declare_library_product(libgdkpixbuf, "libgdk_pixbuf-2.0-0.dll")
JLLWrappers.@declare_executable_product(gdk_pixbuf_query_loaders)
function __init__()
    JLLWrappers.@generate_init_header(Glib_jll, JpegTurbo_jll, libpng_jll, Libtiff_jll)
    JLLWrappers.@init_file_product(
        gdk_pixbuf_loaders_dir,
        "lib\\gdk-pixbuf-2.0\\2.10.0\\loaders",
    )

    JLLWrappers.@init_library_product(
        libgdkpixbuf,
        "bin\\libgdk_pixbuf-2.0-0.dll",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_executable_product(
        gdk_pixbuf_query_loaders,
        "bin\\gdk-pixbuf-query-loaders.exe",
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
