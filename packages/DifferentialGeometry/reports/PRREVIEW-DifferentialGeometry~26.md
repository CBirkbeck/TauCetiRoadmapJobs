# Review of DifferentialGeometry (pull request #886 at 29000a9)

**Verdict:** needs changes

Incremental re-review of the 134 lines changed since `5436a54`. Main is now merged into the branch (`e445749`): `lake-manifest.json` and `lean-toolchain` equal main's (Tau Ceti `2fd255d9`), `git merge-tree --write-tree HEAD origin/main` is clean, and the file builds at main's pin. The three README repairs (3.5, the DeRhamCohomologyAndDuality statement, the §5.5 mapping) are correct. What is left is the part of the previous R01 and R04 that had to wait for the merge, which the repair reply itself lists as open, and the description, which still describes the branch before the merge.

The gate passes (every scanner `0`, `build=0`); the dependency check reports 0 problems; no file outside the folder differs from main.

## R01 (P2) — At the merged pin four statable headlines are still absent, and the file still declares its own copies of Tau Ceti's carriers

Carried from the previous R01 (steps 2–4); step 1, the merge and the two imports, is done.

**Location.**
- `Suggested.lean:79–87`: "Four further headlines are not statable against the Tau Ceti modules this file can import … For the same reason the integral manifold of layer 4 is declared here".
- `Suggested.lean:793–801`: `structure IntegralManifold`.
- `Suggested.lean:303–314`: `mextDeriv_add`, `mextDeriv_smul`, `isSmoothForm_mextDeriv_infty`, each admitted.

**Claim.**
- (a) The sentence at `:79–87` is false at this head's pin: every carrier it names can be imported, so 2.4, 9.2, 9.3 and 10.3–10.4 are statable headlines that are absent.
- (b) `Distribution.IntegralManifold` duplicates `TauCeti.IntegralManifold`, and README 1425–1427 says the library keeps one structure.
- (c) The file redeclares, on its own copies, objects Tau Ceti has, and admits three laws Tau Ceti proves for its `mextDeriv`.

**Witness** (Tau Ceti `2fd255d9`, under `TauCeti/Geometry/Manifold/`).
- (a) `Orientation/Cover/Basic.lean:55` (`OrientationCover`), `DifferentialForm/Involution.lean:42` (`invariantPart`), `DeRham/PoincarePairing.lean:111, :151` (`integral`, `poincarePairing`), `DifferentialForm/Integration/TopForm.lean:518` (`integralTopForm`), `Degree/Basic.lean:76` (`degreeAtRegularValue`). A scratch statement of 9.3, `Function.Bijective (poincarePairing I M o : deRhamCohomology I M k → Module.Dual ℝ (compactlySupportedDeRhamCohomology I M l))` under the variables of `PoincarePairing.lean:67–70`, elaborates with `sorry` as its only warning.
- (b) `Distribution/IntegralManifold.lean:139–160`: the same eight fields under the same names.
- (c) `DifferentialForm/ExtDeriv.lean:140, :145, :247, :268`; `Regularity.lean:223, :478` (`mextDerivₗ`); `DeRham/Basic.lean:77` (`closedForms`); `DifferentialForm/Basic.lean:41`, `Smooth.lean:380, :479`; `Pullback/Basic.lean:66, :241`; `Curvature.lean:33`; `Orientation/Lift.lean:52`; `Flow/Basic.lean:57, :62`; `Boundary/Orientation.lean:46`; `DeRham/Circle.lean:72, :92`; `Riemannian/Circle.lean:40`; `TauCeti/Geometry/Convex/FullSimplex.lean:44, :85`. The copies are not the natives: `exact TauCeti.mextDeriv_smul c φ` fails at `:308` with "TauCeti.mextDeriv … not unfolded because their definition is not exposed".

