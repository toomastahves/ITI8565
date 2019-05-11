/* Celestial objects */
SELECT TOP 10000
   s.class, s.z as redshift, s.elodieSpType as spectraltype, s.wCoverage, p.ra, p.dec, p.u, p.g, p.r, p.i, p.z, p.deVRad_u, p.deVRad_g, deVRad_r, deVRad_i,deVRad_z, p.deVAB_u, p.deVAB_g, deVAB_r, deVAB_i,deVAB_z, p.mCr4_u, p.mCr4_g, mCr4_r, mCr4_i, mCr4_z, p.petroRad_u, p.petroRad_g, petroRad_r, petroRad_i, petroRad_z, p.petroFlux_u, p.petroFlux_g, petroFlux_r, petroFlux_i, petroFlux_z, p.petroMag_u, p.petroMag_g, petroMag_r, petroMag_i, petroMag_z, p.psfMag_u, p.psfMag_g, psfMag_r, psfMag_i, psfMag_z, s.spectroFlux_u, s.spectroFlux_g, s.spectroFlux_r, s.spectroFlux_i, s.spectroFlux_z
FROM PhotoObj AS p
   JOIN SpecObj AS s ON s.bestobjid = p.objid
WHERE 
   p.u BETWEEN 0 AND 19.6
   AND g BETWEEN 0 AND 20
   AND s.elodieSpType != "unknown"

/* Stars */
SELECT TOP 10000
   s.elodieSpType as spectraltype, s.z as redshift, s.elodieBV as color, s.elodieTEff as temperature, s.elodieLogG as gravity, s.elodieFeH as metallicity
FROM PhotoObj AS p
   JOIN SpecObj AS s ON s.bestobjid = p.objid
WHERE 
   p.u BETWEEN 0 AND 19.6
   AND g BETWEEN 0 AND 20
   AND s.elodieSpType != "unknown"
   AND s.class = "STAR"
