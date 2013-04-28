define ["services/logger"], (logger) ->
  
  activate = ->
    logger.log "Home View Activated", null, "home", true
    true

  vm =
    activate: activate
    title: "Home View"
