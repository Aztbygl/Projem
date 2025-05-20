import 'package:flutter/material.dart'; // Flutter UI bileşenlerini kullanmak için gerekli paket

void main() {
  runApp(const TelegramUI()); // Uygulamayı başlatır ve TelegramUI widget’ını çalıştırır
}

// Ana uygulama widget’ı
class TelegramUI extends StatelessWidget {
  const TelegramUI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatListScreen(), // Uygulamanın ilk açılan sayfası: Ana ekran (sohbet listesi)
      debugShowCheckedModeBanner: false, // Sağ üstteki "Debug" yazısını gizler
    );
  }
}

// Ana ekran: sohbet listesi
class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Telegram"), // Uygulama başlığı
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.search), // Sağ üstte arama ikonu
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.menu), // Sağ üstte menü ikonu
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10), // Üstten biraz boşluk
          // İlk sohbet kutusu (tıkladığında mesaj ekranına geçiyor)
          InkWell(
            onTap: () {
              // Mesaj ekranına geçiş
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChatScreen()),
              );
            },
            child: _buildChatTile("Azat Beyoğlu", "Selam kardeşim", "12:45"),
          ),
          // Diğer sabit sohbet kutuları
          _buildChatTile("Hasan Balcı", "Yarın görüşürüz.", "10:12"),
          _buildChatTile("Yasin Beyoğlu", "Tamamdır oğlum. ", "08:30"),
          _buildChatTile("Cihat Taşar", "Kardeşim Nasılsın?", "Dün"),
        ],
      ),
      // Alt gezinme çubuğu (kişiler, aramalar, sohbetler, ayarlar)
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue, // Seçilen ikonun rengi
        unselectedItemColor: Colors.grey, // Seçilmemiş ikonların rengi
        type: BottomNavigationBarType.fixed, // Tüm ikonları sabit göster
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // Kişiler sekmesi
            label: 'Kişiler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call), // Aramalar sekmesi
            label: 'Aramalar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat), // Sohbetler sekmesi
            label: 'Sohbetler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings), // Ayarlar sekmesi
            label: 'Ayarlar',
          ),
        ],
      ),
    );
  }

  // Her bir sohbet kutusunu oluşturan özel widget fonksiyonu
  Widget _buildChatTile(String name, String message, String time) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15), // Yatay iç boşluk
      margin: EdgeInsets.symmetric(vertical: 5), // Üst-alt dış boşluk
      height: 70, // Kutu yüksekliği
      color: const Color.fromARGB(255, 240, 240, 240), // Arka plan rengi
      child: Row(
        children: [
          CircleAvatar(
            radius: 25, // Profil simgesi çapı
            backgroundColor: Colors.blueGrey, // Arka plan rengi
            child: Icon(Icons.person, color: Colors.white), // Profil ikonu
          ),
          SizedBox(width: 15), // Profil ile metin arasında boşluk
          Expanded(
            // Metin kısmını olabildiğince genişlet
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Dikeyde ortala
              crossAxisAlignment: CrossAxisAlignment.start, // Sola hizala
              children: [
                Text(name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)), // İsim
                Text(message, style: TextStyle(color: Colors.grey[700])), // Son mesaj
              ],
            ),
          ),
          Text(time, style: TextStyle(color: Colors.grey)), // Saat
        ],
      ),
    );
  }
}

// Mesaj ekranı
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Azat Beyoğlu"), // Üst kısımda kişinin ismi
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.topLeft, // Mesajı üstte sola hizala
              padding: EdgeInsets.all(20), // İç boşluk
              child: Text(
                "Mesaj Ekranı", // Basit örnek mesaj
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          // Alt kısım: mesaj yazma alanı
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10), // Yatay boşluk
            color: Colors.grey[200], // Arka plan rengi
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Mesaj yaz...", // Giriş kutusu
                      border: InputBorder.none, // Kenarlık yok
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.blue), // Gönderme ikonu
                  onPressed: () {}, // Şimdilik işlevsiz butona başka bir şey atanabilir
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
