using Test
using Unitful
using UnitfulAstro
using DarkMatterProfiles

@testset "DMPEinasto" begin
    dmp = DMPEinasto(0.3, 8.5, 20.0, 0.17)
    @test dmp == DMPEinasto()
    @test dmdensity(dmp, 8.5) == 0.3
    @test dmdensity(dmp, 8.5, 0, 0) == 0.3
    @test dmp(8.5) == 0.3
    @test dmp(8.5, 0, 0) == 0.3
    @test dmdensity_galactic(dmp, 0, 0, 0) == 0.3
end

@testset "DMPEinasto with Unitful" begin
    ρloc = 0.3u"GeV/cm^3"
    dmp = DMPEinasto(ρloc, 8.5u"kpc", 20.0u"kpc", 0.17)
    @test dmdensity(dmp, 8.5u"kpc") == ρloc
    @test dmdensity(dmp, 8.5u"kpc", 0u"kpc", 0u"kpc") == ρloc
    @test dmp(8.5u"kpc") == ρloc
    @test dmp(8.5u"kpc", 0u"kpc", 0u"kpc") == ρloc
    @test dmdensity_galactic(dmp, 0u"kpc", 0, 0; rsun=8.5u"kpc") == ρloc
end
