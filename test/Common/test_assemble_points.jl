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

    function aux(result)
      if issubtype(typeof(result), AbstractArray)
        return aux(sum(result))
      else
        return result
      end
    end
    
    result = aux(answer - solution)
    @test_approx_eq_eps result 0 1e-7
    print_with_color(:green, "VERIFIED!\n\n")
    print_line(80)
end
