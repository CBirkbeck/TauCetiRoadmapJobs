# Review of ComplexKahlerGeometry (pull request #1808 at 8fb4a83)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/ComplexKahlerGeometry/` at 8fb4a833 (357 folder lines changed since 09909fe). Of the previous review's ten findings, seven are repaired (R01, R05–R10 there). R02 is not repaired and becomes R03 here. R03 is partly moot and partly carried into R02 and R04 here. R04 is not repaired and becomes R05 here.

This review raises three blocking findings: statable headlines that are absent, suppliers that are not on main, and an object that two open pull requests both own. It also raises five P3s.

Mechanics:
- Worker gate: `outside-folder=2 … build=0 FAIL`; every other count is 0.
- Dependency check: `depcheck: 235 roadmaps, 2265 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. It does not see R02's edges, because neither roadmap is on main or in `ORDER.txt`.
- `lake env lean TauCetiRoadmap/ComplexKahlerGeometry/Suggested.lean` exits 0, with 17 `declaration uses sorry` warnings and nothing else.
- Pins: Mathlib 1b1ccf4b, Tau Ceti 2fd255d9.

## R01 (P2) — Three headlines can be stated at the pins but are neither stated nor named as unstatable, and the docstring's torus reason is false

Location: `README.md` line 7, "Oka and Cartan coherence, the singular locus, Hartogs extension". Line 12, "the projective, torus, Riemann-surface and Hopf computations". Line 2378, "consume ComplexTori Milestone 1's quotient". `Suggested.lean` lines 52–53, "the torus, Hopf and Iwasawa computations … whose carriers (complex tori and holomorphic quotients) are targets of ComplexTori".

Claim: three targets are each statable with the file's definitions or two short ones. None is in the "Stated here" or "Not statable" list:
- the analyticity of the singular locus (3.5, Demailly II (4.31));
- the genus dictionary `b₁ = 2h^(1,0)` of a compact Riemann surface (7.3);
- the torus Hodge numbers `h^(p,q) = C(n,p)C(n,q)` (7.3).

Tau Ceti also pins the complex torus as a compact complex manifold, so the docstring's reason for tori is false.

Witness: all three statements below elaborate in scratch copies of this head's `Suggested.lean` (exit 0, `sorry` the only warning). Tau Ceti has `Submodule.instLieAddGroupOrbitRelQuotient` (`Geometry/Manifold/Algebra/Quotient.lean` line 86) and `Submodule.instCompactSpaceOrbitRelQuotient` (`Algebra/Module/ZLattice/Quotient.lean` line 65).

Repair: add to `Suggested.lean` (imports `TauCeti.Geometry.Manifold.Algebra.Quotient` and `TauCeti.Algebra.Module.ZLattice.Quotient`):

```lean
/-- `A` is an analytic subset of the open set `U ⊆ ℂⁿ` (Demailly, Chapter II, (4.1)). -/
def IsAnalyticSubset {n : ℕ} (U A : Set (Fin n → ℂ)) : Prop :=
  A ⊆ U ∧ ∀ x ∈ U, ∃ V : Set (Fin n → ℂ), IsOpen V ∧ x ∈ V ∧ V ⊆ U ∧
    ∃ (k : ℕ) (g : Fin k → (Fin n → ℂ) → ℂ), (∀ i, DifferentiableOn ℂ (g i) V) ∧
      A ∩ V = {z ∈ V | ∀ i, g i z = 0}

/-- The non-regular points of `A` (Demailly, Chapter II, (4.23)). -/
def singularLocus {n : ℕ} (A : Set (Fin n → ℂ)) : Set (Fin n → ℂ) :=
  {x ∈ A | ¬ ∃ V : Set (Fin n → ℂ), IsOpen V ∧ x ∈ V ∧
    ∃ (m : ℕ) (u : (Fin n → ℂ) → Fin m → ℂ), DifferentiableOn ℂ u V ∧
      Function.Surjective (fderiv ℂ u x) ∧ A ∩ V = {z ∈ V | u z = 0}}

/-- **The singular locus is analytic** (Demailly, Chapter II, (4.31), p. 100). -/
theorem isAnalyticSubset_singularLocus {n : ℕ} {U A : Set (Fin n → ℂ)}
    (hA : IsAnalyticSubset U A) : IsAnalyticSubset U (singularLocus A) := by
  sorry

