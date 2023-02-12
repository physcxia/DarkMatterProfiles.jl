"""
    dmdensity(p::DMProfile, r::Number)
    dmdensity(p::DMProfile, x::Number, y::Number, z::Number)

Return dark matter density of the profile `p` in Galactocentric coordinates.

# Example
```
dmp = EinastoProfile(0.3, 8.5, 20.0, 0.17)
dmdensity(dmp, 8.5)
```
"""
dmdensity(p::DMProfile, r::Number) = error("dmdensity not implemented")
function dmdensity(p::DMProfile, x::Number, y::Number, z::Number)
    return dmdensity(p, hypot(x, y, z))
end

"DMProfile as functor"
(p::DMProfile)(r::Number) = dmdensity(p, r)
(p::DMProfile)(x::Number, y::Number, z::Number) = dmdensity(p, x, y, z)

"""
    dmdensity_galactic(p::DMProfile, r::Number, b::Number, l::Number; rsun::Number=8.5)

Return dark matter density of the profile `p` in Galactic coordinates.

# Arguments
- `p::DMProfile`: The dark matter profile.
- `r::Number`: The distance along the line-of-sight.
- `b::Number`: The Galactic latitude.
- `l::Number`: The Galactic longitude.

# Keywords
- `rsun::Number`: The distance from the Sun to the Galactic Center.
"""
function dmdensity_galactic(p::DMProfile, r::Number, b::Number, l::Number; rsun::Number=8.5)
    return dmdensity(p, sqrt(r*r + rsun*rsun - 2*r*rsun * cos(b) * cos(l)))
end
