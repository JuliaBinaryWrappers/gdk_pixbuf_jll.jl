# Autogenerated wrapper script for gdk_pixbuf_jll for x86_64-w64-mingw32
export gdk_pixbuf_loaders_dir, gdk_pixbuf_query_loaders, libgdkpixbuf

using Glib_jll
using JpegTurbo_jll
using libpng_jll
using Libtiff_jll
using Xorg_libX11_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "PATH"
LIBPATH_default = ""

# Relative path to `gdk_pixbuf_loaders_dir`
const gdk_pixbuf_loaders_dir_splitpath = ["lib", "gdk-pixbuf-2.0", "2.10.0", "loaders"]

# This will be filled out by __init__() for all products, as it must be done at runtime
gdk_pixbuf_loaders_dir_path = ""

# gdk_pixbuf_loaders_dir-specific global declaration
# This will be filled out by __init__()
gdk_pixbuf_loaders_dir = ""


# Relative path to `gdk_pixbuf_query_loaders`
const gdk_pixbuf_query_loaders_splitpath = ["bin", "gdk-pixbuf-query-loaders.exe"]

# This will be filled out by __init__() for all products, as it must be done at runtime
gdk_pixbuf_query_loaders_path = ""

# gdk_pixbuf_query_loaders-specific global declaration
function gdk_pixbuf_query_loaders(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ';', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        LIBPATH_base = get(ENV, LIBPATH_env, expanduser(LIBPATH_default))
        if !isempty(LIBPATH_base)
            env_mapping[LIBPATH_env] = string(LIBPATH, ';', LIBPATH_base)
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(gdk_pixbuf_query_loaders_path)
    end
end


# Relative path to `libgdkpixbuf`
const libgdkpixbuf_splitpath = ["bin", "libgdk_pixbuf-2.0-0.dll"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libgdkpixbuf_path = ""

# libgdkpixbuf-specific global declaration
# This will be filled out by __init__()
libgdkpixbuf_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libgdkpixbuf = "libgdk_pixbuf-2.0-0.dll"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"gdk_pixbuf")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (Glib_jll.PATH_list, JpegTurbo_jll.PATH_list, libpng_jll.PATH_list, Libtiff_jll.PATH_list, Xorg_libX11_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (Glib_jll.LIBPATH_list, JpegTurbo_jll.LIBPATH_list, libpng_jll.LIBPATH_list, Libtiff_jll.LIBPATH_list, Xorg_libX11_jll.LIBPATH_list,))

    global gdk_pixbuf_loaders_dir_path = normpath(joinpath(artifact_dir, gdk_pixbuf_loaders_dir_splitpath...))

    global gdk_pixbuf_loaders_dir = gdk_pixbuf_loaders_dir_path
    global gdk_pixbuf_query_loaders_path = normpath(joinpath(artifact_dir, gdk_pixbuf_query_loaders_splitpath...))

    push!(PATH_list, dirname(gdk_pixbuf_query_loaders_path))
    global libgdkpixbuf_path = normpath(joinpath(artifact_dir, libgdkpixbuf_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libgdkpixbuf_handle = dlopen(libgdkpixbuf_path)
    push!(LIBPATH_list, dirname(libgdkpixbuf_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ';')
    global LIBPATH = join(vcat(LIBPATH_list, [Sys.BINDIR, joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)]), ';')

    
end  # __init__()

