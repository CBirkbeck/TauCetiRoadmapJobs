<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12938#issuecomment-6896101015 -->
Review (claude) of 3642b0a

Verdict: needs_changes

1. **F01** (P3) Scope does not say how the ample approximation of §3.1 differs from the cone statements an earlier roadmap makes

   **Location:** `packages/DynamicalDegreesOfRationalMaps/design/README.md`, Scope and ownership, fourth owned bullet: "with the approximation of nef real classes on a projective scheme by positive rational multiples of ample line bundles (§§3.1–3.2)".

   **Claim:** the roadmap owns the approximation; no other roadmap is named for it. The contract for AlgebraicModuliForArithmeticGeometryPartII §1.7 lists (ii) and two API facts only.

   **Witness:** AlgebraicModuliForArithmeticGeometryPartII §1.7 at its open head, (iii) (`README.md:395`): for projective `X`, the ample cone is the interior of the nef cone and the nef cone its closure, in `N¹(X/k)`; (v): a nef real class plus an ample real class is ample.

   **Repair:** append to that bullet, after "(§§3.1–3.2)": "AlgebraicModuliForArithmeticGeometryPartII §1.7 (iii) and (v) state in `N¹(X/K)`, for projective `X`, that the nef cone is the closure of the ample cone and that a nef real class plus an ample real class is ample. The approximation of §3.1 is the form in `Pic(X) ⊗ ℝ` that the homogeneity argument uses: rational coefficients within a stated tolerance and, for each class, a positive rational multiple of one ample line bundle. Its route uses §1.7 (ii) only." No supplier edge changes (§1.7 is already consumed).

   **Repair test:** on `E × E` (§3.1 Checks) the approximant `(2.41, 3.41, −1.42) + 0.2·(F_1 + F_2)` is `(1/100)(261F_1 + 361F_2 − 142Δ)`, of matrix `[[119, 142], [142, 219]]` and determinant `26061 − 20164 = 5897 > 0`: a point of the ample cone near the boundary class `A`, as (iii) predicts; the tolerance `1/90` and `N = 100` are data §1.7 does not give, which is what the clause says. This is the pattern of the previous round's F02, found on a second object.

