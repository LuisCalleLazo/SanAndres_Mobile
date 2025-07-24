import 'package:san_andres_mobile/domain/entities/autoparts/autopart.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_brand.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_type_info.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/category.dart';
import 'package:san_andres_mobile/domain/entities/local/country.dart';

class AutopartsSql {
  static List<AutopartAsset> getSeedDataAupartAsset() {
    return [
      AutopartAsset(
        id: 1,
        asset: 'https://picsum.photos/id/1/600/250',
        description: 'Bujía Bosch de alto rendimiento',
        autopartId: 1,
      ),
      AutopartAsset(
        id: 2,
        asset: 'https://picsum.photos/id/1/600/250',
        description: 'Bujía NGK para motores gasolina',
        autopartId: 2,
      ),
      AutopartAsset(
        id: 3,
        asset: 'https://picsum.photos/id/1/600/250',
        description: 'Pastillas de freno Valeo',
        autopartId: 3,
      ),
      AutopartAsset(
        id: 4,
        asset: 'https://picsum.photos/id/1/600/250',
        description: 'Amortiguador Gates para suspensión delantera',
        autopartId: 4,
      ),
      AutopartAsset(
        id: 5,
        asset: 'https://picsum.photos/id/1/600/250',
        description: 'Alternador Denso compacto',
        autopartId: 5,
      ),
      AutopartAsset(
        id: 6,
        asset: 'https://picsum.photos/id/1/600/250',
        description: 'Kit de embrague Bosch',
        autopartId: 6,
      ),
      AutopartAsset(
        id: 7,
        asset: 'https://picsum.photos/id/1/600/250',
        description: 'Disco de freno NGK ventilado',
        autopartId: 7,
      ),
      AutopartAsset(
        id: 8,
        asset: 'https://picsum.photos/id/1/600/250',
        description: 'Resorte de suspensión Valeo',
        autopartId: 8,
      ),
      AutopartAsset(
        id: 9,
        asset: 'https://picsum.photos/id/1/600/250',
        description: 'Batería Gates de 60Ah',
        autopartId: 9,
      ),
      AutopartAsset(
        id: 10,
        asset: 'https://picsum.photos/id/1/600/250',
        description: 'Sensor de oxígeno Denso',
        autopartId: 10,
      ),
    ];
  }

  static List<AutopartBrand> getSeedAutopartBrand() {
    return [
      AutopartBrand(
          id: 1, name: 'Bosch', logo: 'https://picsum.photos/id/1/600/250'),
      AutopartBrand(
          id: 2, name: 'NGK', logo: 'https://picsum.photos/id/1/600/250'),
      AutopartBrand(
          id: 3, name: 'Valeo', logo: 'https://picsum.photos/id/1/600/250'),
      AutopartBrand(
          id: 4, name: 'Gates', logo: 'https://picsum.photos/id/1/600/250'),
      AutopartBrand(
          id: 5, name: 'Denso', logo: 'https://picsum.photos/id/1/600/250'),
    ];
  }

