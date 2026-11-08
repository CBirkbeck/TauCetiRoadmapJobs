# Review of GeometricTopology (pull request #903 at a49ede6)

**Verdict:** needs changes

This is an incremental re-review of the 61 lines of `TauCetiRoadmap/GeometricTopology/README.md` that changed since `b647e5c`. `Suggested.lean` has not changed (md5 `1f4337fb`), and no file outside the folder has changed. The Sard repair is mathematically right, and its new transversality route and Lindelöf Check recompute (see the table below). Four defects remain.

- **R01 (P1).** Naming Tau Ceti commit `2fd255d9` in the supplier heading exposes a pin split. `Suggested.lean` and one supplier entry are written against the branch pin `358314d`. Five cited declarations exist only at `2fd255d9`. The Lean file does not build at `2fd255d9`, which is the commit the README names and the pin main merges with.
- **R02 (P2) and R03 (P3).** Run now with the command the brief gives, the gate fails `dropped=33`. The project's dropped-names list, added to the configuration after the previous review, names PlanarTopology, HomotopySpheres and SurfaceTopology. The README mentions them 23, 6 and 4 times.
- **R04 (P3).** The pull-request description finding of the previous review is not repaired.

## R01 (P1) — Two Tau Ceti pins: the README names 2fd255d9, but `Suggested.lean` builds only at 358314d

**Location:**
- `README.md:278`: "### From Tau Ceti (commit 2fd255d9)".
- `README.md:413`: "`TauCeti.Orientable I n M` (`Orientation.lean`)".
- `Suggested.lean:8`: "public import TauCeti.Geometry.Manifold.Orientation".
- `Suggested.lean:125` and `:161`: "[TauCeti.Orientable (𝓡 3) ∞ M]".

**Claim:** The heading says that every declaration in the section is taken at Tau Ceti `2fd255d9`, main's pin. That holds for the five names the branch pin `358314d` lacks:
- `TauCeti.exists_isMorse`
- `ContMDiffMap.exists_isMorseOn_hasCompactSupport_sub_compl`
- `TauCeti.exists_flow_apply_eq_sub`
- `TauCeti.exists_diffeomorph_sublevel`
- the new `ContMDiff.isMeagre_image_criticalPoints`, at `Geometry/Manifold/Sard/Meagre.lean:114`; the `Sard/` directory does not exist at `358314d`.

It fails for `TauCeti.Orientable`. At `2fd255d9` the module `TauCeti.Geometry.Manifold.Orientation` no longer exists: `Orientation/` is a directory. The class is `Orientable I M`, with no smoothness argument, at `Orientation/Basic.lean:263`.

So `Suggested.lean` builds at `358314d` (17 `sorry` warnings, exit 0) but not at `2fd255d9`:
- its import names a missing module;
- `TauCeti.Orientable (𝓡 3) ∞ M` has one argument too many.

The pull request does not change `lake-manifest.json`, so the merged tree pins `2fd255d9` and the targeted build of `TauCetiRoadmap.GeometricTopology.Suggested` fails there. Seven more paths in the section are stale at `2fd255d9`:

| Path in the README | Path at `2fd255d9` |
| --- | --- |
| `Geometry/Manifold/Immersion.lean` | `Immersion/Basic.lean` |
| `Geometry/Manifold/PLGroupoid.lean` | `PLGroupoid/Basic.lean` |
| `Hyperbolic/UpperHalfSpace.lean` | `UpperHalfSpace/Basic.lean` |
| `Markov.lean` | `Markov/Basic.lean` |
| `PDCode/Jones.lean` | `PDCode/Jones/Basic.lean` |
| `Analysis/Matrix/HermitianSignature.lean` | `HermitianSignature/Basic.lean` |
| `FundamentalGroup/VanKampen/Presentation.lean` | `VanKampen/Presentation/`, a directory |

The previous review said merging main would leave the build passing. That was wrong because of this module move.

**Witness:**
- `ls TauCeti/Geometry/Manifold/Orientation.lean` finds no file at `2fd255d9`.
- At `2fd255d9`, `Orientation/Basic.lean:257–264` declares the class over `(I) (M)` only. At `358314d`, `Orientation.lean:345` declares it with `[NeZero n]`.
- The worker's own signature step elaborated in the `2fd255d9` build. It stopped at the object file of `TauCeti/Geometry/Manifold/Orientation`.

