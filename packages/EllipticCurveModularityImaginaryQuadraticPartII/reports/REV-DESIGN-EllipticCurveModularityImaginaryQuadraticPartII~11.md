<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16328#issuecomment-6899256931 -->
Review (claude) of 102448f

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §1.1 states the intermediate-field assertion below the generality its own proof gives

   **Location.** `packages/EllipticCurveModularityImaginaryQuadraticPartII/design/README.md:340–342`: “let `K` be a CM number field, `S` a set of positive integers and `L/K` a finite extension with `IsCyclotomicExtension S K L`. Then every intermediate field `K ⊆ K' ⊆ L` is a CM field”; the same statement in target 1.1 of `design/plan.json`.

   **Claim.** The cyclotomic hypothesis is part of the intermediate-field statement.

   **Witness.** The route (lines 345–352) uses of `L` only that it is CM. `K = ℚ(i)`, `K' = ℚ(i, √5)`, `L = ℚ(i, √3, √5)`: `L` is CM of degree 8 and is no `K(μ_S)` (its roots of unity are `μ₁₂`), yet `K'` is CM. MilneCM lines 292–297 give the general form.

   **Repair.** State two assertions under the same id 1.1: “(a) for a CM number field `K` and a finite `L/K` with `IsCyclotomicExtension S K L`, `L` is CM; (b) for CM number fields `K ⊆ L`, every intermediate field `K ⊆ K' ⊆ L` is CM.” The route is unchanged (its first half proves (a), its second half (b)); retitle §1.1 “Cyclotomic extensions and intermediate fields of CM fields”, adjust the Layer 1 bullet of *Owned here* and the `statement` and `hypotheses` of target 1.1 in `plan.json`, and add the instance above as a Check (maximal real subfield of `K'` is `ℚ(√5)`). Tested on that instance: complex conjugation of `L` is central in `Gal(L/ℚ) ≅ (ℤ/2)³`, preserves `K'`, and its fixed field `ℚ(√5)` in `K'` is totally real of index two. The base stays CM, so the statement does not meet `realCyclotomic_isCMField` of EllipticCurveModularityTotallyReal §1.1 (totally real base).

2. **F02** (P3) §6.1: the route does not make the protected places split in the imaginary quadratic composita

   **Location.** `design/README.md:1049–1053`: “the three imaginary quadratic composita, the degree inflation at five), whose construction does not use clause (15), with trivial prescribed completions at the places of `F⁺` below `P`”.

   **Claim.** The route yields an `F'` “in which every place of `P ∪ P^c` splits completely” (line 1047).

   **Witness.** The prescribed completions cover only the extension made over `F⁺`. In ACC23 lines 7165–7172 only the test places are required to split in all three imaginary quadratic fields; a ramified prime of `ρ` is required to split in `E_b` alone. CaptainSude26 lines 589–593 adds `q` to those prescriptions.

   **Repair.** After “at the places of `F⁺` below `P`” insert “and with the rational primes below `P` among the primes required to split in each of the three imaginary quadratic fields”. Tested for `q ≡ 1 mod 5` below `P`: choose `E_a` with `2, 5, q` split; `E_b = ℚ(√−p_b)` with `p_b ≡ −1 mod q`, so `−p_b ≡ 1` is a square modulo `q`; `E_c = ℚ(√−p_c)` with `p_c ≡ 1 mod 4p_b` and `p_c ≡ −1 mod q`, compatible by the Chinese remainder theorem. Then `q` splits in the compositum and the places above `P ∪ P^c` keep completion `ℚ_q`.