2. **F02** (P3) SchemeAndStackFoundations §5.9 is consumed but not named; §5.10's numbers are numerical intersections by §5.9, not through §2.2

   **Location:** `design/README.md`, §2.2: "For `r ≤ 1` it is SchemeAndStackFoundations §3.3's degree. This identifies the numbers of ArakelovGeometryAndAbelianHeightsPartII §0.3 and of SchemeAndStackFoundations §5.10 with numerical intersections."; §3.4 route: "The Hodge index theorem of SchemeAndStackFoundations §5.10, read through §2.2".

   **Claim:** §5.10's Hodge index theorem is stated in Chow degrees and needs §2.2 to be read in Euler-characteristic numbers; SchemeAndStackFoundations §5.9 is not among the imported sections.

   **Witness:** on main, `TauCetiRoadmap/SchemeAndStackFoundations/README.md:8526–8538` (§5.9): `Chow.intersectionNumber k S L M := χ(O_S) − χ(L⁻¹) − χ(M⁻¹) + χ(L⁻¹ ⊗ M⁻¹)`, identified there with the coefficient of `n₁n₂` and, for smooth projective `S`, with `deg(c_1(L) ∩ c_1(M) ∩ [S])`. §5.10 `hodge_index`: "the pairing is §5.9's `Chow.intersectionNumber`".

   **Repair:**
   - Scope, imported list, and the contract `From TauCetiRoadmap.SchemeAndStackFoundations`: add §5.9 ("on a scheme `S` over a field, the pairing `χ(O_S) − χ(L⁻¹) − χ(M⁻¹) + χ(L⁻¹ ⊗ M⁻¹)`; for `S` proper of dimension at most two it is the coefficient of `n_1n_2` in `χ(L^{n_1} ⊗ M^{n_2})`, and for `S` smooth projective it equals `deg(c_1(L) ∩ c_1(M) ∩ [S])`"), and say in the §5.10 entry that its pairing is this one.
   - §2.2: replace the two quoted sentences by "For `r ≤ 1` it is SchemeAndStackFoundations §3.3's degree, and for `Z = X` a smooth projective surface it is SchemeAndStackFoundations §5.9; the statement here is for every proper `X`, every closed `Z` and every `r`. This identifies the numbers of ArakelovGeometryAndAbelianHeightsPartII §0.3 with numerical intersections; those of SchemeAndStackFoundations §5.10 are numerical intersections by its §5.9."
   - §3.4 route: replace "read through §2.2" by "whose pairing is the numerical intersection (SchemeAndStackFoundations §5.9)"; in its *Needs:* line, in the Layer 3 Dependencies and in `plan.json` target 3.4, replace §2.2 by SchemeAndStackFoundations §5.9 (the route uses §§2.3 and 2.4 otherwise).

   **Repair test:** on `ℙ¹ × ℙ¹` with `χ(O(a, b)) = (a + 1)(b + 1)`: for `L = O(1,0)`, `M = O(0,1)` the §5.9 pairing is `1 − 0 − 0 + 0 = 1`, the coefficient of `n_1n_2` in `(n_1 + 1)(n_2 + 1)`; for `L = M = O(1,0)` it is `1 − 0 − 0 + χ(O(−2, 0)) = 1 − 1 = 0 = (O(1,0)²)`. Both agree with §2.2's Checks, so the Hodge step of §3.4 on the smooth `S'` closes with §5.9 and without §2.2.

Two findings, both P3 (no P1, no P2): each carries a repair, so a fix round applies them before the design is accepted. The four findings of the previous review are repaired. Lean elaboration: not available (this lane does not elaborate; say so in the report); the design has no `Suggested.lean`, so nothing was elaborated or probed. No declared supplier gaps (`plan.json` `gaps` is empty). No maintainer notes were given.

## Previous findings (round 7), checked first

| Finding | Repaired passage | Status |
| --- | --- | --- |
| F01 (P3): Layer 6 does not state `d ≥ 1` | Layer 6 opens "Throughout, `d ≥ 1`. On `ℙ⁰ = Spec K` the identity has the reduced form `(1)`, of degree `0` (§6.1, Checks)."; new Checks in §6.1 ("Non-example for `d = 0` …") and §6.4 (the empty tuple); `plan.json` targets 6.2, 6.3, 6.4 carry `d ≥ 1` (6.1 had it), with tests `point_projective_space` and `empty_tuple` | **Repaired.** |
| F02 (P3): Scope silent on §3.5 against the earlier log-concavity bound | Scope: "AlgebraicModuliForArithmeticGeometry §9.10 proves the log-concavity of `p ↦ (H^p · L^{n−p})` for an ample `L` and a nef `H` on a smooth projective geometrically integral variety over a field of characteristic zero … §3.5 is the statement for integral projective varieties over every field and for all nef real classes, with the mixed factors `C_j`. It does not use §9.10." | **Repaired.** Checked at that roadmap's open head: §9.10 "All varieties in this paragraph are smooth, projective and geometrically integral over a characteristic-zero field"; `nefMixedIntersectionBound` with the displayed log-concavity. |
| F03 (P3): §3.3 planned an imported fact nothing consumes | §3.3: "A nef line bundle `A` with `(A^r) > 0` is big, with `vol(A) = (A^r)`, by ArakelovGeometryAndAbelianHeightsPartII §0.3 (1′) read through §2.2. This is imported, not a target, and the route below does not use it."; the bigness sentence is gone from the route and from `plan.json` target 3.3 | **Repaired.** (1′) read at the supplier's head: "If L is nef then vol(L) = L^d", for a projective variety over any field. |
| F04 (P3): Scope excluded "correspondences" while §1.3 defines one | Scope: "The dynamics of correspondences, and resolution of singularities. A dominant correspondence from `X` to `Y` is a multivalued map. It is given by a cycle on `X ×_K Y` whose components have dimension `dim X` and project dominantly onto both factors (truong2020 lines 77–89) … only this case is composed and iterated here. §1.3 calls the subvariety `W_{f,g}` the correspondence of a composite …" | **Repaired** (differently from the suggested text, correctly: truong2020 lines 85–86 count a rational map as an irreducible correspondence, and `W_{f,g} → Γ_g` has degree `e(f)`). Definition checked at truong2020 lines 78–88; Theorem 1.1 starts at line 143. The manifest locator of `truong2020` now names the notation paragraph. |

Pattern search in the rest of the design. F01 (degenerate dimension): Layers 4 and 5 state `d ≥ 1`; Layers 1–3 allow `d = 0` and I instantiated it (§2.4 with `V = Spec L`: `K' = L`, `W = Spec Ω`, `c_V = [L : K]`; §3.2 with `r = 0`: `χ(O_Z) ≥ 0`); §3.3 has `r ≥ 1`, §3.5 `d ≥ 2`, §3.6 `1 ≤ i ≤ r`: no further gap. F02 (an owned statement beside an earlier roadmap's): two further instances, R01 and R02. F03 (a target that only restates an import): none found. F04 (Scope against the text): the excluded items (numerical cycle spaces of codimension `≥ 2`, currents, b-classes, heights, resolution) are used nowhere; §4.1 uses Chow groups with real coefficients, which the Scope does not exclude.

