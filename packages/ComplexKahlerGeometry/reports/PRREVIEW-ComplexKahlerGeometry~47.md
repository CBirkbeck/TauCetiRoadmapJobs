# Review of ComplexKahlerGeometry (pull request #1807 at ac36c47)

**Verdict:** needs changes

This is an incremental re-review: 0 lines changed since 3e107fa. `TauCetiRoadmap/ComplexKahlerGeometry/` is byte-identical to the folder the previous review read: `git diff --stat 3e107fa HEAD -- TauCetiRoadmap/ComplexKahlerGeometry` is empty, the README has 2303 lines and `Suggested.lean` has 319. The pins are unchanged (Tau Ceti 2fd255d9, Mathlib 1b1ccf4b). Since 3e107fa the pull request changed only BordismFormalGroups, CharacteristicClasses and PadicFunctionalAnalysis, all sibling folders the brief names. This README cites only CharacteristicClasses, as a consumer at lines 2026 and 2257, and that citation still resolves (see Verified sound). Main moved from 3b3f7ef to adf01c6, but for the roadmaps this README cites, only PROGRESS/STATUS files changed.

Twelve of the fourteen previous findings still hold. The thirteenth is no longer a defect because of a change outside this pull request: DifferentialGeometry's open revision (#886, now at 6f270bf) again defines the ids this README cites. That was previous R06. Previous R14 is re-raised below as R13, with #1854 added to its witness. The gate still fails, on the dropped-names rule only (R01).

Most of the repairs requested below already appear as text in the ComplexKahlerGeometry folder at #1808's head (6931121), which the description orders after this pull request. That head has no mention of PlanarTopology or SurfaceTopology; it cites GeometricTopology 1.7, has `rueckert_nullstellensatz` and `oka_coherence`, cites `IsManifold.restrictScalars_of_ne_zero` and `smoothStalkIsDomain`, drops `realified_isManifold_analytic`, and adds an old → new id map. That head is not reviewed here, but porting its ComplexKahlerGeometry text into this pull request is the shortest route to repair.

## R01 (P2) — PlanarTopology and SurfaceTopology are cited as suppliers, but the gate forbids both names and no roadmap on main owns them

**Location.** `README.md` line 328, `### From TauCetiRoadmap.PlanarTopology and TauCetiRoadmap.SurfaceTopology`, with lines 330–332. Also line 102 (Scope), lines 2056–2061 (7.3) and lines 2103 and 2114 (`*Needs:*` and `### Dependencies`).

**Claim.** Both names are on the project's dropped-names list. The gate fails on them at this head, and this is its only failing rule. Neither roadmap is on main, in `Completed/`, or in the merge order; both exist only at #271 (head 421e114), which the brief does not give as a head to use.

**Witness.** My gate run: `dropped=13 … FAIL`, with the first hit `dropped: line 328: ### From TauCetiRoadmap.PlanarTopology and TauCetiRoadmap.SurfaceTopology`. The dropped-names list includes `SurfaceTopology` and `PlanarTopology`.

**Repair.** Delete the supplier subsection at lines 328–332 and the clauses at lines 102, 2056–2061, 2103 and 2114.
- For the genus dictionary of 7.3, cite GeometricTopology Layer 1.7 (compact smooth surfaces) and Layer 1.7.1 (polyhedral models). Own here only the adapter from 1.1's realified atlas to a closed orientable surface.
- GeometricTopology on main has no §1.7: its layers run from `### Layer 1` to `### Layer 11`, with no surface subsection. §1.7 and §1.7.1 exist only at #903's head 8bd9871 (lines 921 and 982), so the merge-order paragraph must say that this citation follows #903.
- #1398's head 4f5ca96 and #1808's head make the same repointing; there are 0 mentions of either dropped name at both.

## R02 (P2) — Layer 3 re-plans the pinned Tau Ceti's several-variable calculus, holomorphic stalks and meromorphic germ field (carried: previous R02, not repaired)

**Location.** `README.md` lines 740–751 (3.1, "Prove Osgood's lemma …"), lines 771–779 (3.2), lines 810–834 (3.3), and line 114 ("3.1 proves its equivalence to complex analytic and complex `ContMDiff ∞` maps").

