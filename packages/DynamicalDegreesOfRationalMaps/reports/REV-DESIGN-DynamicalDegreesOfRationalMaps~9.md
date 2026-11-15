<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12938#issuecomment-6897152453 -->
Review (claude) of a52bb06

Verdict: needs_changes

1. **F01** (P3) §4.4 cites a Truong item that states a limit, not the inequality

   **Location:** `packages/DynamicalDegreesOfRationalMaps/design/README.md`, §4.4, locator parenthesis: "truong2020 Theorem 1.1 (1), lines 143–158"; the same locator in `design/plan.json`, target 4.4.

   **Claim:** the cited item supports sub-multiplicativity of the degrees.

   **Witness:** `truong2020` lines 150–158: item 1) says a limit of `n`-th roots exists and is independent of choices; it has no inequality. The inequality is `truong2020` Lemma 4.5, lines 999–1003, and the proof of Theorem 5.3, lines 1105–1106.

   **Repair:** in §4.4 and in `plan.json` target 4.4 replace "truong2020 Theorem 1.1 (1), lines 143–158" by "truong2020 Lemma 4.5, lines 999–1003, and the proof of Theorem 5.3, lines 1105–1106, for correspondences of smooth projective varieties over an algebraically closed field". Move "truong2020 Theorem 1.1 (1), lines 143–158" to the locator list of §5.1 (existence of the limit). Add "Lemma 4.5; Theorem 5.3" to the `locator` of `truong2020` in `sources.toml`, and "§5.1" to its `cited_for`. Tested: lines 1002 and 1106 each carry an inequality `deg(f ∘ g) ≤ C·deg(f)·deg(g)` of the shape §4.4 states.

2. **F02** (P3) §3.1's field-extension item says "projective" where its argument and its imports give "proper"

   **Location:** `design/README.md`, §3.1: "For every projective `K`-scheme `X`, `L` is nef on `X` if and only if `L_{K'}` is nef on `X_{K'}`"; Scope, fourth owned bullet: "§3.1 proves, for projective `X` and every extension `K'/K`"; `plan.json` target 3.1, first hypothesis.

   **Claim:** projectivity is needed.

   **Witness:** each step is stated for proper schemes: the forward direction (AlgebraicModuliForArithmeticGeometryPartII §1.5, `f : X → S` proper), field-extension compatibility (CyclotomicClassGroupsAndStickelberger §4.3, proper `k`-scheme) and §2.1 (`X` proper over `K`). Instance: `ℙ¹_ℂ` over `ℝ`, `O(±1)`: `±2 = ±1 ± 1`.

   **Repair:** replace "projective `K`-scheme" by "proper `K`-scheme" in the §3.1 item, "for projective `X`" by "for proper `X`" in the Scope clause, and "X projective (for the field-extension item) or proper over K" by "X proper over K" in `plan.json`. The only consumer, the reduction item of §3.1, applies it to the projective `Ṽ` and is unaffected.

3. **F03** (P3) §§2.3 and 3.1 carry no source locator in the README, though `plan.json` records them

   **Location:** `design/README.md`, §2.3 and §3.1 (no source id in either subsection); `plan.json` targets 2.3 and 3.1, `locator`.

   **Claim:** every statement carries its locator in the text.

   **Witness:** `plan.json` 2.3: "dangfavre2021 §1.3, lines 436–443; stacks-varieties Lemma 45.5 (tag 0BER), line 4778"; 3.1: "cutkosky2015 §2.2, lines 274–287". Both opened: line 4778 is additivity of the intersection number; lines 281–287 define nef and ample real classes over any field.

   **Repair:** in §2.3, after "using additivity (CyclotomicClassGroupsAndStickelberger §4.3)", add "(stacks-varieties Lemma 45.5, tag 0BER, line 4778; dangfavre2021 §1.3, lines 436–443, for real classes as polarizations)". In §3.1, after the sentence defining nef real classes, add "(cutkosky2015 §2.2, lines 274–287, for nef and ample real classes over an arbitrary field)". Add "§2.3" to `cited_for` of `stacks-varieties` and `dangfavre2021`, and "§3.1" to that of `cutkosky2015`, where absent.

