# Review of ClassicalSerreModularity (pull request #1020 at 4a4f50e)

**Verdict:** needs changes

**Summary.** Changes are needed, for three findings. The Skinner–Wiles target of I.1 attributes to the source a theorem `R^{ps}` modulo nilradical `≅` Hecke algebra that the source does not state and that fails at reducible points; the twist-two vanishing of R33.1 has no source that proves it and a `*Needs:*` line that cannot prove it; and the same vanishing is also a target of the open roadmap AnabelianGeometryAndNonabelianChabauty. There are nine small corrections and two format notes, none blocking. Three points are left for the human reviewers (an unpublished source for one branch, an interface said to follow the FLT project, the hosts of four source copies).

## R01 (P2) — The pseudo-deformation target states, as Skinner–Wiles' Main Theorem, an identification of `R^{ps}_𝒟` modulo its nilradical with the Hecke algebra that the source does not prove and that fails at reducible points

An implementer of `I.1/pseudo-deformation-rings-and-pro-modularity` (README line 322) is asked to prove that "every prime of `R^{ps}_𝒟` is pro-modular" and to "conclude the Main Theorem, that `R^{ps}_𝒟` modulo its nilradical is the localized Hecke algebra"; OrdinaryAutomorphicFormsAndModularityLifting (its README, line 543) already cites this target for "the Main Theorem".

The source says something else. Pro-modularity is defined for a prime `q` of the deformation ring `R_𝒟` of the non-split `ρ_c`: the map `R^{ps} → R_𝒟/q` must factor through `R^{ps} → T_𝒟` (`sw99` lines 1995–2000). Proposition 4.1 is about the primes of `R_𝒟` (`sw99` line 2076). The Main Theorem, p. 73, says that a type-`𝒟` deformation `ρ` with the three listed properties is modular once a soluble totally real `L/F` with `(L, 𝒟_L)` good exists (`sw99` lines 2430–2442). The introduction says the deformation rings are not identified with Hecke rings (`sw99` lines 112–116). The source's `R^{ps}` has no datum `𝒟`: a pseudo-datum is `(𝒪, Σ)` and the only condition is unramifiedness outside `Σ` (`sw99` lines 529–535). For that ring the README's statement is false: over `ℚ` the pair of characters `(1, χ̃)`, `χ̃` the Teichmüller lift of `χ`, is a pseudo-deformation of `(1 + χ, χ)`; a point of the Hecke algebra with these finite-order characters is classical of weight two (Proposition 3.7), so it would be a cuspidal form on the definite quaternion algebra with `a_ℓ = 1 + χ̃(ℓ)`, whose Galois representation is reducible, or a one-dimensional form with `a_ℓ = ψ(ℓ)(1 + ℓ)`; neither exists.

Smallest change: define pro-modular primes on the rings `R_𝒟` of the non-split extensions `ρ_c`, state Proposition 4.1 for the primes of `R_𝒟`, and state the Main Theorem as the source does (modularity of a type-`𝒟` deformation after a soluble extension with a good pair). The datum is `(𝒪, Σ, c, ℳ)` (`sw99` line 199), not "the type, the ordinary condition and the determinant".

## R02 (P2) — The twist-two vanishing is cited to a text that does not prove it, and its `*Needs:*` line cannot prove it

`R33.1/twist-two-vanishing` (README lines 614–616) makes Lichtenbaum's theorem and its extension to every finite `S` "part of this target", with source "[Pan], Lemma 7.4.15" and `*Needs:* ArithmeticGaloisDuality §§R02.4.4 and R02.5`. Pan does not prove the vanishing: the proof of Lemma 7.4.15 quotes Proposition 9.6 of Lichtenbaum's paper for `S` the places above `p`, and says only that the general case can be deduced (`pan` lines 5348–5350). Lichtenbaum's paper is not in the References.