**Claim.** All of these objects are at Tau Ceti 2fd255d9, and "From Tau Ceti" cites none of them:
- Osgood's lemma: `TauCeti.analyticOnNhd_iff_continuousOn_and_differentiableAt_update` (`Analysis/Complex/CauchyIntegralPolydisc.lean` line 318).
- The realified atlas: `IsManifold.restrictScalars_of_ne_zero` (`Geometry/Manifold/Complex/Analytic.lean` line 115).
- Holomorphic = `ContMDiff`: `TauCeti.contMDiff_iff_mdifferentiable` (line 174).
- The stalk is a domain: `TauCeti.holomorphicStructureSheaf.smoothStalkIsDomain` (`StructureSheaf/Domain.lean` line 93).
- The meromorphic germ field: `isFractionRing_meromorphicGerms` (`StructureSheaf/MeromorphicGerm.lean` line 141).

**Witness.** Re-run this round with `TauCeti.Geometry.Manifold.Complex.StructureSheaf.Domain` imported: `example … (x : M) : IsDomain ((smoothSheafCommRing 𝓘(ℂ, E) 𝓘(ℂ) M ℂ).presheaf.stalk x) := inferInstance` elaborates. So the `∃ _ : IsDomain …` binder in `uniqueFactorizationMonoid_holomorphicStalk` is redundant at the pin. The same theorem stated without the binder elaborates too.

**Repair.**
- Add the five declarations above, by name and file, to "From Tau Ceti", and delete the matching construction sentences in 3.1–3.3 and line 114.
- Keep only what the pin lacks: the local defining-equation comparisons, `𝒪_(M,x) ≃ ℂ{z₁,…,z_n}`, the circle-integral coefficient formula, and the transport of sums, products and differentiation.
- Import `TauCeti.Geometry.Manifold.Complex.StructureSheaf.Domain` and state `uniqueFactorizationMonoid_holomorphicStalk` as plain `UniqueFactorizationMonoid (… .stalk x)`.

## R03 (P2) — Layers 1, 2, 5 and 7 re-plan pinned Tau Ceti objects (carried: previous R03, not repaired)

**Location.** 1.1 lines 364–374; 1.2 lines 410–417; 2.1 lines 542–548; 2.2 lines 577–584; 5.1 lines 1209–1210; 5.3 lines 1318–1326; 7.1 lines 1970–1979. Scope line 29 still names the orientation lift as owned by Layer 1.

**Claim.** These are pinned at 2fd255d9, and the README plans them again:
- `complexOrientationLift` and `complexOrientationLift_sign` (`Complex/Orientation.lean` lines 297 and 311).
- `exists_jointImplicitFunction_of_eventually_mdifferentiableAt` (`Complex/ImplicitFunction.lean` line 52).
- The compact-support Cauchy transform and its parameter version (`Analysis/Complex/Pompeiu/Basic.lean`, `Pompeiu/Parameter.lean`).
- `not_tendsto_sum_normalized_delta_derivative` (`Analysis/Distribution/DeltaSeries.lean` line 97).
- `Distribution.exists_norm_apply_le` (`Order.lean` line 39).
- `Distribution.complexPairing` (`ComplexPairing.lean` line 56).
- `Projectivization.instIsManifold` (`Geometry/Manifold/Instances/Projectivization.lean` line 82).

**Witness.** I re-opened each of these lines this round. For example, `Orientation.lean` line 297 reads `def complexOrientationLift : Manifold.OrientationLift 𝓘(ℝ, E) M (Fin (finrank ℝ E)) :=`.

**Repair.** Move these declarations to "From Tau Ceti" and cut the construction sentences. After that:
- 1.2 keeps the submanifold and normal-sequence theory.
- 2.1–2.2 keep the shell exhaustion and the gluing of the solver.
- 5.3 keeps the continuous-primitive and supported-jet structure.
- 7.1 keeps the orientation comparison and the `OnePoint ℂ` biholomorphism.

The module docstring should give the real reason the projective statements of 7.1–7.2 are not stated. Tau Ceti's `Projectivization` instance modules cannot be imported next to `import Mathlib` at the pins, because they clash with `Projectivization.instTopologicalSpace`.

## R04 (P2) — Rückert's Nullstellensatz and Oka's coherence theorem are statable but neither stated nor named (carried: previous R04, not repaired)

