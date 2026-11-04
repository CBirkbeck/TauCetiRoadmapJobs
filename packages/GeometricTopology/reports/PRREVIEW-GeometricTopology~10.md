# Review of GeometricTopology (pull request #903 at 6f8b64f)

**Verdict:** needs changes

This is an incremental re-review of the 61 changed lines since `a8a1470`. The head is a merge of main into the branch: inside the folder it changes `STATUS.md` and `PROGRESS.md` (generated files, byte-identical to main's blobs) and one heading of `README.md` (`### From TauCetiRoadmap.HopfRinow` → `### From Completed.HopfRinow`, line 387), and it moves the worktree's `lake-manifest.json` pins to main's (Tau Ceti `358314d4`, Mathlib `f6090c70`). `Suggested.lean` and the 25 companion files are byte-identical to `a8a1470`. Because the pins moved, every pinned name and every headline statement was re-checked at the new pins, not only the changed heading. One finding blocks: the worker's gate fails its build check on this head (R01); the two style findings of r9 remain.

## R01 (P1) — The gate's build check fails on this head

**Location:** `TauCetiRoadmap/GeometricTopology/Suggested.lean:1`, "import Mathlib" as the first line of a file that does not begin with `module`.

**Claim:** the worker's gate at `6f8b64f` reports `build=1 FAIL`; every other counter is zero. Its one line is the diagnostic lake prints on a fresh compile of `TauCetiRoadmap.GeometricTopology.Suggested`:

```text
warning: TauCetiRoadmap/GeometricTopology/Suggested.lean: imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module` to the start of this file
```

The gate's rule makes a failed build check P1, and the folder is not accepted while the gate fails. The compile itself is clean: `lake env lean TauCetiRoadmap/GeometricTopology/Suggested.lean` from the worktree exits 0 with exactly 17 `declaration uses sorry` warnings and nothing else, and a gate rerun on the same head with the build already up to date prints every counter zero and `OK`. So the counter is tripped by the advisory lake emits for a non-`module` file importing a module-system package at this Mathlib pin (`f6090c70`), not by an elaboration error; the same text appears in the DGFloer r3 gate.

**Witness:** the gate line above. On main at `fa41b374`, 13 of the 123 `TauCetiRoadmap/*/Suggested.lean` files begin with the line `module` followed by `import Mathlib` (for example `ClassFieldTheory/Suggested.lean:1–2`, `IntegralLattices/Suggested.lean:1–2`, `ProfiniteCohomology/Suggested.lean:1–2`), so that form is one the gate and the merged roadmaps already admit.

**Repair:** insert the line `module` before `import Mathlib` at `Suggested.lean:1`, the form the advisory asks for and the 13 roadmaps on main use. Tested on this head: a scratch copy of `Suggested.lean` with that one line prepended elaborates with `lake env lean` at the pins of `6f8b64f`, exit 0, exactly 17 `declaration uses sorry` warnings and no other diagnostic; the 15 `TauCeti.*` imports, the `#check` lines and the 17 statements are unchanged. Retest: the gate on a fresh compile shows `build=0`. If the operators prefer roadmap files without `module`, the gate's build check has to be told to ignore this advisory instead; until one of the two happens the folder cannot be accepted.

## R02 (P3) — Companion Lean files keep forbidden commands, submodule imports and a contradicting ownership claim

**Location:** `TauCetiRoadmap/GeometricTopology/ExchangeFamily.lean:92–103`, `RealAlgebraicRealization.lean:53–57`, `SimplicialLinks.lean:88–94` (`#print axioms`); `LeeFrobenius.lean:1–4` and 13 further companions (`import Mathlib.<submodule>`); `LeeFrobenius.lean:14–15` ("GT6 owns the deformation and its filtered comparison") against `README.md:123–124` (the Lee deformation is GeometricTopology, Part II's).

**Claim:** the 25 companion files are unchanged since `c91c98f` (`git diff --stat a8a1470..HEAD -- TauCetiRoadmap/GeometricTopology` lists only `README.md`, `STATUS.md`, `PROGRESS.md`). The Lean form rules apply to every listed `.lean` file; the gate's scanners cover `Suggested.lean` only.

**Witness:** `grep -c '#print axioms'` gives 12, 5 and 7 on the three files named (24 commands); `grep -l '^\(public \)\?import Mathlib\.'` matches 14 files with 37 such lines; no companion file name occurs in `README.md`.

**Repair:** delete the 25 companion files (the README keeps their targets and Checks; a headline among them that is statable goes into `Suggested.lean` under its rules). If they are kept, delete every `#print axioms`, replace the submodule imports by the single `import Mathlib`, and align `LeeFrobenius.lean:14–15` with `README.md:123`. Retest: both grep counts are zero and each remaining file still elaborates with `lake env lean`. Same form finding as r6–r9; it does not block.

## R03 (P3) — Supplier heading uses a prefix no roadmap uses

**Location:** `README.md:387`, "### From Completed.HopfRinow".

**Claim:** the README shape names suppliers as `From TauCetiRoadmap.<X>`; a roadmap archived under `Completed/` keeps its name and namespace. `Completed/HopfRinow/Suggested.lean:12` is `namespace TauCetiRoadmap.HopfRinow`, so `Completed.HopfRinow` names a namespace that does not exist. On main, `AdicSpacesPartII/README.md:312` keeps `### From TauCetiRoadmap.AdicSpaces` although AdicSpaces is archived; every other citation of HopfRinow on main writes `HopfRinow Layer n` or links `Completed/HopfRinow/README.md` (`OptimalTransport/README.md:903`, `GeometricCurrents/README.md:18`).

**Witness:** `roadmaps resolve` on this README and on a scratch copy with the heading reverted to `TauCetiRoadmap.HopfRinow` both report no citation found nowhere, so the change was not needed for resolution; the depcheck is unaffected either way (0 problems). The README's own prose (`README.md:101`, `602`, `632`, `656`, `2065`, `2188`) still says `HopfRinow`, matching main's usage.

**Repair:** write the heading as `### From TauCetiRoadmap.HopfRinow` (main's convention for an archived supplier). Retest: `roadmaps resolve` still reports none missing (verified on the scratch copy). Style only; it does not block.

## Previous findings

- R01 — **not repaired:** the 25 companion files are byte-identical to `a8a1470`; `#print axioms` count 24, `Mathlib.<submodule>` import lines 37, `LeeFrobenius.lean:14–15` unchanged. Repeated as R02 (P3) above.
- (r9 reported one finding only; its account of r8's R01, R03 and R04 as repaired was re-checked: `Suggested.lean:115–127, 150–163, 186–190` still carry `sphere_theorem`, `waldhausen_theorem`, `moise_triangulation`; `README.md:892–899, 1460–1466, 2623–2628` still carry the corrected Kirby, Armond–Lowrance and Calegari locators; the Cerf docstring at `Suggested.lean:45–48` is unchanged.)

## Verified sound

**The gate.** The worker's gate at `6f8b64f` has every counter zero except `build=1`, which is R01: the lake `module` advisory on a fresh compile, not an elaboration error (`lake env lean` on the file exits 0 with exactly 17 `declaration uses sorry` warnings; a gate rerun with the build up to date prints `OK`). The other 26 counters (`set_option`, `blob`, `latex`, `tex`, `prnum`, `sorry-data`, `sorry-examples`, `residue`, `private-paths`, `imports`, `mathlib-subimports`, `no-import-mathlib`, `lean-lines`, `forbidden`, `dropped`, `readme-ids-missing`, `empty-sections`, `round-labels`, `long-fences`, `layer-ids`, `target-ids`, `depcheck`, `metadata`, `stray-files`, `dirty`, `outside-folder`, `source-material`) are zero on both runs. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GeometricTopology'` is empty (the 543 files listed in the change set are main's own commits brought in by the merge, and the merge base is now `fa41b374` = `origin/main`).

**Dependency check** (rerun on this head, with the new heading):

```text
depcheck: 204 roadmaps, 1392 edges, 0 problem(s)
```

No `UPWARD`, `CYCLE` or `moved:` line. HopfRinow is a roadmap on main (archived under `Completed/`), so citing it is allowed whatever the heading prefix.

**The changed heading.** `Completed/HopfRinow/README.md` on main (`fa41b374`) has `### Layer 1: the geodesic equation, the flow, and the exponential map` (line 264), `### Layer 2: normal neighbourhoods, the Gauss lemma, and minimizing geodesics` (line 427) and `### Layer 3: the Hopf–Rinow equivalence` (line 451), so the three clauses of `README.md:389–391` cite the right layers. The passages that consume them (`README.md:602` normal exponential from Layer 1, `632` Layer 1 exponential map and Layer 2 normal neighbourhoods, `656` normal neighbourhood of a point, `2065` Layers 1–3, `2188` geodesics and exponential map) are unchanged and match those layer contents; the pinned lemma named beside them, `TauCeti.Manifold.edist_riemannianExp_le`, is `Geometry/Manifold/Riemannian/Geodesic/Completeness.lean:94` at the new pin.

**Pinned names at the new pins.** `roadmaps resolve` checks cross-roadmap citations and roadmap Lean names only (it reports "Lean names outside TauCetiRoadmap were not checked"), so the 175 distinct backticked `TauCeti.*` names of the README were checked by script against the Tau Ceti source tree at `358314d4`: each has a declaration of its last component or occurs with its full name; none is missing. The declarations the r9 report opened are at the same file and line at the new pin: `TauCeti.Orientable` (`Geometry/Manifold/Orientation.lean:345`), `IsPossiblyNonorientableClosedHakenThreeManifold` (`Haken.lean:204`), `IsClosedHakenSurfaceEmbedding` (`Haken.lean:183`), `IsClosedIncompressibleSurfaceEmbedding` (`Incompressible.lean:39`), `IsClosedConnectedManifold` (`Basic.lean:57`), `IsSphereBoundsBall` (`Irreducible.lean:42`), `IsLocallyFlat` (`LocallyFlat/Basic.lean:376`), `TriangulationConjecture` (`Topology/TriangulationConjecture.lean:74`, with `triangulationConjecture_zero` at line 97), `SmaleConjecture` (`Geometry/Diffeomorphism/Smale.lean:46`), `AnnulusConjecture` (`LocallyFlat/Annulus.lean:105`), `WatanabeTheorem` (`Disc.lean:77`), `FreedmanSliceTheorem` (`KnotTheory/Slice/Freedman.lean:64`), `MostowRigidity` (`Hyperbolic/Mostow.lean:72`), `VirtualFiberingConjecture` (`VirtualFibering.lean:62`), `VirtualHakenConjecture` (`VirtualHaken.lean:65`), `JSJTheorem` (`JSJDecomposition.lean:248`), `GeometrizationConjecture` (`Geometrization.lean:144`), `unknot` (`KnotTheory/SmoothCircle.lean:284`), `SmoothAmbientIsotopic` (`SmoothLink/Isotopy.lean:39`).

**Duplication against the new pin.** `PROGRESS.md` (generated) lists objects landed in Tau Ceti between 2026-10-19 and 2026-10-25 (`MarkovBraid.homfly`, `rank_fundamentalGroup_le_heegaardGenus`, `Foliation.eulerClass`, `topologicalSliceGenus`, `unknotExteriorHomeomorph`, `exists_chartedSpace_hasGroupoid_PLGroupoid`, `orderedSimplicialHomologyIsoSingularHomology`, `framingNumber`). None of them exists at the roadmap's pin `358314d4` (grep of the whole Tau Ceti source tree), so no README target of 4.6, 5.1, 6.4, 9.2, 10.3 or 11.2 duplicates a pinned declaration, and no further headline became statable.

**Signatures and padding.** `Suggested.lean` is byte-identical to `a8a1470`; its 17 statements elaborate at the new pins with their binders in their own signatures (the file has no `variable` block; the worker's `signatures.md` lists 19 entries because its parser counted two artifacts, a stray `,` at line 32 and a "structure" at line 154, neither a declaration). A scratch copy with each `sorry` replaced by `first | rfl | infer_instance | simp | exact?` was elaborated at the new pins: 15 statements fail with `exact?` could not close the goal, and 2 (`alexander_sphere_bounds_ball`, `manolescu_triangulation_conjecture_false`) leave unsolved goals after `simp` unfolds the pinned proposition; none closes, so nothing is padding. The 17 names agree with `README.md:20–22` ("fourteen ... together with three") and each appears in the README (gate `readme-ids-missing=0`).

**Seeded sample.** None of the fifteen seeded sections (1.2, 2.1, 3.3, 4.6, 4.9, 4.13, 5.1, 6.3, 7.3, 7.4, 8.1, 8.3, 10.1, 10.2, 11.4) falls in the diff; 1.5 and 7.3 cite HopfRinow layers, which were resolved above. Their locator verification from the r8 and r9 reports stands.

**Ownership.** No new construction, carrier or target was added; the r8 ownership search stands. Ownership against open pull requests outside the brief's checkouts was not re-searched this round.

**Adversarial table.** The row for the changed passage was computed this round; the rows for untouched statements are carried from the r9 report (which carried the r8 values), as marked.

| Statement | Instances | Values on each side | Result; change |
|---|---|---|---|
| HopfRinow supplier contract (`README.md:387–391`) and its consumers (`602`, `632`, `656`, `2065`, `2188`) | the three layer citations against `Completed/HopfRinow/README.md`; the point embedding; the identity embedding | Layer 1 (line 264) = geodesic equation, flow, exponential map; Layer 2 (line 427) = normal neighbourhoods, Gauss lemma, minimizing geodesics; Layer 3 (line 451) = Hopf–Rinow; the completed roadmap also has a Layer 0 (line 229, reconciled distance), which the README does not need; `{p} ⊂ M`: normal bundle `T_pM`, tube = `exp_p` of a ball = normal neighbourhood of Layer 2; `id : M → M`: normal bundle of rank `dim M − dim M = 0`, tube `M` | citations correct at main `fa41b374`; heading prefix is R03 (style) |
| `sphere_theorem` (`Suggested.lean:120–127`) | as in the r9 report | `π₂(S² × S¹) = ℤ`; `S² × ℝ` non-compact, no compactness needed; `π₂(ℝ³) = π₂(ℝP³) = 0` vacuous; `S¹ × ℝP²` irreducible with `π₂ = ℤ`, so `Orientable` is necessary and present; free = based null-homotopy for `S²` (carried from the r9 report, values as computed there) | no change; re-elaborated at the new pin |
| `waldhausen_theorem` (`Suggested.lean:155–163`) | as in the r9 report | `T³`, `GL(3,ℤ)`; `L(7,1) ≃ L(7,2)` not homeomorphic, excluded by the Haken predicate; `S¹ × S²` excluded by `IsSphereBoundsBall` (carried from the r9 report, values as computed there) | no change; re-elaborated |
| `moise_triangulation` (`Suggested.lean:189–190`) | as in the r9 report | `TriangulationConjecture 3` at `TriangulationConjecture.lean:74` quantifies over compact `T2` charted spaces on `ℝ³`; `M = ∅`, disconnected `M`, universe `u`; pin proves only `n = 0` (line 97) (carried from the r9 report) | no change |
| Cerf docstring (`Suggested.lean:45–48`) | `π₀` of a homotopy equivalence; `O(4)` | two components of `O(4)`, bijection on `π₀` (carried from the r9 report) | no change |
| 2.3 annulus locator (`README.md:892–899`) | Kirby's `n` vs README's `n + 1` | `n ≥ 6`, `n = 5`, `2ⁿ`-fold covers (carried from the r9 report) | no change |
| 4.8 Turaev genus locator (`README.md:1460–1466`) | trefoil `#` mirror trefoil | `g_T = (2 + 6 − 8)/2 = 0`, span `6 = c` (carried from the r9 report) | no change |
| 10.2 Palmeira Check (`README.md:2623–2628`) | Calegari 4.38 hypotheses | `S² × S¹` universal cover `S² × ℝ ≠ ℝ³` (carried from the r9 report) | no change |
| 8.1 Checks (`README.md:2233–2241`) | trefoil group; `S¹ × ℝP²`; granny vs square | `S₃` quotient; two-sided `ℝP²`; `σ = −4` vs `0` (carried from the r9 report) | no change |
| 17 headlines in `Suggested.lean` | each elaborated and probed at the new pins | 17 `sorry` warnings, 0 errors; probe: 15 `exact?` failures, 2 unsolved after `simp`; `14 + 3 = 17` agrees with `README.md:20–22` | no change |
| 1.5 radius function, nesting, unit-circle tube, pinned constant-radius theorem (`README.md:647–663`, `254–256`) | circles of radius `1/n` at `(3n,0)`; `δ' = 1/4 ≤ 1/2`; `ε ≤ 1` | inward normals of length `1/n < ε` collide; annuli `(3/4, 5/4) ⊂ (1/2, 3/2)`; `(x, −x) ↦ 0` for `ε > 1`; hypotheses compact, `C²`, injective differential (carried from the r9 report, values as computed there) | no change |
| 1.7 compact comparison and Checks (`README.md:715–745`) | `|x|` on `[−1,1]`; `K = ∅`; `x ↦ x³` | values `1, 0, 1`; `0` cells; `6x ≠ 0` off `0` (carried from the r9 report) | no change |
| 4.6 substitution, trace formula, skein conventions (`README.md:1328–1386`) | `N = 2`, `q = 2`; trefoil `σ₁³` | `67/256` both sides; `P(T) = 2v² − v⁴ + v²z²`; `tr(σ⁻¹) = 5/8` (carried from the r9 report) | no change |
| 4.5 Jones, 4.8 MFW, 4.10 two-bridge, 4.2 closures, 4.4 Alexander, 4.3/6.2 signs, 4.7 colourings (`README.md:1192–1544`) | as in the r9 report | `V(T) = t + t³ − t⁴`; spans `1, 2`; `2·3 ≡ 1 (5)`; `1212` non-planar; `Δ(−1)` odd; `σ(3₁) = −2`; Arf `1, 1, 0` (carried from the r9 report) | no change |
| 1.8 genus, 1.4/3.3 disc theorem, 3.1 topologies (`README.md:556–560`, `773–778`, `980–985`, `1049–1066`) | torus; `x ↦ ±x`; `f_k = θ + k⁻² sin kθ` | `(2−0−0)/2 = 1`; orientation clause at Palais line 78; `C¹` not `C²` (carried from the r9 report) | no change |
| 5.1–5.4 exterior, fillings, Property P/R, Moser (`README.md:1708–1828`) | empty link; unknot `p/q`; `T(2,3)` at `5, 6, 7` | `∂X = ∅`; `L(p,q)`; `L(5,4)`, `L(2,1) # L(3,1)`, `L(7,2)` (carried from the r9 report) | no change |
| 6.1–6.4 concordance, averaged signature, Freedman (`README.md:1879–1999`) | trefoil vs mirror; `ω = e^{±iπ/3}`; Whitehead double | `σ = −2 ≠ 2`; mean `−1`; `Δ = 1`, `τ = 1` (carried from the r9 report) | no change |
| 7.1–7.4 (`README.md:2047–2167`) | genus-2 surface; Gieseking; Weeks | `4π`; `v₃ = 1.0149…`; `0.9427… < 1.0149… < 2.0298…` (carried from the r9 report) | no change |
| 8.2, 8.4–8.6 (`README.md:2259–2429`) | `S¹ × S²`; trefoil exterior; `T³`; Poincaré sphere | prime not irreducible; multiplicities `2, 3`; `0` tori; `|π₁| = 120` (carried from the r9 report) | no change |
| 9.1–9.2 (`README.md:2475–2518`) | `L(1,q)`; `T³`; Poincaré sphere | genus `0`; `3 = rank ℤ³`; `g = 2 = rank` (carried from the r9 report) | no change |
| 11.1, 11.3–11.5 (`README.md:2663–2799`) | one edge; `ΣP`, `Σ²P`; `n = 5, 0, 4`; dunce hat | `∂e ∗ ∅ = S⁰`; vertex link not a manifold; `E₈`; no free face but contractible (carried from the r9 report) | no change |

## Not verifiable

- Turaev 1987 (L'Enseignement Math.), Waldhausen 1968, Papakyriakopoulos 1957, Moise 1952, Bing 1959, Palmeira 1978, Quinn 1982, Lickorish Chapter 5: as in the r8 and r9 reports, cited by locator only; none of their passages is touched by this change set.

## Source issues

- none
