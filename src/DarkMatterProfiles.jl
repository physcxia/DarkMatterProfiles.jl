module DarkMatterProfiles

export DMProfile, dmdensity, dmdensity_galactic
export EinastoProfile

abstract type DMProfile end

include("Interfaces.jl")
include("Profiles.jl")

end # module