**Location.** `README.md` lines 859–865 bold both theorems as Layer 3 headlines. `Suggested.lean` lines 26–45: neither the docstring's "Stated here" list nor its "Not statable" list names them. The de Rham Hodge theorem of 5.7 is also missing from both lists.

**Witness.** Re-run this round: in a scratch copy of `Suggested.lean`, both statements elaborate at the pins using Mathlib carriers only (exit 0; the only output is `sorry` warnings, 17 of them = 14 + 3 probes).
- Nullstellensatz: for `f : Fin k → (Fin n → ℂ) → ℂ` and `g`, all analytic at `0`, `(∀ᶠ z in 𝓝 0, (∀ i, f i z = 0) → g z = 0) → ∃ m a, (∀ i, AnalyticAt ℂ (a i) 0) ∧ (fun z => g z ^ m) =ᶠ[𝓝 0] fun z => ∑ i, a i z * f i z`. Instance: `f₀ = z²`, `g = z`, `m = 2`, `a₀ = 1`.
- Oka: for `f` holomorphic on an open `U ∋ x`, there are a neighbourhood `V` and finitely many holomorphic relations `g j` on `V` whose germs generate the relation module at every `y ∈ V`.

**Repair.** Add both theorems to the Layer 3 section of `Suggested.lean`, with docstrings citing Demailly II (4.22) (`demailly-agbook` line 4742) and II (3.19) (line 4286). Either state the de Rham Hodge theorem the way the Dolbeault one is stated, or name it in the docstring with the carrier it lacks.

## R05 (P2) — The differential-operator core and the Laplace-type predicate have two owners (carried: previous R05, not repaired)

Re-raised: R06 of the review at 12e0624, R04 at 7e8275c. PseudodifferentialOperators sits outside this folder, but that does not make the finding unactionable. This pull request already edits the consumer sentences of thirteen other roadmaps to cut loops, and this repair is one sentence of the same kind.

**Location.** `README.md` 5.2, lines 1248–1268 ("Own the differential-operator core … the Laplace-type predicate … the bilinear density transpose `P^t` … the metric formal adjoint `P*`"), and lines 91–95.

**Claim.** PseudodifferentialOperators on main (unchanged between 3b3f7ef and adf01c6) owns the same objects and names this roadmap's K5a as their consumer. After this merge, main would have two owners that disagree about which way the supply goes.

**Witness.** `TauCetiRoadmap/PseudodifferentialOperators/README.md` on main, lines 438–441: "Define the Laplace-type predicate on this carrier by order at most 2 and Fourier principal symbol `c|ξ|²_g Id` … CKG K5a consumes this predicate for its analytic regularity."

**Repair.** Add PseudodifferentialOperators to this pull request:
- In its P1.0, cite ComplexKahlerGeometry 5.2 for the chart-local carrier, the Fourier symbol, the Laplace-type predicate, the transpose and the adjoint.
- Keep jets, the iterated-commutator order and the connection expansion in PseudodifferentialOperators.
- Delete its line 441.

Moving the core the other way would recreate the cycle, because P1.0 needs K5a's density bundle.

## R06 (P3) — This pull request drops anchor ids that roadmaps on main link to, with no old → new map (carried: previous R07, not repaired)

**Location.** Lines 526, 1143 and 1960 (`## Layer 2: … (K2)`, `## Layer 5: … (K5)`, `## Layer 7: … (K7)`) replace the `## K2: …`, `## K5: …` and `## K7: …` headings. The README has no old → new lines.

**Witness.** On main, three relative links break:
- PseudodifferentialOperators line 2105 links `../ComplexKahlerGeometry/README.md#k5-compact-hermitian-elliptic-theory-and-serre-duality`.
- SmoothBundlesConnections line 576 links the same anchor.
- MorseTheory line 831 links `#k7-projective-torus-and-hopf-examples`.

The links in Hyperfunctions, RiemannianGeometry, SpinGeometry and GeneralizedCohomology are commit permalinks and do not break.

**Repair.** Add one line per moved id:
- K3.0 → 3.1
- K5a → 5.1–5.8
- K5b.0 → 5.9
- K5b.1 → 5.10
- K6.0 → 6.1
- K6.1 → 6.2
- K7.1–K7.3 → 7.1–7.3
- each old layer anchor → its new heading