3. **F03** (P3) “Steinberg-protected” is used and never defined

   **Location.** `design/README.md:53` (“the general Steinberg-protected lifting theorem”) and `:1038` (“## Layer 6: The Steinberg-protected lifting theorem”); the title of Layer 6 in `design/plan.json`.

   **Claim.** The term is the literature's or is defined in the roadmap.

   **Witness.** §3.3 defines *protected*; the Conventions (lines 156–159) name the *unipotent-inertia condition* and set it apart from the Steinberg lifts of LocalGaloisDeformationRings §2.5. The compound occurs nowhere else in the README, in the sources (CaptainSude26 says “retained Steinberg place”, line 264) or in any roadmap on main or at an open head.

   **Repair.** Line 53: “the general lifting theorem at five with a protected place”; line 1038 and the Layer 6 title in `plan.json`: “Layer 6: The lifting theorem at five with a protected place”. This is the Summary's own name for Theorem 6.2 (“the protected lifting theorem at five”). No section number or target id changes; no roadmap cites the heading.

All three findings of round 10 are repaired. The mathematics of the fifteen sampled targets, the three headline theorems and every passage the repair changed was recomputed; no statement is false, vacuous or missing a hypothesis, and no supplier citation fails to resolve. There is no P1 or P2 finding. Three P3 findings follow, each with an exact repair; because each is a repair, the verdict asks for changes. The declared gap `acc-torsion-inertial-comparison` (supplier AutomorphicGaloisRepresentationsPartII AG2.5) is a stated contract and not a finding. This is a design: there is no `Suggested.lean`, and this lane does not elaborate.

## Verified sound

### Round-10 findings

- **F01 (weight of ACC's setting): repaired.** Supplier obligations now read “a good level `K`; a dominant weight `λ` (Theorem 5.3 uses `λ = 0`); a finite conjugation-stable set `S`” and “the localized Hecke algebra of level `K` and weight `λ`”; the `detail` of the gap in `plan.json` has “a dominant weight λ (λ = 0 for 5.3)”. Read against ACC23 lines 2309–2355: the field, level, weight (line 2313), the two conditions on `S`, the three conditions on `R`, `T = S − (R^c − R)`, `N` depending on `n` and `[F:ℚ]`, and conclusions (1)–(2) all agree. The Conventions scope the letter `λ` (line 165–167); its only other occurrences are the Tate-parameter series of §§7.1–7.2.
- **F02 (§7.2, “a cycle of type `I₃` … before resolution”): repaired.** Lines 1188–1190: “no longer two rational curves meeting in two nodes of thicknesses two and one (type `I₃` once the thickness-two node is resolved)”. Agrees with §7.1(c) and its Checks: thickness `2 + 1 = 3` before, `1 + 1 + 1 = 3` after.
- **F03 (manifest locators): repaired.** `sources.toml`, `LeHung26`: “…; Remark 1.3.1 p.3; Section 5 p.9”; the four further entries the repair extended (CaptainSude26, OpenAI26, CN23, ACC23) were checked against the page markers: LeHung26 p. 3 at line 95, p. 9 at 341; CaptainSude26 p. 6 at 257, p. 11 at 507, p. 14 at 667; CN23 p. 81 at 4196, p. 87 at 4491; ACC23 p. 57 at 2291, p. 58 at 2332, p. 178 at 7156.

The repaired pattern (a reused letter, a locator in the README missing from the manifest, a fibre type named before resolution) was searched for in the rest of the design: none further.

### Adversarial table (values computed this round)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Conventions, `ad⁰` and `D = Ad(U)` | `e, h, f` | `UeU⁻¹ = e`; `UhU⁻¹ = [[1,−2],[0,−1]] = h − 2e`; `UfU⁻¹ = [[1,−1],[1,−1]] = f + h − e`; Gram matrix: `⟨e,f⟩ = 1`, `⟨h,h⟩ = 2`, determinant `−2` | holds |
| §1.1 | `ℚ(i) ⊂ ℚ(i,√5) ⊂ ℚ(ζ₂₀)`; `(ℚ(i), ℚ(i,√5), ℚ(i,√3,√5))`; `ℚ(√5)` | central `c` gives `σGal(L̃/K')σ⁻¹` stable, fixed field totally real, index 2; second triple: `L` has roots of unity `μ₁₂` only, degree 8 against `[ℚ(ζ₆₀):ℚ] = 16`; `ℚ(√5)` is real | true; narrower than its proof (R01) |
| §1.2 | `1 ⊕ 1` over `𝔽₃`, `ℚ ⊂ ℚ(ζ₃)` | over `ℚ`, `q = 2`: ratio `1 ≠ 2`; over `ℚ(ζ₃)` split `q ≡ 1`: ratio `1 = q`; `F_w = K_v = ℚ_q`, `q ≠ ℓ` carried | (a) holds, converse fails |
| §2.1 | `K₆₀`; hypotheses of CN23 Theorem 6.1 | `{1, 29} ⊂ (ℤ/60)ˣ`: `29 ≡ 1 mod 4`, `2 mod 3`, `4 mod 5`; `ζ₅ ∉ K₆₀`, `ζ₅ ∈ K₆₀(ζ₃)`; criterion (2) of Theorem 6.1 needs `ζ₅ ∉ K` only | holds; `ζ₅ ∉ F` not used |
| Theorem 2.5 | `ℚ(i)`, `K₆₀`, `ℚ(ζ₅)`, `ℚ(ζ₈)` | `ζ₅ ∈ K`: no, no, yes, no; lifting primes `p, 3, p` with residual pairs `(3,p)`, `(p,3)` and the endpoint, as in the parent's §7.4(1)–(2) | holds |
| §3.1 | `X = [[x,y],[z,−x]]`; `diag(2,3)`; characteristic 2; `𝔽₃` | `UX − XU = [[z,−2x],[0,−z]]`; `UᵀX − XUᵀ = [[−y,0],[2x,y]]`; `2·3⁻¹ = 3·2⁻¹ = 4`; `Uf = E₁₁ + f`, trace 1; `(D−1)²f = −2e`; `1 ∈ ad⁰` when `2 = 0` | invariants vanish iff `2 ∈ k^×` |
| §3.2 | `p = 3, 5, 7` | `Σ_{i<5} Dⁱ = 5 + 10(D−1) + 10(D−1)²`; `(D−1)M = ke ⊕ kh`; `p = 7`: `7 + 21(D−1) + 35(D−1)² = 0`; `p = 3`: `3 + 3(D−1) + (D−1)²`, kernel `ke ⊕ kh`; `120/5 = 24 ≡ 4` | `dim H¹(⟨U⟩) = 0, 1, 1` |
| §3.3 | `M = [[0,−1],[1,−1]]`, `Φ = [[4,1],[0,1]]` over `𝔽₅`; index-`p` base change | `Φ² = 1`; `ΦMΦ⁻¹ = [[4,1],[4,0]] = M² = M¹¹`; `χ_M = X² + X + 1`; a group of unipotents in `GL₂(k)` is a `p`-group, so inertia acts through `ℤ_p(1)`; `U^p = 1` | definition separates |
| §3.4 (used by 5.3) | `(1+εf)U`, `(1+εh)U`; `diag(11,1)` | traces `2 + ε`, `2`; determinant `1 − ε² = 1`; `(1+N)^q = 1 + qN`; `q(q+1)²δ² = (1+q)²ψ(φ)`; `11·144 = 1584` | (i)⇔(ii); three parameters `a, b−1, z−[z̄]` |
| §3.5 (used by 4.1, 4.3) | `q_v ≡ 1`, `2 mod 5`; `p = 3`, `q = 4` | `M^(I) = ke`, `φ` scales `e` by `q_v`; `dim L = 3 − (3 − h⁰)`; `Σ_{i<q} Dⁱ = q + C(q,2)(D−1) + C(q,3)(D−1)²`, equal to `1` for `p ≥ 5`, and `C(4,3) = 4 ≡ 1 mod 3`; `Z¹ = 3 + 1`, `B¹ = 2` | (a)–(d) hold; `p ≥ 5` needed in (d) |
| §4.1 | `G × A`, `A` abelian; inertia of order 2 | `H¹(A, M)^G = Hom(A, M^G) = 0`; `C_N/F` unramified at `v ∤ 5`; inflation injective on `H¹`; order-2 image has invertible order | holds; fails without a protected place |
| §4.2 (used by 4.3) | `g ↔ diag(2,3)`; `κ(σ₀) ∈ W` or not | `(Ad g − 1)`: `e ↦ 3e`, `h ↦ 0`, `f ↦ 3f`; `κ(γσ₀) = κ(γ) + κ(σ₀)` | one of `σ₀`, `γσ₀` detects |
| §4.3 | `(d,t,r) = (2,1,6)`, `(2,3,10)`; framing `P` | `g = 0`; `g = 6`, `dim R^loc = 1 + 9 + 4 = 14`, `14 + 6 = 20 = r + 4t − d`, `1 + 11 + 10 = 22`; framing adds `4|P|` on both sides | deficit `d` |
| §5.1 (used by 5.2) | degrees `≥ 8`, multiples of 4 | `a + a' < d/2` forces `d > 32`; `d = 36` would need all degrees 8, `8 ∤ 36`; `(8,8,24)`: `24 > 20`, `8 < 20` | least `d = 40` |
| §5.2 | `d = 40`, `t = 10`, `R = ∅` | `1 + 10·(3 + 8) = 111 = 1 + 3t + 2d` | holds |
| §5.3 | sets `(S∪Q) ∪ (S∪Q)^c`, `R∪P∪Q`; `w = v^c`, `q_w = 11` | conjugates of `R`, `P`, `Q` outside `R∪P∪Q` lie outside `S∪Q` (`P^c ∩ S = ∅`, `Q ∩ S^c = ∅`); residue characteristics split by (i) and §4.2; index `12`, `12·5 = 60`; `(1+ε)¹¹ = 1 + ε` | hypotheses of ACC23 Theorem 3.1.1 met; `Q ∩ S^c = ∅` needed |
| §6.1 | `v ∈ P`, `v^c`; `E_a, E_b, E_c` | `ρ` ramified at `v`, unramified at `v^c`, so `v ≠ v^c`; `−p_b ≡ 1 mod q` when `p_b ≡ −1` | statement holds; route lacks one clause (R02) |
| Theorem 6.2 | `⟨SL₂(𝔽₅), μγ⟩`, `μ² = 2`, `γ = diag(1,2)`; determinant of order 4 | `det(μγ) = 4`; `(μγ)² = diag(2,3)`; order `240`, projective image of order `120`; kernels of index `120`, `120`; preimage of `PSL₂(𝔽₅)` in `SL₂` is `SL₂(𝔽₅)`, whose only involution is `−1`; `120 < 240` | `ζ₅ ∈ F` is a real hypothesis |
| §7.2 | `m_v = 1, 5, 7`; `d = 3` | `v(Δ_min) = 3, 15, 21`; `K₁ ↪ K_v = ℚ_q`; `d = 3` is a unit for `q ≥ 7` | (a), (b) hold |
| §7.4 | `Σ = ∅`; `w ∈ Σ` above 2 | reduces to `switch_five`; trivial completion below `w` gives `L_{w'} = F_w` without `w ≠ w^c` | holds |
| §7.5 | transvections with entry 3; clauses of Theorem 6.2 over `L` | entries `±3` are units modulo 5, group of order `120`; `det = ε̄₅ = 1` on `G_K`; projective field contains `ζ₅ ∈ L`, so (4) fails; `5 ∤ 3m_v`; `A'` good at `v^c`, split multiplicative at `v` | hypotheses of 6.2 met |
| Theorem 8.1 | `ℚ(ζ₅)`, `ℚ(ζ₁₅)`, `ℚ(ζ₂₀)`, `K₆₀`, `ℚ(i,√5)` | `ζ₅ ∈ K`: yes, yes, yes, no, no; fixer of `K₆₀(ζ₅)` in `{1, 29}` is `{1}` | branches exhaustive |

The rows of round 10 for §§2.2–2.4, 5.4, 7.1 and 7.3 carry computed values and their text is unchanged; they were relied on.

### Sources: the seeded sample

No locator is flagged unverified. The eight manifest texts are in the sources cache; nothing was fetched and nothing is missing.

| Target | Checked at | Result |
|---|---|---|
| 2.1 | LeHung26 lines 336, 342–355; CN23 lines 4513–4517 (p. 87) | supported |
| 2.5 | LeHung26 lines 86–88 (conditional on the geometric inputs, which the parent supplies), 342–351, 357–358 | supported |
| 3.1 | CaptainSude26 lines 187–193 | action supported; the invariant statement is this roadmap's computation |
| 3.2 | CaptainSude26 lines 231–241 | supported |
| 3.3 | CaptainSude26 lines 177–183, 533–536 | supported for `p = 5`; general odd `p` recomputed above |
| 4.1 | CaptainSude26 lines 227–241 | supported |
| 4.3 | CaptainSude26 lines 416–444 | supported |
| 5.2 | CaptainSude26 lines 285–289; CN23 line 4361 | supported |
| 5.3 | CaptainSude26 lines 291–408; CN23 lines 4334, 4382 (pp. 83–84); ACC23 lines 2309–2355 (pp. 57–58), 6357 | supported |
| 6.1 | CN23 lines 4433–4509 (pp. 85–87); CaptainSude26 lines 543–603; ACC23 lines 7163–7187 (p. 178) | supported; see R02 |
| 6.2 | CN23 lines 3849–3872 (pp. 73–74), 4562–4572; CaptainSude26 lines 264–289, 410–415 | supported |
| 7.2 | CaptainSude26 lines 520–532 | supported |
| 7.4 | CaptainSude26 lines 538–603; CN23 lines 4574–4581; CHT08 line 5723 (p. 116) | supported |
| 7.5 | CaptainSude26 lines 120–125, 604–609 | supported |
| 8.1 | CaptainSude26 lines 26–33, 671–683; LeHung26 lines 125–128 | supported |

Also read: MilneCM lines 273–297 (p. 10) for §1.1; LeHung26 lines 308–321 for §1.2; AKT23 line 3979 (p. 86) for §4.2.

### Library, suppliers, order

- Pins `1b1ccf4b…` (Mathlib) and `2fd255d9…` (Tau Ceti), as in `lake-manifest.json` and as checked out. Opened at the pins: `NumberField.IsCMField` (`Mathlib/NumberTheory/NumberField/CMField.lean:70`), `complexConj` (:142), `isConj_complexConj` (:148), `ofCMExtension` (:510), `of_isAbelianGalois` (:542), `IsCyclotomicExtension.Rat.isCMField` (:564); `NumberField.isTotallyComplex_of_algebra` (`…/InfinitePlace/TotallyRealComplex.lean:229`); `Matrix.SpecialLinearGroup.toGL` (`Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:369`); `Matrix.SL2.commutator_eq_top` (`Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:804`; hypotheses `a ≠ 0`, `a² ≠ 1`, met by `a = 2` in `𝔽₅`); `Rep.FiniteCyclicGroup.groupCohomologyIsoOdd` (`…/GroupCohomology/FiniteCyclic.lean:114`); `groupCohomology.map` (`…/GroupCohomology/Functoriality.lean`, module docstring line 23); `TauCeti.ClassFieldTheory.eulerCharacteristic_mixed` (`…/EulerCharacteristic/Theorem.lean:98`); `tateDualityPairing_perfect_mixed` (`…/Duality/Perfect.lean:280`). All exist.
- “The file has no statement about composita or subfields of CM fields” holds: the declarations of `CMField.lean` were listed, and the Tau Ceti files under `TauCeti/NumberTheory/NumberField/ComplexConjugation/` (conjugation at a place, its agreement with `complexConj`, membership in the maximal real subfield) state none either. `NumberField.IsCMField.of_forall_isConj` (`CMField.lean:519`) is the Galois case of the criterion the route of §1.1 uses.
- Supplier citations, resolved now at main or at the open heads: every cited section exists as a heading or bold paragraph title in the 20 supplier roadmaps. Statements read against their use: the parent's §0.3 (`solvable_preparation`, `seed_modular` with no condition at five, `hilbert_local_selection` with finitely many opens, `switch_five` without `ζ₅ ∉ F`, `auxiliary_local_types`), §5.2, §5.3 (`cm_modularity`, any CM field with `ζ₅ ∉ L`), §7.2 (general number-field prime choice, `p > max{100, 2d+1}`), §7.4 (finite set of places containing those above `3p`; pairs `(3,p), (3,5), (p,3)`; image of `G_D` contains the geometric monodromy) and its boundary section; CrystallineLocalGlobalCompatibilityCM §8.6, §8.7 (`p` odd, `ζ_p ∈ F`, trivial reduction), §9.1 (clauses (5)–(15)), §9.3 (`g = q − 3[F⁺:ℚ] − 1 + |S|`), §§9.7, 9.9, 9.10, 9.11, 9.12; PotentialAutomorphyInfrastructure §2.1, §2.3(1)–(2), §2.5; AutomorphicGaloisRepresentationsPartII AG2.7 (`IsDecomposedGenericPrime`: `p ≠ ℓ`, completely split, generic at every place; `decomposedGenericPrime_local`); ArithmeticGaloisRepresentations §4.3, §7.2, §7.7 (Sylow injectivity, coefficient change, `H⁰ = H¹ = 0` for `#F ≠ 5`, `H¹(SL₂(𝔽₅), ad⁰)` one-dimensional), §7.9 with `adZeroRep {G} (r : G →* GL n k)` on `LinearMap.ker (LinearMap.trace k (n → k))` in its `Suggested.lean`; GlobalGaloisDeformations §3.6, §3.7 (the tangent-generator surjection needs no liftability outside `T`), §5.6; LocalGaloisDeformationRings §§2.3, 2.5 (trivial residual data), 2.6, 2.8, 2.16, 2.21; NeronModelsAndSemistableAbelianVarieties §3.12 (`N ≥ 3` invertible). No roadmap of the never-cite list is cited.
- The citation resolver's four leads: three are source keys (`LeHung26, §4.4`, `OpenAI26, §9.4`, `CaptainSude26, §4`); the fourth, `ResidualImage.adZeroRep`, is a declaration of ArithmeticGaloisRepresentations (its `Suggested.lean`, §7.9), attributed to that roadmap in the README. None is a defect.
- Gap `acc-torsion-inertial-comparison`: same slug in `plan.json` (`gaps`, supplier AutomorphicGaloisRepresentationsPartII, section AG2.5, needed by 5.3) and in the README (Supplier obligations, §5.3 route and *Needs*, Layer 5 Dependencies). One statement is asked for, with its hypotheses and conclusion as in ACC23. AG2.5 at its head states no torsion form (no occurrence of the theorem in that README); PotentialAutomorphyInfrastructure cites AG2.5 for it. Precise, minimal, declared.
- Dependency check:

```text
candidate: EllipticCurveModularityImaginaryQuadraticPartII is not in the merge order yet; checked as if placed after EllipticCurveModularityImaginaryQuadratic (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2257 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

### Duplication and overlap

`scratch/overlaps.md`: no other pull request changes this roadmap, no cited id is dropped, none is defined only by a revision, no second copy on main. The board index lists AnalyticNumberTheory and LawrenceVenkateshMethod, both unrelated. Searches of main and every open head, by object: a protected or unipotent-inertia local condition at a retained place (no owner); a width-three degeneration (one unrelated match); CM-ness of composita or intermediate fields of CM fields (no owner); descent of decomposed genericity along an extension (PotentialAutomorphyInfrastructure §2.1 is the opposite direction, restriction to a disjoint extension); detection of the class of `H¹(SL₂(𝔽₅), ad⁰)` on a Sylow subgroup (no owner; the dimension is ArithmeticGaloisRepresentations §7.7, cited); ACC Theorem 3.1.1 (cited by PotentialAutomorphyInfrastructure as AG2.5, stated nowhere: the gap). EllipticCurveModularityTotallyReal §1.1 owns `realCyclotomic_isCMField` for a totally real base; §1.1 here has a CM base, so the two do not meet.

Overlap check: read EllipticCurveModularityTotallyReal, EllipticCurveModularityImaginaryQuadratic, PotentialAutomorphyInfrastructurePartII, CrystallineLocalGlobalCompatibilityCM, OrdinaryAutomorphicFormsAndModularityLiftingPartII (the lists on main and by results are empty); nothing shared.

### Shape, headlines and policy

Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, eight layers each ending in Examples and Dependencies, Downstream consumers, References. Three definitions (3.3, 5.1, 5.2) with 3, 4, 4 API bullets and 4, 4, 3 Checks; 24 theorems and one example target, each theorem with hypotheses and a locator; `plan.json` parses, with 28 targets and 92 tests, and agrees with the README on the sampled targets. Headlines: Theorems 2.5, 6.2, 8.1; none is statable at the pins (neither library has automorphic representations of `GL₂(𝔸_K)`, their Galois representations or potentially semistable local representations), and the *Lean* paragraph says so for each. The README attributes no backticked Lean name to this roadmap. No LaTeX delimiters, pull-request numbers, machine paths, target tables, `set_option`, algorithms or process words. The layers are named by their mathematics; the order of Layers 3 → 8 is forced by the *Needs* lines (4.1 needs 3.2 and 3.5; 5.4 needs 4.2 and 4.3; 6.2 needs 5.4; 7.5 needs 6.2; 8.1 needs 7.5), and Layers 1–2 are independent of 3–7.

### Copyright and arrangement

Wording: 22 passages were put beside their sources at the locators (the fifteen sampled targets, §§1.1, 1.2, 3.4, 3.5, 4.2, 5.1 and the supplier obligations), and the whole README was scanned for common letter runs of 26 or more against seven texts. Outside bibliographic titles the longest runs are a hypothesis on Taylor–Wiles places (nine words, CN23 line 4359), clause (4) of the lifting theorem (CN23 line 3857), the first clause of the headline (eight words, OpenAI26 line 20) and the one-clause reason for Corollary 1.5 (at most five consecutive words, MilneCM line 294): statements of about a dozen words that can be written one way. Arrangement: CaptainSude26 has Sections 2–6. The roadmap puts the assembly of its Section 6 first (Layer 2, with LeHung26), splits its Section 3 across Layers 3 and 4, moves the presentation out of the proof of its Theorem 4.2 into Layer 4, states a preparation and a general lifting theorem (Layer 6) that the manuscript has only inside the proof of its Proposition 5.2, and adds Layer 1; there is no one-to-one run, and the order of Layers 3–8 is forced by the *Needs* lines above. Reuse: no table, figure or data taken over (the three-row lifting table is the parent's §8.3, cited).

Source independence: 22 passages compared with 5 sources (and a letter-run scan against 7), none shared beyond statements of a dozen words; largest share CaptainSude26, 23 of 55 source citations in the layers; contents compared with CaptainSude26: independent.

## Not verifiable

- Lean elaboration, the one-tactic probe and the `#check` comparison: not available in this lane, and a design has no Lean file.
- The global patching argument of CaptainSude26 (lines 315–408, 445–498) beyond its hypotheses, counts and local computations: no refereed source states it, and it was not re-proved here.
- The geometric inputs of the parent (cover family, monodromy, local opens), on which LeHung26 Theorem 1.1 is conditional (line 86): read as supplier statements only.
- OpenAI26 pp. 26–28 (cited by §§2.2–2.4, outside this round's sample) was not reopened; round 10 read it.

## Source issues

- **Error** in CaptainSude26 at Notation, printed p. 2 (lines 63–66): the source says its condition, ratio outside `{1, q, q⁻¹}`, agrees with CN Definition 2.1.27; it should say it is stronger, since that definition excludes only the ratio `q`; affects nothing.
- **Error** in CN23 at Lemma 5.6.5, printed pp. 85–86 (lines 4435–4450): the source says the determinant kernel is reducible in all cases; it should except determinant order three with projective image `A₄`, where the kernel has projective image `(ℤ/2)²` and is irreducible; affects a stated result.
- **Misprint** in CN23 at the proof of Theorem 5.2, printed p. 86 (line 4460): the source says the set contains the `q`-adic places of `K`; it should say of `F`; affects nothing.
- **Misprint** in CaptainSude26 at Lemma 5.1, printed p. 11 (line 528): the source writes the unit series as `h(s)`, the letter of the cubic `y² = h(x)` (line 71); it should use another letter; affects nothing.

## For the human reviewers

- **Scope.** Theorems 6.2 and 8.1 rest on CaptainSude26 (pseudonymous, unrefereed) and Theorem 2.5 on LeHung26 (discussion draft, conditional on the parent's geometric inputs, line 86); the parent rests on OpenAI26. No refereed source states these theorems.
- **Licence.** CaptainSude26: the repository has no licence file (`sources.toml`, `version_note`). OpenAI26: `licence_class = "author-page"` for a company repository, no licence recorded.
- **Licence.** MilneCM is recorded as `open-repository`; the host is the author's own page.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "102448f8e54ce27b990cd7aa37c96b0177f64f35", "job": "REV-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~11", "model": "fable", "worker": "chris-x82"} -->