## Verified sound

### Principles, shape, house style

- General library: arbitrary field, no normality, geometric integrality only where a base-changed map must be a map of varieties; inseparable degree counted. No algorithm, no `set_option`, no sorry'd data, no Lean file at this stage.
- Shape: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, six layers each ending with Examples and Dependencies, Downstream consumers, Worked examples, References. `plan.json`: 27 targets; the seven definitions and constructions (1.1, 1.2, 1.3, 2.3, 4.1, 5.1, 5.4) carry 6, 5, 4, 4, 4, 3, 4 tests; every target has at least 3; `gaps` is empty.
- Organisation: layers are named by their mathematics and the order is forced by the *Needs:* lines (Layer 3 needs §§2.1–2.4; §4.4 needs §§1.3 and 3.6; Layer 5 needs §§4.2–4.5; Layer 6 needs §§3.2, 4, 5); Layers 1 and 2 are independent and say so.
- Process residue: searched the README mechanically for pull-request numbers, round labels, machine paths, LaTeX delimiters, "so far", "checkpoint", "handoff": none. The roadmap attributes no backticked Lean name to itself; every backticked name is a pinned declaration (below).

### Adversarial table (values computed this round)

On `E × E` without CM: `xF_1 + yF_2 + zΔ ↦ [[x+z, −z], [−z, y+z]]`, intersection `tr(B·adj B')`, `I = F_1 + F_2 ↦ diag(1,1)`, `A ↦ [[1, √2], [√2, 2]]`.

