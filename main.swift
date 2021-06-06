
MyApp.mainMenu()

class MyApp {
    static var lists = [List]()

    static func mainMenu() {
        while true {
            print("\nEnter one option below: \n" +
            "1. Create new list \n" +
            "2. See exisiting lists \n" +
            "3. Categories \n" + 
            "4. Quit")
            let command = readLine()
            switch command {
            case "1":
                print("\nEnter name of the new list:")
                let name = readLine()
                let list = List(name: name!) 
                lists.append(list)
                listMenu(list: list)
            case "2":
                break
            case "3":
                break
            case "4":
                return
            default:
                break
            }
        }           
    }

    static func listMenu(list: List) {
        //TODO
        while true {
            print("\nList: \(list.name)")
            print("items:")
            for item in list.items {
                print(item)
            }
            print("\n1. Add item\n" +
            "2. Edit item\n" +
            "3. Remove item\n" +
            "4. Sort items\n" + 
            "5. back")
            let command = readLine()
            switch command {
                case "1":
                    let title = readLine()
                    let content = readLine()
                    let priority = Int(readLine())
                    let item = Item(title: title, content: content, priority: priority)
                    list.items.append(item)
                    break
                case "2":
                    let itemId = readLine()
                    
                    let newTitle = readLine()
                    let newContent = readLine()
                    let newPriority = readLine()

                    list.items[Int(itemId)].title = newTitle
                    list.items[Int(itemId)].content = newContent
                    list.items[Int(itemId)].priority = Int(newPriority)
                    
                    break
                case "3":
                    let itemId = readLine()
                    list.items.remove(at: Int(itemId))
                    break
                case "4":
                    break
                case "5":
                    return
                default:
                    break
            }
        }
    }
}

class List {
    var name: String
    var items = [Item]()

    init(name: String) {
        self.name = name
    }
    
}

class Item: CustomStringConvertible {
    var title: String
    var content: String
    var priority: Int
    
    init(title: String, content: String, priority: Int) {
        self.title = title
        self.content = content
        self.priority = priority
    }

    var description: String {
        return "\ntitle: \(self.title) \n" +
        "content: \(self.content) \n" +
        "priority: \(self.priority)"
    }
}

class Category:List {

    override init(name: String) {
        super.init(name: name)
    }
    
}