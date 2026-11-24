# Review of MultiplierIdealsOfPairsAndPointSeparation (pull request #3027 at 3bddf73)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/MultiplierIdealsOfPairsAndPointSeparation/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 289 changed lines since `b8f3652`. The *Origin:*, *Method of the formal proof:* and *Corollary of:* lines, the two-point statement of 9.12c with its wider form, the deduction of 9.13a (i) and the `*Needs:*` lines that now cite sections were checked against Kollár, Esnault–Viehweg, the Stacks project, Ein–Lazarsfeld and Ein–Lazarsfeld–Smith, against AlgebraicModuliForArithmeticGeometryPartII §§1.6a, 1.7a, 6.1–6.8 and AlgebraicModuliForArithmeticGeometry §9.12 at this head, and against the README on `main`. Every corollary claim holds at the generality stated and there is no finding. Accepted, with six small corrections and one format note, none blocking; they are those of the previous review, which this head does not take up. Three facts about 9.12c and the restated sections are listed for the human reviewers.

## C01 — 9.10a and 9.10b define the discrepancy, klt and lc pairs, the non-klt locus and `J(X, Δ)` again, without saying that these are the objects of AlgebraicModuliForArithmeticGeometryPartII §§6.1–6.2 that their *Corollary of:* lines rest on

An implementer who reads 9.10a (lines 60–69) and 9.10b (lines 147–148) would build a second discrepancy and a second multiplier ideal beside that roadmap's *pairDiscrepancy* and *pairMultiplierIdeal*, whose definitions agree with these clause for clause. The *Corollary of:* lines (57–58, 142–145) deduce (a), (b), the first clause of (c) and the API of 9.10b from theorems about those objects, so the deduction assumes that the two definitions are one. Scope and ownership also lists the objects among the sections owned here (line 705) and, in the next paragraph, among what AlgebraicModuliForArithmeticGeometryPartII owns (line 707).

One sentence in each section would settle it, for example "The discrepancy, klt and lc pairs and `Nklt(X, Δ)` are those of AlgebraicModuliForArithmeticGeometryPartII §6.1" and "`J(X, Δ)` is the multiplier ideal of AlgebraicModuliForArithmeticGeometryPartII §6.2"; the ownership paragraph would add "with the definitions of AlgebraicModuliForArithmeticGeometryPartII §§6.1–6.2".

## C02 — The Lean file calls the ℓ-point statement "the remark of 9.12c", a name the README does not use

The module docstring (`Suggested.lean` lines 20–21) and the docstring of `adjoint_separates_points` (lines 103–104 and 113–114) point to "the remark of 9.12c". The README sets that statement apart under **Wider form** (line 467) and calls it "the wider form of 9.12c" everywhere else (lines 5, 13, 26, 39, 394, 689), so a reader who looks for "the remark" finds nothing. Replace "the remark of" by "the wider form of" in the three places.

## C03 — 9.10a's *Origin:* cites Kollár's Definition 3.5 for the discrepancy and the non-klt locus, which Kollár defines in 3.3 and 5.7

In line 43 (and in the Kollár entry of the References, line 747) only Definition 3.5 is named. In the text, Definition 3.3 (KOL97 line 654, pp. 15–16) defines the discrepancy, Definition 3.5 (KOL97 line 703, pp. 16–17) defines klt and lc, and Definition 5.7 (KOL97 line 1342, p. 30) defines the non-klt locus. Cite "Definitions 3.3, 3.5 and 5.7", as AlgebraicModuliForArithmeticGeometryPartII §6.1 does.

## C04 — Three works named in the new *Origin:* lines have no locator, and one is not in the References

9.13's *Origin:* (lines 512–513) cites Chow and van der Waerden (1937) and Jouanolou (1983) with no theorem, section or page, and 9.13b's *Origin:* (lines 646–647) names "Kollár and Matsusaka" with no year and no entry under References, so none of the three attributions can be checked. Give for each the theorem or section meant (for Jouanolou, which Bertini theorem), and add the Kollár–Matsusaka paper to the References; presumably J. Kollár and T. Matsusaka, *Riemann–Roch type inequalities*, Amer. J. Math. 105 (1983).

## C05 — The Labels paragraph says that [FormalProof] has a statement of every section, but 9.10d records none

Lines 23–24 say "[FormalProof] has a statement of each section". The statement of 9.10d (lines 240–249) names no declaration of [FormalProof], and the [FormalProof] entry of the References (line 754) lists 9.10a–9.10c, 9.12–9.12c and 9.13–9.13b and leaves 9.10d out, while 9.10d's method label (lines 230–235) says how [FormalProof] proves (a) for nef sheaves. One of the two is out of date: either record at 9.10d the form [FormalProof] has, with its declaration as in the other sections, and add 9.10d to the References entry, or say in the Labels paragraph that 9.10d is the exception.

