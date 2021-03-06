class Constants

  SPACE_HYPHEN_SPACE = ' - '

  def self.get_year_list
    year_list = [
        ['2019年度', 2019]
    ]
    loop_times = Date.today.year - 2019
    loop_times.times do |n|
      tmp_year = 2019 + (n + 1)
      year_list << [tmp_year.to_s + '年度', tmp_year]
    end
    return year_list.sort.reverse
  end

  def self.get_string_year_list
    this_year = Date.today.year
    year_list = [this_year.to_s, (this_year + 1).to_s, (this_year - 1).to_s]
    return year_list
  end

  def self.get_year_set_from_2007
    year_list = [
        ['2007年度', 2007]
    ]
    loop_times = Date.today.year - 2007
    loop_times.times do |n|
      tmp_year = 2007 + (n + 1)
      year_list << [tmp_year.to_s + '年度', tmp_year]
    end
    return year_list.sort.reverse
  end

  def self.get_year_set_from_2018
    year_list = [
        ['2018年度', 2018]
    ]
    loop_times = Date.today.year - 2018
    loop_times.times do |n|
      tmp_year = 2018 + (n + 1)
      year_list << [tmp_year.to_s + '年度', tmp_year]
    end
    return year_list.sort.reverse
  end

  def self.get_year_list_from_2007
    year_list = [2007]
    loop_times = Date.today.year - 2007
    loop_times.times do |n|
      tmp_year = 2007 + (n + 1)
      year_list << tmp_year
    end
    return year_list.sort.reverse
  end

  def self.get_english_season(jap_season)
    if jap_season == '春季'
      return 'spring'
    elsif jap_season == '秋季'
      return 'autumn'
    end
  end

  def self.get_circle_grade(grade)
    case grade
    when '1年'
      '①'
    when '2年'
      '②'
    when '3年'
      '③'
    when '4年'
      '④'
    end
  end

end