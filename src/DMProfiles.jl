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
- `rho0::T<:Number=0.3`: ``ρ_χ^\text{loc}``
- `rsun::U<:Number=8.5`: ``R_⊙``
- `rs::U<:Number=20.0`: ``R_\text{s}``
- `alpha::V<:Number=0.17`: ``α``
"""
Base.@kwdef mutable struct DMPEinasto{T <: Number, U <: Number, V <: Number} <: DMProfile
    rho0::T = 0.3
    rsun::U = 8.5
    rs::U = 20.0
    alpha::V = 0.17
end
function DMPEinasto(rho0, rsun, rs, alpha)
    return DMPEinasto(rho0, promote(rsun, rs)..., alpha)
end

function dmdensity(p::DMPEinasto, r)
    return p.rho0 * exp((-2 / p.alpha) * ((r/p.rs)^p.alpha - (p.rsun/p.rs)^p.alpha))
end


@doc raw"""
NFW Profile (generalized)

```math
    ρ^\text{NFW}_χ(r)
=
    ρ_χ^\text{loc}
    \left(1 + \frac{R_⊙}{R_\text{s}}\right)^{3-γ}
    \left(\frac{r}{R_⊙}\right)^{-γ}
    \left(1 + \frac{r}{R_\text{s}}\right)^{γ-3}
```
for ``r > R_\text{cut}``, otherwise ``ρ^\text{NFW}_χ(r) = ρ^\text{NFW}_χ(R_\text{cut})``.
The default value is ``R_\text{cut} = 0``.
Note that the [Schwarzschild radius](https://en.wikipedia.org/wiki/Schwarzschild_radius)
of the supermassive black hole at the Galactic Center is
``R = 2GM/c^2 ≈ 1.2 × 10^7~\text{km} ≈ 4 × 10^{-10}~\text{kpc}``, where
``M ≈ 4.15 × 10^6 M_⊙``.

# Fields
- `rho0::T<:Number=0.3`: ``ρ_χ^\text{loc}``
- `rsun::U<:Number=8.5`: ``R_⊙``
- `rs::U<:Number=20.0`: ``R_\text{s}``
- `rcut::U<:Number=0`: ``R_\text{cut}``
- `gamma::V<:Number=1`: ``γ``
"""
Base.@kwdef mutable struct DMPNFW{T <: Number, U <: Number, V <: Number} <: DMProfile
    rho0::T = 0.3
    rsun::U = 8.5
    rs::U = 20.0
    rcut::U = 0
    gamma::V = 1
end
function DMPNFW(rho0, rsun, rs, rcut=zero(rs), gamma=1)
    return DMPNFW(rho0, promote(rsun, rs, rcut)..., gamma)
end

function dmdensity(p::DMPNFW, r)
    r = r < p.rcut ? p.rcut : r
    return (p.rho0 * (1 + p.rsun / p.rs)^(3 - p.gamma)
            * (r / p.rsun)^(-p.gamma) * (1 + r / p.rs)^(p.gamma - 3))
end
