var table;
var reporte;
$(document).ready(function () {
    CargarDatos();
    function CargarDatos() {
     
        var contador = 0;
        if ($.fn.DataTable.isDataTable('#tbReporte1')) {
            $('#tbReporte1').DataTable().destroy();
        }

        $('#tbReporte1 tbody').html('');

        var request = {
            tabla: reporte
            // codigoproducto: $("#txtCodigoProducto").val(),
            // idtienda: $("#cboTienda").val() == null ? "0" : $("#cboTienda").val()
        };
        AjaxPost("../../QuejasBuzon.aspx/Obtener", JSON.stringify(request),
            function (response) {
                $(".mt-3").LoadingOverlay("hide");
                if (response.estado) {

                    var filas = JSON.parse(response.objeto)
                    $("#tbReporte1 tbody").html("");

                    if (filas.length > 0) {
                        $.each(filas, function (i, row) {
                            contador = contador + 1

                            $("<tr>").append(
                                $("<td>").text(contador),
                                $("<td>").text(row["Folio"]),
                                $("<td>").text(row["Usuario"]),
                                $("<td>").text(row["Site"]),
                                $("<td>").text(row["Queja"]),
                                $("<td>").text(row["Fecha"]),

                           


                            ).appendTo("#tbReporte1 tbody");

                        })
                    }


                }
               
                table = $('#tbReporte1').DataTable({
                    responsive: true,
                    language: {
                        "decimal": "",
                        "emptyTable": "No hay información",
                        "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
                        "infoEmpty": "Mostrando 0 to 0 of 0 Entradas",
                        "infoFiltered": "(Filtrado de _MAX_ total entradas)",
                        "infoPostFix": "",
                        "thousands": ",",
                        "lengthMenu": "Mostrar _MENU_ Entradas",
                        "loadingRecords": "Cargando...",
                        "processing": "Procesando...",
                        "search": "Buscar:",
                        "zeroRecords": "Sin resultados encontrados",
                        "paginate": {
                            "first": "Primero",
                            "last": "Ultimo",
                            "next": "Siguiente",
                            "previous": "Anterior"
                        }
                    },
                    // "scrollY": "200px",
                    // "scrollCollapse": true,
                    // "scrollX": true,
                    // "paging": false,
                    dom: 'Blfrtip',

                    buttons: [{
                        extend: 'excelHtml5',
                        title: 'Quejas' + ObtenerFecha()
                    },
                    {
                        extend: 'pdfHtml5',
                        title: 'Quejas' + ObtenerFecha(),
                        orientation: 'landscape',
                        //pageSize: 'LEGAL',
                        //alignment: 'center',
                        customize: function (doc) {
                            doc.content[1].margin = [100, 0, 100, 0] //left, top, right, bottom
                        }
                    },
                    {
                        extend: 'print'


                    }]
                });
            },
            function () {
                $(".mt-3").LoadingOverlay("hide");
            },
            function () {
                $(".mt-3").LoadingOverlay("show");
            })
    }


    function ObtenerFecha() {

        var d = new Date();
        var month = d.getMonth() + 1;
        var day = d.getDate();
        var output = (('' + day).length < 2 ? '0' : '') + day + '/' + (('' + month).length < 2 ? '0' : '') + month + '/' + d.getFullYear();

        return output;
    }
    function AjaxPost(url, data, funcionexito, funcionerror, funcionmientras) {

        jQuery.ajax({
            async: true,
            url: url,
            type: "POST",
            dataType: "json",
            data: data,
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                funcionexito(data.d);
            },
            error: function (er) {
                funcionerror();
            },
            beforeSend: function () {
                funcionmientras();
            },
        });

    }

    function AjaxGet(url, funcionexito, funcionerror, funcionmientras) {

        jQuery.ajax({
            async: true,
            url: url,
            type: "GET",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                funcionexito(data.d);
            },
            error: function (er) {
                funcionerror();
            },
            beforeSend: function () {
                funcionmientras();
            },
        });

    }
});