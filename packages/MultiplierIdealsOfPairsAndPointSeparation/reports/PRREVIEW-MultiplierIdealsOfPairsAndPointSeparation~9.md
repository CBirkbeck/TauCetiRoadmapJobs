# Review of MultiplierIdealsOfPairsAndPointSeparation (pull request #3027 at 374b9ce)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/MultiplierIdealsOfPairsAndPointSeparation/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 289 changed lines since `74a09b7`. The new *Origin:*, *Method of the formal proof:* and *Corollary of:* lines, the new two-point statement of 9.12c and the deduction of 9.13a (i) were checked against Kollár, Esnault–Viehweg, the Stacks project, Ein–Lazarsfeld and Ein–Lazarsfeld–Smith, against AlgebraicModuliForArithmeticGeometryPartII §§1.6a, 1.7a, 6.1–6.8 and AlgebraicModuliForArithmeticGeometry §9.12 at this head, and against the README on `main`; every corollary claim holds at the generality stated, and there is no finding. Accepted, with six small corrections and one format note, none blocking; three facts about the restructured 9.12c and the restated sections are listed for the human reviewers.

## C01 — 9.10a and 9.10b define the discrepancy, klt and lc pairs, the non-klt locus and `J(X, Δ)` again, without saying that these are the objects of AlgebraicModuliForArithmeticGeometryPartII §§6.1–6.2 on which their *Corollary of:* lines depend

An implementer who reads 9.10a (lines 60–69) and 9.10b (lines 147–148) would build a second discrepancy and a second multiplier ideal beside AlgebraicModuliForArithmeticGeometryPartII's *pairDiscrepancy* and *pairMultiplierIdeal*, whose definitions are the same word for word. The *Corollary of:* lines deduce (a), (b) and the first clause of (c), and the API of 9.10b, from theorems about those objects, so the deduction assumes the two definitions are one. Scope and ownership also lists these objects as owned here (line 705) and, two paragraphs later, as AlgebraicModuliForArithmeticGeometryPartII's (line 707).

One sentence in each section would settle it. For example: "The discrepancy, klt and lc pairs and `Nklt(X, Δ)` are those defined in AlgebraicModuliForArithmeticGeometryPartII §6.1", and "`J(X, Δ)` is the multiplier ideal of AlgebraicModuliForArithmeticGeometryPartII §6.2". The ownership paragraph would then add "with the definitions of AlgebraicModuliForArithmeticGeometryPartII §§6.1–6.2".

## C02 — The Lean file calls the ℓ-point statement "the remark of 9.12c", a name the README does not use

The module docstring (`Suggested.lean` lines 20–21) and the docstring of `adjoint_separates_points` (lines 103–104 and 113–114) point to "the remark of 9.12c". The README sets that statement apart under the heading **Wider form** (line 467) and calls it "the wider form of 9.12c" everywhere else (lines 5, 13, 26, 39, 394, 689). A reader looking for "the remark" finds nothing. Replace "the remark of" by "the wider form of".

## C03 — 9.10a's *Origin:* cites Kollár's Definition 3.5 for the discrepancy and the non-klt locus, which Kollár defines in 3.3 and 5.7

In line 43, KOL97 Definition 3.3 (KOL97 line 654, pp. 15–16) defines the discrepancy; Definition 3.5 (line 703, pp. 16–17) defines klt and lc; and Definition 5.7 (line 1342, p. 30) defines the non-klt locus. Cite "Definitions 3.3, 3.5 and 5.7", as AlgebraicModuliForArithmeticGeometryPartII §6.1 does.

## C04 — Three works named in the new *Origin:* lines have no locator, and one is not in the References

9.13's *Origin:* (lines 512–513) cites Chow and van der Waerden (1937) and Jouanolou (1983) without a theorem, section or page. 9.13b's *Origin:* (lines 646–647) names "Kollár and Matsusaka" with no year and no entry under References. Give for each the theorem or section where the cited result stands (for Jouanolou, the Bertini theorem meant). Add the Kollár–Matsusaka paper to the References: presumably J. Kollár and T. Matsusaka, *Riemann–Roch type inequalities*, Amer. J. Math. 105 (1983).

