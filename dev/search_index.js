var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = DarkMatterProfiles","category":"page"},{"location":"#DarkMatterProfiles","page":"Home","title":"DarkMatterProfiles","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for DarkMatterProfiles.jl.","category":"page"},{"location":"#Interfaces","page":"Home","title":"Interfaces","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Modules = [DarkMatterProfiles]\nOrder = [:function, :type]\nPages = [\"Interfaces.jl\"]","category":"page"},{"location":"#DarkMatterProfiles.dmdensity-Tuple{DMProfile, Any}","page":"Home","title":"DarkMatterProfiles.dmdensity","text":"dmdensity(p::DMProfile, r)\ndmdensity(p::DMProfile, x, y, z)\n\nReturn dark matter density of the profile p in Galactocentric coordinates.\n\nExample\n\njulia> dmp = DMPEinasto(0.3, 8.5, 20.0, 0.17)\nDMPEinasto{Float64, Float64, Float64}(0.3, 8.5, 20.0, 0.17)\n\njulia> dmdensity(dmp, 8.5)\n0.3\n\n\n\n\n\n","category":"method"},{"location":"#DarkMatterProfiles.dmdensity_galactic-Tuple{DMProfile, Any, Any, Any}","page":"Home","title":"DarkMatterProfiles.dmdensity_galactic","text":"dmdensity_galactic(p::DMProfile, r, b, l; rsun=8.5)\n\nReturn dark matter density of the profile p in Galactic coordinates.\n\nArguments\n\np::DMProfile: The dark matter profile.\nr: The distance along the line-of-sight.\nb: The Galactic latitude.\nl: The Galactic longitude.\n\nKeywords\n\nrsun: The distance from the Sun to the Galactic Center.\n\n\n\n\n\n","category":"method"},{"location":"#DarkMatterProfiles.DMProfile-Tuple{Any}","page":"Home","title":"DarkMatterProfiles.DMProfile","text":"(p::DMProfile)(r)\n(p::DMProfile)(x, y, z)\n\nDMProfiles as functors.\n\nExample\n\njulia> dmp = DMPEinasto()\nDMPEinasto{Float64, Float64, Float64}(0.3, 8.5, 20.0, 0.17)\n\njulia> dmp(8.5)\n0.3\n\n\n\n\n\n","category":"method"},{"location":"#Dark-Matter-Profiles","page":"Home","title":"Dark Matter Profiles","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Modules = [DarkMatterProfiles]\nOrder = [:type]\nPages = [\"DMProfiles.jl\"]","category":"page"},{"location":"#DarkMatterProfiles.DMPEinasto","page":"Home","title":"DarkMatterProfiles.DMPEinasto","text":"Einasto Profile\n\n    ρ^textEIN_χ(r)\n=\n    ρ_χ^textloc\n    expleft\n        -frac2αleft(fracr^α-R_^α R_texts^αright)\n    right\n\nFields\n\nrho0::T<:Number=0.3: ρ_χ^textloc\nrsun::U<:Number=8.5: R_\nrs::U<:Number=20.0: R_texts\nalpha::V<:Number=0.17: α\n\n\n\n\n\n","category":"type"},{"location":"#DarkMatterProfiles.DMPNFW","page":"Home","title":"DarkMatterProfiles.DMPNFW","text":"NFW Profile (generalized)\n\n    ρ^textNFW_χ(r)\n=\n    ρ_χ^textloc\n    left(1 + fracR_R_textsright)^3-γ\n    left(fracrR_right)^-γ\n    left(1 + fracrR_textsright)^γ-3\n\nfor r  R_textcut, otherwise ρ^textNFW_χ(r) = ρ^textNFW_χ(R_textcut). The default value is R_textcut = 0. Note that the Schwarzschild radius of the supermassive black hole at the Galactic Center is R = 2GMc^2  12  10^7textkm  4  10^-10textkpc, where M  415  10^6 M_.\n\nFields\n\nrho0::T<:Number=0.3: ρ_χ^textloc\nrsun::U<:Number=8.5: R_\nrs::U<:Number=20.0: R_texts\nrcut::U<:Number=0: R_textcut\ngamma::V<:Number=1: γ\n\n\n\n\n\n","category":"type"},{"location":"#Index","page":"Home","title":"Index","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"","category":"page"}]
}
