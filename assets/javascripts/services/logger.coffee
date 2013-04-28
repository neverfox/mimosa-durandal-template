define ["durandal/system", "toastr"], (system, toastr) ->

  log = (message, data, source, showToast) ->
    logIt message, data, source, showToast, "info"

  logError = (message, data, source, showToast) ->
    logIt message, data, source, showToast, "error"

  logIt = (message, data, source, showToast, toastType) ->
    source = (if source then "[" + source + "] " else "")

    if data
      system.log source, message, data
    else
      system.log source, message

    if showToast
      if toastType is "error"
        toastr.error message
      else
        toastr.info message

  setToastrOption = (option, value) ->
    toastr.options[option] = value

  logger =
    log: log
    logError: logError
    setToastrOption: setToastrOption