## C06 — The description's list of sections that keep a statement wider than the proof's form leaves out 9.12c

The description says that such a section "now states the proof's form and the general roadmap the general theorem, except where" it is only a remark, or keeps the general statement (it names CongruenceModulesOfThetaLifts 7.16a (2), BaseChangeAndGaloisRepresentationsForUnitaryGroups 16.1, FiniteReductiveGroups 0.1, 0.3, 2.2 and HeckeIdealsAndTaylorWilesRelations 10.1). 9.12c is another: it now states the two-point form over `ℂ` and keeps its former statement beside it as its wider form, ℓ points over every algebraically closed field of characteristic zero, wider than AlgebraicModuliForArithmeticGeometryPartII §6.8 over `ℂ`; that wider form is still headline (3) and the only theorem of `Suggested.lean`. The list would add "and MultiplierIdealsOfPairsAndPointSeparation 9.12c, which keeps its former ℓ-point statement over every algebraically closed field of characteristic zero as a wider form".

## N01 — Supplier names in the AlgebraicModuliForArithmeticGeometryPartII contract

In line 717 six of that roadmap's proposed names (`pairDiscrepancy`, `pairMultiplierIdeal`, `pairNadelVanishing`, `isolatedNonKltCentre`, `adjointGlobalGeneration`, `kollarTwoPointSeparation`) are in code font, while that roadmap sets them in italics as names its `Suggested.lean` does not declare; the one it declares is `PointSeparation.angehrnSiuPointSeparation` (its `Suggested.lean`, line 550), not `angehrnSiuPointSeparation`. Write the six in italics or prose and give the declared name in full.

## Previous findings