**Repair:**
1. Merge `origin/main` into the branch, so that `lake-manifest.json` pins Tau Ceti `2fd255d9` as main does.
2. In `Suggested.lean`, change line 8 to `public import TauCeti.Geometry.Manifold.Orientation.Basic`.
3. Change lines 125 and 161 to `[TauCeti.Orientable (𝓡 3) M]` and `[TauCeti.Orientable (𝓡 3) N]`. Keep the `IsManifold (𝓡 3) ∞` binders. The class needs `FiniteDimensional ℝ E`, which `EuclideanSpace ℝ (Fin 3)` satisfies, and no `IsManifold` instance.
4. In the README at `:413`, write `TauCeti.Orientable I M` (`Orientation/Basic.lean`), and correct the seven paths in the table.
5. Rerun the targeted build.

I checked the new signature statically against `Orientation/Basic.lean:257–264` at `2fd255d9`. I could not elaborate there, because this review may run Lean only in the worktree, whose build is at `358314d`.

## R02 (P2) — The gate refuses the PlanarTopology supplier citations (dropped-names list)

**Location:**
- `README.md:465–470`: "### From TauCetiRoadmap.PlanarTopology … Layer 5 supplies Radó's theorem and the two-dimensional Hauptvermutung, Layer 7 the two-dimensional Schoenflies theorem, and Layer 8 the uniqueness …".
- 23 mentions in all: `:143, 145, 465, 467, 893, 917, 944, 1133, 1169, 1248, 1266, 1351, 1407, 2490, 2601, 3089, 3269, 3763, 9782, 13022, 13036, 13089, 13148`.

**Claim:** The brief's gate command now fails on this head: `dropped=33 … FAIL`. The rule is "no name of the project's dropped-names list". The list was introduced by configuration commit `370a7f7c` on 2026-11-07 ("so repairs never re-cite roadmaps we own ourselves"). It names PlanarTopology, SurfaceTopology and HomotopySpheres.

PlanarTopology is a supplier here. It supplies:
- the plane separation floor (Layers 0–1);
- Radó's theorem and the two-dimensional Hauptvermutung (Layer 5);
- the Schoenflies theorem in the plane (Layer 7);
- uniqueness of PL and smooth structures on surfaces, and smooth versus topological isotopy of surface diffeomorphisms (Layer 8).

Layers 1.7, 1.7.1, 1.7.2, 2, 4 and 11 consume these. Deleting the citations without moving the material would leave those routes unowned.

Main's GeometricTopology has none of these mentions, and neither does the GeometricTopology of #1797. The recorded gate (`dropped=0`) is older than the configuration that names the list: the worker's cached configuration was refreshed after that run.

**Witness:** the brief's `gate … GeometricTopology --base origin/main` prints "dropped: line 122 …" through "line 13166 …". `grep -c -w PlanarTopology README.md` prints `23`.

**Repair:**
1. **Jordan curve and plane separation** (`:2490`, `:2601`, `:3089`, `:9782`): cite Completed/ConformalMapping L5 on main. It owns the planar Jordan curve theorem on `TauCeti.IsJordanCurve` and `TauCeti.filledHull`: two components, one bounded, each with frontier `C` (`Completed/ConformalMapping/README.md:133–140`).
2. **The rest of PlanarTopology's material**: own it here as targets of Layer 11's two-dimensional prefix, which 1.7.1 already cites as "the two-dimensional triangulation/smoothing prefix of 11.3". The targets are:
   - the Schoenflies theorem in the plane, for example from ConformalMapping L5's Jordan-domain extension applied to both complementary domains, or by the PL route;
   - Radó's theorem and the two-dimensional Hauptvermutung;
   - uniqueness of PL and smooth structures on surfaces;
   - the comparison of smooth and topological isotopy of surface diffeomorphisms;
   - the collars and disc straightening used at `:9782`.
   Give each target a locator the author has checked.
3. Delete `### From TauCetiRoadmap.PlanarTopology`.
4. Repoint the 23 mentions to the new section numbers, and add the new edges to *How to read the build*.

Retest: `grep -c -w PlanarTopology README.md` prints `0`. If the operator did not mean the list to cover this pull request, R02 and R03 lapse with it; as configured, the gate refuses the head.

