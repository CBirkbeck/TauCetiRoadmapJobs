<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12938#issuecomment-6899870595 -->
Review (claude) of 90b3432

Verdict: needs_changes

1. **F01** (P3) §5.3 cites Dang–Favre's lines on the polarization for invariance

   - **Location:** `packages/DynamicalDegreesOfRationalMaps/design/README.md`, §5.3, closing parenthesis: "dinhsibony2005 Corollaire 7, lines 256–263; dangfavre2021 lines 464–465."
   - **Claim:** dangfavre2021 lines 464–465 support a statement of §5.3 (birational conjugacy, normalization, extension of the field).
   - **Witness:** dangfavre2021 lines 464–465 say only that `λ_k` lies in `[1, ∞)` and does not depend on the big and nef class; that is §5.2, which already cites lines 464–467. Birational invariance is at dangfavre2021 lines 83–84.
   - **Repair:** in §5.3 replace "dangfavre2021 lines 464–465" by "dangfavre2021 lines 83–84, for invariance under birational conjugacy". `plan.json` 5.3 `where` does not cite Dang–Favre and needs no change. Tested on the witness: lines 83–84 state independence of the polarization and invariance under birational conjugacy.

2. **F02** (P3) two `cited_for` fields of the manifest lack a section that cites the work

   - **Location:** `packages/DynamicalDegreesOfRationalMaps/sources.toml`, entry `dinhsibony2005`, `cited_for = ["§1.1", "§1.2", "§4.1", "§4.4", "§4.5", "§5.1", "§5.3", "§5.4", "Scope"]`; entry `dangfavre2021`, `cited_for` without "§5.3".
   - **Claim:** each `cited_for` lists the sections that cite the work.
   - **Witness:** README §5.2 closes with "dinhsibony2005 lines 69–70" and §5.3 with a `dangfavre2021` locator; a section-by-section comparison of all 15 entries finds exactly these two omissions and no entry listing a section that does not cite it.
   - **Repair:** add "§5.2" to `cited_for` of `dinhsibony2005` and "§5.3" to `cited_for` of `dangfavre2021` (the latter stays correct after R01). Tested: the comparison then reports no difference.

Two findings, both P3 (a misplaced locator and two manifest fields), each with a repair to apply, so the verdict asks for changes. No P1, no P2. The round-12 finding is repaired. `design/plan.json` declares no supplier gap (`gaps` is empty), so no conditional gap arises. No maintainer notes were given. Lean elaboration: not available (this lane does not elaborate; say so in the report). The design has no `Suggested.lean`, so nothing was elaborated or probed.

## Previous finding (round 12), checked first

| Finding | Repaired passage | Status |
| --- | --- | --- |
| F01 (P3): §6.1 cited Silverman's remark on iterates for the reduced forms | §6.1 Route: "… gives reduced forms (silverman2014 lines 43–45, for maps given by forms of one degree without common factor; guedj2010 Exemple 2.2, lines 1145–1147; russakovskiishiffman1997 line 510)". §6.1 iterates item: "morphisms of degree `a^n` (silverman2014 lines 350–354, for `n ≥ 1`)". `plan.json` 6.1 `where`: "silverman2014 lines 43-45 and 350-354". Manifest `locator`: "Section 1: maps by forms without common factor; Section 3: …" | **Repaired.** silverman2014 lines 43–45 give forms of one degree with no common nontrivial factor; lines 350–354 give degree `d^n` for the iterates of a morphism and a possibly smaller degree otherwise. |

Pattern search after the repair: the remaining Silverman locators (§4.4 line 387; §5.1 lines 383–413; §6.2 lines 350–357 and 387; §6.3 lines 358–372; §6.4 lines 373–380) were reopened and say what they are cited for. The same search over the other parenthetical locator lists found R01.

## Verified sound

### Principles, shape, house style

