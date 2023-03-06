var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = DarkMatterProfiles","category":"page"},{"location":"#DarkMatterProfiles","page":"Home","title":"DarkMatterProfiles","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for DarkMatterProfiles.","category":"page"},{"location":"#Interfaces","page":"Home","title":"Interfaces","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Modules = [DarkMatterProfiles]\nOrder = [:function, :type]\nPages = [\"Interfaces.jl\"]","category":"page"},{"location":"#DarkMatterProfiles.dmdensity-Tuple{DMProfile, Number}","page":"Home","title":"DarkMatterProfiles.dmdensity","text":"dmdensity(p::DMProfile, r::Number)\ndmdensity(p::DMProfile, x::Number, y::Number, z::Number)\n\nReturn dark matter density of the profile p in Galactocentric coordinates.\n\nExample\n\njulia> dmp = DMPEinasto(0.3, 8.5, 20.0, 0.17)\nDMPEinasto{Float64, Float64, Float64}(0.3, 8.5, 20.0, 0.17)\n\njulia> dmdensity(dmp, 8.5)\n0.3\n\n\n\n\n\n","category":"method"},{"location":"#DarkMatterProfiles.dmdensity_galactic-Tuple{DMProfile, Number, Number, Number}","page":"Home","title":"DarkMatterProfiles.dmdensity_galactic","text":"dmdensity_galactic(p::DMProfile, r::Number, b::Number, l::Number; rsun::Number=8.5)\n\nReturn dark matter density of the profile p in Galactic coordinates.\n\nArguments\n\np::DMProfile: The dark matter profile.\nr::Number: The distance along the line-of-sight.\nb::Number: The Galactic latitude.\nl::Number: The Galactic longitude.\n\nKeywords\n\nrsun::Number: The distance from the Sun to the Galactic Center.\n\n\n\n\n\n","category":"method"},{"location":"#DarkMatterProfiles.DMProfile-Tuple{Number}","page":"Home","title":"DarkMatterProfiles.DMProfile","text":"(p::DMProfile)(r::Number)\n(p::DMProfile)(x::Number, y::Number, z::Number)\n\nDMProfiles as functors.\n\nExample\n\njulia> dmp = DMPEinasto()\nDMPEinasto{Float64, Float64, Float64}(0.3, 8.5, 20.0, 0.17)\n\njulia> dmp(8.5)\n0.3\n\n\n\n\n\n","category":"method"},{"location":"#Dark-Matter-Profiles","page":"Home","title":"Dark Matter Profiles","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Modules = [DarkMatterProfiles]\nOrder = [:type]\nPages = [\"Profiles.jl\"]","category":"page"},{"location":"#DarkMatterProfiles.DMPEinasto","page":"Home","title":"DarkMatterProfiles.DMPEinasto","text":"Einasto Profile\n\n    ρ^textEIN_χ(r)\n=\n    ρ_χ^textloc\n    expleft\n        -frac2αleft(fracr^α-R_^α R_texts^αright)\n    right\n\nFields\n\nrho0::T<:Number: ρ_χ^textloc\nrsun::U<:Number: R_\nrs::U<:Number: R_texts\nalpha::V<:Number: α\n\n\n\n\n\n","category":"type"},{"location":"#Index","page":"Home","title":"Index","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"","category":"page"}]
}