## R03 (P3) — The gate refuses the HomotopySpheres and SurfaceTopology mentions (dropped-names list)

**Location:**
- `README.md:122–131`: "**HomotopySpheres** owns the handle calculus of compact cobordisms … (HomotopySpheres §§1.2–1.6). No layer of this roadmap uses them".
- `:136–140`: "the combinatorial classification … that **SurfaceTopology** states is not consumed here … **SurfaceTopology** (Layer 9)".
- `:180`.
- *Downstream consumers* `:13156–13166`.

**Claim:** These ten mentions are part of the same `dropped=33` failure as R02. None is a supplier citation. HomotopySpheres appears as the owner of a calculus no layer uses, and SurfaceTopology as a consumer.

**Witness:** `grep -c -w -E 'HomotopySpheres|SurfaceTopology' README.md` prints `10`.

**Repair:**
- At `:122–131`, keep the content and drop the name: "the handle calculus of compact cobordisms (ordered handle decompositions, cancellation, handle slides, Whitney moves) is not a target here, and no layer of this roadmap uses it".
- At `:136–140`, drop the two SurfaceTopology clauses and keep MordellLawrenceVenkatesh and TeichmullerGeometry as the consumers of Layer 1.7.2.
- Delete "HomotopySpheres" at `:180` and the two consumer entries at `:13156–13166`.

Retest: the grep prints `0`, and the gate prints `dropped=0`.

## R04 (P3) — The description still states no order against #1517, #1791 and #1797, nor the repointing of the 1.7.2 consumers

**Location:** the pull-request description (65,859 characters, unchanged since the previous review).

**Claim:** #1517 (head `2559c13`), #1791 (`fcad6f1`) and #1797 (`11a9ca1`) still conflict with this head in `README.md`; #1517 and #1797 conflict in `Suggested.lean` too. The description names none of them.

