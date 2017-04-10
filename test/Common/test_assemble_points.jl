import .Line: print_line
using Base.Test

function test_assemble_points(
  builder::Function,
  algo::Type,
  test_vector::AbstractArray, 
  params::Dict,
  solution::Array,
  msg::AbstractString="")
    print_line(80)
    if msg != ""
      print_with_color(:blue, "$(msg)\n\n")
    end

    @time answer = vcat([transform(test_vector) for transform in builder(algo; params...)]...)

    for i in length(solution) 
        @test_approx_eq answer[i] solution[i]
    end
    print_with_color(:green, "VERIFIED!\n\n")
    print_line(80)
end
