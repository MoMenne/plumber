jsonSerializer <- function(val, req, res, errorHandler){
  tryCatch({
    if(jsonlite::validate(val)) {
      json <- val
    } else {
      json <- jsonlite::toJSON(val)
    }

    res$setHeader("Content-Type", "application/json")
    res$body <- json

    return(res$toResponse())
  }, error=function(e){
    errorHandler(req, res, e)
  })
}

.globals$serializers[["json"]] <- jsonSerializer
