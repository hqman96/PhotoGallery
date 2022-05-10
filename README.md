# PhotoGallery
Для доступа к Unsplash API необходим Ваш индивидуальный ключ доступа. 
В приложении мой ключ доступа зашифрован.


Что нужно сделать, чтобы приложение заработало:

1 способ:

1. Создать в Xcode .plist файл c именем "Key.plist".
2. Открыть файл в XCode и создать добавить новую строку.
3. В ячейке столбца Key написать "clientID", в ячейке столбца Value ввести "Client-ID "Ваш ключ"".

2 способ:

В файле  NetworkService.swift изменить 34 строку с headers["Authorization"] = clientKey на headers["Authorization"] = "Client-ID "Ваш ключ"".