| Statement | Instances | Values on each side | Result; change |
| --- | --- | --- | --- |
| Scope, correspondences (changed) | `Γ_{z²}`; `2Γ_{z²}`; `{x = y²}`; `W_{z²,z²}`; `W_{σ,σ}` | one component, multiplicity 1, `π_1` birational: a rational map; multiplicity 2: not one; `π_1` of degree 2: multivalued; onto `Γ_g` of degree `2 = e(f)`, not birational; degrees `1, 1, 1` | accurate; none |
| Scope, §9.10 clause (changed) | `ℙ¹×ℙ¹`, `H = O(1,0)`, `L = O(1,1)`; `A` on `E × E` | `s = (2, 1, 0)`, `1 ≥ 2·0`; `(A·I)² = 9 ≥ 0·2`, a real class, outside §9.10 | accurate; none |
| §3.3 remark and route (changed) | `O(1,1)`, `O(1,0)`, `O(1,−1)` on `ℙ¹×ℙ¹`; route with `B = O(1,0)`, `C = O(0,1)`; `(A^{r−1}·B) = 0` | `vol = 2 = (A²)`; `0 = (A²)`; `vol = 0 ≠ −2` (nefness needed); `p > q`, `vol(O(p−q, p)) = 2p(p−q)` equals the (2′) bound, limit `p/q → 1` gives `2 ≤ 2`; `(B·C) ≤ (p/q)(A·C) → 0` | holds, route closes on (2′) alone; none |
| Layer 6 `d ≥ 1` (changed) | `d = 0` identity; `d = 1` constant `[0:1]`; `d = 1`, `F = (x)` in §6.4 | reduced form `(1)`, degree `0`, dominant; `f^0 = id` of degree `1 = 0^0`, `f^n` of degree `0`; `a = 1`, extension `[x_0 : x_1]` | false at `d = 0`, true for `d ≥ 1`; none |
| §1.3 composite (sample) | `z², z²`; `σ, σ`; `ℙ¹_ℂ/ℝ`, identities | `(q_Y, q_Z)` of degree `2 = e(f)`, not `4`; `σ∘σ = id`, degree `e(σ) = 1`; `ℂ ⊗_ℝ ℂ = ℂ²`, `W` the triple diagonal, degrees `1, 1, 1` | holds; none |
| §1.4 base change (sample) | `id` of `ℙ¹_ℂ/ℝ`; `𝔾_m → 𝔸¹` at `t = 0`; `z²`; projection `ℙ² ⤏ ℙ¹` | two diagonals; `K[t, t⁻¹]/(t) = 0`, image `∅` against inverse image `Spec K`; basis `{1, z}`, `2 = 2`; `1, v, v², …` independent, `e = 0 = 0` by dimension | holds; none |
| §2.2 Chow comparison (sample) | `ℙ²`; `ℙ¹×ℙ¹`; §5.9 pairing | `1 = 1`; `(n_1+1)(n_2+1)` gives `1` and `0`; `1 − 0 − 0 + 0 = 1`, `1 − 0 − 0 − 1 = 0` | holds; R02 (citation) |
| §2.4 reduction | `Spec L`; `ℙ¹_ℂ/ℝ`; `x² + ty²` over `𝔽_2(t)` | `c = [L:K]`; `c = 2`, `2 = 2·1`; `χ_K(O_V(n)) = 2n+1`, chart `K[x,z]/(x²+t) = K'[z]`, `c = 2·1`, `2 = 2·1` | holds; none |
| §3.1 ample approximation | `m = n = 3`, `δ = 1/5`, `(2.41, 3.41, −1.42)`; `H/2` on `ℙ²` | raw determinant `1.9701 − 2.0164 = −0.0463`; with `δH`: `2.6061 − 2.0164 = 0.5897`; `N = 100`: `[[119,142],[142,219]]`, `5897`; `(β·C) ≥ 0 − 3·(1/90)·3(H·C) + (1/10)(H·C) = 0`; `1/4 < 1` | holds; R01 (Scope clause) |
| §3.1 class `A` | decomposition of `A + I` | `(2−√2)[[1,1],[1,1]] + (√2−1)[[1,2],[2,4]] + diag(1,0) + (5−3√2)diag(0,1) = [[2,√2],[√2,3]]`; degrees `2, 1, 3+2√2` on `F_1, F_2, Δ` | holds; none |
| §3.3 Siu (sample) | `(1,1),(1,0),(0,1)`; `B = (1,−1)`; `E×E`: `A+I, A, I` | `2·1 ≤ 2·1·1`; `2 ≤ 0` false; `8·3 = 24 ≤ 2·3·5 = 30` | holds; none |
| §3.4 Hodge (sample) | blow-up `H = 2L+E`, `D = E`, `D = L`; `H = E_1`, `D = E_2`; `D''` | `H² = 3`, `1 ≥ −3`, `4 ≥ 3`; `0 ≥ 1` false (`H² = −1`); `(D''·H') = 0`, `(D''²) = (H'²)((H'²)(D²) − (D·H')²)` | holds; R02 (citation) |
| §3.5 Khovanskii–Teissier (headline) | `(2,1),(1,1)`; `A + εI`, `I`; `ℙ² ⊔ ℙ²` | `9 ≥ 4·2`; `(3+2ε)² − (12ε+4ε²) = 9`; `16 < 25` | holds; none |
| §3.6 product Siu (sample, headline) | `(ℙ¹)³`, `i = 2`; telescoping on `Z_j` of dimension `r−i+1`; `ℙ² ⊔ ℙ²`; consequence | `6 ≤ 4·1·2 = 8`; `x_j ≤ (r−i+1)(y_j/y_{j+1})x_{j+1}` with `(B^{r−i+1}·Z_j) = y_{j+1}`, product `x_1 ≤ (r−i+1)^i (y_1/y_{i+1}) x_{i+1}`; `5 ≤ 2` false; `(B^r)(A^r) ≤ (r−k+1)^k (A^kB^{r−k})(B^kA^{r−k})` forces both factors positive | holds; none |
| §4.1 mixed degrees (sample) | `z²` with models `(id, f)`, `(f, f∘f)`; `√2·O(1)` | `(1, 2)`; `(f^*H) = 2 = 2·1`; degree `√2 ∉ ℤ` | holds; none |
| §4.2 values, positivity (sample) | Cremona; Frobenius; `O(1,0)`; `(1.5, 0.5)`; `A ≤ A + I` | `(1, 2, 1)`; `p^k`, `e = p^d`; `0`; `2·1.5·0.5 = 1.5 < 2`; `0 ≤ 3 ≤ 8` | holds; none |
| §4.4 sub-multiplicativity (sample, headline) | route on `W`; `k = 0`, `k = d`; `z², z²`; `σ, σ`; `E×E` | `(B^d) = e(f_1)(L_2^d)`, `(A^kB^{d−k}) = e(f_1)deg_k(f_2)`, quotient is the stated constant; `(L_1^d) = (L_1^d)(L_2^d)/(L_2^d)`, `e(f_2f_1) = e(f_1)e(f_2)`; `4 ≤ 4`; `1 ≤ 8`; `0 ≤ (2/2)·3·3` | holds; none |
| §4.5 comparison (sample, headline) | two applications of §4.4; swap on `ℙ¹×ℙ¹`; `E×E` | `C_1 = (d−k+1)^{2k}(ω'^{d−k}ω^k)(ω^{d−k}ω'^k)/(ω^d)²`; `c = 9/4, 9/16`, `C = 9`, ratio `5/2`; `tr([[2,√2],[√2,3]]·[[2,−√2],[−√2,3]]) = 2 + 7 = 9`, `C = 25` | holds; none |
| §5.1 existence (sample, headline) | `u_0`; morphism of degree `a`; Cremona | `u_0 = log((d−k+1)^k) ≥ 0`, as `Subadditive` at `m = n = 0` needs; `inf_n ((d−k+1)^k a^{nk})^{1/n} = a^k`; `2, 1, 2, 1, …`, `λ_1 = 1` | holds; none |
| §5.2 properties (sample) | Fibonacci; Frobenius; concavity | `(1, φ, 1)`, `φ² = 2.618 ≥ 1`; `p^k`, equality; `log λ_k ≤ k·log λ_1` from `log λ_0 = 0` | holds; none |
| §5.4 entropy (sample, headline) | degree `a`; Fibonacci; `n = 0` | `d·log a`; `log φ = 0.4812`, at `k = 1` only, `0 ≤ 0.48 ≤ 0.96`; `h(id) = 0` | holds; none |
| §6.1 forms (sample) | `σ∘σ`; `(x_0², x_0x_1, x_0x_2)`; `(0,0,1)` then `σ`; `σ ∘ [x_i²]` | `x_0x_1x_2·(x_0, x_1, x_2)`; degree `1`; `G(F) = 0`; coprime, `4 = 2·2` | holds; none |
| §6.2 degrees on `ℙ^d` (sample) | section of `aA − B`; `k = 0`; Cremona | `y_j ↦ F_j(x)`, zero scheme over `V(F)`; `(A^{d−1}·E) = 0` since `dim V(F) ≤ d−2`, so `deg_1 = a`; `deg_2 = 1 = 4 − 3` | holds; none |
| §6.3 examples (headline) | Fibonacci `n = 1, 2, 3`; inverse | affine `(y, xy)`, `(xy, xy²)`, `(xy², x²y³)`; degrees `2, 3, 5 = fib(n+2)`; `(u, v) ↦ (v/u, u)` | holds; none |
| §6.4 affine maps (headline) | `(x², y)`; `(y, z, x+yz)` | `[x_0² : x_1² : x_0x_2]`, base point `[0:0:1]`, `(1, 2, 2)`, `4 ≥ 1·2`; degrees `2, 3, 5` | holds; none |

