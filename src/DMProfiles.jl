@doc raw"""
Einasto Profile

```math
    \rho^\mathrm{EIN}_\chi(r)
=
    \rho_\chi^\text{loc}
    \exp\left[
        -\frac{2}{\alpha}\left(\frac{r^\alpha-R_{\odot}^\alpha} {R_\text{s}^\alpha}\right)
    \right]
```

# Fields
- `rho0::T`: ``\rho_\chi^\text{loc}``
- `rsun::U`: ``R_\odot``
- `rs::U`: ``R_\text{s}``
- `alpha::V`: ``\alpha``
"""
mutable struct DMPEinasto{T <: Number, U <: Number, V <: Number} <: DMProfile
    rho0::T
    rsun::U
    rs::U
    alpha::V
end
function DMPEinasto(rho0::Number, rsun::Number, rs::Number, alpha::Number)
    return DMPEinasto(rho0, promote(rsun, rs)..., alpha)
end
DMPEinasto() = DMPEinasto(0.3, 8.5, 20.0, 0.17)

function dmdensity(p::DMPEinasto, r::Number)
    return p.rho0 * exp((-2 / p.alpha) * ((r/p.rs)^p.alpha - (p.rsun/p.rs)^p.alpha))
end
