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

<img width="324" alt="IMG_3122" src="https://user-images.githubusercontent.com/79163319/193666145-d903b22f-f92e-42be-8ac2-4838cedc61f9.PNG"> <img width="324" alt="IMG_3129" src="https://user-images.githubusercontent.com/79163319/193666151-387887f9-9522-4ce5-8627-0e2fb6e8b134.PNG"> <img width="324" alt="IMG_3133" src="https://user-images.githubusercontent.com/79163319/193666163-04a60a5d-9feb-48b9-8760-fe6058dc9756.PNG">


<img width="324" alt="IMG_3136" src="https://user-images.githubusercontent.com/79163319/193666922-1df557e5-b373-4b56-9ad1-67fc38248b43.PNG"> <img width="324" alt="IMG_3138" src="https://user-images.githubusercontent.com/79163319/193666931-069cadaa-543b-4386-af1f-735111ef4eb2.PNG"> <img width="324" alt="IMG_3142" src="https://user-images.githubusercontent.com/79163319/193666944-c488515b-65ca-4651-a266-84875b1c9116.PNG">


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
