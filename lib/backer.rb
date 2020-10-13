# Describes an Backer
class Backer
  ### CLASS DEFINITIONS ###


  # Class variables
  @@all = [] # list of all Backers

  # Reader for all class variable
  def self.all
    @@all
  end  


  ### INSTANCE DEFINITIONS ###

  # instance readers and writers
  attr_accessor :name

  # default constructor
  def initialize(name=nil)
    self.name = name
    self.save
  end

  # saves Backer instance to all class variable
  def save
    self.class.all << self
  end

  # initializes ProjectBacker with the given project and self 
  #   represents the relationship between given arguments
  def back_project(project)
    ProjectBacker.new(project, self)
  end

  # Return all ProjectBacker objects associated with this backer 
  def project_backers
    ProjectBacker.all.select do |projectbacker| 
      projectbacker.backer == self
    end
  end

  # Returns all Project objects associated with this backer
  def backed_projects 
    self.project_backers.map do |projectbacker| 
      projectbacker.project
    end
  end

  
end