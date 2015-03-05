def index(n, i, j, k)
  return (i * n * n) + (j * n) + k
end

def expand(n, i, j, k)
  if (n == i+1 || n == j+1 || n == k+1)
    $memo[index(n, i, j, k)] = 1
    return 1
  end
  set = [$memo[index(n, i+1, j, k)], $memo[index(n, i, j+1, k)], $memo[index(n, i, j, k+1)], $memo[index(n, i+1, j+1, k)], $memo[index(n, i+1, j, k+1)], $memo[index(n, i, j+1, k+1)], $memo[index(n, i+1, j+1, k+1)]] 
  if (set.uniq.length == 1)
    $memo[index(n, i, j, k)] = $memo[index(n, i+1, j, k)] + 1
    return $memo[index(n, i+1, j, k)] + 1
  else
    $memo[index(n, i, j, k)] = 1
    return 1
  end
end

largest = 0
$memo = {} #associate string index with largest cube with that index in top right corner
tests = gets.split.map(&:to_i)[0]
tests.times do
  line =  gets.split.map(&:to_i)
  n = line[0]
  p = line[1]
  a = gets.chomp
  b = gets.chomp
  # if (a == b)
    # puts(n.to_s + " 1")
    # next
  # end
  ((n-1).downto(0)).each do |x|
    ((n-1).downto(0)).each do |y|
      ((n-1).downto(0)).each do |z|
        if(a[index(n, x, y, z)] == b[index(n, x, y, z)])
          size = expand(n, x, y, z)
          if(size > largest)
            largest = size
          end
        else 
          $memo[index(n, x, y, z)] = 0
        end
      end
    end
  end
  puts(largest)
end