Duality and the Euler characteristic do not give it. For `V = ℚ_p(2)` over a totally real `L`, complex conjugation acts by `χ_cyc(c)² = 1`, so `χ(G_{L,S}, V) = Σ_{v|∞} dim H⁰(L_v, V) − [L:ℚ] = r₁ − r₁ = 0`, and `H⁰ = 0`; hence `h¹ = h²` and nothing more. The vanishing of `H¹(G_{L,S}, ℚ_p(2))` is the arithmetic content (finiteness of `K₂(𝒪_L)` through the Chern class to `H²(𝒪_L[1/p], ℤ_p(2))`), and no layer or supplier named here provides it. GL2ModularityLifting, the consumer, itself calls the statement "an arithmetic hypothesis separate from Poitou–Tate".

Smallest change: give the route and its inputs, which exist in earlier roadmaps: finiteness of the even `K`-groups of `𝒪_L` (ArithmeticKTheory §3.4), the étale Chern maps (KTheoryFiniteLocalFields §1.8), and the localisation argument for enlarging `S` (the added residue terms are cohomology of `ℚ_p(1)` at a finite field, where Frobenius minus one is invertible). Add Lichtenbaum's and Soulé's papers to the References with locators.

## R03 (P2) — The twist-two vanishing has a second owner in an open roadmap

AnabelianGeometryAndNonabelianChabauty (open, later in the merge order) proves, in its §7.0, that for odd `p`, every number field `F` and `k ≥ 2` the rational `H²(G_{F,T₀}, ℚ_p(k))` vanishes (its README, line 8443: "After inverting p the degree-one map is an isomorphism and degree two vanishes"), and that inflation to any finite `T ⊇ T₀` is an isomorphism (line 8465). For `k = 2` this is the target here: `cd_p G_{L,S} = 2` gives `H²(G, (E/𝒪)(2)) = H²(G, 𝒪(2)) ⊗ E/𝒪`, which is divisible, so its Pontryagin dual tensored with `E` vanishes exactly when `H²(G, E(2)) = 0`. Two roadmaps would prove one statement, by different stated routes.

This roadmap is the earlier of the two, so it keeps the target. Smallest change: say under "Owned here" that R33.1 owns the twist-two vanishing, and state it at the generality the route of R02 gives (any number field, odd `p`; total reality and `p ≥ 5` are not used), so that the later roadmap can cite it for `k = 2` instead of proving it again.

## C01 — R26.1 restricts to conductor one and then treats a prime where `ρ̄` ramifies

Line 487 says the target is about "a residual representation of conductor one"; item 2 (line 490) then verifies `Δ_ℓ = 0` for "the minimal condition at a prime where `ρ̄` ramifies", which no such representation has. Böckle's list includes that case (`bo` lines 121–127), so the restriction looks unintended. Drop "of conductor one", or drop the ramified case.

## C02 — `I.1/ordinary-exact-level` states neither its hypotheses nor its conclusion, and its source is the level-one crystalline case

The target (lines 341–342) says the specialization "identifies the weight and local conductor of the resulting newform from the given representation". [Kh] Lemma 5.4 is: `p` odd, `ρ` irreducible, unramified outside `p`, crystalline with weights `(k−1, 0)`, `k` even, `2 ≤ k ≤ p+1`, `ρ̄` modular; then `ρ` arises from `S_k(SL₂(ℤ))` (`kh` lines 919–922). It has no semistable case and is not restricted to ordinary `ρ`. State the general statement meant (which `ρ`, and that the newform has weight `k` and level the conductor of `ρ`), and cite Lemma 5.4 for its level-one instance.

## C03 — `I.3/prescribed-lifts` does not say that its level-one case is already a target on main

SmallRamificationAndAbelianVarietyBaseCases §5.0d proves the crystalline lift of weight `k` and, at `k = p+1`, the semistable weight-two lift, for level-one `ρ̄` with `k ≠ p` (its README, lines 1987–1997). The first two bullets of `I.3/prescribed-lifts` contain that statement. One clause there, naming §5.0d as the level-one, `k ≠ p` case, tells an implementer which is proved first.

