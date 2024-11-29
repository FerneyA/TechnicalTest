class MathUtils
  def self.prime?(number)
    return false if number < 2
    (2..Math.sqrt(number)).none? { |i| number % i == 0 }
  end

  def self.fibonacci(n)
    return [] if n <= 0
    return [0] if n == 1
    return [0, 1] if n == 2

    fib = [0, 1]
    (2...n).each { fib << fib[-2] + fib[-1] }
    fib
  end

  def self.sort_words(sentence)
    sentence.split.sort.join(' ')
  end

  def self.palindrome?(word)
    normalized = word.downcase.gsub(/\W/, '')
    normalized == normalized.reverse ? "Verdadero" : "Falso"
  end

  def self.two_sum(nums, target)
    seen = {}
    nums.each do |num|
      complement = target - num
      return [complement, num] if seen[complement]
      seen[num] = true
    end
    nil
  end
end