require "calculadora/version"

module Calculadora
  # Your code goes here...
  def self.sum num1, num2
    num1 + num2
  end

  def self.times num1, num2
    num1 * num2
  end

  def self.div num1, num2
    num1 / num2
  end

  def self.math num1, num2, num3
    sum times(num1, num2), num3
  end

  def self.sumatoria nums
    nums.map(&:to_i).reduce(:+) || 0
  end
end
