-- NET Sanskrit: student question bookmarks
-- Run this once in Supabase SQL Editor.

create table if not exists public.bookmarked_questions (
  id uuid primary key default gen_random_uuid(),
  student_id uuid not null references auth.users(id) on delete cascade,
  unit_id text not null,
  question_number integer not null,
  question_data jsonb not null,
  created_at timestamptz not null default now(),
  unique (student_id, unit_id, question_number)
);

alter table public.bookmarked_questions enable row level security;

drop policy if exists "Students can view their own bookmarks" on public.bookmarked_questions;
create policy "Students can view their own bookmarks"
on public.bookmarked_questions for select
to authenticated
using (auth.uid() = student_id);

drop policy if exists "Students can add their own bookmarks" on public.bookmarked_questions;
create policy "Students can add their own bookmarks"
on public.bookmarked_questions for insert
to authenticated
with check (auth.uid() = student_id);

drop policy if exists "Students can remove their own bookmarks" on public.bookmarked_questions;
create policy "Students can remove their own bookmarks"
on public.bookmarked_questions for delete
to authenticated
using (auth.uid() = student_id);

grant select, insert, delete on public.bookmarked_questions to authenticated;
