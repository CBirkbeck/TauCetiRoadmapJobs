# Review of SiegelModularForms (pull request #1714 at 8723e79)

**Verdict:** needs changes

An incremental re-review of 0 changed lines since `8723e79`; this round reads the pull request's title and description against the head.

## R01 (P3) — the description's summary reverses the direction of supply to two siblings

**Location:** pull request description, generated block `roadmap-summary`, "Why Tau Ceti wants it": "This supplies the Siegel side of the half-integral weight roadmap’s Jacobi theory and the higher-degree theta series needed by lattice packings."

**Claim:** The head consumes both roadmaps and neither needs anything from it: `HalfIntegralWeightModularForms` 6.1–6.4 and `LatticePackingsAndPerfectForms` 5.6 are suppliers, and the same description lists both under "Depends on".

**Witness:** `TauCetiRoadmap/SiegelModularForms/README.md:447–463` ("From TauCetiRoadmap.HalfIntegralWeightModularForms", "From TauCetiRoadmap.LatticePackingsAndPerfectForms"); `:3507–3508` (the siblings "name" and "defer"); `LatticePackingsAndPerfectForms/README.md:166–167` at `5efad728` is a scope deferral, not a need.

**Repair:** Replace the sentence by: "It builds the Siegel side that the half-integral weight roadmap leaves to it (the Fourier–Jacobi expansion, the Maass lift, Saito–Kurokawa and the Gritsenko lift) on that roadmap's Jacobi theory (its 6.1–6.4), and owns the degree-`g` theta series that the lattice-packings roadmap leaves to it." The rest of the paragraph stands.

## Previous findings

- none: the review of `8723e79` (PRREVIEW-SiegelModularForms~12) accepted with no finding, and the folder has not changed since.

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Description: "12 layers and 66 milestones" | headings of `README.md` at the head | `## Layer k` headings: 12 (Layers 0–11); `### k.n` headings: 7+3+6+5+3+4+9+6+5+8+6+4 = 66 | Pass |
| Description: "level 2, 3, 4 rings" | 6.5–6.8 | `Γ₂(2)` and `Γ₀(2)` (6.5, 6.7), `Γ₀(3)` (6.6), `Γ₀(4)` (6.8) | Pass |
| Description: `metadata.toml` "arXiv topic `math.NT`" | the file | `topic = "math.NT"` | Pass |
| 9.2 `dim J_{10,1} = dim J_{12,1} = 2` (cited by R01's passage, `README.md:3507`), through the supplied `J_{k,1} ≅ M_{2k−2}(SL₂(ℤ))` | `k = 10, 12`; control `k = 4` | `dim M₁₈ = ⌊18/12⌋ + 1 = 2`, `dim M₂₂ = ⌊22/12⌋ + 1 = 2` (`22 ≢ 2 mod 12`); `k = 4`: `dim M₆ = 1`, `J_{4,1} = ℂ·E_{4,1}`; the isomorphism is `HalfIntegralWeightModularForms` 6.3, so the supply runs into this roadmap | Pass; direction as in R01 |
| Direction of supply with the two siblings (R01) | both READMEs at their open heads | `HalfIntegralWeightModularForms` (`d7e7ece5`) `:188–190` and `:1947`: "SiegelModularForms §§9.2–9.6 consumes … §§6.1–6.4"; `LatticePackingsAndPerfectForms` (`5efad728`) `:166–167`: degree-`g` theta series "is `SiegelModularForms`'" | Description contradicted (R01) |

Rows for the roadmap's statements stand as in the previous review, of `8723e79`: no statement changed.

- **Description, sentence by sentence** (11 further claims read against the head, none contradicted): arithmetic subgroups and finite-dimensional holomorphic weights (0.6, 1.1); Koecher (2.4); Eisenstein and theta series (Layers 4–5); Igusa (6.3); Hecke (Layer 7); spinor and standard `L`-functions with functional equations (8.3); Saito–Kurokawa, Gritsenko, Ikeda, Miyawaki (9.5–9.8); paramodular conjecture conditional (`README.md:80`, 10.6); Maass–Cohen formula through the Jacobi Eisenstein series and the Maass lift (4.2, `:1307–1320`); the consumed doubling functional equation (`:386–388`, `:2593`); the three files listed. The title and "the roadmap, 12 layers" say that the pull request adds a roadmap; the folder is not on main.
- **Generated `depends-on` block** (outside step 8, read for R01 only): `ModularForms`, `ThetaSeries`, `IntegralLattices`, `LFunctions`, `AdelicAlgebraicGroups` and `SmoothRepresentationsOfLocalGroups` are on main at `c639cfa`.
- **Gate** (worker's, on this head): every check `0`, `build=0`, `OK`.
- **Dependency check** with the candidate order, `--movable`, main and this pull request: `depcheck: 238 roadmaps, 2254 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- **Elaboration:** `lake env lean` on `Suggested.lean` exits `0` with 72 `declaration uses sorry` warnings and nothing else. The file is unchanged since the signature and one-tactic probes of the earlier reviews.
- **Outside the folder:** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SiegelModularForms'` prints nothing.
- **Seeded sample:** none of the 15 sampled targets falls in a changed passage (the folder did not change); no locator was re-read this round.
- **Overlaps** (`scratch/overlaps.md`): no other open pull request changes this roadmap; no cited id dropped; no id defined only by an open revision; no second copy on main.

Overlap check: read HalfIntegralWeightModularForms and LatticePackingsAndPerfectForms at their open heads where they name this roadmap (Jacobi carrier and `V_l`: HalfIntegralWeightModularForms; degree-`g` theta series: this roadmap; degree-one harmonic theta series: LatticePackingsAndPerfectForms); the other listed roadmaps were not re-read, no passage having changed.

Source independence: changed passages only: 0 passages compared with 0 sources (the folder did not change); the arrangement was not compared again, no layer having been added, removed or reordered.

## Not verifiable

- "One of 23 roadmaps for the mathematics behind the LMFDB, opened as drafts" (description): a statement about other pull requests, not checked against this head.
- Everything the previous reports listed for unchanged text (the uncertified and waived works, the Project Euclid stubs, the LMFDB knowls) still applies; no source was opened this round.

## Source issues

- none

## For the human reviewers

- The worker's source listing gives four uncertified keys the titles of unrelated works (`mizumoto1991`, `arakawa1983`, `satoh1986`: an article on Teichmüller spaces, one on the integer 5906, one on an exotic 4-manifold); the README's own references are unaffected.
