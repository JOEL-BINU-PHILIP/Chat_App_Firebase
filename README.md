
# Chat App
A completely Responsive Chat App - Works on Android, iOS & Web!

## Features
- Responsive Chat UI
- Email & Password Authentication
- Real-time Messaging
- Create and Join Chat Rooms
- Display Chat History
- Search Users
- Add Friends
- EVERYTHING REAL TIME
- Sign Out

## Installation
After cloning this repository, migrate to `chat-app-flutter` folder. Then, follow these steps:

1. Create Firebase Project
2. Enable Authentication
3. Make Firestore Rules
4. Create Android, iOS & Web Apps
5. Take Web `FirebaseOptions` and put it in `main` function in `main.dart` file replacing my keys (My keys won't work as I deleted my project)
6. Run the following commands to run your app:
   ```bash
   flutter pub get
   open -a simulator # to get iOS Simulator
   flutter run
   flutter run -d chrome --web-renderer html # to see the best output
## Tech Used

**Server:**
- Firebase Auth
- Firebase Firestore

**Client:**
- Flutter
- Provider
