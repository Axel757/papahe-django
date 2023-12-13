-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-12-2023 a las 15:03:31
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_papahe`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add product gas', 6, 'add_productgas'),
(22, 'Can change product gas', 6, 'change_productgas'),
(23, 'Can delete product gas', 6, 'delete_productgas'),
(24, 'Can view product gas', 6, 'view_productgas'),
(25, 'Can add product med', 7, 'add_productmed'),
(26, 'Can change product med', 7, 'change_productmed'),
(27, 'Can delete product med', 7, 'delete_productmed'),
(28, 'Can view product med', 7, 'view_productmed'),
(29, 'Can add catalogo', 8, 'add_catalogo'),
(30, 'Can change catalogo', 8, 'change_catalogo'),
(31, 'Can delete catalogo', 8, 'delete_catalogo'),
(32, 'Can view catalogo', 8, 'view_catalogo'),
(33, 'Can add user', 9, 'add_customuser'),
(34, 'Can change user', 9, 'change_customuser'),
(35, 'Can delete user', 9, 'delete_customuser'),
(36, 'Can view user', 9, 'view_customuser');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo_app_catalogo`
--

CREATE TABLE `catalogo_app_catalogo` (
  `id` bigint(20) NOT NULL,
  `catalogoType` tinyint(1) NOT NULL,
  `ProductGas_id` bigint(20) NOT NULL,
  `productMed_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo_app_customuser`
--

CREATE TABLE `catalogo_app_customuser` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `username` varchar(50) NOT NULL,
  `tipo_usuario` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `catalogo_app_customuser`
--

INSERT INTO `catalogo_app_customuser` (`id`, `password`, `last_login`, `is_superuser`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `username`, `tipo_usuario`) VALUES
(1, 'pbkdf2_sha256$600000$h1wC648JhfF4L7klocLl3N$bT6pcZ83Bh/1d3M3BECplSNSKiJ3RTdhMkxvPDC0FSs=', '2023-12-06 17:32:11.032596', 1, '', '', '', 1, 1, '2023-12-06 13:24:03.307878', 'Axel', 'administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo_app_customuser_groups`
--

CREATE TABLE `catalogo_app_customuser_groups` (
  `id` bigint(20) NOT NULL,
  `customuser_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo_app_customuser_user_permissions`
--

CREATE TABLE `catalogo_app_customuser_user_permissions` (
  `id` bigint(20) NOT NULL,
  `customuser_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo_app_productgas`
--

CREATE TABLE `catalogo_app_productgas` (
  `id` bigint(20) NOT NULL,
  `nombre` longtext NOT NULL,
  `imagen` varchar(100) NOT NULL,
  `precio` int(11) NOT NULL,
  `descripcion` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo_app_productmed`
--

CREATE TABLE `catalogo_app_productmed` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `imagen` varchar(100) NOT NULL,
  `farmacia` varchar(30) NOT NULL,
  `posologia` varchar(256) NOT NULL,
  `presentacion` varchar(50) NOT NULL,
  `ingredientes` varchar(256) NOT NULL,
  `descripcion` longtext NOT NULL,
  `categoria` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `catalogo_app_productmed`
--

INSERT INTO `catalogo_app_productmed` (`id`, `nombre`, `imagen`, `farmacia`, `posologia`, `presentacion`, `ingredientes`, `descripcion`, `categoria`) VALUES
(1, 'CALODREN', 'static/img/Papahe/productos_medicinales/Calodren_ucKGlRy.png', 'MADRE TIERRA', '1 cápsula minutos antes de tus comidas principales.', '30 cápsulas.', 'Chitosán, Glucomanan.', 'Dispositivo Médico formulado para captar y eliminar las grasas de la dieta diaria. Debido\r\na su alta densidad y rápida solubilidad, se adhiere a la grasa de la comida de manera efectiva siendo\r\nsólo necesario tomarlo minutos antes de tu comida principal. Los beneficios son inmediatos.', 'BAJAR DE PESO'),
(2, 'VINAGRE DE MANZANA', 'static/img/Papahe/productos_medicinales/Vinagredemanzana.png', 'AURA VITALIS', '3 Cápsulas diarias.', '90 cápsulas.', 'Vinagre de Manzana, Lecitina de Soya, C.M.C., Almidón.', 'Depurativo Intestinal, ayuda a combatir el estreñimiento, ya que las bacterias malignas\r\nmueren ante su contacto. Ayuda en la digestión de las grasas y posee gran poder saciador.', 'BAJAR DE PESO'),
(3, 'VINAGRE DE MANZANA 500ml', 'static/img/Papahe/productos_medicinales/Vinagredemanzana500cc.png', 'NATURALHERBAL', '1 chucharada mezclada en la ensalada o diluida en agua.', 'Botella 500 ml.', 'Vinagre de Manzana Orgánico.', 'Capacidad saciante, además, reduce la velocidad de digestión de los almidones. En general,\r\nretrasa la velocidad de vaciado gástrico, lo que disminuye la respuesta de la insulina después de comer. El\r\nácido acético protege de levaduras, bacterias y virus o incluso de patógenos como el E.Coli. Tiene capacidad\r\nantifúngica frente a la Cándida Albicans que da lugar a la Candidiasis cuando se desequilibra la flora intestinal\r\no el sistema inmune se descompensa.El pH del vinagre de manzana es parecido al de los ácidos del estómago,\r\nlo que hace hace que resulte más fácil la digestión de los alimentos. Ayuda a prevenir los gases y la sensación\r\nde inflamación.', 'BAJAR DE PESO'),
(4, 'LECITINA SOYA POTENCIADA', 'static/img/Papahe/productos_medicinales/leticinasoya.png', 'AURA VITALIS', '2 cápsulas diarias', '60 cápsulas.', 'Quitosano, Aloe Vera, Centella Asiática, Almidón.', 'Fibra natural de reconocida utilidad y efectividad en el tratamiento de la celulitis, ayuda a\r\ninhibir el apetito y quemar grasas acumuladas, además de propiedades antiinflamatorias y regeneradoras\r\nde tejido', 'BAJAR DE PESO'),
(5, 'CENTELLA CHITOSÁN', 'static/img/Papahe/productos_medicinales/centellachitosan.png', 'AURA VITALIS', '2 a 4 Cápsulas diarias.', '60 cápsulas.', 'Lecitina de Soya, Pomelo liofilizado.', 'Ayuda a proteger los órganos y las arterias de la acumulación de grasa. Las propiedades de\r\nla lecitina hacen apropiado su uso en regímenes de adelgazamiento ya que ayuda a movilizar los depósitos de grasas en el organismo, para facilitar la digestión ya que acelera y mejora la absorción intestinal,\r\npara proteger el hígado, disminuir el nivel de colesterol y facilitar la circulación sanguínea. Mejora los\r\nprocesos de aprendizaje e incrementa la memoria.', 'BAJAR DE PESO'),
(6, 'SPIRULINA', 'static/img/Papahe/productos_medicinales/spirulina.png', 'AURA VITALIS', '2 Cápsulas diarias', '60 cápsulas.', 'Spirulina.', 'Ideal y muy completa fuente de proteínas y aminoácidos. Su gran contenido de antioxidantes protege contra efectos de radicales libres. Fortalece las defensas y mantiene un metabolismo eficaz\r\ny natural. Reduce el colesterol, regula la presión y mantiene bajo el nivel de azúcar en la sangre, lo que\r\ncontribuye a bajar de peso. Contiene fenilalanina, por lo tanto, es un inhibidor natural del apetito.', 'BAJAR DE PESO'),
(7, '60/90 FAT BINDER', 'static/img/Papahe/productos_medicinales/fatbinder_v6Xci6i.png', 'MADRE TIERRA', '1 cap. antes de las comidas principales.', '60 cápsulas', 'Chitosan, Esterato de Magnesio.', '60/90 Fat Binder la nueva fórmula y dispositivo médico de alta pureza y biodisponibilidad\r\npara usarlo en programas de control del peso por medio de la reducción de la absorción de calorías y\r\ngrasas, en forma segura y 100 % natural.', 'BAJAR DE PESO'),
(8, '60/90 NOCTURNO', 'static/img/Papahe/productos_medicinales/fatbindernocturno_zgMmUqw.png', 'MADRE TIERRA', '2 Cápsulas al acostarse', '60 cápsulas.', 'Durvillaea Antártica micronizada, Hercarpuri, L-Arginina.', 'Está compuesto por ricos nutrientes, vitaminas, minerales y fibra dietética, estos ingredientes están dirigidos a las personas que deseen quemar grasa en forma termobólica, es decir, que requiera\r\naumentar el metabolismo, para asÍ producir la quema de los carbohidratos y controlar el peso de su\r\ncuerpo en forma 100% natural.', 'BAJAR DE PESO'),
(9, '60/90 - INFUSIÓN ORGÁNICA DETOX', 'static/img/Papahe/productos_medicinales/infunsionorganicadetox_W1EYe8Q.png', 'MADRE TIERRA', 'Infusionar 1 cucharada sopera por litro de agua hervida, enfriar, colar y beber como agua pasto.', 'envases de 100 g', 'Peumo, Menta, Marrubio, Alejandría, Yerba de la Plata, Sen, Manzanilla, Hinojo, Culén', '60/90 Infusión de hierbas Detox para depurar el organismo y complementar con programas de\r\nadelgazamiento o pérdida de peso. Es una mezcla de plantas medicinales especiales para ayudar al consumo\r\nhidrico que requiere nuestro cuerpo cada dia, dándonos los nutrientes necesarios para complementar los tratamientos de adelgazamiento y en personas que deseen tener un control de su peso diariamente.', 'BAJAR DE PESO'),
(10, 'INFUSIÓN N°1', 'static/img/Papahe/productos_medicinales/infusion1.png', 'NATURALHERBAL', 'Colocar 1 cucharada de la infusión en una taza y luego dejar caer hervida reposar 20 minutos, tomar después de la principales comidas del día', 'Bolsa 40 gr.', 'Salvia, Piche palo, Marrubio, Alejandria.', '(Adelgazante) Mezcla de hierbas que ayudan a eliminar líquidos, disminuyen la absorción de\r\ngrasas, además de regular al digestión.', 'BAJAR DE PESO'),
(11, 'TÉ MATCHA', 'static/img/Papahe/productos_medicinales/tematcha.png', 'NATURALHERBAL', '1 cucharadita de té para una taza. Toma 2-3 tazas de Matcha al día especialmente justo después de la comida.', 'Frasco 70 grs.', 'Té Matcha.', 'Ayuda en la pérdida de peso ya que es un un quemador de grasa, aumenta el metabolismo y\r\nquema calorías. Reduce el colesterol y azúcar en la sangre y no eleva los niveles de insulina ni la presión\r\narterial. Poderosa fuente de proteínas, nutrientes y antioxidantes. Además, cuenta con un polifenol denominado EGCG que ayuda a reducir el crecimiento de las células cancerígenas y acelera el metabolismo.\r\nTiene el triple de cafeína que el té convencional, motivo por el que es una gran elección para consumir por\r\nlas mañanas como sustitutivo del café, ya que proporciona un efecto muy similar, siendo más sano.', 'BAJAR DE PESO'),
(12, 'EUCAPOL', 'static/img/Papahe/productos_medicinales/ecuapol.png', 'AURA VITALIS', '1 Cucharada tres veces al día.', 'botella 200 gr', 'Miel de abejas, Jarabe de Maíz, Propóleo extracto, Esencia de Eucaliptus, Acido Cítrico, Acido Ascórbico, Propilenglicol.', 'Antibacteriano, cicatrizante natural y fluidificante. Su composición miel, propóleo y eucaliptus\r\nlo convierten en un potente suplemento que coadyuva en el tratamiento de los síntomas de la bronquitis e\r\ninfecciones respiratorias. Empleadas en el tratamiento de la disfonía y la tos, esta exhibe un efecto antipirético y\r\nexpectorante.', 'RESFRIADO'),
(13, 'PERSEA', 'static/img/Papahe/productos_medicinales/persea.png', 'AURA VITALIS', '1 Cucharada tres veces al día.', 'botella 200 gr.', 'Miel de abejas, Jarabe de Maíz, Propóleo extracto, Esencia de Eucaliptus, Acido Cítrico, Acido Ascórbico, Propilenglicol.', 'Antibacteriano, cicatrizante natural y fluidificante. Su composición miel, propóleo y eucaliptus\r\nlo convierten en un potente suplemento que coadyuva en el tratamiento de los síntomas de la bronquitis e\r\ninfecciones resp', 'RESFRIADO'),
(14, 'PROMIEL SPRAY', 'static/img/Papahe/productos_medicinales/promielspray.png', 'AURA VITALIS', 'Aplicar cada vez que sienta molestias.', 'Frasco 30 ml', ': Propóleo, Esencia de miel, Esencia Eucaliptus, Glicerina, Sucralosa, menthol.', 'Estimulante del sistema inmunológico para sentir la garganta fresca y despejada. Coadyuvante en estados gripales, alivia picazón, ardor y molestias de la garganta.', 'RESFRIADO'),
(15, 'AJOPOL', 'static/img/Papahe/productos_medicinales/ajopol.png', 'AURA VITALIS', '20 gotas tres veces al día en agua tibia / Niños: 10 gotas tres veces al día en agua tibia.', 'Botella 15 ml.', 'Ajo, Propóleo.', 'Es eficaz como antibiótico, combatiendo numerosos hongos, bacterias y virus. Entrega propiedades que coadyuvan estimulando el sistema inmune, previniendo y tratando problemas como: catarros, gripe,\r\nresfríos, laringitis, bronquitis, asma bronquial, dada su composición donde posee propiedades bacteriostáticas,\r\nbactericidas y fúngicas, anestésicas, cicatrizantes, antirreumáticas y antibióticas.', 'RESFRIADO'),
(16, 'PROPOLEO', 'static/img/Papahe/productos_medicinales/propoleo.png', 'S.E.L.F', '10 gotas dos veces al día en agua tibia.', 'Botella 30 ml.', 'Propoleo puro.', 'Entrega propiedades que coadyuvan estimulando el sistema inmune, previniendo y tratando problemas como: catarros, gripe, resfríos, laringitis, bronquitis, asma bronquial, dada su composición donde posee\r\npropiedades bacteriostáticas, bactericidas y fúngicas, anestésicas, cicatrizantes, antirreumáticas y antibióticas.\r\nPor esto puede usarse como coadyuvante en acné y herpes simples, aftas, heridas, y como regenerador del\r\ntejido celular. Su ingesta coadyuva en los procesos antisépticos de la mucosa bucal, También aumenta las\r\ndefensas generadas por el estrés diario.', 'RESFRIADO'),
(17, 'SECRETOS DE LA MACHI N° 12', 'static/img/Papahe/productos_medicinales/secretosdelamachi.png', 'VALLE DEL SOL', 'Tomar 20 gotas 3 veces al día disueltas en agua.', 'Botella 30 ml.', 'Propóleo.', 'Es para las afecciones respiratorias con tos sofocante y con cosquilleo en la garganta. Estas\r\nhierbas junto al propóleo son muy usadas por la medicina tradional chilena para este tipo de afecciones.', 'RESFRIADO'),
(18, 'SECRETOS DE LA MACHI N° 13', 'static/img/Papahe/productos_medicinales/secretosdelamachi13.png', 'VALLE DEL SOL', 'Tomar 20 gotas 3 veces al día disueltas en agua', 'Botella 30 ml.', 'Canelo, Sauce Blanco, Propoleo, Palqui.', 'las Machis dan estas hierbas junto al propóleo para combatir la fiebre, indicado para estados\r\ngripales y romadizo (coriza).', 'RESFRIADO'),
(19, 'INFUSIÓN N°3', 'static/img/Papahe/productos_medicinales/infusion3.png', 'NATURALHERBAL', 'Colocar 4 cucharada en 1 litro de agua hervida coloque miel de abejas a gusto y el jugo de 2 limones tome como bebida durante el día.', 'Bolsa 40 gr', 'Ortiga, Sauco, Palto, Tilo, Eucalipto, Tusilago.', '(Pectoral) Mezcla de hierbas que se utiliza para el tratamiento de la bronquitas, congestiones e\r\ninfecciones respiratorias. Antitusiva y expectorante.', 'RESFRIADO'),
(20, 'FLORES PECTORALES', 'static/img/Papahe/productos_medicinales/florespectorales.png', 'NATURALHERBAL', ': La infusión se prepara con 1 cucharada del vegetal para 1 litro de agua recién hervida; beber 1 taza 3 veces en el día. Endulzar con miel.', 'Bolsa 40 gr.', 'Flores Pectorales.', 'Combinación de varias plantas medicinales que le ayudan a combatir gripes y resfriados mediante\r\nsu acción expectorante y antitusígena.', 'RESFRIADO'),
(21, 'CRANBERRY', 'static/img/Papahe/productos_medicinales/cranberry.png', 'MADRE TIERRA', '1 cápsula cada 12 horas', '60 cápsulas', 'Cranberry (Arándano).', 'Infecciones urinarias. Ayuda a las defensas y absorción del hierro.', 'INFECCION URINARIA'),
(22, 'CRANBERRY REFORZADO', 'static/img/Papahe/productos_medicinales/cranberryreforzado.png', 'AURA VITALIS', '3 cápsulas diarias el primer mes. Luego 2 cápsulas diarias.', '60 cápsulas.', 'Cranberries (Arándano), Uva Ursi.', 'El Cranberry es un tipo de arándano con un fruto pequeño que posee propiedades adecuadas para el tratamiento de las infecciones urinarias bajas resistentes, crónicas y recurrentes. Contiene\r\ntres ácidos orgánicos: Químico, Málico y Cítrico. Los cuales son coadyuvantes en la prevención de las\r\ninfecciones urinarias.', 'INFECCION URINARIA'),
(23, 'SECRETOS DE LA MACHI N° 21', 'static/img/Papahe/productos_medicinales/secretosdelamachin21.png', 'VALLE DEL SOL', 'Tomar 20 gotas 3 veces al día disueltas en agua.', 'Botella 30 ml.', 'Arándano.', 'El Cranberry impide que las bacterias se adhieran a las células epiteliales (células de la piel)\r\ndel tracto urinario, reduciendo el riesgo de infecciones', 'INFECCION URINARIA'),
(24, 'COLA DE CABALLO', 'static/img/Papahe/productos_medicinales/coladecaballo.png', 'NATURALHERBAL', 'Poner una cucharada en 1 taza y dejar caer el agua hervida.', 'Bolsa 40 gr.', 'Cola de caballo en hierba', 'Combate las inflamaciones del tracto urinario, además de ser un importante diurético natural.', 'INFECCION URINARIA'),
(25, 'CÁPSULAS GRIEGAS', 'static/img/Papahe/productos_medicinales/capsulasgriegas.png', 'MADRE TIERRA', '1 capsula después del desayuno.', '30 cápsulas.', 'Ajo, Perejil, Rosa Mosqueta, Levadura de Cerveza, Calcio de Ostras.', 'Complemento alimenticio para tratamientos a las afecciones graves, agudas o crónicas del\r\ntracto respiratorio; resfríos constantes, tos, bronquitis, asma, sinusitis, alergias respiratorias, debiendo a\r\nque esta refuerza el sistema inmunológico y despeja todas las vías respiratorias de niños y adultos.', 'MULTIVITAMÍNICO'),
(26, 'VITAMINA C', 'static/img/Papahe/productos_medicinales/vitaminac.png', 'AURA VITALIS', '3 Cápsulas diarias.', '90 cápsulas.', 'Acido Ascórbico.', 'Coadyuva a prevenir enfermedades degenerativas. Ayuda a mantener cartílagos, huesos\r\ny dientes. Eficaz para la cicatrización. Previene enfermedades cardíacas. Suaviza efectos de resfríos.\r\nCombate el estrés oxidativo.', 'MULTIVITAMÍNICO'),
(27, 'VITAMINA D3', 'static/img/Papahe/productos_medicinales/vitaminad3.png', 'AURA VITALIS', '2 cápsulas diarias.', '60 cápsulas.', 'Vitamina D3 800 UI.', 'Coadyuva al organismo a absorber el calcio, magnesio y fósforo, principales elementos que\r\nconstituyen los huesos. Es importante para el sistema nervioso fortalece el sistema inmune. Ayuda a fortalecer los huesos y dientes, haciéndolos más sanos. Previene enfermedades como la obesidad, la diabetes,\r\nla hipertensión y la esclerósis múltiple. Aumenta la producción de músculo', 'MULTIVITAMÍNICO'),
(28, 'VIVO PAX', 'static/img/Papahe/productos_medicinales/vivopax.png', 'VALLE DEL SOL', '2 cápsulas en ayuna', '60 cápsulas.', 'Lecitina de soya, Levadura de cerveza, Vitaminas, A, B1,B2,B6,B12,D,E, Niacina, Calcio, Fósforo, Magnesio, Hierro, Potasio, Zinc, Extracto seco de Noni.', 'Multivitamínico que está compuesto por 3 cepas probióticas especialmente seleccionadas,\r\n12 vitaminas y 10 minerales. Activador del sistema inmune con probióticos, estimula las defensas fortaleciendo el organismo evitando las enfermedades asociadas al estrés y agotamiento', 'MULTIVITAMÍNICO'),
(29, 'MAQUI PRO', 'static/img/Papahe/productos_medicinales/maquipro.png', 'AURA VITALIS', '4 cápsulas diarias', '120 cápsulas 240 mg', 'Pulpa de Noni Pulverizado, Maqui, Vitamina C, Vitamina E', 'Contribuye a la pérdida de peso. Depurador del intestino. Coadyuva a mejorar los niveles de\r\ninsulina y disminuye la cantidad de azúcar en la sangre. Actúa como antiinflamatorio y analgésico. Antioxidante. Tiene propiedades termogénicas en la cual aumenta la temperatura del cuerpo. Además permite\r\nlimpiar los riñones y las vías urinarias. Previene enfermedades cardiovasculares, reduce el colesterol.\r\nEstimula las defensas.', 'MULTIVITAMÍNICO'),
(30, 'GRAVIOLA', 'static/img/Papahe/productos_medicinales/graviola.png', 'AURA VITALIS', '3 Cápsulas diarias', '90 cápsulas.', 'Graviola Pulpa deshidratada.', 'Aporta un efecto citotóxico en diversos tipos de tumores malignos, pero sin atacar ninguna de\r\nlas células sanas y destaca por su alto contenido de acetogenina, cuya sustancia es semejante a la adriomicina que se usa normalmente en las químioterapias. Antibacteriano, antiparasitario y sedativo. Fortalece\r\nel sistema inmunológico. Ayuda al organismo a regenerarse celularmente. Regula la presión arterial. Se\r\nutiliza mucho en estados de ansiedad, depresión y nerviosismo. Corrige desordenes del hígado.', 'MULTIVITAMÍNICO'),
(31, 'POLEN', 'static/img/Papahe/productos_medicinales/polen.png', 'S.E.L.F', '1 Cucharadita de té con frutas o yogurth.', 'Pote de 250gr', 'Polen de Abeja (V región)', 'ALIMENTO ENERGIZANTE. Contiene 25% de proteína, es bajo en grasa y sodio. Es fuente de\r\nácido fólico, riboflavina, tiamina, niacina, pridoxina, que son todas vitaminas del complejo B. También aporta\r\nvitamina D, E, K, A, inositol y colina. Y entre los minerales que contiene están el fósforo, calcio, potasio, yodo,\r\nzinc, cobre, magnesio y selenio. Excelente fuente de proteína vegetariana, ya que contiene más aminoácidos que\r\nlos presentes en la leche, queso, carne y huevos.', 'MULTIVITAMÍNICO'),
(32, 'ZINC', 'static/img/Papahe/productos_medicinales/zinc.png', 'NATURALHERBAL', '2 cápsulas diarias', '60 Cápsulas 210 mg.', 'Sulfato de Zinc.', 'Es necesario para que el sistema de defensa del cuerpo (sistema inmunitario) funcione apropiadamente. Participa en la división y el crecimiento de las células, al igual que en la cicatrización de heridas y en el\r\nmetabolismo de los carbohidratos.', 'MULTIVITAMÍNICO'),
(33, 'LEVADURA CERVEZA', 'static/img/Papahe/productos_medicinales/levaduracereza.png', 'AURA VITALIS', '2 a 4 Cápsulas diarias', '60 cápsulas 390 mg.', 'Levadura de Cerveza.', 'Completo aporte del complejo vitamínico B. Excelente alimento nutritivo en estados carenciales, convalecencia y períodos de desarrollo. Es ideal como suplemento en dietas vegetarianas debido a que\r\nposee las proteínas que este tipo de alimentación no aporta.', 'MULTIVITAMÍNICO'),
(34, 'SECRETOS DE LA MACHI N° 7', 'static/img/Papahe/productos_medicinales/secretosmachi7.png', 'VALLE DEL SOL', 'Tomar 20 gotas 3 veces al día disueltas en agua.', 'Botella 30 ml.', 'Guaraná, Noni, Maqui, Quinoa.', 'El guaraná del Brasil contiene teobromina que ayuda a estimular el sistema nervioso. En el\r\ncaribe el Noni es un fruto muy conocido como tónico y los Mapuche tienen el Maqui como segunda planta\r\nsagrada. Por último la Quinoa es un cereal muy apreciado por este pueblo.', 'MULTIVITAMÍNICO'),
(35, 'MORINGA', 'static/img/Papahe/productos_medicinales/moringa.png', 'AURA VITALIS', '2 Cápsulas diarias', '90 cápsulas.', 'Moringa (Moringa Oleifera).', 'Potente antioxidante formulado para pacientes con problemas cardio-vascular y sistema\r\ninmunitario, un gran desintoxicante natural con alto grado vitamínico: Vitamina A, Vitamina C, Vitamina E del\r\ngrupo B. Entre los minerales se destacan por su alta concentración el calcio (17 veces más que la leche)\r\ny el hierro, seguidos por el zinc, el magnesio y el potasio, también contiene aminoácidos. Su consumo\r\ncontribuye a la agilidad mental, refuerza el sistema inmunológico y ayuda a reducir la presión arterial.', 'MULTIVITAMÍNICO'),
(36, 'LEVEL UP', 'static/img/Papahe/productos_medicinales/levelup.png', 'MADRE TIERRA', '1 tableta en ayunas.', '30 tabletas 0,805 G.', 'Raíces adaptogénicas, panax ginseng (ginseng rojo coreano), betacaroteno, vitamina E, magnesio, perejil, lecitina de soya, levadura de cerveza, SIN LACTOSA, enriquecido en selenio y magnesio.', 'Energizante Anti-stress y revitalizador del sistema nervioso. Especialmente sugerido para\r\npersonas con cansancio o agotamiento y que lo sufren en forma frecuente, con sensación de estar cansado y débil, afectando el ánimo en las tareas diarias, ya sea en nuestro trabajo o en nuestro hogar.', 'ENERGIZANTES'),
(37, 'LEVEL UP INFANTIL', 'static/img/Papahe/productos_medicinales/levelupinfantil.png', 'MADRE TIERRA', '1 cucharadita diaria en la mañana.', '195 ml.', ': Miel, jalea real, estracto de alfalfa, estracto de avena, levadura de cerveza, vitamina C.', 'Niños con síndrome de déficit atencional e hiperactividad.', 'ENERGIZANTES'),
(38, 'MK 500 (MACA)', 'static/img/Papahe/productos_medicinales/mk500.png', 'NATURALHERBAL', '2 cápsulas en ayuna', '60 cápsulas 500 MG.', 'Maca Peruana', 'Es muy revitalizante, aumenta la resistencia física y disminuye los efectos del estrés y la\r\nfatiga. Favorece, además, el buen estado de ánimo. Mejora la memoria, la concentración y el aprendizaje\r\nmás que ninguna otra maca. Aumenta la fertilidad, puesto que incrementa el número de espermatozoides\r\ny su movilidad. Aparte de ser un gran multivitamínico.', 'ENERGIZANTES'),
(39, 'SECRETOS DE LA MACHI N° 18', 'static/img/Papahe/productos_medicinales/secretosmachi18.png', 'VALLE DEL SOL', 'Tomar 20 gotas 3 veces al día disueltas en agua.', 'Botella 30 ml.', 'Schizandra, Guarana, Ginseng.', 'Esta gota actua mejorando el vigor aumenta la energía y estimula el sistema nervioso central,\r\nmejora la resistencia a la fatiga. Estos adaptogenos generan adaptación al medio y son conocidos en todo\r\nel mundo por poseer estas nobles propiedades', 'ENERGIZANTES'),
(40, 'VICOLON', 'static/img/Papahe/productos_medicinales/vicolon.png', 'MADRE TIERRA', '10 gotas 2 veces al día', 'Frasco 30 ml', 'Rábano negro, Menta y Manzanilla.', 'Su Combinación filo terapéutica ayuda a combatir los trastornornos del colon irritado, tales\r\ncomo hinchazón, gases, mal aliento, sequedad de la boca, sensacion de evacuacion incompleta, meteorismo, etc. ya que contiene plantas medicinales reconocida por todo el mundo como calmante, digestiva,\r\nantiespasmódica, depurativas y sedante del sistema gastro intestinal.', 'COLON'),
(41, 'VICOLON CON PROBIÓTICOS', 'static/img/Papahe/productos_medicinales/vicolonprobioticos.png', 'MADRE TIERRA', '1 cáp. a 11:00 am y 1 cáp. a 17:00 pm', '60 cápsulas 367 mg.', 'Inulina (Fos), Lactobacillus Cesei, Lactobacillus Lactis, Bifidobacterium', 'Especialmente facilita la absorción de nutrientes y fortalece el sistema inmunológico en\r\nnuestro cuerpo. Ayuda a combatir tanto los problemas del colon irritable como problema gástricos.', 'COLON'),
(42, 'COLON VITALIS', 'static/img/Papahe/productos_medicinales/colonvitalis.png', 'AURA VITALIS', '3 cápsulas diarias.', '90 cápsulas 215 mg.', 'Manzanilla, Llantén, Salvia, Sauco, Matico, Bailahuen, Boldo.', 'Coadyuvante y complemento ideal en trastornos de colon irritable, gastritis, mala digestión y\r\ntrastornos de origen nervioso.', 'COLON'),
(45, 'COLON VITALIS (gotas)', 'static/img/Papahe/productos_medicinales/colonvitalisgotas_PYpHbzb.png', 'AURA VITALIS', '20 a 30 gotas tres veces al día.', 'Botella 30 ml.', 'Menta, Verbena, Manzanilla, Boldo, Salvia, Llantén, Jarabe Sacarosa, Esencia Caramelo, Goma Xantán, Metilparabeno, Propilparabeno.', 'Coadyuvante y complemento ideal en trastornos de colon irritable, gastritis, mala digestión y\r\ntrastornos de origen nervioso', 'COLON'),
(46, 'SECRETOS DE LA MACHI N° 4', 'static/img/Papahe/productos_medicinales/secretosmachi4.png', 'VALLE DEL SOL', 'Tomar 20 gotas 3 veces al día disueltas en agua.', 'Botella 30 ml.', 'Melissa, Bailahuen, Corteza de Quina, Paico.', 'En Chile las Meicas Siempre han mezclado hierbas como estas para las personas que\r\nsufren colon irritable, acumulan muchos gases y que sufren por vientre hinchado y doloroso.', 'COLON'),
(47, 'INFUSIÓN N°10', 'static/img/Papahe/productos_medicinales/infusion10.png', 'NATURALHERBAL', 'Poner una cucharada en 1 taza y dejar caer el agua hervida.', 'Bolsa 40 gr.', 'Melissa, Boldo, Manzanilla, Llantén, Mentha.', '(Colon) Impide la inflamación del colon, lo relaja y ayuda en su adecuado funcionamiento,\r\npermite una mejor digestión después de las comidas.', 'COLON'),
(48, 'BOLDO', 'static/img/Papahe/productos_medicinales/boldo.png', 'NATURALHERBAL', '1 cucharada para 1 litro de agua hirviendo: beber 1 taza 3 veces al día.', 'Bolsa 40 gr.', 'Hojas de boldo.', 'anti-inflamatorio, protector hepático, digestivo, desinflamador del colon irritado, se usa en\r\nmolestias gastrointestinales.', 'COLON'),
(49, 'MANZANILLA', 'static/img/Papahe/productos_medicinales/manzanilla.png', 'NATURALHERBAL', 'Una cucharada de flores para 1 litro agua recién hervida; dejar reposar, filtrar y beber 1 taza 3 veces al día.', 'Bolsa 40 gr.', 'Manzanilla en hierba.', 'Trastornos digestivos (dolor de estómago, indigestión, digestiones difíciles de tipo crónico\r\n(dispepsia), cólicos, flatulencia, diarreas); afecciones de las vías urinarias (cistitis o inflamación de la\r\nvejiga); dolores menstruales; insomnio.', 'COLON'),
(50, 'UL-C GASTRI', 'static/img/Papahe/productos_medicinales/ul-c_gastri.png', 'AURA VITALIS', '2 cápsulas diarias.', '60 cápsulas 325 mg.', 'Bailahuén, Matico, Alcachofa, Boldo, Diente de León, Chanca Piedra, Menta, Propóleo, Melisa, Ulmaria, Manzanilla, Llantén, Sangre de Grado, Lactobacillus, Almidón.', 'Contribuye a eliminar síntomas como: gastritis, úlceras gástricas, acidez, reflujos, dolor\r\nabdominal, hinchazón, ardor y malestares digestivos.', 'GÁSTRICOS'),
(51, 'ALOE VERA GEL', 'static/img/Papahe/productos_medicinales/aloeveragel.png', 'VALLE DEL SOL', '2 cucharadas diluidas en jugo o agua en ayunas.', 'Botella 1 lt y de 500 ml.', 'Gel de Aloe Vera.', 'Reconstruye la flora intestinal, protege la mucosa del estómago, ayuda a prevenir las úlceras\r\nestomacales y gastritis las calma si ya se han producido. Además, favorece la absorción de los nutrientes\r\npor lo que hace las digestiones más ligeras y controla los gases y las flatulencias. Favorece la cicatrización\r\nde heridas.', 'GÁSTRICOS'),
(52, 'ALOE VERA CON OPUNTIA GEL', 'static/img/Papahe/productos_medicinales/aloeveraconopuntiagel.png', 'VALLE DEL SOL', '2 cucharadas diluidas en jugo o agua en ayunas.', 'Botella 1 lt.', 'Gel de Aloe Vera.', 'Reconstruye la flora intestinal, protege la mucosa del estómago, ayuda a prevenir las úlceras\r\nestomacales y gastritis las calma si ya se han producido. Además, favorece la absorción de los nutrientes\r\npor lo que hace las digestiones más ligeras y controla los gases y las flatulencias. Favorece la cicatrización\r\nde heridas. La pulpa de Opuntia (nopal) cuyo mucilago tiene el poder de adherirse a la pared gástrica de\r\nmanera reversible protegiendo de esta forma el estómago. Ideal para personas que sufren de gastritis o\r\núlceras.', 'GÁSTRICOS'),
(53, 'SECRETOS DE LA MACHI N° 5', 'static/img/Papahe/productos_medicinales/secretosmachi5.png', 'VALLE DEL SOL', 'Tomar 20 gotas 3 veces al día disueltas en agua', 'Botella 30 ml.', 'Opuntia, LLanten, Matico, Sangre de Grado.', 'El Mapuche recurre a estas hierbas cuando le duele la boca del estomago, tiene ardor,\r\nreflujo, sintomas de gastritis y ulceras gastricas.', 'GÁSTRICOS'),
(54, 'INFUSIÓN N°5', 'static/img/Papahe/productos_medicinales/infunsion5.png', 'NATURALHERBAL', 'Poner una cucharada en 1 taza y dejar caer el agua hervida.', 'Bolsa 40 gr.', 'Ajenjo, Manzanilla, Boldo, Melissa, Mentha.', '(Gástrica) Gracias a sus componente es excelente para el tratamiento de los síntomas de la\r\ngastritis, malestares estomacales, pesadez estomacal.', 'GÁSTRICOS'),
(55, 'ALOE VERA', 'static/img/Papahe/productos_medicinales/aloevera.png', 'VALLE DEL SOL', '2 cápsulas al acostarse.', '60 cápsulas 250 mg', 'Aloe Vera.', 'Ayudan a mejorar el tránsito gastrointestinal, estreñimiento, transito lento.', 'ESTREÑIMIENTO'),
(56, 'ALOE + LINAZA', 'static/img/Papahe/productos_medicinales/aloelinaza.png', 'NATURALHERBAL', '2 cápsulas al acostarse.', '60 cápsulas 500 mg.', 'Aloe vera desidratado, semillas de linaza polvo.', 'Ayudan a mejorar el tránsito gastrointestinal y disminuir las molestias al colon', 'ESTREÑIMIENTO'),
(57, 'SECRETOS DE LA MACHI N° 14', 'static/img/Papahe/productos_medicinales/secretosmachi14.png', 'VALLE DEL SOL', 'Tomar 1 ves al día, según necesidad tomar entre 20 y 40 gotas en la noche', 'Botella 30 ml.', 'Trique, Palo Negro', 'Estreñimiento, constipación, irritación y transito lento del colon', 'ESTREÑIMIENTO'),
(58, 'ALEJANDRÍA', 'static/img/Papahe/productos_medicinales/alejandrias.png', 'NATURALHERBAL', 'Para uso laxante se prepara con 1 cucharada de hojas para una taza de agua recién hervida: beber 1 taza al día. Si se desea como purgante, poner una cucharadita de Alejandría en 1 taza de agua fresca, dejar macerando toda la noche y beber en ayunas', 'Bolsa 40 gr.', 'Alejandria en hoja.', '(Laxante) Usos tradicionales: estreñimiento, fisura anal, hemorroides y otras afecciones\r\nrecto-anales, purgante.', 'ESTREÑIMIENTO'),
(59, 'TRANKY', 'static/img/Papahe/productos_medicinales/tranky.png', 'MADRE TIERRA', 'Tomar 1 comprimido por día', '30 comprimidos 0,36 g.', 'L triptófano, vitamina d3, vitamina b 12, arándanos, magnesio, vitamina b6.', 'TRANKY es todo lo que se necesita para enfrentar estos días tan convulsionados que afectan nuestro equilibrio mental y físico, apareciendo irremediablemente trastornos como son la ansiedad, la\r\nirritabilidad, el nerviosismo, la depresión y el mal dormir afectando nuestro estado de animo durante el día.', 'TRANQUILIZANTES'),
(60, 'NERVIOVITA', 'static/img/Papahe/productos_medicinales/nerviovita.png', 'AURA VITALIS', '2 Cápsulas diarias.', '60 cápsulas 215 mg', 'Melisa, Regaliz, Naranjo, Avena, Verbena, Lavanda, Betonica, Anís.', 'Tranquilizante natural, incrementa la duración y calidad del sueño, solucionando los problemas de insomnio sin crear dependencia y efectos secuandarios. Es eficaz para la tensión nerviosa, la\r\nirritabilidad e impaciencia, produciendo una sensación de bienestar', 'TRANQUILIZANTES'),
(61, 'NERVIOVITA (Gotas)', 'static/img/Papahe/productos_medicinales/nerviovitagotas.png', 'AURA VITALIS', '20 a 30 gotas 3 veces al día', 'Botella 30 ml.', 'Melisa, Verbena, Naranjo, Avena, Lavanda.', 'Tranquilizante natural, incrementa la duración y calidad del sueño, solucionando los problemas de insomnio sin crear dependencia y efectos secuandarios. Es eficaz para la tensión nerviosa, la\r\nirritabilidad e impaciencia, produciendo una sensación de bienestar.', 'TRANQUILIZANTES'),
(62, 'MELVALPASS', 'static/img/Papahe/productos_medicinales/melvalpass.png', 'NATURALHERBAL', '1 cápsula cada 12 hrs', '60 cápsulas de 500 MG', 'Melissa, Valeriana, Salvia', 'Tranquilizante, relajante para el sistema nervioso, ideal para insomnio y estrés, gracias a su\r\nmezcla de Melissa, Valeriana y Salvia, lo convierte en un potente remedio para fuertes grados de estres,\r\nansiedad incluso para relajar musculatura tensionada por el estrés.', 'TRANQUILIZANTES'),
(63, 'MELISSA', 'static/img/Papahe/productos_medicinales/melissa.png', 'NATURALHERBAL', '1 cápsula cada 12 hrs.', '60 cápsulas de 500 mg.', 'Melissa.', 'La melisa constituye uno de los mejores remedios contra los problemas de los nervios, tanto\r\nen aquellas situaciones de desasosiego personal como cuando esta inquietud tiene su reflejo en alguna\r\nparte del organismo, produciendo reacciones desagradables. Tradicionalmente, ha tenido muy buena fama\r\ncomo planta tranquilizante, especialmente cuando formaba parte de la composición del ”agua de melisa de\r\nlos Carmelitas Descalzos”. La melisa es un sedante reconocido.', 'TRANQUILIZANTES'),
(64, 'CONTINNUM', 'static/img/Papahe/productos_medicinales/continnum.png', 'MADRE TIERRA', '1 cápsula al atardece.', '30 cápsulas 200 mg.', 'Hierba de San Juan, Magnesio.', 'Especial para personas que sufren depresión, falta de ánimo o de alguna dolencia producida\r\npor los trastornos depresivos. Su formula acompaña a sus tratamintos tradicionales cuando sufre problemas de angustia, síntomas de ansiedad, crisis de panico, angustia y depresión.', 'TRANQUILIZANTES'),
(65, 'SECRETOS DE LA MACHI N° 1 (', 'static/img/Papahe/productos_medicinales/secretosmachi1.png', 'VALLE DEL SOL', 'Tomar 20 gotas 3 veces al día disueltas en agua.', 'Botella 30 ml.', 'Melissa, Naranjo, Salvia Avena Sativa, Flor de Tilo', 'Esta receta está hecha a base de hierbas que son usadas dede los tiempos de los Mapuches, para tranquilizar los nervios y tener un sueño reparador', 'TRANQUILIZANTES'),
(66, 'INFUSIÓN N°8', 'static/img/Papahe/productos_medicinales/infusion8.png', 'NATURALHERBAL', 'Poner una cucharada de en 1 taza y dejar caer el agua hervida', 'Bolsa 40 gr.', 'Melissa, Salvia, Naranjo, Mentha', '(Relajante) Ayuda a relajar, calmar, mejorar el sueño, ideal para tratamientos depresivos y de\r\nsistema nervioso alterado.', 'TRANQUILIZANTES'),
(68, 'MELISSA (Bolsa)', 'static/img/Papahe/productos_medicinales/melissainfusion_viQg7H2.png', 'NATURALHERBAL', '1 cucharada del vegetal para 1 litro de agua recién hervida: beber 1 taza 3 veces al día.', 'Bolsa 40 gr.', 'Melissa', 'Afecciones nerviosas (depresión, nerviosismo, palpitaciones, insomnio); dolor de cabeza; molestias\r\nestomacales y respiratorias.', 'TRANQUILIZANTES'),
(69, '9:30 PM', 'static/img/Papahe/productos_medicinales/930pm.png', 'MADRE TIERRA', '1 Cápsula 19:00 pm.', '30 Cápsulas 177 mg', 'Melissa, Naranjo, San Juan, Romero Castilla', 'Para el insomnio provocado por el estrés nocturno. 9:30 PM acompaña a superar la falta de\r\nsueño afecta muy seriamente a la parte emocional del cerebro y nos hace más propensos a las depresiones y a las enfermedades mentales.', 'INSOMNIO'),
(70, 'SOMNO-CURE', 'static/img/Papahe/productos_medicinales/somno-cure.png', 'AURA VITALIS', '2 Cápsulas al acostarse.', '60 cápsulas 207 mg.', 'Melisa, Naranjo, Amapola, Salvia, Lavanda, Scutellaria', 'Considerado un sedante natural, debido a su rol como calmante nervioso. Utilizado en casos\r\nde estrés para conseguir una total relajación del sistema nervioso. Ayuda a disminuir la actividad del sistema nervioso, mejorar la calidad del sueño, aumenta la relajación y mejora el estado de ánimo.', 'INSOMNIO'),
(71, 'HYPERICUM (SAN JUAN)', 'static/img/Papahe/productos_medicinales/hypericum.png', 'NATURALHERBAL', '1 cucharada del vegetal para 1 litro de agua recién hervida: beber 1 taza 3 veces al día.', 'Bolsa 40 gr.', 'San Juan (Hypericum)', 'Depresión, ansiedad, nerviosismo, insomios, ayuda a tranquilizar, relajar y tener un mejor\r\ndormir.', 'INSOMNIO'),
(72, 'KARTIFLEX', 'static/img/Papahe/productos_medicinales/kartiflex.png', 'AURA VITALIS', '1 cápsula cada 12 hrs', '60 cápsulas 320 mg', 'Perna Canaliculus (Mejillón de Labio Verde), Cúrcuma, Colágeno Hidrolizado.', 'Aumenta el líquido sinovial de las articulaciones. Regenera y fortalece huesos, articulaciones\r\ny arterias. El Colágeno es una proteína que rodea algunos órganos o parte de ellos con la finalidad de\r\nprotegerlos, mantener la elasticidad y la estructura del tejido. Es indispensable en el mantenimiento de los\r\ntejidos cartilaginosos o para estimular su formación.', 'REUMÁTICOS'),
(73, 'FLEXIARTICULAR', 'static/img/Papahe/productos_medicinales/flexiarticular.png', 'MADRE TIERRA', '2 cápsulas con el almuerzo.', '60 cápsulas 31,1 g.', 'Sauce Blanco, Chuchuhuasi, Colágeno Hidrolizado, Romero, Vitamina C, Óxido de Magnesio, Vitamina B6', 'Para inflamaciones de articulaciones, potenciado con magnesio y colágeno, indicado\r\npara deportistas y personas que sufren inflamación en sus articulaciones. Dolencias osteo articulares\r\ndonde un malestar en distintas zonas de nuestro cuerpo algunas veces llegan a ser invalidante, el reumatismo, cartílagos gastados, tendinitis entre otras afecciones dolorosas, nos producen diariamente graves\r\nproblemas de movilidad.', 'REUMÁTICOS'),
(74, 'FLEXIARTICULAR FORTE', 'static/img/Papahe/productos_medicinales/flexiarticularforte.png', 'AURA VITALIS', '1 cápsula cada 12 hrs.', '60 cápsulas 377 mg.', 'Sauce Blanco, Chuchuhuasi, Colágeno Hidrolizado, Romero, Vitamina C, Magnesio, Vitamina B6, Curcuma.', 'Para problemas de articulaciones, artrosis, artritis y reumatismo. Hoy las dolencias osteo articulares donde el dolor de huesos, reumatismo, cartílagos gastados, de articulaciones y a quienes padecen\r\nde artritis, artrosis, ciática, osteoporosis y osteomielitis, fibrosis, gota, tendinitis entre otras afecciones\r\ndolorosas, nos producen diariamente graves problemas de movilidad.', 'REUMÁTICOS'),
(75, 'CURCUMA', 'static/img/Papahe/productos_medicinales/curcuma.png', 'AURA VITALIS', '3 Cápsulas diarias.', '120 Cápsulas 320 mg.', 'Cúrcuma.', 'La Cúrcuma tiene potentes propiedades antiinflamatorias sobre el organismo gracias a su alto contenido de Curcuminoides. Es muy adecuada en el tratamiento natural para mejorar síntomas de rigidez, inflamación articular y movilidad.', 'REUMÁTICOS'),
(76, 'SECRETOS DE LA MACHI N° 6', 'static/img/Papahe/productos_medicinales/secretosmachi6.png', 'VALLE DEL SOL', 'Tomar 20 gotas 3 veces al día disueltas en agua.', 'Botella 30 ml.', 'Guayacan, Sauce Blanco, Canelo.', 'El canelo es la planta sagrada de de la cultura Mapuche, que junto al guayacan y el sauce\r\nblanco se han usado por milenios para mitigar el dolor.', 'REUMÁTICOS'),
(77, 'POTASIO', 'static/img/Papahe/productos_medicinales/potasio.png', 'NATURALHERBAL', '1 cápsula cada 12 hrs', '60 Cápsulas 600 mg', 'Potacio.', 'Algunas de sus funciones son su intervención en el funcionamiento neuromuscular y también\r\nayuda en la transmisión del flujo nervioso. Este mineral es esencial porque realiza funciones básicas en\r\nel organismo, como la regulación del agua dentro y fuera de las células. En equilibrio con el calcio y el\r\nmagnesio, regula todas las funciones celulares y a la excitabilidad del corazón, del sistema nervioso y de\r\nlos músculos.', 'REUMÁTICOS'),
(78, 'SECRETOS DE LA MACHI N° 16', 'static/img/Papahe/productos_medicinales/secretosmachi16.png', 'VALLE DEL SOL', 'Tomar 20 gotas 3 veces al día disueltas en agua.', 'Botella 30 ml.', 'Gluconato de Potacio.', 'Un Buen suplemento en la dieta es el potasio que es el principal mediador en la relajación\r\nmuscular. Por lo tanto es muy útil en los calambres que producen mucho dolor.', 'REUMÁTICOS'),
(79, 'INFUSIÓN N°6', 'static/img/Papahe/productos_medicinales/infusion6.png', 'NATURALHERBAL', 'Poner una cucharada en 1 taza y dejar caer el agua hervida', 'Bolsa 40 gr.', 'Diego de la noche, Zarzaparrilla, Romero Castilla, Cenelo.', '(Antirreumatica) Mezcla de hierbas seleccionadas que es una herramienta muy eficaz en la disminución de ácido úrico ya que contiene elementos purificadores de la sangre.', 'REUMÁTICOS'),
(80, 'ACEITE DE CANNABIS 30 ML', 'static/img/Papahe/productos_medicinales/aceitedecannabis.png', 'VALLE DEL SOL', '5 gotas 2 veces al día en caso de consumo, en caso de aplicación 15 gotas de 3 a 4 veces al día.', 'Frasco 30 ml', 'Aceite de semillas de cannabis con BHA y BHT.', 'Es un poderoso tratamiento paliativo del dolor provocado por diversas afecciones, tales como hernias, cáncer o artrosis. Es útil en trastornos como el insomnio, ansiedad o depresión. Está compuesto principalmente por cannabidol, sustancia no psicoactiva, pues no contiene THC. Su efectividad como terapia natural se debe a su alto contenido en ácidos grasos omega 3 y 6, además de diversos cannabinoides libres de efecto estupefaciente. Estas sustancias, en su conjunto, aportan múltiples beneficios.', 'REUMÁTICOS'),
(81, 'CALCIO BOTANIKO', 'static/img/Papahe/productos_medicinales/calcio_botaniko.png', 'MADRE TIERRA', '1 a 2 cápsulas diarias al acostarse.', '30 Cápsula 336 mg.', 'Calcio de Ostras, Vitaminas D, Lecitina de Soya (Fosfolípido natural).', 'Para tratamientos en la osteoporosis post-menopáusica, descalcificación dentaria y en\r\ngeneral para toda mujer y hombre mayor de 35 años. Este mineral aporta en la disminución de los dolores\r\ny fracturas de los huesos, dientes tonifica los músculos y ligamentos y por su contenido aporta tambien\r\nen la prevención y combate los calambres ya que se encarga de la transmisión nerviosa y la contaccion\r\nmuscular y la ayuda en contra de la hipertención.', 'ÓSEOS'),
(82, 'CALCIO MAGNESIO VITAMINA C Y D3', 'static/img/Papahe/productos_medicinales/calciomagnesio.png', 'AURA VITALIS', '2 a 4 Cápsulas diarias.', '100 cápsulas.', 'Calcio de Ostras, Calcio Trifosfato, Magnesio Oxido, Acido Ascórbico, Vitamina D3.', 'Gran aporte en estados carenciales de calcio y magnesio, especialmente en personas\r\nmayores de 50 años que tienen mayor riesgo de desarrollar una deficiencia a la vitamina D. Actúa como\r\nactivador del metabolismo de carbohidratos y proteinas, regulando la contracción muscular ayudando a\r\nevitar los calambres', 'ÓSEOS'),
(83, 'MAGNESIO', 'static/img/Papahe/productos_medicinales/magnesio.png', 'AURA VITALIS', '2 Cápsulas diarias.', '60 cápsulas 367 mg', 'Magnesio Oxido.', 'Es uno de los minerales que necesita el organismo, aunque en pequeñas dosis para mantener su equilibrio natural. Está presente en las células nerviosas por lo que desempeña un papel importante\r\nen el buen funcionamiento del sistema nervioso. Los síntomas carenciales del Magnesio son: la falta de\r\nmemoria, temblores y debilidad en las articulaciones y calambres.', 'ÓSEOS'),
(84, 'CLORURO DE MAGNESIO', 'static/img/Papahe/productos_medicinales/cloruromagnesio.png', 'NATURALHERBAL', '1 a 2 cápsulas diarias.', '120 Cápsulas 500 mg.', 'Cloruro de Magnesio 70%, exipientes 30%.', 'Uno de los principales beneficios está relacionado con su contribución al mantenimiento\r\nde unos huesos firmes y fuertes y a prevenir y aliviar enfermedades como la artrosis. Otro beneficio muy\r\nimportante de este compuesto es que facilita el buen funcionamiento de las distintas funciones cerebrales, lo cual se traduce en una revitalización de los impulsos nerviosos. Favorece una correcta circulación\r\nsanguínea, ayuda a prevenir infartos, estabiliza la presión arterial, alivia la bronquitis, favorece una buena\r\ndigestión, previene los cálculos', 'ÓSEOS'),
(85, 'CLORURO DE MAGNESIO (Bolsa)', 'static/img/Papahe/productos_medicinales/cloruromagnesiobolsa.png', 'NATURALHERBAL', '1 a 2 cucharadas de 1 vez al día.', 'Bolsa 30 gms', 'Cloruro de Magnesio 100%.', 'Absorber y retener calcio, mejorar la circulacion, mejorar la memoria, para la artrosis, para\r\naliviar dolores, eliminar esqueloides. También es útil para reducir los niveles altos de colesterol LDL (o\r\ncolesterol malo), en especial cuando se consume con regularidad. Equilibra el PH de la sangre, es decir, la\r\ningesta de cloruro sódico ayuda a mantener nuestra sangre libre de impurezas.\r\n\r\nHervir agua y esperar que se enfríe, disolver los 30 grs. en un envase de vidrio, revolver con\r\ncuchara de palo, y mantener refrigerado.', 'ÓSEOS'),
(86, 'SECRETOS DE LA MACHI N° 8', 'static/img/Papahe/productos_medicinales/secretosmachi2.png', 'VALLE DEL SOL', 'Tomar 20 gotas 3 veces al día disueltas en agua', 'Botella 30 ml.', 'Cloruro de Magnesio, Harpago.', 'El Cloruro de Magnesio en un mineral importante en el metabolismo del calcio y el harpago\r\nes una una planta del desierto del kalahari, que los aborigenes de la zona han ocupado por cientos de\r\naños como antinflamatorio.', 'ÓSEOS'),
(87, 'PROCOLÁGENO', 'static/img/Papahe/productos_medicinales/procolageno.png', 'MADRE TIERRA', '2 cápsulas al acostarse.', '60 cápsulas 1,33 g.', 'Polipeptidos de Colágeno Hidrolizado, Vitamina E, Vitamina C, Levadura enriquecida con selenio, Glicina, Prolina, Magnesio Esterato, Silicio (dióxido), Gelatina.', 'Para personas con déficit de la proteina del colágeno, problemas de articulaciones, piel, cabello, etc. La deficiencia de procolágeno hace que nuestro cuerpo no pueda producir suficiente colágeno, todo los órganos cuentan con células productoras de procolágeno, cuando empieza a haber un déficit de esta sustancia comienza la aparición de arrugas en la piel y falta de elasticidad junto con la pérdida de los tensores naturales que sostienen nuestros órganos. El procolágeno es un precursor del colágeno, con el cual nuestro cuerpo lo sintetiza para que el colágeno produzca cartílago, hueso, piel, líquido sinovial, siendo clave para reparar y proteger el tejido conectivo. Esta dirigido a la lubricación y amortiguación que une los huesos, que nos produce inflamación y dolor.', 'REGENERADORES'),
(88, 'COLAGENINA', 'static/img/Papahe/productos_medicinales/colagenina.png', 'MADRE TIERRA', '1 tableta al acostarse.', '30 tabletas 750 mg', 'Colageno Hidrolizado, Betacaroteno, Vitamina A, Vitamina E.', 'Ideal para la caida de cabello, antioxidante, rejuvenecimiento facial, fortalecimiento de las\r\nuñas, regenador. Rejuvenecedor de la piel, cabellos y uñas. Es un complemento natural para recuperar la\r\ncalidad del cabello, actúa sobre la elasticidad de la piel, combatiendo la formación de arrugas y líneas de\r\nexpresión. Humecta la piel, la fortalece y la protege de los factores externos como el sol, el aire, etc. Ayuda\r\na evitar la aparición de erupciones cutáneas y acné, además le proporciona un saludable color y aspecto.\r\nComplementa los tratamientos médicos en cuadro de Psoriasis, Rosácea y Vitíligo', 'REGENERADORES'),
(91, 'COLAGENO PLUS', 'static/img/Papahe/productos_medicinales/colagenoplus.png', 'AURA VITALIS', '2 cápsulas diarias.', '60 cápsulas', 'Gelatina, Vitamina E, Betacaroteno, Zinc Oxido, Almidón.', 'Coadyuvante en el tratamiento y la prevención de afecciones de piel, cabellos y uñas.\r\nDevuelve la elasticidad a los tejidos, devuelve la vida a sus cabellos, uñas y piel. El Colágeno es una\r\nproteína de estructura compleja, la cual mantiene la fuerza y flexibilidad de la piel, ligamentos, huesos,\r\narticulaciones, músculos, tendones, encías, dientes, ojos, vasos sanguíneos, uñas y cabello. El hecho de\r\nser hidrolizada hace que su disolución y absorción por parte del organismo, sea de gran facilidad.', 'REGENERADORES'),
(92, 'GAFA O BLUE BLOCKER', 'static/img/Papahe/productos_medicinales/gafa.png', 'MADRE TIERRA', '2 cápsulas diarias.', '60 cápsulas.', 'Gelatina, Vitamina E, Betacaroteno, Zinc Oxido, Almidón', 'Potente antioxidante y vitaminas para enfrentar enfermedades a nuestra visión y la mácula\r\nde los efectos dañinos del espectro visible. Si le cuesta leer, focalizar su lectura, sequedad ocular o tiene\r\ndolores de cabeza al cambiar de anteojos, le sugerimos un tratamiento con Gafa O con Blue blocker para\r\nlos síntomas que produce la degeneración macular. Nutre nuestros ojos con distintos productos que nos da\r\nla naturaleza. Evite el progreso de problemas oculares relacionados con la edad, manteniendo una mácula\r\nsana y conservar la transparencia del cristalino del ojo.', 'REGENERADORES'),
(93, 'VITAMINA E', 'static/img/Papahe/productos_medicinales/vitaminaE.png', 'MADRE TIERRA', '2 cápsulas diarias.', '60 Cápsulas 400 mg', 'Alfatocoferol Acetato 400 mg. Equivalente a 600 UI de Vitamina E.', 'A la vitamina E se la considera la vitamina del corazón, dado que es preciso tener las necesidades de esta vitamina cubiertas para tener un corazón saludable. La razón se encuentra en su capacidad\r\nde protección de las membranas de las células a las que impide que los radicales libres las oxiden, lo cual\r\nllevaría a una degradación del cuerpo humano, especialmente a la aparición de enfermedades cardíacas o\r\nposibles cánceres.', 'REGENERADORES'),
(95, 'VITAMINA E (Aura Vitalis)', 'static/img/Papahe/productos_medicinales/vitaminaEarua_5pXn59B.png', 'AURA VITALIS', '2 Cápsulas diarias.', '60 cápsulas 350 mg.', 'Vitamina E, Almidón.', 'Importante en la formación de fibras elásticas y colágenas del tejido conjuntivo. Contribuye al\r\norganismo contra los efectos del envejecimiento y es esencial en el mantenimiento de la membrana de las\r\nneuronas. Coadyuvante en afecciones dermatológicas.', 'REGENERADORES'),
(96, 'ZEOLITA', 'static/img/Papahe/productos_medicinales/zeolita.png', 'MADRE TIERRA', '1 cápsula antes de las comidas.', '90 Cápsulas 500 mg.', 'Zeolita.', 'Mineral de orígen volcánico que poporciona beneficios al organismo por su consumo\r\nfrecuente. Principalmente desintoxica el organismo de metales pesados y toxinas. Refuerza el sistema\r\ninmunológico. Coadyuva a la absorción de vitaminas y minerales. También posee propiedades antiinflamatorias. Aporta energía al organismo, por lo tanto reduce el cansancio y estrés.', 'LIMPIADORES ORGÁNICOS'),
(97, 'CLOROFILA GOTAS', 'static/img/Papahe/productos_medicinales/clorofilagotas.png', 'VALLE DEL SOL', '15 gotas 3 veces al día.', 'Botella 30 ml.', 'Clorofila.', 'La Clorofila ayuda a oxigenar la sangre. Como consecuencia de esto, nuestros órganos y\r\nsobre todo el corazón se verán beneficiados. Favorece la limpieza del Colon y desintoxica el organismo.\r\nFavorece el sistema inmunológico. Su contenido de Vitaminas A, E y C la convierten en un potente antioxidante y antiinflamatorio, por lo tanto, es ideal en tratamientos digestivos.', 'LIMPIADORES ORGÁNICOS'),
(98, 'CLOROFILA CÁPSULA', 'static/img/Papahe/productos_medicinales/clorofilacapsula.png', 'NATURALHERBAL', '1 cápsula cada 12 hrs.', '60 Cápsulas 500 mg', 'Clorofila.', 'Cumple la función de un potente depurativo del cuerpo. Se ha demostrado que su consumo\r\nayuda a prevenir efectos nocivos de la exposición a la radiación. A su vez la clorofila es capaz de unirse\r\ncon los metales pesados de las células y favorecer su eliminación. Favorece también la limpieza del colon\r\ny la proliferación de la flora bacteriana intestinal, evitando graves enfermedades, como el cáncer.', 'LIMPIADORES ORGÁNICOS'),
(99, 'CLOROFILA JARABE', 'static/img/Papahe/productos_medicinales/clorofilajarabe.png', 'VALLE DEL SOL', '1 Cucharada en agua cada 12 hrs.', 'Frasco 500 ml.', 'Clorofila', 'Se conoce además que la clorofila es anticancerígena, ya que ayuda a eliminar toxinas que\r\ningresan a nuestro organismo. Su alto contenido en vitaminas A, E y C, la convierten en un potente antioxidante y también en un efectivo antiinflamatorio, por lo que es ideal para tratamientos digestivos. El mal\r\naliento es otra de las afecciones que se pueden tratar con la clorofila, sobre todo cuando se la consume de\r\nforma líquida.', 'LIMPIADORES ORGÁNICOS');
INSERT INTO `catalogo_app_productmed` (`id`, `nombre`, `imagen`, `farmacia`, `posologia`, `presentacion`, `ingredientes`, `descripcion`, `categoria`) VALUES
(100, 'INFUSIÓN N°7', 'static/img/Papahe/productos_medicinales/infusion7.png', 'NATURALHERBAL', 'Poner una cucharada en 1 taza y dejar caer el agua hervida', 'Bolsa 40 gr.', 'Zarzaparrilla, Sanguinaria, Cola de caballo, Bailahuen, Boldo.', '(Depurativa) Ayuda a limpiar la sangre y el organismo de toxinas, asi como a disminuir los\r\nsíntomas en personas que tienen problemas de intoxicación al hígado, los riñones y sangre, disminuyendo\r\ncon este efecto las manchas en la piel, acné, fecas malolientes.', 'LIMPIADORES ORGÁNICOS'),
(101, 'SANGUINARIA', 'static/img/Papahe/productos_medicinales/sanguinaria.png', 'NATURALHERBAL', '1 cucharada del vegetal para 1 litro de agua recién hervida: beber 1 taza 3 veces al día.', 'Bolsa 40 gr.', 'Sanguinaria.', 'Acelerar la curación y la recuperación, aumenta la circulación de la sangre, tiene propiedades depurativas, difícil de encontrar en otras plantas, por ello es considerada una de las maravillas de la\r\nnaturaleza para limpiar la sangre, depurar el organismo, y aplicaciones diuréticas, que pueden ser claves\r\npara proteger los riñones y el hígado, además de mantener sano el ciclo menstrual de la mujer', 'LIMPIADORES ORGÁNICOS'),
(102, 'ZARZAPARRILLA', 'static/img/Papahe/productos_medicinales/zarzaparrilla.png', 'NATURALHERBAL', '1 cucharada del vegetal para 1 litro de agua recién hervida: beber 1 taza 3 veces al día.', 'Bolsa 40 gr.', 'Zarzaparrilla.', 'Es un excelente depurativo de la sangre, indicado para aumentar la emisión de orina y favorecer la eliminación del exceso de ácido úrico. Alivia los dolores reumáticos y la gota. Se recomienda para\r\ncombatir las distintas impurezas de la piel, como el acné, la aparición de eccemas o forúnculos, urticarias\r\ny dermatosis. También es eficaz como tónico digestivo, para paliar digestiones pesadas y otros trastornos\r\nintestinales, con diarrea o cólicos.', 'LIMPIADORES ORGÁNICOS'),
(103, 'SECRETOS DE LA MACHI N° 17', 'static/img/Papahe/productos_medicinales/secretosmachi17.png', 'VALLE DEL SOL', 'Tomar 20 gotas 3 veces al día disueltas en agua.', 'Botella 30 ml.', 'Chancapiedra, Sanguinaria.', 'Esta gota está indicada para el tratamiento del cálculos renales y ayuda a purificar la sangre.', 'RENAL'),
(104, 'INFUSIÓN N°4', 'static/img/Papahe/productos_medicinales/infusion4.png', 'NATURALHERBAL', 'Poner una cucharada de té en 1 taza y dejar caer el agua hervida.', 'Bolsa 40 gr.', 'Cola de caballo, Pichi palo, Zarzaparrilla, Sanguinaria.', '(Renal) Mezcla de hierbas que es reguladora de la función renal, inhibe la retención de\r\nlíquidos y es un potente coadyuvante en la reducción de la hipertensión arterial.', 'RENAL'),
(105, 'ALCACHOFA', 'static/img/Papahe/productos_medicinales/alcachofa.png', 'NATURALHERBAL', '2 cápsulas diarias.', '60 cápsulas 30 g.', 'Alcachofa, Almidón', 'Estimulante hepático indicado para el alivio de los síntomas que se producen con los\r\ntrastornos hepáticos y vesiculares. Favorece el flujo biliar, contribuye a la producción de bilis y activa su\r\nvaciamiento al sistema digestivo. Capacidad de hepato protector y diurético.', 'HEPATOPROTECTORES'),
(106, 'CARDO MARIANO', 'static/img/Papahe/productos_medicinales/cardomariano.png', 'NATURALHERBAL', '2 cápsulas diarias.', '60 Cápsulas 500 mg.', 'Cardo Mariano.', 'Gran coadyuvante de la función hepática y disminución de colesterol en el organismo. es un\r\npoderoso desintoxicante por su gran capacidad para contribuir a la regeneración de las células del hígado.\r\nEs un remedio efectivo contra los efectos nocivos del consumo de alcohol, los pesticidas, metales pesados\r\no la contaminación ambiental. Ayuda a controlar los niveles de colesterol por lo que es muy bueno para\r\ncombatir el problema de higado graso.', 'HEPATOPROTECTORES'),
(107, 'CYNACARD', 'static/img/Papahe/productos_medicinales/cynacard.png', 'NATURALHERBAL', '1 cápsula cada 12 hrs.', '60 Cápsulas 500 mg.', 'Cardus Mariano, Cynara Scol.', 'Es la mezcla perfecta entre Cynara (Alcachofa) y Cardus Mariano por lo que es un potente\r\nprotector del hígado, reduce colesterol y triglicéridos del organismo. Aumenta la producción de ácidos\r\nbiliares, regulador del proceso de digestión. Indicado para purificar al organismo de elementos tóxicos.', 'HEPATOPROTECTORES'),
(108, 'HEFATOPAX', 'static/img/Papahe/productos_medicinales/hefatopax.png', 'VALLE DEL SOL', '1 a 2 después de las comidas.', '60 comprimidos 500 mg.', 'Lactosa, Boldo, Papaya, Alcachofa. Estearato de Magnesio.', 'Beneficioso para apoyar la desintoxicación del hígado de toxinas, alcohol, medicamentos y\r\nuna dieta alta en grasas saturadas o alimentos procesados. Recomendado para personas con sobrepeso\r\nque pueden tener síndrome de hígado graso.', 'HEPATOPROTECTORES'),
(109, 'OKAMPUS (HERCARPURI)', 'static/img/Papahe/productos_medicinales/okampus.png', 'NATURALHERBAL', '1 cápsula cada 12 hrs', '60 cápsulas 500 mg.', 'Hercarpuri.', 'Hepatoprotector, desintoxicante y depurativa, de acción hipoglucemiante (antidiabética) y\r\ndiurética. Es usado en el tratamiento de afecciones hepáticas, vesiculares y pancreáticas, como colerético,\r\ndigestivo, y para prevenir la formación de los cálculos biliares. Es usado para regular la presión sanguínea,\r\nregular la circulación, reducir el peso corporal y el colesterol, actuando como hipocolesterolémico y contra\r\nla obesidad.', 'HEPATOPROTECTORES'),
(110, 'SECRETOS DE LA MACHI N° 2', 'static/img/Papahe/productos_medicinales/secretosmachi2_EvaNaQM.png', 'VALLE DEL SOL', 'Tomar 20 gotas 3 veces al día disueltas en agua.', 'Botella 30 ml.', 'Quinchamali, Alcachofa, Bailahuen, Boldo', 'Las Machis Consideraban antiguamente al quinchamali como una poderosa hierba con\r\nmuchas cualidades para tratar problemas de digestion. El boldo y el bailahuen para mejorar la función del\r\nhígado en la formación de bilis.', 'HEPATOPROTECTORES'),
(111, 'SECRETOS DE LA MACHI N° 20', 'static/img/Papahe/productos_medicinales/secretosmachi20.png', 'VALLE DEL SOL', 'Tomar 20 gotas 3 veces al día disueltas en agua.', 'Botella 30 ml.', 'Quercus, Cardo Mariano.', 'Los Chamanes europeos descubrieron en la corteza del belloto (quercus) un buen tratamiento para el alcoholismo, mientras que los Mapuche han usado el cardo mariano como gran protector del\r\nhígado.', 'HEPATOPROTECTORES'),
(112, 'PALO NEGRO', 'static/img/Papahe/productos_medicinales/palonegro.png', 'NATURALHERBAL', '1 cucharada del vegetal para 1 litro de agua recién hervida: beber 1 taza 3 veces al día.', 'Bolsa 40 gr.', 'Palo Negro.', 'Depurador hepático, ayuda a disminuir la inflamación del hígado a causa de los triglicéridos.\r\nDisminuye naturalmente la glucemia en la sangre, limpia el hígado, contribuye a disminuir el colesterol e\r\ninduce la muerte por apoptosis de las células cancerígenas (las destruye sin afectar las células sanas).', 'HEPATOPROTECTORES');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(8, 'catalogo_app', 'catalogo'),
(9, 'catalogo_app', 'customuser'),
(6, 'catalogo_app', 'productgas'),
(7, 'catalogo_app', 'productmed'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-12-06 13:11:11.992449'),
(2, 'contenttypes', '0002_remove_content_type_name', '2023-12-06 13:11:13.414470'),
(3, 'auth', '0001_initial', '2023-12-06 13:11:16.414131'),
(4, 'auth', '0002_alter_permission_name_max_length', '2023-12-06 13:11:17.085305'),
(5, 'auth', '0003_alter_user_email_max_length', '2023-12-06 13:11:17.484108'),
(6, 'auth', '0004_alter_user_username_opts', '2023-12-06 13:11:17.876198'),
(7, 'auth', '0005_alter_user_last_login_null', '2023-12-06 13:11:18.269141'),
(8, 'auth', '0006_require_contenttypes_0002', '2023-12-06 13:11:18.657307'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2023-12-06 13:11:19.058202'),
(10, 'auth', '0008_alter_user_username_max_length', '2023-12-06 13:11:19.450122'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2023-12-06 13:11:19.855378'),
(12, 'auth', '0010_alter_group_name_max_length', '2023-12-06 13:11:20.533141'),
(13, 'auth', '0011_update_proxy_permissions', '2023-12-06 13:11:21.497257'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2023-12-06 13:11:21.890191'),
(15, 'catalogo_app', '0001_initial', '2023-12-06 13:11:27.014453'),
(16, 'admin', '0001_initial', '2023-12-06 13:11:28.600686'),
(17, 'admin', '0002_logentry_remove_auto_add', '2023-12-06 13:11:28.995507'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2023-12-06 13:11:29.388907'),
(19, 'catalogo_app', '0002_alter_productmed_nombre', '2023-12-06 13:11:30.001446'),
(20, 'catalogo_app', '0003_alter_productmed_categoria', '2023-12-06 13:11:30.393511'),
(21, 'catalogo_app', '0004_alter_productmed_descripcion', '2023-12-06 13:20:39.368335'),
(22, 'sessions', '0001_initial', '2023-12-06 13:20:40.399183');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('bwvgcc3nomfu9gk5tcfxjdf4m85j1bo0', '.eJxVjEEOwiAQRe_C2hCmhTK4dN8zNAMMUjWQlHZlvLsh6UK3_73332KhY8_L0Xhb1iiuAsTld_MUnlw6iA8q9ypDLfu2etkVedIm5xr5dTvdv4NMLfeayWlKkzEcMDEDDKRTIjeix9ECAiRUZANbmCJ7Hlg7Syp4JDReic8XDKY4yQ:1rArst:dEv0JxVnM0c6TY-EWmP0nbyaf5M7m2shiu_-8Rd99kk', '2023-12-20 13:24:15.286749'),
('v72pyrvkoeiz6oq16web1890t8anokkx', '.eJxVjEEOwiAQRe_C2hCmhTK4dN8zNAMMUjWQlHZlvLsh6UK3_73332KhY8_L0Xhb1iiuAsTld_MUnlw6iA8q9ypDLfu2etkVedIm5xr5dTvdv4NMLfeayWlKkzEcMDEDDKRTIjeix9ECAiRUZANbmCJ7Hlg7Syp4JDReic8XDKY4yQ:1rAvkp:gQ-m1uWUrmw7qVIssEhma_knnxBSmFVvyAn-zm8k82Q', '2023-12-20 17:32:11.040612');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `catalogo_app_catalogo`
--
ALTER TABLE `catalogo_app_catalogo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catalogo_app_catalog_ProductGas_id_914f97fc_fk_catalogo_` (`ProductGas_id`),
  ADD KEY `catalogo_app_catalog_productMed_id_7b74e493_fk_catalogo_` (`productMed_id`);

--
-- Indices de la tabla `catalogo_app_customuser`
--
ALTER TABLE `catalogo_app_customuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `catalogo_app_customuser_groups`
--
ALTER TABLE `catalogo_app_customuser_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `catalogo_app_customuser__customuser_id_group_id_97575463_uniq` (`customuser_id`,`group_id`),
  ADD KEY `catalogo_app_customu_group_id_48e2ee31_fk_auth_grou` (`group_id`);

--
-- Indices de la tabla `catalogo_app_customuser_user_permissions`
--
ALTER TABLE `catalogo_app_customuser_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `catalogo_app_customuser__customuser_id_permission_0fdc7aae_uniq` (`customuser_id`,`permission_id`),
  ADD KEY `catalogo_app_customu_permission_id_32ce250b_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `catalogo_app_productgas`
--
ALTER TABLE `catalogo_app_productgas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `catalogo_app_productmed`
--
ALTER TABLE `catalogo_app_productmed`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `catalogo_app_productmed_nombre_841e4d5c_uniq` (`nombre`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_catalogo_app_customuser_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `catalogo_app_catalogo`
--
ALTER TABLE `catalogo_app_catalogo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `catalogo_app_customuser`
--
ALTER TABLE `catalogo_app_customuser`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `catalogo_app_customuser_groups`
--
ALTER TABLE `catalogo_app_customuser_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `catalogo_app_customuser_user_permissions`
--
ALTER TABLE `catalogo_app_customuser_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `catalogo_app_productgas`
--
ALTER TABLE `catalogo_app_productgas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `catalogo_app_productmed`
--
ALTER TABLE `catalogo_app_productmed`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `catalogo_app_catalogo`
--
ALTER TABLE `catalogo_app_catalogo`
  ADD CONSTRAINT `catalogo_app_catalog_ProductGas_id_914f97fc_fk_catalogo_` FOREIGN KEY (`ProductGas_id`) REFERENCES `catalogo_app_productgas` (`id`),
  ADD CONSTRAINT `catalogo_app_catalog_productMed_id_7b74e493_fk_catalogo_` FOREIGN KEY (`productMed_id`) REFERENCES `catalogo_app_productmed` (`id`);

--
-- Filtros para la tabla `catalogo_app_customuser_groups`
--
ALTER TABLE `catalogo_app_customuser_groups`
  ADD CONSTRAINT `catalogo_app_customu_customuser_id_216e99bd_fk_catalogo_` FOREIGN KEY (`customuser_id`) REFERENCES `catalogo_app_customuser` (`id`),
  ADD CONSTRAINT `catalogo_app_customu_group_id_48e2ee31_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `catalogo_app_customuser_user_permissions`
--
ALTER TABLE `catalogo_app_customuser_user_permissions`
  ADD CONSTRAINT `catalogo_app_customu_customuser_id_08cf856d_fk_catalogo_` FOREIGN KEY (`customuser_id`) REFERENCES `catalogo_app_customuser` (`id`),
  ADD CONSTRAINT `catalogo_app_customu_permission_id_32ce250b_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_catalogo_app_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `catalogo_app_customuser` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
