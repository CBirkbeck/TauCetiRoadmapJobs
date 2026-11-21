# Review of MultiplierIdealsOfPairsAndPointSeparation (pull request #2911 at 04a1d1c)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/MultiplierIdealsOfPairsAndPointSeparation/`
**Verdict:** needs changes

**Summary.** Needs changes, for four findings. Global generation (9.12b) and Summary items (2) and (4) never require `Δ ≥ 0`, so as written they are false. On `ℙ¹` with `Δ = −½p` they predict sections of `O(−1)`. Several inputs the routes rely on are credited to supplier sections that do not state them: asymptotic Riemann–Roch for nef divisors, Kodaira's lemma, the pullback of ℚ-Cartier divisors as divisors, nefness, and Chow forms. The other two findings: 9.13 and 9.13a are restricted to number fields although nothing in them uses one, and headline 9.12c can be stated at the pins although `Suggested.lean` says it cannot. There are also five small corrections and two format notes, none blocking. The human reviewers have three questions to settle, listed at the end: the main sources could not be read, 9.13–9.13b cite no source, and the family index depends on a formal proof announced on 20 November 2026.

## R01 (P1) — Global generation 9.12b (with 9.12 and Summary items (2) and (4)) omits `Δ ≥ 0`, and without it the statement is false

9.10a defines klt pairs for any ℚ-Weil divisor `Δ`, and 9.10b, 9.10c and 9.12a each add "Δ effective" where they need it. 9.12 (line 110), 9.12b (line 186), Summary items (2) and (4) (line 5) and the docstring entry for 9.12b in `Suggested.lean` (lines 34–37) do not add it. This makes 9.12b false. Take `X = ℙ¹`, `Δ = −½p` (klt, since its only coefficient is below 1 and a curve has no exceptional divisors), `N = ½p + q` (nef, degree 3/2) and `x` any point. The hypothesis `(N·X) = 3/2 > ½·1·2 = 1` holds, but `M = K_X + Δ + N = K_X + q ≅ O(−1)` has no sections. Item (4) fails the same way: with `N = ½p + 2q` and `c(1) = 2` we get `(N·X) = 5/2 > 2`, while `M ≡ O` has only constant sections, which never vanish at exactly one point. The route breaks where it applies 9.10c to `Δ + D`, because `J(X, Δ + D)` is only defined for an effective boundary. Kollár, *Singularities of pairs*, Theorems 5.8–5.9 (KOL97 lines 1349–1374) have the same omission; their proof applies 2.16, which assumes `∆` effective (KOL97 line 540).

Repair: add "with `Δ` effective" to the statements of 9.12 and 9.12b, to Summary items (2) and (4), and to the docstring entry for 9.12b, as 9.12a already does at line 135.

## R02 (P1) — Inputs the routes need are credited to supplier sections that do not state them, and three of them have no owner at all

The routes of 9.10a, 9.12, 9.12a and 9.13b cite the following suppliers:

- "asymptotic Riemann–Roch for nef divisors" (AlgebraicModuliForArithmeticGeometry §1.6 and SchemeAndStackFoundations Layer 5), lines 130–131 and 353;
- "Kodaira's lemma, asymptotic Riemann–Roch, intersection numbers of nef bundles" (AlgebraicModuliForArithmeticGeometry §1.6), lines 172, 310 and 345;
- "the ℚ-linear pullback of ℚ-Cartier divisors along proper birational morphisms" (SchemeAndStackFoundations Layer 5), lines 47 and 353;
- "nef and big ℚ-divisors" (AlgebraicModuliForArithmeticGeometry §9.10, Conventions line 15).

None of these sections states the result it is cited for. On main, AlgebraicModuliForArithmeticGeometry §1.6 has `chowParameters`, the bounded-support and Chow-openness theorems, `bigLineBundle` and `bigFamilyBirationalBounds`. Kodaira's lemma appears there only as a step in the last proof. §1.5 has Hilbert polynomials for ample sheaves only. SchemeAndStackFoundations Layer 5 has Chow groups, flat pullback, `c₁`, Gysin maps, and Hirzebruch–Riemann–Roch on smooth projective varieties. It has no pullback of Cartier divisors as divisors, no nefness and no asymptotic Riemann–Roch on singular varieties, and I found none of these anywhere in Tau Ceti.

