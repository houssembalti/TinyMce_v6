package editorback

import grails.converters.JSON
import org.bson.types.ObjectId

class ContentController {

    def index() { }

    def savecontent(Content content){
        def b=content.save()
        render b as JSON
    }
    def getcontentt(String id){
        def researched =Content.findById( id);

        render researched as JSON
    }
    def editor(){
        def list=Content.first()
        System.out.println(list.getTextHeader())
    render (view: "editor",model: [contents:list])
    }
    def updatecontent(Content content){
        System.out.println(content)
    }

    def submitcontent(){
        println params.submittedcontent


        render  JSON.parse(params.submittedcontent) as JSON

    }
}
