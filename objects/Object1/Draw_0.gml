draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
draw_rectangle_colour(x, y, x + sprite_width, y + sprite_height, c_red, c_red, c_red, c_red, true);

if (mouse_check_button_pressed(mb_left)) {
    if (point_in_rectangle(mouse_x, mouse_y, x, y, x + sprite_width, y + sprite_height)) {
        sizing = true;
    }
}
if (mouse_check_button_released(mb_left)) {
    sizing = false;
}

if (sizing) {
    image_xscale = (mouse_x - x) / sprite_get_width(sprite_index);
    image_yscale = (mouse_y - y) / sprite_get_height(sprite_index);
}

if (keyboard_check(vk_shift)) {
    gpu_set_tex_filter(true);
}

draw_sprite_ext(sprite_index, image_index, x + 500, y, image_xscale, image_yscale, 0, c_white, 1);

gpu_set_tex_filter(false);