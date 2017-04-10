module Line

"""
Print out a dashed line of certain length.

Arguments
---------
length:Integer
    length of the dashed line
"""
function print_line(length::Integer, sym::String="-")
    if length > 0
        print(sym)
        print_line(length-1)
    elseif length == 0
        print("\n")
    else
        print("")
    end
end
export print_dashed_line
end