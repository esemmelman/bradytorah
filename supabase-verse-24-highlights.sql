-- Applied remotely as migration allow_brady_genesis_42_24_highlights.
-- Displayed Genesis 42:8-24 uses stored verse numbers 1-17 under the
-- established passage key, preserving existing highlights and recordings.
alter table public.aria_torah_highlight_groups_v1
  drop constraint aria_torah_highlight_groups_v1_verse_check,
  add constraint aria_torah_highlight_groups_v1_verse_check check (
    (passage_key = 'exodus-14-15-30' and verse between 15 and 30)
    or (passage_key = 'genesis-41-1-16' and verse between 1 and 17)
  );

alter policy brady_torah_highlights_public_insert
  on public.aria_torah_highlight_groups_v1
  with check (
    passage_key = 'genesis-41-1-16'
    and verse between 1 and 17
    and start_word >= 0
    and end_word >= start_word
    and color in (1, 2)
  );