## C05 — The Labels paragraph says that [FormalProof] has a statement of every section, but 9.10d records none and the References entry leaves 9.10d out

Lines 23–24 say "[FormalProof] has a statement of each section". The [FormalProof] entry under References (line 754) lists 9.10a–9.10c, 9.12–9.12c and 9.13–9.13b but not 9.10d. The statement of 9.10d (lines 240–249) names no declaration, while its method label (lines 230–235) says how [FormalProof] proves (a) for nef sheaves. One of the two is out of date. Either record at 9.10d the form that [FormalProof] has, with its declaration as in the other sections, and add 9.10d to the References entry; or say in the Labels paragraph that 9.10d is the exception.

## C06 — The description's list of sections that keep a statement wider than the proof's form leaves out 9.12c

The description says that such a section "now states the proof's form and the general roadmap the general theorem, except where" it is only a remark (CongruenceModulesOfThetaLifts 7.16a (2), BaseChangeAndGaloisRepresentationsForUnitaryGroups 16.1) or it keeps the general statement (FiniteReductiveGroups 0.1, 0.3, 2.2). 9.12c is another such section. It now states the proof's two-point form over `ℂ`, and keeps its former statement beside it as its wider form: ℓ points over every algebraically closed field of characteristic zero, wider than AlgebraicModuliForArithmeticGeometryPartII §6.8 over `ℂ`. That wider form remains headline (3) and is still the only theorem in `Suggested.lean`. The list would add: "and MultiplierIdealsOfPairsAndPointSeparation 9.12c, which keeps its former ℓ-point statement over every algebraically closed field of characteristic zero as a wider form".

## N01 — Supplier names in the AlgebraicModuliForArithmeticGeometryPartII contract

In line 717, six of that roadmap's proposed names (`pairDiscrepancy`, `pairMultiplierIdeal`, `pairNadelVanishing`, `isolatedNonKltCentre`, `adjointGlobalGeneration`, `kollarTwoPointSeparation`) are in code font. AlgebraicModuliForArithmeticGeometryPartII sets them in italics as names its `Suggested.lean` does not declare. The name it does declare is `PointSeparation.angehrnSiuPointSeparation` (its `Suggested.lean`, line 550), not `angehrnSiuPointSeparation`. Write the six in italics or prose, and give the declared name in full.

