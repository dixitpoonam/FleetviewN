 window.onload = init; 
markers2 = []
markersSI = [] //SI
markersOS = [] //OS
markersST = [] //ST
markersAC = [] //AC or SP
markersDC = [] //DC
markersDisconn = [] //DIsconnection
markersTripStart = [] //TripStart
markersTripEnd = [] //TripEnd
markersGeoStamp = [] //Geofence Stamp
markersGeo = []
markersWare = []
//markersZauri=[]
//var lon,lat
focus=[]
zoomval=5;//default zoom
var vectorGML;
layergml=false;
var content1;

function loadKML(url){
	layergml=true;
	vectorGML = new ol.layer.Vector({
		 source: new ol.source.Vector({
			 url: url,
			 format: new ol.format.KML({
				 extractStyles: false
			 })
		 }),
		 style: new ol.style.Style({
			 stroke: new ol.style.Stroke({
		        color: '#000000',     //journey path color black
		        width: 3,
		    })
		 
		 })
	 });	
	
}

function createMarker_ware(name, html1, lat, lon) {
	console.log("in create ware marker function")
	var markw = new ol.Feature({
		geometry : new ol.geom.Point([ lon, lat ]),
		text : html1,
		name : name
	});

	markersWare.push(markw);
}


function createMarkerGeo(name, html, lat, lon) {
	var markerg = new ol.Feature({
		geometry : new ol.geom.Point([ lon, lat ]),
		text : html,
		name : name
	});

	markersGeo.push(markerg); //add marker to list of geo-fence markers

}

function createMarker(name, html, stamp, lat, lon) {
	console.log("stamp:" +stamp);
	var markerStamp = new ol.Feature({
		geometry : new ol.geom.Point([ lon, lat ]),
		text : html,
		name : name
	});

	if (stamp == 'OS') {
		markersOS.push(markerStamp);
	} else if (stamp == "ST" || stamp == "SP") {
		
		markersST.push(markerStamp);
	} else if (stamp == 'SI') {
		markersSI.push(markerStamp);
	} else if (stamp == "AC") {
		console.log('AC');
		markersAC.push(markerStamp);
	} else if (stamp == 'DC') {
		console.log('DC');
		markersDC.push(markerStamp);
	} else if (stamp == "Disconn") {
		markersDisconn.push(markerStamp);
	}
	else if (stamp == "TripEnd") {
		markersTripEnd.push(markerStamp);
	}
	else if (stamp == "TripStart") {
		markersTripStart.push(markerStamp);
	}
	else if (stamp == "Geofence") {
		markersGeoStamp.push(markerStamp);
	}

}

function createMarker2(name, html, lat, lon) { //start location
	var mark = new ol.Feature({
		geometry : new ol.geom.Point([ lon, lat ]),
		text : html,
		name : name
	});

	markers2.push(mark);

}


 function loadKML2(kmlurl){
	 const vector = new ol.layer.Vector({
		 source: new ol.source.Vector({
			 url: kmlurl,
			 format: new ol.format.KML({
				 extractStyles: true
			 })
		 }),
		 
	 });	

return vector;
 }
 
function setCenter(lon , lat){
	console.log("call into setCenter function....");
	//alert("lat"+lat+"long:"+lon);
	focus = [lon,lat];
} 

function setZoom(z){
	console.log("call to setzoom...")
	zoomval = z
}
 
