<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/979#issuecomment-6376302578 -->
Red team round 2 pass b (claude) of 5436aa1

Verdict: changes needed

1. **F01** (P2) gap:order-finite-generation asks for what §5.3 and an earlier supplier already give

   - **Location.** `packages/BorelRegulators/README.md:79`: "Supply finite generation or a finite-index integral comparison for higher K-groups of all number-field orders. … The integral image being a lattice also needs finite generation, not only a rational dimension." The same needs is in design/plan.json. It is used at :13, :674, :676 and :690.
   - **Claim.** §5.5's order statement (an integral image that is a full lattice commensurable with Λₙ) needs a new supplier theorem.
   - **Witness.** R⊂O_F, so K(R)→K(F) factors through K(O_F) (functoriality, GeneralAlgebraicKTheory §3.2). By the §2.2 interface, the image of K(R) lies in r_Bo(K(O_F))=Λₙ, a lattice (§5.3). ArithmeticKTheory §3.4 `borel_rank_order` gives full rank, hence finite index.
   - **Repair.**
     - Delete the gap:order-finite-generation paragraph at :79, and its entry in the design/plan.json `gaps`.
     - At :13, delete "The order-finite-generation contract belongs to an extension of the base ArithmeticKTheory §§3.2–3.4 to all full ℤ-orders."
     - At :674, replace "its integral image is a full lattice commensurable with Λₙ and its covolume has positive rational ratio to R_Bo" by "its integral image is a sublattice of finite index in Λₙ, and its covolume is that index times R_Bo".
     - In the same paragraph, replace "§3.4 and gap:order-finite-generation" by "and §3.4 `borel_rank_order` for every order".
     - At :676, replace "For orders, finite generation gives full-rank free quotients; the two rationally invertible inclusion maps identify their images as commensurable lattices. Lattice index gives the covolume ratio." by "For an order R⊂O_F the map K(R)→K(F) factors through K(O_F), so the image of K_(2n−1)(R) is a subgroup of Λₙ. Its rational span is everything by `borel_rank_order`, so it has finite index, and the covolume ratio is that index."
     - In the Needs at :690, replace "gap:order-finite-generation" by "GeneralAlgebraicKTheory §3.2".
   - **Tested.** F=ℚ(i), R=ℤ[2i], n=2. Here d₂=1 and Λ₂=tℤ with t≠0. K₃(ℤ[2i]) maps into K₃(ℤ[i]), so its image lies in tℤ. The image is nonzero, because the rank is 1 and r_Bo,ℚ is injective. So the image is mtℤ with m≥1, and its covolume is m·R_Bo. The :688 Check (indices 2 and 3, ratio 3/2) is unchanged.

