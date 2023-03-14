using Test
using Unitful
using UnitfulAstro
using DarkMatterProfiles

function test_local_density(dmp, rsun, ρloc)
    @test dmdensity(dmp, rsun) == ρloc
    @test dmdensity(dmp, rsun, zero(rsun), zero(rsun)) == ρloc
    @test dmp(rsun) == ρloc
    @test dmp(rsun, zero(rsun), zero(rsun)) == ρloc
    @test dmdensity_galactic(dmp, zero(rsun), 0, 0, rsun=rsun) == ρloc
    return nothing
end

@testset "DMProfile" begin
    struct DMPTest <: DarkMatterProfiles.DMProfile test end
    dmp = DMPTest(0)
    @test_throws ErrorException dmdensity(dmp, 0)
end

@testset "DMPEinasto" begin
    dmp = DMPEinasto(0.3, 8.5, 20.0, 0.17)
    @test dmp == DMPEinasto()
    @test dmp == DMPEinasto(0.3, 8.5, 20, 0.17)
    @test dmp == DMPEinasto(rsun=8.5, rs=20, rho0=0.3, alpha=0.17)
    test_local_density(dmp, 8.5, 0.30)
    @test dmdensity_galactic(dmp, 0, 0, 0) == 0.3  # test the default rsun

    @testset "DMPEinasto with Unitful" begin
        ρloc = 0.3u"GeV/cm^3"
        rsun = 8.5u"kpc"
        dmp = DMPEinasto(ρloc, rsun, 20.0u"kpc", 0.17)
        test_local_density(dmp, rsun, ρloc)
    end
end

@testset "DMPNFW" begin
    ρloc = 0.3
    rsun = 8.5
    dmp = DMPNFW(ρloc, 8.5, 20.0)
    @test dmp == DMPNFW()
    @test dmp == DMPNFW(ρloc, 8.5, 20, 1)
    @test dmp == DMPNFW(rsun=8.5, rs=20, rho0=ρloc)
    @test dmp == DMPNFW(rsun=8.5, rs=20, rho0=ρloc, gamma=1)
    test_local_density(dmp, rsun, ρloc)
    @test dmdensity(dmp, 1e-3) ≈ 5177.575979458114
    @test dmdensity(dmp, 1) ≈ 4.696683673469388
    @test dmdensity(dmp, 20) ≈ 0.064726171875
    @test dmdensity(dmp, 200) ≈ 0.00021397081611570246

    @testset "DMPNFW with Unitful" begin
        ρloc = 0.3u"GeV/cm^3"
        dmp = DMPNFW(ρloc, 8.5u"kpc", 20.0u"kpc", 1)
        test_local_density(dmp, 8.5u"kpc", ρloc)
    end
end
