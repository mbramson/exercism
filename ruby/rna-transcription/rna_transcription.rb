class Complement

  def self.of_dna(dna)
    rna = dna.
      split('').
      map { |n| of_single_nucleotide(n) }.
      reduce(:+)
    rna.length == dna.length ? rna : ''
  end

  def self.of_single_nucleotide(n)
    case
    when n == 'C'
      'G'
    when n == 'G'
      'C'
    when n == 'T'
      'A'
    when n == 'A'
      'U'
    else
      ''
    end
  end

end

module BookKeeping
  VERSION = 4
end
