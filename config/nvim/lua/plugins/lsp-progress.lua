require("lsp-progress").setup {
  series_format = function(title, message, percentage, _)
    local builder = {}
    local has_title = false
    local has_message = false
    if title and title ~= "" then
      local formatted_title = title:gsub("^%l", title.upper)
      table.insert(builder, formatted_title)
      has_title = true
    end
    if message and message ~= "" then
      local formatted_message = message:gsub("^%l", message.upper)
      table.insert(builder, formatted_message)
      has_message = true
    end
    if percentage and (has_title or has_message) then
      table.insert(builder, string.format("(%.0f%%%%)", percentage))
    end
    return table.concat(builder, " ")
  end,
  client_format = function(client_name, _, series_messages)
    return #series_messages > 0
        and ("[" .. client_name .. "] " .. table.concat(series_messages, ", "))
      or nil
  end,
  format = function(client_messages)
    return #client_messages > 0 and (table.concat(client_messages, " ")) or ""
  end,
}
