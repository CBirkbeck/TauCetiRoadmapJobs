# Review of AlgebraicModuliForArithmeticGeometryPartII (pull request #3027 at 8d0b573)

**Verdict:** needs changes

**Summary.** The two new sections are mathematically sound: Kodaira's lemma (§1.6a) and asymptotic Riemann–Roch for ample sheaves (§1.7a) are true as stated, their proof routes work over every field, and their Checks compute correctly. One finding blocks acceptance. §1.7a takes a supplier input from DynamicalDegreesOfRationalMaps §2.2, but that roadmap comes later in the merge order and itself consumes this roadmap, so the two roadmaps now supply each other. There are three small corrections (§1.7a is narrower than its source, §1.6a's *Needs:* line is incomplete, and the pull-request text does not describe this folder's change) and one format note. Nothing in this folder is left for a human to decide; one bullet below records a related two-way citation in the parent's folder.

## R01 (P1) — §1.7a takes a supplier input from DynamicalDegreesOfRationalMaps, a later roadmap that consumes this one, so the two roadmaps supply each other

An implementer of §1.7a would have to wait for a roadmap that is built after this one, out of this roadmap's own material. That breaks the rule that supply runs in one direction, whether or not the sections form a loop. The *Needs:* line of §1.7a (line 402), the Layer 1 Dependencies (line 414) and the new contract "From TauCetiRoadmap.DynamicalDegreesOfRationalMaps" (lines 1245–1247) cite its §2.2 "to read the leading coefficient of the Hilbert polynomial as the intersection number of §1.7". On main, and unchanged by this pull request, `TauCetiRoadmap/DynamicalDegreesOfRationalMaps/README.md` has a contract "From TauCetiRoadmap.AlgebraicModuliForArithmeticGeometryPartII" (line 777). Its §§2.1, 2.3, 3.1 and 3.2 consume §§0.1, 1.1, 1.5 and 1.7 here (*Needs:* at lines 159, 193, 245 and 264), and its Conventions use §1.6. The merge order places it after this roadmap. The comparison its §2.2 provides goes back to §0.1 here through its §2.1 (`r = 1`), so the edge points back into this roadmap. The automatic dependency check does not report the edge, because both roadmaps are on main.

The comparison can be dropped from the route. STACKS 0BJ8 (Varieties line 4868) states the leading coefficient as the Euler-characteristic intersection number `deg_A(V)/n!`. That number is the numerical intersection of CyclotomicClassGroupsAndStickelberger §4.3, which §1.7a already cites, and that section also proves positivity for ample sheaves. The smallest repair would state §1.7a as `h⁰(V, A^{⊗m}) = ((A^n)_V/n!)·m^n + O(m^{n−1})`, with `(A^n)_V` the numerical intersection of CyclotomicClassGroupsAndStickelberger §4.3. It would take positivity from that section in place of §1.7 (i), and delete the citation of DynamicalDegreesOfRationalMaps from line 402, from line 414 and from the supplier contracts. The identification of `(A^n)_V` with the `c₁`-degree `(A^n·V)` of §1.7 can then be mentioned as a fact proved by a consumer, in prose and outside any *Needs:* line.

## C01 — §1.7a is stated only for integral projective V, although its source proves it for every proper k-scheme of dimension n with an ample sheaf

STACKS 0BJ8 (Varieties line 4868) assumes only that X is proper over k of dimension d and that L is ample. Nothing in the route of §1.7a uses integrality, since Serre vanishing and the Euler polynomial work on any projective scheme. Example: for the reducible conic `V = V(xy) ⊂ P²` and `A = O(1)`, `h⁰(A^{⊗m}) = 2m + 1`. Its numerical intersection is `(A·V) = 2`, so the formula gives a leading term of `2m`, as it should. The pull-request description says each added section is "stated in the generality of its source", which is not true of §1.7a as written. With the repair of R01, the statement could read "a projective k-scheme V of dimension n ≥ 1", keeping the integral case, which the consumers use, as a Check.

## C02 — the *Needs:* line of §1.6a omits Serre's theorem, which its route uses twice

The route at line 331 uses two facts that come from Serre's theorem. First, `(A^{⊗k} ⊗ L⁻¹)|_H` has a section avoiding the associated points of H once k is large. Second, `h⁰(H, A^{⊗km}|_H)` equals the Hilbert polynomial for large m. The *Needs:* line at line 333 lists only §1.6, AlgebraicModuliForArithmeticGeometry §1.5 and Tau Ceti ampleness. Adding SchemeAndStackFoundations §2.6 (`ample_serre_vanishing`) would fix this; Layer 1's Dependencies already list it.

## C03 — the pull-request description does not say what changes in this roadmap

