using BenchmarkData
using BenchmarkTools

const SUITE = BenchmarkGroup()

for (k,v) in ENV
    println("$k --> $v")
end

run_flux_benchmark = get(ENV, "flux", "false")
if run_flux_benchmark == "true"
    include("flux/flux.jl")
    SUITE["flux"] = FluxBenchmark.flux_suite
end