## C04 — A roadmap on main names layers of this roadmap that this head does not have

SmallRamificationAndAbelianVarietyBaseCases on main names `ClassicalSerreModularity:R26.5`, `R33.2` and `R33.4` as its consumers (its README, lines 13, 2543, 2622–2623 and 2648). This head has only R26.1, R27.1 and R33.1, and neither the README nor the description says where the others went. A sentence giving the old → new places (which layer of SerreModularityByCompatibleSystems each became) lets the citing roadmap be followed.

## C05 — "How to read the build" understates what R27.1 needs

Line 21: "The targets of R27.1 use only ArithmeticGaloisRepresentations Layers 2–4, `AlgebraicModularFormsAndSerreWeights:R15.4`, Input I.3 and Chebotarev Layer 10." The Dickson target of R27.1 also needs `GL2AutomorphicRepresentationsAndTransfer:R17.5`, `R17.6` and SerreWeightAndLevelOptimisation Layer 5 (line 578); the layer's own Dependencies paragraph (line 586) says so. Restrict the sentence to the first three targets.

## C06 — Eight definitions of `Suggested.lean` serve no theorem stated in it

`lemma_8_2` uses `GQ`, `IntBar`, `IsFrobAt`, `IsUnramifiedAt`, `IsProjConj`, `primesOfRat` and `auxiliaryPrimes`. `FpBar`, `IsOdd`, `IsAbsIrreducible`, `IsSType`, `coeff`, `coefficientRing`, `ArisesFrom` and `toRepresentation` (lines 42–96) occur in no statement of the file; they are the carriers of Serre's conjecture, which SerreModularityByCompatibleSystems states and for which it declares the same definitions in its own namespace. Either state here a headline that uses them, or keep them where the theorems that need them are stated (the README keeps their specification and Checks).

## C07 — The module docstring does not account for most headlines

It names as not statable the prescribed lifts, the modularity transfers and the R33.1 globalization (lines 17–21). It is silent on Moret-Bailly's theorem, the soluble base change, controlled potential modularity, the two Skinner–Wiles theorems, the Khare–Wintenberger and Kisin lifting theorems, Böckle's presentation, rank-two irreducibility and the twist-two vanishing. Name each with the carrier it lacks (or state those that are statable; see the question below).

## C08 — Three passages describe material that is not in this roadmap

"Corrections to the sources" says "Every target above uses the corrected statement", but its [Sa] entry (line 642) and the [BM] source note (line 649) concern papers no target cites. Line 722, "The Eisenstein-integer and two-by-two matrix coordinate arithmetic is replaced by the existing ring and matrix operations", refers to nothing here. Line 522 speaks of "the proofs of Theorems 3.1 and 3.2", which are Khare–Wintenberger's, not this roadmap's. Remove the first two and attribute the third.

## C09 — In Moret-Bailly's theorem, `K′ ∩ M = K` is not linear disjointness

Line 280 promises `K′` linearly disjoint from `M` and concludes with "complete splitting at these places forces `K′ ∩ M = K`". For non-Galois fields the second is weaker: `ℚ(∛2)` and `ℚ(ω∛2)` meet in `ℚ` and are not linearly disjoint. The same splitting argument gives `K′ ∩ M̃ = K` for the Galois closure `M̃`, which is what yields disjointness; say that.

## N01 — Directions and names

In "Scope and ownership" and "Exact supplier contracts", which come after the layers, "the proofs below" (line 692) and "any of the theorems below" (line 720) should read "above". Diamond, Fujiwara, Taylor and Washington are cited by name for theorems (lines 57, 322, 337, 356) with no entry in the References. The order-three type is labelled `(q,N) = (3,2)` at line 224 and `(p,q) = (3,2)` at line 445.

## N02 — The docstring of `IsFrobAt` holds for prime `r` only

