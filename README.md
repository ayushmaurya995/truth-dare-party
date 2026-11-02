# Truth & Dare Party 🎉

A playful, mobile-first party game for friends. The first browser-playable prototype supports same-device local play.

## Current features

- Add and remove 2–12 players.
- Rotate turns and randomly select a player.
- Pick Truth or Dare prompts.
- Skip or complete a prompt to advance to the next player.
- Responsive layout for mobile and desktop.
- No account or backend required for local play.

## Visual direction

Warm off-white canvas, sunny yellow, mint and pink cards, rounded pill controls, expressive emoji mascots and friendly Nunito typography, inspired by the supplied mobile game UI reference.

## Run locally

This initial prototype is a static web app. Open `index.html` directly in a browser, or serve the project with any static file server.

## Online multiplayer

Online room creation/joining is not wired up yet. It will require a Supabase project, database tables and Realtime subscriptions. The current Join control is intentionally a setup notice, not a working multiplayer flow.

## Deployment

The static prototype can be deployed on Vercel with the project root as the root directory and no build command; use `index.html` as the entry point.

## Roadmap

1. Improve local gameplay, prompt packs and custom prompts.
2. Add Supabase-powered real-time rooms and synchronized turns.
3. Add PWA install support and polish accessibility/testing.
