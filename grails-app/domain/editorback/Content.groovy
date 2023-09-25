package editorback

import groovy.transform.ToString
import org.bson.types.ObjectId
@ToString
class Content {
    ObjectId id;
    String TrackingNumber;
    String TextHeader;
    String TextContent;
    String DivText;
    static constraints = {
    }

}
