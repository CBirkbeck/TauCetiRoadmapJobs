# Review of AlgebraicModuliForArithmeticGeometryPartII (pull request #3027 at 477bb48)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 586 changed lines since `aecb53a`. Last round's blocking finding is repaired: §1.7 (i) Nakai–Moishezon and (ii) Kleiman's nonnegativity are now stated in `Suggested.lean` through `numericalIntersection`, the mixed difference of Euler characteristics. That difference is the Stacks intersection number (tags 0BEP, 0BFI), and both theorems are true as stated for proper schemes over any field. Also checked: §§1.6a, 1.7 and 1.7a, Layer 6 with all its new locators, the supplier citations, the record of the README on `main`, and the build. No finding remains. One small correction, about the pull-request description, does not block, and there are no format notes. One question of placement is left for the human reviewers.

## C01 — The description still omits §§1.6a and 1.7a, the new supplier and the two new §1.7 statements

A reader of the description would not know that this revision does more than add Layer 6. Under "Not in this pull request" the description says that this roadmap "receives `PointSeparation.angehrnSiuPointSeparation`, the statement of its new §6.8 over ℂ, with the two definitions it needs". At this head `Suggested.lean` also gains `isAmple_iff_forall_numericalIntersection_pos` and `numericalIntersection_nonneg_of_isNef` (lines 166 and 183), which state README §1.7 (i)–(ii). Those statements were prose on `main`. The two definitions are now the top-level `numericalIntersection` and `PointSeparation.canonicalBundle`. The description also never mentions the new §1.6a (Kodaira's lemma) or §1.7a (asymptotic Riemann–Roch for ample sheaves). Nor does it mention the new supplier CyclotomicClassGroupsAndStickelberger §4.3 (contract at README line 1650). That is the part of last round's C01 still open.

A sentence such as the following would cover all of it: "AlgebraicModuliForArithmeticGeometryPartII receives `PointSeparation.angehrnSiuPointSeparation` (its new §6.8 over ℂ) and the statements of its §1.7 (i)–(ii), `isAmple_iff_forall_numericalIntersection_pos` and `numericalIntersection_nonneg_of_isNef`, with the definitions `numericalIntersection` and `PointSeparation.canonicalBundle`. Its README also gains §1.6a (Kodaira's lemma) and §1.7a (asymptotic Riemann–Roch for ample sheaves) and cites CyclotomicClassGroupsAndStickelberger §4.3 as a new supplier; no section is removed or renumbered."

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `numericalIntersection` (§1.7) | P¹×P¹; P², O(1); P¹, O(−3); r = 0 on Spec K, [K:k] = 2 | `1−2−2+4 = 1`, `1−4+3 = 0`, `1−8+9 = 2`; P²: `1−6+6 = 1`; `−2−1 = −3`; r = 0: `h⁰ = 2` | Stacks 0BEP values; dropping the d! would give `(O(1,1)²) = 1` | none |
| §1.7 (i), `isAmple_iff_forall_numericalIntersection_pos` | X = ∅; X finite; P¹×P¹; Bl_p P², O(h); P¹_ℂ over ℝ | ∅ and finite: both sides true. O(1,0): 0, not ample. O(1,1): 2, curve degrees 1. O(h): h² = 1 but (h·e) = 0. ℝ case: 2 > 0 | holds both ways | none |
| §1.7 (ii), `numericalIntersection_nonneg_of_isNef` | P¹×P¹ nef pairs; O(1,−1); d = 0, V = Spec K | 1 and 0 are ≥ 0; non-nef O(1,−1): `1 − 0 − 3 = −2 < 0`; d = 0: `[K:k] ≥ 1` | holds; nefness needed | none |
| §6.8, `angehrnSiuPointSeparation` | ℙ¹, ℓ = 2; ℙ², ℓ = 2; n = 0; ℓ = 0 | Threshold 2: a ≥ 3, `O(a−2)` separates, a = 2 fails. Threshold 5: a ≥ 6, `O(a−3)`. n = 0: ℓ ≤ 1, K⊗L ≅ O | holds; constant family equals the former `selfIntersection` | none |
| §1.7 new Check | P¹×P¹, `χ(O(a,b)) = (a+1)(b+1)` | χ values 1, 2, 2, 4, 3, 9 give 1, 0, 2; `(m+1)²` has leading coefficient 1, and 2!·1 = 2 | true; tells the two normalisations apart | none |
| §1.6a Kodaira's lemma | Bl_p P², O(h); P¹×P¹, O(1,0) | `(2h−e)·e = 1`, `(2h−e)·(h−e) = 1`, `(2h−e)² = 3`; `O(ν−a,−b)` has fibre degree `−b ≤ 0` | holds; bigness needed | none |
| §1.7a asymptotic Riemann–Roch | Pⁿ, O(1); V(xy), V(x²) ⊂ P²; V(x) | `binom(m+n,n)` with `(O(1)ⁿ) = 1`; `χ(O_V(t)) = 2t+1`, `(A)_V = 2`; reduced line gives m+1 | holds on nonreduced V | none |
| §6.1 discrepancies, klt | 𝔸² with c·(cusp); smooth surface, Δ = 0 | `1−2c, 2−3c, 4−6c`: klt iff c < 5/6; point blow-up discrepancy n−1 = 1 > −1 | holds | none |
| §6.3 Nadel vanishing | ℙ², c·(line), c < 1, O(m) | J = O; `m+3−c > 0` iff m ≥ −2, matching `H²(O(m)) = 0` iff m ≥ −2 | holds | none |
| §6.4 inversion of adjunction | S = V(y), B = c·V(y−x²) | `B|_S = 2c·(0)`; lc iff c ≤ ½ on both sides; ½ < c < 1: (X,B) klt, (S,B|_S) not lc | holds; converse of (b) fails | none |
| §6.6 global generation | ℙ¹, O(a), c₁ = 1; (ℙ¹, −½p), N = ½p + q | a ≥ 2: O(a−2) generated; a = 1: O(−1); `deg M = −2 − ½ + 3/2 = −1`, no section | holds; Δ ≥ 0 needed | none (source issue) |
| §6.7 two-point separation | ℙ¹, O(a); c_e = ½n(n+3) | `2/c₁ ≤ 1`, a ≥ 3 separates; `Σ2^{1/e}e ≤ Σ(e+1) = ½n(n+3)`; n = 1: 2 ≤ 2 | holds | none |
| Sample (untouched) | SCH23 lines 260, 265, 289, 349; KEE99 677; WIT22 1513; CT20 630 | each line opens the cited statement: contraction, Thm 1.3 proof, inseparable case, Thm 2.1, Lemma 2.16, Prop 5.3, Lemma 2.17 | locators hold | none |

- **Earlier findings.**
  - R01 is repaired. The module docstring now says that Nakai–Moishezon and Kleiman's nonnegativity "are stated with `numericalIntersection`", and they are stated at `Suggested.lean` lines 166 and 183.
  - C02 is repaired: "The fifth main theorem is the separation of points by adjoint bundles of Angehrn and Siu" (README line 15).
  - N01 is repaired: "Names set in italics in this layer are proposed names" (line 1156).
  - N02 is repaired: Layer 6 cites KOL97, AS95 and LAZ04-II with line numbers.
  - N03 is repaired: "cited in Layer 6 by its Chapter 9".
  - N04 is repaired: the namespaces are given in full.
  - C01 is not repaired (C01 above).
- **42 locators checked.**
  - KOL97: lines 538, 654–703, 784, 793–845, 1139–1145, 1342, 1349, 1362, 1392, 1555, 1572, 1586–1713, 1588, 1624, 1644, 1715, 1876, 1901, 1933, 1951, 1956, 1968 and 1979.
  - AS95: line 60 (Theorem 0.3) and lines 371–637 (§§7–9).
  - STACKS: 0BEP (Varieties line 4754), 0BEM (4679), 0BJ8 (4868), 0G47 (4969), 0BFI (Chow Homology line 3995) and 02OO (Divisors line 1060).
  - The seven sample lines in the table.
- **Library declarations opened at the pins (Tau Ceti 2fd255d).**
  - `Scheme.Modules.eulerCharBelow` (Cohomology/EulerCharacteristic.lean:105) and `eulerCharBelow_congr` (:150).
  - `LineBundleClass.lift` (LineBundle/Class.lean:63) and `LineBundleClass.IsAmple` (LineBundle/Ample.lean:71; true on the empty and on affine schemes).
  - `FiniteLocallyFreeSheaf.isConstantRank_iff` (VectorBundle/FixedRank.lean:58), `rank_relativeDifferentials_apply` (Modules/Differentials/Rank.lean:74) and `FiniteLocallyFreeSheaf.determinant` (VectorBundle/Determinant/Basic.lean:59).
- **Cross-roadmap citations resolved on main.**
  - CyclotomicClassGroupsAndStickelberger §4.3: the numerical intersection, polynomiality and ample positivity, README lines 725–733.
  - AlgebraicModuliForArithmeticGeometry §§9.4, 9.7 and 9.10, with `algebraicAdjointVanishing`, `algebraicMultiplierIdeal` and `uniformAdjointVeryAmpleness`; its §9.12 at this head.
  - SchemeAndStackFoundations: §2.2 `leray_spectral_sequence`, §2.6 `ample_serre_vanishing`, §3.4 `picardToClassGroup`, §§4.13, 4.17 and 5.2–5.3, and §4.15 `spaceNakaiMoishezon` (line 7193).
  - ResolutionOfSingularitiesCharacteristicZero §§5.1, 5.5 and 5.6.
- **Record kept.** Every layer and item of the README at `aecb53a` keeps its id and its subject. The 13 removed lines are rewrites that extend the same sentences.
- **Automatic checks and dependencies.** The automatic checks all passed. The dependency check gives `depcheck: 132 roadmaps, 1470 edges, 0 problem(s)`, with no UPWARD or CYCLE line. No file outside the pull request's own folders changed.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0, with 19 `sorry` warnings and nothing else. `#check @` of `numericalIntersection`, the two §1.7 theorems, `angehrnSiuPointSeparation` and `canonicalBundle` matches the README, and no section binder is lost. The one-tactic probe (`rfl`, `simp`, `trivial`, `infer_instance` or `positivity`, `aesop`) fails on all three changed theorems.
Overlap check: read MultiplierIdealsOfPairsAndPointSeparation (main and this head; #3036 changes it but not this roadmap), AbundanceStatement (open, new), SchemeAndStackFoundations (main; #2489 and #2531 drop no id cited here), K3SurfacesAndSymplecticBoundedness (open, a consumer) and DynamicalDegreesOfRationalMaps (main); shared objects and their owners: pairs, multiplier ideals of pairs, Nadel vanishing and Angehrn–Siu point separation, owned by this roadmap (MultiplierIdealsOfPairsAndPointSeparation cites §§6.1–6.7 in *Corollary of:* lines, and nothing here cites it); klt varieties with Δ = 0, owned by this roadmap's §6.1, of which AbundanceStatement Layer 3 (open) is the Δ = 0 case, for that roadmap to cite; the numerical intersection, owned by CyclotomicClassGroupsAndStickelberger §4.3 (`numericalIntersection` is a local statement helper, identical to DynamicalDegreesOfRationalMaps's under another namespace); Kleiman's nonnegativity, owned by this roadmap, which DynamicalDegreesOfRationalMaps cites.

Source independence: changed passages only. Nine passages were compared with three sources (STACKS, KOL97, AS95), beside the 42 locators: the new §1.7 paragraph (0BEP, 0BFI), the `numericalIntersection` docstring (0BEM), §1.7a (0BJ8), and the statements of §§6.1, 6.4 (families), 6.5, 6.6, 6.7 and 6.8. The longest shared runs are theorem clauses of about 9 words (KOL97 line 1563), forced by the mathematics. Largest share: SCH23, 62 of 241 source-id mentions; within Layer 6, KOL97 has 20 of 31. Layer 6 was compared with KOL97's contents (§§2–7) and is independent. §§6.1–6.7 draw on KOL97 §§3, 2, 2, 4 and 7, 6, 5 and 5–6, in an order forced by the *Needs:* lines of §§6.4–6.7.

Research link: Layer 6 states Kollár's algebraic form (KOL97 §§5–7) of the Angehrn–Siu theorem (AS95, 1995) on point separation by adjoint bundles, the effective result toward Fujita's conjecture. Layers 2–4 give Schröer's descent (SCH23, 2023) behind the nonexistence of Enriques surfaces over ℤ. Layers 1 and 5 feed the mixed-characteristic MMP (BMP23, HW23). This rests on the README and on AS95 §1.

## Not verifiable

- KLE66 Theorem III.1 and LAZ04 Theorem 1.4.9, cited in the docstrings of the two new §1.7 theorems: settled as uncertified and not read. The README's route and STACKS 0BFI carry the statements.
- LAZ04-II 9.1.22, 9.2.19, §9.3 and 9.4.17 (§§6.1–6.3): settled as uncertified and not read. KOL97 Theorem 2.16 (line 538) carries the statements.

Automatic checks set aside as false positives: none. The two names the citation lookup found nowhere are a proposed name of SchemeAndStackFoundations §5.10 (`Num.free_finiteRank`, its README line 8649) and this roadmap's own `PointSeparation.angehrnSiuPointSeparation`.

## Source issues

- **Error** in KOL97 at Theorem 5.8, p. 30 (KOL97 line 1349): the source states it for klt pairs, and its Definition 3.5 (line 703) allows a non-effective boundary; `(ℙ¹, −½p)` with `N = ½p + q` gives `M = O(−1)` without sections. It should assume the boundary effective, as the proof's use of Theorem 2.16 requires; affects nothing.
- **Gap** in KOL97 at Lemma 6.6.1, p. 35 (KOL97 line 1588), used for Theorems 5.8–5.9: the source states it for a proper scheme, but the proof writes N as ample plus effective, which needs projectivity. It should assume X projective or reduce to that case; affects nothing.
- **Gap** in KOL97 at Corollary 7.6, part (7.6.2), p. 44 (KOL97 line 1960): the proof applies Theorem 7.5.2, which assumes B ℚ-Cartier (line 1937), a hypothesis (7.6.2) does not state. It should add that hypothesis, as §6.4 here does; affects nothing.
- **Misprint** in KOL97 at 5.10, p. 31 (KOL97 line 1405): the source asserts a strict inequality between two sums that are equal (both 2) when n = 1. It should be non-strict; affects nothing.
- **Misprint** in KOL97 at Claim 6.8.4, p. 38 (KOL97 lines 1697–1698): the source gives two consecutive clauses the same label 6.8.4.3. The second should be 6.8.4.4; affects nothing.

## For the human reviewers

- Layer 6 (pairs, multiplier ideals of pairs and Angehrn–Siu over ℂ; README lines 1154–1549) joins a roadmap whose title is about numerical Picard groups and contraction descent. The family roadmap on `main` that owned this material now cites it here. Whether it belongs here or in a further Part is yours to decide.