## Verified sound

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| 9.10a, *Corollary of:* §6.1 | hypotheses compared; `𝔸²` with `c·L`; cusp | both: normal integral variety, char 0, `K+Δ` ℚ-Cartier; klt iff `c<1`; cusp klt iff `c<5/6` | (a), (b), (c) first clause identical; C01, C03 |
| 9.10b, monotonicity via common resolution | `Δ−Δ′ = (K+Δ)−(K+Δ′)` ℚ-Cartier; `𝔸²`, `Δ=L`, `Δ′=½L` | `J(Δ)=O(−L) ⊆ J(Δ′)=O` | holds; rest identical to §6.2 |
| 9.10c (headline 1) and §6.3 | `ℙ²`, `c=1`, `L=O(−1)`; elliptic curve, `L=O` | `J=O(−1)`: `H¹=H²(O(−2))=0`; not big: `h¹(O)=1` | statements identical; KOL97 2.16 (line 538) supports |
| 9.10d and §§1.6a, 1.7a | `ℙ²`, `A=O(1)`; blow-up of `ℙ²`, `2h−e` | `h⁰=(m+1)(m+2)/2`, leading `m²/2!`; `(2h−e)²=3`, `(2h−e)·e=1` | §1.7a (projective) and §1.6a cover (a), (b); C05 |
| 9.12 and §6.5 | here `N` nef, `c_d∈ℚ`; there nef and big, `c_d∈ℝ`; `ℙ¹`, `N=O(a)`, `c₁=1` | `Z=X` gives `(Nⁿ)>c_nⁿ>0`, so big; `a>1` both | corollary holds; `λ<1` via `(1−ε)N`, margin in `r^{−d}ℤ` |
| 9.12a (headline 4) and §6.7 | `ℙ¹`, `Δ=0`, `N=O(a)` | both need `a>c(1)≥2`, so `a≥3`; `O(a−2)` separates iff `a≥3`; `a=2` fails both | identical; KOL97 5.9, 6.5 (lines 1362, 1572) |
| 9.12b (headline 2), §6.6, method label | `n=1`: `m≥2`; `½N₀=(m−½)N₁+N′` | `(m−½)^d ≥ 1.5^d > 1 = (½n(n+1))^d`; residual `½N₁` nef and big | holds; KOL97 5.8 (line 1349) |
| 9.12c, two-point form over `ℂ` | curve of genus g, `deg B=b`; elliptic curve, `b=2` | `b>2` gives `deg(K+B)≥2g+1`, very ample; `b=2`: a g¹₂ fails | threshold sharp; true |
| 9.12c from §6.7 with `c(e)=½n(n+3)` | `n=1`, `n=2` | `Σ2^{1/e}e`: `2≤2`; `2+2√2≈4.83≤5` | admissible; matches KOL97 5.10 (line 1398) |
| wider form (headline 3), §6.8, Lean | `ℓ=2`, `n=1` | threshold `½·1·4=2` in both; Lean `n(n+2ℓ−1)/2` in ℚ, `d≥1` | `#check` type equals README statement |
| 9.13 | `R=ℙ¹`, `L=O(d)`, all binary forms | `δ=d=(L¹)`; `Q` = discriminant × leading coefficient; `f_X` = resultant | Check true; locators missing (C04) |
| 9.13a (i) from AMAG §9.12 | `k=a`, `ℓ=D+a−1`, `m=D`; `ℙ¹`, `L=L_A=O(1)`, `a=1`, `j=1` | `ℓ ≥ min(D+a−1, D+a)`; `A−ℓD = L_A⊗L^{j−D+1}` nef, big; linear forms through P are `s·k` | holds over `ℂ` |
| `I_ℓ = I_Z^{ℓ+1−D}` | `D=2`, reduced points, blow-up | `K_{Y/R}=F`: `I₁=O`, `I₂=I_Z`, `I₃=I_Z²`; Ein–Lazarsfeld–Smith 2001, p. 8 | holds; Ein–Lazarsfeld 1999, Prop. 1.2 (ii), p. 12 |
| 9.13b | `ℙ^d`, `B=O(b)`, `a=b`; `ℙ¹`, `⟨x², xy⟩` | `h⁰=binom(b+d,d)`, equality; `b ≤ 2n` both sides | Checks true; reference missing (C04) |

- Source locators read in the text: KOL97 Theorem 2.16 (line 538), Definitions 3.3 and 3.5 (lines 654, 703), Lemmas 3.10–3.11 and Corollary 3.12 (lines 784–844), Definition 5.7 (line 1342), 5.8–5.10 (lines 1349–1408), 6.4–6.5 and Steps 6.6–6.8 (lines 1555–1713); ESVI92 5.4 d) (line 1735, p. 44); STACKS-VARIETIES 0BJ8 (line 4868); Ein–Lazarsfeld 1999 Propositions 1.1 (ii), 1.2 (ii) (pp. 10–12); Ein–Lazarsfeld–Smith 2001 Theorem 2.2 and proof (pp. 7–8).
- Cross-roadmap citations resolved at this head: AlgebraicModuliForArithmeticGeometryPartII §§1.6a, 1.7a, 6.1–6.8; AlgebraicModuliForArithmeticGeometry §9.12 with its Check on reduced points; ComplexComparisonPartII §§C5.4g, C7.9, C7.17, C7.18. The consumers (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, SingularHermitianMetricsAndL2Methods) cite 9.10b, 9.10c, 9.12, 9.12a and 9.13–9.13b, whose statements are unchanged. No roadmap cites 9.12c.
- Record: no heading added or removed and no Lean declaration changed. The statement 9.12c had on `main` stands verbatim as its wider form. Only its Angehrn–Siu route over `ℂ` left, now cited to AlgebraicModuliForArithmeticGeometryPartII §6.8, which states that route.
- Automatic checks: all passed. Dependency check: `depcheck: 132 roadmaps, 1470 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` gives only the `sorry` warning (line 115). A scratch file of `#check @` for the three declarations gives types equal to the README statements, with no binder dropped. The one deep theorem is not padding.
- The open pull request that rewrites `*Needs:*` lines (9.10d, 9.12, 9.12a) also edits this README; a three-way merge with this head is clean.

