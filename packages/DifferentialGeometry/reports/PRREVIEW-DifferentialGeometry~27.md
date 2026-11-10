# Review of DifferentialGeometry (pull request #886 at 03882f5)

**Verdict:** needs changes

Full review of the head after 939 changed lines. The three findings of the previous review are repaired (listed below). Two P3 findings remain, both inside `Suggested.lean` and two README lines; neither touches a statement. The gate passes, the dependency check reports 0 problems, and no file outside the folder differs from main.

## R01 (P3) — The module docstring says three definitions have no Tau Ceti counterpart; two of them have one, which the README names

**Location.** `TauCetiRoadmap/DifferentialGeometry/Suggested.lean:91–94`: "`Density`, `RoughDensity`, … `immersionMetric` and the boundary metric and measure of 12.5 have no Tau Ceti counterpart at the pin; each has a real body."

**Claim.** False for `immersionMetric` and for the boundary metric: Tau Ceti has both for a bundled `C^k` metric, and README 12.1 and 12.5 cite them as the counterparts.

**Witness** (Tau Ceti `2fd255d9`, under `TauCeti/Geometry/Manifold/Riemannian/`). `Pullback/Basic.lean:158` `Bundle.ContMDiffRiemannianMetric.pullback`; `Boundary.lean:115` `Bundle.ContMDiffRiemannianMetric.restrictBoundaryTangentSpace`, with `restrictBoundaryTangentSpace_inner` at `:146`. README 2789–2792 and 2919–2922 name both.

**Repair.** Replace the sentence by: "`Density`, `planarRadialPrimitive`, `contractionAlongMap` and `familyContraction` have no Tau Ceti counterpart at the pin. `immersionMetric` and the boundary metric of 12.5 are the instance-level forms, asking no regularity, of Tau Ceti's `Bundle.ContMDiffRiemannianMetric.pullback` and `Bundle.ContMDiffRiemannianMetric.restrictBoundaryTangentSpace`, which take a bundled `C^k` metric; the boundary measure is `TauCeti.riemannianVolume` of that metric. Each has a real body." The change is inside a comment, so the elaboration is unaffected. (`RoughDensity` leaves the list by R02.)

## R02 (P3) — `RoughDensity` is a definition that no statement of the file and no importing module uses

**Location.** `TauCetiRoadmap/DifferentialGeometry/Suggested.lean:804–811` (the `variable` block and `abbrev RoughDensity`), its mention at `:92`, and README 1876 and 1904.

**Claim.** The file keeps definitions only where a stated headline needs them, or where a module on main reads the name from this file. `RoughDensity` is neither; `Density`, next to it, is read by ComplexKahlerGeometry and stays.

**Witness.** `git grep RoughDensity -- '*.lean'` at this head returns only `TauCetiRoadmap/DifferentialGeometry/Suggested.lean`. No theorem of the file mentions it. The four importers (`ComplexKahlerGeometry/Suggested.lean:121` uses `Density` only).

**Repair.** Delete `Suggested.lean:804–811` and the name at `:92`. In README 1876 write "rough densities (a `Density (TangentSpace I x) m` at every point `x`)" for the backticked name, and in README 1904 "The rough densities of degree `dim` contain `|ω|` …". Tested on a scratch copy with lines 804–811 deleted: exit 0, the same 36 `sorry` warnings, no other diagnostic.

## Previous findings

