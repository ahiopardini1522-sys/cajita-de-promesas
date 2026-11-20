import 'package:flutter/material.dart';

/// Una promesa: el versículo (Reina-Valera 1960), su cita y una breve reflexión.
class Promesa {
  const Promesa({
    required this.texto,
    required this.cita,
    required this.explicacion,
  });

  final String texto;
  final String cita;
  final String explicacion;
}

/// Todas las promesas de la cajita.
/// IMPORTANTE: las nuevas se agregan SIEMPRE al final de la lista,
/// porque la app recuerda cuáles ya salieron por su posición.
const List<Promesa> todasLasPromesas = [
  Promesa(
    texto: 'No temas, porque yo estoy contigo; no desmayes, porque yo soy tu '
        'Dios que te esfuerzo; siempre te ayudaré, siempre te sustentaré con '
        'la diestra de mi justicia.',
    cita: 'Isaías 41:10',
    explicacion: 'Dios no te pide que no sientas miedo porque todo sea fácil, '
        'sino porque Él está a tu lado. Su mano derecha, que es símbolo de '
        'poder, te sostiene hoy. No tenés que cargar con tus fuerzas solas: '
        'Él te esfuerza, te ayuda y te sustenta.',
  ),
  Promesa(
    texto: 'Porque yo sé los pensamientos que tengo acerca de vosotros, dice '
        'Jehová, pensamientos de paz, y no de mal, para daros el fin que '
        'esperáis.',
    cita: 'Jeremías 29:11',
    explicacion: 'Dios le dijo esto a su pueblo cuando estaba lejos de casa, '
        'en el exilio. Aun en los tiempos difíciles, sus planes para vos son '
        'de paz y de esperanza. Aunque hoy no entiendas todo, podés confiar '
        'en que Él sabe hacia dónde te lleva.',
  ),
  Promesa(
    texto: 'Mi Dios, pues, suplirá todo lo que os falta conforme a sus '
        'riquezas en gloria en Cristo Jesús.',
    cita: 'Filipenses 4:19',
    explicacion: 'Pablo escribió esto a una iglesia generosa que lo había '
        'ayudado. La medida con la que Dios provee no es tu cuenta ni tus '
        'recursos, sino sus riquezas en gloria. Presentale hoy lo que te '
        'falta y confiá en su provisión.',
  ),
  Promesa(
    texto: 'Venid a mí todos los que estáis trabajados y cargados, y yo os '
        'haré descansar.',
    cita: 'Mateo 11:28',
    explicacion: 'Jesús invita a los cansados, no a los que ya tienen todo '
        'resuelto. Él no agrega peso: ofrece descanso para el alma. Si hoy te '
        'sentís agotado, acercate a Él en oración y dejá tus cargas en sus '
        'manos.',
  ),
  Promesa(
    texto: 'Dios es nuestro amparo y fortaleza, nuestro pronto auxilio en las '
        'tribulaciones.',
    cita: 'Salmos 46:1',
    explicacion: 'Un amparo es un refugio seguro, y "pronto auxilio" quiere '
        'decir una ayuda que llega a tiempo. En medio de la tormenta, Dios no '
        'está lejos: es tu lugar seguro y tu fuerza.',
  ),
  Promesa(
    texto: 'Mira que te mando que te esfuerces y seas valiente; no temas ni '
        'desmayes, porque Jehová tu Dios estará contigo en dondequiera que '
        'vayas.',
    cita: 'Josué 1:9',
    explicacion: 'Josué tenía que tomar el lugar de Moisés y guiar a todo un '
        'pueblo. La valentía que Dios le pidió no venía de él mismo, sino de '
        'saber que Dios iba con él. Esa misma presencia te acompaña hoy a '
        'donde vayas.',
  ),
  Promesa(
    texto: 'Jehová es mi pastor; nada me faltará.',
    cita: 'Salmos 23:1',
    explicacion: 'David había sido pastor y sabía lo que significaba cuidar '
        'ovejas: guiarlas, alimentarlas y defenderlas. Al decir que Dios es '
        'su pastor, confiesa que está en buenas manos. Si Él te pastorea, no '
        'te va a faltar lo que de verdad necesitás.',
  ),
  Promesa(
    texto: 'He aquí yo estoy con vosotros todos los días, hasta el fin del '
        'mundo.',
    cita: 'Mateo 28:20',
    explicacion: 'Son las últimas palabras de Jesús en el Evangelio de Mateo. '
        'No dijo "algunos días" ni "los días buenos", sino todos los días. '
        'Hoy también es uno de esos días: Él está con vos.',
  ),
  Promesa(
    texto: 'Y sabemos que a los que aman a Dios, todas las cosas les ayudan a '
        'bien, esto es, a los que conforme a su propósito son llamados.',
    cita: 'Romanos 8:28',
    explicacion: 'No dice que todo lo que pasa sea bueno, sino que Dios puede '
        'usar todas las cosas, incluso las difíciles, para tu bien. Él '
        'trabaja en cada detalle de tu historia con un propósito.',
  ),
  Promesa(
    texto: 'Todo lo puedo en Cristo que me fortalece.',
    cita: 'Filipenses 4:13',
    explicacion: 'Pablo lo escribió desde la cárcel, hablando de estar '
        'contento tanto en la abundancia como en la necesidad. La fuerza no '
        'es tuya: viene de Cristo. Con Él podés enfrentar lo que hoy tengas '
        'por delante.',
  ),
  Promesa(
    texto: 'La paz os dejo, mi paz os doy; yo no os la doy como el mundo la '
        'da. No se turbe vuestro corazón, ni tenga miedo.',
    cita: 'Juan 14:27',
    explicacion: 'Jesús dijo esto la noche antes de la cruz. La paz del mundo '
        'depende de que todo salga bien; la paz de Jesús se mantiene aun '
        'cuando las cosas se mueven. Es un regalo que podés recibir hoy.',
  ),
  Promesa(
    texto: 'Encomienda a Jehová tu camino, y confía en él; y él hará.',
    cita: 'Salmos 37:5',
    explicacion: 'Encomendar es poner algo en manos de alguien de confianza. '
        'Entregale a Dios tus planes y preocupaciones, y dejá que Él actúe. '
        'La promesa es corta y clara: "él hará".',
  ),
  Promesa(
    texto: 'Fíate de Jehová de todo tu corazón, y no te apoyes en tu propia '
        'prudencia. Reconócelo en todos tus caminos, y él enderezará tus '
        'veredas.',
    cita: 'Proverbios 3:5-6',
    explicacion: 'Nuestra propia inteligencia tiene límites. Cuando tenés en '
        'cuenta a Dios en cada decisión, Él se encarga de ordenar tu camino. '
        'Hoy podés confiarle lo que no entendés.',
  ),
  Promesa(
    texto: 'Pero los que esperan a Jehová tendrán nuevas fuerzas; levantarán '
        'alas como las águilas; correrán, y no se cansarán; caminarán, y no '
        'se fatigarán.',
    cita: 'Isaías 40:31',
    explicacion: 'Esperar en Dios no es quedarse quieto sin hacer nada, sino '
        'confiar activamente en Él. Así como el águila aprovecha el viento '
        'para volar alto, Dios renueva tus fuerzas cuando ya no te quedan.',
  ),
  Promesa(
    texto: 'Echando toda vuestra ansiedad sobre él, porque él tiene cuidado '
        'de vosotros.',
    cita: '1 Pedro 5:7',
    explicacion: 'Dios no te pide que escondas tu ansiedad, sino que se la '
        'des a Él, toda. La razón es hermosa: le importás. Nombrale hoy lo '
        'que te preocupa y soltalo en sus manos.',
  ),
  Promesa(
    texto: 'Cercano está Jehová a los quebrantados de corazón; y salva a los '
        'contritos de espíritu.',
    cita: 'Salmos 34:18',
    explicacion: 'Cuando el corazón está roto, a veces sentimos a Dios lejos. '
        'Este versículo dice lo contrario: es justamente ahí donde Él está '
        'más cerca. Tu dolor no lo aleja, lo acerca.',
  ),
  Promesa(
    texto: 'Por la misericordia de Jehová no hemos sido consumidos, porque '
        'nunca decayeron sus misericordias. Nuevas son cada mañana; grande es '
        'tu fidelidad.',
    cita: 'Lamentaciones 3:22-23',
    explicacion: 'Jeremías escribió esto viendo su ciudad destruida. Aun así '
        'encontró esperanza: la misericordia de Dios se renueva cada mañana. '
        'Hoy es un día nuevo, con misericordia nueva para vos.',
  ),
  Promesa(
    texto: 'Porque de tal manera amó Dios al mundo, que ha dado a su Hijo '
        'unigénito, para que todo aquel que en él cree, no se pierda, mas '
        'tenga vida eterna.',
    cita: 'Juan 3:16',
    explicacion: 'Es el corazón del Evangelio: el amor de Dios es tan grande '
        'que dio a su propio Hijo. La vida eterna no se gana, se recibe '
        'creyendo en Jesús. Ese amor te incluye a vos.',
  ),
  Promesa(
    texto: 'Alzaré mis ojos a los montes; ¿De dónde vendrá mi socorro? Mi '
        'socorro viene de Jehová, que hizo los cielos y la tierra.',
    cita: 'Salmos 121:1-2',
    explicacion: 'Este salmo lo cantaban los peregrinos camino a Jerusalén. '
        'La ayuda no viene de los montes, sino del que los creó. El mismo '
        'Dios que hizo el cielo y la tierra se ocupa de vos.',
  ),
  Promesa(
    texto: 'El que habita al abrigo del Altísimo morará bajo la sombra del '
        'Omnipotente.',
    cita: 'Salmos 91:1',
    explicacion: 'Habitar es vivir de forma permanente, no visitar de vez en '
        'cuando. Quien vive cerca de Dios encuentra protección bajo su '
        'sombra. Hoy podés quedarte en ese lugar seguro.',
  ),
  Promesa(
    texto: 'Pues a sus ángeles mandará acerca de ti, que te guarden en todos '
        'tus caminos.',
    cita: 'Salmos 91:11',
    explicacion: 'El cuidado de Dios es más grande de lo que vemos. Él da '
        'órdenes para tu protección en cada paso que das. Salí hoy confiado '
        'en que estás guardado.',
  ),
  Promesa(
    texto: 'Cuando pases por las aguas, yo estaré contigo; y si por los ríos, '
        'no te anegarán. Cuando pases por el fuego, no te quemarás, ni la '
        'llama arderá en ti.',
    cita: 'Isaías 43:2',
    explicacion: 'Dios no promete que no vas a pasar por pruebas, sino que no '
        'vas a pasarlas solo. Fijate que dice "cuando pases": las atravesás, '
        'no te quedás ahí. Él va con vos hasta el otro lado.',
  ),
  Promesa(
    texto: 'No te desampararé, ni te dejaré.',
    cita: 'Hebreos 13:5',
    explicacion: 'Es una de las promesas más firmes de la Biblia y se repite '
        'desde el Antiguo Testamento. Las personas pueden fallar, pero Dios '
        'no se va. Su compañía es fiel.',
  ),
  Promesa(
    texto: 'Esforzaos y cobrad ánimo; no temáis, ni tengáis miedo de ellos, '
        'porque Jehová tu Dios es el que va contigo; no te dejará, ni te '
        'desamparará.',
    cita: 'Deuteronomio 31:6',
    explicacion: 'Moisés animó así al pueblo antes de entrar a la tierra '
        'prometida. Los desafíos eran grandes, pero Dios iba delante de '
        'ellos. Lo que tengas por delante hoy no es más grande que Él.',
  ),
  Promesa(
    texto: 'Echa sobre Jehová tu carga, y él te sustentará; no dejará para '
        'siempre caído al justo.',
    cita: 'Salmos 55:22',
    explicacion: 'David escribió este salmo traicionado por un amigo. Su '
        'respuesta fue llevar ese peso a Dios. Si hoy te sentís caído, esta '
        'promesa dice que no vas a quedarte así para siempre.',
  ),
  Promesa(
    texto: 'Mas buscad primeramente el reino de Dios y su justicia, y todas '
        'estas cosas os serán añadidas.',
    cita: 'Mateo 6:33',
    explicacion: 'Jesús habla de las preocupaciones por la comida y la ropa. '
        'Cuando ponés a Dios en primer lugar, Él se ocupa de lo demás. Es '
        'una cuestión de prioridades y de confianza.',
  ),
  Promesa(
    texto: 'Pedid, y se os dará; buscad, y hallaréis; llamad, y se os '
        'abrirá.',
    cita: 'Mateo 7:7',
    explicacion: 'Jesús nos anima a orar con perseverancia, como un hijo que '
        'confía en su padre. Dios escucha y responde. Seguí pidiendo, '
        'buscando y llamando: la puerta se va a abrir.',
  ),
  Promesa(
    texto: 'Clama a mí, y yo te responderé, y te enseñaré cosas grandes y '
        'ocultas que tú no conoces.',
    cita: 'Jeremías 33:3',
    explicacion: 'Dios le dijo esto a Jeremías cuando estaba preso. Aun '
        'encerrado, podía hablar con Dios y recibir respuesta. Hoy también '
        'podés clamar: Él quiere mostrarte cosas que todavía no ves.',
  ),
  Promesa(
    texto: 'Tú guardarás en completa paz a aquel cuyo pensamiento en ti '
        'persevera; porque en ti ha confiado.',
    cita: 'Isaías 26:3',
    explicacion: 'La paz completa tiene que ver con dónde ponés tus '
        'pensamientos. Cuando tu mente vuelve una y otra vez a Dios, Él '
        'guarda tu corazón. Hoy podés elegir pensar en su fidelidad.',
  ),
  Promesa(
    texto: 'Y me ha dicho: Bástate mi gracia; porque mi poder se perfecciona '
        'en la debilidad.',
    cita: '2 Corintios 12:9',
    explicacion: 'Pablo le pidió a Dios que le quitara una dificultad, y Dios '
        'le respondió con esto. Tu debilidad no es un obstáculo para Dios: es '
        'donde su poder se ve con más claridad. Su gracia alcanza.',
  ),
  Promesa(
    texto: 'Si confesamos nuestros pecados, él es fiel y justo para perdonar '
        'nuestros pecados, y limpiarnos de toda maldad.',
    cita: '1 Juan 1:9',
    explicacion: 'El perdón de Dios no depende de cómo te sientas, sino de su '
        'fidelidad. Cuando confesás con sinceridad, Él perdona y limpia por '
        'completo. Podés empezar hoy de nuevo.',
  ),
  Promesa(
    texto: 'Y yo les doy vida eterna; y no perecerán jamás, ni nadie las '
        'arrebatará de mi mano.',
    cita: 'Juan 10:28',
    explicacion: 'Jesús habla de sus ovejas, los que lo siguen. Estás en su '
        'mano, y nadie te puede sacar de ahí. Tu seguridad no está en tu '
        'fuerza, sino en la de Él.',
  ),
  Promesa(
    texto: 'En la casa de mi Padre muchas moradas hay; si así no fuera, yo os '
        'lo hubiera dicho; voy, pues, a preparar lugar para vosotros.',
    cita: 'Juan 14:2',
    explicacion: 'Jesús consoló así a sus discípulos antes de irse. Hay un '
        'lugar preparado para vos en la casa del Padre. Esta vida no es todo: '
        'te espera un hogar eterno.',
  ),
  Promesa(
    texto: 'Jehová es mi luz y mi salvación; ¿de quién temeré? Jehová es la '
        'fortaleza de mi vida; ¿de quién he de atemorizarme?',
    cita: 'Salmos 27:1',
    explicacion: 'La luz quita la oscuridad, la salvación libra del peligro y '
        'la fortaleza protege. Si Dios es todo eso para vos, el miedo pierde '
        'fuerza. Caminá hoy con esa confianza.',
  ),
  Promesa(
    texto: 'Te haré entender, y te enseñaré el camino en que debes andar; '
        'sobre ti fijaré mis ojos.',
    cita: 'Salmos 32:8',
    explicacion: 'Dios no solo te muestra el camino: te acompaña con la '
        'mirada, como un padre atento. Si hoy tenés que tomar una decisión, '
        'pedile dirección. Él promete enseñarte.',
  ),
  Promesa(
    texto: 'Jehová está en medio de ti, poderoso, él salvará; se gozará sobre '
        'ti con alegría, callará de amor, se regocijará sobre ti con '
        'cánticos.',
    cita: 'Sofonías 3:17',
    explicacion: 'Imaginá a Dios alegrándose por vos y cantando de gozo. Así '
        'describe este versículo su amor. No sos una carga para Él: sos '
        'motivo de alegría.',
  ),
  Promesa(
    texto: '¿Qué, pues, diremos a esto? Si Dios es por nosotros, ¿quién '
        'contra nosotros?',
    cita: 'Romanos 8:31',
    explicacion: 'Pablo llega a esta conclusión después de explicar todo lo '
        'que Dios hizo por nosotros en Cristo. Puede haber oposición, pero '
        'nada puede vencer a quien tiene a Dios de su lado.',
  ),
  Promesa(
    texto: 'Estando persuadido de esto, que el que comenzó en vosotros la '
        'buena obra, la perfeccionará hasta el día de Jesucristo.',
    cita: 'Filipenses 1:6',
    explicacion: 'Dios no deja las cosas a medias. Lo que empezó en tu vida, '
        'lo va a terminar. Aunque sientas que avanzás despacio, Él sigue '
        'trabajando en vos.',
  ),
  Promesa(
    texto: 'Por la noche durará el lloro, y a la mañana vendrá la alegría.',
    cita: 'Salmos 30:5',
    explicacion: 'Las noches de tristeza son reales, pero no son para siempre. '
        'Dios promete que la mañana llega y trae alegría. Si hoy es de noche '
        'en tu corazón, aferrate a esta promesa.',
  ),
  Promesa(
    texto: 'Porque los montes se moverán, y los collados temblarán, pero no '
        'se apartará de ti mi misericordia, ni el pacto de mi paz se '
        'quebrantará, dijo Jehová, el que tiene misericordia de ti.',
    cita: 'Isaías 54:10',
    explicacion: 'Las montañas son lo más firme que conocemos, y aun así '
        'pueden moverse. El amor de Dios por vos es todavía más firme. Su '
        'misericordia no se aparta.',
  ),
  Promesa(
    texto: 'Jehová peleará por vosotros, y vosotros estaréis tranquilos.',
    cita: 'Éxodo 14:14',
    explicacion: 'Moisés le dijo esto al pueblo frente al mar Rojo, con el '
        'ejército egipcio atrás. Parecía no haber salida, pero Dios abrió el '
        'mar. Hay batallas que solo Él puede pelear por vos.',
  ),
  Promesa(
    texto: 'Jehová te bendiga, y te guarde; Jehová haga resplandecer su '
        'rostro sobre ti, y tenga de ti misericordia; Jehová alce sobre ti su '
        'rostro, y ponga en ti paz.',
    cita: 'Números 6:24-26',
    explicacion: 'Es la bendición que Dios mandó a los sacerdotes pronunciar '
        'sobre su pueblo. Habla de protección, de su favor y de su paz. '
        'Recibila hoy como una palabra para vos.',
  ),
  Promesa(
    texto: 'Porque sol y escudo es Jehová Dios; gracia y gloria dará Jehová. '
        'No quitará el bien a los que andan en integridad.',
    cita: 'Salmos 84:11',
    explicacion: 'El sol da luz y vida, el escudo protege. Dios es las dos '
        'cosas para quienes caminan con Él. Su bondad acompaña a los que '
        'viven con un corazón sincero.',
  ),
  Promesa(
    texto: 'En el mundo tendréis aflicción; pero confiad, yo he vencido al '
        'mundo.',
    cita: 'Juan 16:33',
    explicacion: 'Jesús fue honesto: en esta vida hay dificultades. Pero no '
        'termina ahí: Él ya venció. Tus problemas son reales, pero no tienen '
        'la última palabra.',
  ),
  Promesa(
    texto: 'Y si alguno de vosotros tiene falta de sabiduría, pídala a Dios, '
        'el cual da a todos abundantemente y sin reproche, y le será dada.',
    cita: 'Santiago 1:5',
    explicacion: 'Dios no se molesta cuando no sabés qué hacer. Al contrario, '
        'da sabiduría con generosidad y sin echarte nada en cara. Pedile '
        'claridad para lo que tengas que decidir hoy.',
  ),
  Promesa(
    texto: 'Bendice, alma mía, a Jehová, y no olvides ninguno de sus '
        'beneficios. Él es quien perdona todas tus iniquidades, el que sana '
        'todas tus dolencias.',
    cita: 'Salmos 103:2-3',
    explicacion: 'David se habla a sí mismo para no olvidar todo lo que Dios '
        'hizo por él. Recordar sus beneficios fortalece la fe. Tomate un '
        'momento hoy para agradecer lo que Dios ya hizo en tu vida.',
  ),
  Promesa(
    texto: 'Deléitate asimismo en Jehová, y él te concederá las peticiones de '
        'tu corazón.',
    cita: 'Salmos 37:4',
    explicacion: 'Cuando encontrás tu alegría en Dios, tus deseos empiezan a '
        'parecerse a los suyos. Y Él se goza en cumplir esos deseos. Buscá '
        'hoy disfrutar de su presencia.',
  ),
  Promesa(
    texto: 'Porque no nos ha dado Dios espíritu de cobardía, sino de poder, '
        'de amor y de dominio propio.',
    cita: '2 Timoteo 1:7',
    explicacion: 'Pablo animó así al joven Timoteo, que era tímido. El miedo '
        'no viene de Dios. Lo que Él te da es poder para actuar, amor para '
        'servir y dominio propio para mantenerte firme.',
  ),
  Promesa(
    texto: 'Encomienda a Jehová tus obras, y tus pensamientos serán '
        'afirmados.',
    cita: 'Proverbios 16:3',
    explicacion: 'Antes de empezar tus tareas, entregáselas a Dios. Cuando '
        'trabajás con Él, tus planes toman firmeza. Hoy podés dedicarle cada '
        'cosa que hagas.',
  ),
  Promesa(
    texto: 'Estad quietos, y conoced que yo soy Dios; seré exaltado entre las '
        'naciones; enaltecido seré en la tierra.',
    cita: 'Salmos 46:10',
    explicacion: 'En medio del ruido y el apuro, Dios te invita a parar. '
        'Estar quieto es reconocer que Él tiene el control. Regalate hoy un '
        'momento de silencio con Él.',
  ),
  Promesa(
    texto: 'Le dijo Jesús: Yo soy la resurrección y la vida; el que cree en '
        'mí, aunque esté muerto, vivirá.',
    cita: 'Juan 11:25',
    explicacion: 'Jesús dijo esto ante la tumba de su amigo Lázaro, y después '
        'lo resucitó. Ni siquiera la muerte tiene la última palabra para '
        'quien cree en Él. Es una esperanza viva.',
  ),
  Promesa(
    texto: 'Enjugará Dios toda lágrima de los ojos de ellos; y ya no habrá '
        'muerte, ni habrá más llanto, ni clamor, ni dolor; porque las '
        'primeras cosas pasaron.',
    cita: 'Apocalipsis 21:4',
    explicacion: 'Es una mirada al futuro que Dios prepara. Un día no habrá '
        'más dolor ni lágrimas. Esa esperanza te puede sostener en los días '
        'difíciles de hoy.',
  ),
  Promesa(
    texto: 'Este es el día que hizo Jehová; nos gozaremos y alegraremos en '
        'él.',
    cita: 'Salmos 118:24',
    explicacion: 'Cada día es un regalo hecho por Dios. No hace falta que '
        'todo sea perfecto para alegrarse en Él. Hoy también es un día que '
        'Él hizo para vos.',
  ),
  Promesa(
    texto: 'He aquí que en las palmas de las manos te tengo esculpida; '
        'delante de mí están siempre tus muros.',
    cita: 'Isaías 49:16',
    explicacion: 'Dios usa una imagen muy fuerte: tu nombre está grabado en '
        'sus manos. Es imposible que se olvide de vos. Estás siempre delante '
        'de sus ojos.',
  ),
  Promesa(
    texto: 'Jehová cumplirá su propósito en mí; tu misericordia, oh Jehová, '
        'es para siempre; no desampares la obra de tus manos.',
    cita: 'Salmos 138:8',
    explicacion: 'Dios tiene un propósito para tu vida y lo va a cumplir. Sos '
        'obra de sus manos, y Él no abandona lo que hace. Su misericordia no '
        'tiene fecha de vencimiento.',
  ),
  Promesa(
    texto: 'Y el Dios de esperanza os llene de todo gozo y paz en el creer, '
        'para que abundéis en esperanza por el poder del Espíritu Santo.',
    cita: 'Romanos 15:13',
    explicacion: 'Dios es llamado "el Dios de esperanza". Él quiere llenarte '
        'de gozo y de paz, y que la esperanza te sobre. No es algo que '
        'fabricás vos, es obra de su Espíritu.',
  ),
  Promesa(
    texto: 'Ellos dijeron: Cree en el Señor Jesucristo, y serás salvo, tú y '
        'tu casa.',
    cita: 'Hechos 16:31',
    explicacion: 'Pablo y Silas le respondieron esto a un carcelero '
        'desesperado, y esa misma noche toda su familia creyó. Podés orar hoy '
        'por los tuyos con esperanza.',
  ),
];

/// Colores de los papelitos, como en las cajitas de verdad.
const List<Color> coloresPapelitos = [
  Color(0xFFF7A8BC), // rosa
  Color(0xFF9FD3F0), // celeste
  Color(0xFFFFD86E), // amarillo
  Color(0xFFAEE0A4), // verde
  Color(0xFFCDB4F0), // lila
  Color(0xFFFFBC8A), // naranja
];