Three findings, all P3 (no P1, no P2); each carries a repair, so the verdict asks for changes: a fix round applies R01–R03. Both findings of the previous review are repaired. No declared supplier gaps (`plan.json` `gaps` is empty). No maintainer notes were given. Lean elaboration: not available (this lane does not elaborate; say so in the report); the design has no `Suggested.lean`, so nothing was elaborated or probed.

## Previous findings (round 8), checked first

| Finding | Repaired passage | Status |
| --- | --- | --- |
| F01 (P3): Scope silent on §3.1 against the cone statements of an earlier roadmap | Scope: "AlgebraicModuliForArithmeticGeometryPartII §1.7 (iii) and (v) state in `N¹(X/K)`, for projective `X`, that the cone `Amp(X/K)` … is the interior of the nef cone and the nef cone its closure … Its route uses §1.7 (ii) and the two facts of §1.7 listed in the supplier contracts, not (iii) or (v)." | **Repaired.** Read at that roadmap's open head: (iii) "Amp(X/k) is the interior of Nef(X/k), Nef(X/k) is the closure of Amp(X/k)"; (v) "a nef real class plus an ample real class is ample"; the two API facts (ample is positive on curves; `L^{⊗m} ⊗ E` ample for large `m`) are in its API list. The added clause on §1.5 matches "preserved by base change T → S of Noetherian schemes and detected on geometric fibres"; R02 is a note on that clause. |
| F02 (P3): SchemeAndStackFoundations §5.9 consumed but not named | Contract: "§5.9: for line bundles `L`, `M` on a scheme `S` over a field, the pairing `χ(O_S) − χ(−L) − χ(−M) + χ(−L − M)`, declared there as `Chow.intersectionNumber`"; §2.2: "Those of SchemeAndStackFoundations §5.10 are numerical intersections by its §5.9, without §2.2"; §3.4: "whose pairing is the numerical intersection (SchemeAndStackFoundations §5.9)" | **Repaired.** Read on main, `TauCetiRoadmap/SchemeAndStackFoundations/README.md:8526–8538` (definition, coefficient of `n₁n₂` for proper `S` of dimension at most two, Chow degree for smooth projective `S`) and `:8661–8663` (`hodge_index` on that pairing, `H² > 0`, `D·H = 0`). `plan.json` 3.4 lists §5.9 and no longer `target:2.2`. |

Pattern search. F01 (an owned statement beside an imported one, with no clause): §2.1 (the `r = 1` law of §0.1), §2.2 (§5.9), §3.2 (Kleiman, "This subsection adds"), §3.4 (§5.10), §3.5 (§9.10) and §3.1 (§§1.5, 1.7) each carry the clause; I searched main and the open heads for the remaining owned objects (below) and found no further neighbour. F02 (a consumed section not named): every roadmap section named in a *Needs:* line appears in the contracts and in `plan.json` `suppliers`; the dependency check agrees (2237 edges, 0 problems).

## Verified sound

### Principles, shape, house style

- General library: arbitrary field, no normality, inseparable degree counted, geometric integrality only where the base-changed map must be a map of varieties. No algorithm, no `set_option`, no sorry'd data; no Lean file at this stage.
- Shape: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, six layers each ending with Examples and Dependencies, Downstream consumers, Worked examples, References. `plan.json`: 27 targets, each with at least 3 tests (the seven definitions and constructions 1.1, 1.2, 1.3, 2.3, 4.1, 5.1, 5.4 have 6, 5, 4, 4, 4, 3, 4).
- Organisation: layers named by their mathematics; the order is forced by the *Needs:* lines (Layer 3 needs §§2.1–2.4; §4.4 needs §§1.3 and 3.6; Layer 5 needs §§4.2–4.5; Layer 6 needs §§3.2, 4, 5); Layers 1 and 2 are independent and say so.
- Process residue: mechanical search of the README for pull-request numbers, round labels, machine paths, LaTeX delimiters, "so far", "checkpoint", "handoff", "optional", "deferred", `lemma`: none (the hits are "Lemma" in source locators). The roadmap attributes no backticked Lean name to itself.

### Adversarial table (values computed this round)

On `E × E` without CM: `xF_1 + yF_2 + zΔ ↦ [[x+z, −z], [−z, y+z]]`, intersection `tr(B·adj B')`, `I = F_1 + F_2 ↦ diag(1,1)`, `A ↦ [[1, √2], [√2, 2]]`.

