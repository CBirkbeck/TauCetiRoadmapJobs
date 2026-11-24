# Review of AlgebraicModuliForArithmeticGeometryPartII (pull request #3027 at f3b4ab1)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 586 changed lines since `74a09b7`. The folder's text is the one the previous review read; it was checked again against the new merge base, the current `main` and the pins: §§1.6a, 1.7 and 1.7a, Layer 6 with its Checks and locators, the three new `Suggested.lean` theorems and two definitions, the supplier citations, the record of the README on `main`, and the build. No finding. The previous review's one small correction (the description) is repaired. One small correction, on the generality of §6.3 against its source, does not block; there are no format notes. One question of placement is left for the human reviewers.

## C01 — §§6.3, 6.6 and 6.7 are stated for projective X, while the theorems of Kollár they cite are stated for proper X, and the text does not say that the restriction is deliberate

A reader who opens the locators finds a wider hypothesis than the README's and cannot tell whether the difference is a choice or a slip. §6.3 (line 1246) takes "a normal projective variety" and cites KOL97, Theorem 2.16, which reads "normal and proper" (KOL97 line 538). §§6.6 and 6.7 (lines 1439 and 1466) take "a projective klt pair" and cite Theorems 5.8 and 5.9, both "a proper klt pair" (KOL97 lines 1349 and 1362).

For §§6.6–6.7 the restriction is right: Theorem 6.4 is projective (KOL97 line 1555), and the reduction to ample N writes N as ample plus effective (KOL97 line 1593). One clause beside the locator would say so, as the text already does for the effectivity of Δ. For §6.3 the proper case costs one step: the route's log resolution "by blow-ups" can be preceded by Chow's lemma (SchemeAndStackFoundations §4.12, already a supplier), so that Y is still projective and `algebraicAdjointVanishing` applies to the pullback, nef and big on Y. §6.3 would then be stated for proper X, as its source is; or the text would say that it is stated for projective X because §§6.5–6.8 use no more.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `numericalIntersection` (§1.7) and its new Check | P¹×P¹, χ(O(a,b)) = (a+1)(b+1); r = 0 | `1−2−2+4 = 1`; `1−4+3 = 0`; `1−8+9 = 2`; r = 0 gives h⁰(O_V) ≥ 1; leading coefficient of (m+1)² is 1, so 2!·1 = 2 | mixed difference is the coefficient of n₁⋯n_d (STACKS line 4754) | none |
| §1.7 (i), `isAmple_iff_forall_numericalIntersection_pos` | X = ∅; X finite; O(1,0), O(1,1) on P¹×P¹; O(h) on Bl_p P² | ∅, finite: both sides true (no V of positive dimension). O(1,0): 0, not ample. O(1,1): 2 and curve degrees ≥ 1. O(h): h·e = 0, not ample | holds both ways | none |
| §1.7 (ii), `numericalIntersection_nonneg_of_isNef` | d = 0; nef pairs on P¹×P¹; O(1,−1) | d = 0: h⁰ ≥ 1. Nef: 1, 0, 2 ≥ 0. O(1,−1): `1 − 2·0 + χ(O(2,−2)) = 1 − 3 = −2 < 0` | holds; nefness needed | none |
| §1.6a Kodaira's lemma | Bl_p P², O(h), ν = 2, C = e; P¹×P¹, O(1,0); n = 1; finite base field | `(2h−e)·e = 1`, `(2h−e)·(h−e) = 1`, `(2h−e)² = 3`; `O(ν−a,−b)` has fibre degree −b ≤ 0; n = 1: h⁰(H, ·) constant; section avoiding points needs H¹ = 0, which the *Needs* line supplies | holds; bigness needed | none |
| §1.7a asymptotic Riemann–Roch | Pⁿ; V(xy), V(x²) ⊂ P² | `binom(m+n,n)`; `binom(m+2,2) − binom(m,2) = 2m+1`, so (A)_V = 2; reduced line m+1 | holds (STACKS line 4868) | none |
| §6.1 discrepancies | cusp, c·C; cone over cubic, conic | `1−2c`, `2−3c`, `4−6c`: klt iff c < 5/6; cubic cone −1 (lc, not klt); conic cone 0 | holds | none |
| §6.2 multiplier ideal of a pair | c·L on 𝔸²; cusp; cubic cone | `O(−⌊c⌋L)`; maximal ideal for 5/6 ≤ c < 1; `f_*O(−E)` = maximal ideal of the vertex | holds; smooth case matches the parent's `J(a^c)` with a = O(−qΔ), c = 1/q | none |
| §6.3 Nadel vanishing | ℙ², c·L₀, O(m); c = 1; elliptic curve | degree `m+3−c > 0` iff m ≥ −2, and `H²(O(m)) = 0` iff m ≥ −2; c = 1: m ≥ −1, `H^i(O(m−1)) = 0`; `H¹(O_E) ≠ 0` | holds; bigness needed | C01 |
| §6.4 Bertini, inversion of adjunction, families | ⟨x², y³⟩ on 𝔸²; S = V(y), B = c·V(y−x²); ½V(u²−c²) | cusp at the base point, not klt for 5/6 ≤ b < 1; two blow-ups give −c and `1−c−1−c = −2c`: lc iff c ≤ ½, and `B|_S = 2c·(0)`; `B_0 = 1·(0)` lc, not klt | holds; converse of (b) fails | none |
| §6.5 isolated non-klt centre | smooth point, mult > n | blow-up discrepancy `n−1−mult < −1`; hypotheses equal KOL97 Theorem 6.4 (line 1555) | holds | none |
| §6.6 global generation | ℙ¹, O(a), c₁ = 1; c_d = ½n(n+1); (ℙ¹, −½p), N = ½p+q | a ≥ 2: O(a−2) generated, a = 1: O(−1); `Σ d/c_d = 1`; `deg M = −2 − ½ + 3/2 = −1` | holds; Δ ≥ 0 needed | C01 |
| §6.7 two-point separation | ℙ¹, O(a); uniform constant; surjectivity | `2/c₁ ≤ 1`, a > c₁ ≥ 2: a ≥ 3, O(a−2) separates iff a ≥ 3; `Σ(e+1) = ½n(n+3) = binom(n+2,2) − 1`; values (a,0), (b,c) with a, c ≠ 0 span | holds | C01 |
| §6.8, `angehrnSiuPointSeparation` (sample) | ℙ¹, ℓ = 2; ℓ = 1; ℓ = 0; n = 0 | threshold `½·1·4 = 2`: a ≥ 3, O(a−2); ℓ = 1 gives ½n(n+1), §6.6's constant; ℓ = 0 vacuous; n = 0, ℓ = 0: `0·(−1)/2 = 0` in ℚ, no truncation | holds; AS95 line 60 has ≥ threshold + κ, equal on integers | none |

