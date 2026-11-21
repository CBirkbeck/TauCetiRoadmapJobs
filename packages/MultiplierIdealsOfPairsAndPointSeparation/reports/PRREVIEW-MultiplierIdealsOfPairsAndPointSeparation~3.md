# Review of MultiplierIdealsOfPairsAndPointSeparation (pull request #2911 at 66165d1)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/MultiplierIdealsOfPairsAndPointSeparation/`
**Verdict:** needs changes

**Summary.** Needs changes, for two findings in the text this head changes. First, 9.12, 9.12a and 9.12b are now stated over `ℂ`, while 9.12c and `adjoint_separates_points` are still stated over every algebraically closed field of characteristic zero. Since 9.12c rests on 9.12, nothing now carries it beyond `ℂ`. Second, the new *Needs:* line of 9.13 declares one input of its route "used without a supplier". There are six small corrections, none blocking. Four are carried from the last review; two concern the new citations of the formal proof, all 19 of which resolve. For the humans, one item is new: the formal proof is now the most-cited source.

## R01 (P2) — 9.12c is stated over every algebraically closed field of characteristic zero, but its route rests on 9.12, which this head states over `ℂ` only

As a result, over `ℚ̄`, or over any algebraically closed field of characteristic zero not isomorphic to `ℂ`, there is no route for 9.12c. The same holds for `adjoint_separates_points`, whose `k` is any field with `[IsAlgClosed k] [CharZero k]`.

The Conventions now read "9.12, 9.12a and 9.12b are stated over `ℂ`; in 9.12c, `k` is algebraically closed of characteristic zero" (line 13). The *Needs:* line of 9.12c (line 327) is "9.12, 9.10c; …", and its route opens with "The concentration of multiplicity of 9.12" (line 316). The sources do not cover other fields:
- Angehrn–Siu is analytic.
- Kollár 1997 defines `K_X` through the holomorphic tangent bundle (1.1.4, KOL97 line 176).
- Kollár's 7.8, the specialisation step behind 6.7.1 and 6.8.1, is stated over `ℂ` with Euclidean neighbourhoods (KOL97 line 1979).

The revised Check "Over `ℂ`, `ℓ = 1` follows from 9.12b" (line 331) records the same restriction.

The statement is true over every such `k`:
- Spread `X`, `L` and the points over a finitely generated field and embed that field in `ℂ`.
- A subvariety `Z′ ⊂ X_ℂ` of dimension `d` specialises to a cycle `Σ m_i Z_i` on `X_k` with the same `(L^d · −)`, by flatness. Since every `m_i ≥ 1` and every `(L^d · Z_i) > c^d`, the hypothesis holds on `X_ℂ`.
- Surjectivity onto `⊕ k(x_i)` then descends and ascends by flat base change of `H⁰`.

The smallest repair is one of two:
- Add that reduction as a step of the route of 9.12c, naming its inputs: spreading out, constancy of intersection numbers in flat families, and flat base change. This keeps the Lean statement as it is.
- State 9.12c, headline (3) of the Summary and `adjoint_separates_points` over `ℂ`.

## R02 (P2) — 9.13's route uses an input that, by its own *Needs:* line, no layer, supplier or pinned declaration provides

As a result, the route of 9.13 cannot be completed from the inputs it cites. It concludes that `Z(s)` is étale from "`Z(s)` has length `(L^D) = δ` and at least `δ` geometric points" (line 360). That intersection numbers of Cartier divisors are lengths is exactly what the new *Needs:* line calls "used without a supplier" (lines 363–364). The cited `proper_intersection` (SchemeAndStackFoundations §5.6, its README line 8337 on main) gives only positive multiplicities `i(Z; V · W)`, not lengths. For example, two conics on `ℙ²` tangent at one point have multiplicities that are positive and sum to 4. That their sum is the length of the scheme of common zeros is the missing step.