  static List<AutopartInfo> getSeedAutopartInfo() {
    return [
      // Bujía Bosch
      AutopartInfo(
          id: 1, value: 'BOSCH-1234', typeId: 1, autopartId: 1, type: 1),
      AutopartInfo(
          id: 2, value: '14mm, 1.1mm gap', typeId: 2, autopartId: 1, type: 1),
      AutopartInfo(
          id: 3, value: 'Incluye 4 bujías', typeId: 3, autopartId: 1, type: 1),

      // Bujía NGK
      AutopartInfo(id: 4, value: 'NGK-5678', typeId: 1, autopartId: 2, type: 1),
      AutopartInfo(
          id: 5, value: '12mm, 0.9mm gap', typeId: 2, autopartId: 2, type: 1),
      AutopartInfo(
          id: 6, value: 'Incluye 4 bujías', typeId: 3, autopartId: 2, type: 1),

      // Pastillas de freno Valeo
      AutopartInfo(
          id: 7, value: 'VALEO-9012', typeId: 1, autopartId: 3, type: 1),
      AutopartInfo(
          id: 8, value: '120x60x18mm', typeId: 2, autopartId: 3, type: 1),
      AutopartInfo(
          id: 9,
          value: 'Incluye 2 pastillas',
          typeId: 3,
          autopartId: 3,
          type: 1),

      // Amortiguador Gates
      AutopartInfo(
          id: 10, value: 'GATES-3456', typeId: 1, autopartId: 4, type: 1),
      AutopartInfo(
          id: 11, value: 'Longitud 350mm', typeId: 2, autopartId: 4, type: 1),
      AutopartInfo(
          id: 12,
          value: 'Unidad individual',
          typeId: 3,
          autopartId: 4,
          type: 1),

      // Alternador Denso
      AutopartInfo(
          id: 13, value: 'DENSO-7890', typeId: 1, autopartId: 5, type: 1),
      AutopartInfo(
          id: 14, value: '12V, 90A', typeId: 2, autopartId: 5, type: 1),
      AutopartInfo(
          id: 15,
          value: 'Incluye alternador y polea',
          typeId: 3,
          autopartId: 5,
          type: 1),

      // Embrague Bosch
      AutopartInfo(
          id: 16, value: 'BOSCH-2468', typeId: 1, autopartId: 6, type: 1),
      AutopartInfo(
          id: 17, value: 'Diámetro 200mm', typeId: 2, autopartId: 6, type: 1),
      AutopartInfo(
          id: 18,
          value: 'Incluye disco y plato',
          typeId: 3,
          autopartId: 6,
          type: 1),

      // Disco de freno NGK
      AutopartInfo(
          id: 19, value: 'NGK-1357', typeId: 1, autopartId: 7, type: 1),
      AutopartInfo(
          id: 20, value: '280mm diámetro', typeId: 2, autopartId: 7, type: 1),
      AutopartInfo(
          id: 21, value: 'Incluye 1 disco', typeId: 3, autopartId: 7, type: 1),

      // Resorte de suspensión Valeo
      AutopartInfo(
          id: 22, value: 'VALEO-2468', typeId: 1, autopartId: 8, type: 1),
      AutopartInfo(
          id: 23, value: 'Longitud 400mm', typeId: 2, autopartId: 8, type: 1),
      AutopartInfo(
          id: 24,
          value: 'Incluye 1 resorte',
          typeId: 3,
          autopartId: 8,
          type: 1),

      // Batería Gates
      AutopartInfo(
          id: 25, value: 'GATES-9753', typeId: 1, autopartId: 9, type: 1),
      AutopartInfo(
          id: 26, value: '12V, 60Ah', typeId: 2, autopartId: 9, type: 1),
      AutopartInfo(
          id: 27,
          value: 'Incluye batería y terminales',
          typeId: 3,
          autopartId: 9,
          type: 1),

      // Sensor de oxígeno Denso
      AutopartInfo(
          id: 28, value: 'DENSO-8642', typeId: 1, autopartId: 10, type: 1),
      AutopartInfo(
          id: 29,
          value: 'Longitud cable 600mm',
          typeId: 2,
          autopartId: 10,
          type: 1),
      AutopartInfo(
          id: 30,
          value: 'Incluye sensor y conector',
          typeId: 3,
          autopartId: 10,
          type: 1),
    ];
  }

  static List<AutopartTypeInfo> getSeedAutopartTypeInfo() {
    return [
      AutopartTypeInfo(
        id: 1,
        name: 'Código',
        description: 'Código de referencia del fabricante',
        typeValue: AutopartTypeInfoEnum.code,
      ),
      AutopartTypeInfo(
        id: 2,
        name: 'Medidas',
        description: 'Dimensiones o especificaciones físicas',
        typeValue: AutopartTypeInfoEnum.measures,
      ),
      AutopartTypeInfo(
        id: 3,
        name: 'Contenido',
        description: 'Qué incluye el empaque o kit',
        typeValue: AutopartTypeInfoEnum.contains,
      ),
    ];
  }

