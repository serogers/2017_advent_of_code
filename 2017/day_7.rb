=begin
  For example, if your list is the following:

  pbga (66)
  xhth (57)
  ebii (61)
  havc (66)
  ktlj (57)
  fwft (72) -> ktlj, cntj, xhth
  qoyq (66)
  padx (45) -> pbga, havc, qoyq
  tknk (41) -> ugml, padx, fwft
  jptl (61)
  ugml (68) -> gyxo, ebii, jptl
  gyxo (61)
  cntj (57)

  ...then you would be able to recreate the structure of the towers that looks like this:

                  gyxo
                /
           ugml - ebii
         /      \
        |         jptl
        |
        |         pbga
       /        /
  tknk --- padx - havc
       \        \
        |         qoyq
        |
        |         ktlj
         \      /
           fwft - cntj
                \
                  xhth
=end

def determine_base(data)
  rows = data.split("\n")

  programs = {}

  rows.each do |row|
    elements = row.split(" ")

    program_name = elements.first
    children = if row.include?('->')
      above_count = elements.size - elements.index('->') - 1
      elements.last(above_count).map {|el| el.chomp(',')}
    else
      []
    end

    programs[program_name] = children
  end

  base = programs.find do |name, children|
    children.any? && programs.values.none? {|arr| arr.include?(name)}
  end

  base.first
end

data = "pbga (66)
  xhth (57)
  ebii (61)
  havc (66)
  ktlj (57)
  fwft (72) -> ktlj, cntj, xhth
  qoyq (66)
  padx (45) -> pbga, havc, qoyq
  tknk (41) -> ugml, padx, fwft
  jptl (61)
  ugml (68) -> gyxo, ebii, jptl
  gyxo (61)
  cntj (57)"

puts determine_base(data)