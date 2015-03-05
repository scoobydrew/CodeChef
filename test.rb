def mulBy312(x)
  x = ((x << 8) + (x << 5) + (x << 4) + (x << 3)) # 256 + 32 + 16 + 8 = 312
  return x
end

def test 
  result = true
  if (mulBy312(0) != 0)
    puts mulBy312(0)
    puts "the code doesn't work to multiply by 0"
    result = false
  end
  if (mulBy312(1) != 312)
    puts mulBy312(1)
    puts "the code doesn't work to multiply by 1"
    result = false
  end
  if (mulBy312(-1) != -312)
    puts mulBy312(-1)
    puts "the code doesn't work to multiply by a negative number"
    result = false
  end
  if (mulBy312(10) != 3120)
    puts mulBy312(10)
    puts "the code doesn't work to multiply by 10"
    result = false
  end
  return result
end

puts test()