| Statement | Instances | Values on each side | Result; change |
| --- | --- | --- | --- |
| Scope, §1.7 clause (changed) | `E × E`, `m = n = 3`, `δ = 1/5`, `(2.41, 3.41, −1.42)` | tolerance `1/90 = 0.0111`, offsets `0.0042, 0.0042, 0.0058`; raw matrix `[[0.99,1.42],[1.42,1.99]]`, det `1.9701 − 2.0164 = −0.0463`; with `δH`: det `2.6061 − 2.0164 = 0.5897`; `N = 100`: `[[119,142],[142,219]]`, det `26061 − 20164 = 5897` | accurate; none |
| Scope, §1.5 clause (changed) | `ℙ¹_ℂ/ℝ`, `O(1)`, `O(−1)` | `2 = 1 + 1`, both nef; `−2 = −1 − 1`, neither | holds; R02 (generality) |
| §5.9 contract (changed) | `ℙ¹×ℙ¹`: `(O(1,0), O(0,1))`, `(O(1,0), O(1,0))`; `S = ℙ¹` | `1 − 0 − 0 + 0 = 1`; `1 − 0 − 0 + χ(O(−2,0)) = 1 − 1 = 0`; `1 − (1−a) − (1−b) + (1−a−b) = 0` | holds; none |
| §2.2 (sample; changed Check) | blow-up of `ℙ²`, `b = 1, 2`; `r = 0` | sequences: `1 + χ(O_{ℙ¹}(−1)) = 1`, `1 + χ(O_{ℙ¹}(−2)) = 0`; formula `1 + (b−b²)/2`: `1, 0`; Riemann–Roch `½(bE)·(bE + 3L − E) + 1 = ½(b − b²) + 1`; `n₁n₂` coefficient `−1 = deg O_E(E)`; `χ(K[ε]/ε²) = 2 = 2·1` | holds; none |
| §3.4 route (changed) | `D''` on the blow-up, `H = 2L + E`, `D = L` | `H² = 3`, `D·H = 2`, `D'' = 3L − 2H`: `D''·H = 6 − 6 = 0`, `D''² = 9 − 24 + 12 = −3 = 3(3·1 − 4)`, so `4 ≥ 3` | holds; none |
| §1.1 (sample) | `z²`; Frobenius on `ℙ^d`; projection `ℙ² ⤏ ℙ¹`; `d = 0`: `Spec L → Spec M` | `[K(z):K(z²)] = 2`; `p^d`; `finrank = 0`, trdeg `1`; `e = [L:M]`; tower `e(g∘f) = e(f)e(g)`: `4 = 2·2`, and `0 = 0·e(g)` on a dimension drop | holds; none |
| §1.2 (sample, headline) | `id`; `z²`; Cremona; constant `[0:1]`; `d = 0` | diagonal; `π_2` of degree `2`; three lines over three points, both projections of degree `1`; `Γ = ℙ¹ × pt`, `π_2` not onto; `Γ ≅ Spec L`, `π_2` of degree `[L:M]` | holds; none |
| §2.1 | `K[ε]/ε²`; line ∪ point; `V(xy)`; `V(x²)` | `2 = 2·1`; `χ = n + 2`, coefficient `1`; `2 = 1 + 1`; `(n+1)(n+2)/2 − (n−1)n/2 = 2n + 1`, `2 = 2·1` | holds; none |
| §2.3 (sample) | `√2·O(1,0) + O(0,1)`; `2·O(1,1) − O(1,0)`; `−O(1)` | `2·√2·1 = 2√2`; class `(1,2)`, degrees `2` and `1` on the rulings, nef; `−1`, not nef | holds; R03 (locator) |
| §2.4 (sample) | `ℙ¹_ℂ/ℝ`; pointless real conic; `x² + ty²` over `𝔽_2(t)` | `c = 2`, `2 = 2·1`; `c = 1`, `2 = 2`; `K[x,z]/(x²+t) = K'[z]`, `χ_K(O_V(n)) = 2n+1`, `c = 2·1`, `2 = 2·1` | holds; none |
| §3.1 ample approximation | route with `m, n, δ` | `(β·C) ≥ (ω·C) − n·(δ/2mn)·m(H·C) + (δ/2)(H·C) = (ω·C) ≥ 0`; `A_j = N(Σt'L + δH)`; `H/2` on `ℙ²`: `1/4 < 1` | holds; none |
| §3.1 class `A` | degrees; decomposition of `A + I` | `2, 1, 3+2√2` on `F_1, F_2, Δ`; `(2−√2)[[1,1],[1,1]] + (√2−1)[[1,2],[2,4]] + diag(1,0) + (5−3√2)diag(0,1) = [[2,√2],[√2,3]]`, `5 − 3√2 = 0.757 > 0` | holds; none |
| §3.2 | `O(1,−1)`; `O(2,1)`; `r = 0` | `−2`, not nef; `4`, degrees `1, 2`; `χ(O_Z) ≥ 0` | holds; none |
| §3.3 (sample) | route; `(1,1),(1,0),(0,1)`; `B = (1,−1)`; `E × E` | `vol(pA − qB) ≥ p^{r−1}(p(A^r) − rq(A^{r−1}B))`; `2·1 ≤ 2·1·1`; `2 ≤ 0` false; `8·3 = 24 ≤ 2·3·5 = 30` | holds; none |
| §3.5 (headline) | `(2,1),(1,1)`; `A + εI`; `ℙ² ⊔ ℙ²` | `9 ≥ 8`; `(3+2ε)² − (12ε + 4ε²) = 9`; `16 < 25` | holds; none |
| §3.6 (sample, headline) | `(ℙ¹)³`, `i = 2`; telescoping; `ℙ² ⊔ ℙ²` | `6 ≤ 4·1·2 = 8`, with constant `3`: `6 = 6`; `y_{j+1}x_j ≤ (r−i+1)y_jx_{j+1}` with `dim Z_j = r−i+1`, product gives `(r−i+1)^i·y_1/(B^r)`; `5 ≤ 2` false | holds; none |
| §4.1 (sample) | `z²` with models `(id, f)`, `(f, f∘f)`; `√2·O(1)` | `(1, 2)`; `k = 0`: `2 = 2·1`, `k = 1`: `4 = 2·2`; degree `√2 ∉ ℤ` | holds; none |
| §4.2 (headline) | Cremona; `O(1,0)`; `(1.5, 0.5)`; `A ≤ A + I` | `(1,2,1)`; `0`; `2·1.5·0.5 = 1.5 < 2`; `0 ≤ 3 ≤ 8` | holds; none |
| §4.3 (headline) | `ℙ¹_ℂ/ℝ`, `id`; cuspidal cubic | `2 = 1 + 1`; `t ↦ [t²:t³:1]`, `ν^*O(1) = O(3)`, `3 = 3` | holds; none |
| §4.4 (sample, headline) | route on `W`; `k = 0, d`; `z², z²`; Frobenius then `z²`; `E × E` | `(B^d) = e(f_1)(L_2^d)`, `(A^kB^{d−k}) = e(f_1)·deg_k(f_2)`; equalities `(L_1^d)` and `e(f_1)e(f_2)(L_3^d)`; `4 ≤ 4`; `2p = p·2`; `0 ≤ (2/2)·3·3 = 9` | holds; R01 (locator) |
| §4.5 (sample, headline) | two applications of §4.4; swap on `ℙ¹×ℙ¹`; `E × E` | `C_1 = (d−k+1)^{2k}(ω'^{d−k}ω^k)(ω^{d−k}ω'^k)/(ω^d)²`; `c = 9/4, 9/16`, `C = 9`, ratio `5/2`; `tr([[2,√2],[√2,3]]·[[2,−√2],[−√2,3]]) = 2 + 7 = 9`, `C = 25`, ratio `9/2` | holds; none |
| §5.1 (sample, headline) | `u_0`; degree `a`; Cremona | `u_0 = k·log(d−k+1) ≥ 0`; `inf_n ((d−k+1)^k a^{nk})^{1/n} = a^k`; `2, 1, 2, 1, …`, limit `1` | holds; none |
| §5.2, §5.4 (headline) | Fibonacci; concavity | `(1, φ, 1)`, `φ² = 2.618 ≥ 1`; `log λ_k ≤ k·log λ_1`; `h = log φ = 0.4812 ≤ 2·0.4812` | holds; none |
| §5.3 (sample) | Cremona conjugated; `id` on the cuspidal cubic; `ℙ¹_ℂ/ℝ` | `λ_1 = 1`; `1 = 1`; `1 = 1`; computed with an ample `H`, whose base change is ample | holds; none |
| §6.1 (sample) | `σ∘σ`; `(x_0², x_0x_1, x_0x_2)`; `(0,0,1)` then `σ`; `σ ∘ [x_i²]`; `d = 0` | `x_0x_1x_2·(x_0,x_1,x_2)`; degree `1`; `G(F) = 0`; coprime, `4 = 2·2`; reduced form `(1)`, degree `0` | holds for `d ≥ 1`; none |
| §6.2 | section of `aA − B`; `k = 0`; Cremona | `a·deg_k − deg_{k+1} = (A^{d−k−1}B^k·E) ≥ 0`; `(A^{d−1}·E) = 0`, `deg_1 = a`; `deg_2 = 1 = 4 − 3` | holds; none |
| §6.3 (sample, headline) | Fibonacci `n = 1, 2, 3`; inverse | `f∘f = [xyz² : xy²z : z⁴] = z·[xyz : xy² : z³]`, degree `3`; `n = 3`: `[xy²z² : x²y³ : z⁵]`, degree `5`; coordinate degrees `fib(n−1) + 2fib(n) = fib(n) + fib(n+1) = fib(n+2)`; inverse `(u,v) ↦ (v/u, u)` | holds; none |
| §6.4 (sample, headline) | `(x², y)`; Hénon; `(y, z, x+yz)`; `(x, xy)` | `[x_0² : x_1² : x_0x_2]`, base point `[0:0:1]`, `(1,2,2)`, `4 ≥ 2`; `F² = (x+y², y+(x+y²)²)`, degree `4`; `F² = (z, x+yz, y+z(x+yz))`, degree `3`; fibre over `(0,1)` empty | holds; none |