"`σ x ≡ x ^ r` modulo that prime" (Suggested.lean, line 44): for composite `r` the exponent is the residue characteristic of the prime (`r = 4` gives `σ x ≡ x²`). Say "for prime `r`".

## Questions for the author

- Is the residually reducible Skinner–Wiles theorem over `ℚ` statable at the pins? Its statement uses `G_ℚ`, inertia at `p`, the `p`-adic cyclotomic character (`TauCeti.localCyclotomicCharacter` is at the pin) and attachment to a newform as in `ArisesFrom`; only `ρ̄^ss = 1 ⊕ χ` needs a lattice. I did not write and elaborate a statement, so I do not claim it.
- `I.2/same-weight-crystalline-lifting` gives the range `2 ≤ h ≤ 2p−1` and the hypothesis `End_{𝔽[G_{ℚ_p}]}(ρ̄) = 𝔽` from [Ki], Proposition (3.13) and Theorem (3.14). The author's file is a DVI the sources service cannot read: are these the hypotheses of (3.14) as printed?
- Line 337 says the printed proof of [SW01] Lemma 2.2 "assumes the inducing field real". The text before the lemma bounds a `ℤ_p`-rank by `d/2` citing Waldschmidt, with no such assumption stated (`sw01` lines 241–246). Which step is being corrected, and what is the source of the corrected argument?

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| Moret-Bailly's theorem (I.0) | `mb` lines 43–49, 54, 82–88; `𝔸¹`, `S = {∞, 2}` | Déf. 1.2 p. 181, Th. 1.3 and Rem. 1.5 p. 182; `2/3 ∈ (0,1)`, `v₂ = 1`; `1/2`: `v₂ = −1` | locators and field form agree; C09 |
| Controlled residual potential modularity | `kw2` lines 2463–2487, 2488–2639; `kwann` line 216 | Thm 6.1 pp. 53–54, proof to p. 57; (i)–(iii)(a–d) match; Annals Thm 2.1 p. 234 excludes `k = p` | agrees |
| Soluble base change (I.0) | `K = ℚ`, `E₂` unramified quadratic, `S′ = {11}`; degree 8 | `5 ≡ 5 (8)`: 2 inert; `5 ≡ 4² (11)`: split; `16 = x⁸` mod 3, 5, 7, 17, not in `ℚ₂` | Checks true |
| Residually reducible ordinary lifting | `sw99` lines 93–98, 2468–2479 | Intro theorem p. 6: `ρ̄^ss = 1 ⊕ χ`, `χ|D_p ≠ 1`, `ρ|I_p = (∗,∗;0,1)`, `det = ψε^{k−1}`; Thm A p. 74 | agrees; R01 on its supplier target |
| Residually irreducible ordinary lifting | `sw01` lines 73–85, 245–246, 667–672, 708–715 | pp. 186–187, Lemma 2.2 p. 191, Thms 5.1–5.2 pp. 203–204; `kw1` lines 688–689 name the correction | locators agree; question 3 |
| Ordinary exact level | `kh` lines 919–922 | Lemma 5.4 p. 22: level one, crystalline, `k` even `≤ p+1`; README: no hypotheses | C02 |
| Hilbert integral comparison | `kwann` lines 544–591 | Prop. 3.8 pp. 241–242: Fujiwara 0.2 ordinary, Taylor 3.2 supersingular with `p` split, weight `p` excluded | agrees |
| Global finiteness, full range | `kw2` lines 4125–4205, 3464–3496, 2140–2149; `x³−2` over `𝔽₅` | Thm 10.1 p. 90; (A), (B), (C) of §8.3.3; Cor. 4.7 p. 45; `S₃` image, unramified at 5, weight `p = 5` | agrees |
| Crystalline lifting, matching-weight seed | `kw2` lines 4208–4215 | §10.2 p. 92: weight `p+1` non-ordinary case, residual weight 2 by Berger–Li–Zhu, Hasse invariant | [Ki] not read |
| Potentially Barsotti–Tate lifting and (H) | `kiff` lines 3964–3983, 4068–4099; `kw1` lines 782–787 | (3.5.5) p. 1170 with the `PGL₂(𝔽₅)` clause; (3.5.8) pp. 1172–1173 over `ℚ(√p*)`; (H) p. 18 | agrees |
| The four prescribed lifts | `kw1` lines 366–417, 423–429; `(p,q) = (2,5), (2,7)` | Thm 5.1 pp. 9–10; `i = 2` even, `0 < i ≤ 3`; `v₂(8) = 3`, `v₂(6) = 1` excluded | agrees; C03 |
| Residual links and modularity transfer | `dp` lines 308–313; `kw1` lines 776–778 | Remark 4 p. 7: one modular member gives all; linked systems used with Thm 4.1 | agrees |
| Böckle's presentation | `bo` lines 9–11, 37–46, 77–84, 121–136, 140–156; `ℚ[[X,Y]]/(X,Y)²` | Thm 1 p. 1, Prop. 1 p. 2, Lemma 1 pp. 3–4, Cor. 1 p. 4, Lemma 2 p. 5; `dim A = n+1` forces `m = n` | agrees; C01 |
| Good-dihedral definition and Lemma 6.3 | `kw1` lines 174–184, 472–506; `q = 41, t = 7`; `q = 241, p = 7` | `7 ∣ 42`, `7 > 5`, `41 ≡ 1 (8)`; `241 ≡ 1` mod 8, 3, 5 and `≡ 3 (7)` | agrees |
| Rank-two irreducibility | `blggt` lines 3787–3792; `ψ₁ ⊞ ψ₂` | Thm 5.5.2 p. 81: density-one set, extreme regularity; isobaric sum not cuspidal, representation `χ₁ ⊕ χ₂` | agrees |
| Globalization and unitary tower | `tua` lines 434–449; `tub` lines 979–1000 | §3 p. 9: CM field, `T = S_p ∪ {v₁}`; Def. 4.3.2 p. 20, Lemma 4.3.3 p. 21: even degree, seed | agrees |
| Twist-two vanishing | `pan` lines 5332–5351; Euler characteristic of `ℚ_p(2)` | `r₁ − [L:ℚ] = 0`, so `h¹ = h²`; Pan quotes Lichtenbaum 9.6 for `S = S_p` only | R02, R03 |
| Pseudo-deformation rings and pro-modularity | `sw99` lines 529–535, 1995–2000, 2076, 2430–2442; point `(1, χ̃)` over `ℚ` | source: primes of `R_𝒟`; README: primes of `R^{ps}`; `a_ℓ = 1 + χ̃(ℓ)` is no weight-two eigensystem on `D` | R01 |
| `lemma_8_2` (headline, Lean) | `kw1` lines 739–766; `p = 5`, `q = 409`; `p = 13`, `406561`; trivial `ρ`; `diag(1, χ_{ℚ(i)})` | `409 ≡ 1, 1, 4` mod 8, 3, 5; `406561` prime, `≡ 1` mod 8, 3, 5, 7, 11, `≡ 12 (13)`; `M ∩ C` of degree `≤ 2`, real | true; not closed by `rfl`, `simp`, `infer_instance`, `trivial` |
| `ArisesFrom` and its Checks | level 11 at `p = 3, 7`; `Δ` at 691; level 23 at 11 | `−2 ≡ 1 (3)`, det 2; `2⁻¹ = 4 (7)`; `1 + 2¹¹ ≡ 667 ≡ −24`, `2¹¹ ≡ 666`; roots 3, 7 of `x²+x−1` | Checks true |
| Nearly ordinary Hecke algebras | `sw99` lines 1091, 1110, 1157, 1178; `U_p = 4, 3` on `ℤ₃` | Prop. 3.3 p. 35, Cor. 3.4 p. 36, Prop. 3.7 p. 37, Lemma 3.8 p. 38; `4^{n!} mod 9 = 4, 7, 1, 1`; `τ(11) ≡ 1 (11)` | agrees |
| Almost strictly compatible systems (§2.3) | `dp` lines 273–301; `kw1` lines 316–326 | exceptions only for reducible `ρ̄_λ`, `ℓ = 2` or ramified parameter; README adds de Rhamness there and says so | agrees |

