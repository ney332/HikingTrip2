//
//  MockData.swift
//  HikingTrip2
//
//  Created by Lorran Silva on 10/10/25.
//

import Foundation

struct MockData {
    static let allExperiences: [Experience] = [
        // 🇧🇷 RIO DE JANEIRO
        Experience(
            title: "Estádio Vasco da Gama",
            category: .aventura,
            image: "img2",
            description: "Construído em 1927 com o esforço coletivo dos torcedores, o Estádio Vasco da Gama — conhecido como São Januário — é um símbolo da história e da resistência do futebol brasileiro. Seu estilo arquitetônico neocolonial e sua atmosfera apaixonada fazem dele um ícone cultural do Rio.",
            location: "São Cristóvão - RJ",
            address: "Rua General Almério de Moura, 131 - São Cristóvão, Rio de Janeiro - RJ, 20921-060",
            tag: "Futebol"
        ),
        Experience(
            title: "Paraquedismo em Niterói",
            category: .aventura,
            image: "salto",
            description: "Experimente a adrenalina de saltar de paraquedas sobre a Baía de Guanabara. Com instrutores certificados e vistas panorâmicas do Rio e de Niterói, o salto oferece uma das experiências mais inesquecíveis do litoral carioca, especialmente ao pôr do sol.",
            location: "Niterói - RJ",
            address: "Avenida do Contorno, s/n - São Lourenço, Niterói - RJ, 24050-470",
            tag: "Voo livre"
        ),
        Experience(
            title: "Mergulho em Paraty",
            category: .aventura,
            image: "mergulho",
            description: "Descubra o paraíso subaquático de Paraty. As águas calmas e cristalinas abrigam uma rica biodiversidade marinha, incluindo peixes coloridos, corais e naufrágios históricos. Ideal tanto para mergulhadores iniciantes quanto experientes.",
            location: "Paraty - RJ",
            address: "Marina do Engenho, Rod. Rio-Santos, km 568 - Paraty, RJ, 23970-000",
            tag: "Mergulho"
        ),
        Experience(
            title: "Pão de Açúcar",
            category: .natureza,
            image: "rio4",
            description: "Um dos principais cartões-postais do mundo, o Pão de Açúcar oferece uma vista deslumbrante de toda a cidade do Rio de Janeiro. O passeio de bondinho, inaugurado em 1912, é uma jornada imperdível pela história e pela beleza natural da cidade.",
            location: "Rio de Janeiro - RJ",
            address: "Av. Pasteur, 520 - Urca, Rio de Janeiro - RJ, 22290-240",
            tag: "Paisagem"
        ),
        Experience(
            title: "Bar Astor",
            category: .bares,
            image: "rio5",
            description: "Localizado de frente para o mar de Ipanema, o Bar Astor combina elegância e descontração em um ambiente de charme paulistano. Ideal para curtir o pôr do sol com um chope gelado e petiscos inspirados na cozinha de boteco.",
            location: "Ipanema - Rio de Janeiro",
            address: "Av. Vieira Souto, 110, Ipanema, Rio de Janeiro - RJ, 22420-010",
            tag: "Boemia"
        ),
        // 🇦🇷 BUENOS AIRES
        Experience(
            title: "Caminito de La Boca",
            category: .aventura,
            image: "arg1",
            description: "Um dos cartões-postais mais vibrantes de Buenos Aires, o Caminito encanta com suas casas coloridas, dançarinos de tango nas ruas e lojinhas de arte local que contam a história viva do bairro La Boca.",
            location: "Buenos Aires - Argentina",
            address: "Caminito, La Boca, Buenos Aires C1169AAB, Argentina",
            tag: "Cultura"
        ),
        Experience(
            title: "Cabaña Las Lilas",
            category: .restaurantes,
            image: "arg2",
            description: "Localizado em Puerto Madero, o Cabaña Las Lilas oferece uma experiência gastronômica sofisticada, unindo o sabor autêntico da parrilla argentina com uma vista encantadora para o rio e um atendimento impecável.",
            location: "Buenos Aires - Argentina",
            address: "Av. Alicia Moreau de Justo 516, Puerto Madero, Buenos Aires, Argentina",
            tag: "Gastronomia"
        ),
        Experience(
            title: "Bar 878",
            category: .bares,
            image: "arg3",
            description: "Um bar secreto e premiado em Villa Crespo, conhecido por sua iluminação intimista e coquetéis autorais preparados por bartenders renomados, perfeitos para uma noite inesquecível em Buenos Aires.",
            location: "Buenos Aires - Argentina",
            address: "Thames 878, Villa Crespo, Buenos Aires C1414, Argentina",
            tag: "Coquetéis"
        ),
        Experience(
            title: "Teatro Colón",
            category: .cultura,
            image: "arg4",
            description: "Majestoso e cheio de história, o Teatro Colón é um dos mais importantes teatros de ópera do mundo, com uma acústica impecável e uma arquitetura que reflete o auge da elegância portenha.",
            location: "Buenos Aires - Argentina",
            address: "Cerrito 628, C1010AAN, Buenos Aires, Argentina",
            tag: "História"
        ),
        Experience(
            title: "Don Julio",
            category: .restaurantes,
            image: "arg5",
            description: "Referência mundial em churrasco argentino, o Don Julio combina carnes premium, ambiente acolhedor e uma carta de vinhos excepcional, sendo parada obrigatória para os amantes da boa gastronomia.",
            location: "Palermo - Buenos Aires",
            address: "Guatemala 4691, Palermo, Buenos Aires C1425, Argentina",
            tag: "Parrilla"
        ),

        // 🇺🇾 MONTEVIDÉU
        Experience(
            title: "Mercado del Puerto",
            category: .restaurantes,
            image: "monte1",
            description: "O coração gastronômico de Montevidéu, repleto de restaurantes tradicionais que servem as autênticas parrillas uruguaias acompanhadas de vinhos locais e música ao vivo.",
            location: "Montevidéu - Uruguai",
            address: "Piedras 237, 11000 Montevideo, Uruguai",
            tag: "Culinária"
        ),
        Experience(
            title: "Rambla de Montevidéu",
            category: .natureza,
            image: "monte2",
            description: "Um dos passeios mais belos do Uruguai, a Rambla se estende por quilômetros à beira do Rio da Prata, ideal para caminhadas, pedaladas ou para assistir a um pôr do sol inesquecível.",
            location: "Montevidéu - Uruguai",
            address: "Rambla República del Perú, Montevideo 11300, Uruguai",
            tag: "Paisagem"
        ),
        Experience(
            title: "Bar Fun Fun",
            category: .bares,
            image: "monte3",
            description: "Fundado em 1895, o Bar Fun Fun é um ícone da boemia uruguaia, com apresentações de candombe e tango que celebram a identidade cultural de Montevidéu.",
            location: "Montevidéu - Uruguai",
            address: "Ciudadela 1229, 11100 Montevideo, Uruguai",
            tag: "Tradição"
        ),
        Experience(
            title: "Museo Nacional de Artes Visuales",
            category: .cultura,
            image: "monte4",
            description: "O principal museu de arte do país, com um acervo que valoriza grandes nomes uruguaios como Joaquín Torres García, além de exposições internacionais de destaque.",
            location: "Montevidéu - Uruguai",
            address: "Tomás Giribaldi 2283, 11300 Montevideo, Uruguai",
            tag: "Arte"
        ),
        Experience(
            title: "La Perdiz Restaurant & Parrillada",
            category: .restaurantes,
            image: "monte5",
            description: "Tradicional e acolhedor, o La Perdiz é referência em carnes uruguaias preparadas no ponto certo, com um ambiente elegante e atendimento caloroso típico de Montevidéu.",
            location: "Punta Carretas - Montevidéu",
            address: "Guipúzcoa 350, 11300 Montevideo, Uruguai",
            tag: "Carnes"
        ),
        // 🇨🇱 SANTIAGO
        Experience(
            title: "Cerro San Cristóbal",
            category: .natureza,
            image: "santiago1",
            description: "O coração verde de Santiago, o Cerro San Cristóbal oferece uma das vistas panorâmicas mais espetaculares da cidade. Ideal para caminhadas, trilhas ou um passeio de funicular até o topo, onde se encontra a icônica estátua da Virgem Maria.",
            location: "Santiago - Chile",
            address: "Pío Nono 450, Recoleta, Santiago, Chile",
            tag: "Trilha"
        ),
        Experience(
            title: "Barrio Lastarria",
            category: .restaurantes,
            image: "santiago2",
            description: "Com ruas de paralelepípedo e uma atmosfera boêmia, o Barrio Lastarria reúne cafés charmosos, livrarias e bistrôs que refletem o lado criativo e moderno da capital chilena.",
            location: "Santiago - Chile",
            address: "José Victorino Lastarria, Santiago, Chile",
            tag: "Cultura"
        ),
        Experience(
            title: "Bocanáriz Wine Bar",
            category: .bares,
            image: "santiago3",
            description: "Um premiado bar de vinhos que é parada obrigatória para os amantes da enologia. Oferece mais de 400 rótulos chilenos e harmonizações perfeitas com petiscos locais em um ambiente sofisticado.",
            location: "Santiago - Chile",
            address: "José Victorino Lastarria 276, Santiago, Chile",
            tag: "Vinhos"
        ),
        Experience(
            title: "Sky Costanera",
            category: .aventura,
            image: "santiago4",
            description: "Suba ao ponto mais alto da América Latina e contemple uma vista 360° de Santiago, com a Cordilheira dos Andes ao fundo — um cenário impressionante tanto de dia quanto à noite.",
            location: "Santiago - Chile",
            address: "Av. Andrés Bello 2425, Providencia, Santiago, Chile",
            tag: "Panorama"
        ),
        Experience(
            title: "Fuente Alemana",
            category: .restaurantes,
            image: "santiago5",
            description: "Um ícone da gastronomia chilena desde 1954, famoso por seus sanduíches generosos e pela atmosfera nostálgica que celebra a culinária simples e saborosa do país.",
            location: "Santiago - Chile",
            address: "Av. Libertador Bernardo O'Higgins 58, Santiago, Chile",
            tag: "Tradicional"
        ),

        // 🇵🇪 LIMA - PERU
        Experience(
            title: "Miraflores Costa Verde",
            category: .natureza,
            image: "lima1",
            description: "Um dos cartões-postais de Lima, a Costa Verde oferece vistas incríveis do Oceano Pacífico. Ideal para caminhadas, ciclismo ou até paragliding sobre os penhascos de Miraflores.",
            location: "Lima - Peru",
            address: "Malecón Cisneros 4013, Miraflores 15074, Lima, Peru",
            tag: "Aventura"
        ),
        Experience(
            title: "Central Restaurante",
            category: .restaurantes,
            image: "lima2",
            description: "Eleito diversas vezes o melhor restaurante da América Latina, o Central explora os sabores do Peru através de uma viagem gastronômica por seus ecossistemas, do mar aos Andes.",
            location: "Lima - Peru",
            address: "Av. Pedro de Osma 301, Barranco 15063, Lima, Peru",
            tag: "Alta gastronomia"
        ),
        Experience(
            title: "Ayahuasca Bar Lounge",
            category: .bares,
            image: "lima3",
            description: "Instalado em uma mansão colonial, o Ayahuasca mistura tradição e modernidade com drinks criativos à base de ingredientes peruanos e um ambiente que exala história e sofisticação.",
            location: "Lima - Peru",
            address: "Av. San Martín 130, Barranco 15063, Lima, Peru",
            tag: "Mixologia"
        ),
        Experience(
            title: "Museo Larco",
            category: .cultura,
            image: "lima4",
            description: "Um dos museus mais impressionantes da América do Sul, o Larco abriga um vasto acervo de arte pré-colombiana e um jardim encantador, além de um café perfeito para relaxar após a visita.",
            location: "Lima - Peru",
            address: "Av. Simón Bolívar 1515, Pueblo Libre 15084, Lima, Peru",
            tag: "História"
        ),
        Experience(
            title: "La Mar Cebichería",
            category: .restaurantes,
            image: "lima5",
            description: "Vibrante e autêntico, o La Mar é a cebichería mais famosa de Lima, onde o chef Gastón Acurio eleva o tradicional ceviche peruano a outro nível com ingredientes frescos e atmosfera animada.",
            location: "Lima - Peru",
            address: "Av. La Mar 770, Miraflores 15074, Lima, Peru",
            tag: "Cebiche"
        ),
        // 🇨🇴 BOGOTÁ
        Experience(
            title: "Monserrate",
            category: .natureza,
            image: "bogota1",
            description: "Suba o famoso morro de Monserrate e veja Bogotá do alto, um visual de tirar o fôlego.",
            location: "Bogotá - Colômbia",
            address: "Carrera 2 Este No. 21-48, Bogotá, Colômbia",
            tag: "Trilha"
        ),
        Experience(
            title: "Zona G",
            category: .restaurantes,
            image: "bogota2",
            description: "Bairro gourmet com os melhores restaurantes da cidade, do casual ao sofisticado.",
            location: "Bogotá - Colômbia",
            address: "Calle 70A #5-41, Bogotá, Colômbia",
            tag: "Gastronomia"
        ),
        Experience(
            title: "Andrés Carne de Res",
            category: .bares,
            image: "bogota3",
            description: "Bar icônico da Colômbia, mistura de festa, arte e comida típica colombiana.",
            location: "Bogotá - Colômbia",
            address: "Calle 82 #12-21, Zona Rosa, Bogotá, Colômbia",
            tag: "Festa"
        ),
        Experience(
            title: "Museu do Ouro",
            category: .cultura,
            image: "bogota4",
            description: "Um dos museus mais impressionantes da América do Sul, com artefatos de ouro das civilizações pré-colombianas.",
            location: "Bogotá - Colômbia",
            address: "Carrera 6 #15-88, Bogotá, Colômbia",
            tag: "História"
        ),
        Experience(
            title: "Parque Simón Bolívar",
            category: .natureza,
            image: "bogota5",
            description: "O maior parque urbano de Bogotá, ideal para caminhadas, piqueniques e shows ao ar livre.",
            location: "Bogotá - Colômbia",
            address: "Avenida Calle 63 y Avenida 68, Bogotá, Colômbia",
            tag: "Lazer"
        ),

        // 🇪🇨 QUITO
        Experience(
            title: "TelefériQo",
            category: .natureza,
            image: "quito1",
            description: "Suba de teleférico até o vulcão Pichincha e contemple Quito a 4.000 metros de altitude.",
            location: "Quito - Equador",
            address: "Fulgencio Araujo, Quito 170527, Equador",
            tag: "Montanha"
        ),
        Experience(
            title: "Casa Gangotena",
            category: .restaurantes,
            image: "quito2",
            description: "Restaurante elegante em uma mansão colonial com pratos que misturam tradição e modernidade.",
            location: "Quito - Equador",
            address: "Bolívar Oe6-41 y Cuenca, Quito 170401, Equador",
            tag: "Alta gastronomia"
        ),
        Experience(
            title: "Bandido Brewing",
            category: .bares,
            image: "quito3",
            description: "Pub artesanal famoso por sua cerveja local e atmosfera descontraída no centro histórico.",
            location: "Quito - Equador",
            address: "José Joaquín de Olmedo E3-26 y, Quito 170401, Equador",
            tag: "Cervejas artesanais"
        ),
        Experience(
            title: "Basílica del Voto Nacional",
            category: .cultura,
            image: "quito4",
            description: "Igreja neogótica impressionante, com torres que oferecem uma das melhores vistas da cidade.",
            location: "Quito - Equador",
            address: "Calle Venezuela y Carchi, Quito 170130, Equador",
            tag: "Arquitetura"
        ),
        Experience(
            title: "Mitad del Mundo",
            category: .aventura,
            image: "quito5",
            description: "Experimente estar literalmente no meio do mundo e visite o museu interativo sobre o equador terrestre.",
            location: "Quito - Equador",
            address: "Av. Manuel Córdova Galarza km 13.5, Quito 170312, Equador",
            tag: "Turismo"
        ),

        // 🇵🇪 CUSCO
        Experience(
            title: "Cicciolina",
            category: .restaurantes,
            image: "cusco2",
            description: "Restaurante sofisticado com tapas e culinária contemporânea peruana em um ambiente acolhedor.",
            location: "Cusco - Peru",
            address: "Triunfo 393, Segundo Piso, Cusco 08002, Peru",
            tag: "Gastronomia"
        ),
        Experience(
            title: "Paddy’s Irish Pub",
            category: .bares,
            image: "cusco3",
            description: "O pub irlandês mais alto do mundo, ideal para relaxar depois de explorar as ruínas incas.",
            location: "Cusco - Peru",
            address: "Calle Triunfo 124, Cusco 08002, Peru",
            tag: "Pub"
        ),
        Experience(
            title: "Sacsayhuamán",
            category: .cultura,
            image: "cusco4",
            description: "Antiga fortaleza inca com vistas panorâmicas e pedras monumentais perfeitamente encaixadas.",
            location: "Cusco - Peru",
            address: "Fortaleza de Sacsayhuamán, Cusco 08002, Peru",
            tag: "Patrimônio"
        ),
        Experience(
            title: "Mercado de San Pedro",
            category: .restaurantes,
            image: "cusco5",
            description: "Mercado vibrante com comidas típicas, frutas exóticas e artesanato local.",
            location: "Cusco - Peru",
            address: "Thupaq Amaru 477, Cusco 08002, Peru",
            tag: "Cultura local"
        ),

        // 🇨🇴 CARTAGENA
        Experience(
            title: "Cidade Amuralhada",
            category: .aventura,
            image: "cartagena1",
            description: "Passeie pelas muralhas coloniais e ruas coloridas da cidade histórica de Cartagena.",
            location: "Cartagena - Colômbia",
            address: "Centro Histórico, Cartagena de Indias, Bolívar, Colômbia",
            tag: "História"
        ),
        Experience(
            title: "Carmen Cartagena",
            category: .restaurantes,
            image: "cartagena2",
            description: "Restaurante contemporâneo que combina sabores caribenhos e colombianos em um ambiente elegante.",
            location: "Cartagena - Colômbia",
            address: "Calle 38 #8-19, Centro Histórico, Cartagena, Bolívar, Colômbia",
            tag: "Culinária"
        ),
        Experience(
            title: "Alquímico Bar",
            category: .bares,
            image: "cartagena3",
            description: "Bar premiado entre os melhores do mundo, com três andares e coquetéis autorais.",
            location: "Cartagena - Colômbia",
            address: "Carrera 3 #52-6, Centro Histórico, Cartagena, Bolívar, Colômbia",
            tag: "Mixologia"
        ),
        Experience(
            title: "Playa Blanca",
            category: .natureza,
            image: "cartagena4",
            description: "Praia paradisíaca com águas cristalinas na Ilha Barú, perfeita para relaxar e mergulhar.",
            location: "Cartagena - Colômbia",
            address: "Isla Barú, Cartagena, Bolívar, Colômbia",
            tag: "Praia"
        ),
        Experience(
            title: "Castelo de San Felipe",
            category: .cultura,
            image: "cartagena5",
            description: "Fortaleza imponente do período colonial, com túneis e vistas deslumbrantes da cidade.",
            location: "Cartagena - Colômbia",
            address: "Carrera 17, Cartagena de Indias, Bolívar, Colômbia",
            tag: "Patrimônio"
        ),

        // 🇧🇴 LA PAZ
        Experience(
            title: "Mercado de las Brujas",
            category: .aventura,
            image: "lapaz1",
            description: "Explore o mercado mais curioso da Bolívia, cheio de tradições andinas e produtos místicos.",
            location: "La Paz - Bolívia",
            address: "Calle Melchor Jimenez, La Paz, Bolívia",
            tag: "Cultura"
        ),
        Experience(
            title: "Gustu Restaurante",
            category: .restaurantes,
            image: "lapaz2",
            description: "Restaurante de alta gastronomia criado por Claus Meyer (Noma), com ingredientes 100% bolivianos.",
            location: "La Paz - Bolívia",
            address: "Calle 10, #300, Calacoto, La Paz, Bolívia",
            tag: "Alta gastronomia"
        ),
        Experience(
            title: "Diesel Nacional",
            category: .bares,
            image: "lapaz3",
            description: "Bar industrial com drinks criativos, jazz ao vivo e arte alternativa local.",
            location: "La Paz - Bolívia",
            address: "Calle 15 de Calacoto #7738, La Paz, Bolívia",
            tag: "Arte urbana"
        ),
        Experience(
            title: "Mi Teleférico",
            category: .aventura,
            image: "lapaz4",
            description: "Rede de teleféricos urbanos que conecta toda a cidade, com vistas panorâmicas espetaculares.",
            location: "La Paz - Bolívia",
            address: "Av. del Libertador, Zona Sopocachi, La Paz, Bolívia",
            tag: "Vista aérea"
        ),
        Experience(
            title: "Valle de la Luna",
            category: .natureza,
            image: "lapaz5",
            description: "Paisagem surreal formada por formações rochosas únicas, ideal para caminhadas e fotos.",
            location: "La Paz - Bolívia",
            address: "Calle Murillo s/n, Mallasa, La Paz, Bolívia",
            tag: "Natureza"
        )

    ]
}


struct Destino: Identifiable {
    let id = UUID()
    let nome: String
    let imagem: String
}

extension MockData {
    static let destinos: [Destino] = [
        Destino(nome: "Buenos Aires", imagem: "buenosaires"),
        Destino(nome: "Santiago", imagem: "santiago"),
        Destino(nome: "Montevidéu", imagem: "montevideu"),
        Destino(nome: "Lima", imagem: "lima"),
        Destino(nome: "Bogotá", imagem: "bogota"),
        Destino(nome: "Quito", imagem: "quito"),
        Destino(nome: "Rio de Janeiro", imagem: "riodejaneiro"),
        Destino(nome: "La Paz", imagem: "lapaz"),
        Destino(nome: "Cartagena", imagem: "cartagena"),
        Destino(nome: "Cusco", imagem: "cusco")
    ]
}

