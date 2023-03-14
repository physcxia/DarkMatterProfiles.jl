"""
    dmdensity(p::DMProfile, r)
    dmdensity(p::DMProfile, x, y, z)

Return dark matter density of the profile `p` in Galactocentric coordinates.

# Example
```jldoctest
julia> dmp = DMPEinasto(0.3, 8.5, 20.0, 0.17)
DMPEinasto{Float64, Float64, Float64}(0.3, 8.5, 20.0, 0.17)

julia> dmdensity(dmp, 8.5)
0.3
```
"""
dmdensity(p::DMProfile, r) = error("dmdensity is not implemented")
function dmdensity(p::DMProfile, x, y, z)
    return dmdensity(p, hypot(x, y, z))
end

"""
    (p::DMProfile)(r)
    (p::DMProfile)(x, y, z)

DMProfiles as functors.

# Example
```jldoctest
julia> dmp = DMPEinasto()
DMPEinasto{Float64, Float64, Float64}(0.3, 8.5, 20.0, 0.17)

julia> dmp(8.5)
0.3
```
"""
(p::DMProfile)(r) = dmdensity(p, r)
(p::DMProfile)(x, y, z) = dmdensity(p, x, y, z)

"""
    dmdensity_galactic(p::DMProfile, r, b, l; rsun=8.5)

Return dark matter density of the profile `p` in Galactic coordinates.

# Arguments
- `p::DMProfile`: The dark matter profile.
- `r`: The distance along the line-of-sight.
- `b`: The Galactic latitude.
- `l`: The Galactic longitude.

# Keywords
- `rsun`: The distance from the Sun to the Galactic Center.
"""
function dmdensity_galactic(p::DMProfile, r, b, l; rsun=8.5)
    return dmdensity(p, sqrt(r^2 + rsun^2 - 2 * r * rsun * cos(b) * cos(l)))
end
