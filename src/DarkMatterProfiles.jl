module DarkMatterProfiles

export dmdensity, dmdensity_galactic
export DMPEinasto

import Base.==

abstract type DMProfile end

function ==(a::T, b::T) where T <: DMProfile
    f = fieldnames(T)
    getfield.(Ref(a),f) == getfield.(Ref(b),f)
end


include("Interfaces.jl")
include("DMProfiles.jl")

end # module
