"""
Print out a dashed line of certain length.

Arguments
---------
length:Integer
    length of the dashed line
"""
function print_dashed_line(length::Integer)
    if length > 0
        print("-")
        print_dashed_line(length-1)
    elseif length == 0
        print("\n")
    else
        print("")
    end
end