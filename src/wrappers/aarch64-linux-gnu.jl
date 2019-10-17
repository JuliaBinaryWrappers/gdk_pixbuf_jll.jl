# Autogenerated wrapper script for gdk_pixbuf_jll for aarch64-linux-gnu
export libgdkpixbuf, gdk_pixbuf_query_loaders, gdk_pixbuf_loaders_dir

using Glib_jll
using JpegTurbo_jll
using libpng_jll
using Libtiff_jll
using X11_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `libgdkpixbuf`
const libgdkpixbuf_splitpath = ["lib", "libgdk_pixbuf-2.0.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libgdkpixbuf_path = ""

# libgdkpixbuf-specific global declaration
# This will be filled out by __init__()
libgdkpixbuf_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libgdkpixbuf = "libgdk_pixbuf-2.0.so.0"


# Relative path to `gdk_pixbuf_query_loaders`
const gdk_pixbuf_query_loaders_splitpath = ["bin", "gdk-pixbuf-query-loaders"]

# This will be filled out by __init__() for all products, as it must be done at runtime
gdk_pixbuf_query_loaders_path = ""

# gdk_pixbuf_query_loaders-specific global declaration
function gdk_pixbuf_query_loaders(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        if !isempty(get(ENV, LIBPATH_env, ""))
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', ENV[LIBPATH_env])
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(gdk_pixbuf_query_loaders_path)
    end
end


# Relative path to `gdk_pixbuf_loaders_dir`
const gdk_pixbuf_loaders_dir_splitpath = ["lib", "gdk-pixbuf-2.0", "2.10.0", "loaders"]

# This will be filled out by __init__() for all products, as it must be done at runtime
gdk_pixbuf_loaders_dir_path = ""

# gdk_pixbuf_loaders_dir-specific global declaration
# This will be filled out by __init__()
gdk_pixbuf_loaders_dir = ""


"""
Open all libraries
"""
function __init__()
    global prefix = abspath(joinpath(@__DIR__, ".."))

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    append!.(Ref(PATH_list), (Glib_jll.PATH_list, JpegTurbo_jll.PATH_list, libpng_jll.PATH_list, Libtiff_jll.PATH_list, X11_jll.PATH_list,))
    append!.(Ref(LIBPATH_list), (Glib_jll.LIBPATH_list, JpegTurbo_jll.LIBPATH_list, libpng_jll.LIBPATH_list, Libtiff_jll.LIBPATH_list, X11_jll.LIBPATH_list,))

    global libgdkpixbuf_path = abspath(joinpath(artifact"gdk_pixbuf", libgdkpixbuf_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libgdkpixbuf_handle = dlopen(libgdkpixbuf_path)
    push!(LIBPATH_list, dirname(libgdkpixbuf_path))

    global gdk_pixbuf_query_loaders_path = abspath(joinpath(artifact"gdk_pixbuf", gdk_pixbuf_query_loaders_splitpath...))

    push!(PATH_list, dirname(gdk_pixbuf_query_loaders_path))
    global gdk_pixbuf_loaders_dir_path = abspath(joinpath(artifact"gdk_pixbuf", gdk_pixbuf_loaders_dir_splitpath...))

    global gdk_pixbuf_loaders_dir = gdk_pixbuf_loaders_dir_path
    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

