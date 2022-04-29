@doc raw"""
Einasto Profile

```math
\rho^\mathrm{EIN}_\chi(r) = \rho_\chi^\text{loc}
\exp\left[-\frac{2}{\alpha}\left(\frac{r^\alpha-R_{\odot}^\alpha}
{R_\text{s}^\alpha}\right)\right]
```

# Fields
- `rho0::Real`: ``\rho_\chi^\text{loc}``
- `rsun::Real`: ``R_\odot``
- `rs::Real`: ``R_\text{s}``
- `alpha::Real`: ``\alpha``
"""
mutable struct EinastoProfile <: DMProfile
    rho0::Real
    rsun::Real
    rs::Real
    alpha::Real
end
function dmdensity(r::Real, p::EinastoProfile)
    return p.rho0 * exp((-2 / p.alpha) * ((r/p.rs)^p.alpha - (p.rsun/p.rs)^p.alpha))
end
