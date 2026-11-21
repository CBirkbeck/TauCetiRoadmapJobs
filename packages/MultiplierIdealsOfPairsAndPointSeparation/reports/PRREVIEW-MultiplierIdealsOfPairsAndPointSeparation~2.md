# Review of MultiplierIdealsOfPairsAndPointSeparation (pull request #2911 at 46f6b1a)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/MultiplierIdealsOfPairsAndPointSeparation/`
**Verdict:** accepted

**Summary.** Accepted, with no findings. This head repairs all four findings of the last round: the effective boundary is now assumed, the missing inputs are stated here as targets or cited to owners that state them, 9.13 and 9.13a are over any field of characteristic zero, and 9.12c is stated in `Suggested.lean`. The adversarial pass found no false statement, Check or Lean signature. There are four small corrections, none blocking: 9.10d (a) overlaps a nef form in ArakelovGeometryAndAbelianHeightsPartII §0.3, one ownership sentence in the description is out of date, 9.12c gives no theorem number for Angehrn–Siu, and 9.13a (i) understates its own range. Humans decide on the second plan of klt varieties in AbundanceStatement and on the three texts that could not be read.

## C01 — 9.10d (a) states, for ample sheaves, the leading term that ArakelovGeometryAndAbelianHeightsPartII §0.3 (1′) already states for nef bundles, without citing it

As written, the library plans asymptotic Riemann–Roch twice. ArakelovGeometryAndAbelianHeightsPartII is a new roadmap, open and just above this one in the merge order. At its head, §0.3 (1′) states that over any field `vol(L) = (L^d)` for a nef line bundle on a projective variety, and its route calls this "asymptotic Riemann–Roch for a nef bundle". 9.10d (a) (lines 118–119) is the ample case of that statement. Its extra content is the `O(m^{d−1})` error term and the positivity of `(A^d · Z)`, which come from `hilbertPolynomial` (AlgebraicModuliForArithmeticGeometry §1.5) and CyclotomicClassGroupsAndStickelberger §4.3, both already cited. The routes of 9.12 and 9.12a need only the leading term.

The smallest repair would cite §0.3 (1′) in 9.10d (a) and in the supplier contracts, keeping (a) for the error term it adds. Alternatively, cite (1′) directly in the routes of 9.12 and 9.12a. Either way, the description's merge-order paragraph would then name that pull request.

## C02 — The description's reason for owning 9.10a's pullback and 9.10d is contradicted by two open roadmaps

The description says these "are targets here because no roadmap on main or in an open pull request states them as targets". Two open roadmaps do:

- ArakelovGeometryAndAbelianHeightsPartII §0.3 (1′) states the nef form of asymptotic Riemann–Roch (C01).
- AbundanceStatement, Layer 1 item 5 at its head, plans the pullback `f^*D = (1/r) f^*A` of ℚ-Cartier divisors along dominant morphisms of normal varieties.

Kodaira's lemma is indeed stated by no other roadmap; SingularHermitianMetricsAndL2Methods §2.6 uses it only inside a route. Text that would be right: "Kodaira's lemma (9.10d (b)) is stated by no other roadmap. The pullback of ℚ-Cartier Weil divisors (9.10a) is also planned by AbundanceStatement, which can never be a supplier. Asymptotic Riemann–Roch is stated here for ample sheaves with its error term; its leading term for nef bundles is ArakelovGeometryAndAbelianHeightsPartII §0.3 (1′)."

## C03 — Headline 9.12c cites Angehrn–Siu 1995 without a theorem number or page

The general-ℓ case is the only one that Kollár 1997 (5.5 with 5.10, which covers ℓ ≤ 2) does not cover, so a reader cannot check the statement that matters. In 9.12c, line 261, the citation reads "(Angehrn–Siu 1995; for ℓ = 1 and ℓ = 2, …)". The sources manifest records only the page range of the whole article. Give the theorem number and printed page of the point-separation theorem in Invent. Math. 122 (1995). The constant can be checked independently: `ℓ^{1/d} ≤ 1 + (ℓ − 1)/d` gives `Σ_d ℓ^{1/d} d ≤ ½n(n + 2ℓ − 1)`, and on `ℙ¹` the threshold `ℓ` is sharp.

## C04 — 9.13a (i) is stated for `j ≥ D`, but its own route proves it for `j ≥ D − 1` and every `a`

The clause "for `a = 1` this holds already for `j ≥ D − 1`" (line 327) reads as if `a ≥ 2` needed `j ≥ D`. It does not:

