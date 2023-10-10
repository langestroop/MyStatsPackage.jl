#---
using ProgressMeter
import Base: length
function rse_sum(x)
    @assert all(!isnan, x) "Watch out, there might be NaNs"
    s = 0
    @showprogress for k in eachindex(x)
        s = s + x[k]
    end
    return s
end

rse_sum(1:36) == 666
#---

function rse_mean(x)
    return rse_sum(x) / length(x)
end

rse_mean(-15:17) == 1

#----
function rse_std(x)
    return sqrt(rse_sum((x .- rse_mean(x)) .^ 2) / (length(x) - 1))
end
rse_std([1, 2, 3]) == 1

#----
function rse_tstat(x; σ = rse_std(x))
    return rse_mean(x) ./ (σ / sqrt(length(x)))
end

rse_tstat(2:3) == 5

#---

struct StatResult
    x::Vector
    n::Int32
    std::Float64
    tvalue::Float64
end
Base.length(s::StatResult) = s.n
StatResult(x) = StatResult(x, length(x))

StatResult(x, n) = StatResult(x, n, rse_std(x))
StatResult(x, n, std) = StatResult(x, n, std, rse_tstat(x; σ = std))


StatResult([10, 500.0]) # <1>

function tstat(x)
    return StatResult(length(x), rse_tstat(x))
end

#---
# adding the new function: 

function printOwner()

    x = print("Welcome, this is the first test pakcage by: langestroop")
    return x

end