The smallest repair is either of these:
- State the identification as a target of 9.13: for Cartier divisors `D_1, …, D_D` on the smooth `R` with finite intersection, `(D_1 ⋯ D_D)` is the length of `D_1 ∩ ⋯ ∩ D_D`. Give it a locator.
- Derive it from inputs the roadmap already uses. For general `s`, the sections form a regular sequence on `R`. The exact sequences `0 → F ⊗ L^{−1} → F → F/s_jF → 0` of 9.13a then give `χ(O_{Z(s)}) = Σ_{i=0}^{D} (−1)^i binom(D, i) χ(R, L^{−i})`. This is the `D`-th difference of `m ↦ χ(L^m)`, which is `(L^D)` by the Conventions. On `ℙ²` with two conics it reads `1 − 2·0 + 3 = 4`.

## C01 — 9.10d (a) still restates asymptotic Riemann–Roch without citing ArakelovGeometryAndAbelianHeightsPartII §0.3 (1′)

This is carried from the last review. At its head, ArakelovGeometryAndAbelianHeightsPartII §0.3 still states `vol(L) = (L^d)` for nef `L` over any field (its README lines 109 and 119). 9.10d (a) (lines 156–157) is the ample case of that statement, with an error term added. Cite (1′) in 9.10d (a) and in the supplier contracts, keeping (a) for the error term. Alternatively, cite (1′) directly in the routes of 9.12 and 9.12a.

## C02 — The description is out of date in three places

- It still says that the pullback of `ℚ`-Cartier divisors (9.10a) and 9.10d "are targets here because no roadmap on main or in an open pull request states them as targets". That is contradicted by AbundanceStatement Layer 1 item 5 (its README line 150 at its head) and by C01.
- It does not say that 9.12, 9.12a and 9.12b are stated over `ℂ`.
- It does not say that 9.10a–9.10c, 9.12a, 9.13a and 9.13b now name the formal proof's statements by file and declaration.

Text that would be right: "Kodaira's lemma (9.10d (b)) is stated by no other roadmap; the pullback of `ℚ`-Cartier Weil divisors is also planned by AbundanceStatement; the nef leading term of asymptotic Riemann–Roch is ArakelovGeometryAndAbelianHeightsPartII §0.3 (1′). 9.12, 9.12a and 9.12b are stated over `ℂ`, and the targets name the forms of the formal proof by file and declaration."

## C03 — 9.12c still cites Angehrn–Siu 1995 without a theorem number or page

This is carried from the last review. The reference reads "(Angehrn–Siu 1995; for `ℓ = 1` and `ℓ = 2`, …, Kollár 1997, Theorem 5.5 …)" (line 307). The general-`ℓ` case is the one Kollár does not cover, and the reader cannot locate it. Give the theorem number and printed page in Invent. Math. 122.

## C04 — 9.13a (i) is still stated for `j ≥ D`, though its route proves it for `j ≥ D − 1` and every `a`

This is carried from the last review. The clause "for `a = 1` this holds already for `j ≥ D − 1`" (line 379) suggests that `a ≥ 2` needs `j ≥ D`. It does not: the induction from `a` to `a + 1` applies case `a` with `j + 1` and case 1 with `j`. On `ℙ²` with `L = O(1)`, `L_A = O(3)`, `a = 2` and `j = 1`, every cubic in `(x, y)²` is `x²ℓ₁ + xyℓ₂ + y²ℓ₃`. Either state (i) for `j ≥ D − 1`, or keep `j ≥ D` and drop the clause.

## C05 — The clauses of 9.10a (a) on `a(E; X, Δ)` are credited to `IsLogEqn.discrep_eq_neg`, which proves only the last of them

Lines 52–54 cite this one declaration for all of them. In the formal proof, `GlobalTheory.Discrepancy.IsLogEqn.discrep_eq_neg` (`IsLogCanonicalMultipleCanonical.lean`, line 336) says only that a divisor centred at a codimension-one point `z` has discrepancy `−Δ(z)`. That is the non-exceptional clause. Independence of the top form and of the Cartier index is `GlobalTheory.Discrepancy.discrep_eq` (same file, line 376). Independence of the model is built into the formal definition, because `discrep` is defined on discrete valuation rings of the function field (`DivOver`, line 23). Name `discrep_eq` beside `discrep_eq_neg`, and say that independence of `f` holds by definition there.

## C06 — The References say the formal proof has forms of 9.12, 9.12b and 9.13, but those targets name no declaration, and 9.13a names [FormalProof] without one

