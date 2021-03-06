note
	description: "S'occupe des �l�ments d'arri�re-plan (musique et image)."
	author: "Pascal Belisle"
	date: "29 f�vrier"
	revision: "0.1"

class
	BACKGROUND

inherit
	AUDIO_LIBRARY_SHARED
	SPRITE
		rename
			make as make_sprite
		end

create
	make

feature {NONE} -- Initialisation

	make (a_surface:GAME_SURFACE)
			-- Initialise `current' avec la surface `a_surface' � la position (0, 0).
		local
			l_music_file:AUDIO_SOUND_FILE
		do
			audio_library.sources_add
			music_source := audio_library.last_source_added
			make_sprite(a_surface, 0, 0)
			create l_music_file.make("Audio/Solitaire.ogg")
			if l_music_file.is_openable then
				l_music_file.open
				if l_music_file.is_open then
					music_source.queue_sound_infinite_loop (l_music_file)
					music_source.play
				else
					print("Cannot open sound files.")
				end
			else
				print("Sound file not valid.")
			end
		end

feature {NONE} -- Implementation

	music_source: AUDIO_SOURCE
		-- Source de la musique de fond.

end
