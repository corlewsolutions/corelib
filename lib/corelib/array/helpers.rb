class Array

  def options_label_for(value)
    sub = self.find {|each| each[1] == value}
    sub.nil? ? nil : sub[0]
  end

  def self.time_clock_type_options(options={})
    exemplify = options.fetch(:exemplify, true)
    id = options.fetch(:start_id, 1)
    return [["12-Hour Clock", id], ["24-Hour Clock", id+1]] if !exemplify

    t = Time.now
    s = options.fetch(:separater, " - ")
    h = options.fetch(:day, t.strftime("%l"))
    m = options.fetch(:month, t.strftime("%m"))
    ap =options.fetch(:am_pm, t.strftime("%P"))
    hm = options.fetch(:day24, t.strftime("%H"))
    [["12-Hour Clock#{s}(#{h}:#{m}#{ap})", id], ["24-Hour Clock#{s}(#{hm}:#{m})", id+1]]
  end

  def self.date_format_options(options={})
    exemplify = options.fetch(:exemplify, true)
    exemplify ? date_format_options_exemplified_raw(options) : date_format_options_raw(options)
  end

  def self.date_format_options_raw(options={})
    id = options.fetch(:start_id, 1)
    [["MM/DD/YYYY", id], ["MM-DD-YYYY", id+1], ["DD/MM/YYYY", id+2], ["DD-MM-YYYY", id+3], ["YYYY/MM/DD", id+4], ["YYYY-MM-DD", id+5], ["DD.MM.YYYY", id+6], ["YYYY.MM.DD", id+7]]
  end

  def self.date_format_options_exemplified_raw(options={})
    id = options.fetch(:start_id, 1)
    t = Time.now
    s = options.fetch(:separater, " - ")
    d = options.fetch(:day, t.strftime("%d"))
    m = options.fetch(:month, t.strftime("%m"))
    y = options.fetch(:year, t.year)
    [["MM/DD/YYYY#{s}(#{m}/#{d}/#{y})", id], ["MM-DD-YYYY#{s}(#{m}-#{d}-#{y})", id+1], ["DD/MM/YYYY#{s}(#{d}/#{m}/#{y})", id+2], ["DD-MM-YYYY#{s}(#{d}-#{m}-#{y})", id+3],
     ["YYYY/MM/DD#{s}(#{y}/#{m}/#{d})", id+4], ["YYYY-MM-DD#{s}(#{y}-#{m}-#{d})", id+5], ["DD.MM.YYYY#{s}(#{d}.#{m}.#{y})", id+6], ["YYYY.MM.DD#{s}(#{y}.#{m}.#{d})", id+7]]
  end

  def self.month_options(options={})
    abbrev = options.fetch(:abbrev, false)
    list = abbrev ? month_options_abbrev_raw : month_options_raw
    list.format_options_list(options)
  end

  def self.month_options_raw(start=1)
    [["January", start], ["February", start + 1], ["March", start + 2], ["April", start + 3], ["May", start + 4], ["June",  start + 5],
     ["July", start + 6], ["August", start + 7], ["September", start + 8], ["October", start + 9], ["November", start + 10], ["December", start + 11]]
  end

  def self.month_options_abbrev_raw(start=1)
    [["Jan", start], ["Feb", start + 1], ["Mar", start + 2], ["Apr", start + 3], ["May", start + 4], ["Jun", start + 5],
     ["Jul", start + 6], ["Aug", start + 7], ["Sep", start + 8], ["Oct", start + 9], ["Nov", start + 10], ["Dec", start + 11]]
  end

  def self.us_state_options(options={})
    abbrev = options.fetch(:abbrev, false)
    list =  abbrev ? us_state_options_abbrev_raw : us_state_options_raw
    list.format_options_list(options)
  end

  def self.us_state_options_raw
    [['Alabama', 'AL'], ['Alaska', 'AK'], ['Arizona', 'AZ'], ['Arkansas', 'AR'], ['California', 'CA'], ['Colorado', 'CO'],
     ['Connecticut', 'CT'], ['D.C.', 'DC'], ['Delaware', 'DE'], ['Florida', 'FL'], ['Georgia', 'GA'], ['Hawaii', 'HI'], ['Idaho', 'ID'],
     ['Illinois', 'IL'], ['Indiana', 'IN'], ['Iowa', 'IA'], ['Kansas', 'KS'], ['Kentucky', 'KY'], ['Louisiana', 'LA'],
     ['Maine', 'ME'], ['Maryland', 'MD'], ['Massachusetts', 'MA'], ['Michigan', 'MI'], ['Minnesota', 'MN'], ['Mississippi', 'MS'],
     ['Missouri', 'MO'], ['Montana', 'MT'], ['Nebraska', 'NE'], ['Nevada', 'NV'], ['New Hampshire', 'NH'], ['New Jersey', 'NJ'],
     ['New Mexico', 'NM'], ['New York', 'NY'], ['North Carolina', 'NC'], ['North Dakota', 'ND'], ['Ohio', 'OH'], ['Oklahoma', 'OK'],
     ['Oregon', 'OR'], ['Pennsylvania', 'PA'], ['Rhode Island', 'RI'], ['South Carolina', 'SC'], ['South Dakota', 'SD'],
     ['Tennessee', 'TN'], ['Texas', 'TX'], ['Utah', 'UT'], ['Vermont', 'VT'], ['Virginia', 'VA'], ['Washington', 'WA'],
     ['West Virginia', 'WV'], ['Wisconsin', 'WI'], ['Wyoming', 'WY']]
  end

  def self.us_state_options_abbrev_raw
    [['AL', 'AL'], ['AK', 'AK'], ['AZ', 'AZ'], ['AR', 'AR'], ['CA', 'CA'], ['CO', 'CO'],
     ['CT', 'CT'], ['DC', 'DC'], ['DE', 'DE'], ['FL', 'FL'], ['GA', 'GA'], ['HI', 'HI'], ['ID', 'ID'],
     ['IL', 'IL'], ['IN', 'IN'], ['IA', 'IA'], ['KS', 'KS'], ['KY', 'KY'], ['LA', 'LA'],
     ['ME', 'ME'], ['MD', 'MD'], ['MA', 'MA'], ['MI', 'MI'], ['MN', 'MN'], ['MS', 'MS'],
     ['MO', 'MO'], ['MT', 'MT'], ['NE', 'NE'], ['NV', 'NV'], ['NH', 'NH'], ['NJ', 'NJ'],
     ['NM', 'NM'], ['NY', 'NY'], ['NC', 'NC'], ['ND', 'ND'], ['OH', 'OH'], ['OK', 'OK'],
     ['OR', 'OR'], ['PA', 'PA'], ['RI', 'RI'], ['SC', 'SC'], ['SD', 'SD'],
     ['TN', 'TN'], ['TX', 'TX'], ['UT', 'UT'], ['VT', 'VT'], ['VA', 'VA'], ['WA', 'WA'],
     ['WV', 'WV'], ['WI', 'WI'], ['WY', 'WY'],]
  end

  def format_options_list(options={})
    insert_options_label_blank(options)
    change_options_label_case(options) if options[:format] #Change case if :format is set, otherwise use default case
    self
  end

private

  def insert_options_label_blank(options)
    add_blank = options.fetch(:blank, "true")
    blank_value = options.fetch(:blank_value, 0)
    blank_label = options.fetch(:blank_label, "")
    blank_position = options.fetch(:blank_position, 0)
    self.insert(blank_position, [blank_label, blank_value]) if add_blank
  end

  def change_options_label_case(options)
    label_format = options.fetch(:format)
    self.each {|opt| opt[0].upcase!} if label_format == "Up"
    self.each {|opt| opt[0].capitalize!} if label_format == "Cap"
    self.each {|opt| opt[0].downcase!} if label_format == "Down"
  end

end
