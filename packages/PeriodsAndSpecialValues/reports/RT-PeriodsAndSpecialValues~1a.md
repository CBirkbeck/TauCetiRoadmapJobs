<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/169#issuecomment-6319004463 -->
Red team round 1 pass a (codex) of 0555e50

Verdict: needs_changes

1. **F01** (P3) Forbidden option and process references

   Location: `packages/PeriodsAndSpecialValues/Suggested.lean:30`, `set_option autoImplicit false`; `packages/PeriodsAndSpecialValues/README.md:168`, “Consume the open TauCetiRoadmap PR”.

   Claim: The package follows the required signature and timeless roadmap format.

   Witness: The option occurs at Lean line 30; README lines 168, 178, 204 and 212 name pull requests and heads.

   Exact repair text: Delete `set_option autoImplicit false`. Replace each PR/head reference with the supplier roadmap name and the verified section/target at its permitted version.

2. **F02** (P1) Several consumed roadmaps are not permitted suppliers

   Location: `packages/PeriodsAndSpecialValues/README.md:146`, “MotivicEtaleKTheory Layer 12”; also lines 26–41, 104, 150–156, 170–174, 194–200, 206–208 and 218–220.

   Claim: These named roadmaps supply prerequisites of PS.1–PS.9.

   Witness: Neither main's active/completed directories nor `merge-order/ORDER.txt` contain MotivicEtaleKTheory, BorelRegulators, EllipticRegulators, RankZeroOneBSD, ComputationalNumberTheory, K3SurfacesAndSymplecticBoundedness, PotentialAutomorphyDworkMotivesPartII, GanGrossPrasadConjecturesForClassicalGroups, ArithmeticLevelRaisingAndBipartiteEulerSystems, Polylogarithms or NumberFieldArithmetic.

   Exact repair text: “All prerequisites are owned by this roadmap, a roadmap on main, or an earlier roadmap in the merge order.” Replace NumberFieldArithmetic and Polylogarithms with verified current owners and exact targets where available. Move each remaining consumed prerequisite into an earlier target here, including its full general theory; remove the corresponding supplier citation. A target-only board package or an existing design is not a supplied theorem. Do not solve this by citing a later roadmap.

3. **F03** (P1) Supplier extensions are not registered gaps

   Location: `packages/PeriodsAndSpecialValues/README.md:36`, “Some targets use more than their supplier states at present”; lines 114, 120 and 180.

   Claim: The arbitrary-pair comparison, virtual determinant category, modular eigenprojector motives, motivic-cohomology/K-theory comparison and framed relative motives may be consumed as extensions of named suppliers.

   Witness: The package has neither `design/plan.json` nor matching `gap:<slug>` declarations. Lines 114 and 180 explicitly acknowledge that the cited supplier statements do not provide these constructions.

   Exact repair text: Replace each extension assertion by a separately registered supplier gap, with identical slug in the design's top-level `gaps` and the supplier subsection: “What <Supplier> must provide (gap:<slug>): <one precise construction or theorem, with hypotheses>.” Use separate contracts for arbitrary-pair comparison, noncommutative virtual determinants, modular motives, rational motivic cohomology versus Adams K-theory, and framed relative motives. Only earlier suppliers may own these gaps. If registration is unavailable, add the full prerequisite as an earlier target here. Until registration or local ownership, mark the dependency as unowned, not supplied.

4. **F04** (P1) The advertised supply graph has cycles

   Location: `packages/PeriodsAndSpecialValues/README.md:43`, “constructed from MC.2, PS.0 and the determinant functor”; lines 1983–1988.

   Claim: Supplier/consumer direction is single-valued, and splitting this package into layers resolves the dependency.

   Witness: PS consumes MC.2–MC.6 (line 114), while MC consumes PS.2/PS.9 (1988). PS consumes AL.1/AL.5 (128), while AL consumes PS.7 (1983). MotivicEtaleKTheory consumes PS.0 and supplies PS.3–PS.4 (43).

   Exact repair text: “MotivesAndAlgebraicCycles, AutomorphicLFunctionsAndLocalFactors and AnabelianGeometryAndNonabelianChabauty supply this roadmap; none requires a target of this roadmap.” Move any genuinely required shared period, evaluation or path-torsor prerequisite into its earliest owner and import it here. Put comparisons that use both developments in this consumer. Remove the reverse supply claims. Place the fundamental-line prerequisite currently attributed to MotivicEtaleKTheory here unless an eligible earlier owner supplies it without PS input.

5. **F05** (P3) Computational algorithms are roadmap targets

   Location: `packages/PeriodsAndSpecialValues/README.md:1065`, “Certified period quadrature”; lines 1071, 1092 and 1098.

   Claim: Construct rational quadrature enclosures, outward-rounded normalized-value boxes, error budgets and exact-recovery procedures.

   Witness: `legendreEnclosure`, `normalizedValueBox`, `normalizedValueBox_budget` and `normalizedValue_recover` are algorithmic deliverables; the binding scope excludes computational algorithms.

   Exact repair text: Replace PS.7.1–PS.7.3's computational deliverables with mathematical integration, convergence, error-inequality and normalization-covariance theorems. Delete construction of rounded boxes, certified recovery and rounding/error-budget APIs, and their computational supplier dependencies. Retain analytic inequalities as mathematics and exact examples as convention checks; update Summary, ownership and downstream promises accordingly.

6. **F06** (P2) Easy headline statements are omitted

   Location: `packages/PeriodsAndSpecialValues/README.md:1901`, `det_ne_zero_of_two_adic_triangular`; line 1835, `mzv_allTwo`.

   Claim: Suggested.lean includes milestones whenever their carriers exist at the pins.

   Witness: Both headlines use only existing `Matrix`, `padicValRat`, lists, factorials and the kept `multipleZeta`; neither declaration appears in Suggested.lean.

   Exact repair text: Add the following signatures in PS.9 order, with mathematical docstrings:

   ```lean
   theorem mzv_allTwo (m : ℕ) :
       multipleZeta (List.replicate m 2) =
         Real.pi ^ (2 * m) / ((2 * m + 1).factorial : ℝ) := by
     sorry

   theorem det_ne_zero_of_two_adic_triangular {n : ℕ}
       (A : Matrix (Fin n) (Fin n) ℚ)
       (hdiag : ∀ j, A j j ≠ 0)
       (hval : ∀ j, padicValRat 2 (A j j) ≤ 0)
       (hmin : ∀ i j, A i j ≠ 0 →
         padicValRat 2 (A j j) ≤ padicValRat 2 (A i j))
       (hbelow : ∀ i j, j < i →
         A i j = 0 ∨ 1 ≤ padicValRat 2 (A i j)) : A.det ≠ 0 := by
     sorry
   ```

   The first includes the empty index; the second includes the empty matrix and retains the nonzero-diagonal and zero-entry alternatives. First state the valuation criterion for an arbitrary prime `p` with `[Fact p.Prime]`, replacing `padicValRat 2` by `padicValRat p`, under the name `det_ne_zero_of_padic_triangular`; derive the displayed two-adic specialization. Brown Lemma 7.1 is already general in p (B line 885), so PS.9.21 must retain that general statement rather than own only its application at 2.

7. **F07** (P2) The integral Bloch–Kato exponential has the wrong domain

   Location: `packages/PeriodsAndSpecialValues/README.md:905`, “Use the Bloch–Kato exponential D_p/D_p⁰ → A_T(ℚ_p), a local isomorphism”.

   Claim: The exponential into integral local points is defined on the whole rational tangent space.

   Witness: BK line 1252 restricts (5.7) to a neighborhood of zero. The rational exponential lands in H¹_f(ℚ_p,V_p); a nonzero linear isomorphism ℚ_p→ℚ_p cannot have image inside a compact integral lattice.

   Exact repair text: “Choose an open neighborhood U of zero in D_p/D_p⁰ on which the rational Bloch–Kato exponential lifts to the integral local points. This local isomorphism U → A_T(ℚ_p) determines the Haar measure; prove independence of U by restriction. The rational exponential on the whole tangent space has target H¹_f(ℚ_p,V_p).” State these domains in the API and supplier contract.

8. **F08** (P2) Finite local cohomology is confused with full local cohomology

   Location: `packages/PeriodsAndSpecialValues/README.md:727`, “the local complex is quasi-isomorphic to [V^{I_v} --(1 − Fr_v)--> V^{I_v}]”.

   Claim: The unqualified local complex has this two-term presentation.

   Witness: BF lines 895–915 identify RΓ_f, not RΓ. For v=ℓ≠p and V=ℚ_p(1), the displayed finite complex is acyclic, whereas H¹(ℚ_ℓ,ℚ_p(1)) and H²(ℚ_ℓ,ℚ_p(1)) are nonzero.

   Exact repair text: “For v∤p, the finite local complex RΓ_f(F_v,V), not the full RΓ(F_v,V), is quasi-isomorphic to [V^{I_v} → V^{I_v}] in degrees 0,1, with differential 1−Fr_v. Retain the finite/singular triangle RΓ_f→RΓ→RΓ_/f.” Make `localEulerFactor_det` refer to RΓ_f and add the Tate-twist counterexample as a Check.

9. **F09** (P2) The general Bloch–Kato measure is narrowed to the convergent case

   Location: `packages/PeriodsAndSpecialValues/README.md:905` and line 974, “weight ≤ −3”.

   Claim: The roadmap builds the Bloch–Kato points and measure, but defines the Tamagawa measure and predicate only in this smaller weight range.

   Witness: BK lines 1236–1242 construct points for weights ≤−1; lines 1277–1284 define the regularized measure for weights ≤−1 under meromorphic continuation, using formula (5.9.1).

   Exact repair text: “Construct local points for weights ≤−1. For weights ≤−3 retain the absolutely convergent product measure. For weights ≤−1 with the continuation required in BK (5.9.1), construct the regularized Tamagawa measure using |lim s^r L_S(V,s)⁻¹|, the measures at S and the probability-normalized factors outside S, and prove independence of S and of the top form.” Register its compatibility with the elliptic adapter as a target; do not replace this general measure by the scalar BSD formula.

10. **F10** (P2) Dwork summability unnecessarily excludes the prime 2

   Location: `packages/PeriodsAndSpecialValues/Suggested.lean:527` and line 532; `packages/PeriodsAndSpecialValues/README.md:1436`, “for every odd prime p”.

   Claim: The two purely analytic convergence theorems are restricted to odd primes.

   Witness: The displayed bound has positive slope (p−1)/p² also at p=2 (slope 1/4); the Artin–Hasse factorization and the logarithmic harmonic loss used in the proof remain valid there.

   Exact repair text: State both summability theorems for every prime p and delete `(hp : p ≠ 2)` from their Lean signatures. Keep odd-prime restrictions on geometric Dwork Frobenius only where its construction needs them. Add p=2 as a boundary Check: v₂(B_n(n−1)!) ≥ n/4−log₂(n)−2, and the extra harmonic loss is at most 2log₂(n).

11. **F11** (P3) The pinned TensorWords file locator is stale

   Location: `packages/PeriodsAndSpecialValues/README.md:86`, `TauCeti/LinearAlgebra/TensorCoalgebra/Coaugmented.lean`.

   Claim: This file supplies `TauCeti.TensorWords.of` and `TauCeti.TensorWords.deconcatenation` at the pin.

   Witness: At a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 that path returns 404; `TauCeti/LinearAlgebra/TensorCoalgebra/Coaugmented/Basic.lean:84` and `:228` contain the two declarations.

   Exact repair text: Replace the path by `TauCeti/LinearAlgebra/TensorCoalgebra/Coaugmented/Basic.lean`. Also replace “current Tau Ceti” by “Tau Ceti at the pin” and locate `form_ofGramMatrix_basisFun_apply` at `TauCeti/LinearAlgebra/IntegralLattice/StandardCoordinates.lean:53`.

12. **F12** (P3) The nonperfectness Check identifies the wrong Ext groups

   Location: `packages/PeriodsAndSpecialValues/README.md:697`, “its Ext groups with 𝔽₂ coefficients are the cohomology groups of C₂”.

   Claim: Extⁱ_{ℤ₂[C₂]}(𝔽₂,𝔽₂)=Hⁱ(C₂,𝔽₂).

   Witness: For R=ℤ₂[C₂], m=(2,g−1) has dim_𝔽₂(m/m²)=2. Thus Ext¹_R(𝔽₂,𝔽₂) has dimension 2, while H¹(C₂,𝔽₂) has dimension 1.

   Exact repair text: “The residue field 𝔽₂ of the local ring ℤ₂[C₂] has infinite projective dimension: this ring has Krull dimension one and embedding dimension two, hence is not regular. Its self-Ext groups are not the ordinary cohomology groups of C₂.” Cite the regular-local-ring criterion, and retain the nonperfectness conclusion.

