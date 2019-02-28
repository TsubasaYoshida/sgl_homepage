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

function auto_setting_start_time(start_time_1_input) {
    var start_time_1 = start_time_1_input.value;
    var [h, m] = start_time_1.split(':');

    var date = new Date();
    date.setHours(h);
    date.setMinutes(m);
    date.setMinutes(date.getMinutes() + 150);

    var id_1 = start_time_1_input.id;
    var id_2 = id_1.replace('start_time_1', 'start_time_2');
    var start_time_2_input = document.getElementById(id_2);
    start_time_2_input.value = ('0' + date.getHours()).slice(-2) + ':' + ('0' + date.getMinutes()).slice(-2);

    date.setMinutes(date.getMinutes() + 150);

    var id_3 = id_1.replace('start_time_1', 'start_time_3');
    var start_time_3_input = document.getElementById(id_3);
    start_time_3_input.value = ('0' + date.getHours()).slice(-2) + ':' + ('0' + date.getMinutes()).slice(-2);
}