The References entry (line 501) lists 9.12, 9.12b and 9.13 among the targets whose forms the formal proof has. 9.13a says "the statement is the one [FormalProof] states" (line 382). None of these four targets gives a file or declaration, although the Conventions (lines 17–20) say that where a target names [FormalProof], its form is recorded at the target. In the formal proof I found:
- for 9.12, `GlobalTheory.Published.IsolatedNonKltDivisor` (`IsLogCanonicalMultipleCanonical.lean`, line 557): over `ℂ`, with `N` nef and big, `n ≥ 1` and `D ≡ N`;
- for 9.13, `GlobalTheory.HSShort.Bertini` (`Development/AbelianVarietyTheory/Definitions/Divisors/HermSysHypOneLeLambdaZero.lean`, line 87): over number fields, so narrower than 9.13;
- for 9.12b and 9.13a, nothing.

Give the file and declaration at each of these targets, or drop from line 501 the ids that the formal proof does not have.

## Previous findings

The previous report had no findings (R). Its small corrections and its question:

- C01 — not repaired: 9.10d (a), lines 156–157, unchanged and still without a citation of ArakelovGeometryAndAbelianHeightsPartII §0.3 (1′) (C01 above).
- C02 — not repaired: the description still says "no roadmap on main or in an open pull request states them as targets" (C02 above).
- C03 — not repaired: "(Angehrn–Siu 1995; for `ℓ = 1` and `ℓ = 2`, with `L` replaced by `L^m`, Kollár 1997, Theorem 5.5 and its proof in 5.10)" (C03 above).
- C04 — not repaired: "for `a = 1` this holds already for `j ≥ D − 1`" (line 379, C04 above).
- Question (base field of 9.12 and 9.12a) — partly repaired: "9.12, 9.12a and 9.12b are stated over `ℂ`" (line 13). 9.12c, which rests on 9.12, was left over every algebraically closed field (R01).

## Verified sound

