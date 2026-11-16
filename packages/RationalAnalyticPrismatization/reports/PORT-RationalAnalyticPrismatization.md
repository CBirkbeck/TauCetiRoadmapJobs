# PORT-RationalAnalyticPrismatization

- **Branch:** `roadmap/rational-analytic-prismatization`, from `5ff4294`.
- **Head commit:** `4670ade6` "RationalAnalyticPrismatization: roadmap (README, Suggested.lean, metadata)". It adds three files, all inside `TauCetiRoadmap/RationalAnalyticPrismatization/`; nothing else is touched.
- **Build:** `lake build TauCetiRoadmap.RationalAnalyticPrismatization.Suggested` ends with `Build completed successfully (18239 jobs).` There are **0 warnings**. The module declares nothing, so there is no `sorry` warning.
- **Gate:** `gate RationalAnalyticPrismatization: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- **Dependency check** (`gate --depcheck … --movable`), full output:

      depcheck: 259 roadmaps, 2488 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line.

## Draft pull request body

Build Gelfand analytic geometry over ℚ_p and, on top of it, the rational analytic prismatization of Anschütz, Le Bras, Rodríguez Camargo and Scholze.

- **Foundations.** The roadmap first states the part of Scholze–Stefanich's theory of Gestalten that makes the six-functor formalism on Gelfand stacks possible: Stefanich rings, the n-affine, n-prim, n-proper, n-suave and n-étale maps, and the transmutation of six-functor formalisms.
- **Gelfand geometry.** It builds bounded solid ℚ_p-algebras, Gelfand rings and their Berkovich spectra, Gelfand stacks with perfect-complex descent, and derived Berkovich spaces. It then adds analytic de Rham stacks, deformation theory and cones, and Fargues–Fontaine curves and Hyodo–Kato stacks realized as Gelfand stacks.
- **The prismatization.** The core is the theory itself: rational δ-spaces, the prismatization X^Δ, the p-adic twistor stack `X^{Div¹}` and the analytic Hodge–Tate stack, with the Breuil–Kisin twist, the prismatic logarithm and Faltings' extension.
- **Decompletion.** Independently, the roadmap proves the decompletion theorem for Berkovich spaces with a continuous action of a p-adic Lie group, including the arithmetic, geometric and mixed Sen-theoretic cases.
- **End theorems.** For a smooth partially proper rigid space over a finite extension of ℚ_p:
  - pullback along `FF_{X^⋄} → X^{Div¹}` is fully faithful and an equivalence on perfect complexes, so that coherent cohomology of the twistor stack is pro-étale ℚ_p-cohomology;
  - Hodge–Tate stacks recover v-perfect complexes with their arithmetic and geometric Sen operators;
  - pro-étale torsors under p-adic Lie groups decomplete;
  - the twistor stacks satisfy Poincaré duality in the Breuil–Kisin twist, which for a point is local Tate duality;
  - the prismatic first Chern class satisfies the projective bundle formula;
  - formal Hodge–Tate stacks recover Scholze's Riemann–Hilbert functor.

None of these theorems can be stated against the pinned Mathlib and Tau Ceti, so `Suggested.lean` states nothing. Its docstring lists each headline theorem and the carriers it lacks.

AI assistance: Claude (Opus 5.5) performed the port, the source and ownership checks, the mathematical self-review and the Lean validation.

## Dependencies still in pull requests

This roadmap depends on the following roadmaps that are not yet on main. All of them are earlier than it in the merge order.

**Suppliers named in `*Needs:*` lines or supplier contracts:**
- AnalyticStacks
- SolidAnalyticRings
- RefinedTraceMethods
- TropicalAndBerkovichArithmetic
- RelativeFarguesFontaine
- VectorBundlesAndIsocrystals
- FarguesFontaineDiamonds
- PadicHodgeTheory
- AInfCohomology
- FiniteFlatGroupsAndIntegralPadicHodgeTheory
- ClassicalAdicEtaleCohomology

**Comparison partners cited only in Checks:**
- LocallyAnalyticRepresentationsOfLocalGroups
- LocallyAnalyticDistributionsPartII
- ClassicalAdicEtaleCohomologyPartII
- CohomologyComparisons
- PrismaticCohomology
- PrismaticCohomologyPartII
- PrismaticCohomologyPartIII

**Not yet a pull request:** MotivesAndAlgebraicCyclesPartII, cited at Layer 0, §0.4 and §0.6.
- It is a board package, one line above this roadmap in `ORDER.txt` (line 411 against 412).
- `roadmaps resolve` reports it as found nowhere, for that reason. I read Layer 0 in its package: §0.4 "Strictly totally disconnected Banach rings" and §0.6 "Quasi-pro-étale maps" exist as cited.

**No ids from open revisions.** The overlap check reports none, and I cite no section numbering that only an open revision defines.

## What moved from the Lean file to the README

Nothing moved. The package's `Suggested.lean` already met the Lean form:
- `module`, `import Mathlib`, one module docstring and an empty `namespace TauCetiRoadmap.RationalAnalyticPrismatization`;
- no `TauCeti.*` import and no `set_option`;
- no declarations.

I kept it unchanged.

**Headline statability, rechecked at the pins.** I went through the seven headline groups again: the comparison with FF, pro-étale cohomology as twistor cohomology, Hodge–Tate stacks and Sen theory, decompletion, twistor duality, the projective bundle formula and the Riemann–Hilbert functor.
- **Gelfand-stack carriers.** Each of them needs a carrier that is absent at both pins. Gelfand rings, Gestalten, analytic rings and six-functor formalisms appear in neither Mathlib `1b1ccf4b` nor Tau Ceti `2fd255d9` (grepped). `TauCeti.FarguesFontaine.spaX` is only a topological space of valuations.
- **Tate's computation.** The one classical statement that is statable at the pins, Tate's calculation of H^i(Gal_K, C_p(n)) via Mathlib `continuousCohomology`, is not a headline of this roadmap. PadicPeriodRings §1.4 on main owns it and its `Suggested.lean` states it. This roadmap's headline is the Hodge–Tate stack form, which is not statable.
- **Lazard's criterion (10.4).** It is statable for ℤ_p^d, but it is a supporting classical result, not a headline.

**`#check @name` pass.** There are no declarations, so the pass had nothing to elaborate and no binder could be lost.