### Sources: the seeded sample

The manifest flags no locator as unverified. Opened in the cached texts, each matching in number, line and hypotheses unless a finding says otherwise:

| Target | Locators opened | Outcome |
| --- | --- | --- |
| 1.1 | `stacks-morphisms` lines 6046–6050; `dinhsibony2005` lines 69–70 | as cited |
| 1.2 | `dinhsibony2005` lines 45–51; `dang2020` lines 21–25; `guedj2010` lines 1099–1111; `stacks-morphisms` lines 488–489 | as cited |
| 2.2 | `stacks-chow` lines 3995–3997 | proper `X`, closed `Z` of dimension `d`: as stated |
| 2.3 | `stacks-varieties` line 4778; `dangfavre2021` lines 436–443 (from `plan.json`) | as cited there; R03 |
| 2.4 | `stacks-varieties` lines 691–694; `stacks-morphisms` lines 3862–3865 | as cited; (2) is the quasi-affine case |
| 3.3 | `dang2020` lines 840–869; `dangfavre2021` line 434 | constant `r`; `C_d = d` for `k = 1` |
| 3.6 | `dang2020` lines 141–143, 871–883; `dangfavre2021` lines 427–433 | constant `(r−i+1)^i` at line 874 |
| 4.1 | `dang2020` lines 21–25; `dangfavre2021` lines 436–443, 452–454; `dinhsibony2005` lines 61–63; `russakovskiishiffman1997` lines 499–511 | `k` copies from the target in each |
| 4.4 | `dang2020` lines 27–30, 1271–1288, 1350–1358; `dangfavre2021` lines 448–451; `dinhsibony2005` lines 245–247; `silverman2014` line 387; `truong2020` lines 143–158, 999–1003, 1101–1106 | constant at line 1284; Truong's item: R01 |
| 4.5 | `dang2020` lines 31–41; `dangfavre2021` lines 457–460; `dinhsibony2005` lines 256–263 | as cited |
| 5.1 | `dangfavre2021` lines 461–465; `dang2020` lines 42–46; `dinhsibony2005` lines 256–259; `silverman2014` lines 383–413 | as cited |
| 5.3 | `truong2020` lines 159–164, 1529–1533; `dang2020` lines 35–46 | as cited |
| 6.1 | `stacks-constructions` lines 1267–1274; `silverman2014` lines 350–357; `guedj2010` lines 1141–1147; `russakovskiishiffman1997` line 510 | as cited |
| 6.3 | `silverman2014` lines 358–372; `guedj2010` lines 1272–1282; `russakovskiishiffman1997` lines 542–552; `truong2020` lines 1540–1544 | as cited |
| 6.4 | `dangfavre2021` lines 177–180; `silverman2014` lines 373–380 | as cited |

