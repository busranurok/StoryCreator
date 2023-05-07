//
//  ViewController.swift
//  Read Random Stories For Babies
//
//  Created by BusranurOK on 5.10.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var imageViewStoryImage: UIImageView!
    @IBOutlet weak var labelStoryName: UILabel!
    @IBOutlet weak var textViewStoryContent: UITextView!
    @IBOutlet weak var labelStoryAuthor: UILabel!
    
    var randomStory: Story?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Story Count: \(MyDumyDatabase.storyList.count)")
        
        self.navigationItem.title = "Home"
        self.navigationItem.prompt = "You can read a lot of histories for your baby."
        //self.navigationItem.largeTitleDisplayMode = .automatic
        
        // Büyük başlık yapıyoruz.
        //navigationController?.navigationBar.prefersLargeTitles = true
        // Bar item icon rengini değiştirdim.
        navigationController?.navigationBar.tintColor = UIColor.white
        
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
        // büyük başlıkta başlık rengini değiştirdim.
        //appearence2.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        changeColor(itemAppearance: appearance.stackedLayoutAppearance)
        changeColor(itemAppearance: appearance.inlineLayoutAppearance)
        changeColor(itemAppearance: appearance.compactInlineLayoutAppearance)
        
        // Oluşturduğumuzu tabbar' a aktarımını sağlıyoruz.
        tabBarController?.tabBar.standardAppearance = appearance
        tabBarController?.tabBar.scrollEdgeAppearance = appearance
        
        navigationController?.navigationBar.standardAppearance = appearence2
        navigationController?.navigationBar.compactAppearance = appearence2
        navigationController?.navigationBar.scrollEdgeAppearance = appearence2
        
        fillDumyDatabase()
        
        randomStory = MyDumyDatabase.storyList.randomElement()
        
        if let story = randomStory {
            
            imageViewStoryImage.image = story.storyImage
            labelStoryName.text = story.storyName
            labelStoryAuthor.text = story.storyAuthor
            textViewStoryContent.text = story.storyContent
            
        }
        
        labelStoryAuthor.textColor = UIColor.lightGray
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Açıklama satırı rengini değiştirdim
        //navigationController?.navigationBar.barStyle = .black
        
    }
    
    func changeColor(itemAppearance: UITabBarItemAppearance) {
        // Seçili durum
        itemAppearance.selected.iconColor = UIColor.green
        itemAppearance.selected.titleTextAttributes  = [.foregroundColor: UIColor.green]
        
        // Seçili olmayan durum
        itemAppearance.normal.iconColor = UIColor.white
        itemAppearance.normal.titleTextAttributes  = [.foregroundColor: UIColor.white]
        
    }
    
    
    @IBAction func refreshStory(_ sender: Any) {
        
        //print("Refresh Butonuna basıldı!")
        randomStory = MyDumyDatabase.storyList.randomElement()
        
        if let story = randomStory {
            
            imageViewStoryImage.image = story.storyImage
            labelStoryName.text = story.storyName
            labelStoryAuthor.text = story.storyAuthor
            textViewStoryContent.text = story.storyContent
            
        }
        
        print("Story Count: \(MyDumyDatabase.storyList.count)")
        
    }
    
    func fillDumyDatabase() {
        
        let story1 = Story()
        story1.storyId = 1
        story1.storyName = "Kırmızı Başlıklı Kız"
        story1.storyAuthor = "Charles Perrault"
        story1.storyContent = """
Bir zamanlar küçük ve tatlı bir kız vardı; kim görse ondan hoşlanırdı, özellikle de büyükannesi. Öyle ki, torununa ne vereceğini bilemezdi. Bir keresinde ona kırmızı kadifeden bir başlık hediye etti. Şapka kıza o kadar yakıştı ki, başından çıkarmaz oldu. Bu yüzden de herkes ona Kırmızı Başlıklı demeye başladı. Bir gün annesi ona, "Gel bakalım Kırmızı Başlıklı, şu kurabiyeyle şarabı büyükannene götür. Kadıncağız hasta ve halsiz; bu ona iyi gelecektir. Acele et ki, sıcak basmadan oraya varasın. Anayoldan ayrılma sakın, oraya buraya sapma. Yoksa şişeyi düşürüp kırarsın; büyükannen de şarapsız kalır. Eve girince günaydın demeyi unutma, her köşeye da bakmaya kalkışma" dedi.

"Merak etme" diyen küçük kız annesiyle vedalaştı.

Büyükannenin evi köyden yarım saat mesafedeki ormandaydı. Kırmızı Başlıklı ormana dalınca kurtla karşılaştı. Ama onun ne kötü bir hayvan olduğunu bilmediği için korkmadı.

Kurt: "İyi günler Kırmızı Başlıklı" dedi.

"Teşekkür ederim, kurt kardeş."

"Sabah sabah nereye gidiyorsun böyle?"

"Büyükanneme."

"Ne taşıyorsun önlüğünün altında?"

"Kurabiyeyle şarap. Kurabiyeyi dün yaptık; bu, hasta büyükanneme iyi gelir."

"Kırmızı Başlıklı, senin büyükannen nerede oturuyor?"

"Ormanda; on beş dakika daha gidersen üç tane kocaman meşe ağacı görürsün. Evi hemen onların önünde; etrafında da fındık ağaçları var."

Kurt: "Şu körpe kız tam dişine göre; eti, yaşlı büyükanneden daha lezzetli olmalı. Kurnaz davranırsan ikisini de ele geçirirsin" diye aklından geçirdi.

Bir süre beraber yürüdüler. Bir ara kurt, "Kırmızı Başlıklı, etraftaki şu güzel çiçeklere baksana! Kuşların nasıl cıvıldadığını da duymuyorsun galiba? Sanki okula yollanır gibi, almış başını gidiyorsun; oysa orman ne kadar hoş" dedi.

Kırmızı Başlıklı gözlerini şöyle bir açtı. Güneş ışınlarının güzel çiçekler arasında nasıl oynaştığını görünce, "Büyükanneme bir demet çiçek götürsem hoşuna gider. Henüz vakit erken; oraya zamanında varırım" diye düşündü. Ana yoldan çıkarak çiçek aramaya koyuldu. Birini kopardıktan sonra on dan daha güzel olabilecek İkincisini bulmaya çalışırken ormanın derinliklerine dalıverdi.

Bu arada kurt doğru büyükannenin evine gitti. Kapıyı çaldı.

"Kim o?"

"Benim; Kırmızı Başlıklı. Sana kurabiyeyle şarap getirdim, aç kapıyı."

"Mandalı bastır! Ben çok halsizim, kalkamıyorum" diye cevap verdi yaşlı kadın. Kurt mandalı bastırdı, kapı açıldı.

Hayvan hiçbir şey söylemeden doğru büyükannenin yatağına giderek zavallı kadını yutuverdi. Sonra onun giysilerini üstüne geçirerek başörtüsünü de başına taktı. Daha sonra da yatağa yatarak perdesini çekti.

Kırmızı Başlıklı da yeterince, hatta taşıyamayacağı kadar çok çiçek topladı. Derken büyükannesini hatırladı ve hemen yola koyuldu. Sokak kapısını açık bulunca şaşırdı, içeri girince bir tuhaflık hissetti. Kendi kendine: "Bana da ne oldu? Neden içime korku düştü ki? Oysa ben buraya hep seve seve gelirdim" diye söylendi. Ve "Günaydın" diye seslendi. Cevap alamadı. Yatağa yaklaşarak perdesini açtı.

Büyükanne orada yatmış, başörtüsünü de iyice yüzüne kapatmıştı, yani biraz tuhaf görünüyordu.

"Aaa, büyükanne, senin ne kadar büyük kulakların var!"

"Seni daha iyi duyayım diye."

"Aaa, büyükanne, senin ne kadar büyük gözlerin var!"

"Seni daha iyi görebileyim diye."

"Aaa, büyükanne, senin ne kadar kocaman ellerin var?"

"Seni daha iyi yakalayayım diye!"

"Ama büyükanne, ağzın ne kadar da büyük!"

"Seni daha iyi ısırayım diye!"

Ve kurt, bunu söyler söylemez zavallı kızcağızı yutuverdi.

Karnı iyice doyduktan sonra da yatağa yattı, uykuya dalarak horlamaya başladı. Bu arada evin önünden bir avcı geçmekteydi. "Yaşlı kadın nasıl da horluyor; git bir bak bakalım bir şeye ihtiyacı var mı?" diye aklından geçirdi. Eve girdi ve yatağa yaklaştığında kurdu gördü. "Seni burda buldum, namussuz! Çoktandır arıyordum" diye söylendi.

Tam silahını doğrultmuşken düşündü. Kurt büyükanneyi yutmuş olabilirdi!

O zaman henüz onu kurtarabilirdi. Ateş etmeyip eline bir makas aldı ve uyuyan kurdun karnını kesmeye başladı. Biraz kesince Kırmızı Başlıklı'nın başı göründü; derken ufak kız dışarı sıçrayıverdi. "Uüü-üff, ama korktum! Kurdun karnı çok karanlıkmış" dedi. Derken büyükanne de canlı olarak kurtarıldı; zor nefes almaktaydı.

Kırmızı Başlıklı hemen kocaman taşlar toplayıp onlarla kurdun karnını doldurdu. Kurt uyandığında yerinden fırlamak istedi, ama taşlar o kadar ağırdı ki, olduğu yere çöküverdi; ölmüştü!

Üçü de çok sevindi.

Avcı kurdun postunu yüzüp evine götürdü. Büyükanne Kırmızı Başlıklı'nın getirdiği kurabiyeleri yiyip şarabı içerek kendine geldi. Ama küçük kız kendi kendine:

"Bir daha ömrüm boyunca ana yoldan ayrılmam; annem haklıymış" diye söylendi.

Bu öyküyü başka türlü de anlatırlar: Bir gün Kırmızı Başlıklı yine büyükannesine kurabiye getirdiğinde bir başka kurt karşısına çıkarak onu ana yoldan uzaklaştırmak istedi.

Ama küçük kız buna kanmayarak yoluna devam etti ve büyükannesine, kurda nasıl rastladığını, onun kendisine nasıl "Merhaba" dediğini, ama bakışlarını hiç beğenmediğini anlattı.

"Yani ana yolda olmasaydık herhalde beni yerdi" diye ekledi

"Gel" dedi büyükanne, "Şu kapıyı kapayalım da içeri girmesin!"

Az sonra kurt kapıyı çalarak, "Aç kapıyı büyükanne, ben geldim! Kırmızı Başlıklı! Sana kurabiye getirdim" diye seslendi. Büyükanneyle torunu sustu, ama kapıyı açmadılar. Bunun üzerine kurt evin etrafında birkaç kez dönendikten sonra dama çıktı; Kırmızı Başlıklı'nın eve dönüşünü bekledi. Küçük kızın peşinden giderek onu karanlıkta yemek istiyordu. Ama büyükanne onun niyetini sezdi. Evin önünde büyük bir taş yalak vardı. Torununa dönerek, "Kovayı al, yavrum; dün sucuk kaynattığım suyu al ve yalağı onunla doldur" dedi. Kırmızı Başlıklı yalağı ağzına kadar doldurdu. Sucuk kokusu kurdun burnuna gelince hayvan damdan aşağı baktı. Boynunu o kadar sarkıttı ki, birden dengesini kaybederek taş yalağın içine düştü ve boğuldu. Kırmızı Başlıklı da evine keyifle döndü ve kurda artık acımadı.
"""
        story1.storyImage = UIImage(named: "mutlu_resim")
        
        let story2 = Story()
        story2.storyId = 2
        story2.storyName = "Küçük Kara Balık"
        story2.storyAuthor = "Samad Behrangi"
        story2.storyContent = """
        Hikaye balık ninenin yüzlerce yavruya masal anlatması ile başlıyor. Bir zamanlar bir kayanın altın annesi ile birlikte küçük bir kara balık varmış. Bu balık yaşadığı yerden çok sıkılmış ve yeni yerler görmek istiyormuş. Annesi her seferinde ona başka bir yer olmadığını söylüyormuş balık bunu dillendirdikçe etraftan duyanlar olmuş ve onu dışlamaya başlamışlar. Bir gün balık annesini de geride bırakarak yaşadıkları gölden ayrılmış. Biraz yüzdükten sonra. Bir derenin akıntısına karışarak uzaklara yol almış. Bir yere gelir orada kurbağa yavrularını görür ancak ilk defa farkı bir canlı gören kurbağalar ondan korkar ve onu istemezler az ötede bir kertenkele görür ve onunla konuşmaya başlar. Kertenkele onun farklı biri akıllı olduğun anlar ve ana pelikanın torbasına düşerse ne nasıl eğer ölmemesi için torbayı delecek bir kama verir. Küçük Kara Balık etrafı gördükçe merakı düşünceleri dahada artar, gördüklerini sorgulamaya fikirler üretmeye başlar.
        
        Biraz daha ilerledikten sonra bir balık sürüsü görür. Onlarla ırmağa gitmek istediğini söyler. Ancak tüm balıklar ırmaktan bulunan pelikandan korkmaktadır. Bazıları ile konuştuktan sonra bir kaçı ile yola koyulur. Biraz ilerledikten sonra pelikanın torbasına düşer küçük kara balık ve yanındaki balıklar, tüm balıklar onu suçlar ve pelikandan onları bırakması için yalvarırlar. Pelikan ise onlara alaycı kara balığı öldürürlerse onları serbest bırakacağını söyler. Küçük kara balık ölü numarası yapar ve kertenkelenin ona verdiği kama ile pelikanın torbasını deler ve oradan kaçar.

        Pelikanın torbasından denize düşer ve orada büyük balık topluluğu ile karşılaşır, tüm hayalleri olmuştur meraklarını gidermiştir ancak bir kara batak onu yakalayıp yavrularına yem etmek için hızlıca karaya götürmektedir. Kara batakla ne kadar konuşsa da onu ikna edemez kaçmayı da dener ama başaramaz ve kara batak onu midesine indirir. Orada minik bir yavru balık görür. Ağlayan ve korkan yavru balığın kaçmasına yardım eder ancak kendisi midede kalır son çare elindeki kama ile kara batağı öldürür ancak o günden bu güne kimse bir daha küçük kara balıktan haber alamaz.
"""
        story2.storyImage = UIImage(named: "mutlu_resim")
        
        let story3 = Story()
        story3.storyId = 3
        story3.storyName = "Pinokyo"
        story3.storyAuthor = "Carlo Collodi"
        story3.storyContent = """
 Pinokyo babası sandığı onu tahtalardan yaratan Marangoz Gepettonun yaptığı bir kukladır. . Pinokyonun tek diğeli gerçek bir erkek çocuğu olmaktır, pinokyo sevgi dolu yuvasından ayrılarak dünyayı tanımak için bir yolcuğa çıkar. . Pinokyo tek başına dolaşmaya başlar akşam oluca bir oda bulur girer orda cırcır böceğine raslar cırcır böceği nasihat verir başı boş gezme yoksa mahvolursun der pinokyo bunu dilemez “cırcır edip durma ” der, zaten buradalarda durmazsam beni okula gönderirler en sediğim şey başı boş gezmek, yemek içmek, eğlenmek der. . sonra cırcır böceği ;

– Böylelerinin sonu ya pis sokaklar ya da hapishane. der . . bunun üzerine pinokyada,

– Akla ihtiyacım yok. Sinirlenirsem sana bir kötülük yaparım. Çeneni kapa da git buradan!…

der . . cırcır böceği ppinokyonun haline çok üzülür ve senin sonun çok kötü der. .

pinokyo çok sinirlenir ve çekici alıp cırcır böceğini öldürür. Aç kalır eve gider yorgunluktan ateşin başında uyuya kalır ve sonra birde bakar ayakları yanmış … Babası kapıyı çalar. . Kapıyı açamaz ayaklarımı yediler der. . Babası gepetto insanmaz tabiki ve kızar ancak kapıyı açına gerçekten ayaklarının yandığını anlar. . Onun ayaklarını tekrar yapması için pinokyadan birdaha evden kaçmayacağına dair söz alır. . Pinokya Okula gitmek üzere iken kukla gösterisi görür ve cebindeki tek parasınıda oraya verir okula gitmez gösteriye gider. orda gösteriye katılır kuklacı başı ona acır ve 5 altın verir Pinokya babasına gidip onu mutlu edecektir ancak kurnaz tilki ve kör kedi ile karşılaşır. . Onlar pinokyaya 5 altını 5000 altın yapabileceklerini söyler ve oda inanır onlarla birlikte gider bu sırada hayalinde cırcır böceğini görür cırcır böceği yine ona nasihat verir ama pinokyo dinlemez git eve götür der paraları sakın onlara inanma der. . Tilki ve kedi onu sıkıştırıp üzerine atlarlar ama pinokyo onlardan kurtulmayı başarır. . sonra ormanda bir peri onu görür pinokyonun bağlı olan ellerini çözer…Peri ona yardım eder ellerini çözer yemek verir ama yalan söyler parası olmadığını söyler ve ordan gider ancak tilki ve kedi yine onu yakalar ve altınlarını bu sefer çalarlar. . Pinokya, dönüp de kandırıldığını anlayınca, ağlaya ağlaya en yakın köye varıp, savcıya şikayet eder. “Enayiler Diyari’nm kanunları gereğince onu bir de hapse attılar. Üç ay sonra çıkar. Pinokya geceyi geçirmek için bir kümese gerer kümesin sahibi tavuklarını çalan hırsızın o olduğunu zanneder ve ellerini kolunu bağlar. . Birkaç fare gelip İplerini kemİrdİ ve Pinokyo kurtuldu. Hemen ormana doğru yol aldı. Orman Perısi’nin evine geldiğinde kocaman beyaz bir kaya gördü. Oturup ağlamaya başladı. Orman Perisi de ona, hiç söz dinlemediği için başına hep belalar geldiğini, hiç olmazsa bundan sonra söz din­lemesi gerektiğini söyledi. Pİnokyo da söz verdi. Orman Perisi Pinokyo’nun annesi oldu ve onu okula yazdır­dı. Pinokyo, artık akıllı bir öğrenci olmuştu. Bir gün okula gidip gelirken, Pinokyo’ya artık insan olacağı müjdesini verdi. Bunun için güzel bir ziyafet töreni de yapacaktı. pinokyo arkadaşlarını davet edecekken bir arkadaşının kandırması ile oyuncaklar ülkesine gitti. “Oyuncaklar Ülkesi”nde aylarca tembel tembel gezen Pinokyo, bir gün kulaklarının uzadığım gördü. Utancından, kimseye görünmeden ortadan kayboldu ve ormana geldi. Ormanda karşılaştığı bir sincap, Pinokyo’nun “Eşek hastalığı”na yakalandığını anlattı. “Oyuna dalıp, haylazlık eden ve verdiği sözü tutmayan çocukların başına gelir. ” dedi. Pinokyo, öyle pişman olmuştu ki. ormanda onu gören bir çoban onu diğer eşşek ve sıpaşarının arasına yolladı ordanda sirke girdi, sirkte çok başarılıydı en güzel hareketleri o yapıyordu ancak ayağı kırıldı ve onu sirtkten attılar sonrada bir davulcu onu derisini yüzüp davul yaptı Pinokyo’yu denizin kenarına getiren davulcu, Pinpkyo’nun boynuna bir taş bağlayıp onu denize attı. Pinokyo denizden yüzerek kurtuldu ormanda tikli ve kediiy gördü ama bu sefer onlara inanmadı . Sonra cırcır böceğinin evine geldi cırcır böceği onu eve kabul etti ve nasihatler verdi. . Pinokya artık akıllanmıştı çok çalışıyor ve (bilgi yelpazesi. com) para biriktiriyordu bir gün orman perisinin çok hasta olduğunu öğrendi hemen cebindeki tüm parayı ona gönderdi ve rüyasında orman perisinin ona “aferin” dediğini duydu kalktığında artık insandı ve ceplerinde altınlar vardı sevinçle babasının yanına gitti Babası da ona:

“Yaramaz çocukların yerini uslu çocuklar aldıkça her şey güzelle­şir, bütün olumsuzluklar da ortadan kalkar. ” dedi. Ve mutlu bir şekilde yaşamaya devam ettiler.

Kitabın Ana Düşüncesi: Öncelikle büyüklerimizin nasihatlerini çok iyi dinleyecek, verdiğimiz sözleri dinleyecek, büyüklerimize saygı gösterecek tembellikten, açgözlülükten uzak durum derslerimize çalışacağız. .

Kitabın Kahramanları:

pinokyo : Yaramaz, haylaz, çalışmayan, tembel bir kukladır.

Geppetto : Pinokyonun babası, Pinokyo sürekli onu üzer ve kaçar sürekli ona yalan söyler.

Orman perisi : iyi kalpli peri pinokyaya yardım eder.

Cırcır böceği : Pinokyoya çok yardım eder aslında ancak pinokyo dik kafalılık eder bunu anlamaz. .

Tilki ve kör kedi : Yalancı, düzenbaz, hile yapıp pinokyoyu sürekli kandırırlar. .
"""
        story3.storyImage = UIImage(named: "mutlu_resim")
        
        MyDumyDatabase.storyList.append(story1)
        MyDumyDatabase.storyList.append(story2)
        MyDumyDatabase.storyList.append(story3)
        
        print("Story Count: \(MyDumyDatabase.storyList.count)")
        
    }
    
}

