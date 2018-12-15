class Constants

  def self.get_year_list
    year_list = [
        ['2018年度', 2018]
    ]
    loop_times = Date.today.year - 2018
    loop_times.times do |n|
      tmp_year = 2018 + n
      year_list << [tmp_year.to_s + '年度', tmp_year]
    end
    return year_list.sort.reverse
  end

  def self.get_string_year_list
    this_year = Date.today.year
    year_list = [this_year.to_s, (this_year + 1).to_s, (this_year - 1).to_s]
    return year_list
  end

end