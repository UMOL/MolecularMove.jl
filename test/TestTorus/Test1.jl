module Test1
import MolecularMove: torus, PartialFibonacci
import ...Common: test_assemble_points

function test()
    test_assemble_points(
        torus,
        PartialFibonacci,
        [0. 0. 0.],
        Dict(
            :number => 5,
            :radius => 10.0,
            :a => 2.0,
            :b => 4.0,
            :zmin => -4.0,
            :zmax => 4.0,
            :center => zeros(3)
        ),
        [11.2 0.0 3.2;
        -8.72530826034 7.99309710448 1.6;
        1.0491086966 -11.9540524904 0.0;
        7.19967546426 9.39070171866 -1.6;
        -11.0287910355 -1.95083784425 -3.2],
         "Torus test 1: input is a row matrix")
end

end