- R01 (four statable headlines absent; copies of Tau Ceti's carriers) — repaired.
  - (a) `Suggested.lean:419–449` state 2.4 on `TauCeti.Manifold.OrientationCover`, `TauCeti.invariantPart` and `TauCeti.antiInvariantPart`; `:845–869` state 9.2 (both theorems) and 9.3 on `TauCeti.compactlySupportedDeRhamCohomology.integral` and `TauCeti.poincarePairing`; `:888–897` state 10.3–10.4 on `TauCeti.degreeAtRegularValue` and `TauCeti.integralTopForm`. The "Four further headlines are not statable" paragraph is gone.
  - (b) The local `IntegralManifold` is deleted; the six layer-4 statements read `TauCeti.IntegralManifold.{u, u} (I := I) ∞ D k`. README 1435–1440 says so.
  - (c) `RoughForm`, `RoughForm.ofFunction`, `SmoothForm`, `mextDeriv`, `fullSimplex`, `fullSimplexEquivStdSimplex` are abbreviations of the natives; the three admitted `mextDeriv` laws, `closedForms`, `mextDerivₗ`, `flowOf`, `flowDomain`, `divergence` and the other copies are deleted and the theorems use `TauCeti.*` directly. The chart-sign carrier (`OrientationLift`, its setoid, `Manifold.Orientation`, `neg`, `orientationAt`, `pullback`) stays as definitions. That is justified: `AlgebraicTopology/OrientationComparison.lean` uses `Quotient.out` (26 times), `Quotient.mk` (21), `OrientationLift.setoid` (13), the field `sign_mul_sign`, and at `:519–536` unfolds `o.neg` to `Quotient.mk _ { l with modelOrientation := -l.modelOrientation }`; `GeneralModelOrientation.lean` uses `Manifold.Orientation.pullback`. Tau Ceti's quotient exposes `mk_eq_mk_iff` with `flip` instead (`Orientation/Basic.lean:45`), so an abbreviation would need edits outside this folder. The two admitted sign laws are the proof fields of that `pullback`.
- R02 (`toFlow` block) — repaired: `IsCompleteVectorField`, `isCompleteVectorField_of_compactSpace`, `toFlow`, `toFlow_apply` and the MorseNovikov sentence are gone; README 3.3 cites the natives.
- R03 (description) — repaired: the description states the merge, the pin `2fd255d9`, 36 admitted theorems, the four importers, "consumes 8.3–8.5", and names the open revision of DeRhamCohomologyAndDuality. Each of these agrees with the head.

## Verified sound

**Gate**, re-run on this head:

    gate DifferentialGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

**Dependency check:**

    depcheck: 233 roadmaps, 2263 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` outside the folder is empty; the manifest revisions equal main's; `git merge-tree --write-tree HEAD origin/main` is clean.

**Elaboration.** `lake env lean` on `Suggested.lean`: exit 0, 36 `declaration uses sorry` warnings, nothing else. No `set_option`, no `lemma`, no admitted `def`, `instance` or `example`. `halfSpaceBoundaryVolume` takes its continuity instance from the admitted theorem `halfSpaceBoundaryMetric_continuous`, a proposition; its body is `TauCeti.riemannianVolume`.

**Signatures.** The 65 elaborated types were compared with the README statements. The ten "dropped binder" leads are intended: `[CompleteSpace E]` is omitted by `omit` on the three finite-dimensional theorems of 3.3–3.4; the definitions `suspendedTimeField`, `timeDependentFlowDomain`, `timeDependentFlow`, `planarRadialPrimitive` are total and their theorems carry the hypotheses; `RoughDensity` is R02. Nothing changed.

**Padding probe.** Each of the 36 `sorry` replaced by `first | rfl | infer_instance | (simp; done) | trivial | (intros; rfl) | exact?` on a scratch copy: an error at each of the 36 sites. None closes in one tactic or by one library lemma.

**Headlines.** README summary and "How to read the build" list: Stokes (half-space: Tau Ceti; corners 5.5b: not statable, face structure missing), flows for Banach models (3.1–3.2, stated), Frobenius and leaves (4, stated), the de Rham theorem (8.5: not statable, the de Rham homomorphism is a construction), Poincaré duality (9.3, stated), the two definitions of the degree (10.3–10.4, stated), hairy ball (11, stated), planar Green (Tau Ceti), Laplace–Beltrami and the divergence theorem (12.5 with boundary, stated; face version not statable). The docstring names each unstated one with its missing carrier.

**Sampled sources and library citations** (Tau Ceti `2fd255d9`, Mathlib at the pin; 75 declarations opened).

- "Smooth 2-forms": `TwoForm/Basic.lean:37` (`SmoothTwoForm`, an `abbrev`), `:47` (`const`); `DifferentialForm/Closed.lean:43` (`IsClosed` is `mextDeriv form.1 = 0`), `:54` (chartwise form); `Symplectic/Manifold/TwoForm.lean:115` (`IsSymplectic`).
- "Canonical interfaces and reuse" and layer 4: `Distribution.lean:131, :269, :351, :499` (contact family is `v.2.2 = p.1 * v.2.1`, that is `ker(dz − x dy)`, as the README says), `:560`; `Foliation/Basic.lean:63`; `Distribution/Graph.lean:235`; `IntegralManifold.lean:74, :114, :124, :139–160` (nonempty carrier, `C^n` immersion, range equality); `Diffeomorph.lean:86, :107, :124, :217`; `Annihilator.lean:57`; `Splitting.lean:54`; `Transverse.lean`; `Foliation/Leaf.lean:167, :179, :281`; `LocallyFlat/Basic.lean:173` (`φ '' (φ.source ∩ A) = φ.target ∩ S`); `LocalDiffeomorph/Basic.lean:358`; `DifferentialForm/Interior.lean:304`, `Wedge/Interior.lean:69`.
- "Acceptance examples" (layer 4): the swap `S(x,y,z) = (y,x,z)` carries `ker(dz − x dy)` to `ker(dz − y dx)`; `[∂y, ∂x + y∂z] = ∂z`, and `(dz − y dx)(∂z) = 1`.
- "Conventions and existing inputs": Mathlib `MeasureTheory/Integral/CurveIntegral/Basic.lean:148`, `MeasureTheory/Function/AbsolutelyContinuous.lean:155`, `Analysis/BoxIntegral/Partition/Filter.lean:244`, `Analysis/BoxIntegral/Integrability.lean:198`; Tau Ceti `Analysis/Contour/Winding/Number/Basic.lean:76`.
- "Henstock–Kurzweil": `Analysis/BoxIntegral/Oriented/Basic.lean:34, :249, :259`; `FundThmCalculus.lean:68, :102`; `Analysis/Green/GraphIntegral.lean:72`; `Division/Basic.lean:30`; `BoundaryChain/Basic.lean:34`; `BoundaryChain/Relations.lean:56, :144`; `Division/Green.lean:63, :99`.
- "Acceptance examples" (5.6): `Analysis/Green/Examples/CurveArea/Green.lean:45, :59, :71, :104, :119, :131`; `Shoelace.lean:54`; `BowTie.lean:203`; `WeakField.lean:30`; `Analysis/BoxIntegral/Examples/GaugeFTC.lean:81, :192`, all in the namespaces the README writes.
- "Flat punctured-plane family": recomputed, see the table.
- "Ownership and ordering": `Analysis/Green/Winding.lean:30`, `IndexOne.lean:33, :65`, `FiniteSum.lean:34`, `Cycle.lean:36`, `Polygonal/Green.lean:91`; the links to ContourIntegration, ConformalMapping, PDE and ModularForms resolve on main.
- New statements: `Orientation/Cover/Basic.lean:63, :71, :79`; `DifferentialForm/Involution.lean:42`; `Naturality.lean:249` (`C²` map, `C¹` form); `ExtDeriv.lean:247, :268`; `DeRham/PoincarePairing.lean:111, :151`; `Degree/Basic.lean:76`; `Pullback/Smooth.lean:192`.
- The README flags no locator as unverified.

**Cross-roadmap citations resolved:** DeRhamCohomologyAndDuality at its open head `df0682fb` (README 62–66, 124, 377: takes 8.3–8.5 only) and on main (still lists layers 0–11; every id it cites exists here); the four importers on main. The citation resolver's seven leads are this file's own declarations. Overlaps: #334 and #1187 change the folder; the description orders #334 after this pull request and the generated block orders #1187 after it; no cited id is dropped. Ownership against the other open heads was checked only through the overlap report's vocabulary list.

**Adversarial table.** Rows marked "r25" are carried from the report on `5436a54`; those statements changed only in the carrier names.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 2.4 `orientable_iff_exists_homeomorph_orientationCover` | `M = ∅`; `dim E = 0`; `S¹ ⊔ S¹`; `S¹ ⊔ B` (Möbius) | both sides true (empty homeomorphism, lift exists); cover `M × 2`, true/true; 4 components, trivial, orientable; 3 components, no section over `B`, false/false | holds; converse via the section `x ↦ e (x, 0)` | none |
| 2.4 `mextDeriv_invariantPart`, `…antiInvariantPart` | `τ ≡ c` on `ℝ`, `f` a `C¹` function; `τ = id` | `d((f + f(c))/2) = df/2`, `(df + 0)/2 = df/2`; `dφ = dφ` | holds; needs `C²` map and `C¹` form as in `Naturality.lean:249` | none |
| 9.2 `bijective_integral_…` | `n = 0`, `M` a point; `M = ℝ` | `H⁰_c = ℝ`, integral `±` evaluation; `H¹_c(ℝ) = ℝ` by `∫` | holds; `ConnectedSpace` excludes `∅` | none |
| 9.2 nonorientable vanishing | open Möbius band | `H²_c = 0` | holds | none |
| 9.3 `bijective_poincarePairing` | `M = ∅`; countable discrete `M`, `k = l = 0`; `ℝ`, `k = 0`, `l = 1`; `[0,1]` | `0 → 0`; `∏ℝ → (⊕ℝ)^*` bijective; `ℝ → (ℝ)^*`, `1 ↦ ∫`; excluded by boundaryless (`[dx] = 0`, `∫ dx = 1`) | holds without compactness in this direction | none |
| 10.3–10.4 degree formula | `id` on `S¹`; constant map, `y ≠ c`; `o ↦ −o`; `o' ↦ −o'`; `n = 0` | `∫η = 1·∫η`; `0 = 0·∫η`; both sides negate; degree and `∫_N` both negate; holds too (sign `±1` on a point) | holds; `1 ≤ n` is the source's hypothesis | none |
| 4.2–4.4 on `TauCeti.IntegralManifold.{u, u}` | constant family; contact family; rank `0`; irrational line on `T²` | affine slice, range equal; `[∂y, ∂x + y∂z] = ∂z ∉ D`; point leaves; carrier `ℝ`, dense image | hold | none |
| 4.3 slice clause | `span(e₁)` on `ℝ²`, `e = id`, `P = ℝ × {0}` | `id '' (ℝ × {0}) = univ ∩ (ℝ × {0})`, `finrank = 1` | holds | none |
| 5.6 punctured-plane family | general `α`; unit circle; `α = 1` | `∂ₓQ − ∂ᵧP = 2ρ^(−α) − 2αρ^(−α−1)(x² + y²) = 2(1−α)ρ^(−α)`; integrand `sin² + cos² = 1`, integral `2π`; curl `0` | README values correct; non-exact for every `α` | none |
| 5.6 examples | ellipse; `P = \|x − ½\|, Q = x` | circulation `πab`; `∂ᵧP = 0`, `∂ₓQ = 1`, area `1` | agree with the cited theorems | none |
| 12.5 divergence theorem | half-line, `X = f∂t` compactly supported; unit disc, `X = x∂x + y∂y`; `X = ∂t` on the half-line | `∫f' = −f(0)`, flux `⟪X, −∂t⟫ = −f(0)`; `2π = 2π`; excluded by the support hypothesis | holds | none |
| 12.5 `halfSpaceBoundaryMetric_continuous` | `n = 0`; flat half-plane | trivial fibre; `dy²` | holds (pullback of a smooth metric by a smooth immersion) | none |
| 12.1 `immersionMetric` | `id`; `x ↦ 2x`; `x ↦ x²` | given metric; `4 dx²`; `hinj` fails at `0`, where `pos` would fail | body correct | R01 (docstring only) |
| 5.5a `Density` | `V = ℝ`, `m = 1`; `dx` | `toFun(−1) = toFun 1`; `dx(−1) = −1`, not a density | definition discriminates | R02 (`RoughDensity`) |
| 11.1–11.2 hairy ball | `n = 0`; `n = 1`; `n = 2` | `v = 0` forced; `ix` nowhere zero, excluded by `Even`; `(−y, x, 0)` vanishes at the poles | holds | none |
| 2.2 `exists_topForm_of_orientation` | `dim E = 0`; `ℝ` | `φ = 1 > 0` where the hypothesis holds; `dx(e₁) = 1` | holds | none |
| 2.2 `orientable_iff_exists_atlas` (r25) | `Icc 0 1`; `∅` | orientable, no oriented atlas, excluded by boundaryless; true/true | holds | none |
| 2.2 `pullbackSign_mul_pullbackSign` (r25) | `ℝ`, charts `t`, `−t` | signs `+1`, `−1`, product `−1` = sign of the transition | holds | none |
| 0.3 `isSmoothBundleForm_mpullback` (r25) | `f = id`; trivial bundle | `φ`; the native case `Pullback/Smooth.lean:192` | holds | none |
| 3.1–3.2 Banach flows (r25) | `v = 1`; `v = x²` near `1`; `ℓ²`, `v = Ax` | `x + t + u`; `1/(1/x − t)`; `e^{tA}x`, domain `univ` | hold | none |
| 3.3 `exists_flowOf_one_eq` (r25) | `ℝ`, `0 ↦ 3` | `v = 3χ`, value `3` | holds | none |
| 3.4 bracket by flow, straightening (r25) | `v = ∂x`, `w = x∂y` | derivative `∂y`, bracket `∂y` | sign agrees | none |
| 3.5 time-dependent flows (r26) | `v s x = s`; `v = x²`; `J = (0,1) ∪ (2,3)` | `x + (t² − s²)/2`; `x/(1 − x(t − s))`; `(2.5, 0.5, x)` outside the domain | hold | none |
| 5.4 radial primitive (r25) | `(y, x)`; `(−y, x)` | `g = xy`; `−1 ≠ 1`, excluded by closedness | holds | none |
| 5.4a moving pullback (r25) | `P = x + t e₁`, `ω = x dy` | `dy = 0 + dy` | holds | none |
| 12.1 `volume_circle` (r25) | round metric | `⟪iz, iz⟫ = 1`, volume `2π` | holds | none |

## Not verifiable

- [Lee], GTM 218, is not in the sources cache and is not open access. The locators Prop. 15.5, 15.6, 15.15, Thm. 15.41, 9.12, 9.16, 9.22, 9.38, 9.48, 16.25, 16.32, 17.30, 17.34, 17.35, 19.21, Lemma 19.5 and Problem 16-6 agree with my recollection of the second edition's numbering; they were not read against the text. [Bott–Tu, I §5] likewise.
- The Isabelle/AFP `Green` entry and HOL Light's `GREEN_THEOREM_CURL` were not opened; the README uses them as acceptance references for theorems Tau Ceti already proves, and those were checked at the pin.
- That an abbreviation of `TauCeti.Manifold.Orientation` would fail to build `AlgebraicTopology/OrientationComparison.lean` was decided by reading that file, not by building a modified copy.

## Source issues

- none
