function fibo(n)
    phi = (sqrt(5)+1)/2 - 1
    gamma  = phi * 2 * pi

    return [(gamma*i, asin(-1 + 2*i/n)) for i in 1:n]
end

println(fibo(2))