A reader of the description learns only that this roadmap now cites DynamicalDegreesOfRationalMaps §2.2. Two other facts are missing. This roadmap, which is on main, gains §1.6a (Kodaira's lemma) and §1.7a (asymptotic Riemann–Roch for ample sheaves), with no section removed or renumbered and no `Suggested.lean` change. It also gains CyclotomicClassGroupsAndStickelberger §4.3 as a supplier. One sentence under "For reviewers" would cover this. For example: "AlgebraicModuliForArithmeticGeometryPartII gains §§1.6a and 1.7a, citing CyclotomicClassGroupsAndStickelberger §4.3; nothing is removed." If R01 is repaired, the DynamicalDegreesOfRationalMaps clause of that paragraph should also go.

## N01 — the STACKS citation of §1.7a (line 393) gives no extraction line, unlike the README's other STACKS citations

Varieties line 4868 would match the convention stated under References.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §0.5 closed-point testing | `P¹_{ℤ_p}`, `O(m)`; `Bl_x(P¹_R)`, `O(E)` | Special fibre degree m, so `≡_f 0` iff m=0; `O(E)`: exceptional degree −1, generic degree 0 | holds; generic fibre alone fails, as Check says | none |
| §1.6 bigness | `O(1)` on Pⁿ; `O(1,0)` on P¹×P¹; `O_V` | `binom(m+n,n) ≥ mⁿ/n!`, `(O(1)ⁿ)=1`; `h⁰=m+1`, square 0; `h⁰=1`, big iff n=0 | agrees with nef-big criterion | none |
| §1.6a Kodaira's lemma | `Bl_p P²`, `L=O(h)`, ν=2, C=e; P¹×P¹, `O(1,0)` | `(2h−e)·e=1`, `(2h−e)·(h−e)=1`, `(2h−e)²=3`: ample; `O(ν−a,−b)` has fibre degree −b≤0 | holds; non-big control fails | none |
| §1.6a route over 𝔽_q | section of `(A^k⊗L⁻¹)\|_H` avoiding associated points | choose closed points in their closures; joint evaluation surjective for large k; preimage of (1,…,1) | valid over finite fields | none |
| §1.7a asymptotic RR | P², `O(1)`; P¹×P¹, `O(1,1)`; `V(xy)⊂P²`, `O(1)` | `(m+1)(m+2)/2` vs 1/2!; `(m+1)²` vs 2/2!=1; `2m+1` vs 2/1! | holds; integrality unused | C01 |
| §1.7a supplier | DynamicalDegreesOfRationalMaps §2.2 | it consumes §§0.1, 1.1, 1.5–1.7 here; contract at its line 777; later in merge order | two-way supply | R01 |
| `isAmple_iff_exists_isNef_pow_mul_inv_pow`, §1.7(iii) | P¹, `a=O(d)`, `h=O(1)`; X=Spec k | md−n≥0 for some m,n>0 iff d>0; d=0 gives −n≥0, false; Spec k: both true | agrees | none |
| `isAmple_mul_of_mem_numericallyTrivialClasses` | elliptic E, `a=O(p)`, `b=O(q−r)` | product has degree 1+0=1>0, ample | agrees | none |
| `exists_isAmple_realCombination_iff_exists_pos_nef_sub`, §1.7(v) | P¹×P¹, D=√2F₁+F₂; P¹, class 0 | (√2−1)(2,1)+(2−√2)(1,1)=(√2,1); nef minus εH iff ε≤1; class 0: both sides false | agrees | none |
| `isRelAmple_iff_exists_isRelNef_pow_mul_inv_pow`, §1.7(iv) | pr₁: P¹×P¹→P¹, H=O(0,1); f=id over affine S | O(ma,mb−n) f-nef iff mb≥n, exists iff b>0 = f-ample; identity: both true | agrees | none |
| `numericalClassGroup_free_finite`, §1.2 | P⁰, P¹, E×E | ranks 0, 1, 2+rank End(E) ∈ {3,4,6} | free of finite rank | none |
| `relNumericalClassGroup_free_finite`, §1.3 | pr₁ P¹×P¹→P¹; S=Spec ∏k | Num≅ℤ by fibre degree b; non-Noetherian: bounded sequences, not finitely generated | Noetherian hypothesis needed | none |
| `picardFppfSheaf_representable`, §2.1 | P¹_k; Spec k[ε]; nodal cubic | ∐_{d∈ℤ} Spec k; trivial group scheme; Pic⁰=G_m, tangent dimension 1 | agrees with KLE05 4.18.3, 4.17, 5.3 | none |
| §2.5 Pic^τ | P¹; elliptic E; Enriques, char ≠ 2 | Pic^τ=0; Pic^τ=E, dim 1; Pic⁰=0, Pic^τ=ℤ/2 generated by ω | agrees (KLE05 Rem. 6.14 for proper X) | none |
| `constantNumericalClasses_iff_positivePowerDescent`, §2.10 | P¹_ℂ over ℝ; pointless real conic | swap: image diagonal, (d,0) not diagonal, both false; conic: trivial action, d=2 works, both true | agrees; d≥1 needed | none |
| `numericallyTrivial_torsion_of_algebraic_finiteField`, §2.12 | y²+y=x³ over 𝔽₂; E over ℚ̄ | 3 rational points, degree-zero group order 3; ℚ̄ has infinite-order points | holds; hypothesis needed | none |
| `IsContraction`, §3.1 | 𝔸¹→Spec k[t²,t³]; P¹_ℂ→Spec ℝ; pr₁ | f_*O=k[t]≠k[t²,t³]; H⁰=ℂ≠ℝ; O=pr_*O | two fail, one passes | none |
| §3.5 spreading out | identity contraction; general f̄ | k′=k; EGA IV 8.8.2 gives finite k′ for finitely presented data | agrees | none |
| `contraction_descends_purelyInseparable`, §3.6 | K=k; P¹_ℂ⊔P¹_ℂ over ℝ (separable) | identity squares, f=f′; collapsing one component does not descend | inseparability needed | none |
| `contraction_descends_of_constantNumericalClasses`, §3.7 | P¹_ℂ over ℝ; split P¹×P¹ | Num not constant, one-component contraction fails; projections descend | hypothesis needed | none |
| §3.8 openness of ampleness | O on P¹×Y; family of smooth curves | fibre not ample, no neighbourhood; fibrewise ample gives relatively ample | agrees with 0D3A, 0D3D | none |
| §4.4 trichotomy | S→Spec k; Bl_p P²→P²; P¹×P¹→P¹ | dim Z = 0, 2, 1: types (a), (b), (c) | exhaustive | none |
| §4.5 negative definiteness | A₂ resolution; Bl of nonreal point of P²_ℝ | [[−2,1],[1,−2]] det 3, trace −4; E²=0−2=−2 | negative definite | none |
| `constantNumericalClasses_iff_componentGraphDescent`, §4.2 | P¹_ℂ/ℝ; X=∅; two k-lines meeting | 2 vertices over 1, both false; 0 vertices, both true; identity, ℤ² trivial action | agrees | none |
| `fibreComponentGraph_descends_of_constantNumericalClasses`, §4.8 | conic bundle with fibre x²+y²=0 over ℝ; blow-up of k-point on fibre | 2 vertices over 1, Num not constant; [[−1,1],[1,−1]], 2 vertices and 1 edge on both sides | hypothesis needed; holds | none |
| `residueField_eq_of_reducible_geometricFibre`, §4.9 | reducible fibre over a rational point; smooth fibre over a degree-2 point | κ(a)=k; irreducible, so outside the hypothesis | agrees | none |
| `lineBundle_lifts_completeDVR_of_h2_zero`, §5.3 | P¹_R; non-flat Fermat-quartic thickening, char 3 | O(d) lifts for all d; image 3ℤ, O(1) does not lift | flatness needed | none |
| `isAmple_iff_isAmple_specialFibre`, §5.4 | Bl_x(P¹_R), π*O(1); P¹_R | degree 0 on E: not ample on X_k nor X; O(1) ample on both, O on neither | agrees | none |
| §5.7 vertical descent | Bl_p S→S, L=O(−E) | (−E)·E=1, f-nef, generic trivial; pullbacks have degree 0 on E | hypothesis (4) needed | none |

- Previous review (of the first submission): no open findings; its two SCH23 misprints are repeated under Source issues.
- 34 source locators checked against the text:
  - BMP23 lines 819, 825 and 1230;
  - STACKS 00PH, 0D3A, 0D3D, 0BDG and 0BJ8;
  - WIT22 lines 319, 330 and 1813;
  - KEE99 lines 46 and 373;
  - KLE05 lines 1578, 1630, 1782, 2701 and 2742;
  - SCH23 lines 167, 191, 239, 260, 262, 276, 289, 343 and 349;
  - EGA-IV3 line 986, LIP69 line 1167, AHK07 line 135, HW23 lines 1406 and 1513, CT20 lines 630–702, and EV92 5.4 d) (printed p. 44).
