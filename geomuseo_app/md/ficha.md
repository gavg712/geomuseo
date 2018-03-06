---
title: "Ficha"
author: "Geomuseo Ikiam"
date: "March 6, 2018"
output: html_document
params:
  author:
    value: x
  fecha:
    value: x
  wgs84_utm18s_x:
    value: x
  wgs84_utm18s_y:
    value: x
  localidad:
    value: x
  formacion:
    value: x
  foto:
    value: x
  nombre_roca:
    value: x
  codigo:
    value: x
  desc_macro:
    value: x
  desc_micro:
    value: x
  fotoNP:
    value: x
  fotoNC:
    value: x
  comentarios:
    value: x
  minerales:
    value: x
---
<div class="container-fluid">
<div class="row">
  <div class="row ">
    <div class="col-sm-6 col-md-6">
      <img style="float: left; margin-left: 25%" src="Ikiam.png" width=50%>
    </div>
    <div class="col-sm-6 col-md-6">
      <img style="float: right; margin-right: 25%" src="Logo.jpg" width=50%>
    </div>
  </div>
</div>

<div class="row container-fluid text-center">
<h3> Laboratorio de Petrografía </h3>
</div>


<div class = "container-fluid">
  <div class = "row">
    <div class = "col-sm-6 col-md-6">
      <div class = "row">
        <strong>Autor:</strong> `r params$fecha`
      </div>
      <div class = "row">
        <strong>Fecha:</strong> `r params$fecha`
      </div>
      <div class = "row">
        <strong> Wgs84-Utm-18S X:</strong> `r params$fecha`
      </div>
      <div class = "row">
        <strong>Wgs84-Utm-18S Y:</strong> `r params$fecha`
      </div>
      <div class = "row">
        <strong>Localidad:</strong> `r params$fecha`
      </div>
      <div class = "row">
        <strong>Formación:</strong> `r params$fecha`
      </div>
    </div>
    <div class = "col-sm-6 col-md-6">
      <div class = "row">
        FOTO `r params$fecha`
      </div>
      <div class = "row">
        <strong>Nombre de roca:</strong> `r params$fecha`
      </div>
      <div class = "row">
        <strong>Código de roca:</strong> `r params$fecha`
      </div>
    </div>
  </div>
  <div class="row">
    <strong>Descripción Macroscópica:</strong> 
     `r params$fecha`
  </div>
  <div class="row">
    <strong>Descripción Microscópica:</strong>
    `r params$fecha`
  </div>
</div>
</div>