13. **F13** (P3) Several scalar Checks have no Lean mirror

   Location: `packages/PeriodsAndSpecialValues/README.md:1187`, “at z₃ = 1 is πi/2, at z₃ = 2 is πi/16”; also lines 433, 582, 1082–1083, 1267–1268, 1400–1403, 1448 and 1872.

   Claim: Statable Checks are tested by proved examples of the roadmap definitions.

   Witness: No `example` tests `quarticResidueChart`, `harmonic`, `quarticH`, `quinticConnectionMatrix`, `quinticBoundaryPairing`, `dworkPairWeight`, `PositiveIndex`, `mzvTerm`, `oneThree` or `IsHoffman`.

   Exact repair text: Add at most two proved grouped examples per retained definition, covering these existing Checks: residue values at z₃=1,2 and failed denominator at 0; H₀,H₂¹,H₂²; h₀,h₁,h₂,h₃; the connection last column at λ=1/5 and its pole denominator at −1/5; pairing determinant Y⁴ and Y=0; pair weights n=0,…,5; positive/zero indices; descending and rejected tuples with term 1/4; the three `oneThree` indices; positive and negative Hoffman words. Also group the missing unit-algebraicity examples (2 versus i), inverse-square Tate evaluation, and Legendre endpoint/one-panel values into the existing example budget. Cover the other directly statable Checks as well: `gammaComplexBCGP` at 1,2,3; `quarticPeriodLine` at 0,1,i; the two `quarticMonodromy` row actions at i; the constant and degree-two `quarticFrobeniusSeries` coefficients; `quarticW0 0`; the first three `quarticMirrorCoordinate` coefficients; `dworkCoeff 3 3 = 1/2`; and the empty-index `multipleZeta` value. Add the missing third Tate sign/value and diagonal inverse case by grouping them into the existing examples, rather than exceeding two examples per definition. For a Check that is not yet provable, register its precise named theorem in both files instead of an admitted example.

14. **F14** (P3) Declaration documentation and README name coverage are incomplete

   Location: `packages/PeriodsAndSpecialValues/Suggested.lean:589`, `def mzvDecodeAux`; line 594, `def mzvDecode`; line 185, `theorem fixedPeriodAlgebraic_riemannZeta_two`.

   Claim: Every declaration has a mathematical docstring and every Lean name is in the README.

   Witness: `mzvDecodeAux` is absent from the entire README. The declarations at lines 185,206,252,257,262,266,325,329,357,386,431,447,518,523,560,564,567,570,594,634 have no preceding docstring.

   Exact repair text: Add a mathematical docstring to each listed declaration and to every undocumented example. Add to PS.9.2: “`mzvDecodeAux c w` counts c pending zeros before scanning w; trailing zeros are discarded outside the valid-word carrier.” Alternatively make the recursion local to `mzvDecode` and remove the public helper declaration. Keep valid-word restrictions on the encoding bijection.

15. **F15** (P3) The source register is absent

   Location: `packages/PeriodsAndSpecialValues/README.md:1990`, “References”.

   Claim: Twenty-nine cited works, including version-specific corrections, are registered for reproducible source checks.

   Witness: The package contains README.md, Suggested.lean, metadata.toml and review.json, but no sources.toml. Only BV-final was supplied as a pre-existing cache reference in the brief.

   Exact repair text: Add `sources.toml` with schema `tauceti-roadmap-sources/v1`, one entry per cited work, the actual version, every consumed locator and target, and the sources-service provenance/status. Record BG as uncertified unless a permitted readable version is obtained; keep Tate unresolved until a legal copy or explicit waiver is supplied. Do not put cache paths into the register.

16. **F16** (P3) Two Checks use the wrong normalization label

   Location: `packages/PeriodsAndSpecialValues/README.md:504`, “gives the Dedekind zeta function”; line 1301, “in its centred coordinate”.

   Claim: The dimension-zero completed product is the finite Dedekind zeta function, and the translated reflection's centred fixed points include the translation.

   Witness: At F=ℚ, PS.1.8's product is Γ_ℝ(s)ζ(s), not ζ(s); at s=2 it is ζ(2)/π. For q=p−1, the γ₄ fixed points are q=±i/√2.

   Exact repair text: At line 504 write “gives the completed Dedekind zeta function (its finite factor is ζ_F).” At line 1301 write “the γ₄ fixed points are p=1±i/√2, equivalently p−1=±i/√2.”

17. **F17** (P1) Internal prerequisites run backwards

   Location: `packages/PeriodsAndSpecialValues/README.md:291`, “For a critical twist M(m) (PS.1.3)”; lines 687, 655 and 757.

   Claim: The PS.0–PS.9 order is a build order with earlier prerequisites.

   Witness: PS.1.3 Needs PS.0.4 while PS.0.4 invokes PS.1.3; PS.4.1 invokes PS.4.4 while PS.4.4 Needs PS.4.1. PS.3.3's order predicate invokes PS.5.2, whose PS.5.1 input consumes PS.3.3.

   Exact repair text: “PS.0.4 defines sign periods under its explicit filtration/isomorphism hypotheses. Their existence for critical twists is a corollary in PS.1.3.” Remove PS.0.4 from PS.1.3's prerequisites for defining criticality; retain it only for that corollary. Move the real Tate-cochain computation and its perfectness restriction before the integral-lattice construction, with only ArithmeticGaloisDuality D7 as input. Define `predictedOrder` from the two reduced ranks before `LeadingTermRational`; PS.5.2 imports that predicate. Separate each construction's Needs from later compatibility corollaries.

18. **F18** (P3) Three relative-cohomology locators drop part of the numbering

   Location: `packages/PeriodsAndSpecialValues/README.md:530`, “(3.9), (3.13) and (3.14), pp. 78–80”.

   Claim: These locators identify the relative long exact sequence, Künneth and base-change results in the cited HMS-book draft.

   Witness: HMS-book line 3527 is Proposition 3.2.9, line 3541 is Proposition 3.2.13, and line 3566 is Lemma 3.2.14. The cited draft has no corresponding numbered equations (3.9), (3.13), (3.14).

   Exact repair text: Replace “(3.9), (3.13) and (3.14)” by “Propositions 3.2.9 and 3.2.13 and Lemma 3.2.14”.

## Verified sound

Read all 2,020 README lines and all 725 Suggested.lean lines at the requested head. The inventory contains **139 Lean declarations: 53 definitions, 48 theorems and 38 examples**; **78 numbered target blocks**, with their API entries and proof plans; **150 bold items**; and **297 Check bullets**. Every Check was read and assessed in its target block. The independent arithmetic script executed **102 boundary-check groups**, including multiple instances per group; these are finite tests, not proofs of analytic or geometric theorems. The source table records **77 locator checks/groups**. No Lean elaboration or build was run.

The inspected signatures have explicit binders rather than disappearing section assumptions. No admitted data definition, admitted example, `True` placeholder or `lemma` declaration was found. The file has one `import Mathlib` followed by the used Tate module. No forced headline was identified; R06 records missing easy headlines. No numerical independence is inferred from Brown's motivic basis. The finite-dimensionality assertion accompanies the numerical `finrank` bound.

The explicit computations confirmed the comparison inverse, Tate sign and negative powers, unit critical integers, Gamma normalization factor, empty determinant, quartic Gram determinant and isotropy, all five monodromy isometries and their ordered product, the quartic coefficient recurrence and mirror coefficients, quintic derivative/residue determinants, nilpotent residue, horizontal and pairing matrix identities, Dwork recurrence and pair weights, shuffle/stuffle multiplicities, reversed Zagier coefficients and the weight-five determinant. The finite-length DVR exponent, the real dyadic Tate-cohomology parity and the distinction between a rational basis and an integral lattice also survived the boundary checks.

**Supplier checks.** Five supplied sibling heads were searched and their relevant scopes inspected: CohomologyComparisonsPartII, ColemanIntegrationPartII, QWittVectors, ErdosProgressionPowers and ArithmeticDynamics. The target cites none of these five directly: **0 direct citations to those heads**, rather than five certified supplier contracts. No additional ownership conflict with those five was identified. **10 specific main-roadmap contracts** were checked in their text: PadicMeasuresIwasawaAlgebras §5.1; IntegralLattices 5H and 6A; ClassicalArithmeticCompletion §§7.10 and 7.60; EllipticCurves Layer 7; SchemeAndStackFoundations §§1.17,1.23,4.11; AlgebraicTopology Stage 6. In particular, SchemeAndStackFoundations §1.17 really includes `finiteGroupQuotient_projective`, so the quartic quotient need not be restricted to the affine-only theorem of §1.23.