Alternatively, update the three links in this pull request.

## R07 (P3) — Some targets need later targets (carried: previous R08, not repaired)

**Location and witness.**
- Line 2183: 8.2's `*Needs:* 2.4; 5.6; 8.1; 8.3; …`, and line 2188: 8.3 "Supply the existence and lattice theorem needed at every induction step of 8.2".
- Line 563: 2.1 needs "2.2–2.3".
- Line 627: 2.2 needs "2.3's truncation operators".
- Line 663: 2.3 needs "2.2 for the acyclicity statements".
- Line 524: 1.2 needs "3.1 for the several-variable calculus".

**Repair.**
- Put 8.3 before 8.2.
- Order Layer 2 as truncation, solver, polydisc lemma, cohomology, and move 2.3's acyclicity sentence to 2.4.
- Move 3.1 to the start of Layer 1, or into a Layer 0.

## R08 (P3) — Two suppliers are named as consumers (carried: previous R09, not repaired)

**Location.**
- Line 2258: "AlgebraicTopology Stage 7 consumes 7.1's carrier for its Euler-characteristic check".
- Lines 320–321 and 2264–2265: VariationalMethods §5.3 is presented as following 5.6/5.7.

**Witness.**
- AlgebraicTopology at this head, lines 1817–1821: the `chi(CP^n)` check "consumes Stage 4.6's cell structure … it consumes no complex-manifold, Hodge or Serre-duality input. ComplexKahlerGeometry K7 consumes Stage 4.6's projective carrier".
- VariationalMethods at #1028's head 7ea28a3, line 1054: "ComplexKahlerGeometry K5a consumes Layers 2–5".

**Repair.** Delete both clauses. If 5.7 uses VariationalMethods §5.3's adapter, add §5.3 to 5.7's `*Needs:*`.

## R09 (P3) — Some locators do not support the statement as written (carried: previous R10, not repaired)

**Location and witness.**
- 7.2, lines 2008–2011, cites knutson-borel-weil p. 1 for `H⁰(O(k))` and `binomial(n+k, n)`. `knutson-borel-weil` lines 64–72 give only the `k = 1` identification with `V*`. The statement for all `k` is Demailly V (15.5) (`demailly-agbook` line 13724).
- `Suggested.lean` line 150 cites II (2.1) for uniqueness. (2.1) at line 3794 is existence; uniqueness is the clause "The representation (2.4) is unique" at line 3817.
- `Suggested.lean` line 217 cites VI §(7.3) for finite-dimensionality. That is (7.2), the Hodge isomorphism (line 15385); (7.3) is Serre duality (line 15390).
- Line 906 cites II (4.31) for the dimension drop. (4.31) at line 4929 says only that `A_sing` is analytic; the density of regular points is (4.24), line 4789.
- 3.4's regular-local-ring claim has no locator.
- `even_finrank_complexDeRhamCohomology_odd` has no locator (VI (8.12), line 15523).

**Repair.** Replace each locator with the one given above. For `hormander-alpdo1`, name the volume: *The Analysis of Linear Partial Differential Operators I*, 2nd ed.

## R10 (P3) — Unqualified subsection numbers in 5.6 and 6.2 point to the wrong subsections (carried: previous R11, not repaired)

**Location and witness.**
- Line 1508: "8.4's vector-valued simplex and chain integrals". This roadmap has no 8.4.
- Line 1512: "5.5's `integralTopForm_eq_integralDensity`". 5.5 here is the Sobolev scale.
- Lines 1540 and 1551–1552: "5.4's radial homotopy", "5.4's `homotopyOperator`". 5.4 here is the Fréchet topology.
- Line 1547: "the polar notation of 1.4". 1.4 here is Newlander–Nirenberg.
- Line 1907: "5.2's `integralTopForm`". 5.2 here is differential operators.

DifferentialGeometry on main has 5.2 `integralTopForm` (line 511), 5.4 `homotopyOperator` (line 524), 5.5 `integralTopForm_eq_integralDensity` (line 529) and 8.4 (line 845).

**Repair.** Write "DifferentialGeometry 8.4 / 5.5 / 5.4 / 5.2" in these places. Replace "the polar notation of 1.4" with `β = d log|z|`, `α = dθ`.