Overlap check: read ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, AbundanceStatement, DynamicalDegreesOfRationalMaps, HeightsForLogSingularMetrics. ArithmeticVolumes… consumes 9.10c, 9.12, 9.12a and 9.13–9.13b, owned here. AbundanceStatement (open) defines klt for `Δ = 0`; that definition is owned by this roadmap's 9.10a on `main` and by AlgebraicModuliForArithmeticGeometryPartII §6.1. Nothing else is shared.

Source independence: 12 changed passages compared with 5 sources (KOL97, ESVI92, STACKS-VARIETIES, Ein–Lazarsfeld 1999, Ein–Lazarsfeld–Smith 2001), none shared beyond forced formulas; largest share KOL97, about 36 of about 74 source mentions; changed passages only; arrangement not compared (no layer added, removed or reordered).

Research link: 9.12–9.12c are the Angehrn–Siu (1995) and Kollár (1997, §§5–6) effective freeness and point-separation theorems toward Fujita's conjecture (KOL97 5.3), built on Nadel vanishing for pairs (KOL97 2.16). The family applies them to automorphic forms on unitary Shimura varieties for Alpöge's 2026 proof. Rests on the README's overview and References and on KOL97.

## Not verifiable

- ANGSIU95, Theorem 0.3 (wider form of 9.12c): uncertified, paywalled; cited by its locator.
- LAZ04, 9.1.22, 9.2.19, §9.3, 9.4.17 (9.10a–9.10c): uncertified, paywalled.
- Chow and van der Waerden 1937 (9.13): the sources service found only the publisher's paywalled page. Jouanolou 1983 (9.13): a book with no open copy, not fetched.
- The *Method of the formal proof:* labels and the [FormalProof] declarations: the formal proof's repository was not read.

## Source issues

- **Misprint** in KOL97 at 5.10, p. 31 (lines 1403–1408): the source says the sum of k·2^{1/k} over k ≤ n is strictly less than the sum of k + 1; it should be "at most", since the two are equal for n = 1; affects nothing.

## For the human reviewers

- The decision on material moved to general roadmaps was applied. No section left this folder. Only the Angehrn–Siu route over `ℂ` of 9.12c's wider form went, and AlgebraicModuliForArithmeticGeometryPartII §6.8 states that theorem with that route (README lines 494–497).
- The statement 9.12c had on `main` (ℓ points over every algebraically closed field of characteristic zero) is kept verbatim under "Wider form" (README line 467). The section now states the two-point form over `ℂ`. No roadmap cites 9.12c.
- 9.10a–9.10c, 9.12, 9.12a and 9.12b state, nearly word for word, what AlgebraicModuliForArithmeticGeometryPartII §§6.1–6.3 and 6.5–6.7 now state, each with a *Corollary of:* line (README lines 57, 142, 199, 289, 337, 408).
- Licence: LAZ04 and ANGSIU95 are uncertified, and Chow–van der Waerden 1937 and Jouanolou 1983 were not read; the wording was not compared with them.
