<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/63#issuecomment-6309562427 -->
Review (claude) of 5cb7464

Verdict: needs_changes

1. **F01** (P2) Two crystalline supplier gaps are not minimal

   **Location.** Design README:164 (`gap:crystalline-gauss-bonnet`), README:172 (`gap:crystalline-picard-degree-one`), README:358–360 (§2.4 proof and Needs); plan target 2.4 `proofSketch` and the two `gaps` entries. Quoted claim (README:358): "Use the generic degree-one crystalline/Picard comparison and crystalline duality to get rational ranks 0 in degrees 1,3; crystalline Gauss–Bonnet gives rank 22 in degree 2."

   **Claim.** The integral crystalline ranks (1,0,22,0,1) of §2.4 need a crystalline Gauss–Bonnet identity and a degree-one Picard comparison, so two Part II sections are requested from CrystallineCohomology. Both gaps have §2.4 as their only consumer.

   **Witness.** deligne-lift lines 52–57: the cited source derives assertion c) (freeness and ranks) from assertion a) (the Hodge diamond) by the universal-coefficient sequence alone. CrystallineCohomology CR.3.2 item (3) (its README, "Proper smooth crystalline perfectness and reductions") supplies for X proper smooth over perfect k a perfect complex of Tor-amplitude [0,2d] with `K⊗^L W_n(k)≅RΓ_crys(X/W_n(k))`, and CR.2.3 identifies RΓ_crys(X/k) with de Rham cohomology. With dim Hⁱ_dR=(1,0,22,0,1) from the degenerate diamond already proved in §2.4, the sequences 0→Hⁱ⊗k→Hⁱ_dR→Tor₁(H^{i+1},k)→0 read in descending degree give H³=H¹=0 by Nakayama, then H⁴, H², H⁰ torsion-free of ranks 1, 22, 1, and vanishing outside [0,4] from the Tor-amplitude. No Gauss–Bonnet, no degree-one Picard comparison and no crystalline duality enter. The README's own sentence "Apply the universal-coefficient sequence degree by degree" already invokes this input.

   **Exact repair.** Rewrite the §2.4 proof paragraph to Deligne's argument: diamond ⇒ degeneration ⇒ de Rham dimensions ⇒ universal coefficients from CR.3.2 (3) and CR.2.3 ⇒ integral freeness and ranks. Remove `gap:crystalline-gauss-bonnet` and `gap:crystalline-picard-degree-one` from the plan's `gaps`, from target 2.4's prerequisites, from the README contracts (lines 164–172, including the three Checks), from the §2.4 Needs line and from the Layer 2 Dependencies; drop `CR.3:duality.1` from §2.4's Needs if nothing else there uses it. Drop the gros-chern and illusie-witt bullets from the README References (the manifest entries may stay as recorded, or have their `cited_for` emptied by the fix worker). If the author instead wants to keep a crystalline Gauss–Bonnet contract, name a target that actually consumes it; none does today.

2. **F02** (P3) Reference bullet lists locators no target cites

   **Location.** Design README:1179, the `huybrechts` reference: "Chapter 2: Theorem 2.7 and characteristic-two extension (pp. 27-28; lines 913, 943)" and "Chapter 2 Theorem 1.8, p.25 (line 815), for characteristic-zero nef-and-big vanishing".

   **Claim.** The References record only works and locators the roadmap cites.

   **Witness.** `Theorem 2.7`, `Theorem 1.8`, `line 815`, `lines 913` and `943` occur nowhere in the README outside that bullet; §7.4 cites rizov Theorem 1.2.2, terakawa Theorem 1.6 and AlgebraicModuliForArithmeticGeometry §9.10, and §7.5 cites rizov and terakawa Theorem 2.4.

   **Exact repair.** Delete the two uncited locator clauses from the bullet, or attach each to the target that uses it (and add it there), and trim the manifest's `huybrechts.locator` string to match.

3. **F03** (P3) Missing spaces before numerals throughout the prose

   **Location.** Design README:27 ("the24-letter action", "its character is24; at order2 it is8", "rank9d+2"), README:60 ("Target1.3"), README:130 ("contribute1", "Proposition2.4, lines336–341"), README:202 ("by1.3"), README:243 ("dimension2") and many similar spots in Layers 1–8.

   **Claim.** The README is prose for mathematicians in house style.

   **Witness.** The strings above, verbatim.

   **Exact repair.** One pass inserting the missing space between a word and a following numeral or section number; no content change.

