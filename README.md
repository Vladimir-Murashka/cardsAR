# cardsAR 📱

## Это достаточно простое приложение, которое позволяет познакомиться с технологией дополненной реальности.

### Структура

Приложение содержит два ViewController:

   - MenuViewController
   - MainViewController

### MenuViewController

Содержит фоновою картинку и кнопку "Начать", по нажатию на нее и начинается вся магия. При первом запуске приложение запросит разрешение на использование камеры устройства.

<img width="324" alt="IMG_8067" src="https://user-images.githubusercontent.com/79163319/193661617-811c1b64-c150-46c2-9d86-9c00ede3cd04.PNG">

### MainViewController

На данному экране приложение анализирует изображение полученное с камеры устройства, если в прямой обзор камеры попадет картинка из ARResourcesGroup возле этой картинки появятся заготовленные объекты, в нашем случае описание и флаг. 

<img width="324" alt="IMG_3136" src="https://user-images.githubusercontent.com/79163319/193666922-1df557e5-b373-4b56-9ad1-67fc38248b43.PNG"> <img width="324" alt="IMG_3142" src="https://user-images.githubusercontent.com/79163319/193666944-c488515b-65ca-4651-a266-84875b1c9116.PNG">


https://user-images.githubusercontent.com/79163319/193672288-3725ea33-8d69-4648-bf7f-148bb850f2fd.mp4

Для полноценного использования приложения вам понадобятся картинки ниже:

<img width="324" alt="scientists.pdf" src="https://github.com/Vladimir-Murashka/cardsAR/files/9700693/scientists.pdf">


### Что использовалось?
1. MVP pattern
2. ARKit
3. SceneKit
4. UIKit
5. JSON
6. Application lifecycle
