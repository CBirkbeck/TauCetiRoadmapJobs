# Review of NoncompactQuantumSymmetry (pull request #1015 at 948432f)

**Verdict:** needs changes

Incremental re-review: the folder has 0 changed lines since `4e793e8`; the head merged main (`11d488ea`), which now carries OperatorAlgebraDynamics as revised by #1137 and SmoothBanachRepresentations (#1145). One P3 finding remains, in the pull request's description only; nothing in the folder needs to change.

## R01 (P3) — The description still presents #1137 and #1145 as open suppliers

**Location:** the description, "Suppliers and consumers": "The supplier pull requests that are still open are in the task list below … Two of them matter … #1137 revises OperatorAlgebraDynamics. The D1.BorelPrefix statements cited here exist only in that revision, so it merges before this pull request."

**Claim:** the description's prose agrees with this head.

**Witness:** at this head `TauCetiRoadmap/OperatorAlgebraDynamics/README.md` has `### D1.BorelPrefix` `:1226`, `### D1.TwistedBorel` `:1371`, `### D4.Harmonic` `:2267` (main `b54415bf`); `TauCetiRoadmap/RepresentationTheory/SmoothBanachRepresentations/README.md` is on main (`e1fd7107`).

**Repair:** replace the paragraph and its two bullets with: "The supplier pull requests that are still open are in the task list below, and the merge order follows it. OperatorAlgebraDynamics (D1.BorelPrefix, D1.TwistedBorel, D4.Harmonic) and SmoothBanachRepresentations (Layers 0–4, which Layer 3 (M0) specializes to unitary Hilbert representations) are on main."

## Previous findings

- R01 — repaired: D1.BorelPrefix, D1.TwistedBorel and D4.Harmonic are on main (`TauCetiRoadmap/OperatorAlgebraDynamics/README.md:1226, :1371, :2267`); the QuantumFoundations "supplier specifications" sentence is gone. The repair-by-merge left the description stale (R01 above).
- R02 — not repaired: README still 9,496 lines (699,245 bytes). Not written again, because its witness does not hold at the heads read here: QuantumFoundations (#1771 at `05c97bc`, `:66`, `:1063`, `:1069`) consumes "M5's de Sitter classification, `M5.AffineG5` and contractions; M6's tensor decompositions", so the M5/M6 tail has a consumer; and 11 READMEs on main are larger (up to 1,768,949 bytes). The size is recorded for the human reviewers below.

## Verified sound

| # | Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- | --- |
| C1 | `Suggested.lean:19–21` and README `:195`: automatic continuity and Polishness of lcsc groups "supplied by OperatorAlgebraDynamics D1.BorelPrefix" | supplier text at this head; H=0, dim H=1; strong vs weak | Supplier `:1226–1262` states both (Polish G → separable metrizable K; lcsc Hausdorff ⇒ Polish). ‖Uh−Vh‖²=‖h‖²+‖h‖²−2Re⟨Uh,Vh⟩, so weak convergence gives strong. H=0: trivial group; dim 1: 𝕋 | Pass |
| C2 | README `:195` row, D1.TwistedBorel and D4.Harmonic | headings at this head | `:1371` "Scalar Borel fibers of circle extensions" (the fibres `J_k(E_ω)≅C*(G,ω^k)`); `:2267` Fourier isomorphism `C*(Ĝ)≅C₀(G)`, i.e. `C*(N)≅C₀(N̂)` for abelian N | Pass |
| F1 | R01, description | description vs head | Description: D1.BorelPrefix "only in that revision"; head: `:1226` on main | Fail (R01) |

The rows for all other statements stand as in the previous review, of `4e793e8`.

- Gate (my run on this head): `gate NoncompactQuantumSymmetry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate adds `build=0`.
- Dependency check (`--movable`): `depcheck: 263 roadmaps, 2577 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. This roadmap is line 167 of the merge order.
- Elaboration: `lake env lean` on `Suggested.lean` warns `declaration uses sorry` at `:89`, `:137`, `:161`, `:234`, `:273`, and nothing else. The file is unchanged, so the signature and padding probes of the previous review stand.
- Outside the folder: `git diff --stat origin/main...HEAD` excluding the folder is empty; the files the change list names come from the merge of main.
- Cross-roadmap citations resolved again on main `11d488ea` (13): OperatorAlgebraDynamics D1, D1.BorelPrefix, D1.TwistedBorel, D3, D4.Harmonic, D5; SmoothBanachRepresentations Layers 0–4 (`:98–316`); UnboundedOperators UO-B04 (`:473`), UO-B05 (`:491`), UO-E03 (`:954`); VonNeumannAlgebras V4.0.Fields; CStarAlgebras C2.AnnHull (`:695`), C6.5 (`:1414`); HilbertModules H3 (`:262`), H5 (`:356`); AutomorphicFormsOnReductiveGroups §2.1 (`:301`). At open heads: MetaplecticAutomorphicForms 0.1, 0.7, 0.8, 0.13 (#1063 `:78`, `:136`, `:155`, `:240`).
- Overlaps: no open pull request changes this roadmap, drops an id it cites, or is the only definer of one; main has no second copy.
- Remark (untouched text): README `:205` and `:6265` cite "LaguerreJacobi A/B" and "A–B"; LaguerreJacobi's open head (`3e89142`) numbers these Layers 1 and 2 (its `:838` names this roadmap as their consumer).
- No source locator was reopened: the diff changes no passage, so the seeded sample falls in none.

Overlap check: read RelativisticQuantumFieldTheory (#1772), QuantumFoundations (#1771), OperatorAlgebraDynamics (main); Wigner's theorem and P.1–P.5: this roadmap (QuantumFoundations `:817` cites it); `U(H)_s`, Pettis, Polishness of lcsc groups: OperatorAlgebraDynamics D1.BorelPrefix (cited here); the noncompact representation models M2/M4: this roadmap (RelativisticQuantumFieldTheory `:546` cites them).

Source independence: changed passages only: 0 passages compared with 0 sources, because the diff adds or changes no passage; no layer was added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- Mackey1958 §6: settled as uncertified, cited by locator only.
- Lang, *SL₂(ℝ)*, Chapter VIII; Bargmann 1947; Dooley's and Grundling's notes: not readable from a legal copy named in the manifest, as in the previous review; not reopened this round.

## Source issues

- none

## For the human reviewers

- Size: `TauCetiRoadmap/NoncompactQuantumSymmetry/README.md` has 9,496 lines (699,245 bytes); Layers 8–9 (`:3869–9464`) are 5,596 of them. Eleven READMEs on main are larger. Whether to split into a Part II is yours to decide.
- Scope/licence: the References (README `:9476–9480`) name Dooley's and Grundling's lecture notes, cited by "physical pages" as acceptance context; no published or hosted copy is named, and the manifest does not record them.
