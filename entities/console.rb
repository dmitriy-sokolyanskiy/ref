class Console
  INITIAL_STATE = :greeting
  STATES = %i[greeting choose_base_option create load main_menu].freeze

  def initialize
    @state = INITIAL_STATE
  end

  def console
    loop { process_state(@state) }
  end

  def process_state(state)
    exit unless STATES.include?(state)

    public_send(state)
  end

  def greeting
    message(:greeting)
    @state = :choose_base_option
  end

  def choose_base_option
    message(:base_options)
    @state = case read_input
             when 'create' then :create
             when 'load' then :load
             when 'exit' then :exit # for debug
               # else :exit
             end
  end

  def create
    puts 'Something is created'
    @state = :main_menu
  end

  def load
    puts 'Load...'
    @state = :main_menu
  end

  def main_menu
    message(:main_options)
    case read_input
    when 'SC' then puts '...SC...'
    when 'CC' then puts '...CC...'
    when 'DC' then puts '...DC...'
    when 'PM' then puts '...PM...'
    when 'WM' then puts '...WM...'
    when 'SM' then puts '...SM...'
    when 'DA' then puts '...DA...'
    when 'exit' then @state = :exit
    else puts "Wrong command. Try again!\n"
    end
  end

  def read_input
    gets.chomp
  end

  def message(id, **options)
    puts I18n.t(id, options)
  end
end
