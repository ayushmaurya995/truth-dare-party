# Firebase setup

This app uses **Firebase Authentication (anonymous sign-in)** and **Cloud Firestore** for online party rooms. Firebase Hosting serves the static web app. There is no Supabase dependency.

## 1. Create a Firebase project

1. Open https://console.firebase.google.com/ and create a project.
2. Add a Web app in Project settings.
3. Copy its Firebase config into `firebase-config.js`, replacing all `YOUR_...` placeholders.
4. In Authentication > Sign-in method, enable **Anonymous**.
5. In Firestore Database, create a database.
6. Deploy the included `firestore.rules` rules (or paste them into the Firestore Rules editor).

## 2. Test locally

Serve the repository root using a local static server (for example, VS Code Live Server). Open the local URL on your device. Do not open the HTML as a `file://` URL because Firebase browser modules need an HTTP origin.

## 3. Deploy to Firebase Hosting

Install the Firebase CLI and sign in:

```bash
npm install -g firebase-tools
firebase login
```

Copy `.firebaserc.example` to `.firebaserc`, then replace the project ID with yours. Deploy:

```bash
firebase use YOUR_FIREBASE_PROJECT_ID
firebase deploy
```

The included `firebase.json` publishes the repository root as a static site.

## Online room data model

Rooms are stored at `rooms/{ROOM_CODE}` with:
- `hostUid`: anonymous Firebase UID of the room creator
- `memberIds`: anonymous UIDs allowed to read and update the room
- `players`: player names and UIDs
- `turnIndex`: current player index
- `activePrompt`: current shared Truth/Dare prompt

The client listens to the room document with Firestore `onSnapshot`, so connected devices see turns and prompts update live.

## Important notes

- Firebase web config is public client configuration, not a secret. Never commit service-account JSON or private server credentials.
- Anonymous Authentication must be enabled for online rooms.
- The starter rules limit room membership to 12 and restrict reads to room members. Review and test security rules before a public launch.
- Anyone with the room code can attempt to join until the room reaches its 12-player limit. Add moderation, expiry and abuse controls before scaling.
