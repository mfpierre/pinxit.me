$ = require 'jquery'
fss = require 'fss'
jfp = require 'jfp'

$ ->
  container = document.getElementById('banner');
  renderer = new FSS.CanvasRenderer();
  scene = new FSS.Scene();
  light = new FSS.Light('#100088', '#00840f');
  light2 = new FSS.Light('#100088', '#00840f');
  geometry = new FSS.Plane(800, 1200, 8, 20);
  material = new FSS.Material('#555555', '#FFFFFF');
  mesh = new FSS.Mesh(geometry, material);
  now = Date.now();
  start = Date.now();

  initialise = ->
    scene.add mesh
    scene.add light
    scene.add light2
    container.appendChild renderer.element
    window.addEventListener "resize", resize
    return
  resize = ->
    renderer.setSize container.offsetWidth, container.offsetHeight
    return
  animate = ->
    now = Date.now() - start
    light.setPosition 300 * Math.sin(now * 0.001), 200 * Math.cos(now * 0.0005), 60
    light2.setPosition 300 * Math.cos(now * 0.001), 200 * Math.sin(now * 0.0005), 60
    renderer.render scene
    requestAnimationFrame animate
    return

  initialise()
  resize()
  animate()

  $('input').floatingPlaceholder({placeholderActiveColor:'#49bf9d',placeholderIdleColor:'#787878'})
  $('textarea').floatingPlaceholder({placeholderActiveColor:'#49bf9d',placeholderIdleColor:'#787878'})

  currentLocation = new google.maps.LatLng(48.876987, 2.329545)

  map = new google.maps.Map(document.getElementById('map'), {
    zoom: 11,
    streetViewControl: false,
    mapTypeControl: false,
    center: currentLocation,
    styles: [
        {
            "featureType": "water",
            "stylers": [
                {
                    "color": "#46bcec"
                },
                {
                    "visibility": "on"
                }
            ]
        },
        {
            "featureType": "landscape",
            "stylers": [
                {
                    "color": "#f2f2f2"
                }
            ]
        },
        {
            "featureType": "road",
            "stylers": [
                {
                    "saturation": -100
                },
                {
                    "lightness": 45
                }
            ]
        },
        {
            "featureType": "road.highway",
            "stylers": [
                {
                    "visibility": "simplified"
                }
            ]
        },
        {
            "featureType": "road.arterial",
            "elementType": "labels.icon",
            "stylers": [
                {
                    "visibility": "off"
                }
            ]
        },
        {
            "featureType": "administrative",
            "elementType": "labels.text.fill",
            "stylers": [
                {
                    "color": "#444444"
                }
            ]
        },
        {
            "featureType": "transit",
            "stylers": [
                {
                    "visibility": "off"
                }
            ]
        },
        {
            "featureType": "poi",
            "stylers": [
                {
                    "visibility": "off"
                }
            ]
        }
    ]
  });

  marker = new google.maps.Marker({
      position: currentLocation,
      map: map,
      title: 'I\'m here!'
  });

  $('.ajax-popup-link').magnificPopup({
    type: 'ajax'
  });
