=begin
  A new system policy has been put in place that requires all accounts to use a passphrase instead of simply a password.
  A passphrase consists of a series of words (lowercase letters) separated by spaces.

  To ensure security, a valid passphrase must contain no duplicate words.
=end


def check_passphrases(data)
  phrases = data.split("\n")
  phrases.select do |phrase|
    words = phrase.strip.split(" ")
    words.count == words.uniq.count
  end.count
end

test_data = "aa bb cc dd ee
aa bb cc dd aa
aa bb cc dd aaa"

puts check_passphrases(test_data)