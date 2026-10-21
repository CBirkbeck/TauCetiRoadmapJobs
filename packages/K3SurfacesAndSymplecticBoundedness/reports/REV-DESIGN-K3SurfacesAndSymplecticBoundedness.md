<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/63#issuecomment-6307011154 -->
Review (claude) of e9cbc67

Verdict: needs_changes

1. **F01** (P1) Six K3-specific "proof floor" gaps have no supplier

   Location: README lines 122–136 and plan.json gaps `nygaard-kernel`, `wild-fixed-locus`, `supersingular-faithfulness`, `mukai-k3-invariants`, `cyclic-fixed-point-proof`, `wild-prime-proof` (all `"supplier": "none"`); README line 122 "`gap:nygaard-kernel` — Infinite-height kernel contradiction. Supply the K3-specific kernel contradiction".

   Claim: six proof obligations consumed by targets 2.2, 6.2, 6.3, 6.4, 6.5 and 6.9 are declared as gaps with supplier `none`.

   Witness: plan.json `"supplier": "none"` on all six; the README's own scope paragraph (line 7) owns "symplectic actions, K3 quotient calculations". A gap whose supplier is `none` is unowned by the brief's rule. Their content is K3-specific (Nikulin §5 cyclic arithmetic at nikulin-symplectic lines 1582–1624; Dolgachev–Keum §2 refinements at dolgachev-keum lines 138–165; Lemmas 4.2–4.4 at lines 590–682; wild-cyclic Theorems 1–4 at lines 14–44; Keum §6 at lines 788–815), so no other roadmap can own it.

   Repair: delete these six gaps and plan each as a named target of this roadmap with hypotheses, locator, API and three Checks, placed before its consumer: a Layer 2 target for the infinite-height kernel statement (state the mathematics of Lang–Nygaard lines 93–104, i.e. the unirational/ρ=22 reduction, citing the waived source by locator only); Layer 6 targets `tameCyclicFixedPointArithmetic` (Nikulin §5 relations, the two extra exclusions of dolgachev-keum lines 517–520), `wildFixedLocusAlternatives` (wild-cyclic Theorems 1–4), `wildPrimeBound_fixedLocusRefinements` (dolgachev-keum Propositions 2.3, 2.5, 2.9, 2.11, Theorem 2.13), `supersingularPicardFaithfulness` (statement of Rudakov–Šafarevič §8 Proposition 3 with the waived locator), and `tameInvariantDimension_ge_five` (dolgachev-keum Lemmas 4.2–4.4, Proposition 4.5). Update the `*Needs:*` lines of 2.2, 6.2–6.5 and 6.9 accordingly.

2. **F02** (P1) `gap:elliptic-surface-geometry` is generic theory with no owner

   Location: README line 124 "Exact generic ownership is unassigned; the K3 instances remain targets here."; plan.json gap `elliptic-surface-geometry`, `"supplier": "none"`, needed by 6.1, 6.3, 6.4.

   Claim: genus-one fibrations, Jacobian fibrations, singular fibres and the discriminant relation (3.1) are consumed as a prerequisite without an owner.

   Witness: no roadmap on main mentions elliptic surfaces or genus-one fibrations (grep of `TauCetiRoadmap/*/README.md` and `Completed/*/README.md` for "elliptic surface", "genus-one fibration", "Enriques surface" returns nothing); the gap names no supplier.

   Repair: name a supplier and a proposed section, for example SchemeAndStackFoundations proposed Part II §genus-one-fibrations (relative minimal models, Jacobian fibration, Kodaira–Néron fibre types in every characteristic, the root-lattice relation `d_M = a² d_R(φ)` of dolgachev-keum line 443, and the p-torsion-section statement of Theorem 2.13), with one `needs` sentence per theorem family; keep only the K3 instances here.

3. **F03** (P1) `gap:consumer-inventory` is a gap with supplier `none` and no consumer target

   Location: README line 132 "`gap:consumer-inventory` — Named consumer contracts. Identify the exact names and import sections of the filed K3/Bloch-group consumers."; plan.json gap `consumer-inventory`, `"supplier": "none"`, `"neededBy": []`.

   Claim: an inventory note is declared as a supplier gap.

   Witness: plan.json records `"supplier": "none"` and an empty `neededBy`; the README itself says "This inventory contract is not a proof prerequisite." The intake announces gaps on suppliers' jobs, and an unowned gap is a P1 by the brief's rule.

   Repair: delete the gap from plan.json and the README; keep the two consumers under `## Downstream consumers` with the sentence that no consumer supplies a premise, naming PeriodsAndSpecialValues only.