- The Koszul argument for `a = 1` needs `H^p(K_R ⊗ L_A ⊗ L^{j−p}) = 0` for `1 ≤ p ≤ D − 1`, which holds for `j ≥ D − 1`.
- The step from `a` to `a + 1` applies case `a` with `j + 1` and case `1` with `j`, so the threshold stays at `D − 1`.
- Example: on `ℙ²` with `L = O(1)`, `L_A = O(3)`, `a = 2`, `j = 1`, every cubic in `(x, y)²` is `x²ℓ₁ + xyℓ₂ + y²ℓ₃` with linear `ℓ_i`.

Either state (i) for `j ≥ D − 1`, or keep `j ≥ D` (the consumer's range) and drop the clause.

## Questions for the author

- 9.12 and 9.12b are stated over any algebraically closed field of characteristic zero, while 9.12a is stated over `ℂ`. All three pass through Kollár 1997, 6.7.1, whose specialisation step uses 7.8, a statement over `ℂ`. Is the Lefschetz principle the intended passage for 9.12? If so, does 9.12a hold in the same generality? The routes do not say, and the step that would carry it is not written out.

## Earlier findings

- R01 (`Δ ≥ 0`): repaired. 9.12 (line 150), 9.12b (line 236), Summary items (2) and (4), and the docstring entry for 9.12b (line 43) now say "with `Δ` effective". The Check at line 254 records the `(ℙ¹, −½p)` counterexample.
- R02 (inputs credited to sections that do not state them): repaired.
  - Kodaira's lemma and asymptotic Riemann–Roch are now the target 9.10d.
  - 9.12 opens with "First reduce to ample `N` (Kollár 1997, 6.6.1)".
  - The pullback of ℚ-Cartier divisors is defined in 9.10a.
  - Nefness, bigness and Kleiman's nonnegativity are cited to AlgebraicModuliForArithmeticGeometryPartII §§1.5–1.7, and the Chow form to `chowParameters`.
  - Every one of these citations was resolved and states what it is cited for. C01 concerns an overlap, not a wrong citation.
- R03 (number fields): repaired. 9.13 and 9.13a open with "Let `k` be a field of characteristic zero".
- R04 (9.12c statable): repaired. `adjoint_separates_points` states it.
- C01 (locators): partly repaired. 9.12 now cites "Theorem 6.4, p. 35", 9.12a "Theorem 5.9, pp. 30–31, with Theorem 6.5", and 9.12b "Theorem 5.8, p. 30". 9.13–9.13b are declared "this roadmap's own formulations". 9.12c still lacks an Angehrn–Siu locator (C03 above).
- C02: repaired ("`(d/c_d − ε)N`", line 171).
- C03: repaired ("by specialising from nearby smooth points (Kollár 1997, 6.7.1)").
- C04: repaired (general `c_d`, and `M` numerically equivalent to `K_X + Δ + N`).
- C05: repaired. The description now says the family indexes differ and names the open supplier.
- N01: repaired (arXiv id, series and journal given).
- N02: not taken; it was offered as an option.

## Verified sound

| Statement | Instances tried | Values computed (README / independent) | Result | Change |
|---|---|---|---|---|
| 9.10a klt, lc | `𝔸²`, `c·L`; cusp `y² = x³` | `a(L) = −c`; cusp `1−2c, 2−3c, 4−6c`, klt iff `c < 5/6`; first blow-up alone gives `c < 1` | true | none |
| 9.10a cones | cubic cone, conic cone | cubic: `E² = −3`, `K_Y·E = 3`, `a = −1` (lc, not klt); conic: `E² = −2`, `a = 0` | true | none |
| 9.10a pullback | `rD = [A]`, `X` normal; `D ≥ 0` | Cartier-to-Weil injective ⇒ `A` effective; Stacks 02OO case (2) covers integral dominant `f` | true | none |
| 9.10b `J` | `cL`; cusp `5/6 ≤ c < 1`; cubic cone | `O(−⌊c⌋L)`; round-ups `0, 0, −1, 0` ⇒ `m`; `f_*O(−E) = m` | true | none |
| 9.10b vs `algebraicMultiplierIdeal` | smooth `X`, `Δ = cD` | `⌈K_Y − π^*K_X − cπ^*D⌉ = K_{Y/X} − ⌊cπ^*D⌋`, the §9.10 formula | true | none |
| 9.10c Nadel | `ℙ²`, `c ∈ [0,1)`, `c = 1`; elliptic curve | `k+3−c > 0 ⇔ k ≥ −2 ⇔ H²(O(k)) = 0`; `c = 1`: `k ≥ −1`; `h¹(O) = 1` | true | none |
| 9.10c vs KOL97 2.16 | hypotheses | 2.16: normal proper, `Δ ≥ 0`, `N ≡ K+Δ+M`, `M` nef big; vanishing for the cosupport ideal | supported | none |
| 9.10d (a) | `ℙ^d`, `O(1)`; vs Arakelov II (1′) | `binom(m+d, d) = m^d/d! + O(m^{d−1})`; `(O(1)^d) = 1`; (1′) gives leading term for nef | true; overlaps | C01 |
| 9.10d (b) | `Bl_pℙ²`, `O(h)`; `ℙ¹×ℙ¹`, `O(1,0)` | `(2h−e)·e = 1`, `(2h−e)(h−e) = 1`, `(2h−e)² = 3`; `O(ν−a, −b)` has fibre degree `−b` | true | none |
| 9.12 vs KOL97 6.4 | hypotheses, conclusion, `λ < 1` | 6.4: projective klt, `N` nef big, `D ≡ N`, lc / punctured klt / not klt; 5.8 proof uses `(1−ε)N` | matches | none |
| 9.12 route step | `H = (d/c_d − ε)N` | `(H^d·Z) > d^d` needs a margin on `(N^d·Z) > c_d^d`, given by values in `r^{−d}ℤ` | true | none |
| 9.12a | `ℙ¹`, `N = O(a)`; uniform `c(e)` | `c(1) ≥ 2 ⇒ a ≥ 3 ⇔ O(a−2)` separates; `Σ(e+1) = ½n(n+3)` via `2^{1/e} ≤ 1+1/e` | true | none |
| 9.12a budgets | steps (1), (3) | `h_e > 2^{1/e}e/(N^e·Z)^{1/e}` uniformly; `Σh_e < Σ 2^{1/e}e/c(e) ≤ 1` | true | none |
| 9.12b | `(ℙ¹, −½p)`, `N = ½p+q`; `Δ = 0`, `O(a)` | non-effective: `3/2 > 1`, `M = O(−1)`; `Δ = 0`: `a > 1 ⇔ O(a−2)` generated | true with `Δ ≥ 0` | none |
| 9.12b constant | `c_d = ½n(n+1)` | `Σ d/c_d = 1` | true | none |
| 9.12c | `ℙ¹`, `ℓ` points; `ℙ²`, `O(2)`, `O(3)`, `O(6)` | threshold `ℓ`: `a ≥ ℓ+1 ⇔ H¹(O(a−2−ℓ)) = 0`, sharp; `O(2)` fails hypothesis; `O(3)` free; `O(6)` separates two | true | C03 |
| 9.12c constant | `ℓ^{1/d} ≤ 1 + (ℓ−1)/d` | `Σ_{d=1}^n (d + ℓ − 1) = ½n(n + 2ℓ − 1)` | true | none |
| `adjoint_separates_points` | `n = 0`; `ℓ = 0`; `#check @` | `n = 0`: `X` a point, `hZ` vacuous, `ℓ ≤ 1`, `K⊗L ≅ O`; `ℓ = 0` vacuous; all binders present | true; equals README | none |
| `selfIntersection` | `r = 1`; `ℙ^d`, `O(1)` | `r = 1`: `χ(a) − χ(O)`, Tau Ceti `eulerDegree`; `d`-th difference of `binom(m+d, d)` is `1` | true | none |
| `canonicalBundle` | `ℙ¹`; `n = 0` | `det Ω_{ℙ¹} = O(−2)`; rank `0` gives `O` | true | none |
| 9.13 | `ℙ¹`, `O(d)`, all forms, `U = ℙ¹∖[1:0]` | `δ = d = (L¹)`; `s([1:0]) = a_d`; `Q = disc·a_d`; resultant `= c∏ξ(y)` | true | none |
| 9.13a (i) | Koszul range; `ℙ²`, `O(1)`, `L_A = O(3)`, `a = 2`, `j = 1` | needs `H^p(F⊗L^{j−p}) = 0`, `p ≤ D−1` ⇒ `j ≥ D−1`; cubics in `(x,y)²` divide | true; range understated | C04 |
| 9.13a (ii) | `ℙ¹`, `L₂ = O(1)`, `L₂ = O` | needs `H^p(F⊗L^{D−p}) = 0`, `p ≤ D`; `H⁰(O) = k` onto; `H⁰(O(−1)) = 0` | true | none |
| 9.13b (a) | `ℙ^d`; `ℙ²`, `O(2)`; `ℙ¹×ℙ¹`, `O(1,1)`, `O(1,0)`; curves | equality at `a = b`; `(a+1)(2a+3) ≤ 2(a+1)(a+2)`; `(a+1)(a+2)` attained; `(L²) = 0` ⇒ `h⁰ = 0` | true | none |
| 9.13b (b) | `ℙ¹`, `L′ = O(2)`, `⟨x², xy⟩` | `L = O(1)`, `b ≤ 2n`, `2n < a+1 ⇒ b+1 ≤ a+1`; each step adds `(L′^iL^{d−1−i}·P) ≥ 0` | true | none |

- Source locators checked against the text: KOL97 2.16, 3.3–3.5, 3.8, 5.5, 5.8, 5.9, 5.10, 6.4, 6.5, 6.6.1, 6.6.2, 6.7.1, 6.8.1, 6.10, 6.11, 7.8 (pp. 13–39); ESVI92 Definition 5.3 and Properties 5.4 d) (printed p. 44); STACKS-DIVISORS 01WV, 02OO; STACKS-VARIETIES 0BEP, 0BJ8.
- Library declarations opened at the pins (Tau Ceti):
  - `Scheme.Modules.eulerCharBelow` (Cohomology/EulerCharacteristic.lean);
  - `LineBundleClass` (LineBundle/Class.lean:50, `CommGroup` at :142) and `LineBundleClass.lift` (:63);
  - `LineBundleClass.pullback` (LineBundle/Functoriality.lean:136) and `LineBundleClass.IsAmple` (LineBundle/Ample.lean:71);
  - `nonvanishingLocus` (LineBundle/NonvanishingLocus.lean:82) and `InvertibleSheaf.tensorProduct` (LineBundle/TensorProduct.lean:65);
  - `Scheme.IsProjectiveOver` (ProjectiveSpectrum/ProjectiveOver.lean:57) and `eulerDegree` (LineBundle/Degree.lean:74, :130);
  - `intersectionNumber` (IntersectionNumber/Basic.lean:111), `SchemeWeilDivisor` (WeilDivisor/Scheme/Basic.lean:45) and `Scheme.CartierDivisor` (CartierDivisor/Basic.lean:127).
  - Every Tau Ceti name in the README and the module docstring resolves under `#check`.
