# NewsApp - Clean Architecture Flutter Project

A Flutter application implementing **Clean Architecture** for a News post management system.  
Supports viewing all posts, adding, updating, and deleting posts using Bloc for state management.

---

## 🛠 Features

- View all posts (from a REST API)  
- Add new posts  
- Update existing posts  
- Delete posts  
- Clean Architecture (Layers: Entity, UseCases, Repository, DataSource, Presentation)  
- Bloc state management  
- Dependency Injection setup  
- Proper error handling and loading states  

---

## 📦 Packages Used

Here are some of the important packages used in this project:

| Package | Purpose |
|--------|---------|
| `flutter_bloc` | State management (Bloc & Events & States) |
| `dio` | For HTTP requests to API |
| `dartz` | Handling functional types like `Either` for error/success |
| `equatable` | Easy value comparison in Bloc States & Events |
| `get_it` | Dependency Injection |
| `shared_preferences` | (If used) Local storage or caching |
| `internet_connection_checker` | To detect network connectivity state |

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK installed (>= version X.X.X)  
- A device or emulator running (Android or iOS)

### Setup

1. Clone the repository:

   ```bash
   git clone https://github.com/Ibrahim-404/NewsApp.git
   cd NewsApp
![image alt](https://github.com/Ibrahim-404/NewsApp/blob/a6856aacb6f83ad9053331b85e90667b62f77369/Screenshot%202025-09-18%20201954.png)

![image alt](https://github.com/Ibrahim-404/NewsApp/blob/a6856aacb6f83ad9053331b85e90667b62f77369/Screenshot%202025-09-18%20201936.png)

![image alt](https://github.com/Ibrahim-404/NewsApp/blob/a6856aacb6f83ad9053331b85e90667b62f77369/Screenshot%202025-09-18%20201910.png)

![image alt](https://github.com/Ibrahim-404/NewsApp/blob/a6856aacb6f83ad9053331b85e90667b62f77369/Screenshot%202025-09-18%20201849.png)