The reviewed files are `packages/K3SurfacesAndSymplecticBoundedness/design/README.md` ("design README" below), `packages/K3SurfacesAndSymplecticBoundedness/design/plan.json` ("plan") and `packages/K3SurfacesAndSymplecticBoundedness/sources.toml` ("manifest"). Review date: 2026-10-21. The round-4 review file named in the brief is absent from the reports folder; its text was recovered from the board's history (commit `dcf3644`) and its five findings are reconciled below against the round-5 repair report.

## Repairs of the round-4 findings

| Finding | Repaired passage and independent check | Status |
| --- | --- | --- |
| F01 (P2): conormal convention in the crystalline self-intersection source | Design README:164 now reads "Gros IV Theorem 2.1.1 … prints N=J/J² with c_c(N) on the right. In these positive conventions that is a dual omission: c_c(E)=(−1)^c c_c(J/J²), by III Corollary 1.2.31(iii)". gros-chern line 1946 states c_i(E∨)=(−1)^i c_i(E); lines 2314–2318 print N=J/J²; the deformation argument is at lines 2373–2400; the line-bundle Euler class at lines 1504–1505; the flag-bundle injectivity at lines 1797–1810. The contract stays all-dimensional. Checks at README:168–170 compute +1, +2, +1. | Repaired. Whether the contract is needed at all is R01. |
| F02 (P2): ample scheme criterion versus global projectivity | Design README:102–104 fixes the Stacks projective/H-projective/strongly-projective conventions and derives the scheme criterion from StableReduction Layer 2 descent; "If S is quasi-compact and quasi-separated, relative ampleness also gives global projectivity". stacks-relative-ample lines 1253–1327 (0D32–0D36), stacks-projective-morphisms lines 4229–4238 (01VW), 4633–4640 (01W8), 4688–4692 (0B5N), 4764–4775 (0BCL) all say what the README attributes to them. `gap:ample-space-scheme` is absent from both files. Three Checks at README:108–110. | Repaired. |
| F03 (P2): square-zero sections in primitive openness | Design README:991: "If d≠0 … n²∣d … If d=0 and m≠0 it forces n∣m … If d=m=0, Hodge index makes λ numerically zero on every geometric fibre, and §1.5 makes λ=0 there". Hodge index is in the Needs line; Checks F, 2F and 0 at README:1000–1002. rizov lines 468–470 state part (ii); lines 505–516 are its printed proof, now inside the cited range. | Repaired. |
| F04 (P3): distinct frames and Hilbert points | Design README:1078: the Fermat coordinate swap "gives distinct projective frames with the same cubic Hilbert point"; the stabilizer is Aut(X,[O(1)]) = Aut(X,[O(3)]); the torsor "retains its source identification". | Repaired. |
| F05 (P3): general locators for two contracts | Design README:82 cites Enriques Surfaces I Theorem 4.1.6 (enriques-one lines 17528–17594), Proposition 4.3.7 and Corollary 4.3.8 (18462–18471), Theorem 4.3.9(3) (18472–18483), Proposition 4.3.14 (18646–18657), Theorem 4.3.20 (18799–18813), and Liedtke Corollary 4.2, Definition 4.3 (liedtke-surfaces 753–763) and Theorem 8.3 (1331–1335). Each passage states the attributed general genus-one or quasi-elliptic result. README:150 gives the normalized Čech derivation with Arapura recorded as uncertified in the manifest. | Repaired. |

## Verified sound

Counts: 8 layers, 60 targets (7 definitions, 6 constructions, 45 theorems, 2 example targets), 84 API names, 190 Checks, 15 suppliers, 27 declared gaps. Every target name, API name and Check name in the plan occurs in the README; every gap slug occurs in both files with a verbatim-identical `needs` sentence; every gap has a named supplier and proposed Part II section, and the plan's per-target `gap:` prerequisites give exactly the consumer lists the README prints. Every target's prerequisites point to earlier targets, a pinned declaration, a supplier section or a declared gap. Each of the 13 definition and construction targets has at least three discriminating Checks; every theorem states its hypotheses and carries a locator; every layer ends with Examples and Dependencies.

### Principles

No route-only shortcut: all-characteristic statements keep p=2 and p=3 branches (§§2.2–2.4, 6.0, 6.0b–6.0c, 6.3, 6.7d, 7.4–7.5), wild groups are bounded without a tame classification (§§6.4–6.6), and finite-type moduli are over all of Spec ℤ with smoothness separately over ℤ[1/(2d)] (§§8.1, 8.4). No existing roadmap is re-planned: the K3 predicate, Picard realization, quotient calculations and polarized moduli are new objects; general surface, lattice, crystalline, étale, analytic and stack theory is imported by section or declared as a gap. No upward or cyclic supply (gate below). No copied passage was found in the statements checked; mathematics is in Unicode; no LaTeX delimiters, `lemma`, `set_option`, process words, pull-request numbers or machine paths occur in either design file. No computational algorithm: the group and lattice numerics are witnesses. No text read during the review attempted to issue an instruction.

