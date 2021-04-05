--natural log results from 0.1 to 1
log_table = {
 -2.30259, -1.60944, -1.20397,
 -0.916291, -0.693147, -0.510826,
 -0.356675, -0.223144, -0.105361,
 0
}

--crude approximation of natural log
function log(n)
 if (n > 1) return nil
 return log_table[ceil(n*10)]
end

--returns a number that follows a normal (Gaussian) distribution
function gaussian (mean, variance)
 return sqrt(-2 * variance * log(rnd())) * cos(2 * 3.141592 * rnd()) + mean
end