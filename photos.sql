-- الصور الشخصية للمريدين والمرشدين (خاصة: لا يراها إلا المشرف ومن لديه سماحية قاعدة البيانات)
-- شغّله مرة واحدة في Supabase > SQL Editor > Run (بعد database.sql)
alter table people add column if not exists photo_path text;

insert into storage.buckets(id,name,public,file_size_limit,allowed_mime_types)
values('people-photos','people-photos',false,2097152,array['image/jpeg','image/png','image/webp'])
on conflict (id) do nothing;

drop policy if exists "قراءة صور المريدين" on storage.objects;
drop policy if exists "المشرف يرفع صور المريدين" on storage.objects;
drop policy if exists "المشرف يحذف صور المريدين" on storage.objects;
create policy "قراءة صور المريدين" on storage.objects for select to authenticated
  using (bucket_id='people-photos' and public.can_db());
create policy "المشرف يرفع صور المريدين" on storage.objects for insert to authenticated
  with check (bucket_id='people-photos' and public.is_admin());
create policy "المشرف يحذف صور المريدين" on storage.objects for delete to authenticated
  using (bucket_id='people-photos' and public.is_admin());
