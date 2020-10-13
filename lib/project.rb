# Describes an Project
class Project
  ### CLASS DEFINITIONS ###


  # Class variables
  @@all = [] # list of all Projects

  # Reader for all class variable
  def self.all
    @@all
  end  


  ### INSTANCE DEFINITIONS ###

  # instance readers and writers
  attr_accessor :title

  # default constructor
  def initialize(title=nil)
    self.title = title
    self.save
  end

  # saves Project instance to all class variable
  def save
    self.class.all << self
  end

  # initializes a new Project Backer to assocaite the given 
  def add_backer(backer)
    ProjectBacker.new(self, backer)
  end

  # Return all ProjectBacker objects associated with this project
  def project_backers
    ProjectBacker.all.select do |projectbacker| 
      projectbacker.project == self
    end
  end

  # Returns all Backer objects associated with this project
  def backers
    self.project_backers.map do |projectbacker| 
      projectbacker.backer
    end
  end
  
end