Note, no change asked: in §§3.3 and 3.6 the hypotheses `(A^r) > 0` and `(B^r) > 0` are needed by the routes (a ratio is formed), not by the truth of the inequalities, which read `0 ≤` a nonnegative number when the top power vanishes.

### Sources: the seeded sample

The manifest flags no locator as unverified. Every locator below was opened in the cached text and matches (number, line, hypotheses).

| Target | Locators opened | Outcome |
| --- | --- | --- |
| 1.3 | `dang2020` lines 1285–1334 | the auxiliary graph and diagram (5.1); the roadmap's `W_{f,g}` is its own construction |
| 1.4 | `stacks-morphisms` line 2198 (Lemma 26.16, 081I: flat `f`, quasi-compact `g`); `truong2020` lines 1529–1533 | as cited; the reducibility warning is at line 1532 |
| 2.2 | `stacks-chow` lines 3995–3997 (Lemma 41.4, 0BFI) | proper `X`, closed `Z` of dimension `d`: as stated |
| 3.3 | `dang2020` lines 840–869; `dangfavre2021` line 434 | Siu with constant `r`; `C_d = d` for `k = 1` |
| 3.4 | `kleiman2005` lines 3803–3808 (Theorem B.27); `cutkosky2015` lines 994–1003 | geometrically irreducible complete surface, any `H` of positive square; the README's wider statement has its own route |
| 3.6 | `dang2020` lines 141–143, 871–883; `dangfavre2021` lines 427–433 | constant `(r − i + 1)^i` at line 874 |
| 4.1 | `dang2020` lines 21–25; `dangfavre2021` lines 436–443, 452–453; `dinhsibony2005` lines 61–63; `russakovskiishiffman1997` lines 499–505 | `k` copies from the target in each |
| 4.2 | `dangfavre2021` line 454; `russakovskiishiffman1997` lines 506–511 | integrality; topological degree; `(deg P)^ℓ` for morphisms |
| 4.4 | `dang2020` lines 27–30, 1271–1284, 1352–1358; `dangfavre2021` lines 448–451; `truong2020` lines 143–158; `dinhsibony2005` lines 245–247; `silverman2014` line 387 | constant `(e−i+1)^i/(…)` at line 1284; Truong's item gives the limit, the others the inequality |
| 4.5 | `dang2020` lines 31–41; `dangfavre2021` lines 457–460; `dinhsibony2005` lines 256–263 | as cited |
| 5.1 | `dangfavre2021` lines 461–465; `dang2020` lines 42–46; `dinhsibony2005` lines 256–259; `silverman2014` lines 383–392 | as cited |
| 5.2 | `guedj2010` lines 1136–1140, 1180; `dinhsibony2005` lines 69–70; `dangfavre2021` lines 464–467 | as cited; the README's range `1 ≤ k ≤ d − 1` corrects the source's |
| 5.4 | `dinhsibony2005` lines 33–37; `guedj2010` lines 1178–1181 | as cited |
| 6.1 | `stacks-constructions` lines 1267–1273 (Lemma 13.1, 01NE); `silverman2014` lines 350–357; `guedj2010` lines 1145–1147; `russakovskiishiffman1997` line 510 | as cited |
| 6.2 | `russakovskiishiffman1997` lines 516–519, 542–552, 582–583; `guedj2010` lines 1141–1147 | equality condition at line 518; `δ_2 = (deg P)² − q` at line 542 |