4. **F04** (P2) `gap:proper-gaga` asks for what ComplexComparisonPartII already states

   Location: README line 98 "**Contract `gap:proper-gaga` — C−1.1 and C1.9 (artifact absent).** Supply native scheme analytification and proper GAGA, including differentials, coherent cohomology and integral Betti–étale comparison."

   Claim: the supplier's artifact is absent, so analytification, GAGA and the integral Betti–étale comparison are gapped.

   Witness: the open pull request adding `TauCetiRoadmap/ComplexComparisonPartII/README.md` (branch `roadmap/complex-comparison-part-ii`, a new roadmap folder, merge order position 35) has §C−1.1 "Analytic local models and scheme analytification", §C1.9 "Projective and proper coherent GAGA" (`projectiveComplexGaga`), §C2.2 "Ideals, sections and bundles" (`projectiveGeometricDictionaries`: coherent ideals, sections, invertible modules of a proper ℂ-scheme), §C5.1 the de Rham–Betti comparison with analytification of differentials, and §§C6.3, C6.6 "Finite-level Artin comparison" and "Integral and rational Artin comparison" (`artinComparison`).

   Repair: replace the gap by supplier citations in `## Exact supplier contracts` under `### From TauCetiRoadmap.ComplexComparisonPartII`: C−1.1 for analytification, C1.9 for proper GAGA, C2.2 for ideals/sections/bundles (used by 3.2's algebraization), C5.1 for differentials, C6.3/C6.6 for the integral singular–étale comparison used by 3.4; repoint the `*Needs:*` lines of 2.3, 3.1, 3.2 and 3.4. Keep a gap only for a statement none of these sections makes, with its own `needs` sentence.

5. **F05** (P2) `gap:relative-picard` and `gap:galois-brauer-descent` ask for what existing suppliers state, and propose a "JacobianChallenge Part II" that already exists

   Location: README line 66 "**Contract `gap:relative-picard` — proposed Part II §relative-Picard-spaces.** Supply the fppf relative Picard algebraic space"; line 68 "Main Layer D explains the obstruction in finite/projective field cases."

   Claim: representability of the relative Picard sheaf for K3 spaces, its separatedness, the Picard–Brauer sequence over fields and étale-local representatives are missing from every supplier and belong to a proposed JacobianChallenge Part II.

   Witness: AlgebraicModuliForArithmeticGeometry (merge order 30, branch `roadmap/algebraic-moduli-for-arithmetic-geometry`) §7.6.1 defines `relativePicardSheaf` and §7.6.1a proves `sectionPicardSplit`; ComplexComparisonPartII §C3.2d.2 proves `relative_picard_algebraicSpace` for proper flat finitely presented morphisms with universal functions, §C3.2d.3 the Picard diagonal and separatedness, §C3.2d.4 `picard_brauer_obstruction` over any base with universal functions; JacobianChallenge Layer D on main (README line 218–230) already proves the obstruction sequence `0→Pic(T)→Pic(X_T)→Pic_{X/k}(T)→H²_fppf(T,𝔾_m)→H²_fppf(X_T,𝔾_m)` for proper flat finitely presented `X/k` with geometrically integral fibres, not only "finite/projective field cases". "JacobianChallenge, Part II" exists twice already: JacobianChallengePartII (merge order 44) and AbelianSchemesAndArithmeticModuli (merge order 36, titled "the Jacobian challenge, part II").

   Repair: cite AlgebraicModuliForArithmeticGeometry §7.6.1/§7.6.1a, ComplexComparisonPartII §§C3.2d.2–C3.2d.5 and JacobianChallenge Layer D by name in the supplier contracts and the `*Needs:*` lines of 2.1, 4.1, 4.6, 7.2, 7.6 and 8.5 (smooth proper K3 families have universal functions by cohomology and base change from H⁰(O)=k, H¹(O)=0, which 2.1 should prove). Keep at most two narrowly stated gaps with a real owner: "an ample invertible sheaf on a proper algebraic space over a scheme makes it a projective scheme" (SchemeAndStackFoundations Layer 1 direction) and continuity of the Galois action on the geometric Picard group with finite-field Brauer vanishing (Mathlib's Wedderburn little theorem supplies commutativity of finite division rings; state what remains). Never name a "proposed JacobianChallenge Part II".

6. **F06** (P2) `gap:crystalline-realization` and `gap:witt-formal-brauer` ask for what CrystallineCohomology already states

   Location: README line 106 "**Contract `gap:crystalline-realization` — section contract absent; comparison with DerivedDeRhamCohomology absent.** Supply integral crystalline duality, de Rham reduction, Chern classes and formal-family Gauss–Manin compatibility."; line 104 "Supply de Rham–Witt cohomology, Cartier operations and formal Brauer comparison with their completeness and finiteness statements."

   Claim: CrystallineCohomology has no section contract for duality, de Rham reduction, Chern classes, Gauss–Manin or de Rham–Witt finiteness.

   Witness: the open pull request adding `TauCetiRoadmap/CrystallineCohomology/README.md` (branch `roadmap/crystalline-cohomology`, merge order 18) states "Proper smooth crystalline perfectness and reductions" (§CR.3.2: `RΓ_crys(X/W)` perfect, `K⊗^L W_n ≅ RΓ_crys(X/W_n)`, finitely generated `H^i`), "The crystalline first Chern class" (§CR.3.3), "Derived crystalline Poincaré duality" (§CR.3:duality.1, including `(H^i/tors)⊗(H^{2d−i}/tors)→W` perfect), "Smooth-lift comparison and PD filtration" (§CR.2.3, de Rham reduction), "Integral cohomological control" and "Degree filtration and the slope spectral sequence" (§CR.4.7: `FV=VF=p`, V-adic separatedness and completeness of `H^b(X,WΩ^a)`, slope degeneration after ⊗K), and "Relative Gauss–Manin connections" (§CR.7.3).

   Repair: cite those sections under `### From TauCetiRoadmap.CrystallineCohomology` and in the `*Needs:*` lines of 2.2, 2.4, 2.6 and 6.9; delete "section contract absent". Narrow the two gaps to what no section states, one `needs` sentence each: (a) Artin–Mazur prorepresentability of the formal Brauer group of a smooth proper surface with its Dieudonné module `H²(X,WO_X)`, the finite-height/p-divisible versus infinite-height/unipotent alternative, `FdV=d`, and Nygaard Corollary 2.7 (nygaard-closedness line 286); (b) crystalline Gauss–Bonnet, the degree-one comparison with the reduced Picard variety, and the Kodaira–Spencer derivative of `c₁` on the formal universal deformation over `W(k)` (deligne-lift §2).

7. **F07** (P2) `gap:integral-topology` asks AlgebraicTopology's theorems from ComplexKahlerGeometry

   Location: README line 94 "Supply the exponential sheaf sequence, integral universal coefficients, oriented Poincaré duality and cup-product comparison with analytic Chern classes."

   Claim: integral Poincaré duality and cup products are missing from every supplier.

   Witness: AlgebraicTopology on main (`TauCetiRoadmap/AlgebraicTopology/README.md` lines 1056, 1515, 1534) owns Alexander–Whitney cup products, both Poincaré–Lefschetz isomorphisms by cap product and `compactTriadPoincareLefschetz` for compact manifolds, with oriented and local-coefficient forms (line 39).

   Repair: cite AlgebraicTopology for cup products, oriented Poincaré duality and torsion-of-`H^i` versus `H_{n−i+1}` in the supplier contracts and 3.3's `*Needs:*`; narrow the gap to the exponential sheaf sequence on the analytic carrier and the identification of its connecting map with the analytic first Chern class and the cup product with the intersection form (huybrechts lines 452–472), one sentence, owner ComplexKahlerGeometry proposed Part II.

8. **F08** (P2) Compound `needs` sentences bundle unrelated theorem families

   Location: README line 58 "Supply quotients of smooth projective surfaces by finite groups, minimal resolutions in positive characteristic and rational-double-point intersection/cohomology formulas." together with "Also supply birational invariance of global regular differential forms for smooth proper surfaces and the vanishing of regular two-forms on ruled surfaces"; line 118 "Supply the actual M₂₄ permutation model, its point stabilizer M₂₃, its order 10200960, Mukai's eleven groups and the recognition arguments."

   Claim: one gap states exactly what is missing.

   Witness: `gap:surface-quotients` is needed by 5.4 (deck involutions), 6.1 (ADE quotients), 6.3 (wild quotients and Shioda's `T_ℓ(Y)≅T_ℓ(X)^g`), and 8.2 (non-ruledness via two-forms), four different theorems with different hypotheses (tame versus wild, quotient singularities versus birational invariance of `H⁰(ω)`); `gap:mathieu-models` bundles a permutation model, an order computation, a list of eleven groups and "the recognition arguments" of mukai §§3–8 and dolgachev-keum §5 without stating which theorem is to be supplied.

   Repair: split each into gaps with one theorem family and its hypotheses per `needs` sentence (for example `gap:tame-quotient-singularities`, `gap:quotient-transcendental-comparison` for Shioda's Proposition 5 with ℚ_ℓ coefficients, `gap:ruled-surface-two-forms` for 8.2; `gap:mathieu-permutation-model` for `M₂₄ ⊃ M₂₃` with their orders and fixed-point counts of mukai lines 59–63, `gap:mukai-eleven-groups-recognition` for Theorem (0.6)/(E) and dolgachev-keum Theorem 5.2 and Proposition 5.14), and mirror the split in plan.json `neededBy`.

9. **F09** (P3) `gap:matsusaka-mumford` is listed as a prerequisite of 5.3, which does not use it

   Location: README line 557 "*Needs:* §2.3 `IsK3.noVectorFields`; §5.2 `IsK3.polarizedAut`; SchemeAndStackFoundations §4.14; `gap:matsusaka-mumford`."

   Claim: 5.3 needs Matsusaka–Mumford.

   Witness: 5.3's own proof follows huybrechts lines 3376–3399 (graph Hilbert scheme, zero tangent, reduced isolated points of a projective scheme), which needs no extension theorem; Rizov uses [MM64] only at rizov line 641 as an alternative finiteness argument.

   Repair: remove `gap:matsusaka-mumford` from 5.3's `*Needs:*` and from the gap's `neededBy` (keep 8.2); minimality of gaps is required by the brief.

10. **F10** (P3) 4.4 should state saturation of the cycle map, which 6.7 uses

   Location: README line 466 "c₁ embeds Pic(X_kbar)⊗ℤ_ℓ into H²_et(X_kbar,ℤ_ℓ(1)) and preserves the intersection/cup-trace pairing."

   Claim: injectivity suffices downstream.

   Witness: 6.7's first step (line 676 "Prime-to-p unimodular cycle comparison makes the discriminant a signed p-power") needs the image to be a direct summand, i.e. the finite-level injections `Pic/ℓⁿ ↪ H²(μ_ℓⁿ)` of huybrechts lines 14002–14006 and rizov lines 296–300; injectivity of `Pic⊗ℤ_ℓ` alone allows an index divisible by ℓ.

   Repair: add to 4.4 the API item `picardCycle_saturated` (cokernel of `c₁` on `Pic(X_kbar)⊗ℤ_ℓ` is torsion-free, from `Pic/ℓⁿ ↪ H²(μ_ℓⁿ)`), with a Check at rank 22 that `Pic⊗ℤ_ℓ → H²` is then an isomorphism, and cite it in 6.7.

11. **F11** (P3) `gap:adjoint-positivity` must name characteristic-zero Kodaira vanishing

   Location: README line 74 "Theorem 1.6 uses nef big A and the analogous bounds on A² for Hⁱ(K+A)=0, i>0."

   Claim: Terakawa Theorem 1.6 covers the vanishing used by 7.4 in all characteristics.

   Witness: terakawa line 183 states Theorem 1.6 for "characteristic p > 0" only; the proof of Theorem 2.4 at terakawa lines 375–376 uses "the Kodaira vanishing theorem if p = 0", and 7.4 asserts `Hⁱ(X,L^m)=0` over every field.

   Repair: add to the gap's `needs` the characteristic-zero Kodaira vanishing for nef and big line bundles on smooth projective surfaces (or cite an owner on main if one exists), and say so in 7.4's proof paragraph.

12. **F12** (P3) Wrong owner named for `gap:cross-realization`; IntegralLattices Layer 1 is the carrier for 6.7's exclusions

   Location: README line 112 "**Contract `gap:cross-realization` — section contract absent.**" under `### From TauCetiRoadmap.CohomologyComparisons`; line 678 "*Needs:* … IntegralLattices Layer 5; IntegralLattices Layer 6."

   Claim: CohomologyComparisons is the supplier of the crystalline/ℓ-adic characteristic-polynomial equality for finite-order automorphisms; IntegralLattices Layers 5–6 supply the signature exclusions.

   Witness: CohomologyComparisons at its pull request head (branch `roadmap/cohomology-comparisons`) is "p-adic cohomology comparisons" (`A_inf`, `B_dR⁺`, Hodge–Tate; no section mentions automorphisms or characteristic polynomials); the equality cited by keum line 271 is Illusie's de Rham–Witt result, in CrystallineCohomology's direction. The exclusion of σ=0 and σ=11 in huybrechts lines 14339–14342 is Milgram's congruence, IntegralLattices Layer 1 milestone 1I (`TauCetiRoadmap/IntegralLattices/README.md` line 693).

   Repair: re-own the gap to CrystallineCohomology proposed Part II (or to WeilConjectures if its §RD.7-style determinant comparison is extended to automorphisms) with the same `needs`; add IntegralLattices Layer 1 (1I) to 6.7's `*Needs:*`.

13. **F13** (P3) Process narrative and a misplaced locator

   Location: README line 11 "The absent or insufficient contracts are stated explicitly below as gaps"; line 60 "Theorem 2 is access-waived"; line 98 "(artifact absent)"; line 952 "exact names absent from filing"; lines 958–974 "Access: certified", "Access: waived", "Operator-held Russian original"; line 273 "characteristic-zero branch huybrechts line 379".

   Claim: the README is timeless.

   Witness: "access-waived", "artifact absent", "filing", "Access:" lines and "Operator-held" describe the authoring process, not mathematics; huybrechts line 379 is the algebraic remark "It is also known that h⁰(X,Ω_X)=0", whereas the complex argument the proof paragraph describes (Hodge symmetry after GAGA) is §3.3, huybrechts lines 488–493.

   Repair: move access status to `sources.toml` only, delete the process words, state source status in References as version notes without "Access:"; change 2.3's characteristic-zero locator to Chapter 1 §3.3, p. 16, huybrechts lines 488–493.

14. **F14** (P3) The topological Lefschetz theorem inside `gap:tame-lefschetz` has an owner on main

   Location: README line 88 "The characteristic-zero topological Lefschetz theorem with complex orientation is required on the analytic side."

   Claim: this input has no owner and rides in an EtaleCohomologyFoundations gap.

   Witness: `TauCetiRoadmap/MorseNovikov/README.md` line 499 "Construct the Lefschetz fixed-point formula here by simplicial approximation".

   Repair: cite MorseNovikov for the topological fixed-point formula in the supplier contracts and 6.2's `*Needs:*`, and keep the gap for the étale statement only (keum lines 336–341).

Previous review: none. Files reviewed: `packages/K3SurfacesAndSymplecticBoundedness/design/README.md`, `packages/K3SurfacesAndSymplecticBoundedness/design/plan.json`, `packages/K3SurfacesAndSymplecticBoundedness/sources.toml`. Line numbers below refer to the design README unless another file is named.

## Verified sound

- Principles: no route-specific shortcut, no "good primes only" (7.7 and 8.1 are over all of Spec ℤ, 8.4 restricted honestly to ℤ[1/(2d)]), no replanned roadmap, no copied passage, no algorithm, no Lean file at this stage.
- Gate (design README used; the package README does not exist yet):

      candidate: K3SurfacesAndSymplecticBoundedness is not in the merge order yet; checked as if placed after CohomologyComparisons (the intake inserts it when its design is accepted)
      depcheck: 3 roadmaps, 11 edges, 0 problem(s)

  No UPWARD or CYCLE line. All eleven suppliers are on main or earlier in the merge order (SchemeAndStackFoundations 2, EtaleCohomologyFoundations 15, CrystallineCohomology 18, ComplexComparisonPartII 35, CohomologyComparisons 130; the rest on main).
- Seeded sample, all fifteen contracts verified at their locators: `surface-projectivity` (huybrechts lines 147–153, Remark 1.2); `hypersurface-cohomology` (huybrechts 160–166, 12221–12231); `surface-arithmetic-quotient` (SchemeAndStackFoundations §5.10 line 7117 is over algebraically closed k, huybrechts 335–345); `surface-quotients` (dolgachev-keum 399–520, keum 806–815); `matsusaka-mumford` (rizov 1084); `galois-brauer-descent` (huybrechts 14011–14025); `adjoint-positivity` (terakawa 183–193, 354–369, hypotheses (a)–(d) as stated); `tame-lefschetz` (keum 336–341); `integral-topology` (huybrechts 452–469, 511–513); `oda-interface` (oda 2490–2496, rational point hypothesis present; lang-nygaard 54–61); `witt-formal-brauer` (nygaard-closedness 286–288, lang-nygaard 80–99); `crystalline-realization` (deligne-lift 29–57); `artin-discriminant` (huybrechts 14317–14342, dolgachev-keum 590–682); `cross-realization` (keum 268–302, rizov 650–660); `mathieu-models` (mukai 53–63, 70–108, 191–193; dolgachev-keum 862–870, 1566). No author-flagged unverified locator exists.
- Other locators read and found correct: 1.1–1.6, 2.1–2.7, 3.1–3.4, 4.1–4.6, 5.1–5.4, 6.1–6.11, 7.1–7.7, 8.1–8.5 (huybrechts, rizov, dolgachev-keum, keum, lang-nygaard, deligne-lift, terakawa, wild-cyclic 14–44, nikulin-symplectic 1537–1624 in Russian, matching the cyclic arithmetic).
- Pinned declarations (GitHub at the pins): Mathlib `SmoothOfRelativeDimension` and `.smooth`, `IsProper`, `GeometricallyIntegral` and `isIntegral_of_subsingleton`, `PadicInt.toZMod`, `ker_toZModPow`, `ext_of_toZModPow`, `mem_span_pow_iff_le_valuation` (with `hx : x ≠ 0`, retained in 4.5); Tau Ceti `relativeDifferentials`, `relativeDifferentialsHomEquiv`, `FiniteLocallyFreeSheaf.rank_relativeDifferentials_apply`, `LineBundleClass` with `mk_eq_mk_iff`, `mk_tensorProduct`, `mk_eq_one_iff` (multiplicative, so the README's `Additive` convention is right), `IntegralLattice`, `ofSubmodule`, `integralForm_cast`, `IsNondegenerate` mixin.
- Supplier sections on main exist as cited: SchemeAndStackFoundations §§0.9, 0.11, 1.1, 1.11, 1.18–1.21, 1.23, 2.11, 2.20, 2.23, 4.1–4.6, 4.10–4.12, 4.14, 5.8–5.10; EtaleCohomologyFoundations F.0.3, F.2.1–F.2.2, F.4.2, F.4.4, F.4.6, §0.9, F.5, F.6; ComplexKahlerGeometry K3, K4, K5, K6.1; AlgebraicVectorBundles L0A–L0C; JacobianChallenge Layers A, C, D; StableReduction Layer 2; IntegralLattices Layers 1, 5, 6 and Completed Layers 1–5; CFSGStatement S1; ComplexCurveModuli D0–D2, D7.
- plan.json and README agree: 26 gap slugs identical, every `neededBy` equals the set of targets listing the gap; 50 targets, 149 Checks, every definition with API and at least three Checks, every theorem with hypotheses and locator, every layer with Examples and Dependencies.
- Minkowski's lemma (4.5) is not in Mathlib at the pin (leansearch finds only `CongruenceSubgroup.Gamma` for SL₂), so the target is not a duplicate.
- Adversarial pass:

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| 1.1 `IsK3` | empty scheme, P², E×E, quartic over 𝔽₂ | rejected/accepted as the Checks say; `GeometricallyIntegral` includes nonemptiness | none |
| 1.2 field extension iff | K=k, inseparable K, descent direction | sections of L and L⁻¹ argument needs proper geometrically integral, which is in scope | none |
| 1.4 RR `2χ(L)=4+L²` | L=O, L=H quartic, char 2 | 4, 8+4, no division | none |
| 1.4 contraction | frame σ(e₁,e₂)=1, char 2 | e₁↦e₂*, e₂↦−e₁*, sign + in char 2 | none |
| 1.5 numerical kernel | torsion L, rational curve | χ(L)=2 forces effectivity; C²=−2 | none |
| 1.6 Fermat quartic | 𝔽₂ | (Σxᵢ)⁴, nonreduced | none |
| 2.1 Picard space | field base, non-étale family | étale over a field; jumping only on closed loci | none |
| 2.2 closedness | char 2, zero form | no p>2 restriction in lang-nygaard 76–99 | none |
| 2.3 vanishing | abelian surface control, char 2 | rational point of Oda supplied by algebraic closure | none |
| 2.4 ranks | Euler sum 24, χ(Ω¹)=−20 | 1+22+1, h¹¹=20 | none |
| 2.5–2.7 deformations | L=O, p∣2d, p=2 ramified R | 20 versus 19, flat only, trait may ramify | none |
| 3.1–3.3 analytic | torus, empty, orientation | h¹(O)=2 rejected; H² free by Pic torsion-free | none |
| 3.4 étale ranks | ℓ=char excluded, ℓ=2 allowed | smooth base change over a lift | none |
| 4.1 base change | identity, C⊂K, real conic | obstruction retained | none |
| 4.2 lattice | [4], rational curve, O | disc 4, Q=−1, zero vector | none |
| 4.4 cycle map | rank 20 vs 22 | bound 20 only in char 0; saturation missing | R10 |
| 4.5 congruence kernel | n=0, −1 at ℓ=2, −1 at ℓ=3, I+3E₁₂ | ℓ=2 fails, odd ℓ torsion-free | none |
| 4.6 bounded degree | algebraically closed k, point hypothesis | degree 1; integral descent only with X(k)≠∅ or finite k | none |
| 5.1 symplectic | id, composition order, −1 in char 2 | kernel of inverse pullback | none |
| 5.4 Wehler | Gram [[2,4],[4,2]], S₁, S₂ | det −12; S₂S₁=[[−1,−4],[4,15]], trace 14, det 1, eigenvalues 7±4√3 | none |
| 6.1 tame quotient | G=1, involution | R=0; 8A₁, det 2⁸ | none |
| 6.2 fixed points | n=11 (A₁₀²), n=15 (A₁₄A₄A₂) | square discriminants 121, 225 excluded | none |
| 6.3 wild quotient | p=2 empty fixed locus, Enriques b₂ | dimension 10 | none |
| 6.4 p≤11 | p=13 | tame | none |
| 6.5 faithfulness | char poly (t−1)²² without finite order | semisimplicity used only after finite order, as README says | none |
| 6.6 bound | G=1, char 3 | ℓ=5 | none |
| 6.7–6.8 Artin invariant | σ=0 (1,21) even unimodular, σ=11, p=2, −9 vs +9 vs −81 | Milgram excludes σ=0,11 | R12 |
| 6.9 character | n=1,2,3,4,5,6,7,8 | 24,8,6,4,4,2,3,2 match the table | none |
| 6.10–6.11 Mathieu | 1⁸2⁸, 23-cycle | 16 orbits; 2 orbits rejected; M₂₃ containment in the exceptional branch | none |
| 7.1 primitivity | zero class, [2d] generator, squarefree d | n²∣d | none |
| 7.2 [n] | n=0, n=3 in char 3 | n=0 excluded, source's "n∈ℕ" corrected | none |
| 7.3 families | d=0, local-only representative | excluded; Picard section, no global bundle | none |
| 7.4–7.5 powers | m=0, d=1,2 | h⁰=4,10,20; P¹⁰ and P¹⁹; 3L·D=3 forces D²=1, impossible | R11 |
| 7.6–7.7 Hilbert | singular degeneration, frames | locus by Picard-class equality, not ranks | none |
| 8.1–8.5 stacks | involution stabilizer, identity trait, d=1 base ℤ[1/2], twists over 𝔽_q | finite inertia, separated, forms counted separately | none |

## Not verifiable

- `rudakov-shafarevich` §8 Proposition 3, `matsusaka-mumford` Theorem 2 and `nygaard-vectorfields` Lemma 3.3: waived in `sources.toml`; cited by locator only, contents not checked.
- Huybrechts Chapter 9 §§4–5 (listed in References for no-vector-fields and lifting): not cited by any target, not read.
- Dolgachev–Keum Theorem 5.2 beyond its first six entries and Proposition 5.14's chains: only the statements at lines 862–870 and 1566 were read.
- Elaboration: there is no `Suggested.lean` at the design stage, so nothing was elaborated; `lake` is not available in this environment in any case.
- The pull-request suppliers (ComplexComparisonPartII, CrystallineCohomology, AlgebraicModuliForArithmeticGeometry, CohomologyComparisons) were read at their current heads on GitHub, which may move before this roadmap is packaged.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "e9cbc67a4b198cd79ab957f1970a042024354e00", "job": "REV-DESIGN-K3SurfacesAndSymplecticBoundedness", "model": "fable", "worker": "chris-f"} -->