### Seeded source sample

All fifteen contracts were read at their locators in the cached extractions.

| Target | Text read | Result |
| --- | --- | --- |
| 1.6 Quartics over every field | huybrechts lines 160–183: Example 1.3(i), the conormal sequence, H¹=0, ω≅O, Fermat smooth needs char≠2 | Supports the statement; H²=4 and χ(O(t))=2t²+2 are RR consequences. |
| 2.1 The relative Picard space | rizov lines 404–408 (Thm 3.1.1), 416–432 (Lemma 3.1.2), 440–450 (Prop 3.1.3) | Supports representability, separatedness, étale fibres, trivial Pic⁰ and Picᵗ, unramifiedness. The algebraic-space-family generalization is routed through ComplexComparisonPartII C3.2d.2–C3.2d.3, whose universal-functions hypothesis the README proves first. |
| 2.1a The infinite-height kernel input | lang-nygaard lines 93–104; rudakov-shafarevich-inseparable lines 440–497 (Thm 5, Cor 1–2); shioda-unirational-primary lines 104–140 | Corollary 1 gives unirationality from a vector field; Corollary 2's proof gives ρ=b₂=22 via f^*f_*=deg; Lang–Nygaard's remark records the dependence. Primary nygaard-vectorfields Lemma 3.3 is waived. |
| 2.2 Positive-characteristic closedness | lang-nygaard lines 76–100 (Thm 1.3 with the two height cases and the FdV/V-separated argument) | Exact statement and proof shape. |
| 2.3 Vanishing in all characteristics | lang-nygaard lines 54–74 (Oda's sequence, Cor 1.2); oda line 2490 (Cor 5.12: perfect k, X(k)≠∅); huybrechts lines 488–493 | Supports H⁰(Ω¹)=H⁰(T)=0; H²(T)=0 is Serre duality on T≅Ω¹. Rational point retained in the gap and supplied by algebraic closure. |
| 2.6 Line-bundle deformation loci | deligne-lift lines 78–79 (Prop 1.5), 131–137 (Thm 1.6: flat over W, relative dimension 19, p∤f); rizov lines 779–784 (Lemma 4.1.3) | Exact. |
| 4.2 The geometric lattice realization | huybrechts lines 335–345 (Prop 2.4), 13945–13949 | Even, nondegenerate, signature (1,ρ−1), Pic=NS=Num over any field. |
| 4.3 Arithmetic and geometric Picard ranks | huybrechts lines 13987–13994 (Def 2.3) | Exact, including independence of the algebraically closed overfield. |
| 4.5 A general congruence theorem | huybrechts lines 14045–14049 | The integral consequence is stated there; the odd-ℓ p-adic kernel theorem is the design's own derivation, checked below (ℓ=2 fails at −1). |
| 5.3 Finite étale polarized automorphism schemes | huybrechts lines 3372–3403 (Prop 3.3, Rem 3.4); rizov lines 615–642 (Prop 3.3.3: closed subfunctor, unramified, finite type, relative dimension 0) | Supports finite étale over a field; the symplectic kernel is a closed subgroup scheme of a finite étale group scheme over a field, hence finite étale. |
| 6.0 The supersingular geometric lattice | huybrechts lines 14317–14342 (Prop 2.19 and proof) | Exact, including the σ=0 and σ=11 exclusions; the p=2 evenness of B/p is correctly made explicit in `gap:artin-discriminant`. |
| 6.0c Infinite height with a genus-one pencil | artin-supersingular lines 192–210 (Thm 1.7(i), Lemma 1.8: ρ(X)=ρ(A*)); lines 40–55 (supersingular = h=∞); huybrechts lines 1182–1183 | Supports the elliptic branch without a section; the quasi-elliptic branch is Liedtke Theorem 8.3 plus Shioda, both read. |
| 6.4a Faithfulness on the rank-22 Picard group | keum lines 773–777 and 799–801 | Application verified; primary rudakov-shafarevich §8 Prop 3 is waived. |
| 6.7d The involution pencil input | dolgachev-keum lines 597–648 (Lemma 4.3) | Statement supported (p≠2, order 2 ⇒ ρ≥5 ⇒ pencil). Its printed proof uses "an automorphism of order ≤2 of a free ℤ_ℓ-module acts trivially modulo 2" (line 643), which is false for the swap matrix; the README states this and makes the integral tracking a proof obligation. The theorem itself is retained as a target with the source locator. |
| 7.1 Geometric primitivity | rizov lines 555–558 (Def 3.2.3), 463–470 (Lemma 3.1.6), 140–141 | Exact. |

Also read for the repairs and the pass: huybrechts lines 133–157, 452–511, 1110–1135, 1170–1183, 7879–7888, 11765–11788, 12221–12231, 14001–14025, 14038–14054, 14545–14548; rizov lines 60–72, 140–150, 273–300, 655–662, 1073–1101; dolgachev-keum lines 136–162, 399–470, 490–520, 733–760; keum lines 118–130; wild-cyclic lines 14–44; terakawa lines 148–193; nikulin-symplectic lines 1561–1624; mukai lines 50–80, 100–106; deligne-lift lines 25–60, 140–160; artin-mazur-formal, sga2, stacks-surface-resolution lines 2274–2335 (0C2N, 0C5N, 0C5P) and liedtke-mckay as cited in the contracts. Each supports the attributed statement with the attributed hypotheses.

### Supplier-order audit

Gate, run with the design README as candidate (the package `README.md` does not exist at design stage, so the literal invocation exits with a file-not-found error before analysis):

```text
candidate: K3SurfacesAndSymplecticBoundedness is not in the merge order yet; checked as if placed after ComplexComparisonPartII (the intake inserts it when its design is accepted)
depcheck: 3 roadmaps, 19 edges, 0 problem(s)
```

No UPWARD or CYCLE line. All fifteen suppliers are on main or earlier in the merge order. For every cited section or declaration I confirmed existence where cited:

- SchemeAndStackFoundations (main): §§0.4, 0.9, 0.11, 1.1, 1.11, 1.17, 1.18–1.21, 1.23, 2.10, 2.11, 2.15, 2.20, 2.23, 4.1–4.6, 4.10–4.12, 4.14, 5.2, 5.4–5.6, 5.8–5.10 all exist as headings; `finiteGroupQuotient_projective` (line 2633), `smoothGroup_fppf_etale_comparison` (3608), `etale_galois_comparison` (3838), `hochschildSerre_galois_covering` (3846), `conormal_regular` (6715), `fppf_kummer_sequence` (3627), `reflexive_extension_normal` (670), `projection_formula` (6888), `Chow.intersectionNumber` (7079).
- JacobianChallenge Layers A, C, D (main; Layer D states the obstruction sequence 0→Pic(T)→Pic(X_T)→Pic_{X/k}(T)→H²_fppf(T,G_m)); AlgebraicVectorBundles L0A–L0C; StableReduction Layer 2 (polarized étale descent, lines 376–399); IntegralLattices Layers 1, 5, 6 and milestone 1I, and `Completed/IntegralLattices` Layers 1–5; GlobalQuadraticForms §5.5; QuadraticFormInvariants Layer 6D; EtaleCohomologyFoundations F.0.3, F.2.1–F.2.2, F.4.2 `classicalAdicRealization`, F.4.4 `adicFiniteness`, F.4.5 `rationalAdicRealization`, F.4.6 `adicFunctoriality`, F.5, F.6, §0.9; AlgebraicTopology Stage 6 and `compactTriadPoincareLefschetz`; MorseNovikov N6 mapping-torus Lefschetz formula; ComplexKahlerGeometry K3, K4, K5a, K5b, K6.1; CFSGStatement S1.
- CrystallineCohomology at the head of its new-roadmap pull request (`2c8b22a`): CR.2.3, CR.3.2, CR.3.3, CR.3:duality.1, CR.4.1, CR.4.6, CR.4.7, CR.7.3 and the names `crysDiagonal_action`, `crysDiagonal_triangles`, `test_crysDiagonal_euler`, `Crystalline.wittCohomology_V_complete`.
- ComplexComparisonPartII at its head (`c9ccfac`): C−1.1, C1.9 (`projectiveComplexGaga`, `properSchemeGagaPushforward`, `properSchemeGagaEquivalence`), C2.2 (`projectiveGeometricDictionaries`), C3.2d.2–C3.2d.5 (`relative_picard_algebraicSpace` for proper flat finitely presented families with universal functions, `relative_picard_separated` with geometrically integral fibres, `picard_brauer_obstruction`, `finite_picard_cartier_torsors`), C5.1, C6.3 `artinComparison`, C6.6 `adicArtinComparison`.
- AlgebraicModuliForArithmeticGeometry at its head (`98fd038`): §7.6.1 `relativePicardSheaf`, `relativePicardBaseChange`, `relativePicardKernel`; §7.6.1a `sectionPicardSplit`; §9.10 `algebraicAdjointVanishing` (characteristic zero, nef big rational divisor with SNC fractional support), consistent with the README's use.

The ArithmeticDynamics and ErdosProgressionPowers pull requests supply nothing here, as the README says. No supplier drift, no unowned prerequisite and no two-owner object was found apart from R01, which is a minimality defect, not an ownership one.

### Declared gaps

All 27 gaps have a named supplier (none is `none`), a single-sentence `needs` with its hypotheses, the same slug and sentence in both files, and consumers that exist. Checked individually for precision and minimality: `surface-projectivity`, `hypersurface-cohomology`, `surface-arithmetic-quotient`, `surface-quotient-resolutions`, `tame-quotient-singularities`, `quotient-transcendental-comparison`, `ruled-surface-two-forms`, `matsusaka-mumford`, `elliptic-surface-geometry`, `rational-surface-cohomology`, `adjoint-positivity`, `tame-lefschetz`, `surface-brauer-localization`, `surface-brauer-kummer`, `equivariant-brauer-descent`, `integral-topology`, `oda-interface`, `witt-formal-brauer`, `crystalline-chern-derivative`, `artin-discriminant` (its σ>1 clause matches dolgachev-keum lines 744–752), `cross-realization`, `tame-linear-groups`, `mathieu-permutation-model`, `mukai-eleven-groups-recognition`, `exceptional-mathieu-embeddings`: each asks for something no pinned library, main roadmap or earlier roadmap states, and nothing this roadmap proves itself. The two exceptions are R01.

### Duplication audit

By object, at the pins Mathlib `6b7abb3c` and Tau Ceti `a91d3aaf`: the native smooth/proper/geometrically-integral predicates, relative differentials and their rank, `LineBundleClass` and its tensor/trivial API, `IntegralLattice.ofSubmodule`, `PadicInt` reduction and valuation lemmas, `brauerCohomologyEquiv` and `subsingleton_brauerGroup_of_finite`, `littleWedderburn` are consumed by name, not restated. No K3 predicate, K3 cohomology, K3 Picard lattice, symplectic predicate, quotient classification or polarized K3 moduli exists in Mathlib, Tau Ceti, a main-branch roadmap or an open roadmap pull request; the open pull requests on K3 and Enriques course notes (numbers 1285 and 1286) revise existing course-note material and are not roadmap folders. The abstract objects that do exist elsewhere (lattices and discriminant forms, Hochschild–Serre, Kummer, Chern classes, intersection numbers, Hilbert schemes, coarse spaces, Artin comparison, GAGA, de Rham–Witt operations) are cited.

### Adversarial pass over the targets

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions: pairing, half-norm, discriminant | Quartic H, rational C, zero; rank 22 | B(H,H)=4, Q(H)=2, B(C,C)=−2; signed determinant negative in signature (1,21) | None |
| Conventions: pullback, inverse-pullback action, contraction | Composite f∘g, frame e₁,e₂, p=2 | (f∘g)*=g*f*; σ(e₁,−)=e₂*, σ(e₂,−)=−e₁*, sign + at p=2 | None |
| Conventions: cup-trace and twists | Point class, quartic, Rizov's auxiliary sign | tr(c₁(H)²)=4; Rizov's form is the negative, as stated | None |
| 1.1 `IsK3` | Empty scheme, ℙ², E×E, quartic | Geometric integrality excludes empty; ω=O(−3) and h¹=2 reject the controls | None |
| 1.2 field extension iff | K=k, tower, purely inseparable K/k | Both directions via fpqc descent and flat base change of H⁰, H¹ | None |
| 1.3 projectivity | Imperfect k, threefold | Smooth of relative dimension 2 ⇒ regular surface, 0C5P applies; no higher-dimensional claim | None |
| 1.4 RR, contraction | L=O, H, p=2 | 2χ=4+L² integral; χ(O)=2, χ(H)=4 | None |
| 1.5 numerical kernel | O, torsion, effective (−2)-curve | L·H=0 ⇒ h⁰(L)=h⁰(L⁻¹)=0 ⇒ χ≤0 against χ=2; works over any k with a k-ample H | None |
| 1.6 quartics | t=0,1; Fermat at p=2; V(x₀x₁)⊂ℙ¹ | 2, 4; (Σx_i)⁴ nonreduced; two points | None |
| 2.1 relative Picard space | Field base, nonreduced base, trivial class | Universal functions proved first; unramified from fibres; C3.2d.2–3 hypotheses met | None |
| 2.1a infinite-height kernel | Zero witness, p=2, finite height | Nonzero witness required; no division by 2; finite height routed to Nygaard | None |
| 2.2 closed one-forms | Zero form, Cartier iterates, p=2 | Two height branches only; nothing asserted for arbitrary surfaces | None |
| 2.3 no vector fields | Abelian surface, p=2, char 0 | H¹(O) excludes the control; Oda's point supplied by closure; H²(T)=H⁰(Ω¹)^∨ | None |
| 2.4 Hodge and crystalline ranks | Degrees 0–4 and 5; torsion | Diamond forces degeneration; ranks and freeness follow from CR.3.2 (3) alone | R01 |
| 2.5 formal deformations | Dual numbers, unmarked object | h¹(T)=20, h⁰=h²=0; marked functor prorepresented | None |
| 2.6 line deformation divisor | L=O, p∣2d, p∤2d | O deforms everywhere; flatness only at bad degree; c₁²=2d≠0 gives smoothness | None |
| 2.7 polarized lift | p=2, ramified trait | Existence of a finite trait T over W, not a lift over W | None |
| 3.1 `IsK3Analytic` | Empty, torus, quartic | Nonempty/connected, h¹(O)=2, quartic passes | None |
| 3.2 GAGA image | Nonprojective analytic K3 | Essential image is the projective locus | None |
| 3.3 integral Betti | Torsion in H², H³; quartic; winding loop | Pic torsion-free and H²(O) a ℂ-space kill H² torsion; duality kills H³; +1 increment | None |
| 3.4 étale ranks | ℓ=p, ℓ=2≠p, point trace | ℓ=p excluded; ℓ=2 allowed; trace 1 | None |
| 4.1 Picard base change | Identity, closed extension, non-split conic | Injective; bijective over closed k; Brauer obstruction retained | None |
| 4.2 Picard lattice | Gram [4], O, (−2)-curve, ℝ⊂ℂ | Even nondegenerate (1,ρ−1); projection-formula factor 2 on the correct side | None |
| 4.3 ranks | Rank 0, rank 22, h¹¹ | Ample class forbids rank 0; rank is not h¹¹ | None |
| 4.4 rank bounds, saturation | Index-ℓ sublattice, ρ=22, char 0 | Kummer injectivity at every level gives torsion-free cokernel; 20 in char 0 | None |
| 4.5 odd congruence kernel | n=0,1; ℓ=2,3; I+3E₁₂ | (I+ℓᵃB)^ℓ has depth exactly a+1 for odd ℓ since C(ℓ,2)ℓ^{2a} and ℓ^{aℓ} exceed a+1; −1 breaks ℓ=2 | None |
| 4.6 bounded descent | Closed k, imperfect k, finite k, X(k)≠∅ | Image of Galois in GL(Pic) finite of order ≤|GL₂₂(𝔽₃)|; integral descent only with Br(K)=0 or a k-point | None |
| 5.1 symplectic predicate | id, composition, rescaled σ, −1 at p=2 | Kernel of inverse-pullback character; generator-independent | None |
| 5.2 polarized stabilizer | Scalars of f*L≅L; L versus Lⁿ | No extra automorphisms; equal stabilizers by torsion-freeness | None |
| 5.3 finite étale | Involution, nonclosed k, p=2 | Zero tangent gives étale; kernel of a character of a finite étale group is finite étale | None |
| 5.4 Wehler example | S₁, S₂, product | Gram [[2,4],[4,2]], det −12; S₂S₁=[[−1,−4],[4,15]], trace 14, det 1, eigenvalues 7±4√3 | None |
| 6.0 supersingular discriminant | σ=0, 11; p=2 | Milgram: 8∤−20 both times; evenness of B/p at p=2 from the gap | None |
| 6.0a height inequality | h=1, 10, 11, ∞ | ρ≤20, 2, 0; ∞ not substituted | None |
| 6.0b rank-five pencil | Rank 1, F and 2F, p=2,3 | Meyer needs rank ≥5; primitive nef isotropic class; cuspidal fibre retained | None |
| 6.0c infinite height and pencil | No section, h=1, quasi-elliptic, ρ=21 | Jacobian comparison; finite height excluded; unirational branch; 21⇒22 | None |
| 6.1 tame quotient | G=1, involution, rank-20 square det | Rank 0 and det 1; 8A₁ det 2⁸; the DK square-discriminant contradiction uses §§6.0, 6.0c | None |
| 6.1a cyclic arithmetic | n=2, 4; 11, 15 | 24=8·3; 72=60+12; order-2 subgroup fixes 8; 2A₁₀ and A₁₄⊕A₄⊕A₂ have square determinants | None |
| 6.2 fixed-point table | id; orders 2,7,8; wild g | Identity excluded; counts 8,3,2 agree with ε(n) | None |
| 6.2a wild fixed loci | Empty at p=2; κ=0,1,2; N=2,d=1 | Matches wild-cyclic Theorems 1–4; no division by N−d−1 | None |
| 6.3 wild quotients | Rational, Enriques, K3 branches | e(Y)=12, b₂=10 from étale descent and Gauss–Bonnet, no ρ=b₂ | None |
| 6.3a refinements | p=11, 13; quasi-elliptic | Exceptional p=11 retained; p=13 excluded; p>7 torsion statement scoped to elliptic K3 with section | None |
| 6.4 wild prime bound | p=2, 13 | Order-p elements are symplectic; p≤11 | None |
| 6.4a Picard faithfulness | id, p=2, degree-two deck involution | Rank 22 and full Picard action essential | None |
| 6.5 étale faithfulness | ℓ=p, Enriques branch at p=2, K3 branch | Correct coefficient exclusion; 10<22 and 22>22 contradictions | None |
| 6.6 uniform bound | G=1; char 3; wild G | ℓ=5 at char 3; no averaging by |G| | None |
| 6.7d involution pencil | id; swap matrix mod 2; p=3 | Exact order 2 and p≠2 essential; integral step is an explicit obligation | None |
| 6.8 Artin invariant one | p=3: disc −9, +9, −81; rank 20 | Only rank 22 with −9 passes | None |
| 6.8a invariant dimension | G=1; C₇; order 21; both σ=1 | 24; (24+18)/7=6; (24+84+18)/21=6; exceptional branch excluded | None |
| 6.9 Mathieu character | n=1,2,7; wild | 24, 8, 3; not asserted for wild elements | None |
| 6.10 characteristic-zero bound | Trivial, 1⁸2⁸, 23-cycle | 24, 16, 2 orbits | None |
| 6.11 tame bound | Exceptional group; p=2; nonclosed k | Four orbits allowed; tame at p=2 means odd order; base change injects | None |
| 7.1 primitivity | 0, generator, 2·generator, squarefree d | 0 fails; n²∣d for λ=nµ | None |
| 7.2 root loci, primitive openness | n=0; n=3 at p=3; F, 2F, 0 | [0] excluded; d≠0, d=0≠m, d=m=0 cases complete | None |
| 7.3 polarized families | Constant family; d=0; no global line | Positive degree; local representatives only | None |
| 7.4 vanishing and polynomial | m=0, −1; d=2 | H²(O)=k at m=0; h⁰=4, 10, 20 | None |
| 7.5 cube embedding | r=0 with 2L; r=1 with 3L; d=1,2; p=2 | Failure forces L·D=1, D²=1, impossible by evenness; ℙ¹⁰, ℙ¹⁹ | None |
| 7.6 Hilbert K3 locus | Singular degeneration; equal ranks, unequal classes | Smoothness and class equality, not rank equality | None |
| 7.7 Hilbert atlas | Root at p=3; Fermat swap | Root is a Picard section; stabilizer identified | None |
| 8.1 polarized stacks | Involution stabilizer; p∣2d | Automorphisms retained; atlas over all primes | None |
| 8.2 separation | Generic identity; ruled special fibre | Extends given isomorphisms; non-ruledness from the two-form | None |
| 8.3 coarse spaces | Stabilizer; k-forms | Geometric points only | None |
| 8.4 smooth locus | d=1; p∣2d | Over ℤ[1/2]; no claim at bad primes | None |
| 8.5 finite-field finiteness | Twists; obstruction | Br(k)=0 gives a line; frames give k-points of a finite-type scheme | None |

### Adversarial pass over the declared gaps

| Contract | Instances tried | Result | Change |
| --- | --- | --- | --- |
| surface-projectivity | Imperfect k; dimension 3 | 0C5P needs regular of dimension 2 over Noetherian base; met | None |
| hypersurface-cohomology | Quartic; (1,1),(2,2); V(x₀x₁) in ℙ¹×ℙ² and in ℙ¹ | Ample sequence and positive final dimension distinguish the controls | None |
| surface-arithmetic-quotient | Degree-one and degree-two extensions | Factor [K:k] on the pushforward side only | None |
| surface-quotient-resolutions | G=1; wild G | Invariant subring normal; resolution by 0BGP; no wild vanishing asserted | None |
| tame-quotient-singularities | A₁; E₈; p∣|H| | det 2, 1; wild excluded | None |
| quotient-transcendental-comparison | G=1; ℓ∣|G| | Rational statement only | None |
| ruled-surface-two-forms | Point blowup; ℙ¹-bundle | Reflexive extension; O(−2) on fibres | None |
| matsusaka-mumford | Identity; ruled fibre | Non-ruled hypothesis essential; primary waived | None |
| elliptic-surface-geometry | E×C; K3 Jacobian over ℙ¹; χ=1 section; wild fibre; quasi-elliptic | deg L=−χ−h⁰(T); R¹j_*O=O(−2) for K3; S²=−χ; Theorem 8.3 unirationality | None |
| rational-surface-cohomology | ℙ²; inseparable dominant map | f^*f_*=deg nonzero in ℚ_ℓ even when p∣deg | None |
| adjoint-positivity | r=0,1; K3 at p=2; general type | Terakawa 1.6 branch (1) applies to K3; bounds retained | None |
| tame-lefschetz | Identity; isolated tame point; wild | Euler characteristic of fixed locus; index +1 | None |
| surface-brauer-localization | Delete points; arbitrary divisor; 8 disjoint rational curves | Residue term retained; H¹(E,ℚ/ℤ)=0 for rational trees | None |
| surface-brauer-kummer | H³ torsion zero or not; G trivial | Finite term retained until §3.4 kills it | None |
| equivariant-brauer-descent | Trivial torsor; nonzero units cohomology | Units, d₂, d₃ retained | None |
| integral-topology | O, O(1), O(−1); identity pullback | Degrees 0, +1, −1; natural | None |
| oda-interface | Closed k; no rational point; p=2 | Perfect k and X(k)≠∅ retained (oda line 2490) | None |
| witt-formal-brauer | Height h; additive group; inseparable finite flat; point blowup | Rank h; [p]=0 on G_a; norm degree; blowup H² invariance | None |
| crystalline-gauss-bonnet | Point; Δ⊂ℙ¹×ℙ¹; line in ℙ²; K3 | Values 1, +2, +1, 24 correct; but no consumer needs it | R01 |
| crystalline-picard-degree-one | Pic⁰=0; elliptic curve | Ranks 0, 2 correct; but no consumer needs it | R01 |
| crystalline-chern-derivative | Trivial line; p∣L² | Zero derivative; obstruction functional separate | None |
| artin-discriminant | p=2, σ=11, σ>1 primitive ample | Scaled evenness; 𝔽_p-linear injection to H¹(Ω¹) as in dolgachev-keum 744–752 | None |
| cross-realization | Finite order; unipotent | Semisimplicity only for finite order | None |
| tame-linear-groups | Trivial; p∣|Γ| | Prime-to-p only | None |
| mathieu-permutation-model | id; involution; 23-cycle | 24, 8, 1 fixed letters; 24·10200960=244823040 | None |
| mukai-eleven-groups-recognition | Q₈; p=2; even tame order | Rational and ℚ₂ obstructions placed correctly | None |
| exceptional-mathieu-embeddings | Same order, different extension | Structure, not order, is the hypothesis | None |

### Manifest

The 30 author-recorded entries are unchanged by this review; no source was fetched and no entry was added. The three `waived` and two `uncertified` entries are settled citations. No local path occurs in the manifest; `nikulin-symplectic` records an operator-held text by hash and local name only.

## Not verifiable

- Lean elaboration: **not available**. The design package has no `Suggested.lean`, and the brief names no Lean command for the design stage. No build result, admitted-data check or `set_option` check is claimed; these are package-stage obligations.
- `rudakov-shafarevich` §8 Proposition 3, `matsusaka-mumford` Theorem 2 and `nygaard-vectorfields` Lemma 3.3 are waived primaries; only their applications (keum lines 799–801, rizov lines 1084–1085, lang-nygaard lines 99–104) were read.
- `shioda-transcendental` Proposition 5 and `arapura-chern` §7.5 are uncertified locator-only citations; their applications (keum lines 305–325, dolgachev-keum lines 590–594; the README's own Čech derivation) were read instead.
- The `enriques-one` extraction garbles glyphs in the statements of Theorems 4.1.6 and 4.3.9; theorem numbers, page markers and the recognizable formulas (deg L=−χ(O_X)−h⁰(T), S²=−χ(O), the torsion-squared discriminant relation) agree with the README, but I did not re-open the PDF.
- The `nikulin-symplectic` extraction of equation (5.2) at line 1580 is partly garbled; the surrounding case analysis (lines 1582–1624) confirms the Euler identity and the cyclic exclusions the README attributes to it.
- The round-4 review file is absent from the package; its text was taken from the board history at commit `dcf3644`.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "5cb7464960f3986ac62e31371f899ab7f0ec1fe1", "job": "REV-DESIGN-K3SurfacesAndSymplecticBoundedness~5", "model": "fable", "worker": "chris-g"} -->
