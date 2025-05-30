# SwiftUI vs UIKit - Demo Comparativo 🚀

Este repositorio contiene dos implementaciones de la misma aplicación iOS: una en UIKit (paradigma imperativo) y otra en SwiftUI (paradigma declarativo). Creado para la charla **"SwiftUI: Principios y Prácticas del Desarrollo Moderno de UI para iOS"**.

## 📱 Descripción del Proyecto

Ambas aplicaciones implementan las siguientes funcionalidades:
- **Onboarding** con múltiples pantallas
- **Login** con validación de formularios
- **Registro** de nuevos usuarios
- **Home** con lista y pull-to-refresh
- **Perfil** de usuario con opciones

## 📊 Comparación de Métricas

| Característica | UIKit | SwiftUI | Reducción |
|----------------|--------|----------|-----------|
| **Líneas de código totales** | ~1,200 | ~400 | **67%** |
| **Archivos necesarios** | 8 | 3 | **62%** |
| **Líneas para Onboarding** | 250 | 80 | **68%** |
| **Líneas para Lista + Refresh** | 80 | 15 | **81%** |
| **Manejo del teclado** | Manual (30+ líneas) | Automático | **100%** |
| **Tiempo de desarrollo estimado** | 5 días | 2 días | **60%** |

## 🛠 Requisitos

- **Xcode 15.0+**
- **iOS 17.0+** (para SwiftUI features completos)
- **Swift 5.9+**

## 🚀 Cómo Ejecutar

### Proyecto UIKit
```bash
cd UIKitExample
open UIKitExample.xcodeproj
```
1. Selecciona un simulador iOS 17+
2. Build and Run (⌘ + R)

### Proyecto SwiftUI
```bash
cd SwiftUIExample
open SwiftUIExample.xcodeproj
```
1. Selecciona un simulador iOS 17+
2. Build and Run (⌘ + R)

## 🔍 Diferencias Clave

### 1. Paradigma de Programación

**UIKit (Imperativo)**
```swift
let label = UILabel()
label.text = "Hello"
label.textColor = .blue
view.addSubview(label)
// + 20 líneas de constraints...
```

**SwiftUI (Declarativo)**
```swift
Text("Hello")
    .foregroundColor(.blue)
```

### 2. Gestión de Estado

**UIKit**
- Manual con `didSet`
- Delegates y callbacks
- `reloadData()` explícito

**SwiftUI**
- `@State`, `@Binding`, `@StateObject`
- Actualizaciones automáticas
- Source of truth único

### 3. Navegación

**UIKit**: Configuración manual de `UINavigationController`
```swift
let vc = LoginViewController()
navigationController?.pushViewController(vc, animated: true)
```

**SwiftUI**: Declarativo con `NavigationStack`
```swift
NavigationLink("Login", destination: LoginView())
```

### 4. Listas y Refresh

**UIKit**: ~80 líneas con `UITableView`, delegates, y `UIRefreshControl`

**SwiftUI**: 8 líneas
```swift
List(items) { item in
    Text(item.name)
}
.refreshable {
    await loadData()
}
```

## 🎯 Casos de Uso

### ¿Cuándo usar UIKit?
- Proyectos legacy existentes
- Soporte para iOS < 13
- Customizaciones muy específicas de UI
- Equipos con expertise profundo en UIKit

### ¿Cuándo usar SwiftUI?
- ✅ Nuevos proyectos
- ✅ Prototipado rápido
- ✅ Apps multiplataforma (iOS, macOS, watchOS, tvOS)
- ✅ Equipos que valoran productividad
- ✅ Desarrollo moderno con async/await

## 📈 Beneficios de SwiftUI

1. **Menos código** = Menos bugs
2. **Preview en tiempo real** = Desarrollo más rápido
3. **Gestión automática del estado** = Menos errores de sincronización
4. **Multiplataforma** = Un código para todo el ecosistema Apple
5. **Integración nativa con async/await** = Código asíncrono más limpio

## 🔄 Migración Gradual

SwiftUI y UIKit pueden coexistir:

```swift
// UIKit hosting SwiftUI
let swiftUIView = UIHostingController(rootView: MySwiftUIView())

// SwiftUI hosting UIKit
struct MyView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        // Return UIKit view
    }
}
```

## 📚 Recursos de Aprendizaje

- [SwiftUI Tutorials - Apple](https://developer.apple.com/tutorials/swiftui)
- [SwiftUI Documentation](https://developer.apple.com/documentation/swiftui)
- [100 Days of SwiftUI](https://www.hackingwithswift.com/100/swiftui)
- [SwiftUI by Example](https://www.hackingwithswift.com/quick-start/swiftui)

## 👨‍💻 Autor

**René Sandoval**
- 🆇 X: [@resand](https://twitter.com/resand91)
- 💼 LinkedIn: [René Sandoval](https://linkedin.com/in/resand91)
- 🌐 GitHub: [@resand](https://github.com/resand)

## 🙏 Agradecimientos

- A la comunidad de SwiftUI por recursos increíbles
- A todos los asistentes a la charla
- A Apple por crear SwiftUI 💙

---

### ⭐️ Si este proyecto te ayudó, considera darle una estrella!

### 🚀 ¿Listo para escribir 70% menos código? ¡Empieza con SwiftUI hoy!

## Próximos Pasos

1. **Clona este repo**
   ```bash
   git clone https://github.com/resand/uikit-vs-swiftui.git
   ```

2. **Explora ambas implementaciones**

3. **Experimenta con cambios**

4. **Comparte tus aprendizajes**

5. **¡Únete a la revolución declarativa!** 🎉

---