- General library: arbitrary ground field, no normality, inseparable degree counted, geometric integrality assumed only where the base-changed map must be a map of varieties. No algorithm, no `set_option`, no sorry'd data, no Lean file at this stage.
- Shape: Summary, Scope and ownership, Conventions, Exact supplier contracts (Mathlib, Tau Ceti, eight roadmaps), How to read the build, six layers each ending with Examples and Dependencies, Downstream consumers, Worked examples, References. `plan.json` parses: 6 layers, 27 targets, `gaps` empty, no prerequisite starting with `gap:`; tests per target between 3 and 8. Every definition has at least three Checks: pullback and `e(f)` (6), graph (5), `W_{f,g}` (4), normalization lift and `f_{K'}` (5), real classes (4), reduction data of §2.4 (4), mixed degree (4), `λ_k` (3), `h_alg` (4).
- Organisation: layers named by their mathematics; Layers 1 and 2 are independent and say so; Layer 3 needs §§2.1–2.4, §4.4 needs §§1.3 and 3.6, Layer 5 needs §§3.5 and 4.2–4.5, Layer 6 needs §§3.2, 4.1–4.2 and 5.1–5.4, so the order is forced.
- Process residue: a pattern search of the README for LaTeX delimiters, pull-request numbers, round labels, machine paths, HTML anchors, "so far", "checkpoint", "handoff", "optional", "deferred", "removed", "currently" finds nothing. The one hit for "for later" is "as motivation for later roadmaps", which heads the out-of-scope list and names the Part II that owns each item. The README attributes no backticked Lean name to this roadmap.
- Remark, no change needed: in §§3.3 and 3.6 the hypotheses `(A^r) > 0` and `(B^r) > 0` are those of the sources and of the line-bundle route; when the number is `0` the left side is `0` and the right side is `≥ 0` by §3.2, so the degenerate case is consistent.

### Adversarial table (values computed this round)

On `E × E` without CM the map is `xF_1 + yF_2 + zΔ ↦ [[x+z, −z], [−z, y+z]]` with pairing `tr(B·adj B')`; recomputed `F_1² = F_2² = Δ² = 0` and `F_1·F_2 = F_1·Δ = F_2·Δ = 1`.

