package gangplank

class SchemaController {

  def index() { 
    def result = [:]
    result.schemas = Schema.findAll()
    result
  }
}