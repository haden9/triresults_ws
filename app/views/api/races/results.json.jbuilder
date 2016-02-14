json.ignore_nil!
json.array!(results) do |entrant|
  json.partial! 'result', locals: {result: entrant}
end
