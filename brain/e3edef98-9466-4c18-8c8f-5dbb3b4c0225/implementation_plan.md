# Native Vietnamese Revamp Plan

You correctly pointed out that the previous voice generated using `eleven_multilingual_v2` sounded like a foreigner mispronouncing Vietnamese. This occurs because the API requires an explicit `language_code` parameter to enforce regional text normalization and tonal pitch logic, which was previously missing from the script.

## Proposed Changes

### Scripts `scripts/generate-voiceover-tiananmen.ts`
- **API Payload Correction**: Add `"language_code": "vi"` to the JSON request sent to ElevenLabs to force native phonetics.
- **Voice Swap**: Switch `VOICE_ID` from the heavily English-accented ID to a highly responsive Multilingual voice (e.g., Bella or Antoni) that better adopts the target language's core accents when passed the `vi` flag.
- **Script Rewrite**: Completely rewrite the 24 sentences in the `TIANANMEN_SCENES` array from "robotic translated" Vietnamese to highly natural, cynical native Vietnamese phrasing and internet-slang sarcasm. 

### Execution
After you approve, I will execute the new script to re-generate the 24 MP3 slices and timestamp JSON files. The video timeline bindings will automatically ingest this new, properly paced Vietnamese audio without any required changes to the underlying Remotion code!

## User Review Required
Does this native-focused script rewrite and API fix sound like the correct approach? Let me know so I can execute the generations!
