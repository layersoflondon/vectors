# Vector layers for Layers of London
This is a repo of various vector layers which we use in the Layers of London project, here: https://www.layersoflondon.org/map

# Converting ESRI gdb format to GeoJSON
We use GeoJSON to render the data on the map. There is a utility script to convert gdb to JSON layers.

```
script/gdb_to_geojson.sh -i your_file.gdb -o folder_to_export_to/
```

This requires docker to be installed. The first run will download the container which takes a few minutes.

