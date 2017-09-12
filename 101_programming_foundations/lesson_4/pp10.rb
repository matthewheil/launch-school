munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

KID = (0..17)
ADULT = (18..64)
SENIOR = (65..99999)

munsters.each do |_, details|
  case details["age"]
  when KID
    details["age_group"] = "kid"
  when ADULT
    details["age_group"] = "adult"
  when SENIOR
    details["age_group"] = "senior"
  end
end

puts munsters