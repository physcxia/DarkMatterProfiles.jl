using DarkMatterProfiles
using Test

@testset "DarkMatterProfiles.jl" begin
    dmp = EinastoProfile(0.3, 8.5, 20.0, 0.17)
    @test dmdensity(dmp, 8.5) == 0.3
    @test dmdensity(dmp, 8.5, 0, 0) == 0.3
    @test dmp(8.5) == 0.3
    @test dmp(8.5, 0, 0) == 0.3
    @test dmdensity_galactic(dmp, 0, 0, 0) == 0.3
end
