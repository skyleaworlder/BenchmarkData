module FluxBenchmark

using Flux
using BenchmarkTools

const flux_suite = BenchmarkGroup()

x = rand(30, 30, 3, 10)
maxpool_layer = MaxPool((3,3); pad = SamePad())
meanpool_layer = MeanPool((3,3); pad = SamePad())
gmaxpool_layer = GlobalMaxPool()
gmeanpool_layer = GlobalMeanPool()

flux_suite["maxpool"] = BenchmarkGroup()
flux_suite["meanpool"] = BenchmarkGroup()
flux_suite["maxpool"]["normal"] = @benchmarkable maxpool_layer(x)
flux_suite["maxpool"]["global"] = @benchmarkable gmaxpool_layer(x)
flux_suite["meanpool"]["normal"] = @benchmarkable meanpool_layer(x)
flux_suite["meanpool"]["global"] = @benchmarkable gmeanpool_layer(x)

export flux_suite

end