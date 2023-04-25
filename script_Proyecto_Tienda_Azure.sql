CREATE TABLE Artista(
	IdArtista int NOT NULL,
	Nombre nvarchar(50) NULL,
	Apellidos varchar(50) NULL,
	Nick nvarchar(50) NULL,
	Descripcion nvarchar(700) NULL,
	Email nvarchar(100) NULL,
	Password varbinary(max) NULL,
	Salt nvarchar(50) NULL,
	Imagen nvarchar(400) NULL,
 CONSTRAINT PK_Artista PRIMARY KEY CLUSTERED 
(
	IdArtista ASC
))
GO
/****** Object:  Table Info_Arte    Script Date: 27/03/2023 1:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE Info_Arte(
	IdInfoArte int NOT NULL,
	Titulo nvarchar(50) NULL,
	Precio int NULL,
	Descripcion nvarchar(700) NULL,
	Imagen nvarchar(700) NULL,
	IdArtista int NULL,
 CONSTRAINT PK_Info_Arte PRIMARY KEY CLUSTERED 
(
	IdInfoArte ASC
))

GO
/****** Object:  View INFO_PRODUCTOS    Script Date: 27/03/2023 1:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW INFO_PRODUCTOS
AS
	SELECT TOP 100 PERCENT 
	IA.IdInfoArte, IA.Titulo, IA.Precio, IA.Imagen, IA.Descripcion, A.IdArtista, A.Nick
	FROM Info_Arte IA
	INNER JOIN Artista A
	ON IA.IdArtista = A.IdArtista
	order by IA.IdInfoArte desc
GO
/****** Object:  Table Chat    Script Date: 27/03/2023 1:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE Chat(
	IdChat int NOT NULL,
	Mensajes nvarchar(500) NULL,
	IdReceptor int NULL,
	IdSubscriptor int NULL,
	Fecha_Hora date NULL,
	IdArtista int NULL,
	IdCliente int NULL,
 CONSTRAINT PK_Chat PRIMARY KEY CLUSTERED 
(
	IdChat ASC
))

GO
/****** Object:  Table Cliente    Script Date: 27/03/2023 1:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE Cliente(
	IdCliente int NOT NULL,
	Nombre nvarchar(50) NULL,
	Apellidos nvarchar(50) NULL,
	Email nvarchar(100) NULL,
	Password varbinary(max) NULL,
	Salt nvarchar(50) NULL,
	Imagen nvarchar(400) NULL,
 CONSTRAINT PK_Cliente PRIMARY KEY CLUSTERED 
(
	IdCliente ASC
))
GO
/****** Object:  Table Transaccion    Script Date: 27/03/2023 1:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE Transaccion(
	IdTransaccion int NOT NULL,
	Fecha_Transaccion date NULL,
	Precio_Compra int NULL,
	Precio_Venta int NULL,
	IdCliente int NULL,
	IdInfoArte int NULL,
 CONSTRAINT PK_Transaccion PRIMARY KEY CLUSTERED 
(
	IdTransaccion ASC
))

GO
/****** Object:  Table Valoraciones    Script Date: 27/03/2023 1:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE Valoraciones(
	IdValoraciones int NOT NULL,
	Puntuacion int NULL,
	IdCliente int NULL,
	IdArtista int NULL,
 CONSTRAINT PK_Valoraciones PRIMARY KEY CLUSTERED 
(
	IdValoraciones ASC
))

GO
INSERT Artista (IdArtista, Nombre, Apellidos, Nick, Descripcion, Email, Password, Salt, Imagen) VALUES (1, N'Gabriel', N'Picolo', N'_picolo', N'Artista
• 🇧🇷 brazilian comic artist                                        ', N'gabrielpicolo@gmail.com', 0x50B1D90D55521EA0AF05DF86FA383048F6284DB38F7CB42FC5AEB710CE59E5CB02D6B4105ED9B2C354670EBC51F2C5F9B78309F286121D72C5A6CE2C05C02168, N'ô-ú{¹w÷´e÷4Ã.ÐºRr¼FÕò¢T1uì!²I$©y_Lpf?âå{ÕÀ', N'https://pbs.twimg.com/profile_images/1148295233727270913/vM-65pZl_400x400.jpg')
INSERT Artista (IdArtista, Nombre, Apellidos, Nick, Descripcion, Email, Password, Salt, Imagen) VALUES (2, N'Laia', N'Lopez', N'itslopez', N'Artista
Barcelona, Spain
• illustration, ch.design
• inquiries: 📩 itslopezillustrations@gmail.com
• Rep’d by Britt Siess Creative Management                                        ', N'itslopezillustrations@gmail.com', 0xDAAB374DEA6A7C642D6BF9AB5CBA75C2AD3955BD7EDF4F1B75C53AFDB3A9123969AE3E47385B124FD659D0A1555EAC8492361717B879398D25777714EF990B1E, N'îào={''Sü;<ÎEðí@£\È½R³Nô	Û©ÎhÕ#U¡þÑ77g½
H', N'https://pbs.twimg.com/profile_images/1547332823819976707/zsMtNYlo_400x400.jpg')
INSERT Artista (IdArtista, Nombre, Apellidos, Nick, Descripcion, Email, Password, Salt, Imagen) VALUES (3, N'Zune', NULL, N'creandoinfinito', N'Artista
☮La actitud es contagiosa☮                                        ', N'creandoinfinito@gmail.com', 0xE096F767A56D83DB4405139D8C8DBEAD3E6B889723B95A88A95096D833D56327A6EC7EF585E5CA9A6F07877BB1A8660C4D05F34D06A11D7237950B87FEECC816, N'×ú0ë5`#í1ò³J¸åÅ~&Ç½Ö¨}Ý@ëº¯¯ ¶É)R', N'https://cdn.ko-fi.com/cdn/useruploads/3c575e98-d5e6-4b80-9780-37b0937309dc.png')
INSERT Artista (IdArtista, Nombre, Apellidos, Nick, Descripcion, Email, Password, Salt, Imagen) VALUES (4, N'Neidra', N'Golden', N'art.neidra_', N'Artista
🇪🇸🇵🇭 | TikTok: art.neidra_ | Twitter: artneidra |
✨comms: CLOSED✨ | 🏮prints on the link bellow🏮', N'artneidra@gmail.com', 0x3D73B019711F4A37C4BC23E19D3AA84189AF268A266D1C498663D3DF9BA7458D11AB97DD6D18BD79EC72C12A03913F75C9C8CB86F14485F35530B2A2C1D34941, N'	ãZé^jô¸ý²,^QJÅú²,¸2A¦zsVÂãÍ¬¿à@UÔ', N'https://ih0.redbubble.net/avatar.4212064.140x140.jpg')
INSERT Artista (IdArtista, Nombre, Apellidos, Nick, Descripcion, Email, Password, Salt, Imagen) VALUES (5, N'Uxue', N'Saenz', N'uxartea', N'Artista
23 |📍Basque Country / Valencia
🌸 Toneless brushstrokes | Commissions closed                                        ', N'uxartea@gmail.com', 0x4E9B4ED53A8C3911271B250FDCBC9B1932AF3F67D27247A64005317301ADE3BF0988B83D8BAB7A7066EEE0274651512542194392A5DAF2C2A8232FE650C01DEA, N'¢µv''>-MvR~ÚoÁººÒ°/&ZÄMûE;/Ðá|Êcp|ë/Ê', N'https://d1fdloi71mui9q.cloudfront.net/PqkhmZ4eQdwMePkwH8p6_Sy83ZJMD802P88Yy')
INSERT Artista (IdArtista, Nombre, Apellidos, Nick, Descripcion, Email, Password, Salt, Imagen) VALUES (6, N'Juan', N'Acosta', N'juan_acosta_ilustrador', N'Artista
juancristobalacosta@hotmail.con
Link to Portfolio, Artstation & Twitter ⬇️                                        ', N'juancristobalacosta@hotmail.con', 0xB58595B32B89903BB980B45C42353E99FD39961074C2ECEE8F63411B11DF91EFD02ADFF531CF84F8FEB7C8EAC72DC754A930941A287A9D838DE28476954F0548, N'cù©ô''+E,n¥_	ðT¯A(ÙQV¨zo×lCÔëSÞ²Ï9°', N'https://d1fdloi71mui9q.cloudfront.net/bd1HDSsnRuKHRJ28Eim3_2gcvKaj30a8JrRhh')
INSERT Artista (IdArtista, Nombre, Apellidos, Nick, Descripcion, Email, Password, Salt, Imagen) VALUES (7, N'David', N'Astruga', N'davidastruga', N'Fantasy Illustrator - Magic the Gathering - Pathfinder
davastart@gmail.com
#illustrator #conceptartist & #comicartist                                        ', N'davastart@gmail.com', 0x4825D53C4F551D49E9E37AF946F8EA25ADFAF69E84553CDBC4383141DF71AA96F3B19E7FC3D1557D983B020E38297445B3072C8B6866709B3FC18FBA6384343B, N'á@jëm¾ÂÎWE>MôÎÉ0&Éáv<K6ñLÒ,+wâ²A`*¹
<9$Èø)a', N'https://cdna.artstation.com/p/users/avatars/000/115/198/large/bf93f318e9341504e910ec0d234dbdee.jpg?1579002042')
GO
INSERT Cliente (IdCliente, Nombre, Apellidos, Email, Password, Salt, Imagen) VALUES (1, N'Ejemplo', N'Prueba Prueba', N'ejemploprueba@gmail.com', 0x391AAC97930CF1D81DA00F4F1F3FE08E80B23278990B9880F0507003021A6AF50A5B19D7B2AA3E9605DC70BF416061142DDCBE5E8ADE1EEBCE3F2207BDBFFA56, N'rJ*ÎFDøÎÔ}''ÔöWý®®ÐÌ½ZDyI>öAê¸2¿|{­é(w@', N'https://ceslava.s3-accelerate.amazonaws.com/2016/04/mistery-man-gravatar-wordpress-avatar-persona-misteriosa-510x510.png')
INSERT Cliente (IdCliente, Nombre, Apellidos, Email, Password, Salt, Imagen) VALUES (2, N'John', N'Smith Smith', N'johnsmith@example.com', 0xE395E07BD632F7751D2142066D9B696EAAAE3FE02EF9FEB61BE111ED68DC65466AD7D4777FE15E1FC936DA3358DC57F8D30582F73B57042E0B1C0CCFE7C7CBD3, N')¸Î´1eçw´rå¶hùWe¨»ý²¥$h	yÅ&a.éÉe', N'https://images.squarespace-cdn.com/content/v1/5b23eafbcef3728821dfb462/1616699983908-5PPXBFSPNLWKZKV5GX8T/John%2BSmith%2Bby%2BElly%2BLucas%2B%2827%29ii.jpg')
INSERT Cliente (IdCliente, Nombre, Apellidos, Email, Password, Salt, Imagen) VALUES (3, N'Willy', N'Wonka', N'willywonka@gmail.com', 0xC64E11104208CAC70DDF6CEC0319AC2E5AD2E8BB259AAE787F342C1A661A05C22527C2591D631B793C5614F9BB4DE948CFC8AA4BE7B4F9E784CB6D2006CE6202, N'¯w»i·Î;ã¼ÕçÕb|×Ã=Df;;akç×I%BõÄEXH4\B._È', N'https://www.dondevive.org/wp-content/uploads/2015/07/donde-vive-willy-wonka.jpg')
GO
INSERT Info_Arte (IdInfoArte, Titulo, Precio, Descripcion, Imagen, IdArtista) VALUES (1, N'Summer 1999', 18, N'Giclee print  16 x 15 inches  ﻿Hand-numbered limited edition of 100', N'https://cdn.shopify.com/s/files/1/0230/6428/1166/products/digi-2_540x.jpg?v=1564779773', 1)
INSERT Info_Arte (IdInfoArte, Titulo, Precio, Descripcion, Imagen, IdArtista) VALUES (2, N'Beast Boy & Pets', 30, N'Giclee print  13 x 11 inches  Open edition   Officially licensed by Bottleneck Gallery & Warner Bros. Consumer Products', N'https://cdn.shopify.com/s/files/1/0230/6428/1166/products/beastboy-shadow_540x.jpg?v=1557848357', 1)
INSERT Info_Arte (IdInfoArte, Titulo, Precio, Descripcion, Imagen, IdArtista) VALUES (3, N'The Cruel Prince', 7, N'“you really hate me, don’t you?⚔️”', N'https://pbs.twimg.com/media/FsJ7DYrWwAYUH53?format=jpg&name=small', 2)
INSERT Info_Arte (IdInfoArte, Titulo, Precio, Descripcion, Imagen, IdArtista) VALUES (4, N'Tendou Satori', 4, N'Satori de Haikyuu!', N'https://ih1.redbubble.net/image.2075327580.5780/flat,500x,075,f.u3.jpg', 4)
INSERT Info_Arte (IdInfoArte, Titulo, Precio, Descripcion, Imagen, IdArtista) VALUES (5, N'Jim Hawkins', 17, N'Jim Hawkins from Treasure Planet', N'https://pbs.twimg.com/media/Fi058moXEAMPnJJ?format=jpg&name=large', 1)
INSERT Info_Arte (IdInfoArte, Titulo, Precio, Descripcion, Imagen, IdArtista) VALUES (6, N'Major Arcana Cats - Tarot', 20, N'A deck of 22 cat-cards inspired by the major arcana. Una baraja de 22 cartas gatunas inspiradas en los arcanos mayores.', N'https://ksr-ugc.imgix.net/assets/040/180/074/90ab1177e65767c5d6466967728677cf_original.png?ixlib=rb-4.0.2&crop=faces&w=1024&h=576&fit=crop&v=1678360742&auto=format&frame=1&q=92&s=36fc7b41489dfc2480230b24d2fbae1d', 3)
INSERT Info_Arte (IdInfoArte, Titulo, Precio, Descripcion, Imagen, IdArtista) VALUES (7, N'Shinobu Kochou', 8, N'Shinobu de Kimetsu no Yaiba', N'https://i.pinimg.com/originals/19/34/d8/1934d89a1527f9842db12af2588cc3c8.jpg', 2)
INSERT Info_Arte (IdInfoArte, Titulo, Precio, Descripcion, Imagen, IdArtista) VALUES (8, N'Zero Two', 4, N'Zero Two de DARLING in the FRANXX', N'https://ih1.redbubble.net/image.2075256495.3589/flat,500x,075,f.u3.jpg', 4)
INSERT Info_Arte (IdInfoArte, Titulo, Precio, Descripcion, Imagen, IdArtista) VALUES (9, N'Your words cut deep like daggers', 6, N'Ayer votásteis con gran diferencia que terminase este diseño, así que aquí está 🥰 He tardado mucho en decidirme por la paleta de colores, pero al final decidí jugar un poco con el contraste de colores complementarios morado-amarillo 👀', N'https://assets.bigcartel.com/product_images/353872885/Your_Words_Cut_Deep_Like_Daggers_2.png?auto=format&fit=max&h=1000&w=1000', 5)
INSERT Info_Arte (IdInfoArte, Titulo, Precio, Descripcion, Imagen, IdArtista) VALUES (10, N'Anagapesis', 6, N'Quick sketch... Dark or light background?', N'https://assets.bigcartel.com/product_images/338044530/Anagapesis.jpg?auto=format&fit=max&h=1000&w=1000', 5)
INSERT Info_Arte (IdInfoArte, Titulo, Precio, Descripcion, Imagen, IdArtista) VALUES (11, N'Nature''s Fury', 18, N'La furia de la naturaleza', N'https://cdna.artstation.com/p/marketplace/printed_product_covers/000/039/334/art_print_big/file.jpg?1589797718', 7)
GO
ALTER TABLE Chat  WITH CHECK ADD  CONSTRAINT FK_Chat_Artista FOREIGN KEY(IdArtista)
REFERENCES Artista (IdArtista)
GO
ALTER TABLE Chat CHECK CONSTRAINT FK_Chat_Artista
GO
ALTER TABLE Chat  WITH CHECK ADD  CONSTRAINT FK_Chat_Cliente FOREIGN KEY(IdCliente)
REFERENCES Cliente (IdCliente)
GO
ALTER TABLE Chat CHECK CONSTRAINT FK_Chat_Cliente
GO
ALTER TABLE Info_Arte  WITH CHECK ADD  CONSTRAINT FK_Info_Arte_Artista FOREIGN KEY(IdArtista)
REFERENCES Artista (IdArtista)
GO
ALTER TABLE Info_Arte CHECK CONSTRAINT FK_Info_Arte_Artista
GO
ALTER TABLE Transaccion  WITH CHECK ADD  CONSTRAINT FK_Transaccion_Cliente FOREIGN KEY(IdCliente)
REFERENCES Cliente (IdCliente)
GO
ALTER TABLE Transaccion CHECK CONSTRAINT FK_Transaccion_Cliente
GO
ALTER TABLE Transaccion  WITH CHECK ADD  CONSTRAINT FK_Transaccion_Info_Arte FOREIGN KEY(IdInfoArte)
REFERENCES Info_Arte (IdInfoArte)
GO
ALTER TABLE Transaccion CHECK CONSTRAINT FK_Transaccion_Info_Arte
GO
ALTER TABLE Valoraciones  WITH CHECK ADD  CONSTRAINT FK_Valoraciones_Artista FOREIGN KEY(IdArtista)
REFERENCES Artista (IdArtista)
GO
ALTER TABLE Valoraciones CHECK CONSTRAINT FK_Valoraciones_Artista
GO
ALTER TABLE Valoraciones  WITH CHECK ADD  CONSTRAINT FK_Valoraciones_Cliente FOREIGN KEY(IdCliente)
REFERENCES Cliente (IdCliente)
GO
ALTER TABLE Valoraciones CHECK CONSTRAINT FK_Valoraciones_Cliente
GO