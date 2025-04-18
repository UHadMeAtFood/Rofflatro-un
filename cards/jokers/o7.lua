--o7 (Rare) - If final hand of round scores 50% of total score but doesn't win, prevents death and gives 20$. Self destructs. (False alarm guys!)

SMODS.Joker{
	key = 'o7',
	atlas = 'roffers',
	rarity = 3,
	blueprint_compat = true,
	eternal_compat = true,
	pos = { x = 4, y = 5 },
	config = { extra = {
		dollars = 20,
		}
	},
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.dollars}}
	end,
	calculate = function(self,card,context)
		if context.end_of_round and not context.blueprint and context.game_over and  G.GAME.chips/G.GAME.blind.chips >= 0.5 then
			G.E_MANAGER:add_event(Event({
				func = function()
					G.hand_text_area.blind_chips:juice_up()
					G.hand_text_area.game_chips:juice_up()
					play_sound('tarot1')
					card:start_dissolve()
					return true
				end
			})) 
			return {
				message = 'Put that away!',
				saved = true,
				colour = G.C.RED,
				dollars = card.ability.extra.dollars
			}

		end
	end,
}