These inputs are needed: the discrepancy of 9.10a is a coefficient of `f^*(K_X + Δ)` as a divisor, and the multiplicity counts of 9.12 and of step (3) of 9.12a are taken on possibly singular `X` and `Z`. Two of the objects already have owners on main:

- ℚ-Cartier Weil divisors, numerical equivalence, nefness and Kleiman's nonnegativity of intersections of nef sheaves are AlgebraicModuliForArithmeticGeometryPartII §0.7, §1.5 and §1.7 (ii).
- The Chow form that 9.13 defines inline ("the Chow form as defined above", line 250) is AlgebraicModuliForArithmeticGeometry §1.6 `chowParameters`, which ChowFormsAndHeightsOfSubvarieties already cites.

Repair, in two parts:

- Cite those owners in the *Needs:* lines and the supplier contracts. For the Chow form, note that for `X` defined over `k` it has a multiple with coefficients in `k`.
- For the three results nobody states, either state them here as targets or declare them as gaps on a named supplier. The three are: the divisorial pullback of ℚ-Cartier divisors along proper birational morphisms of normal varieties; asymptotic Riemann–Roch for a nef ℚ-Cartier divisor on an integral projective variety; and Kodaira's lemma. Alternatively, reduce to ample `N` first, as KOL97 6.6.1 (line 1588) does, so that only `hilbertPolynomial` and its leading coefficient are needed.

## R03 (P2) — 9.13 and 9.13a are restricted to number fields, though neither statement nor route uses one

Both open with "Let `k` be a number field" (lines 228 and 259) and close with "over other fields of characteristic zero they are not given here" (lines 248 and 279). The routes use only:

- characteristic zero, to get a squarefree Chow-form factor for general `s` and to apply Kawamata–Viehweg vanishing over `k̄`;
- that `k` is infinite, for the general linear change in 9.13a.

The Check of 9.13 on `ℙ¹` makes no use of the base field either. As written, the library would have the Bertini and division statements only over number fields, which serves one consumer, not the general library. Repair: replace "number field" by "field of characteristic zero" in both statements and delete the two closing sentences. The consumer, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18e, works over a number field and is unaffected.

## R04 (P2) — Headline 9.12c can be stated at the pins, but `Suggested.lean` states nothing

The docstring (lines 6–8 and 43–52) says 9.12c is not statable because the pins lack `(L^d · Z)` for `d ≥ 2`. That number can be defined in a few lines by the standard Snapper–Kleiman formula, the `d`-th difference of `m ↦ χ(Z, L^m)`. This is the convention behind Tau Ceti's own `LineBundleClass.intersectionNumber` for `d = 1`, and the open roadmap DynamicalDegreesOfRationalMaps uses the same definition at the same Tau Ceti pin. The docstring rules out a definition through growth of `h⁰`, which is a different thing. `K_X = det Ω_{X/k}` comes from the declarations the docstring itself names. The statement below elaborates against the pins with `sorry` as the only warning. It adds the imports of `TauCeti.AlgebraicGeometry.{Cohomology.EulerCharacteristic, LineBundle.Functoriality, LineBundle.GlobalGeneration, LineBundle.Ample, LineBundle.TensorProduct, ProjectiveSpectrum.ProjectiveOver, VectorBundle.Determinant.Basic, Modules.Differentials.Rank}`.

