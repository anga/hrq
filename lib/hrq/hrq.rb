module Hrq
  # Load all matchs from the file
  def add_template(file)
    Hrq::Context.load_template file
  end

  # Evaluate only one match
  #   Hrq.match /\AI want all users/ do ... end
  def match(regexp, weight: 0, &block)
    Hrq::Context.evaluate regexp, weight: 0, &block
  end

  def clean_matches
    Hrq::Db.clear
  end

  module_function :add_template
  module_function :clean_matches
  module_function :match
end