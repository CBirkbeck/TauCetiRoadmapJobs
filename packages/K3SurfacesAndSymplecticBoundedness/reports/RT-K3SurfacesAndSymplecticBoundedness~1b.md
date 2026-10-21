<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/563#issuecomment-6317375705 -->
Red team round 1 pass b (claude) of db94ab6

Verdict: needs_changes

1. **F01** (P1) §6.7d proof plan rests on a false step of its source and supplies no substitute

   Location: `packages/K3SurfacesAndSymplecticBoundedness/README.md:870–872` (target `IsK3.symplecticInvolution_genusOnePencil`), quoting "Track integral extension and torsion terms before deriving the dimension inequality; no assertion that every order-two integral matrix is identity modulo two is used."

   Claim: for a tame symplectic involution g on a geometric K3 in characteristic p≠2, ρ(X)≥5, proved "using the free locus, the eight exceptional curves on the quotient resolution, Brauer localization, integral Kummer and equivariant Hochschild–Serre", i.e. the route of dolgachev-keum Lemma 4.3.

   Witness: dolgachev-keum lines 643–645 conclude H²(X,µ₂)^G=H²(X,µ₂) from "an automorphism of order ≤2 of a free ℤ_ℓ-module acts trivially modulo 2". That sentence is false (the swap matrix on ℤ₂² has order 2 and is not the identity mod 2), and the README's own Check `involution_mod2_control` (line 879) says so. Without it the argument stops at dolgachev-keum (4.9), line 630: dim_𝔽₂ Br(X)^G[2] ≤ λ(Y)+t₊ ≤ 17. Decompose T₂(X) (rank λ(X)) as a ℤ₂[ℤ/2]-lattice into a trivial, b sign and c regular summands; then dim Br(X)^G[2]=dim(T/2T)^g=a+b+c=λ(X)−c, and (4.9) only yields b ≤ t₊: no bound on λ(X) follows unless c=0, which is exactly the unproved mod-2 triviality on T₂(X). Nothing in §6.7d, in `gap:equivariant-brauer-descent` (line 139, which cites (4.7) only), or in any supplier provides c=0 or any other route to ρ(X)≥5. The consumers §6.8a (`involutionPencil`, `supersingularTransfer`, the even-order branch), §6.9 and §6.11 inherit the gap, so the positive-characteristic Mukai bound chain is currently unsupported for groups of even order.

   Repair: either (a) state the missing step honestly as a target with a proof, or (b) replace the plan by a route that does not use it. A route (b) that the roadmap can own: (i) prove tame equivariant lifting, `IsK3.tameInvolutionLift`: for g tame of order 2 the ℤ/2-fixed subfunctor of Deligne's Def(X) (§2.5) is prorepresented by Spf W[[t₁,…,t_m]] with m=dim H¹(T_X)^g (average coordinates over ℤ/2 to linearise the action), the g-invariant locus of the pair divisor §2.6 for an averaged invariant ample L is flat over W when c₁(L)≠0 in H¹(Ω¹) (the Kodaira–Spencer functional is g-equivariant onto the trivial module H²(O), hence nonzero on invariants), and algebraise as in §2.7 to a polarized lift (𝓧,𝓛,g̃) over a finite trait; (ii) over ℂ, Lefschetz (§6.2 trace 6 on H²) gives an 8-dimensional anti-invariant part of H²(X_ℂ,ℚ) which is of type (1,1) because g acts trivially on H^{2,0} (§5.1), hence algebraic by §3.3, so ρ(X_ℂ)≥9; (iii) specialise: add to §4.1 the statement that for a smooth proper K3 family over a DVR the specialisation map Pic(X_η̄)→Pic(X_s̄) is injective and intersection-preserving (Huybrechts Chapter 17 §2.3), giving ρ(X)≥9≥5 and then §6.0b. If instead the lifting is to be consumed, declare it as a new gap on SchemeAndStackFoundations §4 (tame group actions on deformation functors) with a precise `needs` sentence and add the slug to `design/plan.json`. In both cases delete the sentence quoted above and restate the Check `involution_mod2_control` as a negative control for the replaced step.