- **Earlier findings.** The previous review had no finding. Its C01 is repaired: the description now says that Part II "also gains §1.6a (Kodaira's lemma) and §1.7a (asymptotic Riemann–Roch for ample sheaves); §1.7a cites CyclotomicClassGroupsAndStickelberger §4.3 for numerical intersections, a new supplier", and names `isAmple_iff_forall_numericalIntersection_pos`, `numericalIntersection_nonneg_of_isNef`, `numericalIntersection` and `PointSeparation.canonicalBundle`.
- **Source locators checked against the text: 31.** KOL97 lines 538, 654, 703, 784, 1139–1145, 1342, 1349, 1362, 1392–1408, 1555–1566, 1572–1581, 1588–1604, 1624, 1644, 1715, 1876, 1901, 1933–1938, 1951, 1956–1962, 1968, 1979; AS95 line 60; WIT22 lines 330–332; EV92 lines 1735–1736; STACKS Varieties lines 4679, 4754, 4868, 4969, Chow Homology line 3995, Divisors line 1060. Of the seeded sample only §6.8 lies in changed text, and §1.6 is cited by the new §1.6a; the other targets are untouched and unaffected.
- **Library at the pins.** `Suggested.lean` elaborates with every `TauCeti.*` import resolved; `#check @` of `numericalIntersection` and `PointSeparation.canonicalBundle` gives the README's signatures, and the three new theorems carry all their binders explicitly.
- **Cross-roadmap citations resolved.** CyclotomicClassGroupsAndStickelberger §4.3 on `main` (README lines 725–731: numerical intersection, polynomiality, ample positivity); AlgebraicModuliForArithmeticGeometry §§1.5, 9.4, 9.7, 9.10 on `main` and §9.12 at this head, with `algebraicAdjointVanishing`, `algebraicMultiplierIdeal`, `uniformAdjointVeryAmpleness` (lines 10117–10128); SchemeAndStackFoundations §§2.2, 2.6, 3.4, 4.13, 4.15, 4.17, 5.2–5.3; ResolutionOfSingularitiesCharacteristicZero §§5.1, 5.5, 5.6, 7.8.
- **Record kept.** Against the README at `74a09b7`: no heading removed, 13 added; the 9 README lines removed are each replaced by the same sentence extended. No Lean declaration removed; the four docstring lines removed are replaced by the statement that §1.7 (i)–(ii) are now stated.
- **Automatic checks and dependencies.** All passed. `depcheck: 132 roadmaps, 1470 edges, 0 problem(s)`; no UPWARD or CYCLE line. The pull request changes nothing outside its own roadmap folders.
- **Elaboration and padding.** `lake env lean` on `Suggested.lean`: 19 `sorry` warnings, nothing else. The one-tactic probe (`rfl`, `trivial`, `simp`, `infer_instance`) leaves all three new theorems unsolved.
- **Description.** Its sentences on this folder (new Layer 6; §§1.6a and 1.7a; the new supplier; the five new declarations; nothing removed or renumbered; no mention of the family) agree with the head.