```lean
noncomputable def selfIntersection (K : Type u) [Field K] (X : Scheme.{u}) [X.Over (Spec (.of K))]
    (r : ℕ) (a : LineBundleClass X) : ℤ :=
  ∑ j ∈ Finset.range (r + 1), (-1 : ℤ) ^ (r - j) * (r.choose j : ℤ) *
    LineBundleClass.lift (fun L ↦ Scheme.Modules.eulerCharBelow K X L.obj (r + 1))
      (fun _ _ ⟨e⟩ ↦ Scheme.Modules.eulerCharBelow_congr K e (r + 1)) (a ^ j)

noncomputable def canonicalBundle (k : Type u) [Field k] (X : Scheme.{u}) [X.Over (Spec (.of k))]
    (n : ℕ) [SmoothOfRelativeDimension n (X ↘ Spec (.of k))] : InvertibleSheaf X :=
  haveI := SmoothOfRelativeDimension.smooth n (X ↘ Spec (.of k))
  (FiniteLocallyFreeSheaf.determinant X n).obj
    ⟨FiniteLocallyFreeSheaf.relativeDifferentials k X,
      fun x ↦ FiniteLocallyFreeSheaf.rank_relativeDifferentials_apply k n x⟩

theorem pointSeparation (k : Type u) [Field k] [IsAlgClosed k] [CharZero k]
    (X : Scheme.{u}) [X.Over (Spec (.of k))] [IsIntegral X] [X.IsProjectiveOver k]
    (n : ℕ) [SmoothOfRelativeDimension n (X ↘ Spec (.of k))]
    (L : InvertibleSheaf X) (hL : (LineBundleClass.mk L).IsAmple)
    (ℓ : ℕ) (x : Fin ℓ → X) (hx : Function.Injective x) (hcl : ∀ i, IsClosed ({x i} : Set X))
    (hZ : ∀ (Z : Scheme.{u}) [Z.Over (Spec (.of k))] [IsIntegral Z] (ι : Z ⟶ X)
      [IsClosedImmersion ι] [ι.IsOver (Spec (.of k))] (d : ℕ), 1 ≤ d →
      topologicalKrullDim Z = d →
      ((n * (n + 2 * ℓ - 1) : ℚ) / 2) ^ d <
        selfIntersection k Z d (LineBundleClass.pullback ι (LineBundleClass.mk L))) :
    ∀ i, ∃ s : Γ((InvertibleSheaf.tensorProduct (canonicalBundle k X n) L).obj, ⊤),
      x i ∈ (InvertibleSheaf.tensorProduct (canonicalBundle k X n) L).obj.nonvanishingLocus s ∧
      ∀ j, j ≠ i →
        x j ∉ (InvertibleSheaf.tensorProduct (canonicalBundle k X n) L).obj.nonvanishingLocus s := by
  sorry
```

Each fibre is one-dimensional, so the conclusion is the surjectivity in 9.12c. Repair: state 9.12c in this form, with docstrings and a pointer to the README Conventions for `(L^d · Z)`. Then rewrite the docstring entry, and with it the description's sentence "no headline is statable against the pinned Mathlib and Tau Ceti".

## C01 — Seven targets, three of them headlines, carry no theorem locator

9.12, 9.12a, 9.12b and 9.12c cite only "§6" or the reference list, and 9.13, 9.13a and 9.13b cite no source at all, so a reader cannot check them. In KOL97 (arXiv alg-geom/9601026) the matches are:

- 9.12: Theorem 6.4 (p. 35);
- 9.12a: Theorem 5.9 (pp. 30–31), with 6.5;
- 9.12b: Theorem 5.8 (p. 30), with the constant from 5.10 (p. 31);
- 9.12c: the case `ℓ = 2` follows from 5.9 with `c(k) = ½n(n+3)`, as the Check of 9.12a notes.

Please give the theorem number in Angehrn–Siu for general `ℓ`, and a source for 9.13–9.13b, or say that they are the roadmap's own.

## C02 — In the route of 9.12, "(d/c_d + ε)N" should be "(d/c_d − ε)N"

At line 125, adding `+ε` at each step is incompatible with the next sentence's claim that the total stays below `Σ_d d/c_d`. When that sum equals 1, as in 9.12b, the claim `λ < 1` would fail. The strict inequality `(N^d · Z) > c_d^d` leaves room for `−ε`, which is what KOL97 6.10 uses (line 1747).

## C03 — The route of 9.12 attributes to Kollár a method at singular points that he does not use

Lines 120–123 say that Kollár's estimate at singular points replaces multiplicity by the order along a divisor computing the log canonical threshold. KOL97 6.7.1 (line 1624) instead takes a curve through `x` whose other points are smooth, specialises divisors that are not lc at those points, and concludes with the semicontinuity 7.8. Would "by specialising from nearby smooth points (KOL97 6.7.1)" do?