2. **F02** (P2) §6.1a omits the order-14 solution of the displayed relations

   Location: `packages/K3SurfacesAndSymplecticBoundedness/README.md:736`, quoting "The corresponding relations for every subgroup, orbit divisibility and rank bounds leave n∈{2, 3, 4, 5, 6, 7, 8, 11, 15}"; also the API `tameCyclicFixedPointArithmetic.extra_exclusions` (line 740) and the Check `cyclic_extra_candidates` (line 748).

   Claim: the Euler identity 24(n−1)=Σ_{m|n,m>1} a_m (n/m)(m²−1), the same identity for every nontrivial subgroup, nonnegativity and the root-rank bound ≤20 leave only the listed orders, with 11 and 15 the only rank-20 survivors.

   Witness: n=14 with (a₂,a₇,a₁₄)=(1,1,1) satisfies 21·1+96·1+195·1=312=24·13, the order-7 subgroup identity 24·6=144=3·48 (it fixes a₁₄+2a₇=3 points) and the order-2 subgroup identity 24=8·3 (it fixes a₁₄+7a₂=8 points); the root lattice is A₁₃⊕A₆⊕A₁ of rank 20 and determinant 14·7·2=196=14². An exhaustive search of all nonnegative solutions for n≤60 returns exactly n∈{2,3,4,5,6,7,8,11,14,15,23}, with 23 excluded only by rank 22. Hence the quoted sentence is false as written, and the exclusion mechanism of the target is incomplete for n=14 (dolgachev-keum lines 511–520 and nikulin-symplectic lines 1605–1615 also list only 11 and 15; the latter's equation t_pq(p+1)(q+1)=24 has the further solution (p,q)=(2,7), t=1).

   Repair: replace the candidate list by n∈{2,3,4,5,6,7,8,11,14,15} and "the last three possibilities are excluded by the rank-20 nonsquare-discriminant theorem in positive characteristic (determinants 11², 14², 15²) and by the rank-19 bound in characteristic zero"; extend `extra_exclusions` to "The order-11, order-14 and order-15 candidate root lattices 2A₁₀, A₁₃⊕A₆⊕A₁ and A₁₄⊕A₄⊕A₂ have rank 20 and square determinants 121, 196 and 225, and cannot occur"; add the order-14 lattice to the Check `cyclic_extra_candidates` and the solution (a₂,a₇,a₁₄)=(1,1,1) as a negative-control Check `cyclic_order14_relation`: 21+96+195=312 with both subgroup identities satisfied, so Euler arithmetic alone must not certify it.

3. **F03** (P3) Statable Checks of the Lean-held layer have no Lean mirror

   Location: `packages/K3SurfacesAndSymplecticBoundedness/Suggested.lean:11–43` (no `example`, no definition) against `README.md:557–560` (Checks `rank0_kernel`, `rank1_prime3`, `prime2_negative`, `unipotent_two_term`), `README.md:25` ("All identities, including the inverse-pullback law, are required as proved tests when their carriers are available"), `README.md:643–644` (`wehler_pairing`, `wehler_product`) and `README.md:924–926` (`mathieu_identity`, `mathieu_order2`, `mathieu_order7`).

   Claim: every README Check statable at the pins has its `example`; conventions are pinned by a computed Lean test.

   Witness: all carriers exist at the pins. `prime2_negative` is `Matrix.GeneralLinearGroup.map PadicInt.toZMod (-1 : GL (Fin 1) ℤ_[2]) = 1 ∧ (-1 : GL (Fin 1) ℤ_[2]) ≠ 1` (the negative control for the `hodd` hypothesis of `oddCongruenceKernel_torsionFree`); `rank1_prime3` is `map PadicInt.toZMod (-1 : GL (Fin 1) ℤ_[3]) ≠ 1`; `rank0_kernel` is `∀ A : GL (Fin 0) ℤ_[ℓ], A = 1`; `wehler_product` is `!![-1,0;4,1] * !![1,4;0,-1] = (!![-1,-4;4,15] : Matrix (Fin 2) (Fin 2) ℤ)` with trace 14 and determinant 1 (this is the two-term witness of the pullback-order convention of line 25); the Mathieu character ε(n)=24/(n∏_{q|n}(1+1/q)) is a light definition with real body on ℕ → ℚ whose values 24, 8, 3 at n=1,2,7 are the three Checks.

   Repair: add to `Suggested.lean` (i) the two negative-control examples for `oddCongruenceKernel_torsionFree` (ℓ=2 and the rank-1 odd case) and the rank-0 example, (ii) `def mathieuCharacter (n : ℕ) : ℚ := 24 / (n * ∏ q ∈ n.primeFactors, (1 + 1 / (q : ℚ)))` with two proved examples (n=1 gives 24, n=2 gives 8), and (iii) a Layer 5 section with the Wehler matrix identity as a proved `example`; name each after its README Check so README and Lean agree.

4. **F04** (P3) Manifest entries not cited by the README

   Location: `packages/K3SurfacesAndSymplecticBoundedness/sources.toml`, entries `illusie-witt` (II Proposition 3.11, lines 4202–4223), `gros-chern` (five locators) and `liu` (Chapter 9 §3, waived).

   Claim: the References section (README.md:1173) says every cited work and its status is recorded in `sources.toml`.

   Witness: `grep -c "illusie-witt\|gros-chern\|liu" README.md` returns 0; none of the three ids, and none of their locators, occurs in the README. illusie-witt lines 4202–4223 concern H¹ of de Rham–Witt (Picard/Albanese), which no target uses. The package report states no Chapter 9 clause remains, but the `liu` entry does.

   Repair: either delete the three entries from `sources.toml`, or cite them where used (illusie-witt only if §2.1a's kernel argument actually consumes II 3.11; gros-chern only if the crystalline Chern-class input of §2.6/§6.0 is meant to be sourced there instead of the CrystallineCohomology contract).

## Verified sound

Declarations read: 3 of 3 in `Suggested.lean`. Each is true as typed: for odd ℓ the kernel of GL_n(ℤ_ℓ)→GL_n(𝔽_ℓ) is torsion-free (binomial depth argument checked at a≥1, including the ℓ=2 failure at a=1), reduction is injective on finite subgroups, and finite subgroups of GL_n(ℤ) inject into GL_n(𝔽₃); the README statements (§4.5, lines 547–551) have the same generality (n≥0 arbitrary, ℓ odd). Pinned declarations grepped at Mathlib 6b7abb3c and Tau Ceti a91d3aaf (local checkouts verified to be at the pins): all 15 Mathlib names and all 12 Tau Ceti names listed in the contracts exist in the cited files, with `Matrix.GeneralLinearGroup.map : GL n R →* GL n S` in namespace `Matrix.GeneralLinearGroup` and `PadicInt.toZMod : ℤ_[p] →+* ZMod p` under `[Fact p.Prime]`, so the signatures elaborate as written. File form: single `import Mathlib`, module docstring in the required shape, `theorem` only, no `set_option`, no `#check`, no sorry'd data, no process text, no machine paths.

Targets read: all 60 bold targets, 84 API laws and 191 Checks (every line of the 1203-line README). Adversarial instances tried (statement → instances → result):

| Statement | Instances | Result |
|---|---|---|
| 1.1 IsK3, 1.2 field invariance, 1.3 projectivity | empty scheme, ℙ², E×E, inseparable K/k, identity extension | sound; Stacks 0C5P read at line 2327 |
| 1.4 RR 2χ(L)=4+L², contraction | L=O, quartic H (χ=4), frame σ(e₁,e₂)=1 (signs e₂*, −e₁*), p=2 | sound |
| 1.5 numerical kernel, torsion-free Pic | L=O, (−2)-curve, p-torsion | sound (huybrechts 335–354) |
| 1.6 quartic, Fermat | t=0,1; 𝔽₂ | sound |
| 2.1 Picard space, 2.1a kernel input, 2.2 closedness, 2.3 vanishing | zero section, p=2, finite vs infinite height | plan matches lang-nygaard 54–104; kernel theorem itself rests on waived Nygaard Lemma 3.3 (see Not verifiable) |
| 2.4 Hodge/crystalline ranks | i=−1,…,4 in the universal-coefficient sequence, W/p summand | sound (deligne-lift 29–57) |
| 2.5–2.7 deformations, lifting | L=O (dimension 20), p|2d, p=2 | sound (deligne-lift 58, 78, 131, 140–160) |
| 3.1–3.4 analytic predicate, GAGA, integral Betti, integral étale | torus, empty manifold, ℓ=char, ℓ=2 | sound; Rizov's minus sign on ψ noted correctly at README line 23 |
| 4.1–4.4 Picard base change, lattice, ranks, cycle map | K=k, ℂ⊂K, ℝ⊂ℂ projection factor 2, Gram [4], rank 0, ρ=22 saturation | sound |
| 4.5 congruence theorems | n=0, ℓ=2 (−1), ℓ=3 (−1↦2), I+3E₁₂ powers | sound |
| 4.6 bounded descent | algebraically closed k (degree 1), imperfect k via separable part, finite k, char 0 with a point | sound (huybrechts 14038–14054) |
| 5.1–5.3 symplectic predicate, stabilizers, finite étale | id, −1 scalar in char ≠2 and =2, Lⁿ vs L, p=2 | sound (rizov 615: unramified finite type over a field is finite étale) |
| 5.4 Wehler | Gram [[2,4],[4,2]] det −12; S₁, S₂ columns; S₂S₁=[[−1,−4],[4,15]], trace 14, det 1 | computed and sound |
| 6.0 Artin invariant | σ=0 (even unimodular (1,21) impossible), σ=11 (B/p even unimodular), p=2 | sound |
| 6.0a–6.0c height, pencils, Jacobians | h=1,10,11; rank-one lattice; 2F vs F; quasi-elliptic p=2,3; no section | sound (artin-supersingular 40–55, 192–212; enriques-one theorem numbers) |
| 6.1 tame quotients, rank-20 nonsquare | G=1, involution 8A₁ (det 2⁸), square det ⇒ isotropic rank-2 complement, Shioda–Tate with MW torsion m | sound (dolgachev-keum 444–506) |
| 6.1a cyclic arithmetic | n=2,4 identities; exhaustive search n≤60 | **R02** |
| 6.2 fixed-point table | identity excluded, orders 7 vs 8 | sound |
| 6.2a–6.4 wild alternatives, p≤11 | empty fixed set p=2; D²=2,d=1 gives 0≤2; p=13 | sound (wild-cyclic 14–44, Corollary 3.3 K_Y∼−(p−1)B at line 421; dolgachev-keum 160–394) |
| 6.4a–6.6 faithfulness, uniform bound | identity kernel, Enriques branch b₂=10 via Gauss–Bonnet, ℓ=5 at p=3 | sound (keum 767–815) |
| 6.7d involution pencil | p=2 excluded; p=3 quasi-elliptic | **R01** |
| 6.8–6.11 invariants, Mathieu character, bounds | G=1 (24), C₇ (6), order 21 (6), ε(n) at all twelve orders of mukai (0.2), 1⁸2⁸ has 16 orbits, 23-cycle 2 orbits | sound |
| 7.1–7.7 primitivity, [n], families, vanishing, cube embedding, Hilbert locus, atlas | λ=0, 2F, [0], n=3 at p=3, d=1,2 (ℙ¹⁰, ℙ¹⁹), Reider–Terakawa failure cases A·D=1,2,3 | sound (rizov 142–179, 463–516; terakawa 183, 354) |
| 8.1–8.5 stacks, separation, coarse, smoothness, finite fields | d=1 base ℤ[1/2], twists counted separately | sound (rizov 898, 1075–1101) |

Locators verified against the cached texts: 118 (huybrechts 33 ranges, rizov 22, dolgachev-keum 24, keum 7, lang-nygaard 1 range, mukai 6, nikulin-symplectic 2 ranges, oda 1, nygaard-closedness 1, wild-cyclic 1 range, deligne-lift 7, terakawa 5, artin-supersingular 2, rudakov-shafarevich-inseparable 2, shioda-unirational-primary 2, artin-mazur-formal 4, sga2 1, stacks-surface-resolution 6, stacks-relative-ample 1, stacks-projective-morphisms 4, liedtke-mckay 4, liedtke-surfaces 2, enriques-one 5 theorem headers). All agree with the claims they support, including Stacks tag-to-lemma numbers (0C5P=16.11, 0C2N=16.9, 0BGP=14.5, 0C5R/0C5S=17.1/17.2, 0AGS=3.4).

Checks tested: 191 read; 60 instantiated numerically or by counterexample as in the table; none found false or vacuous apart from the two listed in R02 (`cyclic_extra_candidates` incomplete) and the statable-without-mirror set in R03.

Supplier citations checked: SchemeAndStackFoundations on main, all 33 cited sections (§0.4, §0.9, §0.11, §1.1, §1.11, §1.17, §1.18–1.21, §1.23, §2.10, §2.11, §2.15, §2.20, §2.23, §4.1–4.6, §4.10–4.12, §4.14, §5.2, §5.4–5.6, §5.8–5.10) and the nine named declarations exist; EtaleCohomologyFoundations F.0.3, F.2.1–F.2.2, F.4.2, F.4.4–F.4.6, F.5, F.6, §0.9 and the four `VanishingCycles.*` names exist; CrystallineCohomology at pull-request head 2c8b22a1 (fetched from the content repository, not on main or in a rev checkout): CR.2.3, CR.3.2 with "Proper smooth crystalline perfectness and reductions", CR.3.3, CR.3:duality.1, CR.4.1, CR.4.6, CR.4.7 with `Crystalline.wittCohomology_V_complete`, CR.7.3 exist; AlgebraicModuliForArithmeticGeometry at head 98fd0382: §7.6.1 (`relativePicardSheaf`, `relativePicardBaseChange`, `relativePicardKernel`, with X and B algebraic spaces), §7.6.1a `sectionPicardSplit`, §9.10 `algebraicAdjointVanishing` exist with the hypotheses the README states; ComplexComparisonPartII at head c9ccfac8: C−1.1, C1.9, C2.2, C3.2d.2–C3.2d.5, C5.1, C6.3, C6.6 and the ten named declarations exist; on main, JacobianChallenge Layers A, C, D; AlgebraicVectorBundles L0A–L0C; IntegralLattices active Layers 1 (1I Milgram), 5, 6 and Completed Layers 1–5; GlobalQuadraticForms §5.5; QuadraticFormInvariants 6D (rank ≥5 isotropy); AlgebraicTopology Stage 6 items 1, 2, 4 and `compactTriadPoincareLefschetz`; MorseNovikov N6 mapping-torus Lefschetz; ComplexKahlerGeometry K3, K4, K5a, K5b, K6.1; CFSGStatement S1; StableReduction Layer 2 polarized descent; ComplexCurveModuli D0–D2, D7 all exist. Merge order: every supplier is on main or earlier than K3SurfacesAndSymplecticBoundedness (line 36 of ORDER.txt); AbelianSchemesAndArithmeticModuli, ArithmeticDynamics and ErdosProgressionPowers are later and are cited for nothing. Ownership: the rev checkouts of the five open sibling pull requests and every roadmap on main mention K3 surfaces only incidentally (IntegralLattices defines the abstract lattice Λ_K3, which the README correctly distinguishes at line 9); no duplicated object. Gaps: all 25 slugs agree between `design/plan.json` and the README contracts; each `needs` sentence is specific, has a named supplier and asks for nothing the pins or earlier roadmaps provide. Policy: the pull request changes only the package folder; no pull-request numbers or process narrative in README or docstrings; every target has a locator.

Depcheck output:

```
depcheck: 6 roadmaps, 42 edges, 0 problem(s)
```

## Not verifiable

- `nygaard-vectorfields` Lemma 3.3 (waived): the kernel assertion of §2.1a is restated as a target with a thin plan ("the kernel assertion with the Witt and formal-Brauer comparisons"); lang-nygaard line 99 only cites it. I could not confirm or refute that d:H²(WO_X)→H²(WΩ¹_X) has nonzero kernel on a supersingular K3 from the available texts.
- `rudakov-shafarevich` §8 Proposition 3 (waived) for §6.4a and `matsusaka-mumford` Theorem 2 (waived) for §8.2: cited by locator only; keum lines 799–801 and rizov line 1084 confirm the applications.
- `shioda-transcendental` Proposition 5 and `arapura-chern` §7.5 (uncertified): checked only through their application locators (keum 325, dolgachev-keum 590–594).
- `nikulin-symplectic`: Russian OCR of pp.108–110; equation (5.2) and the case split were readable, the (2,7) omission noted in R02 is as the OCR shows it.
- `enriques-one`: the extraction is font-garbled; theorem numbers, hypotheses and positions were verified, formulas only by shape.
- The Lean file was not elaborated: the brief permits no Lean command for this job. The three statements were checked by reading the pinned signatures.
- The depth of CrystallineCohomology CR.3.2(3), CFSGStatement S1 and IntegralLattices Layers 5–6 was checked for existence and headline content, not read line by line.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "db94ab66ff742f22f558692395ebadc9019975bc", "job": "RT-K3SurfacesAndSymplecticBoundedness~1b", "model": "fable", "worker": "chris-f"} -->
