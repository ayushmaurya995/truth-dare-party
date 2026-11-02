-- Truth & Dare Party: initial Supabase schema
-- Run this in Supabase Dashboard > SQL Editor.
-- This prototype uses room codes as shared invite tokens. Anyone with a code can join.
-- Do not store private or sensitive information in room state.

create extension if not exists pgcrypto;

create table if not exists public.game_rooms (
  id uuid primary key default gen_random_uuid(),
  room_code text not null unique,
  host_name text not null,
  status text not null default 'waiting' check (status in ('waiting','playing','finished')),
  players jsonb not null default '[]'::jsonb,
  game_state jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists game_rooms_room_code_idx on public.game_rooms(room_code);

alter table public.game_rooms enable row level security;

-- Public party rooms: room codes are invite tokens. Restrict access further
-- with authenticated users or Edge Functions before using this for sensitive data.
drop policy if exists "Anyone can read party rooms" on public.game_rooms;
create policy "Anyone can read party rooms"
  on public.game_rooms for select
  to anon, authenticated
  using (true);

drop policy if exists "Anyone can create party rooms" on public.game_rooms;
create policy "Anyone can create party rooms"
  on public.game_rooms for insert
  to anon, authenticated
  with check (
    length(room_code) between 5 and 8
    and length(host_name) between 1 and 18
  );

drop policy if exists "Anyone can update party rooms" on public.game_rooms;
create policy "Anyone can update party rooms"
  on public.game_rooms for update
  to anon, authenticated
  using (true)
  with check (true);

-- Enable Realtime for room state changes.
do $$
begin
  alter publication supabase_realtime add table public.game_rooms;
exception
  when duplicate_object then null;
  when undefined_object then null;
end $$;
