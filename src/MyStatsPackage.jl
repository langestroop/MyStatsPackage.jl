module MyStatsPackage
include("statistic_functions.jl")

export rse_sum, rse_mean, rse_tstat, tstat, printOwner, printContributor

greet() = print("Hello World!")

end # module MyStatsPackage