- Cross-roadmap citations resolved:
  - On main: AlgebraicModuliForArithmeticGeometry §§1.5, 1.6 and 9.10 (`hilbertPolynomial`, `chowParameters`, `bigLineBundle`, `algebraicAdjointVanishing`, `algebraicMultiplierIdeal`, `uniformAdjointVeryAmpleness`); AlgebraicModuliForArithmeticGeometryPartII §§0.7, 1.5, 1.6, 1.7 (ii); CyclotomicClassGroupsAndStickelberger §4.3; ResolutionOfSingularitiesCharacteristicZero §§5.1, 5.5, 5.6, 7.7; SchemeAndStackFoundations §2.2, `ample_serre_vanishing` (Layer 2), §4.17, §5.2, §5.3 `eq_cartier_divisor`, §5.6 `proper_intersection`.
  - At open heads: DynamicalDegreesOfRationalMaps §2.2; the consumers SingularHermitianMetricsAndL2Methods §§2.6, 6.3 (b), 8.2 and ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §§8.14, 8.18c, 8.18e.
- Dependency check output: `depcheck: 171 roadmaps, 1993 edges, 0 problem(s)`. The open supplier DynamicalDegreesOfRationalMaps is the line directly above this roadmap in the merge order.
- Automatic checks: every check passed at this head; none was set aside.
- Elaboration: `Suggested.lean` elaborates with the single warning `declaration uses sorry` (line 105). `#check @` of the three declarations matches the README with every binder present. The one-tactic probe (`simp`) leaves `adjoint_separates_points` open, so nothing is padding.
- The pull request changes nothing outside this folder and the family index.

