import Foundation

MyApp.mainMenu()

class MyApp {
    static var lists = [List]()
    static var categories = [String:Category]()

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
                categoryMenu()
            case "4":
                return
            default:
                break
            }
        }           
    }

    static func listMenu(list: List) {
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
            "5. Add item to category\n" +
            "6. back")
            let command = readLine()!
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
                print("\n1. Sort by date ascending\n" +
                "2. Sort by date descending\n" +
                "3. Sort by title ascending\n" +
                "4. Sort by title descending\n" +
                "5. Sort by priority ascending\n" +
                "6. Sort by priority descending")
                let command = readLine()!
                switch command {
                case "1":
                    list.items.sort {$0.dateCreated < $1.dateCreated}
                case "2":
                    list.items.sort {$0.dateCreated > $1.dateCreated}
                case "3":
                    list.items.sort {$0.title < $1.title}
                case "4":
                    list.items.sort {$0.title > $1.title}
                case "5":
                    list.items.sort {$0.priority < $1.priority}
                case "6":
                    list.items.sort {$0.priority > $1.priority}
                default:
                    break
                }
            case "5":
                print("\nSelect an item:")
                let item = list.items[Int(readLine()!)!]
                print("\nSelect a category:")
                for category in categories.keys {
                    print(category)
                }
                print()
                let category = categories[readLine()!]!
                category.items.append(item)
                print("done")
            case "6":
                return
            default:
                break
            }
        }
    }

    static func categoryMenu() {
        while true {
            print("\nCategories:\n")
            for category in categories.keys {
                print(category)
            }
            print("\n1. Create new category\n" +
            "2. See a category\n" +
            "3. back")
            let command = readLine()!
            switch command {
            case "1":
                print("\nEnter name of the new category")
                let name = readLine()!
                categories[name] = Category(name: name)
                print("done")
            case "2":
                print("\nSelect a category:")
                let category = categories[readLine()!]!
                print("items:")
                for (index, item) in category.items.enumerated() {
                    print("\nitem No. : \(index)\n\(item)")
                }
            case "3":
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
    let dateCreated: Date
    
    init(title: String, content: String, priority: Int) {
        self.title = title
        self.content = content
        self.priority = priority
        self.dateCreated = Date()
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