| Statement | Instances | Values on each side | Result; change |
| --- | --- | --- | --- |
| Conventions, composition | `f = z²`, `g = z + 1` at `z = 1` | `f.comp g ↦ 2`; `f ∘ g ↦ 4` | holds; none |
| §1.1 (sample) | `z²` in char `2`; Frobenius; projection `ℙ² ⤏ ℙ¹`; tower | `[K(z):K(z²)] = 2`; `p^d`; transcendence degree `1`, `finrank = 0`; `e(g∘f) = e(f)·e(g)` on `f^*g^*K(Z) ⊆ f^*K(Y) ⊆ K(X)` | holds; none |
| §1.2 (sample, headline) | `id`; Cremona; projection; constant `[0:1]` | diagonal; a line over each of 3 points; fibres `ℙ¹`, not generically finite; `Γ = ℙ¹ × pt`, `π_2` not onto | holds; none |
| §1.3 (sample) | `z², z²`; `ℙ¹_ℂ/ℝ` with `id, id`; Cremona | `(q_Y,q_Z)` of degree `2 = e(f)`, not `4`; triple diagonal, degrees `1,1,1`; degree `e(σ) = 1` | holds; none |
| §1.4 | `ℙ¹_ℂ/ℝ`; `𝔾_m → 𝔸¹` at the origin; `z²`; cusp `t ↦ [t²:t³:1]` | two diagonals; source `∅` against inverse image a point; basis `{1, z}`, `2 = 2`; `y²z = t⁶ = x³` | holds; none |
| §2.1 (sample) | `K[ε]/(ε²)`; line ∪ point; `V(xy)` | `2 = 2·1`; `χ(O_Z(n)) = n + 2`, coefficient `1`; `1 + 1 = 2` | holds; none |
| §2.2 (sample) | `ℙ¹×ℙ¹`; blow-up, `O(bE)` | `(n_1+1)(n_2+1)`: `1` and `0`; Riemann–Roch with `E·K = −1`: `1 + (b − b²)/2`, `n_1n_2`-coefficient `−1 = deg O_E(E)` | holds; none |
| §2.3 | `√2·O(1,0) + O(0,1)`; `2·O(1,1) − O(1,0)` | `2·√2·1 = 2√2`; class `O(1,2)`, ruling degrees `2, 1` | holds; none |
| §2.4 (sample) | `ℙ¹_ℂ/ℝ`; pointless conic; `x² + ty²` over `𝔽_2(t)`; pinched `ℙ¹_ℂ` | `c = 2`: `2 = 2·1`; `c = 1`: `2 = 2`; chart `y ≠ 0` is `K'[z]`, `K' = K(√t)`, `c = 2`, `2 = 2·1`; `H⁰ = ℝ`, `ℂ ⊆ K(V)` | holds; none |
| §3.1 approximation | route; `m = 3`, `n = 3`, `δ = 1/5`, `(2.41, 3.41, −1.42)`, `N = 100` | `(β·C) ≥ (ω·C) − n·(δ/2mn)·m(H·C) + (δ/2)(H·C) = (ω·C)`; `A_j = N(Σt'L + δH)`; errors `0.0042, 0.0042, 0.0058 < 1/90`; determinants `−0.0463`, `0.5897`, `26061 − 20164 = 5897` | holds; none |
| §3.1 class `A` | matrix; curve degrees; kernel vector; decomposition of `A + I`; `H/2` on `ℙ²` | `[[1,√2],[√2,2]]`, det `0`, trace `3`; `2, 1, 3 + 2√2`; `A(−√2, 1)ᵀ = 0`; coefficients `2+√2`, `3+√2`, `−√2` with `5 − 3√2 ≈ 0.757 > 0`; `1/4 < 1` | holds; none |
| §3.2 (sample) | `O(1,−1)`; `V(x²)`; `O(2,1)` | `−2`; `2n + 1`, so `2 = 2·1`; square `4`, ruling degrees `1, 2` | holds; none |
| §3.3 | route; `(1,1),(1,0),(0,1)`; `B = (1,−1)`; `E×E`; `(A^r) = 0` | `vol(pA − qB) ≥ p^{r−1}(p(A^r) − rq(A^{r−1}B))`, then `p(A·C) ≥ q(B·C)`; `2 = 2`; `2 ≤ 0` false; `24 ≤ 30`; `0 ≤` right side | holds; none |
| §3.4 | `D''`; `ℙ¹×ℙ¹`; cone; `H = 2L + E`; `E_1, E_2` | `D''·H' = 0`, `D''² = (H'²)((H'²)(D²) − (D·H')²)`; `0 ≥ −4`; `4 = 2·2`; `H² = 3`, `1 ≥ −3`, `4 ≥ 3`; `0 < 1` | holds; none |
| §3.5 (headline) | `(2,1),(1,1)`; `A + εI`; `ℙ² ⊔ ℙ²`; `C = A^{k−1}B^{d−k−1}` | `9 ≥ 8`; `(3+2ε)² − 2(6ε+2ε²) = 9`; `16 < 25`; `s_k² ≥ s_{k−1}s_{k+1}` | holds; none |
| §3.6 (sample, headline) | slices; `(ℙ¹)³`, `i = 2`; `i = r`; `ℙ² ⊔ ℙ²`; positivity | `dim Z_j = r − (j−1) − (i−j) = r−i+1`; on `Z_j`: `y_{j+1}x_j ≤ (r−i+1)·y_j·x_{j+1}`, telescoped to `(r−i+1)^i·(y_1/y_{i+1})·x_{i+1}`; `6 ≤ 4·1·2 = 8`, and `3·1·2 = 6`; equality; `5 ≤ 2` false; `(B^r)(A^r) ≤ c·(A^kB^{r−k})(B^kA^{r−k})` | holds; none |
| §4.1 (sample) | `z²` with models `(id, f)`, `(f, f∘f)`; `√2·O(1)` | `e = 1`: `1, 2`; `e = 2`: `2 = 2·1`; degree `√2`, not in `CH_0 ≅ ℤ` | holds; none |
| §4.2 (sample, headline) | Cremona; `O(1,0)`; `(1.5, 0.5)`; `A, A + I`; `f^*ω ≅ qω` | `(1,2,1)`; `0`; `2·1.5·0.5 = 1.5 < 2`; `0 ≤ 3 ≤ 8`; `e(f)(ω^d) = q^d(ω^d)` | holds; none |
| §4.3 (headline) | `ℙ¹_ℂ/ℝ`, `id`; cuspidal cubic | `2 = 1 + 1`; `ν^*O(1) = O(3)`, `3 = 3` | holds; none |
| §4.4 (headline) | route on `W`; `k = 0, d`; `z², z²`; Frobenius then `z²`; Cremona; `E×E` | `e(f_1)(L_2^d)·deg_k(f_2f_1) ≤ (d−k+1)^k·e(f_1)deg_k(f_2)·deg_k(f_1)`; equalities; `4 ≤ 4`; `2p = p·2`; `1 ≤ 8`; `0 ≤ (2/2)·3·3 = 9` | holds; none |
| §4.5 (sample, headline) | chain `ω', ω, ω, ω'`; swap on `ℙ¹×ℙ¹`; `E×E` | `C_1 = (d−k+1)^{2k}·c(ω,ω')`; `c = 9/4, 9/16`, `C = 9`, ratio `5/2`; `tr = 2 + 7 = 9`, `c = 25/4, 25/64`, `C = 25`, ratio `9/2` | holds; none |
| §5.1 (sample, headline) | `u_0`; lower bound; degree `a`; Cremona | `u_0 = log (d−k+1)^k ≥ 0`; `u_n ≥ log(C_k/C)`; `inf_n ((d−k+1)^k a^{nk})^{1/n} = a^k`, value `(d−k+1)^k a^k` at `n = 1`; `2, 1, 2, 1, …` | holds; none |
| §5.2 (headline) | Fibonacci; Frobenius; `λ_0 = 1` with concavity; `d = 1` | `φ² ≈ 2.618 ≥ 1`; `p^{2k} = p^{k−1}p^{k+1}`; `λ_k ≤ λ_1^k`; range `1 ≤ k ≤ 0` empty | holds; none |
| §5.3 (headline) | Cremona conjugated; cuspidal cubic; `ℙ¹_ℂ/ℝ` | `1 = 1` in each | holds; R01 (locator) |
| §5.4 (sample, headline) | degree `a`; Fibonacci; Cremona | `d·log a`; `0 ≤ 0.4812 ≤ 2·0.4812`; `0` | holds; none |
| §6.1 (sample, repaired) | `σ∘σ`; `(x_0², x_0x_1, x_0x_2)`; `(0,0,1)` then `σ`; `σ ∘ [x_i²]`; constant `g`; `d = 0` | `(x_0x_1x_2)·x_i`; degree `1`; `G(F) = 0`; coprime, `4 = 2·2`; `0 = a·0`; reduced form `(1)`, degree `0` | holds; none |
| §6.2 (headline) | section of `aA − B`; `k = 0`; Cremona | `a·deg_k − deg_{k+1} = (A^{d−k−1}B^k·E) ≥ 0`; `(A^{d−1}·E) = 0`, so `deg_1 = a`; `deg_2 = 1 = 4 − 3` | holds; none |
| §6.3 (sample, headline) | Cremona in dimension `d`; Fibonacci `n = 0, 1, 2, 3`; inverse | `Π_{j≠i}F_j = (Πx)^{d−1}·x_i`; homogenizing `(x^{fib(n−1)}y^{fib n}, x^{fib n}y^{fib(n+1)})`: `[yz : xy : z²]`, `[xyz : xy² : z³]`, `[xy²z² : x²y³ : z⁵]`, degrees `2, 3, 5`; `n = 0` gives `(1, y, z)`, which sends `(2,3,1)` and `(4,6,2)` to different points; `(u,v) ↦ (v/u, u)` | holds; none |
| §6.4 (headline) | `(x², y)`; Hénon; `(y, z, x+yz)`; `(x, xy)` | `[x_0² : x_1² : x_0x_2]`, base point `[0:0:1]`, `(1,2,2)`; `F² = (x+y², y+(x+y²)²)`, degree `4`, inverse `(v − u², u)`; degrees `2, 3, 5`, inverse `(w − uv, u, v)`; fibre over `(0,1)` empty | holds; none |
| Worked examples table | five rows | each row agrees with the Checks of §§4.2, 5.2, 5.4, 6.3, 6.4 | holds; none |