Overlap check: read DynamicalDegreesOfRationalMaps, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, AbundanceStatement, SingularHermitianMetricsAndL2Methods, SlopesOfHermitianVectorBundles (open), and AlgebraicModuliForArithmeticGeometryPartII and AlgebraicModuliForArithmeticGeometry (main); the list by results and headings was empty, and ArakelovGeometryAndAbelianHeightsPartII (open) was found by search. Shared objects and their owners:
- Numerical intersections: CyclotomicClassGroupsAndStickelberger §4.3 and DynamicalDegreesOfRationalMaps §2.2, both cited.
- ℚ-Cartier divisors, nefness, bigness and Kleiman's nonnegativity: AlgebraicModuliForArithmeticGeometryPartII, cited.
- Chow forms: AlgebraicModuliForArithmeticGeometry §1.6, cited. SlopesOfHermitianVectorBundles §6.7 takes the Chow-form factorisation only as a hypothesis.
- Asymptotic Riemann–Roch: the nef leading-term form is ArakelovGeometryAndAbelianHeightsPartII §0.3 (1′) (C01).
- Kodaira's lemma: owned here; SingularHermitianMetricsAndL2Methods §2.6 uses it only in a route.
- Discrepancies, klt, and the pullback of ℚ-Cartier divisors: owned here for pairs. AbundanceStatement (never a supplier) plans them for `Δ = 0`; this is left to the human reviewers.
- Multiplier ideals of pairs, Nadel vanishing and Angehrn–Siu: owned here and cited by the two consumers.