## C04 — 9.12b is narrower than its source

KOL97 5.8 allows any `c(k) > 0` with `Σ k/c(k) ≤ 1` and any line bundle `M ≡ K_X + Δ + N`, on a proper pair. 9.12b fixes `c = ½n(n+1)` and requires the equality `M = K_X + Δ + N`. The general form follows by the same route from 9.12, which already carries general `c_d`. The uniform constant could remain as a Check.

## C05 — Three sentences of the description do not match the head

- "carried, with identical content, by every pull request of the family": the family index differs between the family's open heads. This roadmap's entry is at line 43 here and in 16 other heads, at line 45 in 3, and at line 48 in 21. Either name the version the others must match, or bring them into line.
- "Sub-roadmaps of the family and other roadmaps that are still in open pull requests merge first": this roadmap's suppliers are all on main, so it would be accurate to write "every supplier is on main".
- "no headline is statable": see R04.

## N01 — The references would be easier to check with identifiers

For example: Kollár, *Singularities of pairs*, arXiv alg-geom/9601026 (an open copy); Lazarsfeld, Ergebnisse 49; Angehrn–Siu, Invent. Math. 122 (1995) 291–308.

## N02 — The ids continue another roadmap's Layer 9

Because the ids continue AlgebraicModuliForArithmeticGeometry's Layer 9, "AlgebraicModuliForArithmeticGeometry §9.10" and "§9.10b here" sit side by side in consumers such as SingularHermitianMetricsAndL2Methods and are easily confused. Numbering this roadmap's own layer from 1 is an option, at the cost of updating its two consumers.

## Verified sound

