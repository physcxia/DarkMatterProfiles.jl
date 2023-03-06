@doc raw"""
Einasto Profile

```math
    ρ^\text{EIN}_χ(r)
=
    ρ_χ^\text{loc}
    \exp\left[
        -\frac{2}{α}\left(\frac{r^α-R_{⊙}^α} {R_\text{s}^α}\right)
    \right]
```

# Fields
- `rho0::T<:Number`: ``ρ_χ^\text{loc}``
- `rsun::U<:Number`: ``R_⊙``
- `rs::U<:Number`: ``R_\text{s}``
- `alpha::V<:Number`: ``α``
"""
Base.@kwdef mutable struct DMPEinasto{T <: Number, U <: Number, V <: Number} <: DMProfile
    rho0::T = 0.3
    rsun::U = 8.5
    rs::U = 20.0
    alpha::V = 0.17
end
function DMPEinasto(rho0::Number, rsun::Number, rs::Number, alpha::Number)
    return DMPEinasto(rho0, promote(rsun, rs)..., alpha)
end

function dmdensity(p::DMPEinasto, r::Number)
    return p.rho0 * exp((-2 / p.alpha) * ((r/p.rs)^p.alpha - (p.rsun/p.rs)^p.alpha))
end
