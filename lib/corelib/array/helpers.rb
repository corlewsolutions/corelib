class Array

  def options_label_for(value)
    sub = self.find {|each| each[1] == value}
    return nil if sub.nil?
    sub[0]
  end

  def self.us_state_options(options={})
    abbrev = options.fetch(:abbrev, false)
    options[:abbrev] = abbrev #In case abbrev is not in options, set it to the default so sub routines can access

    list =  abbrev ? us_state_options_abbrev_raw : us_state_options_raw
    list.format_raw_us_state_list(options)
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

  def format_raw_us_state_list(options={})
    add_blank = options.fetch(:blank, "true")
    blank_value = options.fetch(:blank_value, 0)
    blank_label = options.fetch(:blank_label, "")
    blank_position = options.fetch(:blank_position, 0)
    self.insert(blank_position, [blank_label, blank_value]) if add_blank
    change_us_state_list_label_case(options)
    self
  end

private

  def change_us_state_list_label_case(options)
    abbrev = options.fetch(:abbrev)
    label_format = abbrev ? options.fetch(:format, "Up") : options.fetch(:format, "Cap")
    return self if (label_format == "Up") and abbrev
    return self if (label_format == "Cap") and !abbrev

    self.each {|opt| opt[0].upcase!} if label_format == "Up"
    self.each {|opt| opt[0].capitalize!} if label_format == "Cap"
    self.each {|opt| opt[0].downcase!} if label_format == "Down"
  end

end
