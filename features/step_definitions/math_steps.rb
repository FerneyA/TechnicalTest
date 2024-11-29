require 'json'
require_relative '../utils/math_utils'

Given('a number {int}') do |number|
  @number = number
end

Given('the sentence {string}') do |sentence|
  @input = sentence
end

Given('the word {string}') do |word|
  @word = word
end

Given('the list {string}') do |list|
  @input = eval(list)
end

Given('the target {int}') do |target|
  @target = target
end

When('I check if the number is prime') do
  @result = MathUtils.prime?(@number) ? 'Verdadero' : 'Falso'
end

When('I sort the words alphabetically') do
  @result = MathUtils.sort_words(@input)
end

When('I check if the word is a palindrome') do
  @result = MathUtils.palindrome?(@word)
end

When('I generate the Fibonacci sequence') do
  @result = MathUtils.fibonacci(@number)
end

When('I find the two numbers that sum to the target') do
  @result = MathUtils.two_sum(@input, @target)
end

Then('the Fibonacci result should be {string}') do |expected|
  expect(@result).to eq(eval(expected))
end

Then('the prime number result should be {string}') do |expected|
  expect(@result).to eq(expected)
end

Then('the sorted result should be {string}') do |expected|
  expect(@result).to eq(expected)
end

Then('the palindrome result should be {string}') do |expected|
  expect(@result).to eq(expected)
end

Then('the two sum result should be {string}') do |expected|
  expect(@result.to_s).to eq(expected)
end

Then('the two sum result should be None') do
  expect(@result).to be_nil
end