Also opened: `truong2020` lines 77–89, 159–181, 598–601, 1536–1544; `stacks-morphisms` lines 488, 3862–3865, 6046–6049; `stacks-varieties` lines 691, 4716, 4784; `kleiman2005` line 3624; `cutkosky2015` lines 274–287, 983–987, 1014–1033; `silverman2014` lines 358–380; `guedj2010` lines 1099–1104, 1272–1276; `dangfavre2021` lines 176–180. All fifteen manifest entries are works the README cites, and every cited work has an entry. No source was fetched and the manifest was not changed by this review.

### Suppliers resolved at their current heads

| Supplier | Where read | Found |
| --- | --- | --- |
| SchemeAndStackFoundations | main | §§0.3, 0.7, 0.11, 0.20, 0.30, 2.6, 3.3, 4.11, 4.12, 4.13 (`regularLocus_eq_smoothLocus` over a perfect field), 4.16, 4.19 (`alteration_theorem`), 5.1–5.3, 5.10 (`hodge_index`: `H² > 0`, `D·H = 0` give `D² ≤ 0`); §5.9 is R02 |
| StableReduction | main | Layer 2 (tensor powers, pullback, global generation, projective morphisms) |
| CyclotomicClassGroupsAndStickelberger | open head | §4.3: the numerical intersection as the coefficient of `n₁⋯n_d`, with polynomiality, symmetry, additivity, projection formula with function-field degree and zero on dimension drop, Cartier restriction, ample positivity, field extension |
| AlgebraicModuliForArithmeticGeometryPartII | open head | §0.1 (length-weighted one-cycle), §1.1 (`Num(X/S) = Pic(X)/Pic^τ`, so `Pic(X) ⊗ ℝ → N¹` is onto), §1.2 Check (`ρ(E×E) ∈ {3, 4, 6}`), §1.4 Check (the matrix `[[1,√2],[√2,2]]`), §1.5 (pullback; base change of Noetherian schemes), §1.7 (ii) and API (ample positive on curves; `L^m ⊗ E` ample) |
| AlgebraicModuliForArithmeticGeometry | open head | §1.4 (`amplePowersAndFixedTwists`), §5.4 (schematic image "commutes with flat base change"), §9.10 |
| ArakelovGeometryAndAbelianHeightsPartII | open head | §0.1 (geometric analogue: nef means nonnegative degree on curves), §0.3 ((1′), and (2′) for `d ≥ 1`, any field) |
| LefschetzPencilsAndVanishingCycles | open head | §5.1: Bertini irreducibility with `dim g(X) > s` |
| ArithmeticDynamics | open head | §0.18 (monoid of classes of lifts, multiplicative degree), §0.26 (injective monoid map onto `K`-endomorphisms of `ℙ¹_K`) |

All eight are on main or earlier in the merge order (lines 34, 35, 69, 262, 339, 341 of `merge-order/ORDER.txt`); none is on the never-cite list. Dependency check, full output:

