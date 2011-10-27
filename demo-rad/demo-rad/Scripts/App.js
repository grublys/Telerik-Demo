updateViewsForTechnology = function (tech) {
    if (tech) {
        return $.ajax({
            type: 'GET',
            url: 'http://localhost:3000/contacts/update_views_for_technology',
            data: "tech=" + tech,
            dataType: 'json',
            success: function (data) {
                return updateViewSelection(data);
            }
        });
    } else {
        resetSelectionView();
        return $('#selection_view').attr('disabled', 'disabled');
    }
};
updateViewSelection = function (views) {
    resetSelectionView();
    $.each(views, function (value, text) {
        return $('#selection_view').append($('<option></option>').attr('value', text).text(text));
    });
    return $('#selection_view').removeAttr('disabled');
};
resetSelectionView = function () {
    $('#selection_view').empty();
    return $('#selection_view').append($('<option></option>').text('Select View'));
};
gotoView = function (technology, view) {
    switch (technology) {
        case "HTML5":
            return gotoHtml5(view);
        case "RadControls":
            return gotoRadControls(view);
    }
};
gotoHtml5 = function (view) {
    switch (view) {
        case "HTML5 Grid":
            return window.location.href = "http://localhost:3000/contacts";
        case "HTML5 Tree":
            return window.location.href = "http://localhost:3000/contacts/treeview";
    }
};
gotoRadControls = function (view) {
    switch (view) {
        case "RadGrid":
            return alert("Cannot redirect to the RadGrid");
        case "RadTree":
            return alert("Cannot redirect to the RadTree");
    }
};