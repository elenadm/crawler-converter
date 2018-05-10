# ruby version 2.4.1p111

def output_from_1_to_100
  p 'First implementation'
  1.upto(100) do |e|
    if e % 5 == 0 and e % 3 == 0
      puts 'FizzBuzz'
    elsif e % 5 == 0
      puts 'Buzz'
    elsif e % 3 == 0
      puts 'Fizz'
    else
      puts e
    end
  end
end

def output_from_1_to_100_v2
  p 'Second implementation'
  1.upto(100).each { |i|
    x = ''
    x += 'Fizz' if i % 3 == 0
    x += 'Buzz' if i % 5 == 0
    puts(x.present? ? x : i)
  }
end