Also opened: `truong2020` lines 77–89; `stacks-varieties` lines 4716–4720, 4784–4789; `stacks-morphisms` lines 2198–2202; `kleiman2005` lines 3624–3627, 3803–3808; `cutkosky2015` lines 274–287, 983–1020; `guedj2010` lines 1136–1140, 1178–1181; `dinhsibony2005` lines 33–37. All fifteen manifest entries are works the README cites and every cited work has an entry. No source was fetched; the manifest was not changed by this review.

### Suppliers resolved at their current heads

| Supplier | Where read | Found |
| --- | --- | --- |
| SchemeAndStackFoundations | main | headings §§0.3, 0.7, 0.11, 0.20, 0.30, 2.6, 3.3, 4.11, 4.12, 4.13, 4.16, 4.19, 5.1, 5.2, 5.3, 5.9, 5.10 exist; §4.19 `alteration_theorem` (regular, projective over the field); §5.9 and §5.10 as in the table above; `surface_riemann_roch` as `χ(O(D)) = ½D·(D − K) + χ(O_S)` |
| StableReduction | main | Layer 2 and its J-A2 contract (degree `χ(L) − χ(O)`, additive, field-extension invariant) |
| CyclotomicClassGroupsAndStickelberger | open head | §4.3: the coefficient of `n₁⋯n_d`, polynomiality of total degree `≤ dim Supp F`, symmetry, additivity, projection formula with the function-field degree and zero on a dimension drop, Cartier restriction, ample positivity, field extension |
| AlgebraicModuliForArithmeticGeometryPartII | open head | §0.1 (length-weighted law, field invariance), §1.1 (`Num = Pic/Pic^τ`, pairing descends), §1.5, §1.7 (ii), (iii), (v) and API |
| AlgebraicModuliForArithmeticGeometry | open head | §1.4 (very ample over `Spec k`, implies ample), §5.4 ("The image of f after flat base change is the pullback of C"), §9.10 |
| ArakelovGeometryAndAbelianHeightsPartII | open head | §0.1 (geometric analogue of nef), §0.3 (1′) and (2′) for `d ≥ 1`, over any field, numbers from SchemeAndStackFoundations §§5.2–5.3 |
| LefschetzPencilsAndVanishingCycles | open head | §5.1: Bertini irreducibility, `dim g(X) > s`, stated as part of the target |
| ArithmeticDynamics | open head | §0.18 (classes of lifts, `deg(fg) = deg f·deg g`, constants in degree 0), §0.26 (injective monoid map onto the `K`-endomorphisms of `ℙ¹_K`) |