### Sources: the seeded sample

The manifest flags no locator as unverified. Every locator below was opened in the cached text this round.

| Target | Locators opened | Outcome |
| --- | --- | --- |
| 1.1 | `stacks-morphisms` lines 6046–6050; `dinhsibony2005` lines 69–70 | as cited |
| 1.2 | `dinhsibony2005` lines 45–51; `dang2020` lines 21–25; `guedj2010` lines 1099–1110; `stacks-morphisms` lines 488–489 | as cited |
| 1.3 | `dang2020` lines 1285–1288, 1334 | as cited |
| 2.1 | `stacks-varieties` lines 4716–4721, 4784–4788; `kleiman2005` lines 3624–3627 | as cited |
| 2.2 | `stacks-chow` lines 3995–3997 | as cited |
| 2.4 | `stacks-varieties` lines 691–695; `stacks-morphisms` lines 3862–3865 | as cited; condition (3) of Lemma 8.6 is the one used; part (2) of Lemma 38.7 is for quasi-affine morphisms |
| 3.2 | `cutkosky2015` lines 274–287; `lazarsfeld2004` by locator | as cited |
| 3.6 | `dang2020` lines 141–143, 871–883; `dangfavre2021` lines 427–433 | as cited; constant `(r−i+1)^i` at line 874 |
| 4.1 | `dang2020` lines 21–25; `dangfavre2021` lines 436–443, 452–453; `dinhsibony2005` lines 61–63; `russakovskiishiffman1997` lines 499–505 | as cited |
| 4.2 | `dangfavre2021` line 454; `russakovskiishiffman1997` lines 506–511 | as cited |
| 4.5 | `dang2020` lines 31–41; `dangfavre2021` lines 457–460; `dinhsibony2005` lines 256–263 | as cited |
| 5.1 | `dangfavre2021` lines 461–465; `dang2020` lines 42–46; `dinhsibony2005` lines 256–259; `silverman2014` lines 383–389; `truong2020` lines 143–158 | as cited |
| 5.4 | `dinhsibony2005` lines 33–37; `guedj2010` lines 1178–1181 | as cited |
| 6.1 | `stacks-constructions` lines 1267–1274; `silverman2014` lines 43–45, 350–354; `guedj2010` lines 1145–1147; `russakovskiishiffman1997` line 510 | as cited |
| 6.3 | `guedj2010` lines 1272–1282; `russakovskiishiffman1997` lines 542–552; `truong2020` lines 1542–1544; `silverman2014` lines 358–372 | as cited |

