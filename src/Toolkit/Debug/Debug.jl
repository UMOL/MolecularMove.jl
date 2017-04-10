module Debug
macro debug(expression)
    return :($expression)
    # return nothing
end
export @debug
end
