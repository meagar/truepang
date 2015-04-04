require 'json'

desc 'Import from pingpang'
task import: :environment do
  json = STDIN.read
  data = JSON.parse(json)

  player_user_mapping = {}

  User.transaction do
    User.destroy_all
    data['players'].each do |p|
      u = User.new
      u.name = p['name']
      u.email = p['email']
      u.username = p['nickname'] || p['email']
      u.image = p['image']
      u.uid = p['uid']
      u.save!
      player_user_mapping[p['id']] = u
    end

    data['games'].each do |g|
      u1 = player_user_mapping[g['player1']]
      u2 = player_user_mapping[g['player2']]

      match = Match.new
      match.finished_at = g['finished_at']
      match.save!

      game = Game.new
      game.match = match
      game.finished_at = g['finished_at']
      game.save!

      p1 = Player.new
      p1.user = u1
      p1.match = match
      p1.save!

      s1 = GameScore.new
      s1.player = p1
      s1.game = game
      s1.score = g['score1']
      s1.save!

      p2 = Player.new
      p2.match = match
      p2.user = u2
      p2.save!

      s2 = GameScore.new
      s2.player = p2
      s2.game = game
      s2.score = g['score2']
      s2.save!
    end
  end

end