**Repair.**
1. State 2.4 on `TauCeti.Manifold.OrientationCover` and `TauCeti.invariantPart`, 9.2 on `TauCeti.compactlySupportedDeRhamCohomology.integral`, 9.3 on `TauCeti.poincarePairing` (the statement above, for `Module.finrank ℝ E = k + l`), and 10.3–10.4 on `TauCeti.degreeAtRegularValue` with `TauCeti.integralTopForm`; import the modules named in the witness; delete `:79–87` from "Four further headlines" to "is not that structure."
2. Delete `:784–805` (the structure and its `attribute` line), add `public import TauCeti.Geometry.Manifold.Distribution.IntegralManifold`, and write `TauCeti.IntegralManifold.{u, u} (I := I) ∞ D k` in the six layer-4 statements (the structure's universes are the manifold's, then the carrier's). In README 1425–1427 and 1466 replace `Distribution.IntegralManifold` and "repeats that structure field for field … one structure," by the statement that the six theorems are stated on `TauCeti.IntegralManifold`.
3. Replace the remaining copies by the natives listed in (c), deleting the three admitted `mextDeriv` laws and the "Five statements … are kept" sentence at `:57–67`. Keep an `abbrev` with the present signature for each name a module on main uses from this file: `RoughForm`, `RoughForm.ofFunction`, `SmoothForm`, `mextDeriv` (ContactGeometry); `Density` (ComplexKahlerGeometry); `Manifold.Orientation`, `OrientationLift`, `OrientationLift.setoid`, `orientationAt`, `Manifold.Orientation.pullback`, `fullSimplex`, `fullSimplexEquivStdSimplex` (AlgebraicTopology's `GeneralModelOrientation.lean` and `OrientationComparison.lean`). Then run the targeted build of those four modules.

Step 2 was tested on a scratch copy at this head: exit 0, the same 32 `sorry` warnings, no other diagnostic.

## R02 (P3) — `Suggested.lean` still declares four flow declarations the README does not name

Carried from the previous R04; unchanged at this head, and the repair reply says the deletion can now be made.

**Location.** `Suggested.lean:601–648` (`IsCompleteVectorField`, `isCompleteVectorField_of_compactSpace`, `toFlow`, `toFlow_apply`); the docstring at `:61–66` ("the completeness input and the rewriting rule of MorseNovikov's flow of the negative dual field") and `:89`.

**Claim.** The README has no occurrence of `toFlow`; 3.3 cites `TauCeti.IsCompleteVectorField`, `TauCeti.isCompleteVectorField_of_compactSpace` and `TauCeti.globalFlow`. `toFlow_apply` is `rfl` and the completeness statement is proved in place from a Tau Ceti lemma: both are padding. The MorseNovikov sentence is false.

**Witness.** At this head the only modules importing this file are `ContactGeometry/Suggested.lean:1`, `ComplexKahlerGeometry/Suggested.lean:8`, `AlgebraicTopology/GeneralModelOrientation.lean:3` and `OrientationComparison.lean:2`; none mentions `toFlow` or `IsCompleteVectorField`. Tau Ceti has them at `Flow/Complete.lean:61, :154` and `IntegralCurve/GlobalFlow.lean:60`.

**Repair.** Delete `Suggested.lean:601–648`. In the docstring: at `:57–63` drop the clause from "and `isCompleteVectorField_of_compactSpace`" to "negative dual field" and count the statements again; at `:64–66` remove `IsCompleteVectorField` and replace "`toFlow` and the divergence theorem of 12.5" by "the time-dependent flow of 3.5 and the divergence theorem of 12.5"; at `:89` remove `toFlow`. Tested on a scratch copy at this head with the block deleted: exit 0, 32 `sorry` warnings, only the docstring mentions remain.

## R03 (P3) — The description describes the branch before the merge

Carried in part from the previous R03 (its description item), and made wrong in the rest by the merge.

**Location and what the head shows.**
- "The branch is built at Tau Ceti `358314d4` with Lean `v4.35.0-rc3` … The branch therefore has to merge main before it can merge, and the merge conflicts in `Suggested.lean`." The head pins `2fd255d9` with main's toolchain; main is merged at `e445749` and `git merge-tree` reports no conflict.
- "its imports `TauCeti.Geometry.Manifold.Orientation` and `…Riemannian.Sphere` are directories at main's pin and become …". `Suggested.lean:8–9` already import `Orientation.OrientedAtlas` and `Riemannian.Sphere.Basic`.
- "Nothing has been built at main's pins", and `MorseNovikov.Suggested` in the list of importers. The targeted build at this head is at main's pins and has four importers; MorseNovikov imports only Mathlib.
- "DeRhamCohomologyAndDuality consumes them for its relative theory". README 113–122 and `Suggested.lean:96` now say 8.3–8.5.

**Repair.** Replace the paragraph "What a reviewer must know about the pins" by one stating that main is merged and the file is built at Tau Ceti `2fd255d9`, followed by what R01 and R02 leave open (or nothing, once they are applied); in **Scope** replace "consumes them" by "consumes 8.3–8.5"; in **Validation** drop `MorseNovikov.Suggested` and the last sentence. Add one sentence naming the open revision of DeRhamCohomologyAndDuality (#2085) as the text README 113–122 describes: main's copy of that roadmap (its README 43–49, 160–172) still lists layers 0–11 of this one, and its revision narrows that to 8.3–8.5. Every section main's copy cites keeps its id here, so no order between the two is needed.

## Previous findings

- R01 — partly repaired: main merged, pins equal main's, imports are `…Orientation.OrientedAtlas` and `…Riemannian.Sphere.Basic`; "Four further headlines are not statable" and the copies of Tau Ceti's carriers remain (R01).
- R02 — repaired: `Suggested.lean:700–701` adds `ContMDiffAt ((𝓘(ℝ, ℝ)).prod ((𝓘(ℝ, ℝ)).prod I)) I 1 (fun q : ℝ × (ℝ × M) ↦ Ψ q.1 q.2) (t₀, (t₀, x₀))`; README 1343–1353 and a new Check say the same.
- R03 — partly repaired: README 19–21, 113–122, 672 and 3110 and `Suggested.lean:96` say "8.3–8.5"; the description still says "consumes them for its relative theory" (R03).
- R04 — not repaired: `Suggested.lean:601–648` and the docstring sentences at `:61–66, :89` are unchanged (R02).
- R05 — repaired: README 38 and 40 read "resolve to"; the overlap report lists no id of this roadmap as dropped.

## Verified sound

**Gate and dependency check**, re-run on this head:

    gate DifferentialGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

    depcheck: 233 roadmaps, 2259 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` shows only this folder's `README.md` and `Suggested.lean`; `PROGRESS.md` and `STATUS.md` are main's generated files, identical to main's.

**Elaboration.** `lake env lean` on `Suggested.lean` at the head's pins (Tau Ceti `2fd255d9`): exit 0, 32 `declaration uses sorry` warnings, nothing else. No `set_option`, no admitted `def`, `instance` or `example`, no `lemma`.

**Signature of the changed statement.** The elaborated type of `exists_timeDependentFlow` carries `[T2Space M] [BoundarylessManifold I M] [CompleteSpace E] [IsManifold I 1 M]` and the five conjuncts in the README's order; README 3.5 states the same Banach generality. The other 82 signatures are untouched since the previous review.

**Padding probe.** Each of the 32 `sorry` replaced by `first | rfl | infer_instance | (simp; done) | trivial | (intros; rfl)` on a scratch copy at the merged pin: an error at each of the 32 sites, so none closes in one tactic. The declarations proved in place are R02.

**The changed passages.**
- README 3.5 (1343–1353). `TauCeti.exists_timeDependentFlow` (`Flow/TimeDependent.lean:439`) takes `fun t p ↦ timeDependentFlowOf X p.1 t p.2` on `univ`, as the README says; `TauCeti.isOpen_timeDependentFlowDomain` (`:326`), `mem_timeDependentFlowDomain_self` (`:361`) and `TauCeti.contMDiffOn_timeDependentFlowOf` (`:334`, `1 ≤ n`, finite dimension, Hausdorff, boundaryless) give the new clause at `((t₀, t₀), x₀)` for `n = 1`. Mathlib's `exists_isMIntegralCurveAt_of_contMDiffAt` is at `Geometry/Manifold/IntegralCurve/ExistUnique.lean:66`, with `[CompleteSpace E]` and an interior point, as cited.
- README 113–122, 672, 3110 and `Suggested.lean:96`. Checked against DeRhamCohomologyAndDuality at its open head (`df0682fb`): its README 62–66 and 377–385 take 8.3 (smoothing equivalence), 8.4 (`chainIntegral`, Stokes for chains, `deRhamHom` with naturality) and 8.5 (`deRhamEquiv` on every open of a Hausdorff σ-compact finite-dimensional manifold), and disclaim 9.3, 10 and 11; its README 243–265 takes flows and `integralTopForm` from Tau Ceti. The three sentences here agree with it. Main's copy is wider (R03).
- README 38, 40: "resolve to", read by the overlap check.
- The seeded sample headings ("Smooth 2-forms", "Canonical interfaces and reuse", the two "Acceptance examples", "Conventions and existing inputs", "Henstock–Kurzweil", "Flat punctured-plane family", "Ownership and ordering") lie outside the changed passages; the previous report checked each.

**Cross-roadmap citations resolved this round:** DeRhamCohomologyAndDuality (open head and main), and the four importers of this module on main (ContactGeometry, ComplexKahlerGeometry, AlgebraicTopology twice). The citation resolver's seven Lean-name leads are this file's own declarations. Overlaps: #334 and #1187 still change the folder; the description orders both after this pull request. Other open heads were not read.

**Adversarial table.** Rows marked "r25" are carried from the previous report (pull request #886 at `5436a54`), whose statements this diff leaves untouched.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 3.5 `exists_timeDependentFlow` (changed) | `v = 0` on `ℝ` at `(0, 1)`; `v s x = s`; `v = x²`; the pointwise family of the new Check | `Ψ = x`: start `x`, derivative `0`, polynomial; `x + (t² − s²)/2`: start `x`, `∂_t = t = v t`, polynomial; `x/(1 − x(t − s))`: start `x`, `∂_t = Ψ²`, denominator `1` at `(t₀, t₀, x₀)`; pointwise family: `0` at `(ε, 0, 1 + ε/2)`, `1` at `(0, 0, 1)` | true flows satisfy all five clauses; the pointwise family satisfies the first four and fails the fifth | none |
| 3.5 new Check | `δ(x) = \|x − 1\|`, `δ(1) = 1` | `t = s`: `0 < δ(x)` for every `x`, value `x`; near `t = s` constant, so `x' = 0`; `ε < ε/2` false, value `0` against limit `1` | Check correct | none |
| 3.5 finite-dimensional reduction (changed prose) | Tau Ceti's family at `n = 1` | `timeDependentFlowOf v s t x`, domain open and containing `((s, s), x)`, `C¹` on it | follows as stated | none |
| Ownership statement (changed) | DeRhamCohomologyAndDuality open head; main | head: 8.3–8.5 only, 9.3/10/11 disclaimed; main: layers 0–11 listed | agrees with the open revision | R03 |
| §5.5 mapping (changed) | overlap check | "resolve to" matched; 0 dropped ids | holds | none |
| 4.2–4.4 on `TauCeti.IntegralManifold` | scratch file with the local structure deleted | exit 0, 32 warnings, universes `.{u, u}` | statable on the native | R01 |
| 9.3 Poincaré duality | scratch statement on `TauCeti.poincarePairing` | elaborates, one `sorry` warning | statable, absent | R01 |
| 0.3 `isSmoothBundleForm_mpullback` (r25) | `f = id`; `n = 0`, `f = \|x\|`, `φ = dx` | `φ x`; `±dx` off `0`, junk `0` at `0` | holds | none |
| 1.1 `mextDeriv_smul`, `mextDeriv_add` (r25) | `c = 0`; `φ = ∛x dy`, `η = (x − ∛x) dy` at `0` | `0 = 0`; `d(φ+η) = dx∧dy`, `dφ + dη = 0` (junk) | `C¹` needed for additivity only | R01 (duplicate of the native) |
| 2.2 `pullbackSign_mul_pullbackSign` (r25) | `ℝ`, charts `t`, `−t` | signs `+1`, `−1`, product `−1` | holds | none |
| 2.2 `exists_topForm_of_orientation` (r25) | `dim E = 0`; `ℝ` | `φ = 1 > 0`; `dx(e₁) = 1 > 0` | holds | none |
| 2.2 `orientable_iff_exists_atlas` (r25) | `Icc 0 1`; empty `M` | true/false, excluded by boundaryless; true/true | holds | none |
| 3.1 Banach local flow (r25) | `v = 1`; `v = x²` near `1` | `x + t + u` both sides; `1/(1/x − t)` near `(1, 0)` | holds | none |
| 3.2 Banach openness and smoothness (r25) | `ℓ²`, `v = Ax` | domain `univ`, flow `e^{tA}x` | holds | none |
| 3.3 `exists_flowOf_one_eq` (r25) | `ℝ`, `0 ↦ 3` | `v = 3χ`, curve `3t`, value `3` | holds | none |
| 3.4 `hasDerivAt_mpullback_flowOf` (r25) | `v = ∂x`, `w = x∂y` | derivative `∂y`, bracket `∂y` | sign agrees | none |
| 3.5 `timeDependentFlow_spec`, `…Domain_eq_univ` (r25) | `v s x = s`; `J = (0,1) ∪ (2,3)` | `(r²−t²)/2 + (t²−s²)/2 = (r²−s²)/2`; `(2.5, 0.5, x)` outside the domain | holds | none |
| 4.2 involutivity criteria (r25) | contact `ker(dz − y dx)`; rank `0` | `dη(∂x + y∂z, ∂y) = 1`, bracket `∂z ∉ D`; both true | holds | none |
| 4.3 flat chart, slices, factor (r25) | `span(e₁)` on `ℝ²`; irrational line on `T²` | `finrank 1`; `g = id` smooth | holds | none |
| 4.4 `exists_leaf` (r25) | rank `0`; rank `dim M`; irrational slope | point; component; dense injective line | holds | none |
| 5.4 `planarRadialPrimitive_hasFDerivAt` (r25) | `(y, x)`; `(−y, x)` | `g = xy`, `dg = y dx + x dy`; `−1 ≠ 1`, excluded | closedness needed | none |
| 5.4a `moving_pullback_hasDerivAt` (r25) | `P = x + t e₁`, `ω = x dy` | `dy = 0 + dy` | holds | none |
| 5.5a `Density` Check (r25) | `V = ℝ`, `m = 2` | `toFun(a, b) = \|a\|` nonzero; nothing claimed for `m > dim` | Check correct | none |
| 5.6 samples (r25) | ellipse; `exp(it)`; `α = 1` | `πab`; integrand `½`, integral `π`; curl `0`, integral `2π` | holds | none |
| 11.1–11.2 hairy ball (r25) | `n = 0`; `n = 1`; `n = 2` | `v = 0`; `ix` nowhere zero, excluded by `Even`; zeros at `(0,0,±1)` | holds | none |
| 12.5 divergence theorem (r25) | half-line `f∂t`; unit disc `x∂x + y∂y` | `∫ f' = −f(0)`; `2·π = 2π·1` | holds | none |
| 12.1 `volume_circle` (r25) | round metric | `⟪iz, iz⟫ = 1`, volume `2π` | holds | none |

## Not verifiable

- [Lee] GTM 218, [Tu], [Bott–Tu] and [Milnor] locators outside the changed passages were not re-read; the changed passages add no source locator.
- The statements of 2.4, 9.2 and 10.3–10.4 on the natives (R01 step 1) were decided by reading the declarations at the pin; only 9.3 and the layer-4 swap were elaborated.

## Source issues

- none
