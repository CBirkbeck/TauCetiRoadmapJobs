<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/63#issuecomment-6311058816 -->
Review (claude) of b335247

Verdict: accepted
Conditional on the announced gaps: `surface-projectivity`, `hypersurface-cohomology`, `oda-interface`, `surface-arithmetic-quotient`, `tame-linear-groups`, `elliptic-surface-geometry`, `artin-discriminant`, `witt-formal-brauer`, `crystalline-chern-derivative`, `cross-realization`, `integral-topology`, `tame-lefschetz`, `surface-quotient-resolutions`, `tame-quotient-singularities`, `quotient-transcendental-comparison`, `ruled-surface-two-forms`, `mathieu-permutation-model`, `mukai-eleven-groups-recognition`, `matsusaka-mumford`, `adjoint-positivity`, `exceptional-mathieu-embeddings`, `surface-brauer-localization`, `surface-brauer-kummer`, `equivariant-brauer-descent`, `rational-surface-cohomology`

1. **F01** (P3) Joined prose tokens remain after the spacing repair

   **Location.** Design README:548 ("prime toℓ", "modℓ", "oddℓ"), 561 ("degree≤B"), 595 ("pulls σ toσ"), 598 ("characteristic≠2"), 606 ("stabilize[L]"), 612 ("fixes[L]"), 632 ("bidegrees(1,1),(2,2)"), 665–666 ("Signature(1,21)", "signature(1,21)"), 913 ("Propositions 4.1,4.5", "Theorem(1.4)"), 928 ("Theorems(0.3),(0.6), Example(0.4)"), 977 ("Gram[2d]"), 1040 ("member of|L|"), 1062 ("pullback of[3] along[O(1)]"), 1096 ("of(X,λ)"), 100 ("length≤r+1"), 686 and 867 ("lines 1110–1132,1173–1183").

   **Claim.** The README is prose for mathematicians in house style; the round-5 repair of F03 removed every joined token.

   **Witness.** The strings above, verbatim at the lines given (the round-6 repair report's scan covered only word+numeral joins).

   **Exact repair.** One pass inserting a space between a word and a following symbol, bracket, inequality sign or list; no content change. The same strings appear in the mirrored plan prose and should be spaced there too.

2. **F02** (P3) Huybrechts reference bullet and manifest locator out of step with the body

   **Location.** Design README:1172 (the `huybrechts` bullet lists Chapters 1, 5, 15 and 17 only); manifest `huybrechts.locator` ("Ch. 2: §3.3, Rem. 3.13; Ch. 9: §§4–5; Ch. 11: Prop. 1.3(ii)"); manifest `rizov.locator`, `dolgachev-keum.locator`, `keum.locator`, `lang-nygaard.locator`, `nygaard-closedness.locator`, `enriques-one.locator`, `liedtke-surfaces.locator`, `stacks-projective-morphisms.locator` ("Theorem3.1.1", "Lemmas3.1.2 and3.1.6", "lines404,416,440,463", "Propositions2.1,2.2,2.4", "Corollary2.7", "lines17528–17594", "lines749–767", "lines4633–4640").

   **Claim.** The References and the manifest record exactly the works and locators the roadmap cites, in readable form.

   **Witness.** §6.0b (README:686), §6.0c (README:700), §6.7d (README:867) and the `gap:elliptic-surface-geometry` contract (README:84) cite Huybrechts Chapter 2 §3.3, Remark 3.13 and Chapter 11 Proposition 1.3(ii) (huybrechts lines 1110–1132, 1173–1183, 7879–7888), none of which the bullet lists; "Chapter 9" occurs nowhere in the README although the manifest locator lists "Ch. 9: §§4–5". The manifest locator strings carry the joined tokens quoted above.

   **Exact repair.** Add "Chapter 2 §3.3 and Remark 3.13, pp.32–34 (lines 1110–1132, 1173–1183); Chapter 11 Proposition 1.3(ii), p.208 (lines 7879–7888)" to the bullet; delete "Ch. 9: §§4–5" from `huybrechts.locator` (or attach it to a target that uses it); space the joined tokens in the manifest locator strings. No statement changes.

3. **F03** (P3) Characteristic hypothesis of the §6.0b primary locator not recorded

   **Location.** Design README:686, the locator of `IsK3.genusOnePencil_of_rank_ge_five`: "(huybrechts, Chapter 11 Proposition 1.3(ii), p.208, huybrechts lines 7879–7888; Chapter 2 §3.3 and Remark 3.13, pp.32–34, lines 1110–1132,1173–1183)".

   **Claim.** The statement is for every algebraically closed field, with the quasi-elliptic alternative in characteristics 2 and 3.

   **Witness.** huybrechts lines 7879–7880 state Proposition 1.3 under "char(k)≠2,3"; the all-characteristic genus-one statement is the Chapter 2 §3.3 passage at lines 1127–1132 (geometric generic fibre smooth or cuspidal, the latter only in characteristics 2 and 3). The README sentence is correct; the locator parenthesis does not say which citation carries which characteristic.

   **Exact repair.** Rewrite the parenthesis as "(huybrechts, Chapter 11 Proposition 1.3(ii), p.208, lines 7879–7888, stated there for char k≠2,3; the genus-one statement in every characteristic is Chapter 2 §3.3 and Remark 3.13, pp.32–34, lines 1110–1132 and 1173–1183)". No statement or hypothesis changes.

The reviewed files are `packages/K3SurfacesAndSymplecticBoundedness/design/README.md` ("design README" below), `packages/K3SurfacesAndSymplecticBoundedness/design/plan.json` ("plan") and `packages/K3SurfacesAndSymplecticBoundedness/sources.toml` ("manifest"). Review date: 2026-10-21. The round-5 review file named in the brief is absent from the reports folder; its text was recovered from the board history (commit `758fc0e`) and its three findings are reconciled below against the round-6 repair report. Acceptance is conditional on the 25 declared supplier gaps listed in `design/review.json`.

## Repairs of the round-5 findings

| Finding | Repaired passage and independent check | Status |
| --- | --- | --- |
| F01 (P2): two crystalline gaps not minimal | Design README:350 now reads "CrystallineCohomology CR.3.2, Proper smooth crystalline perfectness and reductions (3), gives finite generation, vanishing outside [0,4] and derived reduction modulo p; CR.2.3 identifies this reduction with de Rham cohomology. Since W is a DVR with residue k, universal coefficients give 0→Mⁱ/pMⁱ→Hⁱ_dR(X/k)→M^(i+1)[p]→0". The Needs line (README:352) consumes only CR.2.3 and CR.3.2 (3); the gap slugs `crystalline-gauss-bonnet` and `crystalline-picard-degree-one` occur in neither file; the plan has 25 gaps. I read CR.3.2 item (3) and CR.2.3 item (1) at the CrystallineCohomology pull-request head `2c8b22a` (its README lines 2715–2726 and 2359–2366): (3) is exactly "k perfect, A=W(k), X proper smooth of dimension ≤d, K perfect of Tor-amplitude [0,2d], K⊗^L W_n(k)≅RΓ_crys(X/W_n(k)), Hⁱ(K) finitely generated, zero unless 0≤i≤2d, may have p-torsion"; (1) with base k and zero PD ideal is the de Rham identification. The argument (odd and negative de Rham degrees kill M¹, M³ and the p-torsion of M⁰, M², M⁴; even degrees give ranks 1, 22, 1) is correct at every p, as deligne-lift lines 52–57 state. New Check `crystalline_torsion_control` (README:359) is a genuine negative control. The Witt coefficient facts are pinned (`WittVector.isDiscreteValuationRing`, `Mathlib/RingTheory/WittVector/DiscreteValuationRing.lean` line 148; `WittVector.quotientPEquiv`, `Complete.lean` line 105, read at `6b7abb3c`). | Repaired. |
| F02 (P3): uncited Huybrechts locators | Design README:1172 no longer contains "Theorem 2.7", "Theorem 1.8", "line 815", "913" or "943"; the manifest `huybrechts.locator` no longer lists Chapter 2 Theorems 1.8 and 2.7. | Repaired (a residual mismatch of the same kind is R02). |
| F03 (P3): missing spaces before numerals | "the24-letter", "rank9d+2", "Target1.3", "Proposition2.4", "lines336–341" and the other word+numeral joins are gone (README:27, 62, 132, 194 now read "the 24-letter action" and "rank 9d+2", "Target 1.3", "Proposition 2.4, lines 336–341", "by 1.3"). Word+symbol and word+bracket joins remain; see R01. | Partly repaired. |

## Verified sound

Counts: 8 layers, 60 targets (7 definitions, 6 constructions, 45 theorems, 2 example targets), 84 API names, 191 Checks, 15 suppliers, 25 declared gaps. Every gap slug occurs in both files with a verbatim-identical `needs` sentence, a named supplier (none is `none`) and a proposed Part II section; the plan's per-target `gap:` prerequisites give exactly the "Required by" lists the README prints (checked mechanically for all 25). Every definition and construction has at least three discriminating Checks; every theorem states its hypotheses and carries a locator; every layer ends with Examples and Dependencies; every target's prerequisites point to an earlier target, a pinned declaration, a supplier section or a declared gap.

### Principles

No route-only shortcut: p=2 and p=3 are carried through §§2.2–2.4, 6.0, 6.0b–6.0c, 6.3, 6.7d, 7.4–7.5 and the moduli are of finite type over all of Spec ℤ with smoothness separately over ℤ[1/(2d)]. No existing roadmap is re-planned: the K3 predicate, Picard realization, symplectic predicate, quotient calculations and polarized moduli are new objects; general surface, lattice, crystalline, étale, analytic and stack theory is imported by section or declared as a gap. No upward or cyclic supply (gate below). No copied passage in the statements checked; mathematics in Unicode; no LaTeX delimiters, `lemma`, `set_option`, process words, pull-request numbers or machine paths in either design file. No computational algorithm: the group and lattice numerics are witnesses. No text read during the review attempted to issue an instruction.

### Seeded source sample

All fifteen targets were read at their locators in the cached extractions.

| Target | Text read | Result |
| --- | --- | --- |
| 1.2 Field extension | huybrechts lines 13964–13971: flat base change of Hⁱ, triviality iff H⁰(L)≠0≠H⁰(L∨), injectivity of Pic(X)→Pic(X_K) | Supports the base-change half; the predicate equivalence is the design's own descent argument, correct. |
| 2.3 Vanishing | lang-nygaard lines 54–74 (Theorem 1.1, Corollary 1.2 with its proof); oda line 2490 (Corollary 5.12: k perfect, X(k)≠∅); huybrechts lines 488–493 | Exact; the rational point is retained in `gap:oda-interface`. |
| 2.6 Deformation loci | deligne-lift lines 78–79 (Proposition 1.5: closed, one equation), 131–137 (Theorem 1.6: L₀ nontrivial, flat over W, relative dimension 19, p∤f); rizov lines 779–784 (Lemma 4.1.3: formally smooth when p∤2d) | Exact. |
| 3.1 Analytic predicate | huybrechts lines 405–407 (Definition 3.1) | Exact; "nonempty" is implied by "connected" there and is harmless here. |
| 3.3 Integral topology | huybrechts lines 452–511 | Exact, including the torsion argument and b₂=22. |
| 3.4 Integral étale ranks | rizov lines 273–300 | Exact; Rizov's form is −tr(x∪y), as the Conventions say. |
| 4.1 Picard base change | huybrechts lines 13964–13971, 13995, 14011–14025 | Exact, including the purely inseparable pⁿ statement, the Hochschild–Serre sequence and the finite-field and rational-point cases. |
| 5.4 Wehler | huybrechts lines 12221–12231 | Exact; the matrices S₁, S₂, S₂S₁ were recomputed (below). |
| 6.0 Supersingular lattice | huybrechts lines 14317–14342 | Exact, including σ=0 and σ=11 exclusions. |
| 6.0c Infinite height and pencil | artin-supersingular lines 40–56 (Theorem (0.1), h=∞ for ρ=22, converse for elliptic K3), 192–212 (Theorem (1.7)(i), Lemma (1.8): ρ(X)=ρ(A*)); huybrechts lines 1127–1132, 1182–1183 | Exact; the Jacobian comparison without a section is Lemma (1.8). |
| 6.2a Wild fixed loci | wild-cyclic lines 14–44 (Theorems 1–4: ≤2 points, empty only at p=2, K3 cases only p≤5, nodal cycle, κ=1 with p≤11 and quasi-elliptic only p≤3, κ=2 with N=D²/2+1 and p(N−d−1)≤2N−2); dolgachev-keum lines 218–226 (Proposition 2.4) | Exact. |
| 6.5 Faithfulness | keum lines 116–132 (Theorem 1.4), 767–815 (proof: finite order via Rudakov–Shafarevich, tame case, rational/Enriques/K3 wild branches); rizov lines 655–662 (Lemma 3.4.1, char 0) | Exact; the proof structure of §6.5 is Keum's, with each input routed to a target or gap. |
| 6.8 Artin invariant one | huybrechts lines 14317–14321; dolgachev-keum lines 812–818 | Exact. |
| 6.10 Characteristic-zero bound | mukai lines 50–80 (Theorem (0.3), Example (0.4) orders), 98–108 (Theorem (0.6), conditions (E) and (W)); huybrechts lines 12268–12283 | Exact; maximal order 960. |
| 8.1 Polarized stacks | rizov lines 879–882 (Definition 4.3.1), 898–901 (Theorem 4.3.3), 917–920, 964–967 (Lemmas 4.3.7–4.3.8), 1004–1007 (Step 1) | Exact. |

Also read for the repairs and the adversarial pass: huybrechts lines 133–147, 365–368, 7879–7888, 13987–13995; dolgachev-keum lines 160–164, 229–233, 287–291, 353–357, 391–394 (Propositions 2.3, 2.5, 2.9, 2.11 and Theorem 2.13 state exactly the five assertions of §6.3a, with p≠11 in 2.9 and p>7 with a section in 2.13); deligne-lift lines 25–60.

### Dependency gate

Run with the design README as candidate (the package `README.md` does not exist at the design stage; the literal invocation exits with a file-not-found error before analysis):

```text
candidate: K3SurfacesAndSymplecticBoundedness is not in the merge order yet; checked as if placed after ComplexComparisonPartII (the intake inserts it when its design is accepted)
depcheck: 3 roadmaps, 20 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

### Supplier-order audit

All fifteen suppliers are on main or earlier in the merge order (SchemeAndStackFoundations at 2, EtaleCohomologyFoundations 15, CrystallineCohomology 18, AlgebraicModuliForArithmeticGeometry 30, ComplexComparisonPartII 35; the others are main-branch roadmaps outside the ordered list). For every cited section or declaration I confirmed existence where cited:

- SchemeAndStackFoundations (main): §§0.4, 0.9, 0.11, 1.1, 1.11, 1.17, 1.18–1.21, 1.23, 2.10, 2.11, 2.15, 2.20, 2.23, 4.1–4.6, 4.10–4.12, 4.14, 5.2, 5.4–5.6, 5.8–5.10 are headings (README lines 578–7115); `reflexive_extension_normal` (670, §0.4), `finiteGroupQuotient_projective` (2619, §1.17), `smoothGroup_fppf_etale_comparison` (3608, §2.10), `fppf_kummer_sequence` (3627, §2.11), `etale_galois_comparison` and `hochschildSerre_galois_covering` (3838, 3846, §2.15), `conormal_regular` (6715, §5.5), `projection_formula` for proper f (6888, §5.6), `Chow.intersectionNumber` (7079, §5.9).
- JacobianChallenge Layers A, C, D (README lines 111, 143, 218; Layer D states the obstruction sequence into H²_fppf(T,𝔾_m)); AlgebraicVectorBundles L0A–L0C (215–254); StableReduction Layer 2 (354–405, including "effective étale descent for schemes equipped with a compatible relatively ample invertible sheaf … relative Proj"); IntegralLattices Layer 1 with milestone 1I Milgram (693) and Layers 5–6; `Completed/IntegralLattices` Layers 1–5 (162–327); GlobalQuadraticForms §5.5 Hasse–Minkowski isotropy (665); QuadraticFormInvariants 6D (2047); EtaleCohomologyFoundations F.0.3, F.2.1–F.2.2, F.4.2 `classicalAdicRealization`, F.4.4 `adicFiniteness`, F.4.5 `rationalAdicRealization`, F.4.6 `adicFunctoriality`, F.5, F.6, §0.9 (231–1200); AlgebraicTopology Stage 6 and `compactTriadPoincareLefschetz` (946, 1534); MorseNovikov N6 Lefschetz formula (377, 496–499); ComplexKahlerGeometry K3, K4, K5a, K5b, K6.1 (296, 444, 570–619, 1274); CFSGStatement S1 (721); ComplexCurveModuli D0–D2, D7 (25–192).
- CrystallineCohomology at pull request 857, head `2c8b22a` (unchanged since the round-5 review; draft, 3 files): CR.2.3 (line 2357), CR.3.2 (2635, item (3) at 2715–2726), CR.3.3 (2777), CR.4.1 (3555), CR.4.6 (5429), CR.4.7 (6425) with `Crystalline.wittCohomology_V_complete` (6584), CR.3:duality.1 (7112), CR.7.3 (11292); `FdV = d` and `FV = VF = p` (266, 3697, 7096); `crysDiagonal_action` (7464).
- ComplexComparisonPartII at `c9ccfac`: C−1.1 (699), C1.9 (1663) with `projectiveComplexGaga`, `properSchemeGagaPushforward`, `properSchemeGagaEquivalence`; C2.2 (1737) `projectiveGeometricDictionaries`; C3.2d.2–C3.2d.5 (1972–2026) with `relative_picard_algebraicSpace`, `relative_picard_separated`, `picard_brauer_obstruction`, `finite_picard_cartier_torsors`; C5.1 (2337); C6.3 `artinComparison` (4170); C6.6 `adicArtinComparison` (4336).
- AlgebraicModuliForArithmeticGeometry at `98fd038`: §7.6.1 (9485) `relativePicardSheaf`, `relativePicardBaseChange`, `relativePicardKernel`; §7.6.1a (9537) `sectionPicardSplit`; §9.10 (10217) `algebraicAdjointVanishing` (10270: characteristic zero, nef big rational divisor, SNC fractional support), as the README uses it.

The ArithmeticDynamics and ErdosProgressionPowers pull requests supply nothing here: ArithmeticDynamics mentions K3 only as an endpoint check (its README line 2447, the Call–Silverman example), not as a planned object. No supplier drift, no unowned prerequisite, no two-owner object and no upward citation was found.

### Declared gaps

All 25 gaps have a named supplier, a one-sentence `needs` with its hypotheses, the same slug and sentence in both files and consumers that exist. Checked individually for precision and minimality (each asks for something no pinned library, main roadmap or earlier roadmap states, and nothing this roadmap proves itself): `surface-projectivity` (Stacks 0C5P is not in Tau Ceti or SchemeAndStackFoundations §§4.11–4.12), `hypersurface-cohomology`, `oda-interface`, `surface-arithmetic-quotient`, `tame-linear-groups`, `elliptic-surface-geometry`, `artin-discriminant`, `witt-formal-brauer`, `crystalline-chern-derivative`, `cross-realization`, `integral-topology`, `tame-lefschetz` (F.6 is the identity case only), `surface-quotient-resolutions`, `tame-quotient-singularities`, `quotient-transcendental-comparison`, `ruled-surface-two-forms`, `mathieu-permutation-model`, `mukai-eleven-groups-recognition`, `matsusaka-mumford`, `adjoint-positivity`, `exceptional-mathieu-embeddings`, `surface-brauer-localization`, `surface-brauer-kummer`, `equivariant-brauer-descent`, `rational-surface-cohomology`. The two gaps removed under F01 are absent everywhere.

### Duplication audit

By object, at the pins Mathlib `6b7abb3c` and Tau Ceti `a91d3aaf`, read from the pinned files: `AlgebraicGeometry.SmoothOfRelativeDimension` (`Morphisms/Smooth.lean` line 127), `AlgebraicGeometry.GeometricallyIntegral` and `isIntegral_of_subsingleton` (`Geometrically/Integral.lean` lines 25, 40), `PadicInt.toZMod`, `ker_toZModPow`, `ext_of_toZModPow` (`Padics/RingHoms.lean` lines 300, 459, 713), `PadicInt.mem_span_pow_iff_le_valuation` with its `x ≠ 0` hypothesis (`PadicIntegers.lean` line 472), `WittVector.isDiscreteValuationRing` (line 148), `WittVector.quotientPEquiv` (line 105), `littleWedderburn` with alias `Finite.divisionRing_to_field` (`LittleWedderburn.lean` lines 169, 173); Tau Ceti `Scheme.relativeDifferentials`, `relativeDifferentialsHomEquiv` (`Differentials/Basic.lean` lines 85, 101), `FiniteLocallyFreeSheaf.rank_relativeDifferentials_apply` (`Rank.lean` line 74), `LineBundleClass.mk_eq_mk_iff`, `mk_tensorProduct`, `mk_eq_one_iff` (`LineBundle/Class.lean` lines 76, 119, 135), `IntegralLattice.ofSubmodule`, `integralForm_cast` (`IntegralLattice/Basic.lean` lines 174, 161), `subsingleton_brauerGroup_of_finite` (`BrauerGroup/Trivial.lean` line 247, `[Finite K]`), `brauerCohomologyEquiv` (`CrossedProduct/Comparison.lean` line 267). All are consumed by name, not restated. No K3 predicate, K3 cohomology, K3 Picard lattice, symplectic predicate, quotient classification or polarized K3 moduli exists in Mathlib, Tau Ceti, a main-branch roadmap or an open roadmap pull request.

### Adversarial pass over the targets

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions: pairing, half-norm, discriminant sign | Quartic H; (−2)-curve; signature (1,21) | B(H,H)=4, Q(H)=2, Q(C)=−1; sign (−1)²¹ negative | None |
| Conventions: pullback order, inverse-pullback, contraction | f∘g; frame σ(e₁,e₂)=1; p=2 | (f∘g)*=g*f*; e₁↦e₂*, e₂↦−e₁*; sign + at p=2 | None |
| Conventions: cup-trace and Rizov's sign | Quartic; point class | tr(c₁(H)²)=4; Rizov's ψ=−tr(x∪y) is the negative (rizov line 288) | None |
| Conventions: Mathieu action, cube dimensions | Identity; involution; d=1,2 | 24, 8; ranks 11, 20; ℙ¹⁰, ℙ¹⁹ | None |
| 1.1 `IsK3` | Empty scheme, ℙ², E×E, quartic | Geometric integrality excludes empty; ω=O(−3), h¹=2 reject controls | None |
| 1.2 extension iff | K=k; tower; purely inseparable | Both directions by flat base change and fpqc descent | None |
| 1.3 projectivity | Imperfect k; threefold | Surface theorem only; smooth of relative dimension 2 gives regular | None |
| 1.4 RR and contraction | L=O, H; p=2 | 2χ=4+L² in ℤ; χ(O)=2, χ(H)=4 | None |
| 1.5 numerical kernel | O; torsion; (−2)-curve; k-ample H | h⁰(L)=h⁰(L⁻¹)=0 against χ(L)=2 | None |
| 1.6 quartics | t=0,1; Fermat at p=2 | 2, 4; (Σxᵢ)⁴ nonreduced | None |
| 2.1 relative Picard space | Field base; nonreduced base; zero class | Universal functions proved first; étale over a field | None |
| 2.1a infinite-height kernel | Zero witness; finite height; p=2 | Nonzero witness required; finite height routed to Nygaard | None |
| 2.2 closed one-forms | Zero form; Cartier iterates; p=2 | Two height branches only | None |
| 2.3 no vector fields | Abelian surface; p=2; char 0 | h¹(O) excludes control; Oda's point from closure | None |
| 2.4 Hodge and crystalline ranks | i=−1…5; W/p summand in M⁰, M², M⁴; p=2,3 | Odd and negative de Rham vanishing kill torsion; ranks 1, 22, 1 | None |
| 2.5 formal deformations | Dual numbers; unmarked object | h¹(T)=20, h⁰=h²=0 | None |
| 2.6 deformation divisor | L=O; p∣2d; p∤2d | O excluded; flatness at bad degree; c₁²=2d≠0 gives smoothness | None |
| 2.7 polarized lift | p=2; ramified trait | Existence of a finite trait over W, not a lift over W | None |
| 3.1 `IsK3Analytic` | Empty; torus; quartic | Nonempty, h¹(O)=2, quartic passes | None |
| 3.2 GAGA image | Nonprojective analytic K3 | Essential image is the projective locus | None |
| 3.3 integral Betti | Torsion in H², H³; winding loop | Pic torsion-free kills H² torsion; duality kills H³; increment +1 | None |
| 3.4 étale ranks | ℓ=p; ℓ=2≠p | ℓ=p excluded; ℓ=2 allowed; perfect pairing from free modules | None |
| 4.1 Picard base change | Identity; closed extension; non-split conic | Injective; bijective over closed k; Brauer obstruction retained | None |
| 4.2 Picard lattice | Gram [4]; O; (−2)-curve; ℝ⊂ℂ | Even nondegenerate (1,ρ−1); factor 2 on the pushforward side | None |
| 4.3 ranks | Rank 0; rank 22; h¹¹ | Ample class forbids rank 0; rank ≠ h¹¹ | None |
| 4.4 bounds and saturation | ℓⁿy=c₁(x); ρ=22; char 0 | Kummer injectivity needs H³(ℤ_ℓ(1)) torsion-free, supplied by 3.4; 20 in char 0 | None |
| 4.5 odd congruence kernel | n=0,1; ℓ=2,3; I+3E₁₂ | Depth a+1 for odd ℓ since C(ℓ,2)ℓ^{2a} and ℓ^{aℓ} exceed a+1; −1 breaks ℓ=2 | None |
| 4.6 bounded descent | Closed, finite, imperfect k; X(k)≠∅ | Order ≤|GL₂₂(𝔽₃)|; integral descent only with Br(K)=0 or a K-point | None |
| 5.1 symplectic predicate | id; composition; rescaled σ; −1 at p=2 | Generator-independent; kernel of inverse pullback | None |
| 5.2 polarized stabilizer | Scalars; L versus Lⁿ | No extra arrows; equal stabilizers by torsion-freeness | None |
| 5.3 finite étale | Involution; nonclosed k; p=2 | Finite type, dimension 0 and zero tangent give finite étale | None |
| 5.4 Wehler | S₁, S₂, product | σ₁*H₂=4H₁−H₂ forced by B(σ₁*H₂,H₁)=4, (σ₁*H₂)²=2; S₂S₁=[[−1,−4],[4,15]], trace 14, det 1, eigenvalues 7±4√3; Gram det −12 | None |
| 6.0 supersingular discriminant | σ=0, 11; p=2 | 8∤−20; for odd p, p∣B(x,x) even gives B/p even; p=2 from the gap | None |
| 6.0a height inequality | h=1, 10, 11, ∞ | ρ≤20, 2, 0; ∞ not substituted | None |
| 6.0b rank-five pencil | Rank 1; F, 2F; p=2,3 | Meyer needs rank ≥5; primitive nef isotropic; cuspidal fibre retained (R03 on the locator) | None |
| 6.0c infinite height and pencil | No section; h=1; quasi-elliptic; ρ=21 | Lemma (1.8); finite height excluded; unirational branch; 21⇒22 | None |
| 6.1 tame quotient | G=1; involution; square rank-20 determinant | Rank 0, det 1; 8A₁ det 2⁸; binary complement with −(square) determinant is isotropic | None |
| 6.1a cyclic arithmetic | n=2,4; 11, 15 | 24n=24−Σaₘn/m+nΣaₘm gives 24(n−1)=Σaₘ(n/m)(m²−1); 24=8·3; 72=60+12; a₁₁=2 (2A₁₀, det 121); a₁₅=a₅=a₃=1 (A₁₄⊕A₄⊕A₂, det 225) | None |
| 6.2 fixed-point table | id; orders 2,7,8; wild g | Identity excluded; 8, 3, 2 agree with ε(n) | None |
| 6.2a wild fixed loci | Empty at p=2; κ=0,1,2; N=2,d=1 | Matches wild-cyclic Theorems 1–4; 0≤2 gives no bound | None |
| 6.3 wild quotients | Rational, Enriques, K3 branches | e(Y)=12, b₂(Y)=10 by descent and Gauss–Bonnet; no ρ=b₂ | None |
| 6.3a refinements | p=11, 13; quasi-elliptic | Matches dolgachev-keum Propositions 2.3, 2.5, 2.9 (p≠11), 2.11, Theorem 2.13 (p>7, section) | None |
| 6.4 wild prime bound | p=2, 13 | Order-p element symplectic (kˣ has no p-torsion); p≤11 | None |
| 6.4a Picard faithfulness | id; p=2; degree-two deck involution | Rank 22 and full Picard action essential | None |
| 6.5 étale faithfulness | ℓ=p; tame kernel; three wild branches | Coefficient exclusion; 10<22; 22>22 | None |
| 6.6 uniform bound | G=1; char 3; wild G | ℓ=5 at char 3; no averaging | None |
| 6.7d involution pencil | id; swap matrix mod 2; p=3 | Exact order 2 and p≠2 essential; integral step an obligation | None |
| 6.8 Artin invariant one | p=3: −9, +9, −81; rank 20 | Only rank 22 with −9 | None |
| 6.8a invariant dimension | G=1; C₇; order 21; both σ=1 | 24; 42/7=6; 126/21=6; exceptional branch excluded | None |
| 6.9 Mathieu character | n=1…8; wild | 24, 8, 6, 4, 4, 2, 3, 2 from ε(n); wild not asserted | None |
| 6.10 characteristic-zero bound | Trivial; 1⁸2⁸; 23-cycle | 24, 16, 2 orbits | None |
| 6.11 tame bound | Exceptional group; p=2; nonclosed k | Four orbits allowed; 2⁷·3²·5·7·11·23=10200960; base change injects | None |
| 7.1 primitivity | 0; generator; 2·generator; squarefree d | 0 fails; n²∣d | None |
| 7.2 root loci, openness | n=0; n=3 at p=3; F, 2F, 0 | [0] excluded; d≠0, d=0≠m, d=m=0 complete | None |
| 7.3 polarized families | Constant family; d=0; no global line | Positive degree; local representatives | None |
| 7.4 vanishing and polynomial | m=0, −1; d=2 | H²(O)=k at m=0; 4, 10, 20 | None |
| 7.5 cube embedding | r=0 with 2L; r=1 with 3L; d=1,2; p=2 | Ampleness of L gives 3L·D≥3; failure forces D²=1, impossible by evenness | None |
| 7.6 Hilbert K3 locus | Singular degeneration; equal ranks, unequal classes | Smoothness and class equality | None |
| 7.7 Hilbert atlas | Root at p=3; Fermat swap | Closed root locus; stabilizer Aut(X,[O(1)]) | None |
| 8.1 polarized stacks | Involution stabilizer; p∣2d | Arrows retained; atlas over all primes | None |
| 8.2 separation | Generic identity; ruled special fibre | Extends given isomorphisms; non-ruledness from the two-form | None |
| 8.3 coarse spaces | Stabilizer; k-forms | Geometric points only | None |
| 8.4 smooth locus | d=1; p∣2d | Over ℤ[1/2]; nothing at bad primes | None |
| 8.5 finite-field finiteness | Twists; obstruction | Br(k)=0 gives a line; frames give k-points of a finite-type scheme | None |

The 25 declared gaps were re-run through the same instances as the round-5 table (trivial group, wild group, p=2, dimension-zero and nonample controls, additive formal group, inseparable finite flat map, ruled fibre, H³ torsion, same order with different extension); none changed.

### Manifest

The 30 author-recorded entries are unchanged by this review; no source was fetched and no entry was added. The three `waived` and two `uncertified` entries are settled citations. No local path occurs in the manifest.

## Not verifiable

- Lean elaboration: **not available**. The design package has no `Suggested.lean`, and the brief names no Lean command for the design stage. No build result, admitted-data check or `set_option` check is claimed; these are package-stage obligations.
- `rudakov-shafarevich` §8 Proposition 3, `matsusaka-mumford` Theorem 2 and `nygaard-vectorfields` Lemma 3.3 are waived primaries; only their applications (keum lines 773–777 and 799–801, rizov line 1084, lang-nygaard lines 99–104) were read.
- `shioda-transcendental` Proposition 5 and `arapura-chern` §7.5 are uncertified locator-only citations; their applications (keum lines 811–812, dolgachev-keum lines 590–594; the README's own Čech derivation) were read instead.
- The current heads of the ComplexComparisonPartII and AlgebraicModuliForArithmeticGeometry pull requests were not re-resolved; their READMEs were read at the commits the round-5 review recorded (`c9ccfac`, `98fd038`), where every cited section and name exists. CrystallineCohomology's head was re-resolved and is unchanged (`2c8b22a`).
- The round-5 review file is absent from the package; its text was taken from the board history at commit `758fc0e`.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b335247dbdf1d3e5b236c6afdc79d0daf990c30b", "job": "REV-DESIGN-K3SurfacesAndSymplecticBoundedness~6", "model": "fable", "worker": "chris-f"} -->
