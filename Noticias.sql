DROP DATABASE IF EXISTS Noticias;
CREATE DATABASE Noticias;
USE Noticias;

----------------------------------

CREATE TABLE Noticia(
    Id INT AUTO_INCREMENT,
    IdCategoria INT NOT NULL,
    IdEditor INT NOT NULL,
    Titulo VARCHAR(70) NOT NULL,
    Fecha DATETIME NOT NULL,
    Contenido TEXT NOT NULL,

    PRIMARY KEY (Id)
);

CREATE TABLE Categoria(
    Id INT AUTO_INCREMENT,
    Nombre VARCHAR(30),

    PRIMARY KEY (Id)
);

CREATE TABLE Editor(
    Id INT AUTO_INCREMENT,
    Nombre VARCHAR(30) NOT NULL,
    Correo VARCHAR(50) NOT NULL,

    PRIMARY KEY (Id)
);

CREATE TABLE Administrador(
    Id INT AUTO_INCREMENT,
    Nombre VARCHAR(30) NOT NULL,
    Contrasena CHAR(64) NULL,

    PRIMARY KEY (Id)
);

------------------------------------

ALTER TABLE Noticia ADD(
    CONSTRAINT FKNoticiaCategoria
        FOREIGN KEY (IdCategoria)
        REFERENCES Categoria(Id),
    CONSTRAINT FKNoticiaEditor
        FOREIGN KEY (IdEditor)
        REFERENCES Editor(Id)
);

---------------------------------------------------------------

INSERT INTO Categoria(Nombre) VALUES 
    ("Android"),
    ("IOS"),
    ("Windows"),
    ("Linux"),
    ("Google"),
    ("AMD"),
    ("Intel"),
    ("Microsoft"),
    ("Xbox"),
    ("Software"),
    ("Hardware"),
    ("Meta"),
    ("Virtual Reality"),
    ("Augmented Reality"),
	("Sony");
    
    
INSERT INTO Editor(Nombre, Correo) VALUES 
    ("Juan Chavez", "181G0232@rcarbonifera.tecnm.mx"),
    ("Jean Muñoz", "181G0250@rcarbonifera.tecnm.mx");

INSERT INTO Administrador(Nombre, Contrasena) VALUES 
    ("ADMIN", SHA2("admin",256));
    
