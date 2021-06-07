
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
                if lists.count == 0 {
                    print("\nNo lists has been created yet")
                    break
                }
                print("\nChoose one list:")
                for (index, list) in lists.enumerated() {
                    print("\(index). \(list.name)")
                }
                let index = Int(readLine()!)
                listMenu(list: lists[index!])
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
            for (index, item) in list.items.enumerated() {
                print("\nitem No. : \(index)\n\(item)")
            }
            print("\n1. Add item\n" +
            "2. Edit item\n" +
            "3. Remove item\n" +
            "4. Sort items\n" + 
            "5. back")
            let command = readLine()
            switch command {
            case "1":
                print("\nEnter the title:")
                let title = readLine()
                print("Enter the content:")
                let content = readLine()
                print("Enter priority number:")
                let priority = Int(readLine()!)
                let toDoItem = Item(title: title!, content: content!, priority: priority!)
                list.items.append(toDoItem)
                print("item added")
            case "2":
                print("\nSelect an item:")
                let item = list.items[Int(readLine()!)!]
                print("\nEnter new title:")
                let title = readLine()
                item.title = title!
                print("Enter new content:")
                let content = readLine()
                item.content = content!
                print("Enter new priority number:")
                let priority = Int(readLine()!)
                item.priority = priority!
                print("item edited")
            case "3":
                print("\nSelect an item:")
                list.items.remove(at: Int(readLine()!)!)
                print("item removed")
            case "4":
                //TODO
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
        return "title: \(self.title) \n" +
        "content: \(self.content) \n" +
        "priority: \(self.priority)"
    }
}

class Category:List {

    override init(name: String) {
        super.init(name: name)
    }
    
}