All eight are on main or earlier in the merge order (lines 34, 35, 69, 262, 339, 341 of `merge-order/ORDER.txt`); none is on the never-cite list. `scratch/citations.md` lists no unresolved citation or Lean name. Dependency check, full output:

```text
candidate: DynamicalDegreesOfRationalMaps is not in the merge order yet; checked as if placed after ArakelovGeometryAndAbelianHeightsPartII (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2237 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

### Pinned declarations opened

Every file-and-line locator of the two library contracts was checked mechanically at the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`): the named declaration is on the cited line in all cases, 0 mismatches. Mathlib: `AlgebraicGeometry/Birational/RationalMap.lean` 48, 377, 396, 440, 501, 562, 575, 586, 608; `Dominant.lean` 74; `Composition.lean` 155, 170, 173, 182, 193, 217; `Birational.lean` 39, 55, 88, 166, 182; `IdealSheaf/Subscheme.lean` 658, 661, 706, 716; `IdealSheaf/Basic.lean` 691; `Morphisms/SchemeTheoreticallyDominant.lean` 37, 112; `IdealSheaf/Functorial.lean` 39, 79, 139, 163; `FunctionField.lean` 37; `Morphisms/Proper.lean` 97; `ProjectiveSpectrum/Scheme.lean` 855; `RingTheory/MvPolynomial/Homogeneous.lean` 87, 613; `RingTheory/Polynomial/UniqueFactorization.lean` 128; `Analysis/Subadditive.lean` 33, 35, 106, 109, 155; `LinearAlgebra/Dimension/Free.lean` 76; `Data/Nat/Fib/Basic.lean` 56; `NumberTheory/Real/GoldenRatio.lean` 36. Tau Ceti: `LineBundle/Basic.lean` 119, `Pullback.lean` 100, `TensorProduct.lean` 65, `Dual.lean` 44, `Class.lean` 50, 142, `Ample.lean` 71, 96; `Cohomology/Basic.lean` 61, `EulerCharacteristic.lean` 105; `LineBundle/Degree.lean` 130; `IntersectionNumber/Basic.lean` 111, `FieldTower.lean` 66; `EffectiveCartierDivisor/Basic.lean` 78; `SchemeTheoreticImage/Basic.lean` 65, 78; `Morphisms/Dominant.lean` 151, 206, 212, 221; `Scheme/BaseAlgebra.lean` 409, 421, 427; `Scheme/FunctionField.lean` 101; `EllipticCurve/Isogeny/FunctionField.lean` 167; `Birational/AlgHom.lean` exists.

