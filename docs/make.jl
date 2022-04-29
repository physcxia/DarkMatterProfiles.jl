using DarkMatterProfiles
using Documenter

DocMeta.setdocmeta!(DarkMatterProfiles, :DocTestSetup, :(using DarkMatterProfiles); recursive=true)

makedocs(;
    modules=[DarkMatterProfiles],
    authors="Chen Xia",
    repo="https://github.com/physcxia/DarkMatterProfiles.jl/blob/{commit}{path}#{line}",
    sitename="DarkMatterProfiles.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://physcxia.github.io/DarkMatterProfiles.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/physcxia/DarkMatterProfiles.jl",
    devbranch="main",
)