| Statement | Instances tried | Values computed (README / independent) | Result | Change |
|---|---|---|---|---|
| Conventions, base fields | 9.12–9.12b over `ℂ`; 9.12c over `k`; KOL97 1.1.4, 7.8 | KOL97 over `ℂ` (holomorphic `T_X`, Euclidean neighbourhoods); 9.12c *Needs:* 9.12 | 9.12c wider than its route | R01 |
| 9.12c over `k ≠ ℂ` | `ℙ¹_{ℚ̄}`, `L = O(3)`, `ℓ = 2` | threshold `2 < 3`; `K + L = O(1)` separates two points: true, but 9.12 over `ℂ` does not apply | true, unsupported | R01 |
| 9.10a formal forms | `discrep`, `KltAt`, `LcAt`, `kltAt_zero_of_smooth` | defined on valuation rings; `KltAt` = all `discrep > −1`; smooth `Δ = 0` klt: matches (a)–(c) | match | none |
| 9.10a (a) via `discrep_eq_neg` | non-exceptional `E` at `z` | gives `discrep = −Δ(z)` only; form and index independence is `discrep_eq` (l. 376) | partial credit | C05 |
| 9.10a *Needs:* §3.4 | `picardToClassGroup` (SASF l. 5982) | codimension-one orders of a rational section on normal integral locally Noetherian `X`; applied on the smooth locus | supplied | none |
| 9.10b smooth comparison | `𝔸²`, `(x²)`, `c = ½` | log resolution principalises `O(−D)`; `J(X, L) = (x)` = AMAG Check; API names at AMAG l. 10118 | true | none |
| 9.10b formal forms | `isMultIdeal_iff_regularAt`, `IsMultIdeal.unique`, `exists_isMultIdeal_support_iff_not_kltAt` | projective `X`; uniqueness; cosupport = non-klt locus | match | none |
| 9.10c smooth reduction | `ℙ²`, `Δ = ½L₀`, `q = 2`, `L = O(k)` | `a = O(−L₀)`, `cM = Δ`, `k + 3 − ½ > 0 ⇔ k ≥ −2`; `J = O`; `H^i(O(k)) = 0` | true | none |
| 9.10c formal `nadelVanishing` | `r = m`, `M = mP`, `T = O` | `cls T = m²N − mG − m·mP = 0`: covers every nef and big `P = L − (K+Δ)`; char 0, normal projective | match | none |
| 9.12 vs formal | `IsolatedNonKltDivisor` (l. 557) | over `ℂ`, `Σ e/c(e) ≤ 1`, `N₀/r` nef big, `D ≡ N`, lc near `x`, klt punctured; README equal | match; uncited | C06 |
| 9.12, 9.12a *Needs:* §1.7 (v) | AMAG-II l. 344 | "nef `ℚ`-Cartier Weil divisor plus an ample one is ample"; ampleness numerical | supplied | none |
| 9.12a vs `PointSeparationPair` | `ℙ¹`, `N = O(a)`, `c(1) = 2` | formal: `ℂ`, normal, `Δ ≥ 0`, klt, `N₀/r` nef big, curve degrees, `Σ 2^{1/e}e/c(e) ≤ 1`; `a ≥ 3`, `O(a−2)` separates | match | none |
| 9.12b *Needs:* §3.3 | AMAG-II l. 666 | section generates `L` at `x` iff its germ generates `L_x` iff nonzero in the fibre | supplied | none |
| 9.12c vs `uniformAdjointVeryAmpleness` | `ℙ¹`, `L = O(1)`; `L = O(3)` | `O(1)`: 9.12c hypothesis fails (`1 < 2`), `m(K+3L)+G` very ample; `O(3)`: 9.12c gives `K+L`, AMAG silent | neither contains other | none |
| 9.13 with `bertini_smoothness` | `ℙ¹`, all forms of degree `d` | `φ_V` immersion; SASF l. 6989 over infinite `k`; general `s` has `d` simple zeros | true | none |
| 9.13 length step | `ℙ²`, two conics, tangent case | §5.6 gives positive multiplicities only; Koszul: `χ(O) − 2χ(O(−2)) + χ(O(−4)) = 1 − 0 + 3 = 4` | unowned step | R02 |
| 9.13a formal sentence | `L_A ≅ L₂ ⊗ L^D ⊗ O(E)` | no file or declaration given; none found | unlocated | C06 |
| 9.13b (a) vs formal | `globalSections_dim_le_of_intersection_bound` | `dim ≤ d`, `L` generated, `(B·L^{d−1}) < (a+1)(L^d) ⇒ h⁰(B) ≤ binom(a+d,d)(L^d)`; `ℙ^d`, `O(b)`: equality | match | none |
| 9.13b (b) vs formal | `interNum_cons_le`; `ℙ¹`, `L′ = O(2)`, `L = O(1)` | `L′ = L + P`, `nL′ = B + Q` nef `⇒ (B·L^d) ≤ n(L′^{d+1})`; `b ≤ 2n` | match | none |
| `adjoint_separates_points` | elaboration; `k` | unchanged statement; `[IsAlgClosed k] [CharZero k]`, wider than 9.12's `ℂ` | elaborates | R01 |

The rows for the statements this head does not change stand as in the previous review, of `46f6b1a`.

- Formal proof: 19 declarations in 12 files of the formal proof's repository were opened in the copy the operator holds (commit `e50d098`). All exist under the names cited. Statements were compared for 9.10a, 9.10b, 9.10c, 9.12a and 9.13b. I also located the forms of 9.12 and 9.13 there.
- Supplier citations resolved on main (`55dca6d`):
  - SchemeAndStackFoundations: §2.2 `leray_spectral_sequence` (README line 4186), §2.6 `ample_serre_vanishing` (4392), §3.4 `picardToClassGroup` (5982), §4.13 `bertini_smoothness` (6989), §5.3 `proper_pushforward` and `eq_cartier_divisor` (8110–8112), §5.6 `proper_intersection` (8337).
  - AlgebraicModuliForArithmeticGeometry §9.10: `algebraicMultiplierIdeal.resolutionIndependent`, `.localVanishing` and the vanishing clause (10118); `uniformAdjointVeryAmpleness` (10127).
  - AlgebraicModuliForArithmeticGeometryPartII: §1.7 (v) (344) and §3.3 (666).
