def swap_name(string)
  string.split.reverse.join(", ")
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
