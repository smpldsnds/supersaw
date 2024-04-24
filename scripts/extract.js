const { SoundFont2 } = require("soundfont2");
const fs = require("fs");

// Do not specify any encoding type
const buffer = fs.readFileSync("Supersaw Collection 2.sf2");
const sf = new SoundFont2(buffer);

const mapInstrument = (i) => ({
  name: i.header.name,
  samples: i.zones.map((z) => z.sample.header),
});

const meta = JSON.stringify(sf.metaData, null, 2);
const instruments = sf.instruments.map(mapInstrument);
const presets = sf.presets.map((p) => ({
  header: p.header,
  instruments: p.zones.map((z) => mapInstrument(z.instrument)),
}));
const data = JSON.stringify(
  { meta: sf.metaData, instruments, presets },
  null,
  2
);

fs.writeFileSync("supersaw-collection-2.json", data);
