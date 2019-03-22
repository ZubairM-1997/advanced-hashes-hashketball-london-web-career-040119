require 'pry'
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end


def big_shoe_rebounds(h)
  #will return the number of rebounds associated with the player that has the largest shoe size
	# STEP1: find the player with the biggest shoe size
	#STEP 2: return that players number of rebounds
  h.each do |team, data|
    data.each do |attribute, values|
      if attribute == :players
        values.each do |player_number, player_data|
          if player_data == [:shoe_size].max
            return h[team][attribute][player_number][:rebounds]
          end 
        end 
      end 
    end 
  end
end 

big_shoe_rebounds(game_hash)

def num_points_scored(name) #takes argument of a players name and returns the number of points
  hash = game_hash
  hash.each do |teams_playing, data| 
    data.each do |attribute, value| 
      if value.include?(name) 
       return hash[location][attribute][name][:points]
      end
    end
  end
end

num_points_scored("Brendon Haywood")

def shoe_size(name) #takes name as argument and returns the shoe size
	game_hash.each do |teams_playing, data| 
		data.each do |attribute, value| 
			if attribute == :players
				value.each do |player_number, player_data| 
					return game_hash[teams_playing][attribute][player_number][:shoe_size]
				end 
			end 
		end 
	end 
end

shoe_size("Brendon Haywood")

def team_colors(team) #takes in an argument of the team name and returns an array of that teams colors.
	game_hash.each do |teams_playing, data|
		data.each do |attribute, value| 
			if attribute == :colors
				return game_hash[teams_playing][:colors]
			end 
		end 
	end 
end 

team_colors("Brooklyn Nets")

def team_names #operates on the hash to to return an array of team names
	array = []
	game_hash.each do |team_playing, data|
		data.each do |key, value|
			if key == :team_name 
				array.push(value)
			end 
		end 
	end
	return array
end

team_names


def player_numbers(teamname) #takes argument of the team name and returns an array of jersey numbers
	array = []
	game_hash.each do |team_playing, data|
		data.each do |attributes, values|
		  
			values.each do |player_number, player_data|
				if player_data == :number
					array.push(player_number)
				end 
			end 
		end 
	end 
end 


player_numbers("Charlotte Hornets")




def player_stats(name) #takes argument of player name and returns hash of players stats
  hash = game_hash
  hash.each do |location, attributes| 
    attributes.each do |attribute, info| 
      if info.include?(name) 
       return hash[location][attribute][name]
      end
    end
  end
end

player_stats("Brendon Haywood")

#big shoe rebounds
def output_msg(player)
  puts "#{player.name}, has shoe size: #{player.shoe_size}, and #{player.rebounds} rebounds"
end

game = Game.new(GAME_HASH)
players = game.all_players
biggest_shoe = players.max { |a, b| a.shoe_size <=> b.shoe_size }
output_msg(biggest_shoe)


##most points scored
def most_points_scored(game_teams)
  
  game_teams.values.
    flat_map { |team| team.fetch(:players).values }.
    max_by { |player| player.fetch(:points) }
end

##winning team
def winning_teams(data)
  score_1 = data[:home][:players].sum { |_, h| h[:points] }
  #=> 96
  score_2 = data[:away][:players].sum { |k, v| v[:points] }
  #=> 85
  if score_1 > score_2 
    puts "Brooklyn Nets won the game, their score was #{score_1} points"
  else 
    puts "Charlotte Hornets won the game, their score was #{score_2} points"
  end
end

winning_teams(game_hash)
#=> Brooklyn Nets won the game, their score was 96 points


  
      