The previous review had no finding. Its six small corrections and its format note stand unchanged at this head (C01–C06 and N01 above, under the same numbers): since the head it read, only four `*Needs:*` lines changed (9.10d, 9.12, 9.12a: "Layer 2 (Serre vanishing)" became §2.6 `ample_serre_vanishing`, and 9.12a's log resolutions gained §§5.1, 5.5–5.6, 7.7), and both citations resolve on `main`.

## Verified sound

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| 9.10a, *Corollary of:* §6.1 | hypotheses side by side; `𝔸²` with `c·L`; cusp; cones | both: normal integral, char 0, `K+Δ` ℚ-Cartier; klt iff `c<1`; cusp `1−2c, 2−3c, 4−6c`, klt iff `c<5/6`; cubic cone `−1`, conic cone `0` | (a), (b), first clause of (c) are §6.1's; C01, C03 |
| 9.10b, *Corollary of:* §6.2, monotonicity | `Δ−Δ′=(K+Δ)−(K+Δ′)` ℚ-Cartier; `𝔸²`, `Δ=L`, `Δ′=½L` | `J(Δ)=O(−L) ⊆ J(Δ′)=O`; `⌈K_{Y/X}−cf^*D⌉ = K_{Y/X}−⌊cF⌋` | holds; five clauses are §6.2's |
| 9.10c (headline 1), §6.3 | `ℙ²`, `c<1`, `k=−2,−3`; `c=1`, `k=−1`; elliptic curve, `L=O` | degree `k+3−c`: `k=−3` gives `−c≤0`; `H²(O(−3))≠0`; `c=1`: `H^i(O(−2))=0`; `h¹(O)=1` | identical statements; KOL97 line 538 supports |
| 9.10d, §§1.7a, 1.6a | `ℙ²`, `O(1)`; blow-up of `ℙ²`; `ℙ¹×ℙ¹`, `O(1,0)` | `(m+1)(m+2)/2 ~ m²/2!`; `(2h−e)·e=1`, `(2h−e)(h−e)=1`, `(2h−e)²=3`; fibre degree `−b≤0` | (a), (b) covered; Checks true; C05 |
| 9.12, §6.5 | here `N` nef, `c_d∈ℚ`; there nef and big, `c_d∈ℝ`; `(1−ε)N` | `Z=X`: `(Nⁿ)>c_nⁿ>0`, so big; margin in `r^{−d}ℤ` keeps `((1−ε)N)^d·Z > c_d^d` | corollary holds; KOL97 lines 1555, 1376–1379 |
| 9.12a (headline 4), §6.7 | `ℙ¹`, `N=O(a)`, `a=2,3` | `a>c(1)≥2`: `a=3` gives `O(1)`, separates; `a=2` gives `O`, constants only, hypothesis also fails | identical; KOL97 lines 1362, 1572 |
| 9.12b (headline 2), §6.6, method label | `ℙ¹`, `c_1=1`, `a=1,2`; `(ℙ¹, −½p)`, `N=½p+q`; `N=(m−½)N₁+N′` | `a=1`: `O(−1)`, no section; `deg(K+Δ+N)=−2−½+3/2=−1`; `m−½ ≥ ½n(n+1)+½`; residual `½N₁` | holds; `Σ d/c_d = 1` for `c_d=½n(n+1)` |
| 9.12c, two-point form over `ℂ` | `c(e)=½n(n+3)`, `n=1,2`; `ℙ¹`, `B=O(3)` | `Σ2^{1/e}e`: `2≤2`; `2+2√2≈4.83≤5`; `Σ(e+1)=½n(n+3)`; `O(1)` separates | from 9.12a at `Δ=0`; true |
| 9.12c wider form (headline 3), §6.8, Lean | `ℓ=1`: `½n(n+1)`; `ℓ=2`: `½n(n+3)`; `ℙ¹`, `ℓ=2`; `n=0`; `ℓ=0` | thresholds match 9.12b, 9.12a; `a>2`; `n=0`: a point, `ℓ≤1`, `O` has a unit; `ℓ=0` vacuous; threshold in ℚ, no ℕ subtraction | elaborated type equals README statement |
| wider form, `ℓ≤2` from Kollár 5.8 and 5.9 | sections `s`, `t` with `s(x₁)≠0`, `s(x₂)=0`, `t(x₂)≠0` | evaluation matrix `[[s(x₁),0],[t(x₁),t(x₂)]]`, determinant `≠0` | surjectivity follows |
| integrality remark of the wider form | `(L^d·Z)∈ℤ`, `T=½n(n+2ℓ−1)` | `(L^d·Z)>T^d` iff `≥⌊T^d⌋+1 ≥ (T+κ_d)^d`; `κ=min κ_d` over `d≤n` | same condition |
| 9.13 | `R=ℙ¹`, `L=O(d)`, all binary forms | `δ=d=(L¹)`; `s(1,0)` = coefficient of `x^d`; discriminant `≠0` iff `d` simple roots | Check true; C04 |
| 9.13a (i) from AlgebraicModuliForArithmeticGeometry §9.12 | `m=n=D`, `k=a`, `ℓ=D+a−1`; `ℙ¹`, `a=j=1`; `ℙ²`, `j=2`, `a=1` | `ℓ ≥ min(D+a−1, D+a)`; `A−ℓD = L_A⊗L^{j−D+1}`; `I_ℓ=I_Z^a`, `I_{ℓ−k}=I_{D−1}=O`; linear forms through `P` are `s₁m₁+s₂m₂` | holds over `ℂ` for `a≥1`, `j≥D−1` |
| identity `I_ℓ = I_Z^{ℓ+1−D}` | blow-up of a smooth centre of codimension `D` | `K_{Y/R}=(D−1)F`: `μ_*O(−(ℓ+1−D)F) = I_Z^{ℓ+1−D}`; ELS proof of 2.2, pp. 7–8 | holds; EL Prop. 1.2 (ii), p. 12 |
| 9.13a route and (ii) | Koszul degrees; `ℙ¹`, `L₂=O(1)`, `L₂=O` | needs `H^q(F⊗L^{l−q})=0`, `q≤D−1`: `l≥D−1`; (ii) needs `H^D(K_R⊗L₂)=0`; `H⁰(O)=k` onto; `H⁰(O(−1))=0` | consistent with `j≥D−1` |
| 9.13b | `ℙ^d`, `B=O(b)`, `a=b`; curve; `ℙ¹`, `⟨x², xy⟩`; `(L^d)=0` | `binom(b+d,d)`, equality; `deg B<(a+1)δ` gives `h⁰≤deg B+1≤(a+1)δ`; `b≤2n`; hypothesis forces `(B·L^{d−1})<0`, `h⁰=0` | Checks true; C04 |

- Source locators read in the text: KOL97 Theorem 2.16 (line 538, p. 13), Definitions 3.3 and 3.5 (lines 654, 703), Lemmas 3.10–3.11 and Corollary 3.12 (lines 784–844, pp. 18–19), Definition 5.7 (line 1342), 5.8–5.10 (lines 1349–1408, pp. 30–31), 6.4, 6.5, 6.6.1, 6.7.1, 6.8.1, 6.9.1 (lines 1555–1720, pp. 35–38); ESVI92 5.4 d) (line 1735); STACKS-VARIETIES 0BEP, 0BES, 0BJ8 (lines 4754, 4784, 4868); STACKS-DIVISORS 01WV, 02OO (lines 1054, 1060); Ein–Lazarsfeld 1999 Proposition 1.2 (ii) (arXiv:math/9810004, p. 12); Ein–Lazarsfeld–Smith 2001 Theorem 2.2 and proof (arXiv:math/0005098, pp. 7–8).
- Cross-roadmap citations resolved at this head or on `main`: AlgebraicModuliForArithmeticGeometryPartII §§0.7, 1.5, 1.6, 1.6a, 1.7, 1.7a, 3.3, 6.1–6.3, 6.5–6.8; AlgebraicModuliForArithmeticGeometry §§9.10, 9.12 (with its Check on reduced points); SchemeAndStackFoundations §§0.9, 2.2, 2.6, 3.4, 4.12, 4.13, 4.17, 5.2, 5.3; ResolutionOfSingularitiesCharacteristicZero §§5.1, 5.5, 5.6, 7.7. Neither general roadmap cites this one back.
- Record: no heading added or removed and no Lean declaration added or removed. The statement 9.12c had on `main` stands as its wider form; only its Angehrn–Siu route over `ℂ` left, and AlgebraicModuliForArithmeticGeometryPartII §6.8 states that theorem with that route.
- Automatic checks: all passed. Dependency check: `depcheck: 40 roadmaps, 502 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` gives only the `sorry` warning (line 115). The elaborated types of the three declarations were compared with the README: no binder is lost, and the threshold is `(↑n * (↑n + 2 * ↑ℓ - 1) / 2) ^ d` in ℚ. The one theorem is deep (by reading: no one-tactic proof), not padding.
- No other open pull request changes this folder, and none drops an id it cites.

