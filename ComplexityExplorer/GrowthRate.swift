//
//  GrowthRate.swift
//  ComplexityExplorer
//
//  Created by Enrique Gongora on 4/16/25.
//

import Foundation

struct GrowthRate: Hashable, Identifiable {
    
    /// A unique identifier for the growth rate (e.g. "Linear", "Quadratic").
    var id: String
    
    /// The mathematical function that calculates growth for input size `n`.
    ///
    /// The function takes an integer input size and returns its growth value as `Double`.
    var function: (Int) -> Double
    
    /// An array containing all predefined growth rate classifications.
    ///
    /// This includes all standard Big-O complexity classes from constant to factorial time.
    /// Use this to access all available growth rates in your UI or calculations.
    ///
    /// ```swift
    /// GrowthRate.all.forEach { rate in
    ///     print("\(rate.id): \(rate.function(10))")
    /// }
    /// ```
    static var all: [GrowthRate] {
        [
            GrowthRate(id: "Linear", function: linearGrowth),
            GrowthRate(id: "Constant", function: constantGrowth),
            GrowthRate(id: "Square Root", function: squareRootGrowth),
            GrowthRate(id: "Logarithmic", function: logarithmicGrowth),
            GrowthRate(id: "Linearithmic", function: linearithmicGrowth),
            GrowthRate(id: "Quadratic", function: quadraticGrowth),
            GrowthRate(id: "Cubic", function: cubicGrowth),
            GrowthRate(id: "Exponential", function: exponentialGrowth),
            GrowthRate(id: "Factorial", function: factorialGrowth)
        ]
    }
    
    static func ==(lhs: GrowthRate, rhs: GrowthRate) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    /// Linear growth rate: O(n)
    /// - Parameter n: The input size
    /// - Returns: The growth value, which equals `n`
    ///
    /// Represents algorithms where processing time grows linearly with input size.
    /// Example: iterating through an array once.
    static func linearGrowth(_ n: Int) -> Double {
        Double(n)
    }
    
    /// Constant growth rate: O(1)
    /// - Parameter n: The input size (unused)
    /// - Returns: Always returns 1
    ///
    /// Represents algorithms with fixed time complexity regardless of input size.
    /// Example: accessing an array element by index.
    static func constantGrowth(_ n: Int) -> Double {
        1
    }
    
    /// Square root growth rate: O(√n)
    /// - Parameter n: The input size
    /// - Returns: The square root of `n`
    ///
    /// Represents algorithms that process input in chunks of √n size.
    /// Example: some primality tests and optimized search algorithms.
    static func squareRootGrowth(_ n: Int) -> Double {
        sqrt(Double(n))
    }
    
    /// Logarithmic growth rate: O(log n)
    /// - Parameter n: The input size
    /// - Returns: The base-2 logarithm of `n` (minimum 0)
    ///
    /// Represents algorithms that repeatedly divide the problem space.
    /// Example: binary search.
    static func logarithmicGrowth(_ n: Int) -> Double {
        max(0, log2(Double(n)))
    }
    
    /// Linearithmic growth rate: O(n log n)
    /// - Parameter n: The input size
    /// - Returns: `n` multiplied by the base-2 logarithm of `n` (minimum 0)
    ///
    /// Represents efficient sorting and comparison-based algorithms.
    /// Example: merge sort and heapsort.
    static func linearithmicGrowth(_ n: Int) -> Double {
        max(0, Double(n) * log2(Double(n)))
    }
    
    /// Quadratic growth rate: O(n²)
    /// - Parameter n: The input size
    /// - Returns: `n` squared
    ///
    /// Represents algorithms with nested iterations over the input.
    /// Example: bubble sort and naive matrix multiplication.
    static func quadraticGrowth(_ n: Int) -> Double {
        pow(Double(n), 2)
    }
    
    /// Cubic growth rate: O(n³)
    /// - Parameter n: The input size
    /// - Returns: `n` cubed
    ///
    /// Represents algorithms with three nested iterations.
    /// Example: naive algorithms for matrix chain multiplication.
    static func cubicGrowth(_ n: Int) -> Double {
        pow(Double(n), 3)
    }
    
    /// Exponential growth rate: O(2ⁿ)
    /// - Parameter n: The input size
    /// - Returns: 2 raised to the power of `n`
    ///
    /// Represents algorithms where work doubles with each additional input.
    /// Example: brute-force solutions to the traveling salesman problem.
    static func exponentialGrowth(_ n: Int) -> Double {
        pow(2, Double(n))
    }
    
    /// Factorial growth rate: O(n!)
    /// - Parameter n: The input size
    /// - Returns: The factorial of `n`
    ///
    /// Represents algorithms that generate all permutations.
    /// Example: brute-force solutions to the traveling salesman problem.
    static func factorialGrowth(_ n: Int) -> Double {
        guard n > 0 else { return 1 }
        return (1...n).map(Double.init).reduce(1, *)
    }
}