Read at the pin: `comp (f : X ⤏ Y) [f.IsDominant] (g : Y ⤏ Z)` applies `f` first and asks no dominance of `g`; `Subadditive.lim` is `sInf ((fun n => u n / n) '' Ici 1)`; `tendsto_lim` asks `BddBelow (range fun n => u n / n)` over all `n`, which §5.1 supplies; `functionFieldAlgHom` asks `[f.IsOver (Spec (.of k))] [IsDominant f]` and carries no finiteness.

### Ownership and overlap

Searched main and the 475 indexed open heads by object: `dynamical degree`, `algebraic entropy`, `graph of a rational map`, `sub-multiplicativ` (no match anywhere); `Khovanskii` (only AlgebraicModuliForArithmeticGeometry §9.10, named in Scope); `Siu's inequality` (only ArakelovGeometryAndAbelianHeightsPartII §0.3, imported); `Hodge inequality` (unrelated p-adic Hodge hits); `topological degree` (no degree of a rational map of varieties); pullback of function fields along a rational map (none); `Pic(X) ⊗ ℝ` (only AlgebraicModuliForArithmeticGeometryPartII, imported); rational self-maps given by forms (ArithmeticDynamics has `ℙ¹` only, cited in Checks). Main has no `DynamicalDegreesOfRationalMaps` folder; neither the board index nor the open list has another package or pull request of that name. `scratch/overlaps.md` lists no shared pull request, no dropped id, no revision-only id and no second copy.

Overlap check: read AlgebraicModuliForArithmeticGeometryPartII, AdicCoefficientsAndComparisonsPartII, ArakelovGeometryAndAbelianHeightsPartII, AbundanceStatement, JacobianChallenge, SchemeAndStackFoundations; nefness, `N¹`, Kleiman and the ample and nef cones: AlgebraicModuliForArithmeticGeometryPartII (imported); volume and Siu's volume inequality: ArakelovGeometryAndAbelianHeightsPartII (imported); alterations, Chow operations, the surface pairing and Hodge index: SchemeAndStackFoundations (imported); nothing shared with the other three.

### Headline theorems and `Suggested.lean`

Headlines (README, "The headline statements"): graph properties (§1.2); Khovanskii–Teissier and product Siu (§§3.5–3.6); positivity, boundary values and field invariance of the degrees (§§4.2–4.3); sub-multiplicativity and comparison (§§4.4–4.5); existence and properties of `λ_k` and `h_alg` (§§5.1–5.4); the projective and affine formulas with the Cremona and Fibonacci computations (§§6.2–6.4). Each is a target with hypotheses and has a row above. There is no `Suggested.lean` at the design stage: the one-tactic probe, the `#check` comparison and the import check had nothing to run on.

### Copyright, wording, arrangement, reuse