/-- **Genus dictionary** (7.3): on a compact Riemann surface `b₁ = 2 h^(1,0)`. -/
theorem finrank_complexDeRhamCohomology_one_riemannSurface
    {X : Type*} [TopologicalSpace X] [ChartedSpace ℂ X] [IsManifold 𝓘(ℂ, ℂ) ∞ X]
    [T2Space X] [CompactSpace X] :
    Module.finrank ℂ (ComplexDeRhamCohomology ℂ X 1) =
      2 * Module.finrank ℂ (DolbeaultCohomology ℂ X 1 0) := by
  sorry

/-- **Hodge numbers of a complex torus** (7.3; Demailly, Chapter VI, (4.5)). -/
theorem finrank_dolbeaultCohomology_complexTorus
    {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E]
    (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L] (p q : ℕ) :
    Module.finrank ℂ (DolbeaultCohomology E (AddAction.orbitRel.Quotient L E) p q) =
      (Module.finrank ℂ E).choose p * (Module.finrank ℂ E).choose q := by
  sorry
```

The README and docstring changes that go with it:
- Name the three theorems in 3.5 and 7.3, in the Summary's end-theorem list and in the docstring's "Stated here".
- Limit the docstring's Layer 7–8 reason to the Hopf and Iwasawa quotients.
- Add the two pinned instances to the Tau Ceti contract. In 7.3, consume them for the torus manifold and keep ComplexTori Milestone 1 for descent only.

#1854's copy of this roadmap already states the first two (its `Suggested.lean` lines 280 and 455).

Tested instances:
- `{z₁z₂ = 0}` has `Sing = {0}`, which is analytic.
- `{0} = V(z²)` and `A = U` both have `Sing = ∅`.
- Genus: elliptic curve `2 = 2·1`; `ℂP¹` `0 = 0`; two elliptic curves `4 = 2·2`.
- Torus: `n = 1` gives all four numbers `1`; `p = 2 > n` gives `0`; `E = 0` gives `h^(0,0) = 1`.

## R02 (P2) — VariationalMethods and UnboundedOperators are named as suppliers but are not on main, and this roadmap is

Location: `README.md` line 457, "### From TauCetiRoadmap.VariationalMethods and TauCetiRoadmap.OperatorTheory/UnboundedOperators". Also lines 110–112, 1375–1376, 1866–1883, 1916–1917, 1960–1963, 1982 and 2079–2080.

Claim: a roadmap already on main consumes only the pins and roadmaps on main. VariationalMethods (#1028) and UnboundedOperators (#1027) are new folders in open pull requests, and neither is in `ORDER.txt`. The 5.7–5.8 spectral route therefore rests on suppliers this roadmap may not name. This sharpens the previous review's R03, which asked only for a merge-order note.

Witness: main (3090489) has no `TauCetiRoadmap/VariationalMethods/`, and `TauCetiRoadmap/OperatorTheory/` there has no `UnboundedOperators/`. Tau Ceti pins the real compact-form spectral theorem `IsCoercive.exists_hilbertBasis_forall_apply_eq_smul_inner` (`Analysis/InnerProductSpace/Variational/Spectrum.lean` line 550).

Repair (the operator realization moves down into 5.7):
- Delete the subsection at lines 457–473 and every VariationalMethods or UnboundedOperators item in the Scope, Needs and Dependencies lines listed above.
- Add to the Tau Ceti contract the pinned `IsCoercive.formSolutionOperator` (line 138), `isCompactOperator_formSolutionOperator` (193), `isSymmetric_formSolutionOperator` (199), `finiteDimensional_eigenspace_formSolutionOperator` (459) and `exists_hilbertBasis_forall_apply_eq_smul_inner` (550) in `Spectrum.lean`, and `fredholmAlternative_formPerturbation` (`Fredholm.lean` line 135).
- In 5.7, consume these on the real restriction `Re a` of a shifted Hermitian form, with `J` the compact dense inclusion `H¹ → L²`. Own the self-adjoint operator of the form pair here: its domain `{u ∈ H¹ : a(u, ·)` is `L²`-bounded`}`, the graph characterization, the compact resolvent and the eigen-expansion.
- In 5.8, own the finite orthogonal-sum transport.

Tested on `Δ_d + 1` on `S¹` (`V = H¹`, `H = L²`): the pinned basis is `e^(ikθ)` (with `i e^(ikθ)` over `ℝ`) with `κ = k² + 1`, matching 5.7's Check `Δ_d e^(ikθ) = k² e^(ikθ)`.

## R03 (P2) — Two open pull requests both own the ℂPⁿ homeomorphism and its CW transport

Carried from the previous review (its R02); not repaired, since the description is unchanged.

Location: `README.md` lines 2303–2304, "Construct the homeomorphism from `TauCeti.ComplexProjectiveSpace n` to `Projectivization ℂ (Fin (n+1) → ℂ)`". Lines 2313–2314, "Transport the pinned finite CW structure `ComplexProjectiveSpace.cwComplex` along it". Lines 85–87, "7.2 owns the homeomorphism …".

Claim: #1797 still gives these to AlgebraicTopology Stage 4.6 and says this roadmap consumes them. The object has two owners, and each roadmap says the other consumes it.

Witness: `roadmaps show AlgebraicTopology --pr 1797`, lines 1402–1406: "Own the homeomorphism of that carrier with native `Projectivization ℂ (Fin (n+1) → ℂ)` … and the transport of the CW structure". Line 2784: "ComplexKahlerGeometry K7 consumes Stage 4.6's projective carrier and cell structure".

Repair: keep 7.2 as the owner. This pull request's own AlgebraicTopology agrees with that. Add to the description's merge-order paragraph: "#1797 is rebased on this pull request and drops its AlgebraicTopology Stage 4.6 clause on the homeomorphism of `TauCeti.ComplexProjectiveSpace n` with `Projectivization ℂ (Fin (n+1) → ℂ)` and the transport of its cells (its README lines 1402–1406 and 2784); ComplexKahlerGeometry 7.2 owns them."

## R04 (P3) — The merge-order paragraph omits #1234 and #1854, which change this folder and conflict with it

Location: the description's merge-order paragraph: "#1101 (ModularCurves) → #1807 (the other loops) → **this pull request**. It depends on no other author's open pull request."

Claim: #1234 (kim-em) and #1854 (same author) both change `TauCetiRoadmap/ComplexKahlerGeometry/README.md` and `Suggested.lean`, and both conflict with this head. #1854's copy differs from this head in 1092 README lines and declares three items this head lacks. The paragraph states no order.

The former R03's GeometricTopology part is moot: §1.7 and §1.7.1 are now on main (lines 1049 and 1101). Its VariationalMethods and UnboundedOperators part is R02.

Witness: `scratch/overlaps.md` lists both conflicts. #1854's `Suggested.lean` declares `IsAnalyticSubset` (line 238), `isAnalyticSubset_singularLocus` (line 280) and `finrank_complexDeRhamCohomology_one_riemannSurface` (line 455), and this head declares none of them.

Repair (description only): "#1854's copy of `TauCetiRoadmap/ComplexKahlerGeometry/` is rebased on this pull request (or this one on #1854; say which copy prevails). #1234 is rebased on this pull request's copy." Add the #1797 sentence from R03.

## R05 (P3) — Two edits outside the pull request's folders; the gate fails

Carried from the previous review (its R04); not repaired.

Re-raised: R14. That answer, that the files are outside the folder, does not settle the finding. The gate fails on exactly these two files, no acceptance is possible while it fails, and the repair is a revert on this branch.

Location: `Completed/ArithmeticDirichletSeries/README.md` (one line) and `TauCetiRoadmap/SymplecticGeometry/README.md` (one line). Gate: `outside-folder=2`, verdict FAIL.

Claim: these consumer-wording edits come from the loop-cutting commits and are not this pull request's subject. #1854, whose folders include both roadmaps, is where they belong.

Witness: `git log --oneline origin/main...HEAD` on the two files lists 61e5385e and e591d103.

Repair: revert e591d103 and 61e5385e on this branch.

## R06 (P3) — 2.1's Cauchy estimate is false for the annulus it claims to cover; one Check uses `ℤ/2` for half-integers

Location: `README.md` lines 700–702: "prove the Cauchy estimate `sup_K |h − A_N h| ≤ (r/ρ)^(N+1)/(1 − r/ρ) · sup_L |h|` for `h` holomorphic on a neighbourhood of the closed disc or annulus bounded by `L`". Line 1297: "which agrees only for `λ ∈ ℤ/2`".

Claim: the one-circle bound misses the inner tail of a two-sided Laurent truncation. In 4.3, `ℤ/2` reads as the group of order two, not `½ℤ`.

Witness: take `h = 1/(z − 1/8)`, `K = {1/2 ≤ |z| ≤ 2}`, circles `1/4` and `4`, `N = 1`. Then `A_1 h = 1/z`, and the error at `z = 1/2` is `2/3`. The stated bound, with `r = 2` and `ρ = 4`, is `(1/2)·(8/31) = 4/31`.

Repair:
- At lines 700–702, keep the disc estimate. For `K = {r₁ ≤ |z| ≤ r₂}` with circles `ρ₁ < r₁ ≤ r₂ < ρ₂`, add `sup_K |h − A_N h| ≤ (r₂/ρ₂)^(N+1)/(1 − r₂/ρ₂) · sup_(|ζ|=ρ₂)|h| + (ρ₁/r₁)^(N+1)/(1 − ρ₁/r₁) · sup_(|ζ|=ρ₁)|h|`.
- Tested: `2/3 ≤ 4/31 + 4`, and the annulus Check `1/z + z` still has error `0`.
- At line 1297, write "`λ ∈ ½ℤ`".

## R07 (P3) — Four sampled targets have no locator, although the cached Demailly states them; the de Rham Hodge headline cites only an uncertified text

Location:
- `README.md` 4.3, lines 1274–1290: no locator.
- 5.2, lines 1480–1500: no locator.
- 5.5, lines 1700–1703 (Sobolev embedding and Rellich): no locator.
- 5.7, lines 1889–1893, and `Suggested.lean` line 257, "(Wells, Chapter IV, §5; Layer 5.7)".

Claim: wells-dacm is recorded as uncertified, while demailly-agbook states each of these.

Witness, all in demailly-agbook:
- Lines 12832 and 12846–12881: V (6.6)–(6.7) and the following correspondence, pp. 260–261.
- Lines 14134–14155: VI (1.1)–(1.2), p. 287.
- Lines 14239–14242: VI (2.1)–(2.2), p. 289.
- Lines 14583–14606: VI (3.16)–(3.17), p. 295.

Repair:
- 4.3: "(Demailly, Chapter V, §6, (6.6)–(6.7) and the correspondence after (6.7), pp. 260–261)".
- 5.2: "(Demailly, Chapter VI, (1.1)–(1.2), p. 287; Demailly's `σ_P` is this roadmap's `σ_geom`)".
- 5.5: "(Demailly, Chapter VI, (2.1)–(2.2), p. 289, integer orders)".
- 5.7 and the `hodge_theorem_deRham` docstring: "(Demailly, Chapter VI, (3.16)–(3.17), p. 295, stated there with coefficients in a flat Hermitian bundle; Wells, Chapter IV, §5)".

## R08 (P3) — The Frölicher spectral-sequence carrier is pinned, yet the docstring says it is missing and 8.1 sources it from AlgebraicTopology Stage 5.0

Location: `Suggested.lean` lines 54–55: "the Frölicher spectral sequence, which lacks the bicomplex spectral-sequence carrier of AlgebraicTopology Stage 5.0". `README.md` lines 2468–2471, "Consume AlgebraicTopology Stage 5.0's generic filtered-complex spectral sequence". Also lines 82–83 and 440–441.

Claim: Tau Ceti pins the spectral sequence of a filtered cochain complex together with its finite-filtration convergence. At this head, AlgebraicTopology Stage 5.0 only consumes that pin, adding a homological regrading and complete convergence, and Frölicher needs neither. What actually blocks a Lean statement is this roadmap's own filtered complex of complex forms.

Witness: `CochainComplex.spectralSequence` (`TauCeti/Algebra/Homology/SpectralSequence/Filtered/SpectralObject.lean` line 409). `filtrationSpectralSequencePageXIsoGradedOfFinite` (`Convergence.lean` line 118). AlgebraicTopology README at this head, line 1110: "pinned … consume them".

Repair:
- Add both declarations to the Tau Ceti contract.
- In 8.1, consume them, reindexing the decreasing `F^p` by `−p`, and drop Stage 5.0 from lines 82–83, 440–441, 2485 and 2583.
- Docstring: "the Frölicher spectral sequence, whose filtered cochain complex of complex forms is a definition with proof obligations (`d` preserves the filtration only on an integrable structure) and cannot be stated without them".

## Previous findings

- **R01 (P2, Cartan coherence): repaired.** `cartan_coherence` is at `Suggested.lean` lines 230–241, in the Summary (line 17), the docstring (lines 33–35) and 3.4 (lines 1070–1079), with a new Check (lines 1093–1097).
- **R02 (P2, #1797 co-ownership): not repaired.** It is R03 here.
- **R03 (P3, merge order): partly moot.** GeometricTopology §1.7 and §1.7.1 are now on main. VariationalMethods and UnboundedOperators are R02 here; #1234 and #1854 are R04 here.
- **R04 (P3, outside folder): not repaired.** It is R05 here.
- **R05 (P3, names): repaired.** Lines 459–473 now cite `S_α` and `F_α`, `CompactFormPair.operatorDomainV` (#1028 line 845), `…exists_compact_selfAdjoint_shifted_inverse` (849), `…mem_operatorDomainV_iff_summable` (884) and `existsUnique_selfAdjoint_of_closed_form` (#1027 line 728). The citation itself is now R02.
- **R06 (P3, consumer claims): repaired.** See lines 87, 442–443 and 2326. The LieGroupoidsPoisson claims are gone from 1.4 and from Downstream consumers.
- **R07 (P3, Layer 2 dependencies): repaired.** See lines 500–501, 902–903 and 911.
- **R08 (P3, two-polydisc clause): repaired.** Lines 887–894 state the cross with the coefficient comparison, recomputed below.
- **R09 (P3, prime chain): repaired.** Lines 1054–1056 give `(0) ⊂ (z₁) ⊂ … ⊂ (z₁,…,z_n)`, `n + 1` primes, length `n`.
- **R10 (P3, locators): repaired.** All five locators were read at their pages: (5.9) p. 301, V §11 p. 267, VI (4.2) p. 296, (4.5)/(4.7) p. 297 and V (15.10) p. 280.

## Verified sound

**Build and signatures.**
- `lake env lean` exits 0 with 17 `sorry` warnings.
- `#check @` was run on all 28 declarations, in two scratch files:
  - every Kähler and Dolbeault theorem keeps `[FiniteDimensional ℂ E] [T2Space M] [CompactSpace M]`;
  - `hodge_theorem_deRham` keeps `[BoundarylessManifold I M]`, `RiemannianBundle` and `IsContMDiffRiemannianBundle`;
  - the definitions lack `FiniteDimensional`, which their bodies do not use.

  Nothing changed relative to the README statements.
