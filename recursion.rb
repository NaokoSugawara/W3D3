###################################################################
# Warmup
# Write a recursive method, range, 
# that takes a start and an end and returns 
# an array of all numbers in that range, exclusive. 
# For example, range(1, 5) should return [1, 2, 3, 4]. 
# If end < start, you can return an empty array.
# Write both a recursive and iterative version of sum of an array.

### virsion1 ###
def range(start, last)
    return [] if last <= start
    
    [start] + range(start+1, last)
end

### virsion2 ###
def range(start, last)
    (start..last-1).to_a.map do |ele|
        ele
    end
end

# p range(1, 5)

###################################################################

# Exponentiation ##### 後で 
# Write two versions of exponent that use two different recursions:

# this is math, not Ruby methods.

# recursion 1
# exp(b, 0) = 1
# exp(b, n) = b * exp(b, n - 1)

def exp(b, n)
    return 0 if n == 1
    b * exp(b, n - 1)
end

# recursion 2 ######## I don't really understand
# exp(b, 0) = 1
# exp(b, 1) = b
# exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]

def exp(b, n)
    return 1 if n == 0
    return b if n == 1
    if n.even?
        exp(b, n / 2) * exp(b, n / 2)
    else
        b * (exp(b, (n - 1) / 2) * exp(b, (n - 1) / 2) )
    end
end


###################################################################

# Deep dup
# The #dup method doesn't make a deep copy:

# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]

# robot_parts_copy = robot_parts.dup

# # shouldn't modify robot_parts
# robot_parts_copy[1] << "LEDs"
# # but it does
# robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]
# When we dup an Array, it creates a new array to hold the elements, 
# but doesn't recursively dup any arrays contained therein. 
# So the dup method creates one new array, 
# but just copies over references to the original interior arrays.

# Sometimes you want a shallow dup and sometimes you want a deep dup. 
# Ruby keeps things simple by giving you shallow dup, 
# and letting you write deep dup yourself.

# Using recursion and the is_a? method, write an Array#deep_dup method 
# that will perform a "deep" duplication of the interior arrays.

# Note: For simplicity's sake, we are only going to ensure 
# the deep duplication of arrays. 
# Don't worry about deep-duping (or regular-duping) 
# other types of mutable objects 
# (like strings, hashes, instances of custom classes, etc.), 
# since this would require that we implement a deep dup method 
# for each of those classes, as well.

# It's okay to iterate over array elements using the normal each for this one :-)

# You should be able to handle "mixed" arrays. For instance: [1, [2], [3, [4]]].

class Array

    def deep_dup
        new_ary = []
        self.each do |sub|
            if sub.is_a? Array
                new_ary + ary.deep_dup
            else
                new_ary << sub
            end
        end
        new_ary
    end

end


###################################################################

# Fibonacci
# Write a recursive and an iterative Fibonacci method. 
# The method should take in an integer n and return 
# the first n Fibonacci numbers in an array.

# You shouldn't have to pass any arrays between methods; 
# you should be able to do this just passing a single argument 
#     for the number of Fibonacci numbers requested.

### recursive ###

def fibonacci(n)
    return [] if n == 0
    return [0] if n == 1
    return [0, 1] if n == 2

    last = fibonacci(n-1)[-2] + fibonacci(n-1)[-1]
    fibonacci(n-1) << last
end

### iterative ###

def fibonacci(n)
    return [] if n == 0
    return [0] if n == 1

    fib = [0, 1]
    while fib.length < n
        fib << fib[-2] + fib[-1]
    end
    fib
end

# p fibonacci(7)

###################################################################

# Binary Search
# The binary search algorithm begins by comparing 
# the target value to the value of the middle element 
# of the sorted array. If the target value is equal to 
# the middle element's value, then the position is returned 
# and the search is finished. If the target value is 
# less than the middle element's value, 
# then the search continues on the lower half of the array; 
# or if the target value is greater than 
# the middle element's value, then the search continues 
# on the upper half of the array. This process continues, 
# eliminating half of the elements, and comparing 
# the target value to the value of the middle element 
# of the remaining elements - until the target value is 
# either found (and its associated element position 
# is returned), or until the entire array has been searched 
# (and "not found" is returned).

# # Write a recursive binary search: bsearch(array, target).
#  Note that binary search only works on sorted arrays. 
#  Make sure to return the location of the found object 
#  (or nil if not found!). 
#  Hint: you will probably want to use subarrays.