Also opened: `stacks-morphisms` lines 2198–2203; `stacks-varieties` lines 4778–4780; `kleiman2005` lines 3803–3808; `cutkosky2015` lines 983–1033; `dang2020` lines 18–20, 27–30, 122, 176, 840–845, 1271–1284; `dangfavre2021` lines 83–84, 148–152, 177–180, 448–451, 464–467; `truong2020` lines 77–89, 159–164, 169, 176, 763, 999–1003, 1104–1106, 1529–1533; `guedj2010` lines 1136–1140; `russakovskiishiffman1997` lines 516–541, 582–583; `silverman2014` lines 373–380, 387. All as cited except R01. All fifteen manifest entries are cited in the README and every cited work has an entry. No source was fetched; the manifest is unchanged by this review.

### Suppliers resolved at their current heads

| Supplier | Where read | Found |
| --- | --- | --- |
| SchemeAndStackFoundations | main | headings §§0.3, 0.7, 0.11, 0.20, 0.30, 2.6, 3.3, 4.11, 4.12, 4.13, 4.16, 4.19, 5.1, 5.2, 5.3, 5.9, 5.10; its §4.13 has Bertini smoothness only, so irreducibility has one owner |
| StableReduction | main | "Layer 2" heading present |
| CyclotomicClassGroupsAndStickelberger | open head | §4.3 defines the numerical intersection as the coefficient of `n₁⋯n_d` and lists polynomiality, symmetry, additivity, the projection formula with the function-field degree and zero on a dimension drop, Cartier restriction, ample positivity, field-extension compatibility |
| AlgebraicModuliForArithmeticGeometryPartII | open head | §0.1 length-weighted law and field invariance; §1.1 `Num(X/S)` and `N¹`; §1.2 Check `ρ(E × E) = 2 + rank End(E)`; §1.4 Check with `[[1,√2],[√2,2]]`; §1.5 nef classes, pullback, base change of Noetherian schemes; §1.7 (ii), (iii), (v) and the two API facts (positive degree of ample sheaves on curves; `L^{⊗m} ⊗ E` ample for large `m`) |
| AlgebraicModuliForArithmeticGeometry | open head | §1.4 relative very ampleness; §5.4 "commutes with flat base change", "For a scheme morphism the construction is exactly `Scheme.Hom.image`"; §9.10 heading (not consumed) |
| ArakelovGeometryAndAbelianHeightsPartII | open head | §0.1 geometric nefness on a projective `k`-variety; §0.3 (1′) and, for `d ≥ 1`, (2′) |
| LefschetzPencilsAndVanishingCycles | open head | §5.1: Bertini irreducibility with `dim g(X) > s`, stated as part of that target |
| ArithmeticDynamics | open head | §0.18 `deg(f g) = deg f · deg g`; §0.26 injective monoid map onto the `K`-endomorphisms of `ℙ¹_K` |