```text
candidate: DynamicalDegreesOfRationalMaps is not in the merge order yet; checked as if placed after ArakelovGeometryAndAbelianHeightsPartII (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2235 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

### Pinned declarations opened

Every file-and-line locator of the two library contracts was opened at the pins, and each line carries the named declaration: 47 in Mathlib (`AlgebraicGeometry/Birational/RationalMap.lean` 48, 377, 396, 440, 501, 562, 575, 586, 608; `Dominant.lean` 74; `Composition.lean` 155, 170, 173, 182, 193, 217; `Birational.lean` 39, 55, 88, 166, 182; `IdealSheaf/Subscheme.lean` 658, 661, 706, 716; `IdealSheaf/Basic.lean` 691; `Morphisms/SchemeTheoreticallyDominant.lean` 37, 112; `IdealSheaf/Functorial.lean` 39, 79, 139, 163; `FunctionField.lean` 37; `Morphisms/Proper.lean` 97; `ProjectiveSpectrum/Scheme.lean` 855; `RingTheory/MvPolynomial/Homogeneous.lean` 87, 613; `RingTheory/Polynomial/UniqueFactorization.lean` 128; `Analysis/Subadditive.lean` 33, 35, 106, 109, 155; `LinearAlgebra/Dimension/Free.lean` 76; `Data/Nat/Fib/Basic.lean` 56; `NumberTheory/Real/GoldenRatio.lean` 36) and 25 in Tau Ceti (`LineBundle/Basic.lean` 119, `Pullback.lean` 100, `TensorProduct.lean` 65, `Dual.lean` 44, `Class.lean` 50 and 142, `Ample.lean` 71 and 96, `Cohomology/Basic.lean` 61, `Cohomology/EulerCharacteristic.lean` 105, `LineBundle/Degree.lean` 130, `IntersectionNumber/Basic.lean` 111, `IntersectionNumber/FieldTower.lean` 66, `EffectiveCartierDivisor/Basic.lean` 78, `SchemeTheoreticImage/Basic.lean` 65 and 78, `Morphisms/Dominant.lean` 151, 206, 212, 221, `Scheme/BaseAlgebra.lean` 409, 421, 427, `Scheme/FunctionField.lean` 101, `EllipticCurve/Isogeny/FunctionField.lean` 167; `Birational/AlgHom.lean` exists). What the native definitions say and do not: `comp (f : X ⤏ Y) [f.IsDominant] (g : Y ⤏ Z)` applies `f` first; `Birational X Y := Nonempty (PartialIso X Y)` carries no map and no base; `tendsto_lim` asks `BddBelow (range fun n => u n / n)` over all `n`, and `Subadditive` at `m = n = 0` asks `u_0 ≥ 0`, which holds here (`u_0 = k·log(d − k + 1)`).

### Ownership and overlap

Searched main and the 475 indexed open heads by object: `dynamical degree`, `algebraic entropy`, `graph of a rational map` (no match anywhere); `Khovanskii` (only AlgebraicModuliForArithmeticGeometry §9.10, now named in Scope); `0BFI` (only SchemeAndStackFoundations §5.9: R02); `closure of Amp` (only AlgebraicModuliForArithmeticGeometryPartII §1.7: R01); `topological degree` (no hit on the degree of a rational map). Main has no `DynamicalDegreesOfRationalMaps` folder; the board index and the open list show no other package or pull request of that name. `scratch/overlaps.md` lists no shared pull request, no dropped id, no revision-only id and no second copy.

Overlap check: read AlgebraicModuliForArithmeticGeometryPartII, AdicCoefficientsAndComparisonsPartII, ArakelovGeometryAndAbelianHeightsPartII, AbundanceStatement, JacobianChallenge, SchemeAndStackFoundations; nefness, `N¹`, Kleiman and the ample and nef cones: AlgebraicModuliForArithmeticGeometryPartII (imported here; R01 asks for the clause on the cones); volume and Siu's volume inequality: ArakelovGeometryAndAbelianHeightsPartII (imported); alterations, Chow operations, the surface pairing and Hodge index: SchemeAndStackFoundations (imported; R02 names §5.9); nothing shared with the other three.

### Headline theorems and `Suggested.lean`

Headlines (README, "The headline statements"): graph properties (§1.2); Khovanskii–Teissier and product Siu (§§3.5–3.6); positivity, boundary values and field invariance of the degrees (§§4.2–4.3); sub-multiplicativity and comparison (§§4.4–4.5); existence and properties of `λ_k` and `h_alg` (§§5.1–5.4); the projective and affine formulas with the Cremona and Fibonacci computations (§§6.2–6.4). Each is a target with hypotheses and has a row above. The design has no `Suggested.lean`: no declaration, so the one-tactic probe, the `#check` comparison and the import check had nothing to run on.

### Copyright, wording, arrangement, reuse

