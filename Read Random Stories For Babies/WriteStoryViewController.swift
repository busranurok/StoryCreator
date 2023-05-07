//
//  WriteHistoryViewController.swift
//  Read Random Stories For Babies
//
//  Created by BusranurOK on 5.10.2022.
//

import UIKit

class WriteStoryViewController: UIViewController {

    @IBOutlet weak var textfieldImageUrl: UITextField!
    @IBOutlet weak var textfieldStoryTitle: UITextField!
    @IBOutlet weak var textfieldStoryAuthor: UITextField!
    @IBOutlet weak var textViewWriteStory: UITextView!
    var yourWriteStoryImageLink : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Story Count: \(MyDumyDatabase.storyList.count)")
        
        self.navigationItem.title = "Write Story"
        self.navigationItem.prompt = "You can write a lot of histories for your baby."
        
        // Renk paletindeki renklere daha yakın olması adına bu işlemi gerçekleştiriyoruz.
        navigationController?.navigationBar.isTranslucent = true
        // Açıklama satırı rengini değiştirdim
        navigationController?.navigationBar.barStyle = .black
        
        // Arkaplana renk verecek kısım
        // Farklı ekran boyutlarında düzgün bir şekilde çalışması için gereklidir.
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .systemBlue
        
        let appearence2 = UINavigationBarAppearance()
        appearence2.backgroundColor = .systemBlue
        // Küçük başlıkta başlık rengini değiştirdim.
        appearence2.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        changeColor(itemAppearance: appearance.stackedLayoutAppearance)
        changeColor(itemAppearance: appearance.inlineLayoutAppearance)
        changeColor(itemAppearance: appearance.compactInlineLayoutAppearance)
        
        // Oluşturduğumuzu tabbar' a aktarımını sağlıyoruz.
        tabBarController?.tabBar.standardAppearance = appearance
        tabBarController?.tabBar.scrollEdgeAppearance = appearance
        
        navigationController?.navigationBar.standardAppearance = appearence2
        navigationController?.navigationBar.compactAppearance = appearence2
        navigationController?.navigationBar.scrollEdgeAppearance = appearence2

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Açıklama satırı rengini değiştirdim
        //navigationController?.navigationBar.barStyle = .black
        
    }
    
    @IBAction func saveStory(_ sender: Any) {
        
        let url = URL(string: textfieldImageUrl.text!)
            
        if let data = try? Data(contentsOf: url!) {
            
            yourWriteStoryImageLink = UIImage(data: data)!
            
        }
        
        guard let yourWriteStoryName = textfieldStoryTitle.text else {
            
            //throws WriteStoryError.EmptyTextView
            print("TexfieldName nil!")
            return
            
        }
        
        guard let yourWriteStoryAuthor = textfieldStoryAuthor.text else {
            
            //throws WriteStoryError.EmptyTextView
            print("TexfieldAuthor nil!")
            return
            
        }
        
        guard let yourWriteStory = textViewWriteStory.text else {
            
            //throws WriteStoryError.EmptyTextView
            print("TextView nil!")
            return
            
        }
        
        let id = 3
        
        let yourStory = Story()
        yourStory.storyId = id + 1
        print("Hikaye id: \(id)")
        yourStory.storyImage = yourWriteStoryImageLink
        yourStory.storyName = yourWriteStoryName
        yourStory.storyAuthor = yourWriteStoryAuthor
        yourStory.storyContent = yourWriteStory
        
        MyDumyDatabase.storyList.append(yourStory)
        
        //print("Story Count: \(MyDumyDatabase.storyList.count)")
        
        let alertController = UIAlertController.init(title: "", message: "Kaydetme işleminiz başarıyla gerçekleşmiştir.", preferredStyle: .alert)
        
        let okAction = UIAlertAction.init(title: "Tamam", style: .default) { action in
            
            self.textfieldImageUrl.text = ""
            self.textfieldStoryTitle.text = ""
            self.textfieldStoryAuthor.text = ""
            self.textViewWriteStory.text = ""
            
        }
        
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    func changeColor(itemAppearance: UITabBarItemAppearance) {
        // Seçili durum
        itemAppearance.selected.iconColor = UIColor.green
        itemAppearance.selected.titleTextAttributes  = [.foregroundColor: UIColor.green]
        
        // Seçili olmayan durum
        itemAppearance.normal.iconColor = UIColor.white
        itemAppearance.normal.titleTextAttributes  = [.foregroundColor: UIColor.white]
        
    }
}