## R11 (P3) — Some Checks compute the wrong value, use an object outside the hypothesis, or are missing (carried: previous R12, not repaired)

**Location and witness.**
- Lines 1712–1714: for two circles with ranks 1 and 2, the Check says "the eigenvalue `0` has multiplicity `2`". In fact `ker Δ_d = ℂ ⊕ ℂ²` has dimension 3.
- Lines 947–949: `V = {z₁ z₂ = 0} ∩ {|z| ≤ 1}` is not an analytic subset near `|z| = 1`.
- Lines 1488–1489: `|x|^(1/2)χ ∈ H^s` iff `s < 1`. That says nothing about the strict threshold `s > 3/2`.
- No Check excludes a closed, tame, non-J-invariant form from `IsKahlerForm`, for example `κ = dx₁∧dy₁ + dx₂∧dy₂ + ε dx₁∧dx₂` on `ℂ²`.
- `polydisc` and `lefschetzPow` have no discriminating Check.
- `Suggested.lean` line 260 reads `g(v, w) = κ(v, Jv)` where `κ(v, Jw)` is meant.

**Repair.**
- Change the circles Check to "multiplicity `3 = 1 + 2`".
- Use the closure of `{z₁z₂ = 0}` in `ℂP²` instead of the truncated set.
- Replace the Sobolev example with `k = 0`, `n = 2` and a cut-off `log log(1/|x|)`.
- Add the three missing Checks.
- Correct the docstring to `κ(v, Jw)`.

## R12 (P3) — Padding: one pinned lemma closes `realified_isManifold_analytic` (carried: previous R13, not repaired)

**Location.** `Suggested.lean` lines 115–123.

**Witness.** Re-run this round in a scratch copy with `TauCeti.Geometry.Manifold.Complex.Analytic` imported: `example … [h : IsManifold 𝓘(ℂ, E) ∞ M] : IsManifold 𝓘(ℝ, E) ω M := IsManifold.restrictScalars_of_ne_zero ω (by simp) h` elaborates without error.

**Repair.** Delete the declaration from `Suggested.lean`. The README should cite the pinned lemma instead (R02).

## R13 (P3) — Conflicting open pull requests on this roadmap with no stated order (carried: previous R14, not repaired)

**Location.** The description's merge-order paragraph: "No open pull request must merge before this one. The stacked ModularCurves and SchemeAndStackFoundations move follows #1101 and this pull request."

**Witness.** That paragraph orders #1808. It names none of #1234 (head 06e0a3f), #1398 (head 4f5ca96) or #1854 (head c07dda7), all of which change `TauCetiRoadmap/ComplexKahlerGeometry/`:
- The overlap report lists #1234 and #1398 as conflicting with this head in `README.md` and `Suggested.lean`.
- #1854 edits main's ComplexKahlerGeometry README at lines 609, 1538 and 1613 (DGFloer → AlgebraicTopology Stage 5.0; the RiemannianGeometry/SpinGeometry clause). This head already contains those edits (lines 1179, 2124, 2141).

**Repair.** In the merge-order paragraph, state which of #1234, #1398, #1854 and this pull request is rebased on which, and which of their ComplexKahlerGeometry changes this rewrite already contains.

## Previous findings

- R01 — not repaired: lines 102, 328–332, 2056–2061, 2103 and 2114 still cite PlanarTopology and SurfaceTopology, and the gate fails with `dropped=13` (now R01).
- R02 — not repaired: lines 114, 740–751, 771–779 and 810–834 still plan Osgood, the realified atlas, the stalk and the meromorphic germ field (now R02).
- R03 — not repaired: lines 364–374, 410–417, 542–584, 1209–1210, 1318–1326 and 1970–1979 are unchanged; "From Tau Ceti" still omits the pinned names (now R03).
- R04 — not repaired: lines 859–865 still bold both theorems, and `Suggested.lean` lines 26–45 name neither (now R04).
- R05 — not repaired: 5.2 lines 1248–1268 are unchanged, and PseudodifferentialOperators on main lines 438–441 are unchanged (now R05).
- R06 — repaired, by a change outside this pull request: the README text is unchanged, but DifferentialGeometry now defines 6.1, 6.2, Layer 7, 8.3–8.5 and 9.3 on main, at #886's head 6f270bf and at #1187's head. The overlap report lists no dropped id.
- R07 — not repaired: there is still no old → new line; headings at 526, 1143 and 1960 are unchanged (now R06).
- R08 — not repaired: lines 524, 563, 627, 663, 2183 and 2188 are unchanged (now R07).
- R09 — not repaired: lines 320–321, 2258 and 2264–2265 are unchanged (now R08).
- R10 — not repaired: lines 906, 2008–2011 and `Suggested.lean` lines 150 and 217 are unchanged (now R09).
- R11 — not repaired: lines 1508, 1512, 1540, 1547, 1551–1552 and 1907 are unchanged (now R10).
- R12 — not repaired: lines 947–949, 1488–1489, 1712–1714 and `Suggested.lean` line 260 are unchanged (now R11).
- R13 — not repaired: `Suggested.lean` lines 115–123 are unchanged, and the one-tactic probe still closes the statement (now R12).
- R14 — not repaired: the merge-order paragraph orders only #1808, while #1234, #1398 and #1854 still change this folder (now R13).

