package ua.kiev.prog;

import ua.kiev.prog.model.Contact;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import java.util.*;

@XmlRootElement(name = "parent")
public class Parent {

    @XmlElement(name = "contact")
    private final List<Contact> list = new ArrayList<>();

    public List<Contact> getList() {
        return list;
    }

    public void putAll(List<Contact> contacts){
        list.addAll(contacts);
    }
    public void put(Contact contact){
        list.add(contact);
    }
}
