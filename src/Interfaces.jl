"""
    dmdensity(r::Real, p::DMProfile)
    dmdensity(x::Real, y::Real, z::Real, p::DMProfile)

Return dark matter density of the profile `p` in Galactocentric coordinates.

# Example
```
dmp = EinastoProfile(0.3, 8.5, 20.0, 0.17)
dmdensity(8.5, dmp)
```
"""
dmdensity(r::Real, p::DMProfile) = error("dmdensity not implemented")
dmdensity(x::Real, y::Real, z::Real, p::DMProfile) = error("3D-dmdensity not implemented")

"DMProfile as functor"
(p::DMProfile)(r::Real) = dmdensity(r, p)
(p::DMProfile)(x::Real, y::Real, z::Real) = dmdensity(x, y, z)

"""
    dmdensity_galactic(r::Real, b::Real, l::Real, p::DMProfile; rsun::Real=8.5)

Return dark matter density of the profile `p` in Galactic coordinates.

# Arguments
- `r::Real`: The distance along the line-of-sight.
- `b::Real`: The Galactic latitude.
- `l::Real`: The Galactic longitude.
- `p::DMProfile`: The dark matter profile.

# Keywords
- `rsun::Real`: The distance from the Sun to the Galactic Center.
"""
function dmdensity_galactic(r::Real, b::Real, l::Real, p::DMProfile; rsun::Real=8.5)
    return dmdensity(sqrt(r*r + rsun*rsun - 2*r*rsun * cos(b) * cos(l)), p)
end
