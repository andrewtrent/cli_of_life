module CliOfLife::CLI
  def self.go
    self.greet
    self.taxa_get
  end

  def self.greet
    puts <<~HEREDOC
      Hello! What sort of life are you interested in today?
      1. Animalia
      2. Plantae
      3. Fungi
      4. No life please
    HEREDOC
  end

  def self.taxa_get
    input = gets.strip.to_i
    if input == 1
      self.menu_animalia
    elsif input == 2
      self.menu_plantae
    elsif input == 3
      self.menu_fungi
    elsif input == 4
      self.menu_no_life
    else
      puts "I don't understand. What other choice is there?"
    end
  end

  def self.menu_animalia
    puts "Animals make cholesterol and stuff."
    puts "What phylum of animalia are you interested in?"
  end

  def self.menu_plantae
    puts "Plants have chlorphyll or whatever."
    puts "What phylum of plantae are you interested in?"

  end

  def self.fungi
    puts "Fungi are just weird little goobers."
    puts "What phylum of fungi are you interested in?"
  end

  def self.menu_no_dragons
    puts "Life is really all we've got. Are you trying to quit?"
    self.menu_quit_confirm
  end



  # methods that help you quit
  def self.menu_quit
    puts "Okay, life-hater. You can go."
  end

  def self.menu_quit_confirm
    puts <<~HEREDOC
      1. Yes, I hate life.
      2. No, life is good.
    HEREDOC

    input = gets.strip.to_i
    if input == 1
      self.menu_quit
    elsif input == 2
      self.go
    end
  end
end