- Open heads: ArakelovGeometryAndAbelianHeightsPartII §0.3 (1′) (its README lines 109–119); AbundanceStatement Layer 1 item 5 (line 150); and the consumer ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, which uses §§9.10c, 9.12, 9.12a, 9.13, 9.13a and 9.13b (its README lines 396 and 2239).
- Source locators checked for the base field: KOL97 1.1.4 (line 176), 5.5 (line 1275) and 7.8 (line 1979).
- Dependency check: `depcheck: 93 roadmaps, 1017 edges, 0 problem(s)`. The candidate merge order places this roadmap directly after DynamicalDegreesOfRationalMaps, its open supplier.
- Automatic checks: every check passed in the worker's run at this head.
- Elaboration: `Suggested.lean` elaborates with the single warning `declaration uses sorry` (line 105). The head changes only the docstring entry for 9.12b, so the elaborated signatures are as in the previous review, with every binder present.
- Outside the folder, the head changes only the family index, which is this pull request's own. Its changes describe other roadmaps of the family and none bears on this roadmap.

Overlap check: read ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, DynamicalDegreesOfRationalMaps, AbundanceStatement and ArakelovGeometryAndAbelianHeightsPartII (open), and AlgebraicModuliForArithmeticGeometryPartII and AlgebraicModuliForArithmeticGeometry (main). The list by results and headings was empty. The shared objects and their owners are as in the previous review:
- asymptotic Riemann–Roch, nef leading term: ArakelovGeometryAndAbelianHeightsPartII (C01);
- pullback of `ℚ`-Cartier divisors and klt for `Δ = 0`: AbundanceStatement, which is never a supplier;
- the rest: owned here, or cited to its owner.

The change adds no owned object.

Source independence: changed passages only. I compared 9 added passages (the two in the Conventions, and those in 9.10a, 9.10b, 9.10c, 9.12c, 9.13, 9.13a and 9.13b) with KOL97, with the supplier texts they cite, and with the formal proof's statements. Nothing is shared beyond forced formulas and declaration names; the formal proof is cited by path and name only. The largest share of in-text locators is now [FormalProof], 16 file citations, against KOL97's 11. No layer was added, removed or reordered, so the arrangement was not compared again.

Research link: 9.12–9.12c are the Angehrn–Siu (1995) effective freeness and point-separation theorems toward Fujita's conjecture, in Kollár's algebraic form for klt pairs (Singularities of pairs, 1997, Theorems 5.8, 5.9, 6.4). 9.10a–9.10c are the multiplier-ideal and Nadel-vanishing theory beneath them (Lazarsfeld 2004, Ch. 9). This rests on the README's references and on KOL97 §§5–6.

## Not verifiable

- ANGSIU95 (Invent. Math. 122, 1995): settled as uncertified, so the theorem behind general `ℓ` in 9.12c is unchecked (C03).
- LAZ04, 9.1.22, 9.2.19 and 9.4.17: settled as uncertified.
- Kollár–Mori 1998, 2.31 and 2.70: not in the sources manifest, and no legal copy is known.
- The licence of the formal proof's repository: the copy the operator holds contains only its source directory.

Automatic checks set aside as false positives: a run of the checks without the merge order reported two things. It listed the three index files of the family folder as changes outside the roadmap folder, but this roadmap is nested, and the family's index files directly in the family folder belong to the pull request that adds the nested roadmap, so editing them is no change outside its scope. It also said the roadmap is not in the merge order, but a roadmap the order does not list yet is placed directly after its last supplier, and the merge order does place it there.

## Source issues

- none

## For the human reviewers

- Ownership: AbundanceStatement (open, by another author, on the list of roadmaps that are never suppliers) plans the pullback of `ℚ`-Cartier divisors, canonical divisors and klt for `Δ = 0`. These are its Layers 1–3 at its head; 9.10a plans the same objects for pairs.
- Not tested: LAZ04, Kollár–Mori 1998 and ANGSIU95 could not be read, so wording and arrangement were not compared with them.
- Formal proof as a source: the README now cites [FormalProof] 16 times by file path and declaration name, more than any other source. It is a public, unrefereed Lean repository, announced on 20 November 2026 (References, lines 501–502). Its licence was not read.
- Family scope: the family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, lines 9–17), part of this pull request, says the family follows that formal proof of RH for Dirichlet L-functions.
