define ["services/logger"], (logger) ->
  
  canActivate = ->
    logger.log "Not Yet Implemented", null, "placeholder", true
    false

  vm =
    canActivate: canActivate
