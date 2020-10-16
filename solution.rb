class Solution

#test---------------------------
  def gen(n)
  n.times.map { rand(8000) + 1 }
  end

  test = gen(5)
#1------------------------------
  def caesar_cipher(string, shift)
    lower = ("a".."z").to_a
    upper = ("A".."Z").to_a

    encrypter = Hash[
    lower.zip(lower.rotate(shift)) + upper.zip(upper.rotate(shift))
    ]
    string.chars.map { |c| encrypter.fetch(c, c) }.join 
  end 

#2------------------------------
  def substrings(text,dictionary) 
    words = text.downcase.split(" ") 
    
    frequencies = Hash.new(0) 
    words.each { |word|
    dictionary.each { |dict_word| 
    frequencies[dict_word] += 1 if word.include?(dict_word)
    }
    } 
    frequencies
  end

#3------------------------------
  def stock_picker (array)
    max_profit = 0
    best_buy_day = 0
    best_sell_day = 0

    for buy_day in 0..(array.length - 2) 
      for sell_day in (buy_day + 1)..(array.length - 1)

      profit = array[sell_day] - array[buy_day]

      if (profit > max_profit)
        max_profit = profit   
        best_buy_day = buy_day
        best_sell_day = sell_day
      end
    end
  end

  [best_buy_day, best_sell_day]
  end

#4------------------------------
  def bubble_sort(array)
    until array == array.sort
      for i in 0..(array.length - 2)
        if array[i] > array[i + 1]
          array[i], array[i + 1] = array[i + 1], array[i]
        end
      end
    end
    array
  end
#5------------------------------
  def selection_sort(array)
    last_element = array.length-1
    for i in 0..last_element
      min_index = i
        for j in (i + 1)..last_element
          min_index = j if array[j] < array[min_index]
        end
      array[i], array[min_index] = array[min_index], array[i] if min_index != i #swap when min_index != to i (everytime it changes)
    end
    array
  end
 
#6------------------------------
  def self.fib_recursive(n)
    raise ArgumentError, "The number must be a positive integer" if n < 0
    return [] if n == 0
    return [0] if n == 1
    return [0,1] if n == 2 
  
    seq = fib_recursive(n - 1)
    seq << seq[-2] + seq[-1]
    seq
  end

  def self.fib_iterative(n)
    raise ArgumentError, "The number must be a positive integer" if n < 0
    return [] if n == 0
    return [0] if n == 1
    return [0,1] if n == 2 

    seq = [0, 1] 
    (3..n).each { |i| seq << seq[-2] + seq[-1] }
    seq
  end

#7------------------------------
  def self.merge_sort(array)
    return array if array.length == 1
    middle = array.length / 2
    left = merge_sort (array[0...middle])
    right = merge_sort (array[middle..-1])
    merge(left, right)
  end

  def merge(left, right)
    result = []
    until left.length == 0 || right.length == 0 do
        result << (left.first <= right.first ? left.shift : right.shift)
    end
    result + left + right
  end
#8------------------------------
  def self.binary_search(array, n)
    min = 0
    max = (array.length) - 1
    loop_count = 0

    while min <= max
      middle = (min + max) / 2
      loop_count+=1
        
      if array[middle] == n
        print "#{loop_count} steps"
        return middle
      elsif array[middle] > n
        max = middle - 1
      elsif array[middle] < n
        min = middle + 1
      end 
    end 
    print "#{n} not found in this array"
    return nil
  end 

  def self.binary_search_words(array, string)
    min = 0
    max = (array.length) - 1
    loop_count = 0

    while min <= max
      middle = (min + max) / 2
      loop_count+=1
        
      if array[middle] == string
        print "#{loop_count} steps"
        return middle
      elsif array[middle] > string
        max = middle - 1
      elsif array[middle] < string
        min = middle + 1
      end 
    end 
    print "#{string} not found in this array"
    return nil
  end 

end
_____________________
   
a = Solution.new

  # 1
  a.caesar_cipher("What a string!", 5) 

  # 2
   
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
  a.substrings("Howdy partner, sit down! How's it going?", dictionary)

  # 3
  a.stock_picker([17,3,6,9,15,8,6,1,10])

  # 4
  a.bubble_sort([4,3,78,2,0,2])

  # 5
  a.selection_sort([4,3,78,2,0,2])

  # 6
  Solution.fib_recursive(5)
  Solution.fib_iterative(5)

  # 7
  Solution.merge_sort([4,3,78,2,0,2])

  # 8
  Solution.binary_search([1,2,3,5], 5)
  
  #test 
  require "open-uri"
  require 'json'
  file = open("https://gist.githubusercontent.com/jesseditson/1e6b2b524814320515ccfe7e2f856eda/raw/17d61fa1e80e14b13c4525b09f84148772586b59/words.json").read

  data = JSON.parse(file)
  test_dict = data["words"]
  test_word = test_dict.sample

  Solution.binary_search_words(test_dict, test_word)