The six open suppliers are pull requests that add a new roadmap folder and are earlier in `merge-order/ORDER.txt`; none is on the never-cite list. The citation resolver lists nothing unresolved; the overlap listing lists no dropped or revision-only id and no second copy. Dependency check, full output:

```text
candidate: DynamicalDegreesOfRationalMaps is not in the merge order yet; checked as if placed after ArakelovGeometryAndAbelianHeightsPartII (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2247 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

### Pinned declarations

Every file-and-line locator of the two library contracts was opened at the pins and matches. Mathlib: `Mathlib/AlgebraicGeometry/Birational/RationalMap.lean` lines 48, 377, 396, 440, 501, 562, 575, 586, 608; `Birational/Dominant.lean:74`; `Birational/Composition.lean` lines 155 (`[f.IsDominant]` on the first map only), 170, 173, 182 (`[IrreducibleSpace X₂] [Nonempty X₃]`, both maps dominant), 193, 217; `Birational/Birational.lean` lines 39, 55, 88, 166, 182; `IdealSheaf/Subscheme.lean` lines 658, 661, 706, 716; `IdealSheaf/Basic.lean:691`; `Morphisms/SchemeTheoreticallyDominant.lean` lines 37, 112; `IdealSheaf/Functorial.lean` lines 39, 79, 139, 163; `FunctionField.lean:37`; `Morphisms/Proper.lean:97`; `ProjectiveSpectrum/Scheme.lean:855`; `RingTheory/MvPolynomial/Homogeneous.lean` lines 87, 613; `RingTheory/Polynomial/UniqueFactorization.lean:128`; `Analysis/Subadditive.lean` lines 33–35, 106 (`sInf` over `Ici 1`), 109, 155 (hypothesis `BddBelow (range fun n => u n / n)`); `LinearAlgebra/Dimension/Free.lean:76`; `Data/Nat/Fib/Basic.lean:56`; `NumberTheory/Real/GoldenRatio.lean:36`. Tau Ceti: `LineBundle/Basic.lean:119`, `Pullback.lean:100`, `TensorProduct.lean:65`, `Dual.lean:44`, `Class.lean` lines 50, 142, `Ample.lean` lines 71, 96, `Degree.lean:130`; `Cohomology/Basic.lean:61`, `Cohomology/EulerCharacteristic.lean:105`; `IntersectionNumber/Basic.lean:111`, `IntersectionNumber/FieldTower.lean:66`; `EffectiveCartierDivisor/Basic.lean:78`; `SchemeTheoreticImage/Basic.lean` lines 65, 78 (namespace `AlgebraicGeometry.Scheme.Hom`, as the README writes it); `Morphisms/Dominant.lean` lines 151, 206, 212, 221; `Scheme/BaseAlgebra.lean` lines 409, 421, 427; `Scheme/FunctionField.lean:101`; `EllipticCurve/Isogeny/FunctionField.lean:167`. By object: a search of the pinned Tau Ceti for a nefness predicate, a topological or dynamical degree and a graph of a rational map finds none under `TauCeti/AlgebraicGeometry`.

### Ownership and overlap

No second copy: main has no `DynamicalDegreesOfRationalMaps` folder, and neither the board index nor the list of open pull requests has a roadmap of this name. Searches of main and all open heads: "dynamical degree", "algebraic entropy", "graph of a rational map", "pullback of function fields": no match. "Khovanskii": only AlgebraicModuliForArithmeticGeometry §9.10, named in Scope with its clause of difference. "Siu's inequality": only ArakelovGeometryAndAbelianHeightsPartII §0.3, imported. "topological degree": three unrelated uses (a dimension remark, a non-archimedean classification, a Chern–Weil degree). "nef real class": only AlgebraicModuliForArithmeticGeometryPartII, imported.

Overlap check: read AlgebraicModuliForArithmeticGeometryPartII, AdicCoefficientsAndComparisonsPartII, ArakelovGeometryAndAbelianHeightsPartII, AbundanceStatement, JacobianChallenge, SchemeAndStackFoundations; nefness, `N¹`, Kleiman and the ample and nef cones: AlgebraicModuliForArithmeticGeometryPartII (imported; AbundanceStatement's Layer 4 is not cited); volume and Siu's volume inequality: ArakelovGeometryAndAbelianHeightsPartII (imported); alterations, Chow operations, the surface pairing and Hodge index: SchemeAndStackFoundations (imported); nothing shared with AdicCoefficientsAndComparisonsPartII or JacobianChallenge.

### Headline theorems and `Suggested.lean`

Headlines (README, "The headline statements"): graph properties (§1.2); Khovanskii–Teissier and Siu for products (§§3.5–3.6); positivity, boundary values and field invariance of the degrees (§§4.2–4.3); sub-multiplicativity and comparison (§§4.4–4.5); existence and properties of `λ_k` and `h_alg` (§§5.1–5.4); projective and affine formulas with the Cremona and Fibonacci computations (§§6.2–6.4). Each is a target with hypotheses and a row above. No `Suggested.lean` exists at the design stage: the one-tactic probe, the `#check` comparison and the import check had nothing to run on.