## Verified sound

**Gate at ac36c47 (my run).**
- `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=13 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=20 source-material=0 FAIL`.
- The only failing rule is `dropped` (R01). The worker's record agrees (`dropped=13`, `build=0`).
- The 20 `outside-folder` lines are files of the thirteen sibling folders the brief names. `git diff --stat origin/main...HEAD` lists 22 files, all inside the fourteen named folders.

**Dependency check.** `depcheck: 229 roadmaps, 2310 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line for ComplexKahlerGeometry.

**Elaboration.** `lake env lean TauCetiRoadmap/ComplexKahlerGeometry/Suggested.lean` exits 0 in 14 s. The only output is 14 `declaration uses sorry` warnings, at lines 75, 100, 119, 130, 141, 152, 173, 181, 219, 226, 271, 279, 287 and 305.

**`#check @name` for all 24 declarations.** I ran these in one scratch copy together with the R02, R04 and R12 probes (exit 0, 17 `sorry` warnings = 14 + 3 probes).
- All 24 names print, with the types of the worker's signature report.
- The nine definitions without `[FiniteDimensional ℂ E]` (`dolbeaultCocycles`, `dolbeaultCoboundaries`, `DolbeaultCohomology`, `mextDerivℂ`, `deRhamCocycles`, `deRhamCoboundaries`, `ComplexDeRhamCohomology`, `IsKahlerForm`, `lefschetzPow`) do not need it in their bodies.
- Every theorem about these definitions carries `[FiniteDimensional ℂ E]`, plus `[T2Space M] [CompactSpace M]` wherever the README requires compactness. For example, `hard_lefschetz` elaborates with `[FiniteDimensional ℂ E] … [T2Space M] [CompactSpace M]`.
- No theorem lost a binder that its README statement has.