| Statement | Instances tried | Values computed (README / independent) | Result | Change |
|---|---|---|---|---|
| 9.10a klt, lc | `𝔸²`, `Δ = cL`; cusp `y² = x³` | `a(L) = −c`; cusp `a = 1−2c, 2−3c, 4−6c`, lct `min(2/2, 3/3, 5/6) = 5/6`; first blow-up alone gives `c < 1` | true | none |
| 9.10a cones | cubic cone, conic cone | cubic: `E² = −3`, `K_Y·E = 3`, `a = −1` (lc, not klt); conic: `E² = −2`, `a = 0` | true | none |
| 9.10a (b) Nklt | SNC pair, log discrepancy at a centre | coefficients `< 1` at every component through the centre give log discrepancy `> 0`, so Nklt is the image of components with coefficient `≤ −1` | true | none |
| 9.10b `J` | `cL`; cusp, `5/6 ≤ c < 1`; cubic cone | `O(−⌊c⌋L)`; cusp: `0·E₁ + 0·E₂ − E₃`, pushforward `m`; cone `f_*O(−E) = m` | true | none |
| 9.10b vs `algebraicMultiplierIdeal` | smooth `X`, `Δ = cD` | `⌈K_Y − f^*K_X − c f^*D⌉ = K_{Y/X} − ⌊c f^*D⌋` (AlgebraicModuli §9.10 formula) | true | none |
| 9.10c Nadel | `ℙ²`, `c ∈ [0,1)` and `c = 1`; elliptic curve | `deg = k+3−c > 0 ⇔ k ≥ −2`; `H²(O(k)) = 0 ⇔ k ≥ −2`; `c = 1`: `H²(O(k−1)) = 0` for `k ≥ −1`; `H¹(O) = 1` | true | none |
| 9.12 vs KOL97 6.4 | hypotheses, conclusion | `Z = X` gives `N^n > 0`, so `N` is big; KOL97 has `D ≡ N`, README has `λN` and `N` | matches | C02, C03 |
| 9.12b | `ℙ¹`, `Δ = −½p`, `N = ½p+q`; `Δ = 0`, `N = O(a)` | `3/2 > 1` but `M = O(−1)`; `Δ = 0`: `a > 1 ⇔ O(a−2)` globally generated | false without `Δ ≥ 0` | R01 |
| 9.12b constant | `c_d = ½n(n+1)` | `Σ d/c_d = (n(n+1)/2)/(n(n+1)/2) = 1` | true | C04 |
| 9.12a | `ℙ¹`, `O(a)`; uniform `c(e)` | `c(1) ≥ 2 ⇒ a ≥ 3 ⇔ O(a−2)` separates; `Σ2^{1/e}e ≤ Σ(e+1) = ½n(n+3)`, `e = 1` equality | true | none |
| 9.12a step (2) | class bookkeeping | `Δ + E/m′ + (A+(q−a)N₀)/m′ = Δ + N`; budgets `h_e q/(q−a)`, sum `< 1` for large `q` | true | none |
| Summary (4) | `ℙ¹`, `Δ = −½p`, `N = ½p+2q`, `c(1) = 2` | `5/2 > 2`, `M ≡ O`: no section vanishing at exactly one point | false as written | R01 |
| 9.12c | `ℓ = 2` on `ℙ¹`; `n = 1`; budget | threshold 2, `a ≥ 3`; `deg L > ℓ ⇔ H¹(K+L−Σxᵢ) = 0`; `Σ ℓ^{1/d}d ≤ ½n(n+2ℓ−1)` | true; statable | R04 |
| 9.13 | `ℙ¹`, `O(d)`, all forms, `U = ℙ¹∖[1:0]` | `δ = d = (L¹)`; `s([1:0]) = a_d`; `Q = disc·a_d`; resultant `= c∏ξ(y)` | true | R03 |
| 9.13a (i) | Koszul vanishing range | needs `H^p(K⊗L_A⊗L^{j−p}) = 0`, `1 ≤ p ≤ D−1`, so `j ≥ D−1`; `ℙ¹`: `O(j) = s·O(j−1)` | true | R03 |
| 9.13a (ii) | `ℙ¹`, `L₂ = O(1)`, `L₂ = O` | needs `H^p(K⊗L₂⊗L^{D−p}) = 0`, `p ≤ D`; `H⁰(O) = k` onto; `H⁰(O(−1)) = 0` | true | none |
| 9.13b (a) | `ℙ^d`, `O(b)`; `ℙ²`, `L = O(2)`; `ℙ¹×ℙ¹`, `O(1,0)` | equality at `a = b`; `(2a+3)(a+1) ≤ 2(a+2)(a+1)`; `(L²) = 0` forces `b₂ < 0`, `h⁰ = 0` | true | none |
| 9.13b (b) | `ℙ¹`, `L′ = O(2)` with `⟨x², xy⟩` | `L = O(1)`, `b ≤ 2n`, `h⁰ = b+1 ≤ a+1`; steps add `(L′^i L^{d−1−i}P) ≥ 0` | true | none |

- Source locators checked against the text: KOL97 2.16, 3.3–3.5, 5.7, 5.8, 5.9, 5.10, 6.1, 6.4, 6.5, 6.6.1, 6.7.1, 6.8.1, 6.9.1, 6.10 (14 items).
- Library declarations opened at the pins: Tau Ceti `SchemeWeilDivisor` (WeilDivisor/Scheme/Basic.lean:45), `Scheme.CartierDivisor` (CartierDivisor/Basic.lean:127, needs `IsIntegral`), `LineBundleClass.intersectionNumber` (IntersectionNumber/Basic.lean:111), `Scheme.Modules.Cohomology` (Cohomology/Basic.lean:61), `InvertibleSheaf.IsGloballyGenerated` (LineBundle/GlobalGeneration.lean:139), `LineBundleClass.IsAmple` (LineBundle/Ample.lean:71), `FiniteLocallyFreeSheaf.relativeDifferentials` (Modules/Differentials/LocallyFree.lean:95), `FiniteLocallyFreeSheaf.determinant` (VectorBundle/Determinant/Basic.lean:59), `relativeDifferentialsIsoDivisorSheaf` (Modules/Differentials/Canonical.lean:170), `InvertibleSheaf.eulerDegree` (LineBundle/Degree.lean:74); no first Chern class and no Cartier-divisor pullback in Tau Ceti.
- Cross-roadmap citations resolved on main: AlgebraicModuliForArithmeticGeometry §1.6, §9.10 (`algebraicAdjointVanishing`, `algebraicMultiplierIdeal`, `bigLineBundle`), §9.11; ResolutionOfSingularitiesCharacteristicZero §§5.1, 5.5, 5.6, 7.7; SchemeAndStackFoundations Layers 2, 5 and §4.17; at open heads: the consumers' §§6.3, 8.2 (SingularHermitianMetricsAndL2Methods) and §§8.14, 8.18c, 8.18e (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties).
- Dependency check: `depcheck: 171 roadmaps, 1990 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: every check passed at this head.
- Elaboration: `Suggested.lean` elaborates with no output (no declarations, so no `#check @name` comparison was needed and no padding probe applies); the statement of 9.12c given in R04 elaborates with `sorry` as the only warning.

