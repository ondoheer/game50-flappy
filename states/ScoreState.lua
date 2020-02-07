--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

-- Trophies images


local achievements = {
    ["star"] = love.graphics.newImage("star.png"),
    ["medal"] = love.graphics.newImage("medal.png"),
    ["trophy"] = love.graphics.newImage("cup.png")
}

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
    self.award = nil
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')
   
    if self.score < 5 and self.score > 0 then
        self.award = achievements["star"]
    elseif self.score < 10 and self.score >= 5 then
        self.award = achievements["medal"]
    elseif self.score >= 10 then
        self.award = achievements["trophy"]
    end
    
    if self.award then
        love.graphics.draw(self.award, 50,100)
    end
    love.graphics.printf('Press Enter to Play Again!', 0, 160, VIRTUAL_WIDTH, 'center')
end