The README makes Layer 1.7.2 the single owner of mapping class groups and Dehn twists. At their heads, MordellLawrenceVenkatesh (#1231 at `3756140`, `README.md:1817, 1851, 1873`) and TeichmullerGeometry (#1169 at `927e679`, `README.md:303`) still define both themselves. The description does not say they are to cite 1.7.2.

**Witness:** `grep -o -E '#[0-9]{3,4}'` on the full description prints only `#271`. The overlap index lists all three conflicts.

**Repair:** add one paragraph to the description, not to the README:
1. #1517's change is covered by this head's *Conventions*.
2. #1791's GeometricTopology changes are not to be merged after this head.
3. Say which of #1797 and this head is rebased onto the other, and which of #1797's section ids this README keeps.
4. #1231 (LV.5 §§5.9–5.12) and #1169 (§3.1) are to cite Layer 1.7.2, with its sign convention or the conversion Check. #271 needs a clause only if R03 keeps SurfaceTopology.

## Previous findings

- R01 — repaired: "**Sard's theorem** (`Analysis/Calculus/Sard/OutermostStratum.lean`, `Geometry/Manifold/Sard/Meagre.lean`): the flat Morse–Sard theorem `ContDiff.addHaar_image_criticalPoints_eq_zero` …" (`:319–329`). `grep 'Layer 10'` finds only this roadmap's own 10.2. The DifferentialGeometry sentences (`:118`, `:452–457`, `:1264`) no longer claim Sard.
- R02 — partly repaired: "### From Tau Ceti (commit 2fd255d9)" (`:278`). The four Morse names, and the new manifold Sard theorem, resolve at that commit. But `Suggested.lean` and the `TauCeti.Orientable I n M` entry do not resolve there. Raised again as R01.
- R03 — not repaired: the description is unchanged, and its only pull-request number is #271. Raised again as R04.

## Verified sound

**Gate and tools (my runs on `a49ede6`).**
- **Gate** (the brief's command): every counter `0` except `dropped=33` (R02, R03).
- **Targeted elaboration** (`lake env lean` on `Suggested.lean` at the branch pin `358314d`): exit 0, exactly 17 `declaration uses sorry` warnings.
- **Dependency check:** `depcheck: 243 roadmaps, 2456 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Citations:** `roadmaps resolve` finds nothing unresolved. Overlaps: no id this README cites is dropped or defined only by an open revision. The three anchors other roadmaps cite are mapped at `:524–531`.

**Suggested.lean (unchanged).** A scratch file with `#check @` lines for all 17 declarations elaborates. `sphere_theorem` and `waldhausen_theorem` carry `TauCeti.Orientable (𝓡 3) ∞` together with `IsManifold (𝓡 3) ∞`, `T2Space` and `SecondCountableTopology` (sphere theorem). Nothing has changed since the previous review's one-tactic probe, which closed none of the 17 declarations.

The headline carriers are identical at both pins: the definition lines hash equal for `AnnulusConjecture`, `SmaleConjecture`, `WatanabeTheorem`, `FreedmanSliceTheorem`, `MostowRigidity`, `VirtualFiberingConjecture`, `VirtualHakenConjecture`, `JSJTheorem`, `GeometrizationConjecture`, `TriangulationConjecture`, `IsSphereBoundsBall`, `IsPossiblyNonorientableClosedHakenThreeManifold` (`Haken.lean:204`), `SmoothAmbientIsotopic` (`SmoothLink/Isotopy.lean:39`) and `IsLocallyFlat` (`LocallyFlat/Basic.lean:376` at `358314d`, `:390` at `2fd255d9`, same text). The only exception is `Orientable` (R01). 13 of the 14 imported Tau Ceti modules exist at both pins.

**Library declarations opened (Tau Ceti, both pins unless marked).**
- **Mechanical name check:** all 165 backticked library names in *From Tau Ceti* exist at `2fd255d9`; 160 exist at `358314d`.
- `ContDiff.addHaar_image_criticalPoints_eq_zero` (`OutermostStratum.lean:366` at `358314d`, `:369` at `2fd255d9`): `ContDiff ℝ n f` with `finrank E · finrank E + 1 ≤ n` gives `ν (f '' crit) = 0` for every `ν` with `[IsAddHaarMeasure ν]` (section variables `:88–90`). No relation between the dimensions is required, as the README says.
- `ContDiff.dense_compl_image_criticalPoints` (`:397` / `:400`): the complement of the critical values is dense.
- `TauCeti.addHaar_image_criticalPoints_eq_zero` (`:347` at `2fd255d9`): the set form, with `∀ x ∈ U, ContDiffAt`.
- `ContMDiff.isMeagre_image_criticalPoints` (`Meagre.lean:114`, `2fd255d9` only): requires `[LindelofSpace M]`, `[I.Boundaryless]`, `[J.Boundaryless]`, both models finite-dimensional, `IsManifold … ∞` and `∞ ≤ n`, with no equal-dimension or T2 hypothesis. "Critical" is `¬ IsRegularPoint`, defined as `Surjective (mfderiv I J f x)` (`RegularValue.lean:86`). The README's "Lindelöf finite-dimensional boundaryless … of any dimensions" matches, as does "none of them treats a source with boundary".
- `TauCeti.Orientable` (`Orientation.lean:345` at `358314d`; `Orientation/Basic.lean:263` at `2fd255d9`), for R01.
- `TauCeti.IsJordanCurve` (`Topology/JordanCurve/Basic.lean:108` at `358314d`, `:107` at `2fd255d9`) and `TauCeti.filledHull` (`Topology/FilledHull.lean:79` at `358314d`, `:99` at `2fd255d9`), for R02's repair.
- The scope `TauCeti.DiffeomorphWeakWhitney` (`Geometry/Diffeomorphism/Topology.lean:89`), which the name check above would otherwise miss.

**Cross-roadmap citations resolved.**
- DifferentialGeometry on main: Layers 3, 4, 5 and 12 and *Boundary and corners*, still cited; no longer Layer 10.
- Completed/ConformalMapping on main: L5 (`:133–140`).
- At their heads: MordellLawrenceVenkatesh at #1231 and TeichmullerGeometry at #1169 (R04), and SurfaceTopology at #271 (`:1257`, Layer 9 still defines mapping class groups).
- GeometricTopology at #1797: none of the three dropped names, and Radó only at `:971`.

**Ownership.** The change adds no construction another roadmap owns: Sard is cited from Tau Ceti, and the reduction to the interior of the disc is owned in 1.7.1, item 3. No open pull request plans transversality relative to the boundary of the disc.

**Seeded sample.** Of the sampled targets, only 1.7.1 and the Layer 1 *Dependencies* fall in the diff. They are checked in the table below; the changed passage has no text locator, only the pinned declarations above. The other sampled targets lie outside the diff, and their rows from the previous review carry forward where it had them. 3.3, 4.2.3, 4.5.2, 4.5.4, 4.6.5, 4.7.8, 4.10.1, 4.10.3, 4.12.1, 6.3 and 8.5 are untouched since `b647e5c`, and this incremental review did not recompute them.

**Adversarial table: changed statements (computed this round).**

| Statement | Instances | Values | Result |
| --- | --- | --- | --- |
| *From Tau Ceti*, Sard bullet (`:319–329`), flat form | chart maps of `W → ℝ³`, `E = ℝ⁴`, `F = ℝ³` | `finrank E² + 1 = 17 ≤ ∞`; any Haar `ν` on `ℝ³`; conclusion `ν(f '' crit) = 0`; dense complement | right |
| Sard bullet, manifold form | `W` (dim 4, Lindelöf, boundaryless) → `ℝ³` | hypotheses `[LindelofSpace W]`, both models boundaryless and finite-dimensional, `∞ ≤ ∞`; meagre in the Baire space `ℝ³`, so its complement is dense | right at `2fd255d9`; absent at `358314d` (R01) |
| 1.7.1 item 3, submersion | `F(x,v) = H(x) + ρ(x)v` | `∂F/∂v = ρ(x)·I₃`, rank `3` iff `ρ(x) ≠ 0`; where `ρ(x) = 0`, `ρ ≥ 0` has a minimum, so `dρ(x) = 0` and `dF = (dH(x), 0)`, transverse by the collar hypothesis | right |
| 1.7.1 item 3, dimensions | `int D² × ℝ³ ⊃ W = F⁻¹(S)` | `dim W = 2 + 3 − 1 = 4`; `π : W → ℝ³` from dim 4 to dim 3, so the equal-dimension `Sard/EqualDimension.lean` would not serve, while the meagre theorem does | right |
| 1.7.1 item 3, tangent instance | `S` the sphere of radius `1/2` centred at `(0,0,1/2)`; `H` the flat disc; `v = (0,0,ε)` | `H⁻¹(S) = {0}`, not transverse; at height `ε`: `x² + y² = ε − ε²`, a transverse circle for small `ε > 0`, empty for `ε < 0`; `v = 0` is a critical value of `π`; boundary count `0`, even | right |
| 1.7.1 item 3, boundary | `x ∈ ∂D²` | `ρ = 0` on the collar, so `H_v = H` there and on `∂D²`; `H_v⁻¹(S)` is a compact 1-manifold with boundary `γ⁻¹(S)` | right |
| 1.7.1 Lindelöf Check (`:1126–1130`) | `M = ℝ³` with the discrete topology, model `EuclideanSpace ℝ (Fin 0)`, `f = id` | `T_x M = 0`, so `mfderiv : 0 → ℝ³` is not surjective; critical values `= ℝ³`, not meagre (Baire); uncountable discrete, so not Lindelöf; `W` is a subspace of a second-countable space, so it is Lindelöf | right |
| Scope `:105–109`, "at the pins … Sard … boundaryless-manifold forms" | branch pin vs `2fd255d9` | `Geometry/Manifold/Sard/` absent at `358314d`; present at `2fd255d9` | right after R01's merge |
| Heading `:278` (commit `2fd255d9`) | 165 names, 86 Tau Ceti paths | 165/165 names present; `Orientable I n M` arity wrong; 8 paths stale (at `358314d`: 3 paths and 5 names absent) | finding R01 |
| `Suggested.lean` at both pins | `:8`, `:125`, `:161` | `358314d`: exit 0, 17 warnings; `2fd255d9`: module `…Manifold.Orientation` absent, `Orientable` takes `I M` | finding R01 |
| DifferentialGeometry contract (`:118`, `:452–457`) | main | Layers 3, 4, 5, 12 and *Boundary and corners* resolve; the overlap index lists no dropped id | right |
| *Needs* `:1132–1137`, *Dependencies* `:1260–1268` | the three Sard names | present at `2fd255d9` (`Meagre.lean:114`, `OutermostStratum.lean:369, 400`) | right after R01's merge |
| Gate `dropped` | README, `Suggested.lean` | PlanarTopology `23`, HomotopySpheres `6`, SurfaceTopology `4`; Lean `0` | findings R02, R03 |

**Adversarial table: carried forward from PRREVIEW-GeometricTopology~65 (statements untouched by the diff; values as computed there).**

| Statement | Values (r65) | Result |
| --- | --- | --- |
| §1.3.1 disc, annulus, torus | `f = (1 + ‖x‖²)/2`: one index-0 point at value `1/2`; annulus band `≅ S¹ × [0,1]`; torus indices `0,1,1,2`, `χ` steps `(−1)^λ` | right |
| §1.3.1 existence, bump, bands, handle step | `f' = ρ'(t)(t − 1/2) + ρ(t) > 0`; `‖d(f + cβ)‖ ≥ m − cM > 0`; `f⁻¹[0,ε] ≅ V₀ × [0,ε]`; `λ = 0` gives `∅ ⊔ Dⁿ` | right |
| §1.7 genus and rank | `χ = 0, 2, −1, 1, 0, 0`; `rank H₁ = 2, 0, 2, 0, 1` | right |
| §1.7.2 twists | `T_a[b] = b + a`, `T_b[a] = a − b`; `S T_a S⁻¹ = [[1,0],[1,1]] = T_b⁻¹`; left-twist `= T_c⁻¹`; LV §5.11 `= T_c⁻¹`; cut `(χ, b) = (0,2), (1,1), (2,2), (1,1)` | right |
| §2.2 Brown | Theorems 4–5 at the cited lines; `n = 1` gives two arcs | right |
| §3.1 | `f_k' = 1 + k⁻¹ cos kθ > 0`; `sup‖f_k − id‖ = k⁻²` | right |
| §4.2.5 Dowker | face histograms `{3:16, 5:16}`; `11, 10, 9, 10 = n + 2`; `7₄`: `Δ = 4t − 7 + 4t⁻¹`, `det 15`; `3:40, 5:64, 7:22, 9:2`; `2:24, 4:156, 6:74, 8:2` | right |
| §4.2.6 | plane classes `7`, sphere classes `3`; moves `±1, ±2, 0` | right |
| §4.6, 4.6.1 HOMFLY and Kauffman | `P(T) = 2v² − v⁴ + v²z²`; `Q = 2x² + 2x − 3`; `d ↦ −A² − A⁻²` | right |
| §4.7, 4.7.5, 4.7.7 | colourings `9, 18, 25, 49`; `PAQ = diag(1,1,1,7,0)`; `B ≡ 3 (mod 4)`; `P(−3,5,7)`: `Δ(−1) = 41` | right |
| §4.8.2, 4.15 | `det L₃ = 3`; Arf `1` for `L₄`; determinants `3, 5, 5, 7, 9, …`; `ℤ/9` vs `(ℤ/3)²` | right |
| §6.2.1, 6.4 | `det H(ω) = (−‖ω − 1‖²)^g Δ_V(ω)`; `Δ = 1 ⟺ [G,G]` perfect | right |
| §7.3, 7.3.1, 7.4 | `2v₃ = 2.0298…`, `3.6638…`, `0.9427… < v₃`; cusp volume `covol/(2h²)` | right |
| §8.5.2 | granny/square `‖σ‖ = 4, 0`; Friedl Theorem 16.11 | right |
| Headlines (17) | one-tactic probe closes none; types as the README states | right |

## Not verifiable

- **Elaboration at Tau Ceti `2fd255d9`.** This review may run Lean only in the worktree, whose build is at `358314d`. R01's build failure there rests on three things: the module file is missing, the class declaration differs, and the worker's own signature step stopped at that import in the `2fd255d9` build. R01's repaired signature was checked statically.
- **Sources settled as uncertified or paywalled** (carried forward): Hirsch, *Differential Topology*; Farb–Margalit; Lickorish 1962 and 1964; Lickorish GTM 175; Burde–Zieschang; Dowker–Thistlethwaite 1983; Whitten 1987; the ratio sentence of Adams–Hildebrand–Weeks. The changed passages cite no source text.
- **Ownership against open pull requests** was checked through `roadmaps grep` (Schoenflies, Radó, Jordan curve theorem) and `roadmaps show` for #271, #1169, #1231 and #1797. No other sibling checkout was opened.

## Source issues

- none