Overlap check: read ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, SingularHermitianMetricsAndL2Methods, SlopesOfHermitianVectorBundles, AbundanceStatement and HeightsForLogSingularMetrics (open), and AlgebraicModuliForArithmeticGeometryPartII (main); the list by results and headings was empty. Shared objects: ℚ-Cartier divisors, numerical equivalence and nefness are owned by AlgebraicModuliForArithmeticGeometryPartII §§0.7, 1.5, 1.7 (R02). Chow forms are owned by AlgebraicModuliForArithmeticGeometry §1.6 (R02). Multiplier ideals of pairs, Nadel vanishing and Angehrn–Siu belong to this roadmap, and SingularHermitianMetricsAndL2Methods cites them. Discrepancies and klt pairs also belong to this roadmap; AbundanceStatement defines them too but is never a supplier. Slopes and HeightsForLogSingularMetrics share nothing.

Source independence: 12 passages compared with 1 source (KOL97, the only readable one), none shared; largest share Lazarsfeld 2004, 3 of 6 in-text locators; contents compared with Lazarsfeld 2004: not readable. The order 9.10a → 9.10b → 9.10c → 9.12 → 9.12a–c is forced by the *Needs:* lines; 9.13–9.13b have no source.

Research link: 9.12–9.12c are the Angehrn–Siu (1995) effective freeness and point-separation theorems in Kollár's algebraic form for klt pairs (*Singularities of pairs*, 1997, Theorems 5.8, 5.9, 6.4). 9.10a–9.10c are the multiplier-ideal and Nadel-vanishing theory (Lazarsfeld 2004, Ch. 9) beneath them. This rests on the README references and on KOL97 §§5–6.

## Not verifiable

- Lazarsfeld, *Positivity in Algebraic Geometry II* (9.1.22, 9.2.19, 9.4.17, Ch. 9): paywalled; the sources service found no legal copy.
- Kollár–Mori, *Birational Geometry of Algebraic Varieties* (2.31, 2.70, §2.3): no legal copy found (publisher landing page only).
- Angehrn–Siu, Invent. Math. 122 (1995): paywalled (DOI 10.1007/BF01231446); the number of the general-`ℓ` theorem behind 9.12c is unchecked.

## Source issues

- **Error** in KOL97 at Theorems 5.8–5.9, p. 30: the theorems take a klt pair in the sense of Definition 3.5, which allows a non-effective boundary; on `ℙ¹` with `∆ = −½p`, `N = ½p+q`, 5.8 predicts a section of `O(−1)`; it should assume `∆` effective, as the proof via 2.16 does; affects a stated result.
- **Misprint** in KOL97 at 6.10 (Step 4), p. 39: for a centre `Z` of codimension `j` the step takes `H = ((j+1)/c(j+1) − ε)N` and asks `(H^j·Z) > j^j`; it should use `k = dim Z = n − j`, `H = (k/c(k) − ε)N` and `(H^k·Z) > k^k`; affects the proof.

## For the human reviewers

- Not tested: Lazarsfeld 2004, the source with the largest share of locators (3 of 6), could not be read; its wording and contents were not compared, nor those of Kollár–Mori or Angehrn–Siu.
- Scope of sources: 9.13, 9.13a and 9.13b cite no source. The family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, lines 9–14) says the family follows a formal Lean proof announced on 20 November 2026; I did not open it.
- The family index differs between the family's open pull requests (C05); which version is canonical is for the humans who merge them.
