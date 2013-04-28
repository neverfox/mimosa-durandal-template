require.config
  paths:
    blockui: "vendor/jquery/plugins/jquery.blockUI"
    bootstrap: "vendor/bootstrap/bootstrap"
    jquery: "vendor/jquery/jquery"
    knockout: "vendor/knockout/knockout"
    lodash: "vendor/lodash/lodash"
    sammy: "vendor/sammy/sammy"
    text: "durandal/amd/text"
    toastr: "vendor/toastr/toastr"
  shim:
    blockui: ["jquery"]
    bootstrap: ["jquery"]
    toastr: ["jquery"]

define [
  "durandal/app"
  "durandal/viewLocator"
  "durandal/system"
  "durandal/plugins/router"
  "services/logger"
], (app, viewLocator, system, router, logger) ->
  
  # Enable debug message to show in the console 
  system.debug true

  app.title = "My App"

  app.start().then ->
    logger.setToastrOption("positionClass", "toast-bottom-right")
    logger.setToastrOption("backgroundpositionClass", "toast-bottom-right")
        
    router.handleInvalidRoute = (route, params) ->
      logger.logError "No Route Found", route, "main", true
    
    # When finding a viewmodel module, replace the viewmodel string 
    # with view to find its partner view.
    router.useConvention()
    viewLocator.useConvention()
    
    # Adapt to touch devices
    app.adaptToDevice()
    
    #Show the app by setting the root view model for our application.
    app.setRoot "viewmodels/shell", "entrance"
