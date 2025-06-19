if (!sequence_finished) {
    // Typewriter effect
    if (text_index < string_length(text_pages[current_page])) {
        typewriter_timer++;
        if (typewriter_timer >= typewriter_speed) {
            typewriter_timer = 0;
            text_index++;
        }
    } else {
        // If the current page is one before the final page (Page 9)
        if (current_page == final_page - 1) {
            // Immediately proceed to final page (Page 10)
            current_page++;
            text_index = 0;
            typewriter_timer = 0;
            page_timer = 0;
        }
        // If the current page is the final page (Page 10)
        else if (current_page == final_page) {
            sequence_finished = true; // Done — stop here
        }
        // Otherwise: advance on a timer like normal
        else {
            page_timer++;
            if (page_timer > page_duration) {
                current_page++;
                text_index = 0;
                typewriter_timer = 0;
                page_timer = 0;
            }
        }
    }
}