  static List<Autopart> getSeedAutopart() {
    return [
      Autopart(id: 1, brandId: 1, categoryId: 1), // Bujía Bosch, Motor
      Autopart(id: 2, brandId: 2, categoryId: 1), // Bujía NGK, Motor
      Autopart(
          id: 3, brandId: 3, categoryId: 3), // Pastillas de freno Valeo, Frenos
      Autopart(
          id: 4, brandId: 4, categoryId: 2), // Amortiguador Gates, Suspensión
      Autopart(id: 5, brandId: 5, categoryId: 5), // Alternador Denso, Eléctrico
      Autopart(id: 6, brandId: 1, categoryId: 4), // Embrague Bosch, Transmisión
      Autopart(id: 7, brandId: 2, categoryId: 3), // Disco de freno NGK, Frenos
      Autopart(
          id: 8,
          brandId: 3,
          categoryId: 2), // Resorte de suspensión Valeo, Suspensión
      Autopart(id: 9, brandId: 4, categoryId: 5), // Batería Gates, Eléctrico
      Autopart(
          id: 10, brandId: 5, categoryId: 1), // Sensor de oxígeno Denso, Motor
    ];
  }

  static List<Category> getSeedCategiries() {
    return [
      Category(
        id: 1,
        name: 'Motor',
        description: 'Partes esenciales del motor y su funcionamiento',
        asset: 'https://picsum.photos/id/1/600/250',
        type: 'function', // Añadido
      ),
      Category(
        id: 2,
        name: 'Suspensión',
        description: 'Componentes para el sistema de suspensión',
        asset: 'https://picsum.photos/id/1/600/250',
        type: 'function', // Añadido
      ),
      Category(
        id: 3,
        name: 'Frenos',
        description: 'Sistema de frenos y repuestos relacionados',
        asset: 'https://picsum.photos/id/1/600/250',
        type: 'function', // Añadido
      ),
      Category(
        id: 4,
        name: 'Transmisión',
        description: 'Partes para transmisión y caja de cambios',
        asset: 'https://picsum.photos/id/1/600/250',
        type: 'function', // Añadido
      ),
      Category(
        id: 5,
        name: 'Eléctrico',
        description: 'Sistema eléctrico y componentes asociados',
        asset: 'https://picsum.photos/id/1/600/250',
        type: 'function', // Añadido
      ),
    ];
  }

  static List<Country> getSeedCountries() {
    return [
      Country(
          id: 1,
          name: 'Argentina',
          photo: 'https://picsum.photos/id/1/600/250',
          codePhone: '+54'),
      Country(
          id: 2,
          name: 'Brasil',
          photo: 'https://picsum.photos/id/1/600/250',
          codePhone: '+55'),
      Country(
          id: 3,
          name: 'Chile',
          photo: 'https://picsum.photos/id/1/600/250',
          codePhone: '+56'),
      Country(
          id: 4,
          name: 'Colombia',
          photo: 'https://picsum.photos/id/1/600/250',
          codePhone: '+57'),
      Country(
          id: 5,
          name: 'México',
          photo: 'https://picsum.photos/id/1/600/250',
          codePhone: '+52'),
      Country(
          id: 6,
          name: 'Perú',
          photo: 'https://picsum.photos/id/1/600/250',
          codePhone: '+51'),
      Country(
          id: 7,
          name: 'Estados Unidos',
          photo: 'https://picsum.photos/id/1/600/250',
          codePhone: '+1'),
      Country(
          id: 8,
          name: 'España',
          photo: 'https://picsum.photos/id/1/600/250',
          codePhone: '+34'),
      Country(
          id: 9,
          name: 'Francia',
          photo: 'https://picsum.photos/id/1/600/250',
          codePhone: '+33'),
      Country(
          id: 10,
          name: 'Alemania',
          photo: 'https://picsum.photos/id/1/600/250',
          codePhone: '+49'),
      Country(
          id: 11,
          name: 'Italia',
          photo: 'https://picsum.photos/id/1/600/250',
          codePhone: '+39'),
      Country(
          id: 12,
          name: 'Reino Unido',
          photo: 'https://picsum.photos/id/1/600/250',
          codePhone: '+44'),
      Country(
          id: 13,
          name: 'Japón',
          photo: 'https://picsum.photos/id/1/600/250',
          codePhone: '+81'),
      Country(
          id: 14,
          name: 'Australia',
          photo: 'https://picsum.photos/id/1/600/250',
          codePhone: '+61'),
      Country(
          id: 15,
          name: 'Canadá',
          photo: 'https://picsum.photos/id/1/600/250',
          codePhone: '+1'),
      Country(
          id: 16,
          name: 'Bolivia',
          photo: 'https://picsum.photos/id/1/600/250',
          codePhone: '+591'),
    ];
  }
}