function init() {
	console.log("center:" +focus);
	console.log("zoom:" +zoomval);
	var container = document.getElementById('popup');
	var content = document.getElementById('popup-content');
	/*var closer = document.getElementById('popup-closer');*/

	/**
	 * Create an overlay to anchor the popup to the map.
	 */
	var overlay = new ol.Overlay({
		element : container,
		autoPan : true,
		autoPanAnimation : {
			duration : 250
		}
	});

	/**
	 * Add a click handler to hide the popup.
	 * @return {boolean} Don't follow the href.
	 */

	/*  closer.onclick = function() {
	    overlay.setPosition(undefined);
	    closer.blur();
	    return false;
	};*/

	const map = new ol.Map(
			{
				view : new ol.View({
					projection : 'EPSG:4326',
					center : focus ,
					zoom : zoomval ,
					extent: [68.162834117480,6.7542559500000,97.41516105,37.06396505]
				}),

				target : 'map',

				layers : [ new ol.layer.Tile({
							source : new ol.source.XYZ({
										attributions : [ '<a href="http://myfleetview.net:8181/FleetViewtest1/index.jsp" style="text-decoration:none"><font face="Hemi Head 426" size="04" color="#0853A0">FleetView <br><font face="Hemi Head 426" size="01" color="#0853A0">Transworld Technologies Ltd.</a>' ],
										attributionsCollapsible : false,
										url : 'http://209.58.136.48:8224/osm/{z}/{x}/{y}.png'
									})
						}) ],

				overlays : [ overlay ]
			});

	 vectorKML = loadKML2('KMLJRM/TWIndiaBoundry.kml');
	 console.log("vector kml:" +vectorKML);
	 map.addLayer(vectorKML);
	 
	
	 console.log("GML Layer:"+layergml)
	 if(layergml==true){
		 map.addLayer(vectorGML)
		 layergml=false
	 }
	 
	var slider = new ol.control.ZoomSlider();
	map.addControl(slider);
	console.log("Zoom Slider added")

	var scaleline = new ol.control.ScaleLine();
	map.addControl(scaleline);

	var full_sc = new ol.control.FullScreen({
		label : 'F'
	});
	map.addControl(full_sc);

/*	var mouse_position = new ol.control.MousePosition();
	map.addControl(mouse_position);
*/	
	const overviewMapControl = new ol.control.OverviewMap({
		  layers: [
		    new ol.layer.Tile({
		      source: new ol.source.XYZ(
						{
							url : 'http://209.58.136.48:8224/osm/{z}/{x}/{y}.png'
						}) 
		    })
		  ]
		});
	map.addControl(overviewMapControl);

	if (markersSI.length != 0) {
		var vectorSI = new ol.layer.Vector({
			title : 'SI',
			source : new ol.source.Vector({
				features : markersSI
			//array
			}),
			style : new ol.style.Style({
				image : new ol.style.Icon({
					src : 'images/mm_20_green.png'
				})
			})

		});
		map.addLayer(vectorSI);
	}

	if (markersOS.length != 0) {

		var vectorOS = new ol.layer.Vector({
			title : 'OS',
			source : new ol.source.Vector({
				features : markersOS
			//marker list				
			}),
			style : new ol.style.Style({
				image : new ol.style.Icon({
					src : 'images/mm_20_red.png'
				})
			})

		});
		map.addLayer(vectorOS);
	}

	if (markersST.length != 0) {
		var vectorST = new ol.layer.Vector({
			title : 'ST',
			source : new ol.source.Vector({
				features : markersST
			//marker				
			}),
			style : new ol.style.Style({
				image : new ol.style.Icon({
					src : 'images/mm_20_white.png'
				})
			})

		});
		map.addLayer(vectorST);

	}

	if (markersAC.length != 0) {
		var vectorAC = new ol.layer.Vector({
			title : 'AC',
			source : new ol.source.Vector({
				features : markersAC
			}),
			style : new ol.style.Style({
				image : new ol.style.Icon({
					src : 'images/mm_20_blue.png'
				})
			})

		});
		map.addLayer(vectorAC);
	}

	if (markersDC.length != 0) {
		var vectorDC = new ol.layer.Vector({
			title : 'DC',
			source : new ol.source.Vector({
				features : markersDC
			}),
			style : new ol.style.Style({
				image : new ol.style.Icon({
					src : 'images/mm_20_yellow.png'
				})
			})

		});
		map.addLayer(vectorDC);
	}

	if (markersDisconn.length != 0) {
		var vectorDisconn = new ol.layer.Vector({
			title : 'Disconnection',
			source : new ol.source.Vector({
				features : markersDisconn
			}),
			style : new ol.style.Style({
				image : new ol.style.Icon({
					src : 'images/mm_20_grey.png'
				})
			})

		});
		map.addLayer(vectorDisconn);
	}

	if (markersTripEnd.length != 0) {
		var vectorTripEnd = new ol.layer.Vector({
			title : 'TripEnd',
			source : new ol.source.Vector({
				features : markersTripEnd
			}),
			style : new ol.style.Style({
				image : new ol.style.Icon({
					src : 'images/mm_20_brown.png'
				})
			})

		});
		map.addLayer(vectorTripEnd);
	}

	if (markersTripStart.length != 0) {
		var vectorTripStart = new ol.layer.Vector({
			title : 'TripStart',
			source : new ol.source.Vector({
				features : markersTripStart
			//array
			}),
			style : new ol.style.Style({
				image : new ol.style.Icon({
					src : 'images/mm_20_purple.png'
				})
			})

		});
		map.addLayer(vectorTripStart);
	}

	if (markersGeoStamp.length != 0) {
		var vectorGeoStamp = new ol.layer.Vector({
			title : 'Geofence Stamp',
			source : new ol.source.Vector({
				features : markersGeoStamp
			//array
			}),
			style : new ol.style.Style({
				image : new ol.style.Icon({
					src : 'images/mm_20_purple.png',
				}),

			})

		});
		map.addLayer(vectorGeoStamp);
	}

	if (markersGeo.length != 0) {

		var vectorGeoLoc = new ol.layer.Vector({
			title : 'Geofence Location',
			source : new ol.source.Vector({
				features : markersGeo
				}),
			style : new ol.style.Style({
				image : new ol.style.Icon({
					scale : 0.1, //original image size is too large. 
					src : 'images/redloc.png'
				})
			})

		});
		map.addLayer(vectorGeoLoc);

	}
	
	//console.log("warehouse markers: "+markersWare.length);
	//console.log("Zauri Markers: "+markersZauri.length);

	/*if(markersZauri.length != 0){
		
		console.log("Zauri vector layer condition");
		var vectorZauri = new ol.layer.Vector({
			title : 'Zauri Marker Location',
			source : new ol.source.Vector({
				features : markersZauri
				}),
			style : new ol.style.Style({
				image : new ol.style.Icon({
					scale: 0.7,
					src : 'images/red-dot.png'
				})
			})

		});
		map.addLayer(vectorZauri);
	}*/
	
	if (markersWare.length != 0) {		
		console.log("Ware vector layer condition")
		var vectorWare = new ol.layer.Vector({
			title : 'Ware Location',
			source : new ol.source.Vector({
				features : markersWare
				}),
			style : new ol.style.Style({
				image : new ol.style.Icon({ 
					src : 'images/violet1.png'
				})
			})

		});
		map.addLayer(vectorWare);
	
	}

	var vectorLayer2 = new ol.layer.Vector({
		title : 'Business Hubs',
		source : new ol.source.Vector({
			features : markers2
		//array
		}),
		style : new ol.style.Style({
			image : new ol.style.Icon({
				src : 'images/mm_20_black.png' //Start location
			})
		})

	});

	/*map.addLayer(vectorLayer);
	 console.log("Vector layer 1 added");*/

	map.addLayer(vectorLayer2);
	//console.log("Vector layer 2 added");

	var featureOverlay = new ol.layer.Vector({
		source : new ol.source.Vector(),
		map : map
	//our map object
	});

	map.on('pointermove', function(event) {
		
		if (featureOverlay) {
			featureOverlay.getSource().clear()  //clear overlays if previously present
			map.removeLayer(featureOverlay)     //remove overlay layer
		}

		feature = map.forEachFeatureAtPixel(event.pixel, function(feature,  //reads feature at pixel which mouse is pointing
				layer) {
			return feature;
		});

		if (feature) {

			var geometry = feature.getGeometry();
			var coordinate = event.coordinate;

			featureOverlay.getSource().addFeature(feature);   //add the pop-up to the overlay
			if(feature.get('text'))
			{
			   content1 = '<h3>' + feature.get('text') + '</h3>';	//setting the content of popup for markers 
			}
			else
				{
				 content1 =  '<h3>' + coordinate + '</h3>'     //setting the content of popup for KML plot and India Boundry
				}
			
			content.innerHTML = content1;    //set the content to appropriate div 
			overlay.setPosition(coordinate);  //set popup to show against the marker properly

		} 
	else {
			overlay.setPosition(undefined);   //close pop-up when mouse exits a particular feature. 
		}
	
	});

}