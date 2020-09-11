CREATE TABLE Должности
(
  Наименование_должности VARCHAR NOT NULL,
  Оклад INT NOT NULL,
  Обязанности VARCHAR NOT NULL,
  Требования VARCHAR NOT NULL,
  Код_должности INT NOT NULL,
  PRIMARY KEY (Код_должности)
);

CREATE TABLE Звания
(
  Наименование VARCHAR NOT NULL,
  Надбавка INT NOT NULL,
  Обязанности VARCHAR NOT NULL,
  Требования VARCHAR NOT NULL,
  Код_звания INT NOT NULL,
  PRIMARY KEY (Код_звания)
);

CREATE TABLE Марки_Автомобилей
(
  Фирма_производитель VARCHAR NOT NULL,
  Страна_производитель VARCHAR NOT NULL,
  Наименование VARCHAR NOT NULL,
  Дата_окончания_производства DATE NOT NULL,
  Характеристики VARCHAR NOT NULL,
  Категория VARCHAR NOT NULL,
  Описание VARCHAR NOT NULL,
  Дата_начала_производства DATE NOT NULL,
  Код_марки INT NOT NULL,
  PRIMARY KEY (Код_марки)
);

CREATE TABLE Сотрудники
(
  Код_сотрудника INT NOT NULL,
  ФИО VARCHAR NOT NULL,
  Возраст INT NOT NULL,
  Пол CHAR NOT NULL,
  Адрес VARCHAR NOT NULL,
  Телефон INT NOT NULL,
  Паспортные_данные VARCHAR NOT NULL,
  Код_должности INT NOT NULL,
  Код_звания INT NOT NULL,
  PRIMARY KEY (Код_сотрудника),
  FOREIGN KEY (Код_должности) REFERENCES Должности(Код_должности),
  FOREIGN KEY (Код_звания) REFERENCES Звания(Код_звания)
);

CREATE TABLE Водители
(
  Код_водителя INT NOT NULL,
  ФИО VARCHAR NOT NULL,
  Дата_рождения DATE NOT NULL,
  Адрес VARCHAR NOT NULL,
  Паспортные_данные VARCHAR NOT NULL,
  Номер_водительского_удостоверения INT NOT NULL,
  Дата_выдачи_удостоверения DATE NOT NULL,
  Дата_окончания_удостоверения DATE NOT NULL,
  Категория_удостоверения VARCHAR NOT NULL,
  Описание VARCHAR NOT NULL,
  Код_сотрудника INT,
  PRIMARY KEY (Код_водителя),
  FOREIGN KEY (Код_сотрудника) REFERENCES Сотрудники(Код_сотрудника)
);

CREATE TABLE Автомобили
(
  Регистрационный_номер INT NOT NULL,
  Номер_кузова INT NOT NULL,
  Номер_двигателя INT NOT NULL,
  Номер_техпаспорта INT NOT NULL,
  Дата_выпуска DATE NOT NULL,
  Дата_регистрации DATE NOT NULL,
  Цвет VARCHAR NOT NULL,
  Технический_осмотр VARCHAR NOT NULL,
  Дата_технического_осмотра DATE NOT NULL,
  Описание VARCHAR NOT NULL,
  Код_автомобиля INT NOT NULL,
  Код_марки INT NOT NULL,
  Код_сотрудника INT,
  Код_водителя INT,
  PRIMARY KEY (Код_автомобиля),
  FOREIGN KEY (Код_марки) REFERENCES Марки_Автомобилей(Код_марки),
  FOREIGN KEY (Код_сотрудника) REFERENCES Сотрудники(Код_сотрудника),
  FOREIGN KEY (Код_водителя) REFERENCES Водители(Код_водителя)
);

CREATE TABLE Автомобили_в_угоне
(
  Дата_угона DATE NOT NULL,
  Дата_обращения DATE NOT NULL,
  Обстоятельства_угона VARCHAR NOT NULL,
  Отметка_об_нахождении VARCHAR NOT NULL,
  Дата_нахождения DATE NOT NULL,
  Код_сотрудника INT,
  Код_автомобиля INT NOT NULL,
  Код_водителя INT,
  FOREIGN KEY (Код_сотрудника) REFERENCES Сотрудники(Код_сотрудника),
  FOREIGN KEY (Код_автомобиля) REFERENCES Автомобили(Код_автомобиля),
  FOREIGN KEY (Код_водителя) REFERENCES Водители(Код_водителя)
);