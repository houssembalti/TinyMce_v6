package editorback

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        "/content/save"(controller: "content",action: "savecontent")
        "/content/get/$id"(controller: "content",action: "getcontentt")
        "/content/editor"(controller: "content",action: "editor")
        "/"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