- Source locators checked against the text: 46, in 15 sources (`mb`, `kw1`, `kw2`, `kwann`, `kh`, `sw99`, `sw01`, `bo`, `kiff`, `tua`, `tub`, `pan`, `dp`, `blggt`, `ri`); all pages agree with the printed or preprint numbering the README names.
- Library declarations opened at the pin: `AlgHom.IsArithFrobAt` and `IsArithFrobAt` (`Mathlib/RingTheory/Frobenius.lean` 55, 184), `NumberField.Set.HasDirichletDensity` (`Mathlib/NumberTheory/NumberField/DirichletDensity.lean` 81), `NumberField.ComplexEmbedding.IsConj` (`…/InfinitePlace/Embeddings.lean` 259), `Group.IsSolvable` (`Mathlib/GroupTheory/Solvable.lean` 145), `Nat.maxPrimeFac` and four lemmas (`Mathlib/Data/Nat/MaxPrimeFac.lean` 40–109), `Field.absoluteGaloisGroup` (`Mathlib/FieldTheory/AbsoluteGaloisGroup.lean` 42), `HeckeRing.GL2.Newform`, `dirichletLift`, `qExpansion_coeff_one` (`TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean` 104, 134, 164), the three Chebotarev declarations (`TauCeti/NumberTheory/Chebotarev/FrobeniusPrimeSet.lean` 93, `…/Density/Chebotarev.lean` 51, 74), `TauCeti.localCyclotomicCharacter` (`…/Cyclotomic/Character.lean` 33, 41), `AbelianVariety` (`TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean` 95). No pinned declaration states any of the sixteen; the library's `Algebra.IsUnramifiedAt` is a different notion.
- Cross-roadmap citations resolved: the section ids of twenty suppliers on main or at the open head of AutomorphicGaloisRepresentations; opened for content: AlgebraicModularFormsAndSerreWeights line 17 (R15.1–R15.6 are its Layers 1–7, so R15.3 and R15.4 resolve), §§3.1, 5.10, 7.5; GlobalGaloisDeformations §§3.7, 6.7, 6.8 (`HeckeGaloisDatum`, `classifying_surjective`, `ofPoints`, `mem_of_points`), Layer G7; SmallRamificationAndAbelianVarietyBaseCases §§5.0b, 5.0d, 5.0e; AutomorphicGaloisRepresentations §§3.13, 6.9, 7.1, 7.3; ArithmeticKTheory §3.4; KTheoryFiniteLocalFields §1.8.
- Automatic checks: all passed at this head. Dependency check: `depcheck: 210 roadmaps, 2278 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing in the pull request lies outside the folder.
- Elaboration: `Suggested.lean` gives one `sorry` warning (line 123) and nothing else. The elaborated types of the sixteen declarations were compared with the README; none lost a binder. `lemma_8_2` keeps `p ≡ 1 (4)`, open kernel, non-solvable image and `det ρ(c) = −1`, and drops absolute irreducibility, which non-solvability implies.
- Earlier review (at e8c5264): it recorded no open finding, so there is nothing to check as repaired; the text has since been cut to the lifting inputs, and every passage was read again.
- Pull-request text: title and prose agree with the head (a new roadmap; one theorem and fifteen definitions in Lean; suppliers as listed); the only omission is C04.
- Wording: 22 passages set beside their sources; longest shared run about 14 words, the hypothesis of the dyadic exception in the definition of a minimal lift (`kw1` line 340), which admits one wording.

Overlap check: read SerreModularityByCompatibleSystems, GL2ModularityLifting, PotentialModularityAndCompatibleSystems, OrdinaryAutomorphicFormsAndModularityLifting, AlgebraicModularFormsAndSerreWeights, SerreWeightAndLevelOptimisation, LocalGaloisDeformationRings; each cites Layer I, R27.1 or R33.1 here as owner, and SerreModularityByCompatibleSystems repeats the arithmetic interfaces in its own namespace, citing this roadmap. Shared objects: the twist-two vanishing, also proved by AnabelianGeometryAndNonabelianChabauty §7.0 (owner: this roadmap, R03); level-one minimal lifts, owned by SmallRamificationAndAbelianVarietyBaseCases §5.0d on main (C03).

Source independence: 22 passages compared with 15 sources, none shared; largest share `kw2`, 18 of about 95 citations; contents compared with `kw2` (its eleven sections against I.0–I.3, R26.1, R27.1, R33.1): independent, only I.0 ↔ §6 and part of I.2 ↔ §§9–10 correspond, in a different order; [Ki] could not be read.

Research link: Layer I holds the theorems of Moret-Bailly (1989), Skinner–Wiles (1999, 2001), Kisin (2009) and Khare–Wintenberger (2009) from which Khare–Wintenberger and Dieulefait–Pacetti (2022) prove Serre's conjecture; R33.1 serves Tung (2018, 2019) and Pan (2022). Rests on the README's summary and the sources read.

## Not verifiable

- [Ki], Proposition (3.13) and Theorem (3.14): the author's file is a DVI; no other legal copy found through the sources service.
- [Ki2]: behind a paywall; cited by locator only, as the README says.
- Skinner's correction to [SW01] for the imaginary-quadratic dihedral case: unpublished, not in the References.
- Lichtenbaum's Proposition 9.6: not in the References; not fetched.
- [Sa], Theorem 6.12(4) and Remark 1.7 of v3: the correction was not compared with the text (no target cites it).
- Diamond's, Fujiwara's and Taylor's theorems cited by name inside routes: not opened.
- The description's sentence on which AI tools assisted.

Automatic checks set aside as false positives: none; every check passed. The two citations a resolver could not find (AlgebraicModularFormsAndSerreWeights R15.3 and R15.4) resolve through that roadmap's identifier sentence at its line 17.

## Source issues

- **Misprint** in ri at proof of Proposition 2.2, printed p. 280: the source says the cyclic inertia image lies in the centre of the dihedral group and takes the quadratic field of that centre; it should be the cyclic subgroup of index two; affects nothing.
- **Gap** in pan at proof of Lemma 7.4.15, printed p. 120: the source says the vanishing of `H²` with twist two for an arbitrary finite set of places follows from the case of the places above `p`, without argument; it should give the localisation step; affects the proof.
- **Gap** in kw2 at Theorem 6.1(iii)(b) and its proof, printed pp. 54 and 57: the statement allows any primes `ℓ_i ≠ p`, the proof treats `ℓ_i ≠ 2, p`; it should cover `ℓ_i = 2` for odd `p` (prime-degree steps avoid the exceptional case); affects a stated result.

## For the human reviewers

- Scope: the imaginary-quadratic dihedral branch of `I.1/residually-irreducible-ordinary-lifting` (README lines 337 and 651) rests on Skinner's unpublished correction to [SW01]; Khare–Wintenberger cite it (`kw1` lines 688–689, 1019); the README gives no reference for it.
- Licence: README lines 43 and 355 say the trace/determinant and classifying-map interfaces follow the Imperial College London FLT project; `Suggested.lean` was not compared with that repository.
- Licence: [KW-Ann] and [KiFF] were read from the Annals' own archive, [Ri] from the publisher's archive, [Bö] from a research group's site, [KW-I] and [KW-II] from an author's page; these hosts are in no configured licence class.