- Wording, set beside the sources at their locators: §1.2 definition (`dinhsibony2005` lines 45–51; `guedj2010` lines 1100–1111), §3.3 statement and route (`dang2020` lines 842–866: an exact sequence of restrictions there, the imported volume bound and a Cartier divisor here), §3.6 route (`dang2020` lines 876–883), §4.1 definition (`dangfavre2021` lines 436–443), §4.4 route (`dang2020` lines 1285–1288, 1350–1358: normalized graphs there, the image in the triple product here), §4.5 (`dangfavre2021` lines 457–460; `dinhsibony2005` lines 260–263), §5.1 route (`silverman2014` lines 386–413: a division argument there, Mathlib's Fekete lemma with an explicit lower bound here), §6.1 (`stacks-constructions` lines 1267–1274), §6.3 (`silverman2014` lines 358–372), §6.4 (`silverman2014` lines 373–380), §2.4 (`stacks-varieties` lines 691–694), §3.5 non-example (`cutkosky2015` lines 1014–1020), Scope on correspondences (`truong2020` lines 77–89). No sentence or proof plan follows a source clause by clause; the shared runs are formulas (the Fibonacci iterate, the Cremona forms, the degree formula).
- Arrangement: `dang2020` and `dangfavre2021` share the largest count. `dang2020` contents: 1 Chow group, 2 numerical cycles, 3 positivity, 4 relative classes, 5 dynamics, 6 semi-conjugation, 7 mixed degree formula. Common matter: `Layer 3 ↔ §3.4` only, `Layer 4 ↔ §§5.1–5.2`; Layers 1, 2, 5, 6 have no counterpart and its §§1, 2, 4, 6, 7 none here. `dangfavre2021` contents: 1 positive cycles, 2–3 b-classes, 4–5 spectral theory, 6 polynomial maps; only its §1.3 is used. No one-to-one run.
- Reuse: no table, figure or list is taken over. The worked-examples table is the roadmap's own; the `ℙ² ⊔ ℙ²` non-example is one instance (`n = 2`) of `cutkosky2015` lines 1015–1020, recomputed (`16 < 25`) and cited.

Source independence: 13 passages compared with 9 sources, none shared; largest share dang2020 and dangfavre2021, 15 each of 91 locators; contents compared with dang2020 and dangfavre2021: independent.

## Not verifiable

- Lean elaboration: not available (this lane does not elaborate; say so in the report). No Lean command was run.
- `lazarsfeld2004` (Theorems 1.4.9, 1.6.1, 2.2.15; Corollaries 1.4.10, 1.6.3) and `fulton1998` (Theorem 1.4, Proposition 2.5): settled uncertified, cited by locator, not read. `dang2020` line 842 attributes Siu's inequality to Theorem 2.2.13 of the same book where the README cites 2.2.15; the book could not be opened to decide.
- Ownership against open pull requests was checked on the heads the tools index (main and 475 open roadmap pull requests) and on the board index; packages on other board branches were not opened beyond that index.

## Source issues

- **Error** in dang2020 at Proposition 3.4.1, printed page 17, and Theorem 3.4.4, printed page 18: the source says the ratio form of Siu's bound holds on every closed subscheme; it should require irreducible support (two planes give `1 ≤ 2/5`); affects a stated result.
- **Misprint** in dang2020 at Proposition 3.4.1, proof, printed page 17: the source says the section count of the difference strictly exceeds the difference of the two section counts; it should be a weak inequality; affects the proof.
- **Misprint** in dang2020 at Theorem 3.4.4, proof, printed page 18: the source says the final constant is a power of `n − i + 1`; it should be `r − i + 1`, as in the statement; affects nothing.
- **Misprint** in dinhsibony2005 at Corollaire 7, proof, printed page 7: the source says the roots of the degrees converge to their own infimum; it should be the infimum after multiplying the degrees by the constant; affects the proof.
- **Misprint** in dinhsibony2005 at Corollaire 7, proof, printed page 7: the source says the displayed bound gives `λ(f) ≤ λ(h)`; it should give `λ(h) ≤ λ(f)` first, the other by symmetry; affects the proof.
- **Error** in silverman2014 at Example 5, printed page 9: the source says the indeterminacy loci of the map and of its inverse are disjoint; it should note both contain `[0 : 1 : 0]`; affects nothing.
- **Misprint** in silverman2014 at Example 6, printed page 9: the source says the `n`-th iterate has degree `F_n`; it should be `F_{n+2}` (degrees `2, 3, 5`); affects nothing.
- **Misprint** in guedj2010 at Théorème 2.4 (a), page 33 of the arXiv file: the source says the inequality holds for `1 ≤ l ≤ k`; it should stop at `l = k − 1`, since `λ_{k+1}` is not defined; affects a stated result.
- **Misprint** in cutkosky2015 at §2.2, printed page 6: the source says the Picard group is isomorphic to the group of Cartier divisors; it should be Cartier divisors modulo linear equivalence; affects nothing.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "a52bb06207ddd25b08c16e99a298ccc39cd0d932", "job": "REV-DESIGN-DynamicalDegreesOfRationalMaps~9", "model": "fable", "worker": "chris-x55"} -->