Overlap check: read MultiplierIdealsOfPairsAndPointSeparation (main and this head), DynamicalDegreesOfRationalMaps (main), SchemeAndStackFoundations (main), AbundanceStatement and K3SurfacesAndSymplecticBoundedness (open); shared objects and owners: pairs, multiplier ideals of pairs, Nadel vanishing and Angehrn–Siu point separation are owned here, and MultiplierIdealsOfPairsAndPointSeparation at this head cites §§6.1–6.3, 6.5, 1.6a and 1.7a in its *Corollary of:* lines while nothing here cites it; the numerical intersection is owned by CyclotomicClassGroupsAndStickelberger §4.3, `numericalIntersection` here being a statement helper in this roadmap's namespace (the same body as DynamicalDegreesOfRationalMaps's, under another namespace); `canonicalBundle` is declared also in MultiplierIdealsOfPairsAndPointSeparation's file, under that roadmap's namespace.

Source independence: changed passages only; 10 passages compared with 5 sources (KOL97, AS95, STACKS, WIT22, EV92): the statements of §§1.6a, 1.7a, 6.3, 6.4 (families), 6.5, 6.6, 6.7, 6.8, the new §1.7 paragraph and the `numericalIntersection` docstring; none shared beyond theorem clauses of under a dozen words forced by the mathematics; largest share in the change KOL97, 20 of 31 Layer 6 locators (SCH23 over the whole README); contents compared with KOL97 §§2–7: independent, since §§6.1–6.7 draw on its §§3, 2, 2, 4 and 7, 6, 5, 5–6 in the order the *Needs:* lines of §§6.4–6.7 force.

Research link: Layer 6 states Kollár's algebraic form (KOL97, 1997, §§5–7) of the Angehrn–Siu theorem (AS95, 1995) on separation of points by adjoint bundles, an effective result toward Fujita's conjecture; Layers 2–4 give Schröer's descent (SCH23, 2023); Layers 1 and 5 feed the mixed-characteristic MMP (BMP23, HW23). Rests on the README and AS95 line 60.

## Not verifiable

- KLE66 Theorem III.1 and LAZ04 Theorem 1.4.9 (docstrings of the two §1.7 theorems): settled as uncertified, not read; STACKS 0BEP and 0BFI carry the intersection number.
- LAZ04-II 9.1.22, 9.2.19, §9.3, 9.4.17 (§§6.1–6.3): settled as uncertified, not read; KOL97 Theorem 2.16 (line 538) carries the statements.
- AS95 §§7–9 (lines 371–637), the route of §6.8: the statement at line 60 was read; the steps of the route were not followed line by line this round.

Automatic checks set aside as false positives: none. The two names the citation lookup found nowhere are a proposed name of SchemeAndStackFoundations §5.10 and this roadmap's own `PointSeparation.angehrnSiuPointSeparation`.

## Source issues

- **Error** in KOL97 at Theorem 5.8, p. 30 (KOL97 line 1349): the source states it for klt pairs, whose boundary Definition 3.5 allows to be non-effective; `(ℙ¹, −½p)` with `N = ½p + q` gives `M = O(−1)`, without sections. It should assume the boundary effective, as Theorem 2.16 does; affects nothing.
- **Gap** in KOL97 at Lemma 6.6.1, p. 35 (KOL97 lines 1588–1593), used for Theorems 5.8–5.9: the source takes a proper scheme, but its proof writes N as ample plus effective. It should assume X projective, as Theorem 6.4 does; affects nothing.
- **Misprint** in KOL97 at 5.10, p. 31 (KOL97 lines 1403–1408): the source asserts a strict inequality between two sums that are equal (both 2) when n = 1. It should be non-strict; affects nothing.

## For the human reviewers

- Layer 6 (pairs, multiplier ideals of pairs, Angehrn–Siu over ℂ; README lines 1154–1548) joins a roadmap titled for numerical Picard groups and contraction descent; the family roadmap that held this material now cites it here. Whether it belongs here or in a further Part is yours to decide.
