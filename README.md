# Truth & Dare Party 🎉

A playful, responsive Truth & Dare party game for friends. Supports same-device local play and online multiplayer rooms.

## Design direction

Inspired by playful mobile game interfaces: warm off-white backgrounds, yellow, mint, pink and sky-blue accents, rounded cards, bold typography, cute mascot-style illustrations and smooth interactions.

## Planned stack

- React + Vite + TypeScript
- Tailwind CSS
- Motion / Framer Motion
- Supabase Realtime and PostgreSQL for online rooms
- Vercel deployment

## Gameplay

- Add 2–12 players for local play.
- Rotate turns and choose Truth or Dare.
- Random prompts, skip, complete and score controls.
- Create/join online rooms with a shareable room code.
- Responsive layouts for phones, tablets and desktops.

## Local development

```bash
npm install
npm run dev
```

## Environment variables

Create `.env.local` from `.env.example` and configure the Supabase project URL and anon/publishable key when enabling online multiplayer.

## Status

Initial repository setup. Online multiplayer requires Supabase configuration and testing before production use.
