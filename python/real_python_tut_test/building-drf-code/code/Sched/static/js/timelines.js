// *** timelines.js ***
// --- VUE Configuration
Vue.prototype.window_portal = window;
    var vm = new Vue({
    el: '#vue-container',
    delimiters:['[[', ']]'],
    data: {
        has_loaded: false,
        timeline_id:undefined,
        name:undefined,
        entries:undefined,
    },
    methods: {
        add_entry: ()=> {
            console.log('Adding a new entry');
            var last_entry = vm.entries[vm.entries.length - 1];

            var data = {
                timeline:vm.timeline_id,
                rank:last_entry.rank + 1,
            }
            change_form.show_create('/api/v1/entries/', data, (response)=>{
                console.log('Entry added: id=' + response['id']);
                vm.entries.splice(vm.entries.length, 0, response);
            });
        },
        edit_entry: (index)=>{
            var entry = vm.entries[index];
            console.log('Editing entry ' + entry.title);
            change_form.show_patch(entry.url, entry, (response)=>{
                console.log('Patched entry, replacing contents');
                vm.entries.splice(index, 1, response);
            });
        },
        entry_moved: (e)=>{
            console.log('*** Entry moved inform server');
            var entry_id = e.item.getAttribute('data-entry_id');
            var new_rank = e.newIndex + 1;

            $.getJSON({
                url:'/api/v1/change_rank/' + entry_id + '/' + new_rank + '/',
                success:(response)=>{
                    // Server responds with a new listing to replace with
                    vm.entries = response['entries'];
                },
            });
        },
        delete_entry: (entry)=>{
            var text = 'Delete <i>' + entry.title + '</i>?';

            bsmodals_confirm('Delete', text, (result)=>{
                if(!result) {
                    return;
                }

                $.ajax({
                    url:entry.url,
                    type:'DELETE',
                });

                refresh_view();
            });

        },
    },
});

// ------------------------------------------------------------------------
// --- Event Management

function refresh_view() {
    $.getJSON(FETCH_URL, (response)=>{
        vm.timeline_id = response['id'];
        vm.name = response['name'];
        vm.entries = response['entries'];
        vm.has_loaded = true;
    }).fail(function() { 
        console.log("ERROR: failed to fetch timeline data ");
    });
}

// ------------------------------------------------------------------------
// --- Document Ready

var change_form;

$(function() {
    ajax_setup(get_cookie('csrftoken'));

    change_form = new RestModal('change-entry');

    refresh_view();
});
