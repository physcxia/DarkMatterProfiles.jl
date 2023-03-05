module DarkMatterProfiles

export dmdensity, dmdensity_galactic
export DMPEinasto

import Base.==

abstract type DMProfile end

function ==(a::T, b::U) where {T <: DMProfile, U <: DMProfile}
    f = fieldnames(T)
    return getfield.(Ref(a),f) == getfield.(Ref(b),f)
end

include("Interfaces.jl")
include("DMProfiles.jl")

end # module