**Adversarial table.** The diff touches no statement, so every row is carried, with its values, from the review at 3e107fa (which carried them from 7e8275c). Three probes were re-run this round.

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| `newlander_nirenberg` | `E = ℂ`; 1.3's `J` on `ℝ⁴`; `J = ofComplexManifold` | surface: `N(v,Jv) = J N(v,v) = 0`; `ℝ⁴`: `N(∂x,∂u) = ∂x ≠ 0`; `IsPseudoholomorphicOn` needs differentiability on the source | sound | none |
| `dolbeault_grothendieck_polydisc` | `n = 1`, `φ = z̄ dz̄`; `n = 0`; `r₁ ≤ 0` | `ψ = z̄²/2`; `ψ = 0`; empty polydisc, vacuous | sound | none |
| `hartogs_extension` | `n = 2`, `K = {0}`; spherical shell; `n = 1` | extends; `Ω ∖ K` disconnected, excluded by `hconn`; `1/z` excluded by `2 ≤ n` | sound | none |
| `weierstrass_preparation` | `w² − z`; `e^z w`; `d = 0`; `n = 0` | `u = 1`, `a = (−z, 0)`; `u = e^z`; `u = f`; `f = u w^d` | sound | none |
| `weierstrass_preparation_unique` | `w² − z` | `a′ = (−z, 0)`, `u′ = 1` | true | locator (R09) |
| `isRegularLocalRing_holomorphicStalk` | `E = 0`; `E = ℂ` | dimension `0`; `ℂ{z}` a DVR, dimension `1` | sound | locator (R09) |
| `uniqueFactorizationMonoid_holomorphicStalk` | `ℂ{z, w}` | `w² − z³` irreducible; `w² − z² − z³` splits; `IsDomain` inferred at pin (re-run) | sound | binder (R02) |
| Dolbeault cocycles/coboundaries/cohomology | compact Riemann surface, `(1,0)` | cocycles of dimension `g`, coboundaries `⊥` | sound | none |
| `finiteDimensional_dolbeaultCohomology` | Hopf; `ℂ`; finite `M` | `h^(0,1) = 1`; `𝒪(ℂ)` infinite-dimensional, excluded by compactness; `h^(0,0) = |M|` | sound | locator (R09) |
| `finrank_dolbeaultCohomology_serre` | Hopf; elliptic curve `p = 2, q = 1` | `1 = 1`, `0 = 0`; without `hp`, `0 ≠ 1` | sound | none |
| `finrank_complexDeRhamCohomology_eq_sum_dolbeault` | elliptic curve `k = 1, 2`; Iwasawa | `2 = 1 + 1`; `1 = 0 + 1 + 0`; `4 ≠ 5` (not Kähler) | sound | none |
| `finrank_dolbeaultCohomology_symm` | elliptic curve; Hopf | `1 = 1`; `0 ≠ 1` (not Kähler) | sound | none |
| `even_finrank_complexDeRhamCohomology_odd` | elliptic curve; Hopf | `b₁ = 2`; `b₁ = 1` (not Kähler) | sound | locator (R09) |
| `hard_lefschetz`, `lefschetzPow` | curve `k = 0`; `k = n`; `ℂP¹×ℂP¹` | `∫ω > 0` per component; `lefschetzPow κ 0 = id`; `∫ω² = 2` | sound | Checks (R11) |
| `IsKahlerForm` | `dx∧dy`; `−dx∧dy`; `κ_ε` | `1 > 0`; `−1`, excluded; closed, tame and not invariant, excluded by the invariance clause, with no Check | sound | Check, typo (R11) |
| `polydisc` | `r = (1,1)`; `r₁ = 0` | `(0.9, 0.9)` lies inside, norm 1.27; empty | sound | Check (R11) |
| `realified_isManifold_analytic` | one-tactic probe (re-run) | closes with `IsManifold.restrictScalars_of_ne_zero ω (by simp) h` | padding | R12 |
| Rückert (README 3.4, probe re-run) | `k = 1`, `f₀ = z²`, `g = z` | `g² = 1·f₀`, `m = 2`; statement elaborates | statable, absent | R04 |
| Checks of 1.1, 1.3, 2.2–2.4, 3.1, 3.3, 3.4, 4.1–4.3, 5.2, 5.3, 5.6, 5.7, 5.9, 6.1, 6.2, 7.2, 7.3, 8.1, 8.2 | as at 7e8275c | `det = 4`, `−1`; `u = z̄`; error `2^(−N) ≤ 12(2/3)^(N+1)`; `H^(0,0) = ℂ^c`; `c₋₂ = 1`; Koszul `(z₂, −z₁)`; `h⁰ = 2, 3`; `Θ = −2πi ω_FS`; `e^(−πi) = −1`; `16`, `P* = −x∂ − 1`; `2^n`; periods `±2πi`; `(−1)^7`; `ω²/2! = dvol`; `2 > 0`, `∫ω_FS = 3`; `(1/π)·2π·½ = 1`; `2^(a+b+1) ≥ 2`; `3 + 2 > 4`; `∂(dz₃ − z₁dz₂) = −dz₁∧dz₂` | sound | pinned parts (R02, R03), order (R07), references (R10) |
| Checks of 3.5, 5.5, 5.8 | `V ∩ B̄`; `|x|^(1/2)χ`; two circles | not analytic near `|z| = 1`; `s < 1` only; `1 + 2 = 3 ≠ 2` | one false, one vacuous, one wrong value | R11 |

