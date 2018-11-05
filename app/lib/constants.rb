class Constants

  def self.get_year_list
    year_list = [
        ['2019年度', 2019]
    ]
    loop_times = Date.today.year - 2019
    loop_times.times do |n|
      tmp_year = 2019 + n
      year_list << [tmp_year.to_s + '年度', tmp_year]
    end
    return year_list.sort.reverse
  end

end