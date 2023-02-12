@doc raw"""
Einasto Profile

```math
\rho^\mathrm{EIN}_\chi(r) = \rho_\chi^\text{loc}
\exp\left[-\frac{2}{\alpha}\left(\frac{r^\alpha-R_{\odot}^\alpha}
{R_\text{s}^\alpha}\right)\right]
```

# Fields
- `rho0::Number`: ``\rho_\chi^\text{loc}``
- `rsun::Number`: ``R_\odot``
- `rs::Number`: ``R_\text{s}``
- `alpha::Number`: ``\alpha``
"""
mutable struct EinastoProfile <: DMProfile
    rho0::Number
    rsun::Number
    rs::Number
    alpha::Number
end
function dmdensity(p::EinastoProfile, r::Number)
    return p.rho0 * exp((-2 / p.alpha) * ((r/p.rs)^p.alpha - (p.rsun/p.rs)^p.alpha))
end
