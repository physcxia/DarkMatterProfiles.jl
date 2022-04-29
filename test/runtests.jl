using DarkMatterProfiles
using Test

@testset "DarkMatterProfiles.jl" begin
    dmp = EinastoProfile(0.3, 8.5, 20.0, 0.17)
    @test dmdensity(8.5, dmp) == 0.3
    @test dmp(8.5) == 0.3
    @test dmdensity_galactic(0, 0, 0, dmp) == 0.3
end
