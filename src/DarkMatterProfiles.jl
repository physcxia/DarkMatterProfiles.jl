module DarkMatterProfiles

export dmdensity, dmdensity_galactic
export DMProfile
export DMPEinasto, DMPNFW

abstract type DMProfile end

Broadcast.broadcastable(dmp::DMProfile) = Ref(dmp)

import Base.==
function ==(a::T, b::U) where {T <: DMProfile, U <: DMProfile}
    f = fieldnames(T)
    return getfield.(Ref(a),f) == getfield.(Ref(b),f)
end

include("Interfaces.jl")
include("DMProfiles.jl")

end # module
