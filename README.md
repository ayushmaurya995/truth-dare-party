# Truth & Dare Party 🎉

A playful, mobile-first Truth & Dare game for friends. Play locally on one device or invite friends into a real-time online room.

## Current features

- Responsive mobile and desktop interface.
- Same-device local party mode for 2–12 players.
- Player rotation, random selection and Truth/Dare prompts.
- Skip and complete actions.
- Firebase Anonymous Authentication for online identity.
- Cloud Firestore room documents and real-time snapshot listeners.
- Six-character room codes for joining friends.

## Firebase setup

See [FIREBASE_SETUP.md](./FIREBASE_SETUP.md) for the complete setup and deployment guide.

1. Create a Firebase project and register a Web app.
2. Add the web app config to `firebase-config.js`.
3. Enable Anonymous sign-in in Firebase Authentication.
4. Create a Cloud Firestore database.
5. Deploy the included Firestore security rules.

The online-room UI is wired to Firebase, but it will only work after these Firebase project steps are completed.

## Run locally

Serve the repository root with a local HTTP server (for example, VS Code Live Server). Firebase features do not work from a `file://` URL.

## Deploy with Firebase Hosting

Install the Firebase CLI, authenticate, set the project ID in `.firebaserc`, then run:

```bash
firebase deploy
```

The included `firebase.json` publishes the repository root as a static site. Firebase Hosting is the chosen hosting platform; Vercel is not required.

## Security notes

- Firebase web app config is public client configuration; never add service-account credentials to the browser app.
- Room documents are readable by authenticated clients that know the room code so they can join. Room listing is disabled.
- Only room members can update a room, with a 12-player limit. Review and test rules and add room expiry/abuse controls before a public launch.
