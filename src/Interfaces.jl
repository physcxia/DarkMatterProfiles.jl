"""
    dmdensity(r::Number, p::DMProfile)
    dmdensity(x::Number, y::Number, z::Number, p::DMProfile)

Return dark matter density of the profile `p` in Galactocentric coordinates.

# Example
```
dmp = EinastoProfile(0.3, 8.5, 20.0, 0.17)
dmdensity(8.5, dmp)
```
"""
dmdensity(r::Number, p::DMProfile) = error("dmdensity not implemented")
dmdensity(x::Number, y::Number, z::Number, p::DMProfile) = error("3D-dmdensity not implemented")

"DMProfile as functor"
(p::DMProfile)(r::Number) = dmdensity(r, p)
(p::DMProfile)(x::Number, y::Number, z::Number) = dmdensity(x, y, z)

"""
    dmdensity_galactic(r::Number, b::Number, l::Number, p::DMProfile; rsun::Number=8.5)

Return dark matter density of the profile `p` in Galactic coordinates.

# Arguments
- `r::Number`: The distance along the line-of-sight.
- `b::Number`: The Galactic latitude.
- `l::Number`: The Galactic longitude.
- `p::DMProfile`: The dark matter profile.

# Keywords
- `rsun::Number`: The distance from the Sun to the Galactic Center.
"""
function dmdensity_galactic(r::Number, b::Number, l::Number, p::DMProfile; rsun::Number=8.5)
    return dmdensity(sqrt(r*r + rsun*rsun - 2*r*rsun * cos(b) * cos(l)), p)
end