Overlap check: read ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, DynamicalDegreesOfRationalMaps, HeightsForLogSingularMetrics, AbundanceStatement (scope only, not a supplier). ArithmeticVolumes… consumes 9.10a, 9.10c, 9.12, 9.12a and 9.13–9.13b, owned here; DynamicalDegreesOfRationalMaps owns the agreement of numerical intersections with Chow degrees (§2.2), cited here; nothing else is shared. The general theorems of 9.10a–9.10c and 9.12–9.12c are AlgebraicModuliForArithmeticGeometryPartII §§6.1–6.3, 6.5–6.8, named as such in every section (see C01 and the notes for the human reviewers).

Source independence: 10 passages compared with 5 sources (KOL97, ESVI92, STACKS-VARIETIES, Ein–Lazarsfeld 1999, Ein–Lazarsfeld–Smith 2001), none shared beyond forced formulas; largest share KOL97, 21 of 52 source mentions; changed passages only; arrangement not compared (no layer added, removed or reordered).

Research link: 9.12–9.12c are the effective freeness and point-separation theorems of Angehrn–Siu (1995) and Kollár (1997, §§5–6), built on Nadel vanishing for pairs (KOL97 2.16); 9.13a rests on Ein–Lazarsfeld (1999). The family applies them to automorphic forms on unitary Shimura varieties in Alpöge's formal proof. Rests on the README's overview and References and on KOL97.

## Not verifiable

- ANGSIU95, Theorem 0.3 (wider form of 9.12c): uncertified, cited by its locator.
- LAZ04, 9.1.22, 9.2.19, §9.3, 9.4.17 (9.10a–9.10c): uncertified, cited by its locator.
- Chow and van der Waerden 1937 and Jouanolou 1983 (9.13), Kollár–Matsusaka (9.13b): no locator is given to check (C04), and the texts were not read.
- The *Method of the formal proof:* labels and the [FormalProof] declaration names: the formal proof's repository was not read.

## Source issues

- **Misprint** in KOL97 at 5.10, p. 31 (lines 1403–1408): the source says the sum of k·2^{1/k} over k ≤ n is strictly less than the sum of k + 1; it should be "at most", the two being equal for n = 1; affects nothing.

## For the human reviewers

- The decision on material moved to general roadmaps was applied: no section left this folder; only the Angehrn–Siu route over `ℂ` of 9.12c's wider form went, and AlgebraicModuliForArithmeticGeometryPartII §6.8 states that theorem with that route (README lines 494–497).
- 9.12c's statement on `main` (ℓ points, every algebraically closed field of characteristic zero) is kept under "Wider form" (README line 467); the section's first statement is now the two-point form over `ℂ`. No roadmap cites 9.12c.
- 9.10a–9.10c, 9.12, 9.12a and 9.12b state, nearly clause for clause, what AlgebraicModuliForArithmeticGeometryPartII §§6.1–6.3 and 6.5–6.7 now state, each with a *Corollary of:* line (README lines 57, 142, 199, 289, 337, 408).
- Licence: LAZ04 and ANGSIU95 are uncertified; Chow–van der Waerden 1937, Jouanolou 1983 and Kollár–Matsusaka were not read; the wording was not compared with these five.