- One-tactic probe (`first | rfl | infer_instance | (simp; done) | trivial | decide | (norm_num; done) | omega | (aesop; done)`) on a scratch copy: all 17 theorems still fall through to `sorry`, so none is padding.

**Declarations opened at the pins.**
- Tau Ceti `Nijenhuis.lean`: `nijenhuis_apply` 170, `nijenhuis_antisymm` 207, `nijenhuis_self` 213, `nijenhuis_apply_left` 219.
- Tau Ceti `Dolbeault/Basic.lean`: `delBar_delBar_apply` 405 (`−4⁻¹ • ∂f(N(v,w))`), `del_del_apply` 414.
- Tau Ceti `Eigenbundle.lean`: `isInvolutiveComplexDistribution_eigenspace_I_iff` 96, `…neg_I_iff` 149.
- Tau Ceti: `codifferential` (`Codifferential.lean` 88, `(−1)^(m(k+2)+1)`), `hodgeStar_hodgeStar` (`HodgeStar.lean` 310).
- Tau Ceti `Spectrum.lean` 103–550, `Fredholm.lean` 135, `Geometry/Manifold/Algebra/Quotient.lean` 86, `ZLattice/Quotient.lean` 65, `Filtered/SpectralObject.lean` 409, `Convergence.lean` 118.
- Tau Ceti `Orientation.lean`: `complexOrientationLift` 297, `…_sign` 311, `orientationAt_…` 320.
- Tau Ceti projective declarations, `Topology/Algebra/Projectivization.lean`: `instTopologicalSpace` 90, `isQuotientMap_mk'` 94, `instSecondCountableTopology` 149, `instT2Space` 188, `instCompactSpace` 215, `instPathConnectedSpace` 251, `isOpen_affineOpen` 271, `affineOpenPartialHomeomorph` 311.
- Tau Ceti projective declarations, `Instances/Projectivization.lean`: `instChartedSpace` 54, `contDiffOn_affineChart_symm_trans` 73, `instIsManifold` 82, `contMDiffOn_affineChart` 89, `contMDiff_affineChart_symm` 96.
- Mathlib: `OnePoint.equivProjectivization` (`ProjectiveLine.lean` 84–85, `∞ ↦ [1:0]`, `t ↦ [t:1]`, as 7.1 says) and `Topology/Algebra/Projectivization.lean` (topology only, no charts or compactness, so the docstring's projective reason holds).
- No headline duplicates the pins: the only Hartogs there is the algebraic one in `AlgebraicGeometry/PuncturedSpectrum`, and Weierstrass preparation is in one formal variable (`PowerSeries.IsWeierstrassFactorization`).

**Cross-roadmap citations resolved.**
- On main:
  - AlgebraicTopology: `cwSubcomplexNeighborhoods` 755, `simplicialRealizationCW` 817.
  - DifferentialGeometry: `legacySmoothTwoFormEquiv_isClosed_iff` 304.
  - PDE: §1.3 769, §1.7 996, §2.2 1148, §5.3 1927, §5.6 2097.
  - LieGroupoidsPoisson §G1.3a (line 603).
  - ComplexManifolds Milestone 7, items 7.4–7.5 (lines 319, 373).
  - GeometricTopology §1.7 1049, §1.7.1 1101.
- At this head: AlgebraicTopology Stage 5.0 (line 1110) and Stage 6.3.
- At their heads: VariationalMethods §2.2–§5.2 at #1028 and UO §4.7 at #1027, which resolve but cannot be named (R02).
- `scratch/citations.md`'s ten leads are this list's K-labels and #1028's names, not Lean names of this roadmap.
- The dropped `#k2`, `#k5` and `#k7` anchors are covered by the former-numbering list (lines 514–526).

**Ownership.**
- `roadmaps grep` was run for Newlander, Dolbeault–Grothendieck, Hartogs, Weierstrass preparation, Oka, Rückert, Hard Lefschetz and Wirtinger.
- TeichmullerGeometry (#1169), ComplexComparisonPartII (#848), LefschetzStructures (#1061, Scope lines 56–58) and CalibratedGeometry (#946, lines 63, 118, 999) consume this roadmap rather than re-own its objects.
- DeRhamCohomologyAndDuality (#2085) names this roadmap as its consumer, but this head consumes nothing of it, so there is no edge.

**Seeded sample, read in the text.**
- 1.3: pinned formulas as above. The ℝ⁴ example and the tensoriality Check were recomputed (table). There is no source locator; the statement is calculus on pinned declarations.
- 2.1: Rainer Theorem 7.4, printed p. 15 (rainer-advanced-complex-analysis line 716); the annulus defect is R06.
- 3.2: Demailly II (2.1) (line 3794), (2.3)–(2.4) with uniqueness (lines 3804–3823); `a_k(0) = 0` matches.
- 4.3 and 5.2: R07.
- 4.4 and 5.8: adapters with no external claim; Checks recomputed.
- 5.3: hormander-alpdo1 (not verifiable); Checks recomputed.
- 5.4 and 5.6: Checks recomputed; 5.6's pinned names were checked in the contract.
- 5.5 and 5.7: R07. Demailly VI (3.9) (line 14386, `(−1)^(mp+1)` on `(p+1)`-forms) agrees with the README and the pin.
- 5.9: VI (4.2) at line 14675, p. 296.
- 6.2: VI (8.5) 15442, (8.6) 15452, (8.12) 15523, (8.17) 15557, pp. 311–313; III (1.25) 6820, (2.6)–(2.7) 6997–7027, II (4.31) 4929, p. 100; Ballmann 4.23 (line 2090) and 5.31 (line 2742: injective for `s ≤ m−r`).
- 7.1: pinned names above.

**Adversarial table** (values computed this round).

| statement | instance | left | right | result |
|---|---|---|---|---|
| `newlander_nirenberg` | `E = 0`; 1.3's `J` on `ℝ⁴`; `ofComplexManifold` | `E = 0`: every chart | `N(∂_x,∂_u) = [∂_y, ∂_v + y∂_x] = ∂_x ≠ 0`; holomorphic charts | holds |
| 1.3 tensoriality | `Y ↦ fY` | wrong sign adds `2((JX)f·JY − (Xf)Y)` | pinned adds `0` | holds |
| 1.3 types | `X, Y ∈ T^(0,1)` | `¼(2N − 2iJN)` | `= N^(1,0)` | holds |
| `dolbeault_grothendieck_polydisc` | `n=1`, `z̄ dz̄`; `n=0`; `r ≤ 0` | `ψ = z̄²/2` | `|z|²` gives `z dz̄`; `ψ = 0`; empty | holds |
| `polydisc` | `(0.9,0.9)`, `(1,0)` | in, out | ball: out; closed: in | discriminates |
| 2.1 disc | `1/(1−z)`, `r=½`, `ρ=¾` | `2^(−N)` | `8(2/3)^N` | holds |
| 2.1 annulus | `1/(z−⅛)`, `N=1`, `z=½` | `2/3` | `4/31` | fails (R06) |
| `hartogs_extension` | `K={0}⊂ℂ²`; `n=1`; shell | extends | `1/z`; `1`/`0` | hypotheses needed |
| `weierstrass_preparation(_unique)` | `w²−z`; `e^z w`; `d=0` | `u=1`, `a₀=−z`; `u=e^z` | `P=1`, `u=f` | holds |
| `isRegularLocalRing_holomorphicStalk` | `E=0`; `E=ℂ` | `ℂ`, dim 0 | `(0)⊂(z)`, dim 1 | holds |
| `uniqueFactorizationMonoid_holomorphicStalk` | node `w²−z²−z³` | two germ branches | irreducible polynomial | holds |
| `rueckert_nullstellensatz` | `z²`,`g=z`; `k=0`; `f=1` | `m=2` | `m=1`; `m=0` | holds |
| `oka_coherence` | `(z₁,z₂)`; `(z,z²)`; `k=0` | `(z₂,−z₁)` | `(z,−1)`; `N=0` | holds |
| `cartan_coherence` | `z²`; `k=0`; `f=1` | `g=z`: `(z)`, unit at `y≠0` | `z ∉ (z²)`; `N=0`; `g=1` | holds |
| singular locus (R01) | `{z₁z₂=0}`; `V(z²)`; `U` | `{0}` | `∅`; `∅` | true, elaborates |
| genus (R01) | elliptic; `ℂP¹`; two elliptic | `2=2·1` | `0=0`; `4=2·2` | true, elaborates |
| torus (R01) | `n=1`; `p=2`; `E=0` | `1,1,1,1` | `0`; `h^(0,0)=1` | true, elaborates |
| `hodge_theorem_deRham` | `T²`, deg 1; `m=3,k=0` | `dx`, `dy`: `2=b₁` | `(−1)^(3·2+1) = −1` = Demailly `(−1)^(mp+1)`, `p=0` | holds |
| `finiteDimensional_dolbeaultCohomology` | Hopf | `h^(0,1)=1` | no Kähler needed | holds |
| `finrank_dolbeaultCohomology_serre` | Hopf; `E=0` | `(0,1)↔(2,1)`: `1=1` | `c=c`; ℕ subtraction guarded | holds |
| Hodge decomposition | elliptic `k=1`; `ℂP¹` `k=2`; `k>2n` | `2=1+1` | `1=0+1+0`; `0` | holds |
| `finrank_dolbeaultCohomology_symm` / odd Betti | elliptic; Hopf; Iwasawa | `1=1`, `b₁=2` | Hopf `0≠1`, `b₁=1`; Iwasawa `5≠4`: excluded | holds |
| `hard_lefschetz` | `k=n`; curve `k=0`; `n=0` | `L⁰=id` | `[f]↦[fω]`, `∫ω>0` | holds |
| `IsKahlerForm` | `dx∧dy`; `−dx∧dy`; `κ_ε` | `κ(1,i)=1` | `−1`; `|v|²+ε(bc−ad)` but `κ(∂x₁,∂x₂)=ε≠0` | discriminates |
| `lefschetzPow` | `ℂ²`, `j=2`, `α=1` | `2 dx₁dy₁dx₂dy₂` | `/j!` gives vol | holds |
| `DolbeaultCohomology` | `H^(1,0)` of a compact curve | cocycle image finite | ambient quotient infinite | holds |
| 2.4 cross | `Δ(1,ε)∪Δ(ε,1)` | `a_kk = ε^(−2k)` | `O((ε(1−δ)²)^(−k))`, `(1−δ)²>ε` | holds |
| 3.4 chain | `n=1` | `(0)⊂(z)` | length 1 = dim | holds |
| 4.2 | `h=e^(−φ)`; `O(1)`, `(1+|z|²)⁻¹` | `A=−∂φ`, `Θ=∂∂̄φ` | `∂∂̄log(1+|z|²) = −2πi ω_FS` | holds |
| 4.3 | `d+λdz/z`, `λ=½`; `d+z₂dz₁` | `e^(−2πiλ) = −1` | inverse agrees iff `2λ∈ℤ`; `dz₂∧dz₁ ≠ 0` | holds (notation R06) |
| 4.4 | two points, ranks 1, 2 | `ℂ⊔ℂ²` | morphism `ℂ→ℂ²`, `ℂ²→ℂ` | holds |
| 5.2 | `∂+3`; `x∂`; `Δ_∂̄` on `ℂ` | `D(x²)(2)=16`, `σ_F(2)=2i`, `σ_geom=2` | `P*` zeroth term `−1`; `−½Δ_eucl`, `c=½` | holds |
| 5.3 | `δ`, `m=2`; `δ′`; `1/(1+2x)` | `x₊`; `u₁=1` | `2^n`; `(−2)^n` | holds |
| 5.4 | `sin(jx)/j` | `C⁰ → 0` | `C²` unbounded | holds |
| 5.5 | `log log(1/|x|)` on `ℝ²` | `∫|∇u|² = 2π/log 2` | unbounded: margin strict | holds |
| 5.6 | `Log_±`; `dz/z − dz̄/z̄` | `0` upper, `2πi` lower | `Per = 0−(−2πi) = 2πi`; `4πi` | holds |
| 5.7 Peetre | `s=−1`, `η=−ζ` | `1 ≤ √2` | wrong form `√2/(1+|ζ|²) < 1` | holds |
| 5.8 | two circles, ranks 1, 2 | `dim ker = 3` | one per component: `2` | holds |
| 5.9 | `dz`; `ω²` on `ℂ²` | `|dz|²=2`, `dz♯=∂x−i∂y=2∂_z` | `ω²/2! = dvol` | holds |
| 6.1 | `[Λ,∂]+[Λ,∂̄]`; `[Λ,L]` on `ℂ` | `i∂̄*−i∂* = −(d^c)*` | `1` on functions, `−1` on 2-forms | holds |
| 6.1 `[iΘ,Λ]` | `iΘ=aω` on a curve | `(1,1)`: `a` | functions: `−a` | holds |
| 6.2 Hodge–Riemann | `f dz`; `f dz̄`; `ω₁−ω₂` | `i(−2i)|f|² = 2|f|²` | `(−i)(2i)=2`; `(−1)(−2)=2` | holds |
| 7.1 | `OnePoint.equivProjectivization`; `z↦1/z` | `∞↦[1:0]` ∈ `U₀`, coordinate `0` | `|−1/z²|² > 0` | holds |
| 7.2 | `ω_FS` on `ℂP¹`; `h⁰(O(2))` | `(1/π)·2π·½ = 1` | `C(3,1)=3` | holds |
| 7.3 Hopf | dilation weights | `2^(a+b+1) ≥ 2` | `2^(1−m−n) ≤ ½`; Betti `1,1,0,1,1` | holds |
| 8.1 | Iwasawa | `h^(1,0)+h^(0,1) = 5` | `b₁ = 4` | holds |

## Not verifiable

- 1.4's Newlander–Nirenberg route (webster-nn), 5.3's Theorems 2.3.4–2.3.5 (hormander-alpdo1, a sampled target), and 2.4, 5.7 and 5.10 (wells-dacm) cite sources the manifest records as uncertified. They are cited by locator, and their text was not read.
- Ownership against open pull requests was checked object by object only for the objects named under "Ownership" above, not for every target.

## Source issues

- none
