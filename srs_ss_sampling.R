# sampling in R programming
# simple random sampling in R

population_size <- 3000 #assumed sampling frame size
sample_size <- 350      #assumed sample size that calculated from sample size formula

sample <- sample(population, size = sample_size, replace = FALSE)
print(head(sample))

# systematic sampling in R
pop_size <- 3250        #assumed sampling frame size
sample_size <- 310      #assumed sample size that calculated from sample size formula          

# calculate the K interval 
k <- pop_size / sample_size 
k <- round(k)
k

# Generate a first starting sample point
k_start <- sample(1:k, 1, replace = FALSE)
k_start

# get sample points by k interval
syst_sample <- seq(k_start, by = k, length.out = sample_size)
print(head(syst_sample)) 

# another example of systematic sampling R usage with numbers
sys_sample <- seq(5, by = 10, length.out = 310)
print(sys_sample)

# end of code
# Research & Data Analytics