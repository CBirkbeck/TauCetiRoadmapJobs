<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/63#issuecomment-6307556521 -->
Review (claude) of 5e9b7b2

Verdict: needs_changes

1. **F01** (P1) 6.8a's proof plan consumes Artin's height theorems and Brauer-group machinery that nothing owns

   Location: line 801 "the transcendental comparison and the K3 elliptic formal-Brauer height inequality rule out transcendental dimension one"; line 803 "for elliptic K3 surfaces infinite formal-Brauer height implies rank 22, as used in Lemma 4.4"; line 803 "a symplectic involution on X implies existence of an elliptic fibration on X (Lemma 4.3)".

   Claim: `IsK3.tameInvariantDimension_ge_five` is proved from §§2.4, 3.3, 3.4, 4.4, 6.1, 6.2, 6.8, the five listed gaps and CrystallineCohomology CR.2.3–CR.4.7.

   Witness: dolgachev-keum lines 585–589 (Lemma 4.2) use "By Artin [Ar1] ... λ(Y)=22−ρ(Y)≥2h"; lines 652–661 (Lemma 4.4) use Artin's Theorem (1.7) and "no non-trivial maps between a formal group of finite height and Ĝ_a"; lines 599–646 (Lemma 4.3) use Hochschild–Serre for `Br` of the free locus, purity `Br(Y)≅Br(Y∖E)` and `Br(Y)[2]≅(ℤ/2)^λ(Y)` up to a finite group, then "it suffices to show ρ(X)≥5" for an elliptic pencil. The primary statements are artin-supersingular lines 40–42 (Theorem (0.1): `ρ≤b₂−2h` when `Br̂` is p-divisible, for a surface lifting projectively) and lines 192–194 (Theorem (1.7): an elliptic supersingular K3 has `ρ=22`). No layer, no cited supplier section and no gap `needs` sentence states any of: Artin (0.1), Artin (1.7), "ρ≥5 implies a genus-one pencil on a K3", Brauer-group purity and equivariant Hochschild–Serre for surfaces, the vanishing of homomorphisms from a finite-height formal group to `Ĝ_a`, or the rank of the Dieudonné module of a height-h formal group. `gap:witt-formal-brauer` (line 128) supplies only prorepresentability, `H²(WO)`, the height alternative and degeneration.

   Repair: (a) add K3 targets before 6.8a with locators into the fetched source `artin-supersingular` (now in `sources.toml`; add it to References): `IsK3.artinHeightInequality` (finite height h gives `ρ≤22−2h`; artin-supersingular lines 40–42, with the lift from §2.7) and `IsK3.ellipticSupersingular_rank22` (artin-supersingular lines 192–194), plus `IsK3.genusOnePencil_of_rank_ge_five` (an indefinite even lattice of rank ≥5 is isotropic by Meyer, then the K3 reflection argument; cite Huybrechts Chapter 11 or Chapter 8 and name the owner of Meyer's theorem, GlobalQuadraticForms if it states it, else a gap) and `IsK3.symplecticInvolution_ellipticPencil` (Lemma 4.3) with its own `*Needs:*`; (b) extend the `needs` of `gap:witt-formal-brauer` by "the Dieudonné module of a p-divisible one-dimensional formal group of height h is free of rank h, and there is no nonzero homomorphism from it to `Ĝ_a`", and declare a gap (EtaleCohomologyFoundations proposed Part II, or JacobianChallenge proposed Part III) for Brauer purity on a smooth surface, `Br(X)[ℓ^∞]` versus `22−ρ`, and the equivariant Hochschild–Serre sequence for `Br` of a free quotient, one sentence each; (c) rewrite 6.8a's `*Needs:*` and proof paragraph to consume these.

2. **F02** (P1) 6.3 and 6.5 use "rational or Enriques quotient has algebraic H², of dimension 10" with no owner

   Location: line 681 "Rational and Enriques quotients have H²-invariants algebraic; in the Enriques branch their dimension is10"; line 742 "The rational quotient forces ρ=22, then the supersingular Picard-faithfulness theorem applies. The Enriques case has invariant dimension10".

   Claim: these follow from `gap:quotient-transcendental-comparison` and §§3.4, 4.2, 4.4, 6.2a.

   Witness: keum lines 795–804 derive both from Proposition 2.2(4), whose hypothesis `T²_ℓ(Y)=0` is "satisfied if Z/⟨g⟩ is rational or is birational to an Enriques surface" (keum lines 321–324) and whose Enriques count uses `rank NS(X/⟨g⟩)=10`. Vanishing of the transcendental lattice of a smooth projective rational surface, and `ρ=b₂=10` for an Enriques surface in characteristic 2 of μ₂-type, are general surface theorems (Bombieri–Mumford for the latter); no layer, supplier section or gap states them. SchemeAndStackFoundations §4.11 (its lines 5468–5480) supplies modifications, not the factorisation of birational surface maps or the blow-up formula.

   Repair: for the Enriques branch, replace "algebraic" by a route this roadmap can own: the action is free, so `H*(X/⟨g⟩,ℚ_ℓ)=H*(X,ℚ_ℓ)^g` for the finite étale quotient and `e(X/⟨g⟩)=12` by multiplicativity of `deg c₂` (EtaleCohomologyFoundations F.6, cited in §6.2), giving invariant dimension 10 with `H¹=H³=0`; name the étale-quotient-invariants supplier (EtaleCohomologyFoundations F.2 or a gap). For the rational branch, declare a gap (SchemeAndStackFoundations proposed Part II §birational-surface-forms can carry it) with `needs` "for a smooth projective rational surface over an algebraically closed field and ℓ invertible, `H²_et(Y,ℚ_ℓ(1))` is spanned by divisor classes", and cite it in 6.3, 6.5 and in the `kappaZeroQuotient` consequences of 6.2a. Add a Check to 6.3 that the Enriques count uses `b₂`, not `ρ`.

3. **F03** (P2) `gap:artin-discriminant` has a `needs` sentence narrower than what the README consumes

   Location: `plan.json` gap `artin-discriminant`, `needs`: "Supply p-elementarity of the geometric Picard discriminant at rank22 and the crystalline cycle-lattice index computation."; README line 136 additionally "Require ... the nonzero de Rham (1,1) contribution of a primitive invariant ample class when the Artin invariant exceeds one" and "require that the rescaled form B/p is integral and even, also for p=2".

   Claim: the gap states exactly what is missing.

   Witness: 6.7 (line 770) and its Check `sigma11_scaled_even` use the dyadic evenness; 6.8a's API `artinGreaterOne` (line 803) uses the (1,1) injectivity of dolgachev-keum lines 744–755. Neither is in the `needs` sentence the intake announces to the supplier.

   Repair: put all four requirements into the `plan.json` `needs` (p-elementarity at rank 22; the crystalline cycle-lattice index; integrality and evenness of `B/p` at discriminant length 22 including p=2; for Artin invariant >1, injectivity of `Pic/p→H¹(Ω¹)` on the class of a primitive ample line bundle), or split the last two into their own gap slugs with `neededBy` `["6.7"]` and `["6.8a"]`, and mirror the README.

4. **F04** (P2) `gap:mukai-eleven-groups-recognition` asks for the rational statement only, while 6.11 consumes the ℚ_ℓ one

   Location: `plan.json` gap `mukai-eleven-groups-recognition`, `needs`: "for a finite group G admitting a 24-dimensional rational Mathieu representation ... an embedding into one of Mukai's eleven groups"; README line 146 "Also require the ℚ_ℓ variant for compatible Mathieu representations over every ℚ_ℓ, ℓ≠p, ... with the quaternion obstruction over ℚ₂ when 2∣|G|".

   Claim: the gap is precise.

   Witness: dolgachev-keum lines 793–808: Mukai's proof is run "Replacing Q with Ql" and the only rational step, Proposition (3.21), is replaced by "the representation of Q8 cannot be defined over Q2". In positive characteristic `H*(X,ℚ_ℓ)` is not a rational representation, so the rational contract does not apply to 6.11.

   Repair: rewrite the `needs` sentence to state the ℚ_ℓ form with the ℚ₂ quaternion obstruction and the Sylow-2 embedding hypothesis, or declare a second gap `gap:mukai-recognition-l-adic` with `neededBy` `["6.11"]`, and keep the rational form for 6.10.

5. **F05** (P3) three other gap `needs` sentences omit requirements stated in the README contract

   Location: `plan.json` gaps `witt-formal-brauer` (README line 128 "This contract includes pullback and trace on the formal Brauer functor"), `elliptic-surface-geometry` (README line 72 "Include the fibre-component root-lattice quotient and finite-index comparison d_M=a²d_R(φ)"), `tame-linear-groups` (README line 142 "discriminants of their ADE resolutions and quaternion rational/2-adic representation obstructions are needed").

   Claim: README and `plan.json` declare the same contract.

   Witness: dolgachev-keum lines 656–660 (pullback and trace on `Br̂`, used by 6.8a), lines 440–443 (relation (3.1), used by 6.1), lines 457–462 (ADE discriminants belong to `gap:tame-quotient-singularities`, and the quaternion obstruction to `gap:mukai-eleven-groups-recognition`).

   Repair: add pullback/trace functoriality and (3.1) to the respective `needs`; delete the discriminant/quaternion clause from `gap:tame-linear-groups` (both are owned by other gaps) so the intake announces one theorem family per slug.

6. **F06** (P3) `gap:galois-brauer-descent` asks for continuity that §4.1 already proves

   Location: line 78 "Supply continuity of the discrete geometric Picard action for smooth proper geometrically integral varieties with finitely generated geometric Picard group, together with finite-field cohomological Brauer vanishing."

   Claim: both halves are missing from the library and this roadmap.

   Witness: line 448 "Every geometric line-bundle class descends to a finite extension" (huybrechts lines 14042–14044); for a finitely generated discrete module this is exactly continuity of the Galois action, so 4.6 can take it from 4.1. The remaining input is `H²_fppf(k,G_m)=0` for finite k together with its identification with `Br(k)`, which no main roadmap states (ClassFieldTheory Layer 5 owns local Brauer groups only).

   Repair: delete the continuity clause, derive it in 4.6 from 4.1, and narrow the `needs` to "for a finite field k, `H²_fppf(Spec k,G_m)=0`, identified with the Brauer group whose vanishing is Wedderburn's theorem (`littleWedderburn`)"; keep `neededBy` `["4.1","4.6","8.5"]` only where the Brauer input is used.

7. **F07** (P3) 2.1a's unirationality and rank-22 API items have no primary locator

   Location: line 271 "Rudakov–Shafarevich vector-field reduction as cited in lang-nygaard lines 101–103"; line 275 "`vectorField_unirational`: A nonzero global vector field on a geometric K3 surface makes X unirational; `vectorField_rank`: The same hypothesis gives Néron–Severi rank 22".

   Claim: the two theorems are located.

   Witness: lang-nygaard lines 101–103 is a one-sentence remark; its reference [11] (lang-nygaard lines 126–127) is Rudakov–Šafarevič, *Inseparable morphisms of algebraic surfaces*, Izv. 40 (1976), a different paper from the manifest's `rudakov-shafarevich` (1981, §8 Proposition 3). "Unirational implies ρ=22" is Shioda's theorem, also absent from `sources.toml`.

   Repair: record both papers in `sources.toml` (uncertified or waived if no legal text is found) with theorem locators, cite them at the two API items and in References; the design may keep the Lang–Nygaard remark as the secondary citation.

Files reviewed: `packages/K3SurfacesAndSymplecticBoundedness/design/README.md`, `packages/K3SurfacesAndSymplecticBoundedness/design/plan.json`, `packages/K3SurfacesAndSymplecticBoundedness/sources.toml`. Line numbers refer to the design README unless another file is named. Source passages are cited as `<source id> line N` into the cached extractions.

## Repair check of the previous review (F01–F14)

| Finding | Status | Repaired passage |
| --- | --- | --- |
| F01 (P1) six unowned proof gaps | repaired | §§2.1a, 6.1a, 6.2a, 6.3a, 6.4a, 6.8a exist (lines 269, 633, 663, 693, 722, 797), each with hypotheses, locator, API and three Checks; `plan.json` has 56 targets and no gap with supplier `none`. |
| F02 (P1) genus-one gap unowned | repaired | Line 72: "`gap:elliptic-surface-geometry` — proposed Part II §genus-one-fibrations" with supplier SchemeAndStackFoundations in `plan.json`. The repair report's "not actionable" label is moot: the owner is named, which is all the finding asked. |
| F03 (P1) inventory gap | repaired | No `consumer-inventory` slug; line 1065 "No consumer supplies a premise to this roadmap." |
| F04 (P2) proper-gaga | repaired | Line 120 consumes C−1.1, C1.9, C2.2, C5.1, C6.3, C6.6 by name; all exist at the ComplexComparisonPartII head (headings at its lines 699, 1663, 1737, 2337, 4170, 4336). |
| F05 (P2) relative-picard | repaired | Lines 76–82 cite JacobianChallenge Layer D, AlgebraicModuliForArithmeticGeometry §7.6.1/§7.6.1a (names verified at its lines 9489–9541) and C3.2d.2–C3.2d.5; only `gap:galois-brauer-descent` and `gap:ample-space-scheme` remain. See R06 for the residual part that 4.1 already supplies. |
| F06 (P2) crystalline gaps | repaired | Line 124 consumes CR.2.3, CR.3.2–3.3, CR.3:duality.1, CR.4.1, CR.4.6–4.7, CR.7.3 (all headings exist; `Crystalline.wittCohomology_V_complete` at CrystallineCohomology line 6584); residual gaps split into formal-Brauer, Gauss–Bonnet, degree-one and Chern-derivative contracts. |
| F07 (P2) integral topology | repaired | Line 106 cites AlgebraicTopology Stage 6 items 1–2, 4 (verified: UCT and Alexander–Whitney at its lines 1038–1062, `compactTriadPoincareLefschetz` at line 1534); the torsion index `H^(n−i+1)` is correct. |
| F08 (P2) compound gaps | repaired | Four surface gaps (lines 60–66) and three Mathieu gaps (lines 144–148), one theorem family each, mirrored in `plan.json` `neededBy`. |
| F09 (P3) Matsusaka–Mumford on 5.3 | repaired | Line 587 `*Needs:*` of 5.3 has no gap; `neededBy` is `["8.2"]`. |
| F10 (P3) saturation | repaired | Line 495 "The API `picardCycle_saturated` asserts that its cokernel is torsion-free"; Check `cycle_rank22_integral`; 6.7 consumes it (line 772). |
| F11 (P3) Kodaira–Ramanujam | repaired | Line 88 names Kodaira–Ramanujam (huybrechts line 815 is Theorem 1.8, characteristic zero, nef and big); line 917 uses it. |
| F12 (P3) cross-realization owner | repaired | Line 138 owner CrystallineCohomology; line 772 cites IntegralLattices Layer 1 (1I). |
| F13 (P3) process words, locator | repaired | No "access", "waived", "artifact", "filing" in the README; 2.3 cites huybrechts lines 488–493 (line 301), which is §3.3. |
| F14 (P3) topological Lefschetz owner | repaired | Line 110 consumes MorseNovikov N6 (verified at its lines 494–542); `gap:tame-lefschetz` is étale only. |

All fourteen are repaired. The findings below are new.

## Verified sound

- Principles: no route-specific shortcut (7.7 and 8.1 over all of Spec ℤ; 8.4 honestly restricted to ℤ[1/(2d)]); no re-planned roadmap (every general surface, crystalline, topological and group-theoretic theorem is imported or declared as a gap with a named owner); no copied passage (all locators are paraphrases); no algorithm; no `Suggested.lean` at this stage, so no `sorry`'d data or `set_option`.
- Gate on the design README:

      candidate: K3SurfacesAndSymplecticBoundedness is not in the merge order yet; checked as if placed after JacobianChallengePartII (the intake inserts it when its design is accepted)
      depcheck: 3 roadmaps, 12 edges, 0 problem(s)

  No UPWARD or CYCLE line. The package README does not exist yet, so the gate was run on `design/README.md`. Suppliers: SchemeAndStackFoundations (2), EtaleCohomologyFoundations (15), CrystallineCohomology (18), AlgebraicModuliForArithmeticGeometry (30), ComplexComparisonPartII (35) in the merge order, all earlier; the other nine on main. The three pull-request suppliers were read at their branch heads `c9ccfac`, `2c8b22a`, `98fd038`.
- Gap bookkeeping: 25 slugs identical in README and `plan.json`; every `neededBy` equals the set of targets whose `*Needs:*` line carries the slug and the "Required by" list of the contract (script check, 25 of 25); no supplier `none`; 56 plan targets equal the 56 README subsections; every plan prerequisite appears in the README `*Needs:*` line.
- Seeded sample, all 15 contracts read at their locators: `surface-projectivity` (huybrechts lines 147–153); `hypersurface-cohomology` (huybrechts 160–166, 12221–12231); `surface-arithmetic-quotient` (SchemeAndStackFoundations §5.10 is over algebraically closed k, its lines 7128–7134; huybrechts 335–345); `surface-quotient-resolutions` (dolgachev-keum 399–449, 511–520; keum 806–815); `quotient-transcendental-comparison` (keum 811–812, dolgachev-keum 590–591); `matsusaka-mumford` (rizov 1080–1085); `ample-space-scheme` (rizov 1080–1082); `adjoint-positivity` (terakawa 183–193 with hypotheses (1)–(3), 354–369 with (a)–(d), 375–376; huybrechts 815–818); `tame-lefschetz` (keum 336–341); `oda-interface` (oda 2490–2496 with the rational-point hypothesis; lang-nygaard 54–61); `witt-formal-brauer` (nygaard-closedness 286–288; lang-nygaard 80–99); `crystalline-chern-derivative` (deligne-lift 188–192 and Theorem 1.6 at 131–134); `artin-discriminant` (huybrechts 14317–14342); `tame-linear-groups` (dolgachev-keum 399–402); `exceptional-mathieu-embeddings` (dolgachev-keum 862–872, 1566–1570). No author-flagged unverified locator exists.
- Other locators read and found correct: 1.1–1.6 (huybrechts 133–183, 305–354), 2.1–2.7 (rizov 404–442, lang-nygaard 54–104, deligne-lift 29–62, 76–82, 129–162, rizov 756–784), 3.1–3.4 (huybrechts 405–511, rizov 273–300), 4.1–4.6 (huybrechts 13964–14054), 5.1–5.4 (huybrechts 11765–11788, 12221–12231, 3372–3400; rizov 608–642), 6.1–6.11 (dolgachev-keum 136–166, 216–232, 285–291, 351–356, 389–402, 422–449, 505–522, 567–600, 647–690, 735–760, 783–810, 831–842; keum 118–130, 266–275, 316–342, 765–815; wild-cyclic 10–48; nikulin-symplectic 1561–1624, whose (5.2) and cases 1–7 match the 6.1a identity and the n=11, n=15 exclusions; mukai 51–110, 189–194, 1055–1070, 1190–1195, 1500–1542), 7.1–7.7 and 8.1–8.5 (rizov 140–172, 461–470, 525–570, 805–850, 877–920, 962–968, 1002–1006, 1073–1101; huybrechts 3577, 14545–14548).
- Pinned declarations: `littleWedderburn` is an instance in `Mathlib/RingTheory/LittleWedderburn.lean` at `6b7abb3` and `Finite.divisionRing_to_field` is its alias, as line 40 says; the previous review's checks of `SmoothOfRelativeDimension`, `IsProper`, `GeometricallyIntegral`, the `PadicInt` lemmas, `relativeDifferentials`, `LineBundleClass` and `IntegralLattice` were not repeated. Leansearch finds no congruence-kernel torsion-freeness lemma, so 4.5 is not a duplicate.
- Supplier sections exist as cited: SchemeAndStackFoundations §§0.9, 0.11, 1.1, 1.11, 1.18–1.21, 1.23, 2.11, 2.20, 2.23, 4.1–4.6, 4.10–4.12, 4.14, 5.8–5.10 (and §5.10 owns positive-characteristic Néron–Severi finiteness, its lines 7156–7158, which 4.2 needs); EtaleCohomologyFoundations F.0.3, F.2.1–F.2.2, F.4.2, F.4.4, F.4.6, §0.9, F.5, F.6; ComplexKahlerGeometry K3, K4, K5a/K5b (inline items under K5), K6.1; AlgebraicVectorBundles L0A–L0C; JacobianChallenge Layers A, C, D; StableReduction Layer 2; IntegralLattices Layers 1 (1I at its line 693), 5, 6 and Completed Layers 1–5; CFSGStatement S1; AlgebraicTopology Stage 6 items 1–2, 4; MorseNovikov N6; ComplexCurveModuli D0–D2, D7; ComplexComparisonPartII C−1.1, C1.9, C2.2, C3.2d.2–C3.2d.5, C5.1, C6.3, C6.6 with the ten named declarations; CrystallineCohomology CR.2.3, CR.3.2, CR.3.3, CR.3:duality.1, CR.4.1, CR.4.6, CR.4.7, CR.7.3; AlgebraicModuliForArithmeticGeometry §7.6.1 and §7.6.1a with the four named declarations.
- Shape: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, eight layers each ending in Examples and Dependencies, Downstream consumers, References; every definition (1.1, 3.1, 4.3, 5.1, 6.8, 7.1, 7.3) and construction has an API list and at least three Checks; 50 of 56 targets have three or more Checks, the six theorems with two (2.5, 2.7, 6.4, 8.2, 8.3, 8.4) are within the rule; no LaTeX delimiters, process words, job ids, pull-request numbers or machine paths.
- Adversarial pass:

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions | (f∘g)* order; σ(e₁,e₂)=1 contraction; quartic cup-trace; Rizov's minus sign | ρ(f)=(f⁻¹)* multiplicative; e₁↦e₂*, e₂↦−e₁*; value 4; Rizov's ψ is the negative | none |
| 1.1 `IsK3` | empty, P², E×E, quartic | rejected/accepted as the Checks say | none |
| 1.2 extension iff | identity, inseparable, descent of ω≅O via sections of ω and ω⁻¹ on a geometrically integral proper scheme | holds | none |
| 1.3 projectivity | imperfect k | needs the arbitrary-field surface theorem, declared as a gap | none |
| 1.4 RR, contraction | L=O, L=H, char 2 | 2χ=4, χ(H)=4, no division | none |
| 1.5 numerical kernel | L·H=0 with L≠O; torsion L | χ(L)≤0 versus χ(L)=2; torsion numerically trivial | none |
| 1.6 Fermat quartic | char 2, char 3 | nonreduced; smooth | none |
| 2.1 Picard space | field base; rank jump in a family | étale over a field; unramified but not flat | none |
| 2.1a kernel | x=0 witness; finite height | witness must be nonzero; finite height not covered | R07 (locator) |
| 2.2 closedness | h<∞ (degeneration); h=∞ with d≠0 gives vector field then contradiction | argument closes | none |
| 2.3 vanishing | abelian surface; char 2; Oda's rational point | excluded by H¹(O); p=2 fine; supplied by algebraic closure | none |
| 2.4 Hodge/crystalline | diamond differentials; universal coefficients degree by degree | all d_r vanish by positions; t_i=0 for i=1..4 | none |
| 2.5–2.7 deformations | L=O; p∣2d; L with L²=0 in char 0; ramified trait | dimension 20 versus 19; flat only; char-0 statement weaker than true but correct; R may ramify | none |
| 3.1–3.2 analytic | torus; non-projective K3 | rejected; outside the algebraic image | none |
| 3.3 integral Betti | torsion of H³ versus H²; exp(2πit) increment | torsion H³≅torsion H²=0; degree +1 pins the sign | none |
| 3.4 étale ranks | ℓ=p; ℓ=2 | excluded; allowed | none |
| 4.1 base change | identity; ℂ⊂K; Galois invariants | injective; bijective; ⊗ℚ only | none |
| 4.2 lattice | H ample, H⊥ negative definite over k̄ | signature (1,ρ−1), nondegenerate | none |
| 4.4 saturation | ℓⁿy=c₁(x) | x=ℓⁿz by Kummer and H³=0, then y=c₁(z) | none |
| 4.5 congruence | ℓ=2, a=1 (−1); ℓ odd binomial valuations | fails at 2, holds for odd ℓ | none |
| 4.6 bounded degree | k=k̄; k finite; X(k)=∅ in char 0 | degree 1; integral; rank only | none |
| 5.1–5.3 automorphisms | −1 in char 2; power stabilizer; unramified finite-type group over a field | scalar 1; equal stabilizers; finite étale | none |
| 5.4 Wehler | S₁, S₂, S₂S₁ | det −12 Gram; trace 14, det 1 | none |
| 6.1 tame quotient | G=1; involution; Lemma 3.2 hypotheses | R=0; 8A₁; prime-to-p discriminant and nonsquare at rank 20 | none |
| 6.1a cyclic arithmetic | n=2,4,11,15; order-d fixed sum | 24=24, 72=72, 8 fixed points; 2A₁₀ and A₁₄A₄A₂ rank 20, det 121, 225 | none |
| 6.2 fixed points | eigenvalue 1 at a fixed point | forces g=id; fixed scheme reduced | none |
| 6.2a wild loci | empty F at p=2; D²=2,d=1 | Enriques branch; 0≤2 | none |
| 6.3 wild quotient | rational, Enriques, K3 branches | Enriques dimension and rational algebraicity need owners | R02 |
| 6.3a refinements | p=11; p=13 | disjunction kept; pencil impossible | none |
| 6.4 wild prime | all four fixed-locus cases | each closes with p≤11 | none |
| 6.4a Picard faithfulness | finite order first via 5.3 | matches keum 774–777 | none |
| 6.5 faithfulness | char 0 (Hodge); char p (cross-realization, Cauchy reduction to order p) | symplectic by eigenvalue of (t−1)²² mod p | R02 for the branches |
| 6.6 bound | G=1; char 3 | ℓ=5 | none |
| 6.7–6.8 Artin invariant | σ=0, 11; p=2; +9 versus −9 | excluded by 1I; dyadic parity is extra input | R03 |
| 6.8a invariants | G=1; C₇; order 21; Lemmas 4.2–4.4 inputs | 24, 6, 6; Artin (0.1), (1.7), ρ≥5 pencil, Brauer apparatus unowned | R01 |
| 6.9 character | n=1..8 | 24,8,6,4,4,2,3,2 equal f_n | none |
| 6.10–6.11 Mathieu | 1⁸2⁸; 23-cycle; ℚ versus ℚ_ℓ | 16 and 2 orbits; ℚ_ℓ contract missing | R04 |
| 7.1–7.3 polarizations | zero class; n²∣d; [0]; d=0 | all excluded as stated | none |
| 7.4–7.5 powers, embedding | m=0; L·D=0 excluded by ampleness; D²=1 odd | h⁰ values 4,10,20; 2L generated, 3L very ample | none |
| 7.6–7.7 atlas | singular degeneration; p=3 cube root | smooth locus; closed root locus | none |
| 8.1–8.5 stacks | involution stabilizer; identity trait; d=1; twists over 𝔽_q | DM, separated, ℤ[1/2], counted | none |

## Not verifiable

- `rudakov-shafarevich` §8 Proposition 3, `matsusaka-mumford` Theorem 2 and `nygaard-vectorfields` Lemma 3.3: waived in `sources.toml`; cited by locator only.
- Rudakov–Šafarevič 1976 and Shioda 1974 (R07): not in the manifest; not read.
- Dolgachev–Keum Theorem 5.2 entries beyond (viii) and the subgroup chains of Proposition 5.14: only lines 862–872 and 1566–1570 read.
- Mukai §§3–7 recognition arguments: only §8 (lines 1500–1542) and §6 headings read.
- Elaboration: no `Suggested.lean` exists at the design stage; the Lean elaboration command was therefore not run. The lean-lsp search tools were available and used for the duplication check only.
- The sources service added `artin-supersingular` (Numdam, open repository) to `sources.toml` during this review; the author's entries are unchanged.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "5e9b7b2f2e02ab9c6daec63c86cf755b89364fbf", "job": "REV-DESIGN-K3SurfacesAndSymplecticBoundedness~2", "model": "fable", "worker": "chris-f"} -->