## Supplier replacements and duplication removals

**Supplier replacements:**
- **Tate's calculation (11.2, Scope).** 11.2 asked to "prove Tate's computation H^i(Gal_K, C_p(n)) ≅ …". The classical H⁰ and H¹ calculation is owned by PadicPeriodRings §1.4 on main, which states it with Mathlib `continuousCohomology`; its `Suggested.lean` declares it. In this README:
  - 11.2 now states only the identification H^i(Gal_K, C_p(n)) ≅ H^i(X^HT, O{n}) ≅ H^i(K →ⁿ K) for all i, which also gives the vanishing for i ≥ 2. It says that in degrees 0 and 1 this recovers PadicPeriodRings §1.4.
  - The first Check of 11.2 compares its values with that section.
  - Scope, the PadicPeriodRings supplier contract and the Layer 11 `### Dependencies` (as a Check) record the citation.
- **Mathlib `continuousCohomology`.** I added it to "From Mathlib", verified at Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:131. It is the Galois cohomology used in the Checks of 6.4, 11.1, 11.2, 11.7 and 12.2. The contract also says what it does not provide: it gives cohomology groups rather than a derived complex, and the pin has no comparison with the quasi-coherent cohomology of BG^cont.

**Library declarations at the pins.** All 23 declarations named in the contracts exist at the stated file and line, at Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9` (read from `lake-manifest.json`):
- **Mathlib:** `LightProfinite`, `LightCondensed`, `MulRingSeminorm`, `spectralNorm` (the spectral value of a minimal polynomial, as the README says), `WittVector`, `WittVector.fontaineTheta`, `BDeRhamPlus`, `CondensedMod.IsSolid`, `PadicComplex`, `PadicInt.mahlerEquiv`.
- **Tau Ceti:** `TauCeti.LocallyAnalytic`, `.eval`, `TauCeti.AnalyticStage.amiceMap` (a continuous linear map; Basis.lean:41–42 says Amice's theorem is not proved there, as the README claims), and the ten `TauCeti.FarguesFontaine` declarations.

**Roadmap declarations named in the README:**
- `Huber.GelfandSpectrum` is AdicSpacesPartIII `Suggested.lean` line 798 (main).
- `Spectrum` is TropicalAndBerkovichArithmetic `Suggested.lean` line 37 (open head).

**Duplication sweep, by object** (`roadmaps grep` over main and the 453 open heads, then reading the hits). The objects searched were: Gestalten, Stefanich rings, transmutation, Gelfand rings and stacks, nilperfectoid, †-nilradical, derived Berkovich spaces, analytic de Rham stacks, Hyodo–Kato stacks, twistor stacks, the analytic prismatization, Hodge–Tate stacks, δ-spaces, Div¹, decompletion, Lazard's criterion and the Tate–Sen axioms.
- **AnalyticStacks (open).** It hands Gelfand rings and stacks, the Fredholm property of Gelfand rings, derived Berkovich spaces, de Rham stacks and prismatization to this roadmap, and places Gestalten outside its own scope. So there is no second owner.
- **CohomologyComparisons §2.24.** Its "analytic prismatic F-crystals" are integral F-crystals on formal O_K-schemes, a different object.
- **"Decompletion" elsewhere.** On main, PhiGammaModulesAndIwasawaCohomology §1.4 is the cyclotomic (φ, Γ) decompletion, which a Check of 11.1 already cites. LocalFieldsRamificationPartII §4.2 is valuation-theoretic decompletion, unrelated. VectorBundlesAndIsocrystalsPartII uses classical trace decompletion inside a proof.
- **"Tate–Sen axiom".** It occurs only in PadicPeriodRings (classical Galois-cohomology estimates, cited in 10.10).
- **"Div¹".** The FarguesFontaineDiamonds and DiamondSixOperations hits are the v-sheaf Div¹, which this roadmap imports and realizes as a Gelfand stack.

Nothing was removed besides the Tate restatement above, so "Scope and ownership" records only that citation.

**Ownership against open pull requests.** I checked it through the roadmap tools at the indexed heads (`roadmaps grep`, `roadmaps resolve`, `roadmaps overlaps`). For AnalyticStacks, TropicalAndBerkovichArithmetic and RefinedTraceMethods I also read the checked-out heads. No declaration of `Suggested.lean` exists, so no fully qualified name can collide.

**The declared gap `gap:proetale-v-comparison`** (DiamondsAndVStacks §D6.5) is kept.
- The form "What X must provide (gap:…)" is used by 20 roadmaps on main.
- DiamondsAndVStacks is on main.
- No roadmap on main or open states the ℚ_p-coefficient pro-étale/v comparison (searched).

## Fixes from the upstream reading

1. **11.2, Tate's calculation.** The README restated a calculation that PadicPeriodRings §1.4 on main owns. It now cites that section and states only the Hodge–Tate identification (above).
2. **11.2, statement numbering.** The proof route refers to "(1)" and "(2)", but the statement was not numbered. I numbered the two claims (1) 0-properness with Perf(X^HT) ≃ Perf(X̂^⋄) and (2) `L_{X^HT/X} ≅ O[−1]`.
3. **11.2, proof route.** The cartesian square was written with `FF_{X̂^⋄}`. It is now `FF_{X^⋄}`, matching the Cartier divisor X̂^⋄ → `FF_{X^⋄}` in the same sentence and ALRS line 7825. FF_− takes arc-stacks, and the perfectoidization of X̂^⋄ is X^⋄.
4. **8.2, quotient notation.** "Div¹ = Div¹~/φ" now reads "Div¹~/φ^ℤ", consistent with `X^{Div¹} = X^{Div¹~}/φ^ℤ` in the same sentence and with the Conventions.
5. **10.11, an unstated target.** "Prove the comparison with arc-stacks for perfectoid X (ALRS Lemma 5.8.2)" said nothing about what is compared. It now states the result: if X̂^⋄ → X is an isomorphism and `β_{X,Z′}` is an equivalence for Z′ = X^la/G^la × Z, then perfectoidization gives Map(X^la/G^la, Z) ≃ Map_{ArcStk_{ℚ_p}}(X^⋄/G, Z^⋄). It carries an API bullet; checked against ALRS line 7511–7520.
6. **10.11, mapping anima.** `β_{X,Z}` is now written as a map of anima of maps over X^la/G^la, as in ALRS line 7459. The README also says that its étale version lives on the Berkovich-étale site of X/G^cont, identified with that of X^la/G^la by 10.7.
7. **10.9, timeless wording.** "The strong decompletion hypothesis is kept: the source does not know the general case" now reads "is part of the statement: ALRS does not prove the equivalence on perfect complexes for arbitrary continuous actions".

**Resolved from the last package review's "Not verifiable" list.** At ALRS line 2317, the extracted "−" before log|[ϖ♭]|_x log|p|_x is the fraction bar of the quotient, not a minus sign. With a real minus sign, κ would be negative on the whole disc (both logarithms are negative there), contradicting the target [0, ∞) stated on line 2316. So the README's formula κ_ϖ = log|[ϖ]|/log|p| is the source's.

## Adversarial mathematics pass

The values were computed this round. Numeric claims were rechecked by script:
- **Legendre bound of the 10.4 route:** 27 000 random multi-indices (p = 2, 3, 5; h = 0, 1, 2; d = 1, 2, 3), 0 violations.
- **Taylor-coefficient bound of 10.4:** checked for p = 3, 5, 7 and n < 400.
- **Breuil–Kisin identity (9.8):** checked at q = 1.3.
- **Telescoping product (8.4):** checked.

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| Conventions, radius | untilt C, ϖ = p♭; φ; locus p = 0 | \|[p♭]\| = \|p\| = p⁻¹ so κ = 1; κ∘φ = pκ, translates p^n; κ → 0 as \|p\| → 0 (log\|p\| → −∞) | consistent | none |
| Conventions, twists | O(1) on FF_{C♭}; G_m in HK; cyclotomic e | H⁰(O(1)) = B^{φ=p} ≠ 0, H⁰(O(−1)) = 0; φ(dlog T) = p·dlog T = O(−1) = (ℚ_p, pφ); φ(e) = [p]_q⁻¹e | consistent | none |
| Conventions, Sen sign | O{1} on Q_p^HT | θ = +1 = HT(χ_p) of FFGIPHT §R07.P7.2 | consistent | none |
| 0.1 | C = D(k); A₂ = 1Pr | End(1) of Mod_{D(k)}(1Pr) = D(k) = A₁; End(1) of 1Pr = Ani ≠ D(k) | limit description pinned | none |
| 0.2 | ∗ → B²G_m over k; ⋃A^n; ∅ | (B/A)₀ = k, B₁ = A₁ but not 0-affine; colimit not n-affine; ∅ 1-affine, 0-affine after base change to D(k) | consistent | none |
| 0.3 | A¹ over D(k); X^dR, dim X > 0; X a point | forgetful D(k[x]) → D(k) colimit-preserving; diagonal pushforward (M_n) ↦ lim M_n not colimit-preserving; point: identities | n-proper needs diagonals | none |
| 0.4 | A¹ over D(k); ∅; P¹ | M ⊗ k[x] = ⊕M x^n fails ∏, so not 0-suave but 1-étale; ∅ 0-étale; P¹ 1-étale, 0-affine diagonal, not 0-affine | consistent | none |
| 0.5 | one-object C; finite sets; AnSpec(0) | K_D = Mod_V(1Pr); fold map f_! = f_* = ⊕, relative algebra Λ×Λ; empty family covers iff D(X) = 0 | consistent | none |
| 1.1 | ℚ_p; ℚ_p[T]; 0 | A°(∗) = ℤ_p; Σp^kT^k ∉ ⊕ℚ_pT^k so A^b = ℚ_p; 0° = 0 | consistent | none |
| 1.2 | ℚ_p⟨T⟩; ℚ_p[ε]/ε²; germs at 0; ℚ_p⟦T⟧[1/T] | A_{≤p^{−k}} = p^kℤ_p⟨T⟩ (spectral norm ≤ p^{−k}); Nil† = ℚ_pε; T ∈ Nil† not nilpotent; Nil† not an ideal (T unit, 1 ∉ Nil†) | bounded hypothesis needed | none |
| 1.3 | ℚ_p⟨T⟩; ℚ_p[ε]/ε²; ℚ_p⟨T⟩_{≤1}; 0 | u-completion ℚ_p⟨T⟩; ℚ_p, 1+ε ↦ 1, ε ↦ 0; †-reduced not uniform; 0 | unit criterion holds | none |
| 1.4 | ℚ_{p,■}⟨ℕ[S]⟩_{≤1}; ℚ_p⟨T_n⟩ | 𝔽_{p,■}[S] summand not discrete; Hilbert cube in M, infinite dimension | not Gelfand / not qfd | none |
| 1.5 | ℚ_p; ℚ_p×ℚ_p; 0; trivial abs. value | 1 point, 2 points, ∅; \|p\| = 1 ≠ p⁻¹ excluded | consistent | none |
| 1.6 | {\|T\| ≤ 1}; {\|T\| ≤ \|p\|}; f = 1, g = p; stalk at 0 | A itself; colim_{r>1/p} ℚ_p⟨T/r⟩; ∅ locus, zero ring; A_x germs, (A_x)^u = ℚ_p | consistent | none |
| 1.7 | ℚ_p; ℚ_p×ℚ_p; ℚ_p⟨T⟩ over ℚ_p; ℚ_p[ε]/ε² | perfect complexes; ranks (a, b) may differ; not dualizable; ℚ_p = B/ε has infinite resolution | Fredholm ≠ fibrewise finite | none |
| 1.8 | C_p; C_p[ε]/ε²; ℚ_p(μ_{p^∞}); ℚ_p | nilperfectoid; nilperfectoid; uniformly perfectoid not nil (†-red ≠ completion); not perfectoid | consistent | none |
| 2.1 | GSpec(ℚ_p), GSpec(0), A × B | final, initial; D(A×B) = D(A) × D(B) | consistent | none |
| 2.2 | closed disc; open disc; identity | 0-affine, f_* = forgetful; f_!O in degree 1 vs f_*O in degree 0; trivial complexes | properness separates the discs | none |
| 2.3 | GSpec(ℚ_p), ∅; (∏ℤ_p)[1/p]; ⊕_{n≥0}ℚ_p[−n] | perfect complexes, 0; compact static non-nuclear; nuclear, in no D_{≥−n} | D⁺ ≠ Nuc both ways | none |
| 2.4 | ℚ_p → ℚ_p^cyc; 0; ℚ_p | descendable (retraction); empty cover; residue field ℚ_p not alg. closed | consistent | none |
| 2.5 | two points; ∅; ℕ∪{∞} | GSpec(ℚ_p²); GSpec(0); C^lc = eventually constant ≠ C(S,ℚ_p) | Betti ≠ cont | none |
| 2.6 | open disc; closed disc vs compactification; r = 0; ∅ | open Berkovich disc; same algebra ℚ_p⟨T⟩; K⟨T⟩_{≤0} misses 1/(1 − T/c); empty | partially-proper scope needed | none |
| 2.7 | GSpec(ℚ_p⟨T⟩); A = ℚ_p[u^{±1}], \|u\| = 2; O_X | recovers X; GSpec_X(A) = ∅, A ≠ 0; X | consistent | none |
| 2.8 | ℚ_p[ε]/ε²; Marc(𝔽_p)×_{Marc(ℤ_p)}Marc(ℚ_p); final object | Marc(ℚ_p); ∅ (p zero and unit); X̂ of Marc(ℚ_p) ≠ GSpec(ℚ_p) final | left adjoint not a geometric morphism | none |
| 3.1 | A¹; ℚ_p[ε]/ε²; C_p[ε]/ε²; ∅ | A¹/G_a^†; point; ε and 0 identified; empty | consistent | none |
| 3.2 | BG; disjoint union | BG^sm; ⊔ of de Rham stacks | consistent | none |
| 3.3 | A^d, d = 0; HK twist; open disc | O[2d], O; no Frobenius twist; smooth not proper | consistent | none |
| 3.4 | ℚ_p[ε]/ε²; C_p[ε]/ε²; C(ℤ_p, C_p) | ℚ_p ⊕ ℚ_pε vs ℚ_p (sm); a + bε, a ∈ ℚ_p; C(ℤ_p, ℚ_p) ∋ id ≠ C^lc | la ≠ sm | none |
| 3.5 | A¹, G_m; BG_m, A¹/G_m; Spec R(∗) | A(∗), A(∗)^×; ⋃ GSpec(ℚ_p⟨p^nT⟩) = A¹ ≠ closed disc; perfect strongly Tannakian; S | consistent | none |
| 3.6 | GSpec(ℚ_p); (O, T), (O, T²), (O, 1); A¹/G_m | s ≠ 0: ∅, s = 0: ℚ_p ⊕ ℚ_p[1]; origin, ℚ_p[T]/T², ∅; I of weight −1 | consistent | none |
| 4.1 | †-rational loc.; zero section at C_p[ε]/ε²; closed disc | †-formally étale; Nil†(A) = C_pε vs point; L = ℚ_p⟨T⟩dT, not †-formally smooth | consistent | none |
| 4.2 | open disc; ℚ_p⟨T⟩_{≤1}; ℚ_p⟨T⟩; closed subdisc | rigid smooth; Berkovich- not rigid smooth; neither; Berkovich-étale not rigid étale | two "étale"s differ | none |
| 4.3 | two discs along origins; A = C = ℚ_p[T], B = ℚ_p; Z = ∅ | ℚ_p⟨S,T⟩/(ST); (⊕_{even}, ⊕_{odd}) not in the image; X ⊔ Y | D⁺/Perf restriction needed | none |
| 4.4 | ℚ_p[ε]/ε² → ℚ_p; ℚ_p⟨T⟩ → ℚ_p | †-thickening; surjective, †-reductions differ | consistent | none |
| 4.5 | ℚ_p⟨T⟩; C_p; ℤ_p[T]; ℤ_p ⊗^L_{ℤ_p[x]} ℤ_p | ℚ_p⟨T⟩dT; C_p(1)[1] ≠ 0; ℤ_p[T]dT not p-complete; A[1], π₁ = π₂ = ℤ_p | p-completeness needed | none |
| 4.6 | A¹; zero section; (A¹)^dR; A = M = ℚ_p; M = ℚ_p[−1] | O·dT; ℚ_p[1], dual not connective; L = 0; ℚ_p ×_{ℚ_p ⊕ ℚ_p[1]} ℚ_p = ℚ_p[ε]/ε²; section not surjective | connectivity needed | none |
| 4.7 | †-rational loc.; C(S, C_p) clopen; P¹ with discs of radius p | not finite étale; flat; d(1/T) = −T⁻²dT, degree −2; unit discs at Gauss point not a cover | consistent | none |
| 4.8 | BG_m; BG_a^†; trivial group; A¹ at C_p[ε]/ε² | O[−1]; O[−1]; 0; BA, BC_p, B(C_pε) | consistent | none |
| 5.1 | point; ∅; A¹; zero section of ℚ_p⟨x⟩ | A¹/G_m; G_m/G_m; BG_a(−1); gr = ℚ_p[x̄], identity: O_X[t] | weight −1 pinned | none |
| 5.2 | X = GSpec(ℚ_p), M = ℚ_p; D × 0; GSpec(C_p) → Spf B⁺_dR | point, ℚ_p[ε]/ε²; trivial lift exists; lift to B⁺_dR/ξ² may not | consistent | none |
| 5.3 | GSpec(K); open disc | K in weight 0; O → Ω¹, gr¹ = Ω¹[−1](1) | graded algebra loses ∇ | none |
| 5.4 | point; A¹ over G_m/G_m; skyscraper ℚ_p[θ] | A¹/G_m; A¹/G_a^†; Σp^{n²}θ^n has unbounded partial sums | same vector bundles, different sheaves | none |
| 6.1 | S = Spa(C♭); S = ∅; [0, s] | Y_{(0,∞)}; ∅; p = 0 point in {\|p\|^s ≤ \|[ϖ]\|}, ring not a ℚ_p-algebra | r > 0 needed | none |
| 6.2 | Marc(C♭); Marc(ℚ_p^{cyc,♭}); ∅ | FF_{C♭}; cont vs sm quotients, not iso; iso | ALRS line 2357–2381 agrees | none |
| 6.3 | G_m; P¹; ω = O(−1)[2] | O ⊕ O(−1)[−1]; O ⊕ O(−1)[−2], ω = O(1)[2]; trace to O(−2) ≠ O | sign of twist pinned | none |
| 6.4 | étale g; FF_{C♭}; FF_{Marc(ℚ_p)} | d = 0, O; H⁰(ℚ_p(1)) dim 1 vs H⁰(O(1)) = B^{φ=p}; dims (1, 2, 0) ↔ H^{2−i}(ℚ_p(1)) | consistent | none |
| 7.1 | Spa(C♭); D^{×,<1,perf}; ι into D ⊔ D; S = ∅ | FF_{C♭}; not a †-thickening; ι^⋄ not iso; (∅, ∅) | consistent | none |
| 7.2 | A perfectoid; C_p[ε]/ε²; ℚ_p(μ_{p^∞}); 0 | 𝒳_T = D^×_{FF,T♭}; thickened at p^n, n ≥ 0; map not iso; ∅; A_{≤1} = O_{C_p} ⊕ C_pε | Witt description only for nilperfectoid | none |
| 7.3 | final object; (S, 𝒳); T_FF on classical | GSpec(ℚ_p); 𝒳; T(FF_S) | consistent | none |
| 7.4 | Y = Marc(𝔽_p); Marc(K)×Marc(K) | GSpec(ℚ_p)/φ^ℤ; (κ₁, κ₂) independent over GSpec(ℚ_p) | consistent | none |
| 7.5 | A perfectoid; C_p[ε]/ε² | identities; ℚ_p ×_{C_p} C_p[ε] = ℚ_p ⊕ C_pε = ℚ_p^la(A) (3.4) | agrees with 3.4 | none |
| 7.6 | BC(O) at ℚ_p[ε]/ε²; BC(O(1))(C_p); λ = −1; D_λ swap | kernel ℚ_pε; 1 + 𝔪_{C♭}; π₀ = C_p/ℚ_p, π₁ = C_pε vs 0; H⁰(O(1)) = 0 contradiction | G_a^an corner, D_{−λ} pinned | none |
| 8.1 | [p]_q; q − 1; [p]_q²; X − p | degree one; empty; degree two; degree one | consistent | none |
| 8.2 | ∅; point; Y = D over perfect prism; C_p[ε]/ε² | ∅; Q_p^Δ; 𝒳/φ^ℤ (relative) vs D^{Div¹} ≠ FF_D; 𝒳_T not perfect | relative ≠ absolute; Div¹~/φ^ℤ notation | 8.2 quotient written /φ^ℤ |
| 8.3 | GSpec(C_p); perfectoid Y; ℚ_p[ε]/ε² | Y^HT = Y; Y^{Div¹} ≠ FF_Y; same de Rham stack | consistent | none |
| 8.4 | X_cyc | ∏_{n<N}[p]_{q^{p^n}} = (q^{p^N} − 1)/(q − 1) (numeric check), limit log q/(q − 1); translates disjoint | consistent | none |
| 8.5 | HT locus; GSpec(ℚ_p); reciprocal radius | κ = 1, p^{−n}; Q_p^HK over (1, ∞); the swapped reading would make Div¹ = Q_p^HK, false at the origin | reciprocal as stated | none |
| 8.6 | GSpec(ℚ_p); ∅ | Div¹ = A¹/G_m ×_{A^{1,dR}/G_m^dR} Q_p^HK; empty corners | consistent | none |
| 8.7 | non-surjective open immersion; identity | †-formally étale, not an arc-cover, not epi; isomorphisms | arc-cover needed for (2) | none |
| 9.1 | GSpec(ℚ_p); A¹; GSpec(C_p) | T = 0, π = id; G_a^†{1}-gerbe; T_Y[1]{1} = C_p(−1)(1) = O, trivial | consistent | none |
| 9.2 | X = D; D × BG_a | every corner 𝒳/φ^ℤ, HK relative ≠ absolute; T = O[1] not a vector bundle, B²G_a^†{1}-torsor | vector-bundle hypothesis needed | none |
| 9.3 | Tate-rational cover; zero section; identity | L = 0, epi; L = ℚ_p[1], not epi; iso | consistent | none |
| 9.4 | point; X = D; D × BG_m | Spf(K_∞[[t]])/ℤ_p^{×,la}; D^†, D^∧; BG_a^dR{1} loop group of B²G_a^dR{1} | not confined to Berkovich spaces | none |
| 9.5 | point; G_m toric | FE = O{1}; γ ↦ t nonzero class in H¹(ℤ_p(1), Ĉ(1)); L = C_p(1)[1] | non-split, subobject Ô(1) | none |
| 9.6 | point; G_m | Q_p^{HT^} = Â¹/G_m ×_{BG_m^dR} GSpec(ℚ_p); lifts of dT/T | consistent | none |
| 9.7 | q = ζ_p; q = ζ_{p²}; q^{1/p} = ζ_p | [p]_q: 0, ≠ 0, p; log q: 0, 0, 0; (log q) ≠ ([p]_q) | consistent | none |
| 9.8 | cyclotomic e; without ⟨1⟩; log q ⊗ e⟨1⟩ | φ(log q/(q−1)) = p[p]_q⁻¹·log q/(q−1) (numeric, q = 1.3), φ(e) = [p]_q⁻¹e; off by p; φ(e) = e, slope 0 | O⟨1⟩ needed | none |
| 9.9 | X_cyc; untwisted log | p⁻¹φ(log q) = log q; φ(log q) = p·log q not equivariant; e_A ↔ p·e | consistent | none |
| 10.1 | Π trivial; ℤ/2 on ℚ_p² by swap | Λ = R; M₂(ℚ_p) vs untwisted ℚ_p⁴ | twist pinned | none |
| 10.2 | Π = 1; ℤ_p, χ(a) = (1+p)^a; ∏_ℕ ℤ_p | Φ = id; one-dimensional comodule; Φ not fully faithful | Lie hypothesis needed | none |
| 10.3 | ℤ_p; finite G; C(ℤ_p, ℚ_p); r = 1/p; G = ℤ | Mahler p^n, \|p^n\|r^n → 0 for r < p; G^la = G^sm; C^la ⊊ C; p discs; G^la = G^cont, Ψ = Φ | non-compact case needed for ℚ_p^× | none |
| 10.4 | (1+p)^a; Σp^k binom(a, p^k); ℚ_p(p^{1/2}) vs ℚ_p with ϖ = p²; 1 + p²ℤ_p | criterion for r < p, Taylor coefficient ≤ p^{−n(p−2)/(p−1)} (script, p = 3, 5, 7); p^{−k}r^{p^k} → ∞; \|p\|_ϖ = 1/4 vs 2^{−1/2}; τ(n) = 2n vs n | Legendre bound holds (27 000 cases) | none |
| 10.5 | R = ℚ_p; R = C(G, ℚ_p); A = C^la; G = ℤ | decompletes iff la; R^la = C^la_G; M decompletes over B, not over A; one factor | hypothesis of 5.2.27(1) needed | none |
| 10.6 | G trivial; trivial action; X = ℤ_p^cont | h = Betti projection; O^la = O; D(ℚ_p) vs ℤ_p^sm/ℤ_p^la | h not an isomorphism | none |
| 10.7 | ℚ_p^cyc; G trivial; C(G, ℚ_p) | K^la = ℚ_p(μ_{p^∞}) (BC16); R^la = R; R^la = C^la_G, X^la = G^la | consistent | none |
| 10.8 | Λ° trivial action; G = ℤ_p, π₋₁; d = 0 | killed by ϖ^ϵ iff 2^{−ϵ}r^{w(γ)} ≤ 1; π₋₁ ≠ 0; every module decompletes | torsion bound needed | none |
| 10.9 | G trivial; one-dimensional Γ | identity; W^la = W^fin, K̂_∞ ⊗ W^la = W | strong hypothesis part of statement | 10.9 wording |
| 10.10 | d = 0; toric d = 1, r = p^{−n}; Λ = ℚ_p | arithmetic case; (q^{p^{k−n}} − 1)T^r, ϵ_{n,k} = p^{k−n}, ρ = p^{k−n−1} ∈ ℤ[1/p]_{>0}; exponents v_p(ϖ)⁻¹ℤ not dense | discretely valued Λ excluded | none |
| 10.11 | trivial torsor; Γ finite; G trivial; GL_n(ℤ_p) | trivial ↦ trivial; BΓ^sm own de Rham stack; contractible anima; P overconvergent nbhd in GL_n | consistent; 5.8.2 now stated | 10.11 Lemma 5.8.2, β over X^la/G^la |
| 10.12 | G trivial; closed disc; D^×_{FF,ℚ_p^cyc} | Betti projection; End(1) = ℚ_p vs ℚ_p⟨T⟩; BC(O(1))∖{0}/ℤ_p^{×,la} | O^la-module restriction needed | none |
| 11.1 | ℚ_{p²}; ℚ_{p³}; π_*O | untwisted dims (2, 4, 0) vs RΓ(Gal_K) (1, 3, 0), χ = −2; twisted invariants ℚ_p³ vs a field ℚ_{p³} under σ⁻¹; C vs C^la | twist by σ | none |
| 11.2 | C_p(n), n ≠ 0 and n = 0; θ = −1 | θ = n invertible, H* = 0; H⁰ = H¹ = K, H² = 0, matching PadicPeriodRings §1.4 (K for i = 0, log χ class); Sen weight −1 contradicts PadicHodgeTheory §4.4 | consistent | Tate cited, (1)/(2) numbered, FF_{X^⋄} |
| 11.3 | d = 0; d = 1; continuous quotient | Div¹ = X_cyc/ℚ_p^{×,la}; ∂_a q^a at a = 1 is (log q)q; C vs C^la | consistent | none |
| 11.4 | X = D; G_{m,D} | FF_D, identity; [T♭]^r ↦ [ε]^r[T♭]^r | consistent | none |
| 11.5 | dim 1; X = D | two-term Higgs complex; Ω¹ = 0, θ = 0, X^HT = D | consistent | none |
| 11.6 | GSpec(K); ∅; non-reduced X | 11.1; empty; (1.2.2) differs (ALRS line 483) | smoothness needed | none |
| 11.7 | GSpec(ℚ_p); K of degree n; connected X | dims (1, 2, 0), χ = −1; h¹ = n + 1 (rank of K^×^), χ = −n; H⁰ = ℚ_p | consistent | none |
| 11.8 | GSpec(K); G_m; ℚ_{p²} | L = O[−1]; non-split extension; K ⊗ K = K × K, product over ℚ_p wrong | product over GSpec(K) | none |
| 11.9 | G finite; G trivial; GSpec(ℚ_p), G = ℤ_p (p = 2 and p odd) | finite étale torsors; points; Hom(Gal, ℤ_p) of rank 2 (ℚ₂^× ≅ ℤ × ℤ/2 × ℤ₂) | consistent | none |
| 11.10 | K(μ_{p^∞}); trivial torsor | Lie(Γ) = ℚ_p, θ dual to identity; g_β = 0 | consistent | none |
| 12.1 | open immersion; origin of disc; cusp; ℚ_p⟨T_n⟩ → ℚ_p | Δ-!-able; L = ℚ_p[1]; L_{k/R} = k²[1] ⊕ k[2], perfect, H^{−2} ≠ 0; I/I² infinite | finite presentation, not amplitude [−1, 0] | none |
| 12.2 | Div¹ cohomology; off HT locus; mirabolic | (1, 2, 0) ↔ ℚ_p(1) (0, 2, 1); O{1}[2] restricts to O⟨1⟩[2]; δ(p) = [pℤ_p : ℤ_p] = p⁻¹ | O⟨1⟩, not O⟨−1⟩ | none |
| 12.3 | d = 0; G_m; P¹ | O; O{1}[2], with 12.2 O{2}[4]; f_!O = O ⊕ O{−1}[−2] ≠ O{1}[2] | upper vs lower shriek | none |
| 12.4 | P¹; identity; open disc | dual of O ⊕ O{−1}[−2] = O ⊕ O{1}[2]; trivial; f_! ≠ f_* | consistent | none |
| 12.5 | d = 1; d = 0; O⟨1⟩ values | O{1}[2] ⊕ O, c₁ in the second summand; O; slope-one bundle vs Tate twist | O{1} pinned | none |
| 12.6 | point; Fil^i B_dR; χ with nonzero derivative | F(ℚ_p) = B⁺_dR; h_*1 = 1 ⊕ 1[−1] = Γ(BG_a^alg, O); θ invertible, not †-nilpotent | degree +1 class | none |
| Mathlib `continuousCohomology` (new contract) | trivial group; H^0 | homology of homogeneous cochains; H⁰ = invariants (LowDegree.lean:88) | groups only, no derived complex | contract added |

## Unresolved, and for the human reviewers

**Human questions from the last package review, unchanged:**
- **Unpublished sources.** The main sources are unpublished: ALRS and Gest are author-page preprints or notes, ABLB and RCSolid are arXiv preprints.
- **Licence.** ALRS, Gest and Sch24 were read from author pages, and no licence is stated for them.
- **Declared gap.** The README declares one gap, `gap:proetale-v-comparison`, against DiamondsAndVStacks §D6.5.
- **Arrangement.** Inside Layers 7–12 the subsections largely follow ALRS §§3.3–6.7. The previous review judged this order forced by the `*Needs:*` lines, and I agree: every layer's dependencies point backwards.

**MotivesAndAlgebraicCyclesPartII** (Layer 0, §0.4, §0.6) is a board package, not yet a pull request. It must merge before this roadmap; the worker names it in the merge-order paragraph.

**Sources not reopened.** Beyond the passages named above, I did not reopen each locator against its source. I relied on the sampled verification of the previous review rounds for the other locators, and on my own reading of ALRS lines 2310–2330, 2352–2400, 476–486, 7454–7560, 7798–7830, 8082–8095 and 8745–8760.

**Untrusted text.** I found no instruction-like or suspicious passage in the package, its reports or the roadmaps I read.


Pull request: #2456 (roadmap/rational-analytic-prismatization at 4670ade)
