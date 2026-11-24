# Review of AlgebraicModuliForArithmeticGeometryPartII (pull request #3027 at 71bbefa)

**Verdict:** needs changes

**Summary.** A review of the change against `main`: 522 changed lines since `aecb53a`. Checked: the repairs of the last review, §§1.6a and 1.7a, the new Layer 6 with its Lean statement, every Kollár 1997 and Angehrn–Siu locator the layer gives, the supplier citations, ownership against the family roadmap that the layer is moved from, and the build. One finding blocks acceptance. The new `PointSeparation.selfIntersection` makes the Nakai–Moishezon criterion over an arbitrary field statable at the pins, yet the module docstring still lists it as not statable for lack of intersection numbers. Layer 6's statements, its Checks and the Angehrn–Siu statement in `Suggested.lean` are correct as written, and last round's blocking finding is repaired. There are two small corrections and four format notes. One question of placement is left for the human reviewers.

## R01 (P2) — The new `selfIntersection` makes the Nakai–Moishezon criterion statable, but the module docstring still lists it as not statable for lack of intersection numbers

The acceptance test leaves out a headline it can now state, and its docstring contradicts itself. Lines 29–31 of `Suggested.lean` (untouched) say that the Nakai–Moishezon criterion over an arbitrary field and Kleiman's nonnegativity theorem "lack iterated first-Chern intersection numbers on higher-dimensional subschemes". Lines 43–45, added here, say that `PointSeparation.selfIntersection` computes the intersection numbers `(L^d · Z)`. Its docstring (lines 479–485) identifies the value with the degree of `c_1(a)^r ∩ [X]` (Stacks 0BEP), and README §6.8 (line 1511) uses it as that number. §1.7(i) (line 344) needs only the self-intersections `(L^{dim V}·V)`. On a scratch copy of the file, the following statement elaborates against the pinned Mathlib and Tau Ceti (with `sorry`), placed after the existing declarations:

```lean
theorem nakaiMoishezon (k : Type u) [Field k] (X : Scheme.{u}) [X.Over (Spec (.of k))]
    [IsProper (X ↘ Spec (.of k))] (a : LineBundleClass X) :
    a.IsAmple ↔ ∀ (V : Scheme.{u}) [V.Over (Spec (.of k))] [IsIntegral V] (ι : V ⟶ X)
      [IsClosedImmersion ι] [ι.IsOver (Spec (.of k))] (d : ℕ), 1 ≤ d →
      topologicalKrullDim V = d →
      0 < PointSeparation.selfIntersection k V d (LineBundleClass.pullback ι a)
```

As a sanity check, on P¹×P¹ the definition gives `1 − 4 + 3 = 0` for `O(1,0)` on the whole surface, which is not ample, and `1 − 8 + 9 = 2` for `O(1,1)`, which is ample.

The smallest repair would be to state §1.7(i) in Layer 1 with `selfIntersection`, moving the definition out of `PointSeparation` and above Layer 1 (or stating the criterion after it), and to correct the docstring sentence. Kleiman's nonnegativity (ii) involves mixed numbers `(L₁⋯L_d·V)`, which the file still does not define. The docstring could say that this is what is missing. Alternatively, the file could add the mixed difference `Σ_{S ⊆ {1,…,d}} (−1)^{d−|S|} χ(V, ⊗_{i∈S} L_i)`, which is the coefficient of `n₁⋯n_d` in Stacks 0BEP, and then state (ii) as well.

## C01 — The pull-request description does not mention §§1.6a and 1.7a or the new supplier