def bsearch(array, target) ########### Can't solve
    mid_idx = array.length / 2
    return array.index(target) if array[mid_idx] == target

    left = array[0...mid_idx]
    right = array[mid_idx+1..0]
    bsearch(left, target)
    bsearch(right, target)

    array.index(target)
end

# # bsearch([1, 2, 3], 1) # => 0
# # bsearch([2, 3, 4, 5], 3) # => 1
# # bsearch([2, 4, 6, 8, 10], 6) # => 2
# # bsearch([1, 3, 4, 5, 9], 5) # => 3
# # bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# # bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# # bsearch([1, 2, 3, 4, 5, 7], 6) # => nil


###################################################################

# # Merge Sort
# # Implement a method merge_sort that sorts an Array:

class Array
    
    def merge_sort ### not finised
        return nil if self.length == 0 
        return self if self.length == 1

        if self.length == 2 && self.first > self.last
            return [self.last, self.first]
        else 
            return [self.first, self.last]
        end

        mid_idx = self.length / 2
        sorted_left = self[0...mid_idx]
        left.merge_sort
        sorted_right = self[mid_idx..0]
        right.merge_sort

        merge(sorted_left, sorted_right)
    end

    def merge(sorted_left, sorted_right)
        # merge 2 arrays

    end

end

# # The base cases are for arrays of length zero or one. 
# Do not use a length-two array as a base case. This is unnecessary.
# You'll want to write a merge helper method to merge the sorted halves.
# To get a visual idea of how merge sort works, 
# watch this gif and check out this diagram.


###################################################################

# Array Subsets
# Write a method subsets that will return all subsets of an array.

# subsets([]) # => [[]]
# subsets([1]) # => [[], [1]]
# subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# subsets([1, 2, 3])
# # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
# You can implement this as an Array method if you prefer.

# Hint: For subsets([1, 2, 3]), there are two kinds of subsets:

# Those that do not contain 3 (all of these are subsets of [1, 2]).
# For every subset that does not contain 3, there is also a corresponding subset that is the same, except it also does contain 3.


###################################################################

# Permutations
# Write a recursive method permutations(array) that calculates all the permutations of the given array. For an array of length n there are n! different permutations. So for an array with three elements we will have 3 * 2 * 1 = 6 different permutations.

# permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
#                         #     [2, 1, 3], [2, 3, 1],
#                         #     [3, 1, 2], [3, 2, 1]]
# You can use Ruby's built in Array#permutation method to get a better understanding of what you will be building.

# [1, 2, 3].permutation.to_a  # => [[1, 2, 3], [1, 3, 2],
#                             #     [2, 1, 3], [2, 3, 1],
#                             #     [3, 1, 2], [3, 2, 1]]


###################################################################

# Make Change
# RubyQuiz: Make change.

# Here's a game plan for solving the problem:

# First, write a 'greedy' version called greedy_make_change:

# Take as many of the biggest coin as possible and add them to your result.
# Add to the result by recursively calling your method on the remaining amount, leaving out the biggest coin, until the remainder is zero.
# Once you have a working greedy version, talk with your partner about refactoring this to make_better_change. What's wrong with greedy_make_change?

# Consider the case of greedy_make_change(24, [10,7,1]). Because it takes as many 10 pieces as possible, greedy_make_change misses the correct answer of [10,7,7] (try it in pry).

# To make_better_change, we only take one coin at a time and never rule out denominations that we've already used. This allows each coin to be available each time we get a new remainder. By iterating over the denominations and continuing to search for the best change, we assure that we test for 'non-greedy' uses of each denomination.

# Discuss the following game plan and then work together to implement your new method:

# Iterate over each coin.
# Grab only one of that one coin and recursively call make_better_change on the remainder using coins less than or equal to the current coin.
# Add the single coin to the change returned by the recursive call. This will be a possible solution, but maybe not the best one.
# Keep track of the best solution and return it at the end.
# N.B. Don't generate every possible permutation of coins and then compare them. Remember that a permutation is not the same thing as a combination - we will need to check every combination of coins that add up to our target, we just don't want to check the same combination in different orders. If you get stuck you can start by writing a solution that calculates and compares all of the permutations without storing them in an array. Then go back and refactor your solution so that it only calculates and compares all of the different combinations. If you and your partner get totally stuck, or would like to compare your answer, feel free to reference this video walkthrough of the problem.

# Make sure you and your partner understand each line before moving on.