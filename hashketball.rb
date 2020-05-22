# Write your code below game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

def num_points_scored(name)
  all_players = game_hash[:home][:players].concat(game_hash[:away][:players])
  found = all_players.find do |hash|
    hash[:player_name].eql?(name)
  end
  found[:points]
end

def shoe_size(name)
  all_players = game_hash[:home][:players].concat(game_hash[:away][:players])
  found = all_players.find do |hash|
    hash[:player_name].eql?(name)
  end
  found[:shoe]
end

def team_colors(name)
  if game_hash[:home][:team_name].eql?(name)
    return game_hash[:home][:colors]
  else 
    return game_hash[:away][:colors]
  end
end

def team_names()
  [game_hash[:home][:team_name],game_hash[:away][:team_name]]  
end

def player_numbers(name)
  team = game_hash[:home]
  if game_hash[:away][:team_name].eql?(name)
    team = game_hash[:away]
  end
  all_players = team[:players]
  jersey_numbers = all_players.collect do |hash|
    hash[:number]
  end
  jersey_numbers
end

def player_stats(name)
  all_players = game_hash[:home][:players].concat(game_hash[:away][:players])
  found = all_players.find do |hash|
    hash[:player_name].eql?(name)
  end
  found
end

def big_shoe_rebounds()
  all_players = game_hash[:home][:players].concat(game_hash[:away][:players])
  shoe = all_players[0][:shoe]
  rebounds = all_players[0][:rebounds]
  all_players.each do |hash|
    if hash[:shoe] > shoe
      shoe = hash[:shoe]
      rebounds = hash[:rebounds]
      #puts hash[:player_name]
    end
  end
  #puts shoe
  rebounds
end

def most_points_scored()
  all_players = game_hash[:home][:players].concat(game_hash[:away][:players])
  points = all_players[0][:points]
  name = all_players[0][:player_name]
  all_players.each do |hash|
    if hash[:points] > points
      points = hash[:points]
      name = hash[:player_name]
    end
  end
  name
end

def winning_team()
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  home_points = 0 
  away_points = 0
  home_players.each do |hash|
    home_points += hash[:points]
  end
  away_players.each do |hash|
    away_points += hash[:points]
  end
  if home_points > away_points
    return game_hash[:home][:team_name]
  else 
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name()
  all_players = game_hash[:home][:players].concat(game_hash[:away][:players])
  all_names = all_players.collect do |hash|
    hash[:player_name]
  end
   all_names.max_by  
end

puts player_with_longest_name()
