define [
  "durandal/system"
  "durandal/plugins/router"
  "services/logger"
], (system, router, logger) ->
  
  activate = ->
    boot()

  boot = ->
    router.mapNav "home"
    router.mapNav "placeholder"
    log "My App Loaded!", null, false
    router.activate "home"

  log = (msg, data, showToast) ->
    logger.log msg, data, system.getModuleId(shell), showToast

  shell =
    activate: activate
    router: router
