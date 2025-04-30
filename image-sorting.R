library(stringr)
library(lubridate)
library(dplyr)

# Chemin du dossier source là où toutes les images sont stockées
dossier_source <- "chemin/vers/vos/images/"

# Création des 8 dossiers de sortie
dossiers_sortie <- file.path(dossier_source, sprintf("Position_%02d", 1:8))
sapply(dossiers_sortie, dir.create, showWarnings = FALSE)

# Extraction des métadonnées
fichiers <- list.files(dossier_source, pattern = "\\.jpg$", full.names = TRUE)

df <- data.frame(fichier = fichiers, nom = basename(fichiers))  %>%
  mutate(
    id_serie = str_extract(nom, "(?<=DSC_)\\d+(?=_D5200)") %>% as.numeric(),  # Extraction de l'ID numérique
    datetime = str_extract(nom, "\\d{4}-\\d{2}-\\d{2}-\\d{2}-\\d{2}-\\d{2}") %>% ymd_hms()  # Extraction de la date/heure
  ) %>%
  
  # Calcul de la position dans la série
  mutate(position = (id_serie - min(id_serie, na.rm = TRUE)) %% 8 + 1) %>%
  
  # Vérification de la cohérence temporelle
  group_by(grp = cumsum(c(1, diff(id_serie) != 1))) %>%
  mutate(
    intervalle = difftime(datetime, lag(datetime)),
  # Ajuste la tolérance temporelle (3600-4000 secondes = 1h ± 5 min) si par endroit ca depasse 5 min
    valid_interval = all(intervalle >= 3600 & intervalle <= 4000, na.rm = TRUE)
  ) %>%
  ungroup()

 # Validation des séries (Tu peux te passer de cette etape)
if (any(!df$valid_interval, na.rm = TRUE)) {
  warning("Certaines séries ont des intervalles temporels irréguliers!")
}

# ************** Répartition dans les dossiers *************
for (i in 1:8) {
  df_subset <- df %>% filter(position == i) %>% pull(fichier)
  
  # Ensure that the destination folder exists before copying files
  if (!is.null(df_subset) && length(df_subset) > 0) {
    file.copy(df_subset, to = dossiers_sortie[i])
  }
}

# Vérification finale
cat(sprintf(
  "Répartition terminée : %d images classées dans %d séries",
  nrow(df),
  nrow(df) / 8
))
