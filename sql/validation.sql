ALTER TABLE public.merged
ADD CONSTRAINT game_key
CHECK (game_key != None);

ALTER TABLE public.merged
DROP CONSTRAINT game_key;