**Library declarations re-opened at the pins this round** (Tau Ceti 2fd255d9):
- `Analysis/Complex/CauchyIntegralPolydisc.lean` 318
- `Geometry/Manifold/Complex/Analytic.lean` 115, 174
- `Complex/Orientation.lean` 297, 311
- `Complex/ImplicitFunction.lean` 52
- `Analysis/Distribution/DeltaSeries.lean` 97, `Order.lean` 39, `ComplexPairing.lean` 56
- `Instances/Projectivization.lean` 82
- `StructureSheaf/Domain.lean` 93 (`TauCeti.holomorphicStructureSheaf.smoothStalkIsDomain`, stated for any boundaryless model `I` with `X : Type`)
- `StructureSheaf/MeromorphicGerm.lean` 141
- `Analysis/Calculus/DifferentialForm/Poincare.lean` 393
- `Geometry/Manifold/DifferentialForm/Poincare.lean` 101
- the `Analysis/Complex/Pompeiu/` directory (`Basic.lean`, `Parameter.lean`)

**Cross-roadmap citations re-resolved this round.**
- CharacteristicClasses at this head: C1.5 still consumes CKG K4 and the K7 `CPⁿ` carriers (lines 110–114, 755, 793). The edits to it since 3e107fa touch no ComplexKahlerGeometry clause, so README lines 2026 and 2257 stay correct.
- DifferentialGeometry on main (Layer 6 at line 782, 6.1 at 786, 6.2 at 791, Layer 7 at 806, 8.3–8.5 at 836–852, 9.3 at 872, 5.2/5.4/5.5 at 511/524/528), at #886's head 6f270bf (Layers 6–9 at 1610–1835) and at #1187's head (6.1 at 787, 9.3 at 873).
- GeometricTopology on main (no §1.7) and at #903's head 8bd9871 (§1.7 at 921, §1.7.1 at 982).
- PseudodifferentialOperators on main, lines 437–441 and 2105; SmoothBundlesConnections 576; MorseTheory 831. The anchor links of Hyperfunctions 26 and 32, RiemannianGeometry 278, SpinGeometry 75 and GeneralizedCohomology 2434 are permalinks.
- AlgebraicTopology at this head, 1815–1821; VariationalMethods at #1028's head 7ea28a3, lines 80 and 1054.
- ComplexKahlerGeometry at #1398's head 4f5ca96, #1234's head 06e0a3f, #1808's head 6931121 and #1854's head c07dda7, read with `roadmaps show`.
- The worker's citation report lists no unresolved citation or Lean name.
- Ownership against #1234, #1398, #1808 and #1854 was checked only as far as the overlap report and these four README reads.

**Sources at their locators.** No passage changed, so the seeded sample falls in no changed text. It is carried from 7e8275c. I re-opened these cache lines this round, and they still hold:
- `demailly-agbook` 883 ((3.2)), 1266 ((3.28)), 1288 ((3.29)), 3794 ((2.1)), 3817 (uniqueness of (2.4)), 3872 ((2.7)), 3931 ((2.10)), 4286 ((3.19)), 4742 ((4.22)), 4789 ((4.24)), 4929 ((4.31), R09), 13724 ((15.5)), 15385 ((7.2)), 15390 ((7.3)), 15442 ((8.5)), 15523 ((8.12)), 15557 ((8.17))
- `rainer-advanced-complex-analysis` 716 (Theorem 7.4)
- `ballmann-kahler` 1400 (3.18)
- `knutson-borel-weil` 64–72 (p. 1, `k = 1` only, R09)

**Remark on untouched text (no change requested).** Line 1539 calls "DifferentialGeometry 6.2's star-convex primitive target". At #886's head, 6.2 is not a target: it names Tau Ceti's `StarConvex.exists_contDiffOn_forall_extDeriv_eq`, which is at this roadmap's pin (`Analysis/Calculus/DifferentialForm/Poincare.lean` line 393).

## Not verifiable

- `webster-nn` (Math. Z. 201 (1989), pp. 303–316): settled as uncertified; 1.4's route is cited by locator only.
- `hormander-alpdo1`, Theorems 2.3.4–2.3.5: settled as uncertified, not read.
- `wells-dacm`, Chapters II and IV: settled as uncertified. The Hodge and Serre statements were checked against Demailly VI (7.2)–(7.3) instead.
- `griffiths-harris` and `raghunathan-discrete-subgroups`: settled as uncertified.
- PlanarTopology and SurfaceTopology at #271: not read as suppliers, since the gate forbids the names (R01).

## Source issues

- none
