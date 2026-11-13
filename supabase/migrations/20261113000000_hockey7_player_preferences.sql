
-- Tabla de preferencias por jugadora para Hockey 7
create table if not exists public.hockey7_player_preferences (
  team_id text not null,
  player_id text not null,
  prefs jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now(),

  primary key (team_id, player_id)
);

-- Activar Row Level Security
alter table public.hockey7_player_preferences
enable row level security;

-- Lectura compartida
drop policy if exists "hockey7 prefs read shared"
on public.hockey7_player_preferences;

create policy "hockey7 prefs read shared"
on public.hockey7_player_preferences
for select
to anon, authenticated
using (true);

-- Inserción compartida
drop policy if exists "hockey7 prefs insert shared"
on public.hockey7_player_preferences;

create policy "hockey7 prefs insert shared"
on public.hockey7_player_preferences
for insert
to anon, authenticated
with check (true);

-- Actualización compartida
drop policy if exists "hockey7 prefs update shared"
on public.hockey7_player_preferences;

create policy "hockey7 prefs update shared"
on public.hockey7_player_preferences
for update
to anon, authenticated
using (true)
with check (true);

-- Permisos de la tabla
grant select, insert, update
on public.hockey7_player_preferences
to anon, authenticated;