- 7 cross-roadmap citations resolved on main:
  - CyclotomicClassGroupsAndStickelberger §4.3;
  - DynamicalDegreesOfRationalMaps §2.2 (unchanged by this pull request);
  - SchemeAndStackFoundations §2.6 `ample_serre_vanishing`, §4.15 `spaceNakaiMoishezon` and §5.10 `Num.free_finiteRank` (its README line 8658);
  - AlgebraicModuliForArithmeticGeometry §1.5 `hilbertPolynomial` and §1.6 `bigLineBundle`.
- Dependency check output: `depcheck: 132 roadmaps, 1471 edges, 0 problem(s)`, with no UPWARD or CYCLE line. It misses the two-way edge of R01, because both roadmaps are on main.
- Elaboration: `lake env lean` on `Suggested.lean` (unchanged here, no section variables) exits 0 with 16 `sorry` warnings and nothing else. A one-tactic probe (`rfl`, `simp`, `infer_instance`, `trivial`) on a copy fails on all 16 theorems, and all automatic checks passed.
- Headlines: the four summary theorems, plus Kleiman, Murre–Oort and the DVR targets, are stated in Lean. The docstring names the carriers missing for the rest. §§1.6a and 1.7a are not headlines.
- Overlap check: read AbundanceStatement, SchemeAndStackFoundations (main and its two open revisions), StableReduction, K3SurfacesAndSymplecticBoundedness, DynamicalDegreesOfRationalMaps and MultiplierIdealsOfPairsAndPointSeparation. No open pull request owns Kodaira's lemma or asymptotic Riemann–Roch. Owners of shared objects:
  - N¹, NE, nef cone and Kleiman, also planned in AbundanceStatement Layers 4B–4D: this roadmap, which is on main;
  - surface Num and Nakai–Moishezon over k̄: SchemeAndStackFoundations §§5.10 and 4.15;
  - relative ampleness and fibrewise openness: StableReduction Layer 2;
  - numerical intersections and their `c₁` comparison: CyclotomicClassGroupsAndStickelberger §4.3 and DynamicalDegreesOfRationalMaps §2.2;
  - Kodaira's lemma and asymptotic Riemann–Roch: this roadmap, with MultiplierIdealsOfPairsAndPointSeparation 9.10d citing §§1.6a and 1.7a as a corollary;
  - K3SurfacesAndSymplecticBoundedness is a consumer only.

