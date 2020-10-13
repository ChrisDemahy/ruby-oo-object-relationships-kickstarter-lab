# Describes an ProjectBacker
class ProjectBacker
  ### CLASS DEFINITIONS ###


  # Class variables
  @@all = [] # list of all ProjectBackers

  # Reader for all class variable
  def self.all
    @@all
  end  


  ### INSTANCE DEFINITIONS ###

  # instance readers and writers
  attr_accessor :project, :backer

  # default constructor
  def initialize(project=nil, backer=nil)
    self.project = project
    self.backer = backer
    self.save
  end

  # saves ProjectBacker instance to all class variable
  def save
    self.class.all << self
  end
end