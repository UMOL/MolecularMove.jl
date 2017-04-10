module Test1
import MolecularMove: torus, PartialFibonacci
import ...Common: test_assemble_points

function test()
    test_assemble_points(
        torus,
        PartialFibonacci,
        [0. 0. 0.],
        Dict(
            :total_number => 5,
            :major_radius => 10.0,
            :a => 2.0,
            :b => 4.0,
            :zmin => -4.0,
            :zmax => 4.0
            :center => zeros(3)
        ),
        [0.87425724717 -9.96171040865  5.0;
         6.08438860979  7.93600751292  3.0;
        -9.84713485315 -1.74181950379  1.0;
         8.43755294812 -5.36728052626 -1.0;
        -2.59604304901  9.65715074376 -3.0],
         "Torus test 1: input is a row matrix")
end

end