Source independence: 39 passages compared with 12 sources: the 34 locators, the routes of §§1.6a, 3.6, 4.2 and 5.7, and the docstring of `constantNumericalClasses_iff_positivePowerDescent`. The longest shared runs are short mathematical statements, such as §1.6a's WIT22 parenthesis (WIT22 lines 330–332). Largest share: SCH23, 62 of 214 source-id mentions. Contents compared with SCH23 §§1–15: independent. SCH23 §§1–2 feed parts of Layers 2–4, Layers 0, 1 and 5 have no counterpart, and the order 2 → 3 → 4 is forced by the *Needs:* of §§3.7, 4.2 and 4.7.

Research link: Layers 2–4 are the numerical local system and the contraction and fibre-graph descent that Schröer (SCH23, Annals 2023) uses to show that there is no Enriques surface over ℤ. Layers 1 and 5 supply the cone, bigness and DVR comparisons of mixed-characteristic MMP (BMP23, HW23, WIT22). This rests on the README and on SCH23 §1 and HW23 §6.

## Not verifiable

- LAZ04, KLE66 and HAR77 are settled as uncertified and are cited by locator only, at §§0.7, 1.7 and 3.3; their texts were not read.

## Source issues

- **Misprint** in SCH23 at Lemma 1.1, p. 5 (SCH23 line 191): the source allows the integer d to be 0; it should be d ≥ 1, since d = 0 makes the condition hold for every X; affects nothing.
- **Misprint** in SCH23 at the proof of Theorem 1.3, p. 7 (SCH23 line 293): the source names the continuous map of the given contraction f; it should be f′, matching the pair (f′, ϕ′); affects nothing.
- **Misprint** in SCH23 at the proof of Theorem 1.3, purely inseparable case, p. 7 (SCH23 line 300): the source takes the preimage of V before V is defined; it should be the preimage of the affine open V′; affects nothing.
- **Misprint** in AHK07 at the proof of Lemma 1.6(1), p. 4 (AHK07 line 147): the source cuts X by dim X − e + 2 further hyperplanes; it should be dim X − e − 2, to reach a surface; affects nothing.
- **Misprint** in CT20 at Lemma 2.17, p. 17 (CT20 line 640): the source puts the descended divisor M on a scheme Y absent from the statement; it should be on the base S; affects nothing.

## For the human reviewers

- In this pull request the parent AlgebraicModuliForArithmeticGeometry now cites §§0.7, 1.5–1.7a and 3.3 here (its README lines 10313, 10372, 10569–10571 and 10710), while this roadmap consumes its §§1.4–1.6, 2.1 and 7.3. The two Parts now supply each other. That edge is in the parent's folder and is not raised here.
