module gdk_pixbuf_jll

if isdefined(Base, :Experimental) && isdefined(Base.Experimental, Symbol("@optlevel"))
    @eval Base.Experimental.@optlevel 0
end                    
                        
if VERSION < v"1.3.0-rc4"
    # We lie a bit in the registry that JLL packages are usable on Julia 1.0-1.2.
    # This is to allow packages that might want to support Julia 1.0 to get the
    # benefits of a JLL package on 1.3 (requiring them to declare a dependence on
    # this JLL package in their Project.toml) but engage in heroic hacks to do
    # something other than actually use a JLL package on 1.0-1.2.  By allowing
    # this package to be installed (but not loaded) on 1.0-1.2, we enable users
    # to avoid splitting their package versions into pre-1.3 and post-1.3 branches
    # if they are willing to engage in the kinds of hoop-jumping they might need
    # to in order to install binaries in a JLL-compatible way on 1.0-1.2. One
    # example of this hoop-jumping being to express a dependency on this JLL
    # package, then import it within a `VERSION >= v"1.3"` conditional, and use
    # the deprecated `build.jl` mechanism to download the binaries through e.g.
    # `BinaryProvider.jl`.  This should work well for the simplest packages, and
    # require greater and greater heroics for more and more complex packages.
    error("Unable to import gdk_pixbuf_jll on Julia versions older than 1.3!")
end

using Pkg, Pkg.BinaryPlatforms, Pkg.Artifacts, Libdl
import Base: UUID

# We put these inter-JLL-package API values here so that they are always defined, even if there
# is no underlying wrapper held within this JLL package.
const PATH_list = String[]
const LIBPATH_list = String[]

# Load Artifacts.toml file
artifacts_toml = joinpath(@__DIR__, "..", "Artifacts.toml")

# Extract all platforms
artifacts = Pkg.Artifacts.load_artifacts_toml(artifacts_toml; pkg_uuid=UUID("da03df04-f53b-5353-a52f-6a8b0620ced0"))
platforms = [Pkg.Artifacts.unpack_platform(e, "gdk_pixbuf", artifacts_toml) for e in artifacts["gdk_pixbuf"]]

# Filter platforms based on what wrappers we've generated on-disk
filter!(p -> isfile(joinpath(@__DIR__, "wrappers", replace(triplet(p), "arm-" => "armv7l-") * ".jl")), platforms)

# From the available options, choose the best platform
best_platform = select_platform(Dict(p => triplet(p) for p in platforms))

# Silently fail if there's no binaries for this platform
if best_platform === nothing
    @debug("Unable to load gdk_pixbuf; unsupported platform $(triplet(platform_key_abi()))")
else
    # Load the appropriate wrapper.  Note that on older Julia versions, we still
    # say "arm-linux-gnueabihf" instead of the more correct "armv7l-linux-gnueabihf",
    # so we manually correct for that here:
    best_platform = replace(best_platform, "arm-" => "armv7l-")
    include(joinpath(@__DIR__, "wrappers", "$(best_platform).jl"))
end

end  # module gdk_pixbuf_jll
