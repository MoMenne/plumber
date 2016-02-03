jsonSerializer <- function(val, req, res, errorHandler){
  tryCatch({
      json <- val
      class(json) <- "json"

    res$setHeader("Content-Type", "application/json")
    res$body <- json
    class(res$body) <- "json"

    return(res$toResponse())
  }, error=function(e){
    errorHandler(req, res, e)
  })
}

.globals$serializers[["json"]] <- jsonSerializer
