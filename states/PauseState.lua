--[[
    Pause State
    Author: Pedro Baumann
    

    Pauses the Playstate
]]

PauseState = Class{__includes = BaseState}

function PauseState:enter(params)
    self.playParams = params
    
end

function PauseState:update(dt)
    if love.keyboard.wasPressed("p") then
        gStateMachine:change("play",{
            bird = self.playParams.bird,
            pipePairs = self.playParams.pipePairs,
            score = self.playParams.score,
            lastY = self.playParams.lastY
        }
    )
    end
end

function PauseState:render()
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Game Paused!', 0, 64, VIRTUAL_WIDTH, 'center')

end