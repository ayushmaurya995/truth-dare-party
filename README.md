# Truth & Dare Party 🎉

A playful, mobile-first party game for friends. Same-device local play is implemented; Supabase online-room setup is scaffolded.

## Current gameplay

- Add/remove 2–12 local players.
- Rotate turns and randomly select a player.
- Truth and Dare prompt packs.
- Skip or complete a prompt to advance.
- Responsive mobile and desktop layout.

## Supabase setup

The project URL and client publishable key are in `supabase-config.js`. Publishable keys are intended for browser use; never put a Supabase secret or service-role key in frontend code.

1. Open the Supabase project SQL Editor.
2. Run the SQL in `supabase/schema.sql`.
3. The room table is configured for Realtime.
4. Before production, tighten room access (the starter policies allow public room reads/updates; room codes should be treated as shareable invite tokens).

**Important:** The Supabase schema/configuration have been added, but the browser game's create/join/realtime controls are not yet connected. Local play continues to work without Supabase.

## Run locally

Open `index.html` in a browser or serve the repository root with a static file server.

## Vercel

Deploy as a static site with the repository root as the root directory and no build command. The entry point is `index.html`.

## Roadmap

1. Connect the browser UI to Supabase room creation, joining and Realtime sync.
2. Add room host controls, synchronized turns and reconnect handling.
3. Add installable PWA support and production security hardening.