Insert into Noticia(IdCategoria, IdEditor, Titulo, Fecha, Contenido) values
("7","2","DRM solucionado en Intel ALder","2021-12-07 12:00:00","Cuando se produjo el lanzamiento de los procesadores Intel Alder Lake-S pudimos confirmar que, debido al sistema de comprobación de seguridad que utilizaban ciertos juegos basados en el DRM Denuvo, estos no podían ejecutar determinados títulos. No era un problema especialmente grave, ya que al final estábamos ante un escenario que podía ser resuelto con un simple parche, y eso ha sido, precisamente, lo que ha ocurrido.

La propia Intel reconoció abiertamente ese problema, y dijo que se producía por un fallo a nivel de DRM que hacía que Denuvo reconociera el diseño híbrido de los procesadores Intel Alder Lake-S de forma incorrecta. En resumen, dicho DRM identificaba los núcleos de alto rendimiento como un sistema, y los de alta eficiencia como otro sistema, y por tanto «pensaba» que se estaba intentando ejecutar el juego en dos PCs al mismo tiempo.

Cuando llegaron los procesadores Intel Alder Lake-S, la lista de títulos afectados rondaba los 90, pero gracias a los parches que han ido recibiendo, esa lista se ha reducido a tres. Sí, solo tres juegos siguen teniendo problemas por se conflicto al identificar la configuración híbrida de los procesadores Intel Alder Lake-S como si fueran dos sistemas distintos. Sé lo que estás pensando, ¿cuáles son esos tres juegos que aún están afectados? Pues Assassin’s Creed Valhalla, Fernbus Simulator y Madden 22, aunque, curiosamente, algunos usuarios han podido ejecutar el primero sin problemas en un equipo basado en el nuevo Intel Core i7-12700K, y con Windows 11 como director de orquesta.");


Insert into Noticia(IdCategoria, IdEditor, Titulo, Fecha, Contenido) values
("2","1","iPhone SE 2022 debutara pronto ","2021-12-09 12:00:00"," Ya llevamos un tiempo hablando del iPhone SE, la opción más económica para hacerse con un smartphone de Apple, y que actualmente se encuentra en su segunda generación por un precio que parte de los 489 euros. Por no hablar de los usuarios a los que el clásico botón de inicio les sigue pareciendo un elemento necesario en sus móviles, pues conozco a más de una persona que se ha decantado por el iPhone SE frente a otras versiones principalmente por esa razón.

En julio tuvimos noticias de que Apple ya estaba pisando el acelerador, poniendo en marcha la cadena de suministros para llegar a tiempo con la producción del iPhone SE de tercera generación. Ahora bien, ¿cuándo es «a tiempo»? Según supimos en aquel momento Apple apuntaba al primer semestre de 2022, un plazo bastante amplio que, hasta ahora, se había repetido en varias ocasiones, pero que según podemos leer hoy en Wccftech, podría estrecharse mucho, y estar bastante cerca.

No tenemos una fecha concreta todavía, pero según podemos leer en dicha publicación, parece que los proveedores de Apple ya se están preparando para realizar sus envíos de iPhone SE, lo que indicaría que ya no tendremos que esperar demasiado hasta que se produzca su anuncio y, claro, su llegada al mercado. Esta información, no obstante, no está confirmada, por lo que todavía tendremos que esperar para saber si su lanzamiento se produce más cerca de enero o de junio.

Con respecto a sus especificaciones técnicas, en un primer momento se hablaba de que mantendría el diseño del iPhone SE de segunda generación, y que todos los cambios se producirían en su interior. Sin embargo, de manera más reciente, se ha planteado la posibilidad de que sí que se produzca un cambio, pasando a tener el diseño del iPhone XR, lo que supondría la despedida definitiva del botón de inicio, que en este momento ya solo se encuentra en el SE de segunda generación. En lo que sí que hay consenso es en que la tercera generación supondrá, esta vez sí, el salto del iPhone SE a la conectividad 5G, y es que recordemos que en su versión actual sigue todavía en 4G. Otro salto importante que, en principio, también veremos en esta tercera iteración es el referido a su SoC, que pasará de ser el A13 Bionic, con el que se motorizó el iPhone 11, al muy reciente A15 Bionic, que da vida a los iPhone 13 presentados hace tan solo un par de meses.

El tercer gran cambio dependerá, claro, de si finalmente se mantiene el diseño del iPhone SE de segunda generación o Apple ha optado por el del iPhone XR, y es que en este último caso, es decir, si desaparece el botón de inicio (algo que me sorprendería un poco, en verdad), también veríamos crecer el tamaño de su pantalla, y la adopción de Face ID. Y digo que me sorprendería porque, con estos cambios, las diferencias entre el SE y los modelos de mayor precio se verían sustancialmente reducidas.

Y en caso de que sea así, resultaría todavía más sorprendente que se confirmara algo que también se filtró hace unos meses, y es que esta nueva generación de iPhone SE mantendría el precio de la anterior, es decir, los 489 euros que indicaba al principio. Y es que si finalmente se confirma todo, incluso la desaparición del botón y una pantalla de mayor tamaño por ese precio, parece que finalmente tendríamos el iPhone barato que el mercado lleva ya tanto tiempo esperando.");

Insert into Noticia(IdCategoria, IdEditor, Titulo, Fecha, Contenido) values
("4","2","Zorin OS 16 como alternativa en hardware viejo","2021-12-09 12:00:00"," Zorin OS 16 Lite es la nueva variante de la última versión de una de las distribuciones GNU/Linux que más nos gustan pensando en que los usuarios habituales de Windows prueben el sistema libre. Por supuesto, hay otras alternativas a explorar, porque instalar y usar Linux es hoy tan sencillo como hacerlo con Windows.

Como su nombre indica, se trata de una versión «pequeña» de la versión general que se publicó en marzo. Esta versión está especialmente destinada a equipos más antiguos, con nivel de hardware reducido o aquellos que, por ejemplo, no pueden acceder a Windows 11 y sus exigentes requisitos de TMP, UEFI y demás.

Zorin OS 16 Lite
La distribución está basada en Ubuntu 20.04.3 LTS, utiliza Xfce 4.16 como entorno de escritorio y debería resultar familiar a los usuarios de Windows ya que está especialmente diseñada para ayudar en la transición, gracias a un apartado visual que lo busca expresamente (aunque sin perder su personalidad propia) y con algunos componentes mejorados como WINE para ejecutar aplicaciones Windows y con ello lograr un cambio gradual y no dramático para un usuario que se acerque por primera vez al sistema libre.

«Actualizada con una apariencia renovada y refinada lista para usar. Hemos introducido un nuevo tema predeterminado más pulido de Zorin OS 16 que es más agradable a la vista. Encontrarás toques detallados y animaciones deliciosas en todas partes del sistema para elevar tu experiencia informática», señalan los desarrolladores en el anuncio. La versión también estrena una base de datos que detecta los formatos más usados entre los instaladores de Windows, para que el sistema pueda guiar al usuario a través del proceso de instalación. Si el sistema reconoce un archivo .exe o .msi, simplemente con un doble clic el sistema le sugerirá automáticamente que instale la aplicación o el juego (o su alternativa más cercana) desde la fuente recomendada, ya sea un paquete nativo en la tienda de software o un instalador optimizado para Linux para un juego de PC.

Por supuesto, no faltan las principales aplicaciones Linux, algunas pre-instaladas y todas las demás en una ‘tienda única’ que ofrece Zorin desde varias fuentes, comenzando por el repositorio Flathub (un estándar de facto para obtener aplicaciones usando el formato de paquetes Flatpak integrado en anteriores versiones de Zorin) y también la tienda de Canonical y repositorios de Ubuntu.");



Insert into Noticia(IdCategoria, IdEditor, Titulo, Fecha, Contenido) values
("3","2","Nuevo bloc de notas para Windows 11","2021-12-09 12:00:00"," 
Microsoft ha publicado el nuevo bloc de notas para Windows 11. Está disponible en fase de prueba en el canal Insider y llega con nuevo diseño, renovado visualmente y con algunas funciones nuevas.

El bloc de notas (Notepad) sigue siendo una de las aplicaciones de Windows más útiles y usadas de las que se entregan por defecto con el sistema operativo. La última vez que Microsoft la actualizó realmente fue con Windows Vista y no fue hasta 2018 cuando se volvió a actualizar ligeramente para introducir nuevos accesos directos y mejoras en el cuadro de diálogo de búsqueda.

Y poco más. Desde entonces, esta aplicación de edición de texto se ha estancado por completo. La verdad es que se ve viejísima, mientras que las alternativas de terceros (la mayoría gratuitas y algunas de código abierto) han seguido mejorando y aquí podemos señalar a Sublime Text, Atom o Notepad++.

Con Windows 11, Microsoft prometió no solo mejorar el sistema, sino las aplicaciones que se entregan instaladas con el mismo y que forman parte de la experiencia general de Windows. Podemos citar el nuevo editor de dibujo/fotos Paint como ejemplo y se esperan mejoras en otro tipo de software como la del explorador de archivos, solicitadísimo por los Insiders y es que hace falta ‘como el comer’.");



Insert into Noticia(IdCategoria, IdEditor, Titulo, Fecha, Contenido) values
("5","1","Transmision de audio nativo en Youtube Music","2021-12-04 12:00:00","YouTube Music sigue mejorando poco a poco y se aproxima a lo que se espera de una alternativa a Spotify, decíamos hace no demasiado. Y así sigue la cosa, por más que Google lo haya «apostado todo» por este servicio de sabor agridulce al que todavía le falta un buen hervor.

Prueba de ello es la característica que nos ocupa y que quizás no hayas entendido del todo en el titular, que da para lo que da. Hablamos de la capacidad de enviar la música que estás reproduciendo a un dispositivo externo, en este caso vía aplicación web, ya que mediante la aplicación móvil se podía hacer lo mismo desde hace un tiempo.

O, dicho de otra manera, hasta ahora podías enviar lo que estabas reproduciendo en YouTube Music a dispositivos como el Chromecast, pero «a lo bruto»: podías enviar toda la pestaña o el vídeo que estuvieses reproduciendo, como de hecho se puede hacer con cualquier página web a través de Chrome. Esto no ha cambiado y sigue pudiendo hacerse, sobra añadir.

Sin embargo, con la nueva actualización que ha recibido la aplicación web de YouTube Music, también puedes enviar solo la transmisión de audio directamente hacia un dispositivo de solo audio, como altavoces o pantallas inteligentes como los gobernados por Google Home, Nest o Assistant. Los dispositivos disponibles se mostrarán en la esquina superior derecha de la interfaz.");


Insert into Noticia(IdCategoria, IdEditor, Titulo, Fecha, Contenido) values
("5","2","Google lanzara los Pixel Watch en 2022","2021-12-03 12:00:00","Después de algunos meses desde los últimos rumores y filtraciones por fin volvemos a tener nuevas noticias sobre el posible primer smartwatch de Google con Wear OS, que todavía bajo el posible nombre de Pixel Watch, apunta ahora a un lanzamiento cercano fechado para el próximo año, así como a la adición de algunas características premium que lo orientarían a competir directamente con los Apple Watch.

Así lo han compartido desde Business Insider, quienes aseguran que fuentes provenientes de empleados anónimos de la empresa han compartido diversas informaciones sobre que Google se está preparando para lanzar su primer reloj inteligente bajo su propia marca en 2022. Una información que como siempre, no ha sido confirmada ni comentada por Google.

Renombrado de nuevo bajo el nombre en clave «Rohan», parece que este smartwatch mantendrá el diseño adelantado durante los últimos años para el Pixel Watch, con una esfera redonda de bordes suavizados con la única presencia de un botón físico en el lateral derecho. Aunque sin duda lo más impactante del mismo será su pantalla, con un panel prácticamente sin bordes que llegará incluso a ocupar una pequeña porción de la curva lateral, ofreciendo una superficie de reproducción realmente amplia.");

Insert into Noticia(IdCategoria, IdEditor, Titulo, Fecha, Contenido) values
("15","1","Sony estaria creando su propio Game Pass","2021-12-03 12:00:00","esde que Microsoft lanzó Xbox Game Pass, hemos estado esperando la respuesta de Sony. Y ya ha pasado tiempo, en verdad, pues su debut en consola se produjo en 2017, y su muy esperado salto al PC tuvo lugar en junio de 2019. Desde entonces Microsoft ha contado con una baza ganadora frente a Sony, algo que nunca he llegado a entender, especialmente si tenemos en cuenta que en el tiempo transcurrido desde entonces se produjo el lanzamiento de la nueva generación de consolas, con Xbox Game Pass como un elemento que en más de un caso podía marcar la diferencia.

Finalmente, y después de años de rumores, parece que ya estamos cerca de la esperada reacción. Según podemos leer en Bloomberg Sony está trabajando en un proyecto llamado Spartacus, cuyo lanzamiento está previsto para la próxima primavera. En su lanzamiento, Spartacus combinará los dos planes de suscripción existentes en la actualidad, PlayStation Plus y PlayStation Now y el servicio será compatible con PlayStation 4 y PlayStation 5.

También según la información obtenida por Bloomberg, Sony se plantea un servicio con tres niveles de acceso, en función de la cuota mensual.");

Insert into Noticia(IdCategoria, IdEditor, Titulo, Fecha, Contenido) values
("1","2","Android 12L llegara a comienzos del 2022","2021-12-03 12:00:00","Google presentó Android 12L como una variante de su sistema móvil especializado en dispositivos con pantalla grande, nuevos formatos como los de doble pantalla/plegables y por supuesto tabletas electrónicas. Según el calendario de Google, la primera versión beta de esta versión estará disponible este mismo mes, pero Lenovo se ha adelantado con una previa para desarrolladores a ejecutar sobre su tablet Tab P12 Pro.

El anuncio del Android 12L fue tan inesperado como interesante. La retirada de Google del negocio de tablets propios, el claro enfoque del desarrollo de Android hacia los móviles inteligentes y el interés por impulsar Chrome OS, dejó huérfanos a una buena parte de usuarios que quizá comprarían más tablets Android si el apartado del software fuera más interesante.

Hay muchos modelos de tablets con Android, cierto, pero solo Samsung en la gama alta ha sido capaz de hacer frente (y modestamente) a los iPad. En cuanto a la gama baja, Android domina casi por completo, pero su interés no va más allá de un «móvil grandote» sin funciones de comunicaciones.

Hay que nombrar aquí a Apple y la estrategia de crear un sistema operativo dedicado, iPadOS. Por supuesto, tiene su base en el desarrollo de iOS, pero está perfectamente optimizado y adaptado al mayor tamaño y las necesidades específicas de un tablet y cuenta con características específicas para ellos. Android 12L apunta a ser el desarrollo necesario para que Google se ponga al día.");

Insert into Noticia(IdCategoria, IdEditor, Titulo, Fecha, Contenido) values
("11","1","Nueva GeForce RTX 2060 12GB confirmada","2021-12-09 12:00:00","La tarjeta gráfica GeForce RTX 2060 12GB existe y llegará muy pronto al mercado. Los rumores acertaron de nuevo y es que en el mundo de la tecnología es difícil mantener un ‘secreto’. Cuando no son las mismas compañías las que van soltando filtraciones interesadas o los socios que anuncian prematuramente sus desarrollos como fue el caso de Gigabyte.

NVIDIA ha publicado el conjunto de controladores versión 497.09 para sus tarjetas gráficas. En las notas de la versión que siempre se publican junto a la actualización de software se puede ver listada esta GeForce RTX 2060 12GB. Un modo poco habitual en el gigante verde de confirmar la existencia de un nuevo hardware, ya que ni siquiera la ha mencionado en el anuncio de los controladores.

Cómo será la GeForce RTX 2060 12GB
Si hablamos de ‘refritos’ cuando se utilizan arquitecturas y chips de generaciones anteriores que ya han sido superadas por el mismo fabricante, este es un ejemplo. Claro qué, en la desastrosa situación actual de producción y distribución la daremos por bienvenida si NVIDIA es capaz de comercializarla a un precio razonable y con el suficiente stock.

El componente más novedoso y destacado lo vemos en su mismo nombre. Esos 12 Gbytes de memoria GDDR6 dedicados que duplicarían los 6 GB del modelo original y superarían también los 8 GB de la versión SUPER.");

Insert into Noticia(IdCategoria, IdEditor, Titulo, Fecha, Contenido) values
("9","2","Nuevos juegos en el Xbox Game Pass","2021-12-01 12:00:00","El catálogo de juegos incluidos en Xbox Game Pass se mueve más que la cotización de las criptomonedas. Con la diferencia, eso sí, de que en el caso del servicio de suscripción de juegos de Microsoft, la tendencia siempre es al alza. Así, no es de extrañar que el volumen de usuarios del servicio también se mantenga en senda creciente, y que el nivel de satisfacción de sus usuarios sea, al menos en todos los casos que conozco (y no son pocos) tremendamente positivo.

No cabe duda alguna de que Microsoft ha apostado muy, muy fuerte por Xbox Game Pass, y una muestra más de ello es Xbox All Pass, un programa puesto en marcha en España por Microsoft y Game, por el que es posible financiar la compra de una Xbox Series S|X en 24 pagos mensuales sin intereses, y que además de la propia consola, también incluye la suscripción mensual a Xbox Game Pass Ultimate. Una manera de conseguir la consola de nueva generación con la que, además, los usuarios probarán el servicio, y apuesto a que muchos de ellos mantendrán su suscripción pasados esos 24 meses.

Una de las claves del éxito de Xbox Game Pass es, claro, la enorme rotación de su catálogo de juegos, entre los que podemos encontrar lanzamientos de juegos triple A que se suman al mismo el mismo día de su lanzamiento. Esto empezó siendo así con los títulos de los estudios que pertenecen a Microsoft, pero de un tiempo a esta parte se han sumado más desarrolladoras a esta política, incrementando así el atractivo del servicio.");

Insert into Noticia(IdCategoria, IdEditor, Titulo, Fecha, Contenido) values
("12","1","Cifrado retrasado para Messenger","2021-11-22 12:00:00","Siendo una de las cualidades de mayor atractivo de WhatsApp, aun pese a los incidentes de seguridad todavía conocidos, la función de cifrado de extremo a extremo (o E2EE) que Meta comenzó a preparar para el resto de sus aplicaciones como Instagram o Messenger, ha vuelto a ser retrasada.

Y es que aunque debería haber llegado el pasado mes de mayo de 2021, ahora la compañía ha vuelto a pronunciarse a través de un comunicado oficial publicado en su blog para confirmar que ésta función no estaría disponible hasta 2022, como pronto, llegando incluso algunos medios a señalar 2023.

«Si bien esperamos avanzar más en el cifrado de extremo a extremo predeterminado para Messenger e Instagram Direct este año, es un proyecto a largo plazo y no estaremos completamente cifrados de extremo a extremo hasta el 2022 como muy pronto» asegura el comunicado, «Además, las funciones de seguridad que ya hemos introducido están diseñadas para funcionar con cifrado de extremo a extremo, y planeamos seguir incorporando funciones de seguridad sólidas en nuestros servicios«.");

Insert into Noticia(IdCategoria, IdEditor, Titulo, Fecha, Contenido) values
("13","1","Posible VR para la Steam Deck","2021-09-29 12:00:00","Puede que 2021 sea el año del hardware para Valve, primero, claro, por la Steam Deck, pero quizá también por Deckard, un proyecto del que hasta ahora no sabíamos nada, pero que ha sido detectado por el Youtuber Brad Lynch, que habría encontrado algunas referencias muy interesantes en el software de Valve Lighthouse, el sistema de posicionamiento empleado tanto en SteamVR como en HTC Vive. Esto, claro, ya nos pone sobre la pista de que estas referencias apuntan al mundo de los visores de realidad virtual.

¿Y qué es lo que ha encontrado este creador? Pues un producto denominado Deckard (y no creo que Valve esté trabajando en crear un Blade Runner), junto a la designación POC-C. Un indicador que habla de la tercera versión (ordenadas alfabéticamente) de una prueba de concepto en la que estarían trabajando en Valve. Dicho de otra manera, parece que Valve está trabajando en un visor de realidad virtual que, de momento, se encuentra en fase de prueba de concepto, más concretamente en su tercera versión.

Un aspecto interesante de la investigación llevada a cabo por Lynch es que la primera aparición de Deckard en el software de Valve Lighthouse se remonta a enero de este año, por lo que podemos concluir que en lo que llevamos de 2021 la compañía ya ha probado tres versiones distintas del mismo. La duda es, claro, si hablamos de un mismo dispositivo evolucionado, o de distintas pruebas de concepto que se han organizado de manera secuencial.

Por otra parte, me llama mucho la atención el nombre, Deckard, y es que no hay que ser muy sagaz para relacionarlo con Steam Deck. Lo que, claro, nos invita a pensar que Valve podría estar trabajando en un visor de realidad virtual para su consola portátil. De ser así, si Valve consiguiera dar ese paso, sin duda habría que reconocer su mérito en lo referido a innovación. Y personalmente reconozco que, si funciona bien, me parece una idea increíblemente atractiva.");

Insert into Noticia(IdCategoria, IdEditor, Titulo, Fecha, Contenido) values
("6","2","AMD podria cambiar TSMC por Samsung","2021-11-21 12:00:00","Que TSMC y Apple tienen una relación preferencial, es más que sabido por otras compañía que, como ocurre con AMD, en muchas ocasiones tienen que ajustarse a los acuerdos suscritos entre TSMC y Apple, que siempre son los primeros en la planificación del fabricante de chips. Esto se entiende, claro, por el volumen de negocio que les proporcionan los de Cupertino, pero la situación no resulta tan cómoda para el resto de clientes, que podrían llegar a replantearse su relación con TSMC.

Y haber citado a AMD no ha sido un simple ejemplo. Muy al contrario, y como podemos leer en PhoneArena, parece que el gigante de Santa Clara se estaría replanteando su relación con TSMC, con la posibilidad de dar el salto a Samsung como proveedor, con su plataforma de 3 nanómetros. Según los datos publicados por Counterpoint, a día de hoy AMD supone el 5% del volumen de trabajo de TSMC, muy por debajo del 53% que representa Apple.

Esto, en primera instancia, nos podría hacer pensar que no hablamos de un gran golpe para TSMC, que seguramente no tardaría mucho tiempo en recuperar ese 5% con algunos de sus clientes habituales, o con otros que tienen necesidad de chips y todavía no cuentan con los servicios de la compañía. Sin embargo, también cabe la posibilidad de que si AMD da este paso, lo que haga sea iniciar un movimiento que podría ser suscrito por otros de los actuales clientes de TSMC.

Y es que, de cara al salto a los tres nanómetros, se está extendiendo el temor de que TSMC, de cara a garantizar toda la producción comprometida con Apple, sea incapaz de satisfacer las necesidades de AMD y, por lo tanto, potencialmente también la de otros clientes que también desean dar ese salto, como podría ser el caso de Qualcomm, que actualmente, y también según datos de Counterpoint, representa el 24% del volumen de negocio de la compañía.");

Insert into Noticia(IdCategoria, IdEditor, Titulo, Fecha, Contenido) values
("8","2","Nueva alianza entre Sega y Microsoft","2021-11-02 12:00:00","Anunciada durante el fin de semana, y tras los más recientes movimientos de ampliación de Microsoft, no han sido pocos los que temieron que el nuevo acuerdo del gigante de Redmond con SEGA estuviese relacionado con la adquisición de la misma. Sin embargo, tal y como ha compartido la compañía japonesa en un comunicado oficial, está destinado a la creación del llamado «Super Game», una alianza estratégica que beneficiará a ambas compañías.

De hecho, esta nueva alianza ni siquiera está orientada a modo de acuerdo de distribución destinado a traer los juegos de la compañía japonesa a las plataformas de Microsoft (muchos de los cuales de hecho ya estaban presentes de manera previa a este acuerdo), sino que se trata de un proyecto mucho ambicioso que pasará por la producción conjunta de nuevos juegos con la visión de «adaptarse a la nueva realidad de la industria y de los propios jugadores«.

Aunque de hecho, las plataformas en la nube de Microsoft tomarán otro de los papeles fundamentales en esta alianza, asegurando desde SEGA que buscan «trabajar con Microsoft para anticipar estas tendencias a medida que se aceleren aún más en el futuro […] el objetivo es optimizar los procesos de desarrollo y continuar brindando experiencias de alta calidad a los jugadores que utilizan tecnologías de nube de Azure«.

Por otra parte, la iniciativa de Super Game también beneficiará a la propia SEGA, quien pasará a contar con la infraestructura de red y herramientas para servicios en línea a escala global que ofrece Microsoft, accediendo a recursos de desarrollo, producción y distribución que le permitirán crecer y adaptarse rápidamente a los sistemas de nueva generación y a las futuras tendencias que vayan surgiendo en la industria del videojuego.

Definitivamente, esta nueva iniciativa agilizará notablemente los procesos de desarrollo de las próximas entregas, sumándose a demás al recién anunciado nuevo programa SEGA Insights Lab, con el que la desarrolladora recibe ahora el feedback de sus jugadores de todo el mundo.

Y es que sin duda SEGA parece decidida a evolucionar, dejando atrás sus gran pasado con duras decisiones como el cierre del mítico arcade histórico de Tokio, y tomando la iniciativa de adaptarse de antemano al que parece será el futuro inevitable de esta industria.");
