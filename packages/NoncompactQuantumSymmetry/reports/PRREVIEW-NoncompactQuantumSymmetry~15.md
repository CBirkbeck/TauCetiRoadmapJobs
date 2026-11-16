# Review of NoncompactQuantumSymmetry (pull request #1015 at 73be053)

**Verdict:** accepted

Incremental re-review of 4 changed lines since `948432f` (README `:205` and `:6265`), and of the pull request's title and description against this head. No finding.

## Previous findings

- R01 — repaired: the description now reads "Every other roadmap the README names as a supplier is on main, among them OperatorAlgebraDynamics (D1.BorelPrefix, D1.TwistedBorel, D4.Harmonic) and SmoothBanachRepresentations (Layers 0–4 …)"; only #117 and #1063 are listed as open.

## Verified sound

| # | Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- | --- |
| C1 | README `:205`, `:6265–6267`: "LaguerreJacobi Layers 1–2" owns polynomials, Rodrigues/orthogonality, finite exponential moment, Hilbert-basis comparison | LaguerreJacobi head `3e89142` | Layer 1 `:233` (§1.1 definition, §1.3 Rodrigues `:291`); Layer 2 `:328` (§2.2 moment `:352`, §2.3 orthogonality `:367`, §2.4 bases `:399`); its `:839` names this roadmap as consumer of Layers 1 and 2 | Pass |
| C2 | README `:6267–6270`: `x=2E`, `g(x)=f(x/2)√x/2` unitary `L²(E dE) → L²(dx)`; Laguerre parameter `α=2j+1` | norm computed; j=0, j=1/2; supplier hypothesis `-1<α` | `∫|g|²dx = ∫|f(x/2)|²(x/4)dx = ∫|f(E)|²·(2E/4)·2 dE = ∫|f|²E dE` (reading `(√x)/2`). j=0: α=1; j=1/2: α=2; both `> -1`, so §2.4's `L²((0,∞))` Laguerre-function basis applies | Pass |
| C3 | Description: "#117 adds LaguerreJacobi … its Layers 1–2: the generalized Laguerre polynomials, their orthogonality and the Laguerre-function basis of `L²((0,∞))`" | LaguerreJacobi head, README `:205` | Same numbering in README and description; §2.4 states the basis of `Lp 𝕜 2 (volume.restrict (Set.Ioi 0))` | Pass |
| C4 | Description: "ten layers", the ten layer titles, three files, "No other folder is changed" | head | `## Layer 0` `:218` … `## Layer 9` `:6508`, titles as listed; folder holds `README.md`, `Suggested.lean`, `metadata.toml`; diff outside the folder: empty | Pass |
| C5 | Description: "#1063 … Layer 0, §§0.1–0.13"; "Every other roadmap the README names as a supplier is on main"; "two consumers" | #1063 head `1dab48e`; main `4dc1e15`; README `:9465–9473` | Metaplectic `### 0.1` `:78`, `### 0.13` `:240`. On main: SmoothBanachRepresentations, CompactGroups, AutomorphicFormsOnReductiveGroups, OperatorAlgebraDynamics, PseudodifferentialOperators, RiemannianGeometry, Completed/HopfRinow, SpinRepresentations, InductionRestriction, LieGroupoidsPoisson, CStarAlgebras, HilbertModules, VonNeumannAlgebras, UnboundedOperators, SchurWeyl. Consumers named: RelativisticQuantumFieldTheory `:9467`, QuantumFoundations `:9472` | Pass |

The rows for all other statements stand as in the previous review, of `948432f`.

- Gate (my run on this head): `gate NoncompactQuantumSymmetry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate adds `build=0`.
- Dependency check (`--movable`): `depcheck: 263 roadmaps, 2577 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Elaboration: `lake env lean` on `Suggested.lean` warns `declaration uses sorry` at `:89`, `:137`, `:161`, `:234`, `:273`, and nothing else. The file is unchanged since `948432f`; the signature and padding probes of the earlier reviews stand.
- Cross-roadmap citations resolved for the changed passages (2): LaguerreJacobi Layers 1–2 at its open head `3e89142`; MetaplecticAutomorphicForms Layer 0, 0.1–0.13 at `1dab48e`. No "LaguerreJacobi A/B" or "A–B" remains in the README (the remark of the previous review is met).
- Overlaps: no open pull request changes this roadmap, drops an id it cites, or is the only definer of one; main (`4dc1e15`) has no second copy. The five Lean-name leads of the citation resolver are this roadmap's own `Suggested.lean` declarations and one prose target, not library claims.
- No source locator was reopened: the two changed passages carry no source locator, so the seeded sample falls in none.
- Remark (untouched text): README `:6267` writes `√x/2`; the map is unitary only when read as `(√x)/2` (the reading `√(x/2)` gives `2‖f‖²`).

Overlap check: read RelativisticQuantumFieldTheory (#1772), QuantumFoundations (#1771), OperatorAlgebraDynamics (main); Wigner's theorem and P.1–P.5: this roadmap; `U(H)_s`, Pettis, Polishness of lcsc groups: OperatorAlgebraDynamics D1.BorelPrefix (cited here); the noncompact representation models M2/M4: this roadmap; the Laguerre polynomials and their `L²` bases: LaguerreJacobi Layers 1–2 (cited here).

Source independence: changed passages only: 2 passages compared with 0 sources (neither cites a source; both are supplier citations), none shared; no layer was added, removed or reordered, so the arrangement was not compared again.

Research link: Wigner's theorem, Mackey's imprimitivity theorem and semidirect-product machine (Mackey 1958; Echterhoff 2010 for the Green–Rieffel form) and the unitary duals of the Poincaré, Galilei and de Sitter groups (Bargmann 1947; Arends–Bang-Jensen–Frahm 2024); rests on the README's summary and its References.

## Not verifiable

- Mackey1958 §6: settled as uncertified, cited by locator only.
- Lang, *SL₂(ℝ)*, Chapter VIII; Bargmann 1947; Dooley's and Grundling's notes: not readable from a legal copy named in the manifest, as in the previous reviews; not reopened this round.

## Source issues

- none

## For the human reviewers

- Size: `TauCetiRoadmap/NoncompactQuantumSymmetry/README.md` has 9,496 lines (699,252 bytes); Layers 8–9 (`:3869–9464`) are 5,596 of them. Eleven READMEs on main are larger. Whether to split into a Part II is yours to decide.
- Scope/licence: the References (README `:9476–9480`) name Dooley's and Grundling's lecture notes, cited by "physical pages" as acceptance context; no published or hosted copy is named, and the manifest does not record them.