- Wording: set beside the sources at their locators: the Scope's definition of a correspondence (`truong2020` lines 77–89), §3.3 statement and route (`dang2020` lines 842–866: a class inequality proved by an exact sequence there, an intersection inequality through the imported volume bound here), §3.6 route (`dang2020` lines 876–883), §4.4 route (`dang2020` lines 1285–1358: normalized graphs and a general fibre there, the triple-product image here), §4.1 definition (`dangfavre2021` lines 436–443), §4.5 (`dangfavre2021` lines 457–460, `dinhsibony2005` lines 256–263), §5.1 route (`silverman2014` lines 383–392), §5.4 (`dinhsibony2005` lines 33–37), §6.2 (`russakovskiishiffman1997` lines 516–519), §6.3 (`silverman2014` lines 358–372), §1.4 (`truong2020` lines 1529–1533), §2.1 (`stacks-varieties` line 4784, `kleiman2005` line 3624), §2.2 (`stacks-chow` line 3995), §3.4 (`kleiman2005` line 3803, `cutkosky2015` lines 994–1003), §3.5 non-example (`cutkosky2015` lines 1014–1020). No sentence or proof plan follows a source clause by clause; the shared runs are formulas (the Fibonacci iterate, the Cremona forms, the component sum).
- Arrangement: `dang2020` and `dangfavre2021` share the largest count. `dang2020` contents (lines 214–1437): 1 Chow group, 2 numerical cycles, 3 positivity, 4 relative classes, 5 dynamics, 6 semi-conjugation. Common matter: `Layer 3 ↔ §3` (only its §3.4), `Layer 4 ↔ §§5.1–5.2`; Layers 1, 2, 5, 6 have no counterpart and its §§1, 2, 4, 6 none here. `dangfavre2021` contents (lines 315–2126): 1 positive cycles, 2–3 b-classes, 4–5 spectral theory, 6 polynomial maps; only its §1.3 is used. No one-to-one run.
- Reuse: no table, figure or list is taken over. The worked-examples table is the roadmap's own. The `ℙ² ⊔ ℙ²` counterexample is one instance (`n = 2`) of `cutkosky2015` lines 1014–1020, recomputed and cited.

Source independence: 16 passages compared with 10 sources, none shared; largest share dang2020 and dangfavre2021, 15 each of 91 locators; contents compared with dang2020 and dangfavre2021: independent.

## Not verifiable

- Lean elaboration: not available (this lane does not elaborate; say so in the report). No Lean command was run.
- `lazarsfeld2004` (Theorems 1.4.9, 1.6.1, 2.2.15; Corollaries 1.4.10, 1.6.3) and `fulton1998` (Theorem 1.4, Proposition 2.5): settled uncertified, cited by locator, not read. `dang2020` line 842 attributes Siu's inequality to Lazarsfeld's Theorem 2.2.13 where the README cites 2.2.15; the book could not be opened to decide.
- Ownership against open pull requests was checked on the heads the tools index (main and 475 open roadmap pull requests) and on the board index; packages on other board branches were not opened beyond that index.

## Source issues

- **Error** in dang2020 at Proposition 3.4.1, printed page 17, and Theorem 3.4.4, printed page 18: the source says the ratio form of Siu's bound holds on every closed subscheme; it should require irreducible support (two planes give `5 ≤ 2`); affects a stated result.
- **Misprint** in dang2020 at Proposition 3.4.1, proof, printed page 17: the source says the section count of the difference strictly exceeds the difference of the section counts; it should be a weak inequality; affects the proof.
- **Misprint** in dang2020 at Theorem 3.4.4, proof, printed page 18: the source says the final constant is a power of `n − i + 1`; it should be `r − i + 1`, as in the statement; affects nothing.
- **Misprint** in dinhsibony2005 at Corollaire 7, proof, printed page 7: the source says the roots of the degrees converge to their own infimum; it should be the infimum after multiplying the degrees by the constant; affects the proof.
- **Misprint** in dinhsibony2005 at Corollaire 7, proof, printed page 7: the source says the displayed bound gives `λ(f) ≤ λ(h)`; it should give `λ(h) ≤ λ(f)` first, the other by symmetry; affects the proof.
- **Error** in silverman2014 at Example 5, printed page 9: the source says the indeterminacy loci of the map and of its inverse are disjoint; it should note both contain `[0 : 1 : 0]`; affects nothing.
- **Misprint** in silverman2014 at Example 6, printed page 9: the source says the `n`-th iterate has degree `F_n`; it should be `F_{n+2}` (degrees `2, 3, 5`); affects nothing.
- **Misprint** in guedj2010 at Théorème 2.4 (a), printed page 31: the source says the inequality holds for `1 ≤ l ≤ k`; it should stop at `l = k − 1`, since `λ_{k+1}` is not defined; affects a stated result.
- **Misprint** in cutkosky2015 at §2.2, printed page 6: the source says the Picard group is isomorphic to the group of Cartier divisors; it should be Cartier divisors modulo linear equivalence; affects nothing.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "3642b0aec34ff31f2ef48ac2b0cf59944f039c6c", "job": "REV-DESIGN-DynamicalDegreesOfRationalMaps~8", "model": "fable", "worker": "chris-x82"} -->