2. **F02** (P2) design/plan.json declares gap:borel-period-contract with this roadmap as its own supplier

   - **Location.** In design/plan.json `gaps`, the entry `borel-period-contract` has "supplier": "BorelRegulators" and the needs "Supply Polylogarithms with the real regulator isomorphism … and Tamagawa input". `README.md:785`: "Its gap:borel-period-contract is supplied by §2.3".
   - **Claim.** This is a supplier gap of this roadmap.
   - **Witness.** No target here needs the slug, and the README has no contract for it. It asks this roadmap for its own §§2.3, 3.4, 5.1 and 5.3–5.4, which the README already provides. It is Polylogarithms' gap (its README:99).
   - **Repair.**
     - Delete the `borel-period-contract` entry from the design/plan.json `gaps`.
     - At :785, replace "Its gap:borel-period-contract is supplied by" by "The contract Polylogarithms declares against this roadmap, its borel-period-contract gap, is met by".
   - **Tested.** After the edit, the README contains no `gap:borel-period-contract` token, so the gap-reference check needs no plan entry for it. Each of the 10 remaining `gaps` entries (11 less S01's) names a supplier other than this roadmap.

3. **F03** (P2) four gap needs sentences name no object or hypothesis

   - **Location.** The needs sentences at `README.md:95`, :131, :155 and :157 (the same in design/plan.json). For example, :95 reads "Supply positive rational local gauge masses for all compact opens, including ramified finite places." and :157 reads "Supply normalized infinitesimal classifying-space CE/Weil comparisons with the Deligne cone projection."
   - **Claim.** Each needs sentence says exactly what is missing, with its hypotheses.
   - **Witness.** None names its group, algebra class, field, degree, source or target; :157 names no group or Lie algebra. The hypotheses are only in the detail sentences that follow, as in round-1 b/F02. The intake announces the needs alone.
   - **Repair.** Replace the needs, in the README and in plan.json, as follows.
     - adelic-rational-masses: "Supply, for every nonarchimedean local field K of characteristic zero, every smooth affine K-group H, every nonzero invariant top form ω on H defined over K and every compact open subgroup U⊂H(K), that |ω|(U), for the Haar measure giving O_K mass 1, is a positive rational number."
     - graded-indecomposable-api: "Supply, for every field k and every connected ℕ-graded graded-commutative k-algebra A, the graded quotient Q(A)=A₊/(A₊·A₊) with its homogeneous components, universal property, functoriality for graded algebra maps, compatibility with extension of k, and Q(Λ(V))≅V for V concentrated in odd degrees."
     - universal-deligne: "Supply, for every number field F and n≥1, the real Beilinson regulator K_(2n−1)(F)→H¹_D(Spec F×_ℚℝ,ℝ(n)) on actual Quillen K-theory, defined from the Chern character class chₙ∈H^(2n)_D(B·GL(ℂ),ℝ(n)) independently of Borel's class, with the Deligne cohomology of finite disjoint unions of complex points and its real descent, compatibility with restriction and finite transfer, and r_Be∘ψ^a=a^n·r_Be for every integer a≥1."
     - infinitesimal-classifying-comparison: "Supply, for every N≥1, the comparison of normalized cosimplicial functions and forms on the first infinitesimal nerve of B·GL_N(ℂ) with the Chevalley–Eilenberg complex of gl_N(ℂ) and with the Weil algebra, compatible with evaluation into continuous cohomology of GL_N(ℂ) and with the Deligne cone projection π_(n−1), with coefficients normalized independently of the comparison Bo=2Be."
   - **Tested.**
     - adelic-rational-masses: K=ℚ₂, H=SL₂, ω=2ω_std. U=SL₂(ℤ₂) gives (1/2)(3/4)=3/8 (as at :415), and an index-3 subgroup gives 1/8. Both are positive rationals.
     - graded-indecomposable-api: for Λ(x₃,x₅), Q⁸=0; for k[u₂], Q⁴=0 (:465, :468).
     - universal-deligne: for F=ℚ, n=3, ψ² acts by 8 (:768).
     - infinitesimal-classifying-comparison: in degree 0 the constant 1 maps to 1.

4. **F04** (P2) the README supplies roadmaps that precede it, and the round-1 Tamagawa repair makes this permanent

   - **Location.**
     - :7 "Section 3.1 supplies the period–index input of HeightsRationalPointsAndObstructions §3.6."
     - :9 "The complex regulator and lattice theorem of ColemanIntegration §L3.Fc.1 belong to §§2.2–2.3 and 5.3 here".
     - :155 "Its point case supplies ColemanIntegration §L3.Fc.1’s reg_∞ through §§6.1–6.2 here."
     - The consumer bullets at :787–788.
   - **Claim.** ColemanIntegration and HeightsRationalPointsAndObstructions are downstream consumers of this roadmap.
   - **Witness.** merge-order/ORDER.txt: ColemanIntegration 155, HeightsRationalPointsAndObstructions 157, §6.2's roadmap 166, BorelRegulators 224 (167 on board main). ColemanIntegration README:2650 proves Borel's lattice theorem itself; its :3335 lists BorelRegulators as its consumer. HeightsRationalPointsAndObstructions README:1468 cites Poonen directly.
   - **Re-raised: MERGE-ORDER** (FIX-PKG-BorelRegulators~2). That reason was that placement needed maintainer action. The placement is now fixed: the round-1 repair made §6.2 at line 166 a direct supplier, and the order mover put this roadmap after it. The repair below edits only this README and the plan's gap detail. The overlap itself, two roadmaps planning Borel's lattice theorem, stays with the maintainer.
   - **Repair.**
     - At :7, delete "Section 3.1 supplies the period–index input of HeightsRationalPointsAndObstructions §3.6."
     - At :9, replace the first three sentences by: "ColemanIntegration §L3.Fc.1, earlier in the merge order, constructs the complex Beilinson regulator of a finite Galois number field and proves that its integral image is a full lattice with injective rational regulator; nothing here is an input to it. Sections 2.2–2.3 and 5.3 construct the Chern-normalized Borel regulator of every number field through the independent arithmetic comparison, and §6.2 compares it with the universal Beilinson regulator."
     - At :155, and in the universal-deligne `detail` in design/plan.json, delete "Its point case supplies ColemanIntegration §L3.Fc.1’s reg_∞ through §§6.1–6.2 here."
     - Delete the ColemanIntegration and HeightsRationalPointsAndObstructions bullets at :787–788.
   - **Tested.** After the edit, no README sentence makes a roadmap above this one in ORDER.txt (lines 155 and 157) a consumer. The depcheck is unaffected, because consumer prose adds no edges. The Check at :644 still compares with ColemanIntegration's Beilinson image, (t/2)ℤ against tℤ, ratio 2. That cites an earlier roadmap, which is permitted.
   - **Other order.** PeriodsAndSpecialValues (ORDER.txt:200) also precedes line 224 in this checkout's order, but it follows at 201 on board main, so its bullet at :786 holds after the move.

Four new P2 findings, S01–S04. Three are in the declared gap contracts: one gap is not needed, one gap names this roadmap as its own supplier, and four needs sentences omit their objects and hypotheses. The fourth finding is about supply claims to roadmaps that come earlier in the merge order. None of the three Lean statements is false, and no Check is false. All round-1 findings are repaired at this head, except the external half of round-1 b/F07, which stays settled.

## Round-1 findings at 5436aa1

- **a/F01 (P2), the Tamagawa gap duplicated an earlier supplier: repaired.** `packages/BorelRegulators/README.md:99` reads: "§6.2 supplies τ(S)=1 for every simply connected semisimple group over a number field, including inner forms, with the Tamagawa normalization of AdelicAlgebraicGroups §2.4." The witness is `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:1959` (head 40d60b6), which states τ(S)=1 for every simply connected semisimple k-group, inner forms included.
  - The design/plan.json `gaps` no longer contains `classical-tamagawa-proof`. Lines :7, :381, :383, :396, :447 and :785 cite §6.2.
  - The repair has a side effect: the direct citation pins this roadmap below line 166 of the merge order, permanently below ColemanIntegration (155) and HeightsRationalPointsAndObstructions (157). This is S04.
- **b/F01 (P2), the calibration asked the rational chₙ for a Tate value: repaired.** `README.md:129` now reads "Supply s(chₙ)(Hur εₙ)=1 for n≥2, for the rational character chₙ … equivalently s(chₙᵗʷ)(Hur εₙ)=(2πi)^n for chₙᵗʷ=(2πi)^n·chₙ". Conventions :25 define chₙᵗʷ. The twisted character is used at :242, :250, :254–256, :507, :608, :610 and :736.
  - The witness is CharacteristicClasses C6 item 2 (head d077cb4, its README:1463): the rational Newton polynomial normalized by j!. C6 item 3 (README:1506) gives ch(u)=−v. So (−1)^n·ch(u^n)=v^n, with coordinate 1.
- **b/F02 (P2), the stable-finite-range needs sentence was vague: repaired.** `README.md:77`: "for every number field F of degree N, a≥2, G=Res_(F/ℚ)SL_a … bijective whenever a−1>4Nq". It is quantified and conservative: N≥1 puts it inside the range q<(a−1)/4 of borel1977 line 459–461. The new Checks at :297–299 compute correctly (21>20, 20=20, 25>24, 24=24, 1>0).
- **b/F03 (P2), the cyclic-local-degrees needs sentence was impossible as written: repaired.** `README.md:115`: "a cyclic extension L/F of degree a with [L_w:F_v]=a for every v∈S and w|v, and every place of R complex in L; the local extensions may vary". The new Checks at :330–332 were recomputed:
  - (ℤ/32)ˣ = ⟨−1⟩×⟨5⟩.
  - The quotient by {±1} is ⟨5⟩, cyclic of order 8. Since 31≡−1, the prime 31 splits completely, with local degree 1.
  - 15 = −5⁴ has order 2. The quotient by {1,15} is cyclic, generated by 3 = −5³, and −1 ∉ {1,15}, so the field is imaginary.
  - 2 is totally ramified in both fields.
- **b/F04 (P3), §5.2 needed n≥2: repaired.** `README.md:608`: "For n≥2, transport the free compact-dual homotopy lattice". The new Check at :620 is correct: from SO→SU→SU/SO, π₁(SU)=0 and π₀(SO)=0 give π₁(SU/SO)=0.
- **b/F05 (P3), Needs lines lacked pinned inputs: repaired.** `README.md:604` lists `NumberField.IsTotallyReal`, `NumberField.nrComplexPlaces_eq_zero_iff`, `NumberField.discr`, `NumberField.discr_ne_zero` and `NumberField.dedekindZeta`. :377 and :44 cite `NumberField.prod_abs_eq_one`. All are at the cited file:line of the Mathlib pin 6b7abb3 (ProductFormula.lean:98, TotallyRealComplex.lean:47/52, Discriminant/Defs.lean:36/41, DedekindZeta.lean:49).
- **b/F06 (P3), the general invariant realization was cited to Borel's single family: repaired.** `README.md:338`: "(poonen2017, Theorem 1.5.36(i) and (iv), p.26, poonen2017 line 1402–1446, with §3.1.)". Parts (i) and (iv) are at poonen2017 line 1402–1409 and line 1428, on printed p.26.
- **b/F07 (P3), Polylogarithms cited sections that do not exist here: partly repaired.**
  - This README's half is done: :785 maps the contract to §2.3, §§5.3–5.4, §5.1 with `exists_pos_rat_dedekindZeta_of_isTotallyReal`, and §3.4. All of §§2.1–2.3, 3.4, 5.1–5.4 and 6.2 exist here (README :240, :260, :280, :379, :585, :606, :628, :650, :734).
  - Polylogarithms at 4696a1a (unchanged in the 22:30Z index) still cites "Layers 3–5" (its README:14, :99, :105, :186, :293, :642) and "§7.1" (:99, :111, :704).
  - This half is settled: the repair report's reason (it needs an edit to another open pull request) holds.
  - The gate repair made for F07 added a self-supplied plan gap. This is S02.

## Verified sound

**Counts.**

- Declarations read: 3 of 3.
- Targets read: 26 of 26, in 6 layers, every line.
- Check bullets: 117 in 28 blocks, all read. Every numeric value was recomputed; none is false or vacuous. Each definition (§§1.1, 1.2, 1.3, 2.1, 2.2, 3.3, 3.5, 4.1, 4.2, 5.2, 5.3, 6.1) has at least 3 discriminating Checks.
- Source locators verified: 38.
  - borel1977: 13 (§§1.3–1.4, 1.6, Lemma 2.2, §2.3/Proposition 2.4, §§3.3–3.5, Proposition 4.3, §§5.2–5.5, §6.1/Theorem 6.2, Remark 6.3, §6.4). Printed page = PDF page + 612.
  - burgos2002: 17 (Remark 4.25, Corollary 9.8, Definition 9.10, Theorem 9.12, Lemma 9.18, Definition 9.19, Remark 9.20, Propositions 9.21–9.22, Corollary 9.23, Definition 9.24, Examples 10.4–10.5, Remark 10.6, Definitions 10.7–10.8, Theorem 10.9). Printed page = PDF page − 6.
  - poonen2017: 3 (Theorem 1.5.36(i), (iii), (iv)).
  - deligne_goncharov2005: 2 (§1.6 from line 282, p.7; the Adams consequence at line 438–440, p.9).
  - borel1974: 3 (Theorem 7.5 p.259, §11.4 p.267, Proposition 12.2 p.271).
- Pinned-declaration locators verified: 41, by reading the files at the manifest pins. Mathlib 6b7abb3: all 25 file:line pairs in "From Mathlib". Tau Ceti a91d3aa: all 16 file:line pairs, including Division.lean:69, Comparison.lean:267, DedekindZeta.lean:158 and Tate/Basic.lean:91, with their namespaces.
- Sibling citations checked: 64 in total, every one at the head named in the 22:30Z index.
  - 54 supplier sections:
    - EndoscopicTransferAndUnitaryTraceComparison §6.2.
    - AdelicAlgebraicGroups §§1.2, 1.4, 2.2–2.5, 3.4, 4.2.
    - ArithmeticGaloisDuality §§R02.4.5b–R02.4.6.
    - CharacteristicClasses C5a.2–C5a.5 and C6 items 2–3.
    - TopologicalKTheory T4 (u=β=[O(−1)]−1; the coordinate map (x,y)↦x+iy) and T7 item 1 (c(a)=2u², c(b)=u⁴).
    - LFunctions Layer 3.
    - GeneralAlgebraicKTheory §§2.5, 3.2, 3.12, 7.7, 7.8.
    - StableHomotopyKTheory §§2.3–2.5, 3.37, 4.14.
    - SchemeKTheoryOperations §6.8.
    - IntegralIwasawaTheory §6.0.
    - ArithmeticLocallySymmetricSpaces ALS.F.5, ALS.0.4–0.9, ALS.5b.1.
    - AutomorphicFormsOnReductiveGroups §§1.1–1.3.
    - ArithmeticKTheory §3.2, §3.3 (odd-degree surjectivity), §3.4 (`borel_rank_order` for every order).
    - SemisimpleAlgebras Layer 6; ClassFieldTheory Layers 5 and 10; DifferentialGeometry Layers 5, 6, 8; AlgebraicTopology Stage 5 item 5.
    - MotivicEtaleKTheory: board target, Final targets 5–6.
  - 10 consumer references: Polylogarithms §§2.3, 3.7, 3.8, 4.4, 4.7 and its README:99; HabiroNahmSeries §1.5; ColemanIntegration L3.Fc.1 and its :3335; HeightsRationalPointsAndObstructions §3.6.

**Merge order.**

- Every cited supplier precedes this roadmap on board main, where it sits at 167, right after EndoscopicTransferAndUnitaryTraceComparison at 166. The positions are StableHomotopyKTheory 4, GeneralAlgebraicKTheory 5, IntegralIwasawaTheory 32, AdelicAlgebraicGroups 38, SchemeKTheoryOperations 41, ArithmeticGaloisDuality 53, ArithmeticLocallySymmetricSpaces 79, AutomorphicFormsOnReductiveGroups 80, ArithmeticKTheory 113 and EndoscopicTransferAndUnitaryTraceComparison 166.
- ClassFieldTheory, SemisimpleAlgebras, DifferentialGeometry and AlgebraicTopology are on main.
- CharacteristicClasses (#896), TopologicalKTheory (#894) and LFunctions (#248) are new-folder pull requests by other authors, which the rules allow as suppliers.
- MotivicEtaleKTheory is used only through declared gaps. Its board target places it after MotivesAndAlgebraicCycles (87).
- The consumers that follow on board main are Polylogarithms 225, HabiroNahmSeries 227 and PeriodsAndSpecialValues 201.
- The checkout's ORDER.txt still lists this roadmap at 224 (the pre-move order).

**Dependency check (exact output).** Against the checkout's merge-order/ORDER.txt, as the brief requires:

```text
depcheck: 28 roadmaps, 245 edges, 0 problem(s)
```

Against board main's ORDER.txt (BorelRegulators at 167), on a scratch copy:

```text
depcheck: 28 roadmaps, 245 edges, 0 problem(s)
```

Neither run printed an UPWARD, CYCLE or moved line. The citation resolver, at its 22:30Z index, found no cross-roadmap citation or roadmap Lean name that resolves nowhere.

**Elaboration.** I copied `Suggested.lean` to scratch, appended `#check @name` for its three declarations, and elaborated it once with the toolchain's `lean` (v4.35.0-rc3) against the built manifest-pinned packages, the equivalent of `lake env lean`. The Suggested.lean content gave exactly the three expected `sorry` warnings, at lines 46, 55 and 72. The elaborated types are:

- `period_eq_index : ∀ (F : Type u_1) [Field F] [NumberField F] (A : CSA F), orderOf (TauCeti.BrauerGroup.mk A) = TauCeti.Algebra.index F ↑A.toAlgCat`
- `exists_divisionAlgebra_split_at_infinity : … 1 ≤ a → ∃ D x x_1, ∃ (_ : Algebra.IsCentral F D) (_ : FiniteDimensional F D), Module.finrank F D = a ^ 2 ∧ (∀ σ : F →+* ℝ, IsSplittingField F D ℝ) ∧ ∀ σ : F →+* ℂ, IsSplittingField F D ℂ` (the per-σ algebra instance is inside the binder)
- `exists_pos_rat_dedekindZeta_of_isTotallyReal : … [IsTotallyReal F] (n : ℕ), 2 ≤ n → Even n → ∃ q, 0 < q ∧ ↑√|↑(discr F)| * dedekindZeta F ↑n = ↑q * ↑π ^ (n * finrank ℚ F)`

Each type agrees with README §3.1, §3.2 and §5.1. There is no def or instance, so no section binder can be lost; nothing changed.

The pinned `TauCeti.Algebra.IsSplittingField` is `∃ n, Nonempty (L ⊗[K] A ≃ₐ[L] Matrix (Fin n) (Fin n) L)`, and `NumberField.dedekindZeta` is the ideal-count `LSeries`, as the README says.

Three appended checks for README-cited Tau Ceti names in modules that Suggested.lean does not import failed as unknown, because those modules are not built in the cache. Their declarations and namespaces were confirmed in the pinned source instead.

**Policy.** The `git diff --stat origin/main...HEAD` changes only `packages/BorelRegulators/`. Suggested.lean has a single `import Mathlib` and two existing TauCeti modules, no `set_option` and no `lemma`. "Lemma" appears in the README only in source citations. There is no pull-request number or process narrative in the README or the docstrings, and no computational algorithm.

**Gaps.**

- All 12 plan slugs match the README verbatim, except borel-period-contract (S02). None has supplier none.
- stable-finite-range, integral-chern-calibration, cyclic-local-degrees, inner-type-a-structure, splitting-degree-index and multiplicative-serre-comparison are precise and minimal.
  - The AdelicAlgebraicGroups §4.2 quaternion note covers simple connectedness for degree 2 only.
  - The Tau Ceti pin has `index_dvd_deg` but no divisibility of every splitting degree.
  - ArithmeticGaloisDuality R02.4.6 states the character-prescription theorem, not the variable-local-degree corollary.

**Ownership.**

- I searched by object on main, Completed, the 27 sibling checkouts, `roadmaps grep` (Lean and README) and the board packages. The objects were: period equals index, division algebras with prescribed invariants, the even-weight totally real zeta value, the regulator lattice, and τ(SL₁(D)).
- No other Suggested.lean declares these fully qualified names. Polylogarithms' `zagierExistence_totallyRealEven` is a later consumer.
- ColemanIntegration L3.Fc.1 overlaps (S04).
- IntegralIwasawaTheory §6.0 owns Siegel–Klingen rationality at 1−r, not the π-normalized even-weight form stated in Lean. I did not raise `exists_pos_rat_dedekindZeta_of_isTotallyReal` as padding: it is equivalent to Siegel's theorem through the functional equation, and it is not a one-tactic or one-lemma consequence.

**Instance table** (values on each side):

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `period_eq_index` | ℚ, A=ℚ; (−1,3); invariants ±1/3; ±1/8 at two primes | orderOf 1, 2, 3, 8; index 1, 2, 3, 8; Hilbert symbols of (−1,3) at 2, 3, ∞ = −1, −1, +1 | true |
| `exists_divisionAlgebra_split_at_infinity` | a=1 (D=ℚ); a=2 with (−1,3); wrong model (−1,−1); a=0 | finrank 1=1², 4=2²; ℝ⊗(−1,3)≅M₂(ℝ) since 3>0; ℝ⊗(−1,−1)=ℍ is not a matrix algebra; a=0 is excluded by ha | true; wrong model excluded |
| `exists_pos_rat_dedekindZeta_of_isTotallyReal` | ℚ, n=2, 4; ℚ(√5), n=2; ℚ(√2), n=2; controls n=3 over ℚ and ℚ(i) | q = 1/6, 1/90, 2/75 (√5·(π²/6)(4π²/(25√5))), 1/24 (√8·(π²/6)·π²/(8√2)); controls excluded by Even n and by IsTotallyReal | true |
| §1.1 | ℚ, ℚ(i), real quadratic, n=2, 3 | dimensions (0,1), (1,1), (0,2); conj sign (−1)^(n−1): pairs (t,−t), (t,t); norms 2π and 4π² vs coordinate 1 | true |
| §1.2 | ℚ(i)/ℚ, n=2, 3 | T(t,−t)=0; T(R t)=2t=[E:F]t | true |
| §1.3 | functional-equation pole count; ℚ, n=2, 3, 4; ℚ(i), n=2 | number of poles = r₂ + r₁·[n odd] = dₙ; π-exponent r₁(1−n)+r₂(1−2n) = dₙ−Nn; ratios −1/2, −1/4, 3/4; ℚ(i): (−G/(6π))/(G/(3π)) = −1/2 | true |
| §2.1 calibration | n=2, 3 | (−v)²=v² and −(−v)³=v³, coordinate 1; twisted −4π², −8π³i; s(c₃)=2s(ch₃) gives −16π³i | true |
| §2.3 / stable-finite-range | ℚ q=5; ℚ(i) q=3; q=0 | a=22: 21>20; a=21: 20=20; a=26: 25>24; a=2: 1>0; Borel range q<(a−1)/4 | true |
| §3.1 / cyclic-local-degrees | ℚ(ζ₃₂)⁺; fixed field of {1,15} | Galois groups ⟨5⟩, ⟨3⟩, both order 8; Frobenius at 31 is trivial in the first; local degree at 2 is 8 | true |
| §3.3–3.4 | ℚ(i), h=3; ω↦2ω; norm-one torus | 4^(−3/2)·2³=1; 2·½=1; torus dimension 1 with character rank 1 vs SL₁(D) dimension 3 with rank 0 | true |
| §3.5 | SL₂(𝔽₂), SL₃(𝔽₂); ω=2ω_std at 2 | 6/8=3/4; 168/256=21/32; 3/8, correction 1/2 | true |
| §3.6 | ℚ(√5), a=2; index 3 | 5^(3/2); (3v)(m/3)=vm | true |
| §4.1, §4.2 | Λ(x₃,x₅); k[u₂]; q=1, 2, 3, 5 | dim H⁸=1 but Q⁸=0; Q⁴=0; i·(−1)=−i=i³, i⁵=i | true |
| §4.3–4.6 | ℚ n=2, 3; ℚ(i); (N,j)=(1,1), (1,2), (2,1) | π², π³, 4^(−3/2); Prim H^(2n−1)(K): SO(odd) contributes in degrees 4k−1 only, so (d,N,N−d) = (0,1,1), (1,1,0), (1,2,1); dimensions 3, 8, 6; factors 2, 9, 4 | true |
| §5.1 | E formula | odd n: r₂+(2n−1)(r₁+r₂)−n(r₁+2r₂) = (n−1)r₁; even n: −nr₁; i^E = −1 (ℚ, n=3), 1 (ℚ(√5), n=2) | true |
| §5.2 | π₅, π₉, π₃ | transpose acts by (−1)^(n+1), so g↦ggᵗ acts by 2, 2, 0; π₅(SU)≅π₅(SU/SO); π₉: coker ℤ/2, image 2ℤ; covolumes 4π, 2π | true |
| §5.3–5.5 | ℚ n=2; ℤ+√2ℤ; ℤ[2i]⊂ℤ[i] | empty covolume 1; non-discrete wrong model; order image mtℤ ⊂ tℤ | true; S01 |
| §6.1–6.3 | P₁, P₂ at 1, i; n=0 junk; ψ² | P₁(1)=0, P₁(i)=i; P₂(1)=1, P₂(i)=0; P₀(1)=1≠0; 8, 64, 1 | true |

## Not verifiable

- weil1961 is waived and beilinson1985 uncertified; both are cited by locator only and were not requested.
- The (j+1) versus (j+1)^j wedge-restriction factor at borel1977 line 548–549 is not legible in the extraction, which dropped the formula. I did not re-raise that round-1 source issue.
- PeriodsAndSpecialValues PS.3.2a, at its board head 9f14c68, is not in the local checkout. It was not read; I made no extra API call.
- The sign of the suspension in gap:integral-chern-calibration is fixed by the contract, not by a source line. burgos2002 Remark 4.25 gives the value only up to sign.

## Source issues

- **Misprint** in burgos2002 at Remark 4.25, p.32 (burgos2002 line 1425): the source writes the degree-2p twisted character as (2πi)^p·(p−1)!·b_p plus decomposables; it should be ±(2πi)^p·b_p/(p−1)!, as its own suspension formula on the next line and Theorem 4.24 require; affects nothing.
- **Misprint** in borel1977 at Theorem 5.5 proof, pp.629–630 (borel1977 line 518 and line 531–532): the source gives the dimension of the cycle Z_j and the degree of its top form as j²+2j; for the restriction of scalars from k it should be d(j²+2j), with d=[k:ℚ]; affects nothing.
- **Gap** in borel1977 at Theorem 5.5 proof, p.630 (borel1977 line 525–526): the source embeds D into n×n matrices by its regular representation, which has size (j+1)²; for odd j and odd n no unital algebra embedding exists, and it should be the regular representation padded by an identity block, as a group map; affects the proof.
- **Misprint** in borel1977 at Proposition 2.4 proof, pp.618–619 (borel1977 line 216 and line 223): the source writes H(F) for the rational points of H over the number field k; it should be H(k); affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "5436aa1", "job": "RT-BorelRegulators~2b", "model": "opus", "worker": "fable-rt6"} -->