**Pinned API checks.** Mathlib pin: `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti pin: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Files were located by search and then read at these revisions. Confirmed interfaces include:

| Pinned file | Interface checked |
|---|---|
| `Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean` | Gamma-real pole/zero convention and Gamma-complex factor 2 |
| `Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean:409` | `Matrix.det_nonsing_inv`, including singular input |
| `Mathlib/LinearAlgebra/Matrix/Block.lean:389` | `Matrix.det_of_isUpperTriangular` |
| `Mathlib/Algebra/Polynomial/Laurent.lean:531` | `LaurentPolynomial.eval₂` and `eval₂_T`, with unit evaluation parameter |
| `Mathlib/NumberTheory/Harmonic/Defs.lean:23` | Existing ordinary harmonic sum; the roadmap's exponent-r version is distinct |
| `Mathlib/RingTheory/PowerSeries/Substitution.lean:456` | `PowerSeries.substInv`, invertible linear coefficient and zero constant term |
| `Mathlib/Analysis/SpecialFunctions/OrdinaryHypergeometric.lean:81` | The existing function is ₂F₁, not a general ₃F₂ |
| `Mathlib/NumberTheory/Padics/PadicVal/Basic.lean:620` | Legendre digit-sum identity with `Fact p.Prime` |
| `TauCeti/Geometry/Hodge/Tate/Basic.lean` | Tate Hodge filtration and ordinary lattice inclusion; no geometric 2πi scalar supplied |
| `TauCeti/LinearAlgebra/TensorCoalgebra/Coaugmented/Basic.lean:84` | `TensorWords.of` and all-cut `deconcatenation` at line 228 |
| `TauCeti/LinearAlgebra/IntegralLattice/StandardCoordinates.lean:53` | `form_ofGramMatrix_basisFun_apply` |

The read-only PR diff contained only README.md, Suggested.lean, metadata.toml and review.json inside `packages/PeriodsAndSpecialValues/`. No out-of-package change was present. This pass created only its report and scratch notes; no existing package file was changed.

**Mechanical dependency output** (exit status 1):

```text
NOT IN ORDER: PeriodsAndSpecialValues (insert it after its last supplier)
depcheck: 6 roadmaps, 58 edges, 1 problem(s)
```

There is no UPWARD or CYCLE line. Absence from the order is not raised as a finding. This six-roadmap parsed graph does not certify the full prose graph; R04 and R17 give independently inspectable dependency witnesses.

### Source-locator audit

Counts group a contiguous equation range or a single cited section as one check. A located passage is certified only for the assertion described in the table, not every theorem of the cited work. All other external sources were requested through the sources service; BG returned uncertified and Tate remained unavailable. The supplied BV-final cache was available in addition to the fetched published BV version; published locators below use BV.

| Source | Count | Locators checked | Witness | Result |
|---|---|---|---|---|
| BCGP | 4 | (2.8.4)–(2.8.5); Conjecture 2.8.6; Corollary 2.8.7 | BCGP lines 1831–1881 | Conventions and the alternating-exponent misprint checked |
| B | 7 | Theorem 2.4; Theorem 3.3; Lemma 3.8; Lemma 7.1; Theorems 7.3–7.4; Corollary 7.5 | B lines 235–287, 390–425, 465–545, 885–941 | Coaction, kernel, shifted integral, determinant and Hoffman endpoint checked |
| BF | 8 | Conjecture 1; (19); (29); Lemma 9; Conjecture 4; Proposition 2.5; (15); Remark 7 | BF lines 865–925, 1180–1200, 1590–1645, 625–650, 738–767, 1555–1568 | R08; gluing scope and corrected reciprocal checked |
| BK | 3 | Definition 5.5; (5.7); Definition 5.9/(5.9.1) | BK lines 1190–1284 | R07,R09; weight and local-domain restrictions checked |
| BV | 2 | Conjecture 4.1; Remark 5.6 | BV lines 1016–1034, 1273–1314 | Inverse determinant and dual twist checked; unshifted pair in printed remark is not well typed |
| Deligne | 3 | §1.7; Proposition–Definition 2.3(ii); §7.8 | Deligne lines 300–329, 376–420, 986–999 | Sign-period domains, missing minus-s and twist direction checked |
| DG | 3 | Propositions 1.9, 2.3, 2.14 | DG lines 456–482, 531–540, 681–704 | Ext2, noncanonical free generators and faithful Hodge realization checked |
| H | 3 | Proposition 4.26; Theorem 4.12; Proposition 4.38 | H lines 971–979, 693–710, 1161–1171 | Pullback correction and ambient unimodularity issue checked; symmetric square checked |
| HMS | 2 | Theorem 2.10; Corollary 2.11 | HMS lines 447–474 | Localized formal algebra, relative pairing and Tate inverse checked |
| HMS-book | 9 | Definition 3.2.6; Lemma 3.2.7; Propositions 3.2.9, 3.2.13; Theorem 5.3.3; Definition 5.4.1; Lemma 5.4.2; Corollary 14.5.4; Theorem 14.5.6 | HMS-book lines 3511–3565, 4366–4389, 4399–4434, 10820–10858 | Arbitrary pairs and second-kind forms checked; R18 locator repair |
| Huybrechts | 1 | Chapter 1 Proposition 3.5 | Huybrechts lines 525–541 | K3 lattice signature and evenness route checked |
| IKZ | 3 | Proposition 1; (2.2); Theorem 1 | IKZ lines 141–164, 190–215 | Regularization polynomials and rho direction checked |
| Johansson | 1 | §§1–2 | Johansson lines 104–139 | Validation/error-budget discussion supports numerical scope only, not extra exact recognition |
| K | 3 | Lemma 2.3.6; Lemma 2.3.8; Proposition 3.1.11 | K lines 145–201, 451–493 | Uniqueness hypotheses, nilpotent residue extension and hypergeometric irreducibility checked |
| LTXZZ | 3 | Definition 8.1.1; Theorems 8.2.2 and 8.3.2 | LTXZZ lines 7330–7415, 7580–7600, 7830–7855 | Admissibility and rank-theorem hypotheses compared with PS.6.7 |
| LYA | 3 | (5.3)–(5.4); (5.19); (6.4) | LYA lines 602–608, 749–766, 792–805 | Schwarzian, quartic polynomial and denominator localization checked |
| LYH | 1 | Proposition 3.1 | LYH lines 116–129 | Specialized quartic parameter values agree |
| NS | 2 | (26); (39) | NS lines 536–575, 780–784 | Equal upper parameters and reflection checked |
| Park | 1 | Proposition 5.2 | Park lines 1560–1610 | The factor q in the comparison identity checked |
| Qian | 2 | Lemma 2.1; Theorem 3.2 proof step (ii) | Qian lines 183–206, 673–680 | Semistable unit substitution and multiplication-by-p transition checked |
| SG | 3 | Lemma 4.11; Theorem 4.18; Lemma 5.6 | SG lines 782–800, 972–1000, 1082–1105 | Proper completion comparison and strict p>dimension restriction checked |
| SH | 3 | Lemma 4.12; Theorem 5.13; Definition 6.1 | SH lines 324–346, 517–530, 586–601 | Connection, convolution and Dwork series checked |
| SO | 2 | Definition 3.7; Proposition 4.24 | SO lines 440–462, 1040–1062 | Framed motives, not only numerical equality; OCR checked for these assertions |
| SS | 1 | §3 | SS lines 553–575 | Twisted Frobenius and the expressly unresolved crystalline comparison checked |
| Z | 2 | Theorem 1; Lemma 2 | Z lines 239–254, 724–733 | Coefficient reversal and analytic uniqueness estimate checked |
| IL | 2 | Layers 5H,6A | TauCetiRoadmap/IntegralLattices/README.md:1559 and :1640 | Unimodular embedding and indefinite classification scope checked |
| BG | 0 | Not certified | BF Remark 10 records the restricted application | Sources service returned uncertified; no new reference request |
| Serre | 0 | §4.1 located, formulas not certified | Serre lines 338–397 | Extracted text drops displayed equations; BCGP provides readable supporting formulas |
| Tate | 0 | (3.4.3)–(3.4.7) | No legal readable source returned | Single unresolved reference request retained |

### Adversarial target table

“Consistent” and “no new defect” describe the examined instances and sources, not a completed formal proof. Carriers not present at the pins are assessed in prose, not replaced by artificial Lean data. R-numbers refer to findings above.

| Statement | Instances tried | Result | Change |
|---|---|---|---|
| PS.0.1 The comparison determinant line (line 234) | rank 0; rank 1; singular matrix; independent source/target rescaling | determinant convention consistent; nonzero comparison required | R03 supplier contract |
| PS.0.2 The real comparison and the infinity involution (line 252) | Tate twists 0,1,2; conjugation squared; rational ± eigenspaces | semilinear real action distinguished from linear infinity action | R03 supplier contract |
| PS.0.3 The period class modulo the coefficient field (line 270) | E=Q; periods 1,2,i; zero excluded; different embeddings | unit equivalence correct for selected component | R13 mirrors |
| PS.0.4 Deligne's plus and minus periods (line 287) | unit and Tate twist; empty sign part; equal-dimensional zero map | conditional definition sound; criticality corollary runs backwards | R17 |
| PS.0.5 The Tate and elliptic normalizations (line 305) | Tate ±1; shear matrix; singular K=0 or H=J; index-2 cycles | inverse matrix, second-kind polar primitive and 2πi direction consistent | R13 mirrors; supplier availability |
| PS.1.1 The motivic Euler product of a compatible system (line 357) | zero representation; eigenvalue 1; bad place; auxiliary prime equals residue characteristic | Euler reciprocal and actual-system hypotheses retained | R02; unverified supplier sections |
| PS.1.2 Archimedean factors and the completed L-function (line 378) | unit; Tate twist; complex Gamma at 1; pure real off-diagonal pair | factor 2 between Gamma conventions retained | R13 missing scalar mirrors |
| PS.1.3 Critical integers (line 398) | m=-10..10 for unit; p=0,q=1; dual pole at m=1 | criticality iff passes arithmetic tests | R17 prerequisite split |
| PS.1.4 Deligne's normalized-value predicate (line 417) | zero value; zero period; coefficients 2 versus i; rescaling by unit | algebraicity and unit algebraicity separated correctly | R13 |
| PS.1.5 The Dirichlet and Tate adapter (line 437) | trivial Dirichlet character; Tate 0,1,2; critical -1,2 | rational ratios and parity convention consistent | supplier target correspondence not fully verifiable |
| PS.1.6 The modular period adapter (line 455) | weight 2; endpoints 1,k-1; rescaling each sign period | needs the acknowledged eigenprojector-motive input | R03 |
| PS.1.7 Serre's functional-equation predicate (line 473) | unit N=1; self-dual; identically zero germ; half-conductor rescaling | dual equation implies epsilon product N, not 1 | Tate locator unresolved |
| PS.1.8 Hasse–Weil completions of abelian varieties (line 492) | dimension 0; elliptic H1 sign; surface Gamma square | completed versus finite zeta Check false | R16 |
| PS.2.1 Evaluation of localized formal periods by integration (line 524) | point; zero form; interval and reversed interval; empty/equal pair; degree-one swap | Stokes and graded product signs consistent; arbitrary-pair input absent | R03,R18 |
| PS.2.2 The evaluation map is the comparison point of the period torsor (line 551) | Laurent evaluation at 1; two noncommuting 2x2 torsor matrices | point need not be injective; left/right action order matters | R04 supply cycle |
| PS.2.3 The rank-one Tate torsor (line 569) | powers 0,-1,-2; polynomial versus Laurent; sqrt(2) embeddings | Tate inversion correct | R13 |
| PS.3.1 The rational fundamental line (line 600) | zero complex; odd shift; finite torsion rationalization; real quadratic unit rank | determinant exponents consistent; virtual-category supplier missing | R02,R03 |
| PS.3.2 The real period–regulator trivialization (line 629) | empty regulator; scaling by 2; singular pairing | exactness hypothesis excludes singular regulator | R02 |
| PS.3.3 Leading terms and their rationality (line 653) | 3s^2; 2/s; lattices Z and 2Z | leading coefficient includes factorial; order definition forward-referenced | R17 |
| PS.4.1 The integral lattice in the fundamental line (line 683) | zero complex; multiplication by uniformizer cubed; F2 over Z2[C2] | perfectness exclusion correct but Ext witness false | R12,R17 |
| PS.4.2 The finite lattice correction (line 701) | degrees 0,1 and -1,0; unit and zero differential; field as fraction ring | sign of length exponent correct; zero differential excluded | R02 |
| PS.4.3 Local Euler and Tamagawa corrections (line 725) | unramified eigenvalues 1 and 2; Qp(1) at ell≠p and at p | finite/full local cohomology misidentified | R08 |
| PS.4.4 The real dyadic restriction (line 743) | trivial/sign Z2 lattices; rationalization; p odd | periodic cohomology correctly obstructs perfect determinant | R17 order |
| PS.5.1 The equivariant Tamagawa obstruction (line 773) | scalar 2,-1; Hamilton quaternions; empty support; multipliers 1,2 | plus sign, local gluing and norm restrictions consistent | R02,R03,R04 |
| PS.5.2 The equivariant Tamagawa number conjecture as a predicate (line 817) | pole of Q(1); nonzero rational relative class; invert 2 only | four assertions kept distinct; predicted order includes H0 term | R17 |
| PS.5.3 The zeta-isomorphism orientation (line 835) | inverse determinant target; dual Artin twist; unshifted complex | orientation and required shift correctly distinguished | NE.7 current contract unavailable |
| PS.5.4 Transport of proved cases (line 854) | trivial/permutation/sign characters; r=0,-1; missing Leopoldt | Artin induction not strengthened to effective positive coefficients | R02; BG uncertified |
| PS.6.1 Bloch–Kato motivic pairs (line 885) | zero pair; Q(0); rescale lattice at q; omitted crystalline Euler polynomial | P2 exceptional set depends on lattices; P3 includes p | R02,R03 |
| PS.6.2 Bloch–Kato points, the Tamagawa measure and Sha (line 903) | zero triple; scale form by 2; good rank-one mass; local rational tangent | whole-space integral exponential false; weight scope too small | R07,R09 |
| PS.6.3 The elliptic fundamental-line adapter (line 929) | rank 0; index-2 Mordell–Weil subgroup; one/two real components | regulator index squared and all-components period consistent | R02 |
| PS.6.4 Prime-by-prime transport of the rank-zero and rank-one results (line 954) | rank 0,1; one missing odd prime; p=2; total versus primary Sha finiteness | primewise conclusions not promoted to total finiteness | R02 |
| PS.6.5 The Bloch–Kato Tamagawa number conjecture as a predicate (line 972) | zero triple; lattice rescaling; finite versus primary Sha | conjectural status retained; regularized measure missing | R09 |
| PS.6.6 The Rankin–Selberg Beilinson–Bloch–Kato prediction (line 996) | rank 0,1; central sign; V versus dual twist | prediction is predicate, not theorem | R02 |
| PS.6.7 The proved rank-zero and rank-one cases (line 1016) | admissible versus nonadmissible prime; zero/nonzero diagonal class | LTXZZ hypotheses retained in prose | R02; absent arithmetic supplier |
| PS.7.1 Certified period quadrature (line 1065) | N=0,1,2; lambda=0,1/2,1; square-root sign | analytic estimates consistent; computational deliverables forbidden | R05,R13 |
| PS.7.2 Certified enclosures of normalized values (line 1090) | zero-containing box; ratio -1/24; irrational in tiny interval | division and recognition hypotheses explicit; algorithm scope forbidden | R05 |
| PS.7.3 Covariance of normalized values (line 1109) | unit rescaling; singular period; finite/completed normalization | algebraic covariance consistent | R02,R05 |
| PS.7.4 The period conjecture and the special-value predicates (line 1127) | period map at t=1; kernel t-1; separate conjectural assertions | no injectivity inferred from torsor or numerical evidence | R04 |
| PS.8.1 The resolved Dwork quartic family (line 1158) | t=0,1; all-one vector; zero vector; group orders16/64 | polynomial checks correct; quotient at 0 still requires resolution | no new defect found in the resolved-family construction |
| PS.8.2 The normalized quartic residue form (line 1177) | t=0,z3=1,2,0; product-one scaling | 2πi and cubic denominator values correct; chart domain necessary | R13 |
| PS.8.3 The quartic Picard–Fuchs equation (line 1193) | constant function; t=1; t=0 excluded; rescaling t versus 1/t | corrected pullback coefficients consistent | R13 convention mirrors |
| PS.8.4 The marked orthogonal complement (line 1209) | p=0,1,i; Gram determinant; rank jump; discriminant gluing index4 | isotropy/positivity and rational-only splitting consistent | R02 K3 owner |
| PS.8.5 Integral monodromy and period normalization (line 1231) | all five matrices; ordered product; square/cube of infinity unipotent; p=i | matrix and dual-action conventions pass | R13 extra mirrors |
| PS.8.6 The Frobenius solution basis (line 1255) | n=0,1,2,3; harmonic exponents1,2; recurrence n=1..7 | A,g,h low terms correct | R13 |
| PS.8.7 The hypergeometric symmetric square (line 1272) | constant and linear coefficient; unsquared hypergeometric negative control | Clausen parameters and factor256 correct | no new defect found |
| PS.8.8 Local continuation and reflection at the conifold (line 1290) | U2=0; sign flip; p=1 pole; translated fixed point | reflection algebra correct; centred fixed-point label false | R16 |
| PS.8.9 The normalized mirror coordinate (line 1306) | constant/linear/cubic series coefficients; inverse quadratic sign | unit and substitution hypotheses retained | no new defect found |
| PS.8.10 The modular relation with 1/j (line 1322) | lowest homogeneous part; q^3 term; j versus j/1728 | polynomial and cusp normalization agree with LYA | no new defect found |
| PS.8.11 Integrality of the quartic mirror map (line 1344) | m=1; m=2 branch q+q^2/2; inverse coefficients | localization Z[1/m] necessary and retained | no new defect found |
| PS.8.12 The invariant Dwork quintic family (line 1360) | lambda=0,±1/5; p=3,5; transposition action | G versus S5 distinction and sign correct | R02 dependencies |
| PS.8.13 The formal quintic cohomology and its connection (line 1379) | lambda=0,±1/5; Y=0,1; D and residue nilpotence | matrix, signs, pairing determinant pass | R13 |
| PS.8.14 The normalized Dwork Frobenius (line 1410) | p=3; lambda-semilinearity; p^-1 versus p^-2 | stated normalization consistent with projective residue calculation | current RD/CR contracts unverified |
| PS.8.15 The Dwork sums and their convergence (line 1428) | p=2,3,5,7; n=0..40; pair weights0..5 | recurrences and valuation bound pass; p=2 exclusion unnecessary | R10,R13 |
| PS.8.16 Shapiro's boundary Frobenius matrix (line 1454) | p=0,1,2,3,5; delta=0,25/648; Y=0,1,2 | NF=pFN and pairing pass algebraically, including degenerate cases | no new algebraic defect |
| PS.8.17 The crystalline comparison of the boundary Frobenius (line 1478) | p=3,5,7; residue determinant12; lattice diag(p,1,1,1); scalar -F | small-prime caveat and q^2 normalization retained; large geometric contract unowned | R02; current supplier sections unverified |
| PS.9.1 Indices and convergent multiple zeta values (line 1550) | empty index; [0],[1],[2,1],[1,2]; descending tuple(2,1) | positivity, convergence direction and total-sum caveat consistent | R13 |
| PS.9.2 Shuffle and stuffle word algebras (line 1568) | empty word; 01 shuffle01; [2] stuffle[2]; trailing zero; [3,1,2] | multiplicities/encoding and restricted stuffle carrier correct | R11,R14 |
| PS.9.3 Iterated integrals, endpoint limits and tangential regularization (line 1585) | a=b; empty word; 001,011; divergent singleton1 | largest-time head and word reversal consistent | R02 polylogarithm owner |
| PS.9.4 Convergent double shuffle (line 1601) | weight4; empty factor; duplicate interleavings | both products give stated coefficient4 and rational zeta ratios | no new defect found |
| PS.9.5 The shuffle and stuffle regularizations (line 1617) | [1],[1,1],[1,2]; admissible words | regularization polynomials match IKZ | no new defect found |
| PS.9.6 The comparison operator ρ (line 1633) | monomials1,T,T^2,T^3 | rho is linear, triangular, not multiplicative | missing easy rho carrier/signatures remain reviewable |
| PS.9.7 Regularized double shuffle (line 1649) | [1,1],[1,2]; 1 shuffle01 versus stuffle | comparison direction yields zeta(2,1)=zeta(3) | no new defect found |
| PS.9.8 Mixed Tate motives over ℤ (line 1665) | Tate weights0,-2; Kummer2; unramified at all primes | adjacent-extension restriction meaningful; required K-theory supplier absent | R02,R03 |
| PS.9.9 Extensions and the motivic Galois group (line 1681) | n=0,1,2,3,5; generator choice | extensions and noncanonical freeness agree with DG | R02 |
| PS.9.10 The motivic torsor of paths on the three-punctured line (line 1697) | empty word; deconcatenation01; tangential endpoints0,1 | outer cuts required; endpoints not ordinary points | R03,R04 |
| PS.9.11 Brown's motivic multiple zeta values (line 1715) | empty word; zeta^m(2); reverse011; numerical kernel | stable-ideal quotient correctly differs from numerical quotient | R03 |
| PS.9.12 The motivic coaction (line 1731) | weights0,2,3; empty cut segments | A in first tensor factor; Tate term coinvariant | no new defect found |
| PS.9.13 The f-alphabet and the dimension bound (line 1753) | weights0..8; no f1; dimension upper bound | counts match; no numerical independence claimed | no new defect found |
| PS.9.14 The coaction derivations and their kernel (line 1769) | N=2,3; odd cutoff strict r<N; D3 of weight5 | kernel line and coefficient -2 consistent | no new defect found |
| PS.9.15 Convergent motivic double shuffle and the shifted all-two integrals (line 1785) | n=1,2; empty all-two word; weight4 stuffle | shifted integral coefficient and factor2 correct | R03 frames contract |
| PS.9.16 Zagier's coefficients (line 1809) | (a,b,r)=(0,0,1),(1,0,1),(1,0,2),(0,1,1),(0,1,2) | reversed coefficients 1,-2,9/2,3,-11/2 correct | no new defect found |
| PS.9.17 Zagier's evaluation (line 1823) | (a,b)=(0,0),(1,0),(0,1); m=0,1 | formula and finite-sum truncation consistent | R06 missing all-two headline |
| PS.9.18 Brown's motivic lift of Zagier's evaluation (line 1846) | weight3; weight5; positive odd zeta | coaction induction needs only one nonzero period, not injectivity | no new defect found |
| PS.9.19 The Hoffman level filtration (line 1862) | N=0,1,5,6; levels0,1,2; [1],[4] | cardinalities/parity correct | R13 |
| PS.9.20 The Hoffman cut matrix (line 1879) | N=3,l=1 and N=5,l=1; empty source set | matrix determinant5/2 and prefix bijection correct | no new defect found |
| PS.9.21 Brown's 2-adic determinant argument (line 1895) | empty matrix; [[1,1],[2,1]]; singular zero diagonal; odd below diagonal | zero-entry alternatives necessary; criterion valid for every prime | R06 missing general headline |
| PS.9.22 The motivic Hoffman basis (line 1911) | weights0,1,2,3,5 | motivic basis and dimension argument do not imply numerical basis | no new defect found |
| PS.9.23 Numerical spanning and periods of mixed Tate motives over ℤ (line 1927) | weights0,1,5; negative Tate twist; period kernel | finite span plus bound stated; inverse Tate only in localized algebra | R04 |

### Lean declaration and context table

All declarations are inside `TauCetiRoadmap.PeriodsAndSpecialValues`. `Type*` binders retain their inferred universe; no global carrier or topology instance is silently assumed. Quartic, Quintic and MZV are ordinary sections with no extra variable block. An example proof was read, not executed.

| Line | Section | Declaration and explicit binders | Context | Audit |
|---|---|---|---|---|
| 44 | Layer PS.0: comparison spaces and period lines | `def CoordinatePeriodEquivalent (E : Type*) [Field E] [Algebra E ℂ] (α β : ℂˣ) : Prop ` | noncomputable; no section variables; binders explicit above | PS.0: units nonzero; rank 0/1/2; inverse and Tate conventions checked; real body read; README scope in target table |
| 49 | Layer PS.0: comparison spaces and period lines | `theorem comparisonMatrix_det_basisChange {n : ℕ} (A C P : Matrix (Fin n) (Fin n) ℂ) : (C⁻¹ * P * A).det = (C.det)⁻¹ * P.det * A.det ` | noncomputable; no section variables; binders explicit above | PS.0: units nonzero; rank 0/1/2; inverse and Tate conventions checked; signature read, no Lean run |
| 54 | Layer PS.0: comparison spaces and period lines | `example : CoordinatePeriodEquivalent ℚ (Units.mk0 (2 : ℂ) two_ne_zero) 1 ` | noncomputable; no section variables; binders explicit above | PS.0: units nonzero; rank 0/1/2; inverse and Tate conventions checked; proof read, not elaborated |
| 58 | Layer PS.0: comparison spaces and period lines | `example : ¬ CoordinatePeriodEquivalent ℚ (Units.mk0 Complex.I Complex.I_ne_zero) 1 ` | noncomputable; no section variables; binders explicit above | PS.0: units nonzero; rank 0/1/2; inverse and Tate conventions checked; proof read, not elaborated |
| 65 | Layer PS.0: comparison spaces and period lines | `def tatePeriod (n : ℤ) : ℂ ` | noncomputable; no section variables; binders explicit above | PS.0: units nonzero; rank 0/1/2; inverse and Tate conventions checked; real body read; README scope in target table |
| 68 | Layer PS.0: comparison spaces and period lines | `def tateInfinitySign (n : ℤ) : ℤˣ ` | noncomputable; no section variables; binders explicit above | PS.0: units nonzero; rank 0/1/2; inverse and Tate conventions checked; real body read; README scope in target table |
| 71 | Layer PS.0: comparison spaces and period lines | `theorem tatePeriod_add (m n : ℤ) : tatePeriod (m + n) = tatePeriod m * tatePeriod n ` | noncomputable; no section variables; binders explicit above | PS.0: units nonzero; rank 0/1/2; inverse and Tate conventions checked; signature read, no Lean run |
| 74 | Layer PS.0: comparison spaces and period lines | `example : tatePeriod 0 = 1 ` | noncomputable; no section variables; binders explicit above | PS.0: units nonzero; rank 0/1/2; inverse and Tate conventions checked; proof read, not elaborated |
| 77 | Layer PS.0: comparison spaces and period lines | `example : tatePeriod (-1) = (2 * (Real.pi : ℂ) * Complex.I)⁻¹ ` | noncomputable; no section variables; binders explicit above | PS.0: units nonzero; rank 0/1/2; inverse and Tate conventions checked; proof read, not elaborated |
| 82 | Layer PS.0: comparison spaces and period lines | `example : tateInfinitySign 1 = -1 ` | noncomputable; no section variables; binders explicit above | PS.0: units nonzero; rank 0/1/2; inverse and Tate conventions checked; proof read, not elaborated |
| 87 | Layer PS.0: comparison spaces and period lines | `def ellipticIntegrationMatrix (K J H : ℂ) : Matrix (Fin 2) (Fin 2) ℂ ` | noncomputable; no section variables; binders explicit above | PS.0: units nonzero; rank 0/1/2; inverse and Tate conventions checked; real body read; README scope in target table |
| 91 | Layer PS.0: comparison spaces and period lines | `theorem ellipticIntegrationMatrix_det (K J H : ℂ) : (ellipticIntegrationMatrix K J H).det = 4 * Complex.I * K * (H - J) ` | noncomputable; no section variables; binders explicit above | PS.0: units nonzero; rank 0/1/2; inverse and Tate conventions checked; signature read, no Lean run |
| 97 | Layer PS.0: comparison spaces and period lines | `example : (ellipticIntegrationMatrix 1 0 2).det = 8 * Complex.I ` | noncomputable; no section variables; binders explicit above | PS.0: units nonzero; rank 0/1/2; inverse and Tate conventions checked; proof read, not elaborated |
| 102 | Layer PS.0: comparison spaces and period lines | `example : (ellipticIntegrationMatrix 1 1 1).det = 0 ` | noncomputable; no section variables; binders explicit above | PS.0: units nonzero; rank 0/1/2; inverse and Tate conventions checked; proof read, not elaborated |
| 108 | Layer PS.0: comparison spaces and period lines | `def ellipticComparisonMatrix (B : Matrix (Fin 2) (Fin 2) ℂ) : Matrix (Fin 2) (Fin 2) ℂ ` | noncomputable; no section variables; binders explicit above | PS.0: units nonzero; rank 0/1/2; inverse and Tate conventions checked; real body read; README scope in target table |
| 111 | Layer PS.0: comparison spaces and period lines | `example : ellipticComparisonMatrix !![1, 2; 0, 1] = !![1, -2; 0, 1] ` | noncomputable; no section variables; binders explicit above | PS.0: units nonzero; rank 0/1/2; inverse and Tate conventions checked; proof read, not elaborated |
| 117 | Layer PS.0: comparison spaces and period lines | `example : ellipticComparisonMatrix 1 = 1 ` | noncomputable; no section variables; binders explicit above | PS.0: units nonzero; rank 0/1/2; inverse and Tate conventions checked; proof read, not elaborated |
| 123 | Layer PS.1: critical values and algebraicity statements | `def RealGammaRegular (m : ℤ) : Prop ` | noncomputable; no section variables; binders explicit above | PS.1: critical integers, Gamma convention, zero value/period checked; real body read; README scope in target table |
| 127 | Layer PS.1: critical values and algebraicity statements | `theorem realGammaRegular_iff (m : ℤ) : RealGammaRegular m ↔ Complex.Gammaℝ (m : ℂ) ≠ 0 ` | noncomputable; no section variables; binders explicit above | PS.1: critical integers, Gamma convention, zero value/period checked; signature read, no Lean run |
| 131 | Layer PS.1: critical values and algebraicity statements | `def UnitCritical (m : ℤ) : Prop ` | noncomputable; no section variables; binders explicit above | PS.1: critical integers, Gamma convention, zero value/period checked; real body read; README scope in target table |
| 134 | Layer PS.1: critical values and algebraicity statements | `def OffDiagonalCritical (p q m : ℤ) : Prop ` | noncomputable; no section variables; binders explicit above | PS.1: critical integers, Gamma convention, zero value/period checked; real body read; README scope in target table |
| 137 | Layer PS.1: critical values and algebraicity statements | `theorem unitCritical_iff (m : ℤ) : UnitCritical m ↔ (∃ k : ℕ, m = 2 * ((k : ℤ) + 1)) ∨ (∃ k : ℕ, m = -(2 * (k : ℤ) + 1)) ` | noncomputable; no section variables; binders explicit above | PS.1: critical integers, Gamma convention, zero value/period checked; signature read, no Lean run |
| 142 | Layer PS.1: critical values and algebraicity statements | `example : UnitCritical 2 ∧ UnitCritical (-1) ` | noncomputable; no section variables; binders explicit above | PS.1: critical integers, Gamma convention, zero value/period checked; proof read, not elaborated |
| 146 | Layer PS.1: critical values and algebraicity statements | `example : ¬ UnitCritical 0 ∧ RealGammaRegular 1 ∧ ¬ UnitCritical 1 ` | noncomputable; no section variables; binders explicit above | PS.1: critical integers, Gamma convention, zero value/period checked; proof read, not elaborated |
| 150 | Layer PS.1: critical values and algebraicity statements | `example : ∀ m : ℤ, OffDiagonalCritical 0 1 m ↔ m = 1 ` | noncomputable; no section variables; binders explicit above | PS.1: critical integers, Gamma convention, zero value/period checked; proof read, not elaborated |
| 156 | Layer PS.1: critical values and algebraicity statements | `def gammaComplexBCGP (s : ℂ) : ℂ ` | noncomputable; no section variables; binders explicit above | PS.1: critical integers, Gamma convention, zero value/period checked; real body read; README scope in target table |
| 159 | Layer PS.1: critical values and algebraicity statements | `theorem gammaℂ_eq_two_mul_gammaComplexBCGP (s : ℂ) : Complex.Gammaℂ s = 2 * gammaComplexBCGP s ` | noncomputable; no section variables; binders explicit above | PS.1: critical integers, Gamma convention, zero value/period checked; signature read, no Lean run |
| 164 | Layer PS.1: critical values and algebraicity statements | `theorem gammaComplexBCGP_one : gammaComplexBCGP 1 = 1 / (2 * (Real.pi : ℂ)) ` | noncomputable; no section variables; binders explicit above | PS.1: critical integers, Gamma convention, zero value/period checked; signature read, no Lean run |
| 169 | Layer PS.1: critical values and algebraicity statements | `def FixedPeriodAlgebraic (E : Type*) [Field E] [Algebra E ℂ] (L c : ℂ) : Prop ` | noncomputable; no section variables; binders explicit above | PS.1: critical integers, Gamma convention, zero value/period checked; real body read; README scope in target table |
| 173 | Layer PS.1: critical values and algebraicity statements | `def FixedPeriodUnitAlgebraic (E : Type*) [Field E] [Algebra E ℂ] (L c : ℂ) : Prop ` | noncomputable; no section variables; binders explicit above | PS.1: critical integers, Gamma convention, zero value/period checked; real body read; README scope in target table |
| 177 | Layer PS.1: critical values and algebraicity statements | `theorem fixedPeriodAlgebraic_rescale (E : Type*) [Field E] [Algebra E ℂ] (L c : ℂ) (u : Eˣ) : FixedPeriodAlgebraic E L (algebraMap E ℂ (u : E) * c) ↔ FixedPeriodAlgebraic E L c ` | noncomputable; no section variables; binders explicit above | PS.1: critical integers, Gamma convention, zero value/period checked; signature read, no Lean run |
| 182 | Layer PS.1: critical values and algebraicity statements | `theorem riemannZeta_two_div_tatePeriod : riemannZeta 2 / tatePeriod 2 = -1 / 24 ` | noncomputable; no section variables; binders explicit above | PS.1: critical integers, Gamma convention, zero value/period checked; signature read, no Lean run |
| 185 | Layer PS.1: critical values and algebraicity statements | `theorem fixedPeriodAlgebraic_riemannZeta_two : FixedPeriodAlgebraic ℚ (riemannZeta 2) (tatePeriod 2) ` | noncomputable; no section variables; binders explicit above | PS.1: critical integers, Gamma convention, zero value/period checked; signature read, no Lean run |
| 190 | Layer PS.1: critical values and algebraicity statements | `example : FixedPeriodAlgebraic ℚ 0 1 ∧ ¬ FixedPeriodUnitAlgebraic ℚ 0 1 ` | noncomputable; no section variables; binders explicit above | PS.1: critical integers, Gamma convention, zero value/period checked; proof read, not elaborated |
| 197 | Layer PS.1: critical values and algebraicity statements | `example : ¬ FixedPeriodAlgebraic ℚ 0 0 ` | noncomputable; no section variables; binders explicit above | PS.1: critical integers, Gamma convention, zero value/period checked; proof read, not elaborated |
| 203 | Layer PS.2: formal periods and the evaluation map | `def tateTorsorEvaluation : LaurentPolynomial ℚ →+* ℂ ` | noncomputable; no section variables; binders explicit above | PS.2.3: Laurent powers 0,-1,-2; no injectivity inferred; real body read; README scope in target table |
| 206 | Layer PS.2: formal periods and the evaluation map | `theorem tateTorsorEvaluation_T (n : ℤ) : tateTorsorEvaluation (LaurentPolynomial.T n) = tatePeriod n ` | noncomputable; no section variables; binders explicit above | PS.2.3: Laurent powers 0,-1,-2; no injectivity inferred; signature read, no Lean run |
| 211 | Layer PS.2: formal periods and the evaluation map | `example : tateTorsorEvaluation (LaurentPolynomial.T 1 * LaurentPolynomial.T (-1)) = 1 ` | noncomputable; no section variables; binders explicit above | PS.2.3: Laurent powers 0,-1,-2; no injectivity inferred; proof read, not elaborated |
| 225 | Layer PS.7: certified computations and the research boundary | `def arctanPartial (N : ℕ) : ℚ ` | noncomputable; no section variables; binders explicit above | PS.7.1: N=0 excluded from bound; lambda=0,1/2,1 checked; real body read; README scope in target table |
| 229 | Layer PS.7: certified computations and the research boundary | `theorem arctan_period_bounds (N : ℕ) : 0 ≤ (-1 : ℝ) ^ (N + 1) * (Real.pi / 4 - (arctanPartial N : ℝ)) ∧ (-1 : ℝ) ^ (N + 1) * (Real.pi / 4 - (arctanPartial N : ℝ)) ≤ 1 / (2 * (N : ℝ) + 3) ` | noncomputable; no section variables; binders explicit above | PS.7.1: N=0 excluded from bound; lambda=0,1/2,1 checked; signature read, no Lean run |
| 235 | Layer PS.7: certified computations and the research boundary | `example : arctanPartial 1 = 2 / 3 ` | noncomputable; no section variables; binders explicit above | PS.7.1: N=0 excluded from bound; lambda=0,1/2,1 checked; proof read, not elaborated |
| 239 | Layer PS.7: certified computations and the research boundary | `def legendreRadicand (lam u : ℝ) : ℝ ` | noncomputable; no section variables; binders explicit above | PS.7.1: N=0 excluded from bound; lambda=0,1/2,1 checked; real body read; README scope in target table |
| 242 | Layer PS.7: certified computations and the research boundary | `def legendreIntegrand (lam u : ℝ) : ℝ ` | noncomputable; no section variables; binders explicit above | PS.7.1: N=0 excluded from bound; lambda=0,1/2,1 checked; real body read; README scope in target table |
| 245 | Layer PS.7: certified computations and the research boundary | `def legendreK (lam : ℝ) : ℝ ` | noncomputable; no section variables; binders explicit above | PS.7.1: N=0 excluded from bound; lambda=0,1/2,1 checked; real body read; README scope in target table |
| 249 | Layer PS.7: certified computations and the research boundary | `def legendreMidpoint (lam : ℝ) (N : ℕ) : ℝ ` | noncomputable; no section variables; binders explicit above | PS.7.1: N=0 excluded from bound; lambda=0,1/2,1 checked; real body read; README scope in target table |
| 252 | Layer PS.7: certified computations and the research boundary | `theorem legendre_radicand_lower (lam u : ℝ) (hlam : 0 < lam ∧ lam < 1) (hu : u ∈ Set.Icc (0 : ℝ) 1) : (1 - lam) * (1 + u ^ 2) ^ 2 ≤ legendreRadicand lam u ` | noncomputable; no section variables; binders explicit above | PS.7.1: N=0 excluded from bound; lambda=0,1/2,1 checked; signature read, no Lean run |
| 257 | Layer PS.7: certified computations and the research boundary | `theorem legendre_endpoint_integrable (lam : ℝ) (hlam : 0 < lam ∧ lam < 1) : IntervalIntegrable (fun t : ℝ => 1 / Real.sqrt ((1 - t ^ 2) * (1 - lam * t ^ 2))) volume 0 1 ` | noncomputable; no section variables; binders explicit above | PS.7.1: N=0 excluded from bound; lambda=0,1/2,1 checked; signature read, no Lean run |
| 262 | Layer PS.7: certified computations and the research boundary | `theorem legendre_substitution (lam : ℝ) (hlam : 0 < lam ∧ lam < 1) : legendreK lam = ∫ u in (0 : ℝ)..1, legendreIntegrand lam u ` | noncomputable; no section variables; binders explicit above | PS.7.1: N=0 excluded from bound; lambda=0,1/2,1 checked; signature read, no Lean run |
| 266 | Layer PS.7: certified computations and the research boundary | `theorem legendre_midpoint_error (lam : ℝ) (hlam : 0 < lam ∧ lam < 1) (N : ℕ) (hN : 0 < N) : ∣legendreK lam - legendreMidpoint lam N∣ ≤ 2 / ((N : ℝ) * (1 - lam) * Real.sqrt (1 - lam)) ` | noncomputable; no section variables; binders explicit above | PS.7.1: N=0 excluded from bound; lambda=0,1/2,1 checked; signature read, no Lean run |
| 271 | Layer PS.7: certified computations and the research boundary | `example (u : ℝ) : legendreRadicand (1 / 2) u = 1 + u ^ 4 ` | noncomputable; no section variables; binders explicit above | PS.7.1: N=0 excluded from bound; lambda=0,1/2,1 checked; proof read, not elaborated |
| 276 | Layer PS.7: certified computations and the research boundary | `example : legendreRadicand 1 1 = 0 ` | noncomputable; no section variables; binders explicit above | PS.7.1: N=0 excluded from bound; lambda=0,1/2,1 checked; proof read, not elaborated |
| 284 | Quartic | `def quarticPolynomial (t : ℂ) (x : Fin 4 → ℂ) : ℂ ` | noncomputable; no section variables; binders explicit above | PS.8.1–8.11: matrix/series and reflection arithmetic checked; real body read; README scope in target table |
| 286 | Quartic | `example (x : Fin 4 → ℂ) : quarticPolynomial 0 x = ∑ i, x i ^ 4 ` | noncomputable; no section variables; binders explicit above | PS.8.1–8.11: matrix/series and reflection arithmetic checked; proof read, not elaborated |
| 291 | Quartic | `def quarticResidueChart (t : ℂ) (z : Fin 3 → ℂ) : ℂ ` | noncomputable; no section variables; binders explicit above | PS.8.1–8.11: matrix/series and reflection arithmetic checked; real body read; README scope in target table |
| 296 | Quartic | `def quarticPulledOperatorCoefficients (t : ℂ) : Fin 4 → ℂ ` | noncomputable; no section variables; binders explicit above | PS.8.1–8.11: matrix/series and reflection arithmetic checked; real body read; README scope in target table |
| 300 | Quartic | `example : quarticPulledOperatorCoefficients 1 0 = (-3 / 32 : ℂ) ` | noncomputable; no section variables; binders explicit above | PS.8.1–8.11: matrix/series and reflection arithmetic checked; proof read, not elaborated |
| 304 | Quartic | `def quarticGram : Matrix (Fin 3) (Fin 3) ℤ ` | noncomputable; no section variables; binders explicit above | PS.8.1–8.11: matrix/series and reflection arithmetic checked; real body read; README scope in target table |
| 307 | Quartic | `def quarticPeriodLine (p : ℂ) : Fin 3 → ℂ ` | noncomputable; no section variables; binders explicit above | PS.8.1–8.11: matrix/series and reflection arithmetic checked; real body read; README scope in target table |
| 309 | Quartic | `example : quarticGram.det = -4 ` | noncomputable; no section variables; binders explicit above | PS.8.1–8.11: matrix/series and reflection arithmetic checked; proof read, not elaborated |
| 313 | Quartic | `theorem quarticPeriodLine_isotropic (p : ℂ) : dotProduct (quarticPeriodLine p) ((quarticGram.map (Int.cast : ℤ → ℂ)).mulVec (quarticPeriodLine p)) = 0 ` | noncomputable; no section variables; binders explicit above | PS.8.1–8.11: matrix/series and reflection arithmetic checked; signature read, no Lean run |
| 320 | Quartic | `def quarticMonodromy (i : Fin 5) : Matrix (Fin 3) (Fin 3) ℤ ` | noncomputable; no section variables; binders explicit above | PS.8.1–8.11: matrix/series and reflection arithmetic checked; real body read; README scope in target table |
| 325 | Quartic | `theorem quarticMonodromy_isometry (i : Fin 5) : (quarticMonodromy i).transpose * quarticGram * quarticMonodromy i = quarticGram ` | noncomputable; no section variables; binders explicit above | PS.8.1–8.11: matrix/series and reflection arithmetic checked; signature read, no Lean run |
| 329 | Quartic | `theorem quarticMonodromy_product : quarticMonodromy 4 * quarticMonodromy 3 * quarticMonodromy 2 * quarticMonodromy 1 * quarticMonodromy 0 = 1 ` | noncomputable; no section variables; binders explicit above | PS.8.1–8.11: matrix/series and reflection arithmetic checked; signature read, no Lean run |
| 335 | Quartic | `theorem quarticMonodromy_infinity_unipotent : (quarticMonodromy 4 - 1) ^ 3 = 0 ∧ (quarticMonodromy 4 - 1) ^ 2 ≠ 0 ` | noncomputable; no section variables; binders explicit above | PS.8.1–8.11: matrix/series and reflection arithmetic checked; signature read, no Lean run |
| 340 | Quartic | `def harmonic (n r : ℕ) : ℚ ` | noncomputable; no section variables; binders explicit above | PS.8.1–8.11: matrix/series and reflection arithmetic checked; real body read; README scope in target table |
| 343 | Quartic | `def quarticA (n : ℕ) : ℚ ` | noncomputable; no section variables; binders explicit above | PS.8.1–8.11: matrix/series and reflection arithmetic checked; real body read; README scope in target table |
| 346 | Quartic | `def quarticG (n : ℕ) : ℚ ` | noncomputable; no section variables; binders explicit above | PS.8.1–8.11: matrix/series and reflection arithmetic checked; real body read; README scope in target table |
| 349 | Quartic | `def quarticH (n : ℕ) : ℚ ` | noncomputable; no section variables; binders explicit above | PS.8.1–8.11: matrix/series and reflection arithmetic checked; real body read; README scope in target table |
| 354 | Quartic | `def quarticFrobeniusSeries : Fin 3 → PowerSeries ℚ ` | noncomputable; no section variables; binders explicit above | PS.8.1–8.11: matrix/series and reflection arithmetic checked; real body read; README scope in target table |
| 357 | Quartic | `theorem quarticA_recurrence (n : ℕ) : ((n + 1 : ℕ) : ℚ) ^ 3 * quarticA (n + 1) = 4 * (4 * n + 1) * (4 * n + 2) * (4 * n + 3) * quarticA n ` | noncomputable; no section variables; binders explicit above | PS.8.1–8.11: matrix/series and reflection arithmetic checked; signature read, no Lean run |
| 362 | Quartic | `example : quarticA 1 = 24 ∧ quarticA 2 = 2520 ∧ quarticG 1 = 104 ` | noncomputable; no section variables; binders explicit above | PS.8.1–8.11: matrix/series and reflection arithmetic checked; proof read, not elaborated |
| 366 | Quartic | `def quarticW0 (z : ℂ) : ℂ ` | noncomputable; no section variables; binders explicit above | PS.8.1–8.11: matrix/series and reflection arithmetic checked; real body read; README scope in target table |
| 369 | Quartic | `theorem quartic_symmetric_square (z : ℂ) (hz : ‖256 * z‖ < 1) : quarticW0 z = (ordinaryHypergeometric (𝕂 ` | noncomputable; no section variables; binders explicit above | PS.8.1–8.11: matrix/series and reflection arithmetic checked; signature read, no Lean run |
| 374 | Quartic | `def quarticMirrorCoordinate : PowerSeries ℚ ` | noncomputable; no section variables; binders explicit above | PS.8.1–8.11: matrix/series and reflection arithmetic checked; real body read; README scope in target table |
| 379 | Quartic | `theorem quarticMirror_integral : (∀ n : ℕ, ∃ a : ℤ, PowerSeries.coeff n quarticMirrorCoordinate = a) ∧ ∃ g : PowerSeries ℚ, quarticMirrorCoordinate.subst g = PowerSeries.X ∧ g.subst quarticMirrorCoordinate = PowerSeries.X ∧ ∀ n : ℕ, ∃ a : ℤ, PowerSeries.coeff n g = a ` | noncomputable; no section variables; binders explicit above | PS.8.1–8.11: matrix/series and reflection arithmetic checked; signature read, no Lean run |
| 386 | Quartic | `theorem quarticMirrorCoordinate_coeff : PowerSeries.coeff 1 quarticMirrorCoordinate = 1 ∧ PowerSeries.coeff 2 quarticMirrorCoordinate = 104 ∧ PowerSeries.coeff 3 quarticMirrorCoordinate = 15188 ` | noncomputable; no section variables; binders explicit above | PS.8.1–8.11: matrix/series and reflection arithmetic checked; signature read, no Lean run |
| 393 | Quartic | `theorem quarticLocalRatio_reflection (u v : ℂ) (huv : u + v ≠ 0) (huv' : u - v ≠ 0) : Complex.I / (Real.sqrt 2 : ℂ) * (u - v) / (u + v) = -1 / (2 * (Complex.I / (Real.sqrt 2 : ℂ) * (u + v) / (u - v))) ` | noncomputable; no section variables; binders explicit above | PS.8.1–8.11: matrix/series and reflection arithmetic checked; signature read, no Lean run |
| 400 | Quartic | `theorem quarticGamma4_conjugate (p : ℂ) (hp : p ≠ 1) : 1 - 1 / (2 * (p - 1)) = (3 - 2 * p) / (2 - 2 * p) ` | noncomputable; no section variables; binders explicit above | PS.8.1–8.11: matrix/series and reflection arithmetic checked; signature read, no Lean run |
| 413 | Quintic | `def quinticPolynomial {K : Type*} [CommRing K] (l : K) (x : Fin 5 → K) : K ` | noncomputable; no section variables; binders explicit above | PS.8.12–8.17: matrices at p=0,1,2,3,5; residues and scaling checked; real body read; README scope in target table |
| 417 | Quintic | `example {K : Type*} [CommRing K] (x : Fin 5 → K) : quinticPolynomial 0 x = ∏ i, x i ` | noncomputable; no section variables; binders explicit above | PS.8.12–8.17: matrices at p=0,1,2,3,5; residues and scaling checked; proof read, not elaborated |
| 422 | Quintic | `example : quinticPolynomial (-1 / 5 : ℚ) (fun _ => 1) = 0 ∧ quinticPolynomial (1 / 5 : ℚ) (fun _ => 1) = 2 ` | noncomputable; no section variables; binders explicit above | PS.8.12–8.17: matrices at p=0,1,2,3,5; residues and scaling checked; proof read, not elaborated |
| 428 | Quintic | `def quinticDerivativeMonomialMatrix : Matrix (Fin 4) (Fin 4) ℤ ` | noncomputable; no section variables; binders explicit above | PS.8.12–8.17: matrices at p=0,1,2,3,5; residues and scaling checked; real body read; README scope in target table |
| 431 | Quintic | `theorem quinticDerivativeMonomialMatrix_det : quinticDerivativeMonomialMatrix.det = 1 ` | noncomputable; no section variables; binders explicit above | PS.8.12–8.17: matrices at p=0,1,2,3,5; residues and scaling checked; signature read, no Lean run |
| 434 | Quintic | `example : (fun i => quinticDerivativeMonomialMatrix i 3) = ![-1, -7, -6, -1] ` | noncomputable; no section variables; binders explicit above | PS.8.12–8.17: matrices at p=0,1,2,3,5; residues and scaling checked; proof read, not elaborated |
| 437 | Quintic | `example : (quinticDerivativeMonomialMatrix.map (Int.castRingHom (ZMod 3))).det = 1 ∧ (quinticDerivativeMonomialMatrix.map (Int.castRingHom (ZMod 7))).det = 1 ` | noncomputable; no section variables; binders explicit above | PS.8.12–8.17: matrices at p=0,1,2,3,5; residues and scaling checked; proof read, not elaborated |
| 444 | Quintic | `def quinticDerivativeResidueMatrix : Matrix (Fin 4) (Fin 4) ℤ ` | noncomputable; no section variables; binders explicit above | PS.8.12–8.17: matrices at p=0,1,2,3,5; residues and scaling checked; real body read; README scope in target table |
| 447 | Quintic | `theorem quinticDerivativeResidueMatrix_det : quinticDerivativeResidueMatrix.det = 12 ` | noncomputable; no section variables; binders explicit above | PS.8.12–8.17: matrices at p=0,1,2,3,5; residues and scaling checked; signature read, no Lean run |
| 450 | Quintic | `example : (fun i => quinticDerivativeResidueMatrix i 3) = ![-1, 7, -12, 6] ` | noncomputable; no section variables; binders explicit above | PS.8.12–8.17: matrices at p=0,1,2,3,5; residues and scaling checked; proof read, not elaborated |
| 453 | Quintic | `example : (quinticDerivativeResidueMatrix.map (Int.castRingHom (ZMod 3))).det = 0 ∧ (quinticDerivativeResidueMatrix.map (Int.castRingHom (ZMod 7))).det = 5 ` | noncomputable; no section variables; binders explicit above | PS.8.12–8.17: matrices at p=0,1,2,3,5; residues and scaling checked; proof read, not elaborated |
| 459 | Quintic | `def quinticConnectionMatrix (l : ℚ) : Matrix (Fin 4) (Fin 4) ℚ ` | noncomputable; no section variables; binders explicit above | PS.8.12–8.17: matrices at p=0,1,2,3,5; residues and scaling checked; real body read; README scope in target table |
| 464 | Quintic | `def quinticBoundaryPairing {K : Type*} [CommRing K] (Y : K) : Matrix (Fin 4) (Fin 4) K ` | noncomputable; no section variables; binders explicit above | PS.8.12–8.17: matrices at p=0,1,2,3,5; residues and scaling checked; real body read; README scope in target table |
| 468 | Quintic | `def quinticBoundaryMatrix {K : Type*} [Field K] (p : ℕ) (δ : K) : Matrix (Fin 4) (Fin 4) K ` | noncomputable; no section variables; binders explicit above | PS.8.12–8.17: matrices at p=0,1,2,3,5; residues and scaling checked; real body read; README scope in target table |
| 473 | Quintic | `example : (quinticBoundaryMatrix 3 (0 : ℚ)) 0 0 = 27 ∧ ((3 : ℚ) • quinticBoundaryMatrix 3 (0 : ℚ)) 0 0 = 81 ` | noncomputable; no section variables; binders explicit above | PS.8.12–8.17: matrices at p=0,1,2,3,5; residues and scaling checked; proof read, not elaborated |
| 479 | Quintic | `example : (quinticBoundaryMatrix 3 (25 / 648 : ℚ)) 3 0 = 1 ∧ ((Matrix.diagonal (![1 / 3, 1, 1, 1] : Fin 4 → ℚ)) * quinticBoundaryMatrix 3 (25 / 648 : ℚ) * Matrix.diagonal (![3, 1, 1, 1] : Fin 4 → ℚ)) 3 0 = 3 ` | noncomputable; no section variables; binders explicit above | PS.8.12–8.17: matrices at p=0,1,2,3,5; residues and scaling checked; proof read, not elaborated |
| 491 | Quintic | `theorem quinticBoundary_horizontal {K : Type*} [Field K] [Algebra ℚ K] (p : ℕ) (δ : K) : (quinticConnectionMatrix 0).map (algebraMap ℚ K) * quinticBoundaryMatrix p δ = (p : K) • (quinticBoundaryMatrix p δ * (quinticConnectionMatrix 0).map (algebraMap ℚ K)) ` | noncomputable; no section variables; binders explicit above | PS.8.12–8.17: matrices at p=0,1,2,3,5; residues and scaling checked; signature read, no Lean run |
| 497 | Quintic | `theorem quinticBoundary_pairing {K : Type*} [Field K] (p : ℕ) (δ Y : K) : (quinticBoundaryMatrix p δ).transpose * quinticBoundaryPairing Y * quinticBoundaryMatrix p δ = (p : K) ^ 3 • quinticBoundaryPairing Y ` | noncomputable; no section variables; binders explicit above | PS.8.12–8.17: matrices at p=0,1,2,3,5; residues and scaling checked; signature read, no Lean run |
| 503 | Quintic | `theorem quinticResidue_nilpotent : (quinticConnectionMatrix 0) ^ 4 = 0 ∧ (quinticConnectionMatrix 0) ^ 3 ≠ 0 ` | noncomputable; no section variables; binders explicit above | PS.8.12–8.17: matrices at p=0,1,2,3,5; residues and scaling checked; signature read, no Lean run |
| 508 | Quintic | `def dworkSeries (p : ℕ) : PowerSeries ℚ ` | noncomputable; no section variables; binders explicit above | PS.8.15: recurrence and valuation p=2,3,5,7; R10; real body read; README scope in target table |
| 512 | Quintic | `def dworkCoeff (p n : ℕ) : ℚ ` | noncomputable; no section variables; binders explicit above | PS.8.15: recurrence and valuation p=2,3,5,7; R10; real body read; README scope in target table |
| 515 | Quintic | `def dworkPairWeight (n : ℕ) : ℚ ` | noncomputable; no section variables; binders explicit above | PS.8.15: recurrence and valuation p=2,3,5,7; R10; real body read; README scope in target table |
| 518 | Quintic | `theorem dworkCoeff_recurrence (p : ℕ) (hp : 2 ≤ p) (n : ℕ) : ((n + 1 : ℕ) : ℚ) * dworkCoeff p (n + 1) = dworkCoeff p n + if p ≤ n + 1 then dworkCoeff p (n + 1 - p) else 0 ` | noncomputable; no section variables; binders explicit above | PS.8.15: recurrence and valuation p=2,3,5,7; R10; signature read, no Lean run |
| 523 | Quintic | `theorem dworkCoeff_two (p : ℕ) (hp : 3 ≤ p) : dworkCoeff p 2 = 1 / 2 ` | noncomputable; no section variables; binders explicit above | PS.8.15: recurrence and valuation p=2,3,5,7; R10; signature read, no Lean run |
| 527 | Quintic | `theorem dworkSigma0_summable (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) : Summable (fun n : ℕ => ((dworkCoeff p (n + 1) * (n.factorial : ℚ) : ℚ) : ℚ_[p])) ` | noncomputable; no section variables; binders explicit above | PS.8.15: recurrence and valuation p=2,3,5,7; R10; signature read, no Lean run |
| 532 | Quintic | `theorem dworkSigma2_summable (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) : Summable (fun n : ℕ => ((dworkCoeff p (n + 1) * (n.factorial : ℚ) * dworkPairWeight (n + 1) : ℚ) : ℚ_[p])) ` | noncomputable; no section variables; binders explicit above | PS.8.15: recurrence and valuation p=2,3,5,7; R10; signature read, no Lean run |
| 544 | MZV | `def PositiveIndex (k : List ℕ) : Prop ` | noncomputable; no section variables; binders explicit above | PS.9: empty/divergent indices, reversal, shuffle/stuffle, weights0..8 checked; real body read; README scope in target table |
| 547 | MZV | `def Admissible (k : List ℕ) : Prop ` | noncomputable; no section variables; binders explicit above | PS.9: empty/divergent indices, reversal, shuffle/stuffle, weights0..8 checked; real body read; README scope in target table |
| 550 | MZV | `def DescendingTuple (k : List ℕ) ` | noncomputable; no section variables; binders explicit above | PS.9: empty/divergent indices, reversal, shuffle/stuffle, weights0..8 checked; real body read; README scope in target table |
| 554 | MZV | `def mzvTerm (k : List ℕ) (n : DescendingTuple k) : ℝ ` | noncomputable; no section variables; binders explicit above | PS.9: empty/divergent indices, reversal, shuffle/stuffle, weights0..8 checked; real body read; README scope in target table |
| 558 | MZV | `def multipleZeta (k : List ℕ) : ℝ ` | noncomputable; no section variables; binders explicit above | PS.9: empty/divergent indices, reversal, shuffle/stuffle, weights0..8 checked; real body read; README scope in target table |
| 560 | MZV | `theorem mzv_summable_iff (k : List ℕ) (hk : PositiveIndex k) : Summable (mzvTerm k) ↔ Admissible k ` | noncomputable; no section variables; binders explicit above | PS.9: empty/divergent indices, reversal, shuffle/stuffle, weights0..8 checked; signature read, no Lean run |
| 564 | MZV | `theorem mzv_depth_one (n : ℕ) (hn : 2 ≤ n) : multipleZeta [n] = (riemannZeta (n : ℂ)).re ` | noncomputable; no section variables; binders explicit above | PS.9: empty/divergent indices, reversal, shuffle/stuffle, weights0..8 checked; signature read, no Lean run |
| 567 | MZV | `theorem multipleZeta_nil : multipleZeta [] = 1 ` | noncomputable; no section variables; binders explicit above | PS.9: empty/divergent indices, reversal, shuffle/stuffle, weights0..8 checked; signature read, no Lean run |
| 570 | MZV | `theorem multipleZeta_two : multipleZeta [2] = Real.pi ^ 2 / 6 ` | noncomputable; no section variables; binders explicit above | PS.9: empty/divergent indices, reversal, shuffle/stuffle, weights0..8 checked; signature read, no Lean run |
| 574 | MZV | `theorem mzvTerm_one_not_summable : ¬ Summable (mzvTerm [1]) ` | noncomputable; no section variables; binders explicit above | PS.9: empty/divergent indices, reversal, shuffle/stuffle, weights0..8 checked; signature read, no Lean run |
| 578 | MZV | `example : Admissible [2, 1] ∧ ¬ Admissible [1] ` | noncomputable; no section variables; binders explicit above | PS.9: empty/divergent indices, reversal, shuffle/stuffle, weights0..8 checked; proof read, not elaborated |
| 584 | MZV | `def mzvEncode : List ℕ → List Bool ∣ [] => [] ∣ k :: ks => List.replicate (k - 1) false ++ true :: mzvEncode ks  /-- Decoding a word into the index, counting the letters `0` before each `1`. -/ def mzvDecodeAux : ℕ → List Bool → List ℕ ∣ _, [] => [] ∣ c, false :: w => mzvDecodeAux (c + 1) w ∣ c, true :: w => (c + 1) :: mzvDecodeAux 0 w  def mzvDecode (w : List Bool) : List ℕ ` | noncomputable; no section variables; binders explicit above | PS.9: empty/divergent indices, reversal, shuffle/stuffle, weights0..8 checked; real body read; README scope in target table |
| 589 | MZV | `def mzvDecodeAux : ℕ → List Bool → List ℕ ∣ _, [] => [] ∣ c, false :: w => mzvDecodeAux (c + 1) w ∣ c, true :: w => (c + 1) :: mzvDecodeAux 0 w  def mzvDecode (w : List Bool) : List ℕ ` | noncomputable; no section variables; binders explicit above | PS.9: empty/divergent indices, reversal, shuffle/stuffle, weights0..8 checked; real body read; README scope in target table |
| 594 | MZV | `def mzvDecode (w : List Bool) : List ℕ ` | noncomputable; no section variables; binders explicit above | PS.9: empty/divergent indices, reversal, shuffle/stuffle, weights0..8 checked; real body read; README scope in target table |
| 597 | MZV | `def shuffles {α : Type*} : List α → List α → List (List α) ∣ [], l => [l] ∣ a :: u, [] => [a :: u] ∣ a :: u, b :: v => (shuffles u (b :: v)).map (a :: ·) ++ (shuffles (a :: u) v).map (b :: ·)  /-- The stuffle (quasi-shuffle) of two indices, with the merge term `(a + b) :: (u * v)`. -/ def stuffles : List ℕ → List ℕ → List (List ℕ) ∣ [], l => [l] ∣ a :: u, [] => [a :: u] ∣ a :: u, b :: v => (stuffles u (b :: v)).map (a :: ·) ++ (stuffles (a :: u) v).map (b :: ·) ++ (stuffles u v).map ((a + b) :: ·)  example : mzvEncode [2, 1] = [false, true, true] ` | noncomputable; no section variables; binders explicit above | PS.9: empty/divergent indices, reversal, shuffle/stuffle, weights0..8 checked; proof read, not elaborated |
| 604 | MZV | `def stuffles : List ℕ → List ℕ → List (List ℕ) ∣ [], l => [l] ∣ a :: u, [] => [a :: u] ∣ a :: u, b :: v => (stuffles u (b :: v)).map (a :: ·) ++ (stuffles (a :: u) v).map (b :: ·) ++ (stuffles u v).map ((a + b) :: ·)  example : mzvEncode [2, 1] = [false, true, true] ` | noncomputable; no section variables; binders explicit above | PS.9: empty/divergent indices, reversal, shuffle/stuffle, weights0..8 checked; proof read, not elaborated |
| 611 | MZV | `example : mzvEncode [2, 1] = [false, true, true] ` | noncomputable; no section variables; binders explicit above | PS.9: empty/divergent indices, reversal, shuffle/stuffle, weights0..8 checked; proof read, not elaborated |
| 613 | MZV | `example : mzvDecode (mzvEncode [3, 1, 2]) = [3, 1, 2] ` | noncomputable; no section variables; binders explicit above | PS.9: empty/divergent indices, reversal, shuffle/stuffle, weights0..8 checked; proof read, not elaborated |
| 615 | MZV | `example : stuffles [2] [2] = [[2, 2], [2, 2], [4]] ` | noncomputable; no section variables; binders explicit above | PS.9: empty/divergent indices, reversal, shuffle/stuffle, weights0..8 checked; proof read, not elaborated |
| 619 | MZV | `example : ((shuffles [false, true] [false, true]).count [false, false, true, true] = 4) ∧ ((shuffles [false, true] [false, true]).count [false, true, false, true] = 2) ` | noncomputable; no section variables; binders explicit above | PS.9: empty/divergent indices, reversal, shuffle/stuffle, weights0..8 checked; proof read, not elaborated |
| 624 | MZV | `theorem mzv_stuffle (k l : List ℕ) (hk : Admissible k) (hl : Admissible l) : multipleZeta k * multipleZeta l = ((stuffles k l).map multipleZeta).sum ` | noncomputable; no section variables; binders explicit above | PS.9: empty/divergent indices, reversal, shuffle/stuffle, weights0..8 checked; signature read, no Lean run |
| 629 | MZV | `theorem mzv_shuffle (k l : List ℕ) (hk : Admissible k) (hl : Admissible l) : multipleZeta k * multipleZeta l = ((shuffles (mzvEncode k) (mzvEncode l)).map (fun w => multipleZeta (mzvDecode w))).sum ` | noncomputable; no section variables; binders explicit above | PS.9: empty/divergent indices, reversal, shuffle/stuffle, weights0..8 checked; signature read, no Lean run |
| 634 | MZV | `theorem convergent_double_shuffle : multipleZeta [2] ^ 2 = 4 * multipleZeta [3, 1] + 2 * multipleZeta [2, 2] ∧ multipleZeta [2] ^ 2 = 2 * multipleZeta [2, 2] + multipleZeta [4] ` | noncomputable; no section variables; binders explicit above | PS.9: empty/divergent indices, reversal, shuffle/stuffle, weights0..8 checked; signature read, no Lean run |
| 640 | MZV | `theorem mzv_two_one : multipleZeta [2, 1] = multipleZeta [3] ` | noncomputable; no section variables; binders explicit above | PS.9: empty/divergent indices, reversal, shuffle/stuffle, weights0..8 checked; signature read, no Lean run |
| 644 | MZV | `def zagierCoeff (a b r : ℕ) : ℚ ` | noncomputable; no section variables; binders explicit above | PS.9: empty/divergent indices, reversal, shuffle/stuffle, weights0..8 checked; real body read; README scope in target table |
| 649 | MZV | `def oneThree (a b : ℕ) : List ℕ ` | noncomputable; no section variables; binders explicit above | PS.9: empty/divergent indices, reversal, shuffle/stuffle, weights0..8 checked; real body read; README scope in target table |
| 651 | MZV | `example : zagierCoeff 0 0 1 = 1 ∧ zagierCoeff 1 0 1 = -2 ∧ zagierCoeff 1 0 2 = 9 / 2 ` | noncomputable; no section variables; binders explicit above | PS.9: empty/divergent indices, reversal, shuffle/stuffle, weights0..8 checked; proof read, not elaborated |
| 655 | MZV | `theorem zagier_evaluation (a b : ℕ) : multipleZeta (oneThree a b) = ∑ r ∈ Finset.range (a + b + 1), (zagierCoeff a b (r + 1) : ℝ) * multipleZeta [2 * (r + 1) + 1] * multipleZeta (List.replicate (a + b - r) 2) ` | noncomputable; no section variables; binders explicit above | PS.9: empty/divergent indices, reversal, shuffle/stuffle, weights0..8 checked; signature read, no Lean run |
| 663 | MZV | `example : (!![zagierCoeff 0 1 1, zagierCoeff 0 1 2; zagierCoeff 1 0 1, zagierCoeff 1 0 2] : Matrix (Fin 2) (Fin 2) ℚ).det = 5 / 2 ` | noncomputable; no section variables; binders explicit above | PS.9: empty/divergent indices, reversal, shuffle/stuffle, weights0..8 checked; proof read, not elaborated |
| 668 | MZV | `def IsHoffman (k : List ℕ) : Prop ` | noncomputable; no section variables; binders explicit above | PS.9: empty/divergent indices, reversal, shuffle/stuffle, weights0..8 checked; real body read; README scope in target table |
| 671 | MZV | `def hoffmanDim : ℕ → ℕ ∣ 0 => 1 ∣ 1 => 0 ∣ 2 => 1 ∣ n + 3 => hoffmanDim (n + 1) + hoffmanDim n  example : [0, 1, 2, 3, 4, 5, 6, 7, 8].map hoffmanDim = [1, 0, 1, 1, 1, 2, 2, 3, 4] ` | noncomputable; no section variables; binders explicit above | PS.9: empty/divergent indices, reversal, shuffle/stuffle, weights0..8 checked; proof read, not elaborated |
| 677 | MZV | `example : [0, 1, 2, 3, 4, 5, 6, 7, 8].map hoffmanDim = [1, 0, 1, 1, 1, 2, 2, 3, 4] ` | noncomputable; no section variables; binders explicit above | PS.9: empty/divergent indices, reversal, shuffle/stuffle, weights0..8 checked; proof read, not elaborated |
| 681 | MZV | `theorem hoffman_count (N : ℕ) : {w : List ℕ ∣ IsHoffman w ∧ w.sum = N}.ncard = hoffmanDim N ` | noncomputable; no section variables; binders explicit above | PS.9: empty/divergent indices, reversal, shuffle/stuffle, weights0..8 checked; signature read, no Lean run |
| 685 | MZV | `theorem numerical_spanning (k : List ℕ) (hk : Admissible k) : multipleZeta k ∈ Submodule.span ℚ {x : ℝ ∣ ∃ w : List ℕ, IsHoffman w ∧ w.sum = k.sum ∧ x = multipleZeta w} ` | noncomputable; no section variables; binders explicit above | PS.9: empty/divergent indices, reversal, shuffle/stuffle, weights0..8 checked; signature read, no Lean run |
| 692 | MZV | `theorem mzv_span_finrank_le (N : ℕ) : Module.Finite ℚ (Submodule.span ℚ {x : ℝ ∣ ∃ k : List ℕ, Admissible k ∧ k.sum = N ∧ x = multipleZeta k}) ∧ Module.finrank ℚ (Submodule.span ℚ {x : ℝ ∣ ∃ k : List ℕ, Admissible k ∧ k.sum = N ∧ x = multipleZeta k}) ≤ hoffmanDim N ` | noncomputable; no section variables; binders explicit above | PS.9: empty/divergent indices, reversal, shuffle/stuffle, weights0..8 checked; signature read, no Lean run |

### Bold-item inventory

The README uses numbered headings and API lists for its targets; bold text chiefly marks Checks, conventions and suppliers. Every bold item is included here to make coverage explicit.

| Line | Bold item | Target block / audit |
|---|---|---|
| 3 | Summary. | All target blocks read; R02–R05 affect scope |
| 24 | TauCetiRoadmap EllipticCurves | Supplier/convention audit; R01–R04,R11 |
| 25 | TauCetiRoadmap ModularForms | Supplier/convention audit; R01–R04,R11 |
| 26 | BorelRegulators Layer 8 and EllipticRegulators ER.5 | Supplier/convention audit; R01–R04,R11 |
| 27 | TauCetiRoadmap NumberFieldArithmetic | Supplier/convention audit; R01–R04,R11 |
| 28 | TauCetiRoadmap PadicMeasuresIwasawaAlgebras | Supplier/convention audit; R01–R04,R11 |
| 29 | TauCetiRoadmap ClassicalArithmeticCompletion | Supplier/convention audit; R01–R04,R11 |
| 30 | TauCetiRoadmap IntegralLattices | Supplier/convention audit; R01–R04,R11 |
| 31 | TauCetiRoadmap SchemeAndStackFoundations | Supplier/convention audit; R01–R04,R11 |
| 31 | TauCetiRoadmap StableReduction | Supplier/convention audit; R01–R04,R11 |
| 32 | TauCetiRoadmap IntegralHeckeAndGaloisDeterminants | Supplier/convention audit; R01–R04,R11 |
| 51 | Comparison direction. | Supplier/convention audit; R01–R04,R11 |
| 53 | Tate objects. | Supplier/convention audit; R01–R04,R11 |
| 55 | Euler factors and Gamma factors. | Supplier/convention audit; R01–R04,R11 |
| 57 | Determinants. | Supplier/convention audit; R01–R04,R11 |
| 59 | The quartic. | Supplier/convention audit; R01–R04,R11 |
| 61 | The quintic. | Supplier/convention audit; R01–R04,R11 |
| 63 | Multiple zeta values. | Supplier/convention audit; R01–R04,R11 |
| 65 | Normalization checks. | Supplier/convention audit; R01–R04,R11 |
| 120 | Arbitrary pairs. | Supplier/convention audit; R01–R04,R11 |
| 180 | Virtual objects. | Supplier/convention audit; R01–R04,R11 |
| 204 | Proper one-parameter logarithmic comparison | Supplier/convention audit; R01–R04,R11 |
| 244 | Checks. | PS.0.1; boundary audit in target table |
| 262 | Checks. | PS.0.2; boundary audit in target table |
| 278 | Checks. | PS.0.3; boundary audit in target table |
| 297 | Checks. | PS.0.4; boundary audit in target table |
| 331 | Checks. | PS.0.5; boundary audit in target table |
| 369 | Checks. | PS.1.1; boundary audit in target table |
| 388 | Checks. | PS.1.2; boundary audit in target table |
| 408 | Checks. | PS.1.3; boundary audit in target table |
| 427 | Checks. | PS.1.4; boundary audit in target table |
| 447 | Checks. | PS.1.5; boundary audit in target table |
| 465 | Checks. | PS.1.6; boundary audit in target table |
| 483 | Checks. | PS.1.7; boundary audit in target table |
| 502 | Checks. | PS.1.8; boundary audit in target table |
| 541 | Checks. | PS.2.1; boundary audit in target table |
| 561 | Checks. | PS.2.2; boundary audit in target table |
| 579 | Checks. | PS.2.3; boundary audit in target table |
| 620 | Checks. | PS.3.1; boundary audit in target table |
| 645 | Checks. | PS.3.2; boundary audit in target table |
| 663 | Checks. | PS.3.3; boundary audit in target table |
| 693 | Checks. | PS.4.1; boundary audit in target table |
| 717 | Checks. | PS.4.2; boundary audit in target table |
| 735 | Checks. | PS.4.3; boundary audit in target table |
| 753 | Checks. | PS.4.4; boundary audit in target table |
| 806 | Checks. | PS.5.1; boundary audit in target table |
| 827 | Checks. | PS.5.2; boundary audit in target table |
| 845 | Checks. | PS.5.3; boundary audit in target table |
| 864 | Checks. | PS.5.4; boundary audit in target table |
| 895 | Checks. | PS.6.1; boundary audit in target table |
| 919 | Checks. | PS.6.2; boundary audit in target table |
| 945 | Checks. | PS.6.3; boundary audit in target table |
| 964 | Checks. | PS.6.4; boundary audit in target table |
| 988 | Checks. | PS.6.5; boundary audit in target table |
| 1006 | Checks. | PS.6.6; boundary audit in target table |
| 1042 | Checks. | PS.6.7; boundary audit in target table |
| 1079 | Checks. | PS.7.1; boundary audit in target table |
| 1100 | Checks. | PS.7.2; boundary audit in target table |
| 1119 | Checks. | PS.7.3; boundary audit in target table |
| 1137 | Checks. | PS.7.4; boundary audit in target table |
| 1168 | Checks. | PS.8.1; boundary audit in target table |
| 1185 | Checks. | PS.8.2; boundary audit in target table |
| 1201 | Checks. | PS.8.3; boundary audit in target table |
| 1221 | Checks. | PS.8.4; boundary audit in target table |
| 1247 | Checks. | PS.8.5; boundary audit in target table |
| 1263 | Checks. | PS.8.6; boundary audit in target table |
| 1282 | Checks. | PS.8.7; boundary audit in target table |
| 1298 | Checks. | PS.8.8; boundary audit in target table |
| 1314 | Checks. | PS.8.9; boundary audit in target table |
| 1336 | Checks. | PS.8.10; boundary audit in target table |
| 1352 | Checks. | PS.8.11; boundary audit in target table |
| 1370 | Checks. | PS.8.12; boundary audit in target table |
| 1397 | Checks. | PS.8.13; boundary audit in target table |
| 1420 | Checks. | PS.8.14; boundary audit in target table |
| 1444 | Checks. | PS.8.15; boundary audit in target table |
| 1470 | Checks. | PS.8.16; boundary audit in target table |
| 1489 | Fixed-fibre projective map. | PS.8.17; associated target block read |
| 1502 | Residue coordinates and the small prime. | PS.8.17; associated target block read |
| 1513 | Checks. | PS.8.17; boundary audit in target table |
| 1558 | Checks. | PS.9.1; boundary audit in target table |
| 1576 | Checks. | PS.9.2; boundary audit in target table |
| 1593 | Checks. | PS.9.3; boundary audit in target table |
| 1609 | Checks. | PS.9.4; boundary audit in target table |
| 1625 | Checks. | PS.9.5; boundary audit in target table |
| 1641 | Checks. | PS.9.6; boundary audit in target table |
| 1657 | Checks. | PS.9.7; boundary audit in target table |
| 1673 | Checks. | PS.9.8; boundary audit in target table |
| 1689 | Checks. | PS.9.9; boundary audit in target table |
| 1707 | Checks. | PS.9.10; boundary audit in target table |
| 1723 | Checks. | PS.9.11; boundary audit in target table |
| 1745 | Checks. | PS.9.12; boundary audit in target table |
| 1761 | Checks. | PS.9.13; boundary audit in target table |
| 1777 | Checks. | PS.9.14; boundary audit in target table |
| 1801 | Checks. | PS.9.15; boundary audit in target table |
| 1815 | Checks. | PS.9.16; boundary audit in target table |
| 1837 | Checks. | PS.9.17; boundary audit in target table |
| 1854 | Checks. | PS.9.18; boundary audit in target table |
| 1870 | Checks. | PS.9.19; boundary audit in target table |
| 1887 | Checks. | PS.9.20; boundary audit in target table |
| 1903 | Checks. | PS.9.21; boundary audit in target table |
| 1919 | Checks. | PS.9.22; boundary audit in target table |
| 1935 | Checks. | PS.9.23; boundary audit in target table |
| 1957 | BCGP, §2.8, display after (2.8.5), p. 37. | Correction/normalization read; source status in locator table |
| 1958 | Deligne, Proposition–Definition 2.3(ii), English translation p. 10. | Correction/normalization read; source status in locator table |
| 1959 | BF, Remark 7, p. 534. | Correction/normalization read; source status in locator table |
| 1960 | BV, Corollary 5.7 (author's final version, internal p. 27). | Correction/normalization read; source status in locator table |
| 1961 | BV, Definition 2.5, Definition 3.7, Conjecture 4.1 and Remark 5.6 (published pp. 170–171, 177, 188, 194–195). | Correction/normalization read; source status in locator table |
| 1962 | BV, proof of Corollary 5.7 (published p. 196). | Correction/normalization read; source status in locator table |
| 1963 | BV, §5.2, map after (23) (published p. 193). | Correction/normalization read; source status in locator table |
| 1964 | Hartmann, Proposition 4.26 and Example 4.27 (arXiv v1, p. 21). | Correction/normalization read; source status in locator table |
| 1965 | Hartmann, Theorem 4.28 (p. 22). | Correction/normalization read; source status in locator table |
| 1966 | Hartmann, Theorem 4.12 (p. 15). | Correction/normalization read; source status in locator table |
| 1967 | Hartmann, proof of Theorem 4.29 (p. 23). | Correction/normalization read; source status in locator table |
| 1968 | Brown, proof of Lemma 3.8 (v1), p. 11. | Correction/normalization read; source status in locator table |
| 1969 | Shapiro, §§3.1–3.2 (v2), pp.3–4. | Correction/normalization read; source status in locator table |
| 1970 | Shapiro, §6 (v2). | Correction/normalization read; source status in locator table |
| 1974 | The Tate motive. | PS.9.23; associated target block read |
| 1975 | The Legendre curve y² = x(1 − x)(1 − x/2). | PS.9.23; associated target block read |
| 1976 | 11a1. | PS.9.23; associated target block read |
| 1977 | The quartic mirror map. | PS.9.23; associated target block read |
| 1978 | Weight five. | PS.9.23; associated target block read |
| 1992 | BCGP | Source status in locator table |
| 1993 | B | Source status in locator table |
| 1994 | BF | Source status in locator table |
| 1995 | BG | Source status in locator table |
| 1996 | BK | Source status in locator table |
| 1997 | BV | Source status in locator table |
| 1998 | Deligne | Source status in locator table |
| 1999 | DG | Source status in locator table |
| 2000 | H | Source status in locator table |
| 2001 | HMS | Source status in locator table |
| 2002 | HMS-book | Source status in locator table |
| 2003 | Huybrechts | Source status in locator table |
| 2004 | IKZ | Source status in locator table |
| 2005 | IL | Source status in locator table |
| 2006 | Johansson | Source status in locator table |
| 2007 | K | Source status in locator table |
| 2008 | LTXZZ | Source status in locator table |
| 2009 | LYA | Source status in locator table |
| 2010 | LYH | Source status in locator table |
| 2011 | NS | Source status in locator table |
| 2012 | Park | Source status in locator table |
| 2013 | Serre | Source status in locator table |
| 2014 | Qian | Source status in locator table |
| 2015 | SG | Source status in locator table |
| 2016 | SH | Source status in locator table |
| 2017 | SO | Source status in locator table |
| 2018 | SS | Source status in locator table |
| 2019 | Tate | Source status in locator table |
| 2020 | Z | Source status in locator table |

## Not verifiable

- **Tate, (3.4.3)–(3.4.7), printed p. 15 (PS.1.7).** The sources service did not return an approved readable copy from the cited scan or bibliographic retry. The single outstanding entry in the scratch `needs-references.toml` names this work and these locators. Its local-constant claims are not certified.
- **BG.** The service returned `uncertified` for the paywalled work. Its primary text was not read. BF Remark 10 supports only the restricted application recorded there; no stronger BG theorem is certified and no repeat reference request was added.
- **Serre's displayed formulas.** The available extraction locates §4.1 but drops the displayed equations. The exact printed formulas (26)–(29), (5)–(7) and C9 were not certified from that extraction. BCGP's readable (2.8.4)–(2.8.5), Conjecture 2.8.6 and Corollary 2.8.7 were checked separately. No missing-text request is made for an already available source.
- **Current contracts of earlier open suppliers whose heads were not supplied locally.** In particular: MotivesAndAlgebraicCycles MC.2–MC.6, ComplexComparisonPartII C5, ArithmeticGaloisRepresentations R01.2–R01.3, AutomorphicLFunctionsAndLocalFactors AL.1/3/4/5, NeronModelsAndSemistableAbelianVarieties §6.10, WeilConjectures WC.1–WC.2, EtaleDualityAndPerverseSheaves EDC.2, DirichletPadicLFunctions L0, ArithmeticGaloisDuality D7, SelmerIwasawaCohomology L2–L4, GeneralAlgebraicKTheory, NoncommutativeAndEquivariantIwasawa NE.7, CrystallineCohomology CR.5–CR.7, PadicDifferentialEquationsAndRigidCohomology RD sections, ModularCurvesPartII R13.3, and AnabelianGeometryAndNonabelianChabauty NC.2. Merge-order eligibility alone does not certify a section or its hypotheses. R03 relies on the package's explicit admission of missing extensions, not an invented account of unavailable supplier text. R02 concerns the different list with no permitted owner in the supplied main/order inputs.
- **Lean elaboration and exact inferred types.** No Lean command was authorized. All 139 declarations and proofs were read statically; the 102 arithmetic checks were independent calculations. The report does not certify tactic execution, import completeness or compilation after deleting the forbidden option.
- **Exhaustive library absence and remaining source locators.** The pinned-file table records positive API checks and the concrete stale path. It does not certify that every new object is absent from every file of both pinned libraries. Likewise, the 77 source-locator checks do not certify every locator in the bibliography or every source correction; unlisted locators remain unverified. The target table records the mathematical and dependency checks actually performed rather than treating source availability as verification.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "0555e5048982bba02b931f69b5d0cc0f24a6a2d8", "job": "RT-PeriodsAndSpecialValues~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
