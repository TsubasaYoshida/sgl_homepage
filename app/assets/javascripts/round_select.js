function auto_select_round(round_1_select) {
    var round_1_value = '';
    for (var i = 0; i < round_1_select.options.length; i++) {
        if (round_1_select.options[i].selected) {
            round_1_value = round_1_select.options[i].value;
        }
    }

    var round_1_id = round_1_select.id;
    var round_2_id = round_1_id.replace('round_1', 'round_2');
    var round_3_id = round_1_id.replace('round_1', 'round_3');

    var round_2_select = document.getElementById(round_2_id);
    for (var i = 0; i < round_2_select.options.length; i++) {
        if (round_2_select.options[i].value == round_1_value) {
            round_2_select.options[i].selected = true;
        }
    }

    var round_3_select = document.getElementById(round_3_id);
    for (var i = 0; i < round_3_select.options.length; i++) {
        if (round_3_select.options[i].value == round_1_value) {
            round_3_select.options[i].selected = true;
        }
    }
}