class MathUtils
  def self.prime?(number)
    return false if number < 2
    (2..Math.sqrt(number)).none? { |i| number % i == 0 }
  end

  def self.fibonacci(n)
    (0..n).inject([0, 1]) { |fib| fib << fib[-2] + fib[-1] }[0..n]
  end
end