The description covers Layer 6 and `PointSeparation.angehrnSiuPointSeparation`. It says nothing about the other two additions to this roadmap: §1.6a (Kodaira's lemma) and §1.7a (asymptotic Riemann–Roch for ample sheaves). Nor does it say that CyclotomicClassGroupsAndStickelberger is a new supplier (§4.3, with a new contract at line 1641). This is the part of last round's C03 that is still open. One sentence under "For reviewers" would cover it. For example: "AlgebraicModuliForArithmeticGeometryPartII also gains §1.6a (Kodaira's lemma) and §1.7a (asymptotic Riemann–Roch for ample sheaves), citing CyclotomicClassGroupsAndStickelberger §4.3, a new supplier; no section is removed or renumbered."

## C02 — The opening summary does not mention the roadmap's new headline theorem

The overview (lines 3–13) still says that the roadmap develops numerical classes and uses them to descend contractions, and it names four main theorems. The Angehrn–Siu theorem, now a headline in `Suggested.lean`, appears only in the guide to the layers (line 17). One sentence with its hypotheses would bring the overview up to date. For example: "On a smooth projective complex variety of dimension n with an ample line bundle L, if `(L^d·Z) > (½n(n+2ℓ−1))^d` for every subvariety Z of dimension d ≥ 1, the sections of `K_X + L` separate any ℓ distinct closed points."

## N01 — Ten Layer 6 names in code font are declared nowhere

From `pairDiscrepancy` (line 1155) to `kollarTwoPointSeparation` (line 1459), ten names in code font are not declared in `Suggested.lean`. Elsewhere in this README, a backticked name of the roadmap's own is a declaration there (for example `IsContraction` and `IsProjectiveOver`). Write these in prose, or say that they are proposed names.

## N02 — Layer 6 cites its sources by author and year

Layer 6 cites Kollár 1997, Angehrn and Siu 1995, Kollár–Mori 1998 and Lazarsfeld 2004 by author and year. The References (line 1647) describe citations by source id with extraction line numbers. Ids such as KOL97 (arXiv alg-geom/9601026v2) and AS95 (the GDZ copy), with line numbers, would match the rest of the README.

## N03 — The Lazarsfeld 2004 entry overstates what is cited

The entry (line 1670) says Layer 6 cites Chapters 9 and 10 of that volume. Only Chapter 9 locators occur.

## N04 — Some Tau Ceti names in the Layer 6 contract lack their namespace

The Layer 6 paragraph under "From Tau Ceti" (line 1585) names `LineBundleClass.mk`, `LineBundleClass.lift`, `FiniteLocallyFreeSheaf.relativeDifferentials` and `FiniteLocallyFreeSheaf.rank_relativeDifferentials_apply` without the `TauCeti.AlgebraicGeometry.` prefix.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.6a Kodaira's lemma | `Bl_p P²`, `L=O(h)`; P¹×P¹, `O(1,0)` | `(2h−e)·e=1`, `(2h−e)·(h−e)=1`, `(2h−e)²=3`: ample with ν=2, C=e; `O(ν−a,−b)` has fibre degree `−b≤0` | holds; bigness needed | none |
| §1.7a asymptotic Riemann–Roch | P², O(1); `V(xy)`, `V(x²)` ⊂ P²; `V(x)` | `(m+1)(m+2)/2` vs `(A²)/2!=½`; `2m+1` vs `(A)_V=2`; `m+1` vs 1 | holds on non-integral V | none |
| §6.1 discrepancies, klt, lc | 𝔸² with `c·L`; cusp; cones over conic and cubic | klt iff c<1; cusp `1−2c, 2−3c, 4−6c`: klt iff c<5/6; `2g−2=−(a+1)d` gives a=0 (conic), a=−1 (cubic) | holds | none |
| §6.2 multiplier ideal of a pair | 𝔸², `c·L`; cusp at c=5/6; cone over cubic | `O(−⌊c⌋L)`; round-ups 0, 0, −1 on E₁, E₂, E₃ give m; `f_*O(−E)=m` | holds | none |
| §6.3 Nadel vanishing | ℙ², `c·L₀`, `O(m)`; elliptic curve, Δ=0, L=O | degree `m+3−c>0` iff m≥−2, `H^i(O(m))=0`; c=1: J=O(−1); `h¹(O)=1` when not big | holds; bigness needed | none |
| §6.3 smooth case via AMFAG §9.10 | `a=O(−qΔ)`, c=1/q, `M=O(qΔ)`, L−K_X | `a⊗M=O` generated; `(L−K)−cM=L−K−Δ` nef and big; `ω⊗O(L−K)⊗J=O(L)⊗J` | matches the supplier's clause | none |
| §6.4 `bertiniForPairs` (b) | span of x², y³ on 𝔸²; span of 1, x | base point 0, general member a cusp, not klt for b≥5/6; members x=c, lc and not klt at b=1 | both hypotheses needed | none |
| §6.4 `inversionOfAdjunction` | S=V(y), `B=c·V(y−x²)` | `B|_S=2c·(0)`; discrepancies −c, −2c; lc iff c≤½ on both sides; ½<c<1: (X,B) klt, (S,B|_S) not lc | holds; converse of (b) fails | none |
| §6.4 `kltInFamilies` | `B=½V(u²−c²)` on 𝔸¹×𝔸¹ | `B_c=½(c)+½(−c)` klt for c≠0; `B_0=1·(0)` lc, not klt; matches KOL97 7.6 via 7.5 and 7.7 | holds; Zariski U suffices for 6.5 | none |
| §6.5 `isolatedNonKltCentre` | ℙ¹, N=O(a), c₁=1; route on ample N | a>1: `D=x+(a−1)y` lc and not klt at x, klt nearby; `(n/c_n)^n(N^n)>n^n` | matches KOL97 6.4, 6.7.1 | none |
| §6.6 `adjointGlobalGeneration` | ℙ¹, O(a), c₁=1; `(ℙ¹,−½p)`, `N=½p+q` | a≥2: `O(a−2)` generated; a=1: O(−1); M=O(−1), `(N·X)=3/2>1`, no section | holds; Δ≥0 needed | none |
| §6.7 `kollarTwoPointSeparation` | ℙ¹, O(a); `c_e=½n(n+3)` | `2/c₁≤1`, `a>c₁` ⇒ a≥3; `O(a−2)` separates iff a≥3; `Σ2^{1/e}e ≤ Σ(e+1) = ½n(n+3)` | holds | none |
| §6.8, `angehrnSiuPointSeparation` | ℙ¹, ℓ=2; ℙ², ℓ=2; n=0 | threshold 2: a≥3 separates, a=2 fails; threshold 5: a≥6, `O(a−3)`; n=0: ℓ≤1, `K+L≅O` | holds; AS95 0.3 with κ is equivalent | none |
| `selfIntersection` | ℙ², O(1), r=2; ℙ¹×ℙ¹, O(1,1); ℙ¹, O(−3), r=1 | `1−6+6=1`; `1−8+9=2`; `χ(O(−3))−χ(O)=−3` (an h⁰ version gives 0) | correct numbers | none |
| `canonicalBundle` | ℙ¹; ℙ² | `det Ω=O(−2)`; `det Ω=O(−3)`; Ω itself has rank 2, `det T=O(3)` has the wrong sign | correct | none |
| §1.7(i) Nakai–Moishezon with `selfIntersection` | P¹×P¹: O(1,0), O(1,1); scratch statement | 0, not ample; 2, with curve degrees 1: ample; statement elaborates | statable | R01 |
| KOL97 Theorem 5.8 as printed | `(ℙ¹,−½p)`, klt by its Definition 3.5 | predicts a section of O(−1); h⁰=0 | false without Δ≥0 | source issue |
| Sample, untouched: §0.4, §1.1 | P¹×P¹ → P¹ | `O(a,b)` fibre-trivial iff b=0: Pic^τ=pr₁*Pic P¹, Num≅ℤ by b; BMP23 line 825 agrees | holds | none |
| Sample, untouched: §§2.5, 2.6, 2.11 | elliptic E; P¹_ℂ over ℝ; pointless real conic | Pic^τ=E (KLE05 line 2701); Galois swaps ℤ², not constant; O(1) does not descend, its norm O(2) does | holds | none |
| Sample, untouched: §§3.1, 3.3 | 𝔸¹→Spec k[t²,t³]; O(1,0) on P¹×P¹ | `f_*O=k[t]≠k[t²,t³]`, not a contraction; section ring k[x,y] gives pr₁ (SCH23 line 262) | holds | none |
| Sample, untouched: §§4.10, 5.5, 5.6 | A₂ chain; P¹_R, O(1); `P¹×S→S`, pr₂*M | matrix `[[−2,1],[1,−2]]` kept; fibre degree 1 on both fibres; pr₂*M descends to M | holds | none |

- Earlier findings. R01 is repaired: §1.7a takes the numerical intersection and its positivity from CyclotomicClassGroupsAndStickelberger §4.3, and DynamicalDegreesOfRationalMaps is no longer cited. C01 is repaired: "Let V be a projective k-scheme of dimension n ≥ 1". C02 is repaired: the §1.6a *Needs:* line lists SchemeAndStackFoundations §2.6. N01 is repaired: "Varieties line 4868". C03 is partly repaired (C01 here). The parent no longer cites this roadmap.
- 40 locators checked:
  - KOL97: 2.16, 3.3–3.5, 3.10–3.13, 4.8, 5.7–5.10, 6.4, 6.5, 6.6.1–6.6.2, 6.7.1, 6.8.1, 6.9.1, 7.3.2, 7.4, 7.5, 7.5.3 and 7.6–7.8 (KOL97 lines 538–1987);
  - AS95: Theorem 0.3 and Corollary 0.4 (AS95 lines 60–65), and §7 (AS95 line 413);
  - STACKS: 02OO (Divisors line 1060), 0BEP (Varieties line 4754), 0BJ8 (4868) and 0G47 (4969);
  - WIT22 lines 330–332 and EV92 lines 1735–1736;
  - in the untouched sample, KLE05 line 2701, BMP23 line 825 and SCH23 lines 167 and 262.
- 9 library declarations opened at the pins:
  - Mathlib: `Scheme.Hom.smoothLocus` (Morphisms/Smooth.lean:300), `SmoothOfRelativeDimension` (:127) and `Scheme.Hom.isConstructible_image` (Morphisms/FinitePresentation.lean:162);
  - Tau Ceti: `Scheme.IsProjectiveOver` (ProjectiveSpectrum/ProjectiveOver.lean:57), `Scheme.Modules.nonvanishingLocus` (LineBundle/NonvanishingLocus.lean:82), `Scheme.Modules.eulerCharBelow` (Cohomology/EulerCharacteristic.lean:105), `FiniteLocallyFreeSheaf.determinant` (VectorBundle/Determinant/Basic.lean:59), `rank_relativeDifferentials_apply` (Modules/Differentials/Rank.lean:74) and `InvertibleSheaf.canonicalBundle` (LineBundle/SerreDuality.lean:65).
- 16 cross-roadmap citations resolved:
  - AlgebraicModuliForArithmeticGeometry §§9.4 and 9.7, and §9.10 (`algebraicAdjointVanishing`, `algebraicMultiplierIdeal`, `uniformAdjointVeryAmpleness`), on main; its §9.12 at the head;
  - SchemeAndStackFoundations §§2.2 (`leray_spectral_sequence`), 2.6 (`ample_serre_vanishing`), 3.4 (`picardToClassGroup`), 4.13 (regular locus equals smooth locus over a perfect field) and 4.17, and Layer 5;
  - ResolutionOfSingularitiesCharacteristicZero §§5.1, 5.5 and 5.6;
  - CyclotomicClassGroupsAndStickelberger §4.3.
- Automatic checks: all passed. Dependency check output: `depcheck: 132 roadmaps, 1470 edges, 0 problem(s)`, with no UPWARD or CYCLE line. No file outside the pull request's own folders changed.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0, with 17 `sorry` warnings and nothing else. The elaborated types of the three new declarations match README §6.8, with no section binder lost. The one-tactic probe (`simp`, `trivial`, `aesop`, `exact`) fails on `angehrnSiuPointSeparation`. The Nakai–Moishezon probe of R01 elaborates.
- Headlines: the four summary theorems and Kleiman, Murre–Oort and the DVR targets are stated, as before. Angehrn–Siu (§6.8) is stated. Nadel vanishing and §§6.5–6.7 are named in the docstring as not statable; that is correct, since pairs, discrepancies and multiplier ideals of pairs are absent at the pins. Nakai–Moishezon is the exception (R01).
- Overlap check: read AbundanceStatement, SchemeAndStackFoundations (main and its open revisions, #2489 and #2531), StableReduction, K3SurfacesAndSymplecticBoundedness, DynamicalDegreesOfRationalMaps, MultiplierIdealsOfPairsAndPointSeparation (main and head) and ComplexComparisonPartII (head). Owners:
  - pairs, multiplier ideals of pairs, Nadel vanishing, inversion of adjunction and Angehrn–Siu: this roadmap. The family roadmap cites §§1.6a, 1.7a and 6.1–6.8 in *Corollary of:* lines (its README line 38 and the lines at 56–407), and nothing here cites the family;
  - analytic multiplier ideals and analytic Nadel vanishing: ComplexComparisonPartII C5.4g–C5.4h;
  - klt varieties with Δ = 0: AbundanceStatement Layer 3 (open), the Δ = 0 case of §6.1, which as the open roadmap it cites;
  - the numerical intersection: CyclotomicClassGroupsAndStickelberger §4.3, of which `selfIntersection` is the diagonal case, defined locally for the Lean statement;
  - the other roadmaps share nothing with the change.

Source independence: changed passages only. 12 passages were compared with 3 sources (KOL97, AS95, STACKS), beside the 40 locators: the statements of §§6.4–6.8, the routes of §6.2, §6.4 (inversion of adjunction) and §6.5, and the docstrings of `angehrnSiuPointSeparation` and `selfIntersection`. The longest shared runs are clauses of theorem statements of about 8 words (for example KOL97 line 1912), forced by the mathematics. Largest share: SCH23, 63 of 278 source mentions; within Layer 6, KOL97 has 20 of 32. The added layer's contents were compared with KOL97 §§2–7: independent. §§6.1–6.8 take KOL97 §§3, 2, 2, 4 and 7, 6, 5 and 5–6 in an order forced by the *Needs:* lines of §§6.4–6.7.

Research link: Layer 6 states Kollár's algebraic form (KOL97 §§5–7) of the Angehrn–Siu theorem (1995) on freeness and point separation for adjoint bundles, the effective result toward Fujita's conjecture. Layers 2–4 are Schröer's descent (SCH23) for the absence of Enriques surfaces over ℤ, and Layers 1 and 5 feed mixed-characteristic MMP (BMP23, HW23). This rests on the README and on AS95 §1.

## Not verifiable

- Kollár–Mori 1998, §2.3 (§6.1): Cambridge landing page only, no legal open copy. Kollár 1997 carries the statement.
- Lazarsfeld 2004, vol. II, 9.1.22, 9.2.19, §9.3 and 9.4.17 (§§6.1–6.3): Springer, paywalled. Kollár 1997 Theorem 2.16 carries the statements.
- LAZ04, KLE66 and HAR77 (untouched §§0.7, 1.7 and 3.3) are settled as uncertified and were not read.

Automatic checks set aside as false positives: none. The citation resolver's leads `PointSeparation.angehrnSiuPointSeparation` and `PointSeparation.selfIntersection` are declarations of this roadmap's `Suggested.lean`, which the resolver does not search.

## Source issues

- **Error** in KOL97 at Theorem 5.8, p. 30 (KOL97 line 1349): the source states it for klt pairs, whose boundary its Definition 3.5 allows to be non-effective; `(ℙ¹, −½p)` with `N = ½p + q` and `M = O(−1)` refutes it. It should assume Δ effective, as the proof's use of Theorem 2.16 requires; affects nothing.
- **Gap** in KOL97 at Theorems 5.8–5.9, pp. 30–31 (KOL97 lines 1349, 1379): the source states them for proper pairs, but the proof calls Theorem 6.4, for projective pairs, whose Step 6.6.1 writes N as ample plus effective. It should assume projectivity or reduce to it; affects nothing.
- **Gap** in KOL97 at Corollary 7.6, part (7.6.2), p. 44 (KOL97 line 1963): the proof applies Theorem 7.5.2, which needs B ℚ-Cartier, a hypothesis (7.6.2) does not state. It should add that hypothesis, as §6.4 here does; affects nothing.
- **Misprint** in KOL97 at 5.10, p. 31 (KOL97 line 1405): the source asserts a strict inequality between the two sums, which are equal (both 2) when n = 1. It should be a non-strict inequality; affects nothing.
- **Misprint** in KOL97 at Claim 6.8.4, p. 38 (KOL97 lines 1697–1698): the source gives two consecutive clauses the same label 6.8.4.3. The second should be 6.8.4.4; affects nothing.

## For the human reviewers

- Layer 6 (pairs, multiplier ideals of pairs, Angehrn–Siu over ℂ; README lines 1151–1541) joins a roadmap whose title and summary (lines 1–13) are about numerical Picard groups and contraction descent. The description argues that the layer needs this Part's numerical theory and the first Part's resolutions. Whether it belongs here or in a further Part is yours to decide.