### Copyright, wording, arrangement, reuse

- Wording, set beside the sources at the locators of the sample table: §1.1, §1.2, §1.3, §2.1, §2.2, §2.4, §3.1, §3.5, §3.6 (same telescoping idea, the README's own `x_j, y_j`), §4.1, §4.4, §4.5, §5.1, §5.4, §6.1, §6.2, §6.3. No sentence or proof plan follows a source clause by clause or translates it; what is shared is formulas (the Fibonacci coordinate formula, the Siu constants) and standard names.
- Arrangement: `dangfavre2021` (17 mentions) and `dang2020` (16) lead. Contents of `dangfavre2021` read at lines 26–61: 1 (1.1 numerical cycles, 1.2 positive cycles, 1.3 dynamical degrees), 2 b-classes, 3 intersection of b-divisors, 4 actions on b-cycles, 5 spectral theory, 6 fractional ideals; only its §1.3 and the setting of Theorem 2 are used, and no layer corresponds to a chapter. `dang2020`: common matter is `§§3.3, 3.6 ↔ 3.4` and `§§4.1, 4.4 ↔ 5.1, 5.2`; Layers 1, 2, 5, 6 have no counterpart. No one-to-one run.
- Reuse: no table, figure or list taken over. The worked-examples table is the roadmap's own; the `ℙ² ⊔ ℙ²` non-example is the case `n = 2` of `cutkosky2015` lines 1015–1020, recomputed and cited.

Source independence: 17 passages compared with 12 sources, none shared; largest share dangfavre2021, 17 of 112 mentions of a source id (dang2020 16); contents compared with dangfavre2021 and dang2020: independent.

## Not verifiable

- Lean elaboration: not available (this lane does not elaborate; say so in the report). No Lean command was run.
- `lazarsfeld2004` (Theorems 1.4.9, 1.6.1, 2.2.15; Corollaries 1.4.10, 1.6.3) and `fulton1998` (Theorem 1.4, Proposition 2.5): settled uncertified, cited by locator, not read. `dang2020` lines 65 and 842 attribute Siu's inequality to Lazarsfeld's Theorem 2.2.13 where the README cites Theorem 2.2.15; which number is right could not be checked without the book.
- The degrees `fib(n + 2)` of the iterates of `(y, z, x + yz)` in the §6.4 Check were computed for `n = 1, 2, 3` only (`2, 3, 5`).
- Ownership against open pull requests was checked on the heads the tools index (main and 477 open roadmap pull requests) and on the board index; packages on other board branches were not opened beyond that index.

## Source issues

- **Misprint** in dinhsibony2005 at Corollaire 7, proof, printed page 7: the source says the roots of the degrees converge to their own infimum; it should be the infimum after multiplying the degrees by the constant; affects the proof.
- **Misprint** in dinhsibony2005 at Corollaire 7, proof, printed page 7: the source says the displayed bound gives `λ(f) ≤ λ(h)`; it should give `λ(h) ≤ λ(f)` first, the other by symmetry; affects the proof.
- **Error** in silverman2014 at Example 5, printed page 9: the source says the indeterminacy loci of the map and of its inverse are disjoint; it should note both contain `[0 : 1 : 0]` (the inverse is `[yz : x² : xz]`); affects nothing.
- **Misprint** in silverman2014 at Example 6, printed page 9: the source says the `n`-th iterate has degree `F_n`; it should be `F_{n+2}` (degrees `2, 3, 5`); affects nothing.
- **Misprint** in guedj2010 at Théorème 2.4 (a), page 33 of the arXiv file: the source says the inequality holds for `1 ≤ l ≤ k`; it should stop at `l = k − 1`, since `λ_{k+1}` is not defined; affects a stated result.
- **Misprint** in cutkosky2015 at §2.2, printed page 6: the source says the Picard group is isomorphic to the group of Cartier divisors; it should be Cartier divisors modulo linear equivalence; affects nothing.
- **Misprint** in dang2020 at Theorem 3.4.4, proof, printed page 18: the source says the final constant is `(n − i + 1)^i`; it should be `(r − i + 1)^i`, as in the statement and the displayed steps; affects nothing.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "90b3432e8b98699a7c5cd6d9c1038807ee58cd40", "job": "REV-DESIGN-DynamicalDegreesOfRationalMaps~13", "model": "fable", "worker": "chris-x80"} -->