Source independence: 15 passages compared with 4 sources (KOL97, ESVI92, STACKS-DIVISORS, STACKS-VARIETIES), none shared beyond forced formulas and standard terms; largest share KOL97, 14 of 23 in-text locators; contents compared with KOL97 (§§2, 3, 5, 6 against 9.10a–9.12c): independent. Its order is §3 → §2 → §6 → §5 with 9.10d and 9.13–9.13b outside it. The order 9.10a → 9.10b → 9.10c → 9.12 → 9.12a–c is forced by the *Needs:* lines. LAZ04, Kollár–Mori and ANGSIU95 were not readable.

Research link: 9.12–9.12c are the Angehrn–Siu (1995) effective freeness and point-separation theorems toward Fujita's conjecture, in Kollár's algebraic form for klt pairs (Singularities of pairs, 1997, Theorems 5.8, 5.9, 6.4). 9.10a–9.10c are the multiplier-ideal and Nadel-vanishing theory beneath them (Lazarsfeld 2004, Ch. 9). This rests on the README references and on KOL97 §§5–6.

## Not verifiable

- ANGSIU95 (Invent. Math. 122, 1995): settled as uncertified (paywalled), so the theorem behind general `ℓ` in 9.12c is unchecked.
- LAZ04, 9.1.22, 9.2.19 and 9.4.17: settled as uncertified. The statements of 9.10b and 9.10c were checked against KOL97 2.16 instead.
- Kollár–Mori 1998, 2.31 and 2.70 (routes of 9.10a and 9.10c, and the References): the roadmap's sources manifest has no entry for it, and no legal copy is known, so it was not read.

## Source issues

- **Misprint** in KOL97 at 5.10, p. 31: the source takes `c(k) = binom(n+2, 2)` and a strict `Σ 2^{1/k}k < binom(n+2, 2) − 1`, which is an equality at `n = 1`, and this `c(k)` yields only `m > binom(n+2, 2)`; it should take `c(k) = binom(n+2, 2) − 1` with `≤`, which gives 5.5.2 as stated; affects the proof.
- **Error** in KOL97 at Theorems 5.8–5.9, p. 30: the source allows klt pairs with a non-effective boundary (3.5); on `ℙ¹` with `∆ = −½p`, `N = ½p + q`, 5.8 predicts a section of `O(−1)`; it should assume `∆` effective, as 2.16 in its proof does; affects a stated result.
- **Gap** in KOL97 at Theorems 5.8–5.9, p. 30: the source states them for proper pairs but proves them through 6.4–6.5, which assume a projective pair; it should assume `X` projective or reduce the proper case to it; affects the proof.
- **Misprint** in KOL97 at the proof of 6.10.1, p. 39: for a centre `Z` of codimension `j` the source takes `H = ((j+1)/c(j+1) − ε)N` with `(H^j·Z) > j^j`; it should use `k = dim Z`, `H = (k/c(k) − ε)N` and `(H^k·Z) > k^k`; affects the proof.

## For the human reviewers

- Ownership: AbundanceStatement (open, by another author, on the list of roadmaps that are never suppliers) plans for `Δ = 0` the pullback of ℚ-Cartier divisors, canonical divisors and klt. These are its Layers 1–3, README lines 150–154 and 196–220 at its head. 9.10a plans the same objects for pairs.
- Not tested: LAZ04, Kollár–Mori 1998 and ANGSIU95 could not be read, so wording and arrangement were not compared with them. KOL97, the source with the largest share, was compared.
- Family scope: the family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, lines 9–14), part of this pull request, says the family follows a formal Lean proof of RH for Dirichlet L-functions announced on 20 November 2026. I did not open it. This roadmap's own sources are published works.
