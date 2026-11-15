<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12938#issuecomment-6899294653 -->
Review (claude) of 5a8d13d

Verdict: needs_changes

1. **F01** (P3) §6.1 cites Silverman's iterate remark for the reduced forms

   **Location:** `packages/DynamicalDegreesOfRationalMaps/design/README.md`, §6.1, Route: "A codimension-one component of `V(F)` would give a common factor (silverman2014 lines 350–357; guedj2010 Exemple 2.2, lines 1145–1147; russakovskiishiffman1997 line 510)". `design/plan.json`, target 6.1, `where`: "silverman2014 lines 350-357".

   **Claim:** silverman2014 lines 350–357 support the description of a rational self-map of projective space by forms without common factor.

   **Witness:** silverman2014 lines 350–357 only speak of a dominant rational map "of degree d", the degrees of iterates and the definition of the dynamical degree. The forms of one degree with no common nontrivial factor are at silverman2014 lines 43–45.

   **Repair:** in the Route write "(silverman2014 lines 43–45 for the forms without common factor, and lines 350–354 for `deg(φ^n) = d^n` when `φ` is a morphism; guedj2010 Exemple 2.2, lines 1145–1147; russakovskiishiffman1997 line 510)", and in `plan.json` 6.1 `where` replace "silverman2014 lines 350-357" by "silverman2014 lines 43-45 and 350-354". Tested on the witness: lines 43–45 state the common-degree forms with no common nontrivial factor; lines 350–354 state the morphism case of the iterates item. No statement changes.

One finding, P3 (no P1, no P2): a locator in §6.1, with its exact repair below; it is a repair to apply, so the verdict asks for changes. Nothing else needs repair. Both round-11 findings are repaired. `plan.json` declares no supplier gap (`gaps` is empty). No maintainer notes were given. Lean elaboration: not available (this lane does not elaborate; say so in the report); the design has no `Suggested.lean`, so nothing was elaborated or probed.

## Previous findings (round 11), checked first

| Finding | Repaired passage | Status |
| --- | --- | --- |
| F01 (P3): locators for extension of the field pointed to a convention | §1.4: "These identities are proved in this section. truong2020 §6.3, lines 1529–1533, only sets the convention they justify". §4.3: "Both equalities are proved here, from §1.4 and the field-extension compatibility of CyclotomicClassGroupsAndStickelberger §4.3. dang2020 lines 18–20 and truong2020 §6.3, lines 1529–1533, pass to an algebraic closure by convention." §5.3: "truong2020 §6.3, lines 1529–1533, which defines the degrees … through the lift to an algebraic closure, so that invariance under extension of the field is proved here from §4.3". `plan.json` 1.4, 4.3, 5.3 `where` reworded the same way | **Repaired.** truong2020 lines 1529–1533 and dang2020 lines 18–20 reopened: they contain exactly the convention now attributed to them. |
| F02 (P3): "read through §2.2" after a supplier name, twice in §3.3 | "§0.3 (1′) read through §2.2 here"; "§0.3 (2′), read through §2.2 here, gives"; and the pattern repair in §3.5: "with §2.1 here, turn" | **Repaired.** A search of the README for a bare local `§` directly after a supplier section finds no further instance (§§2.2, 3.1, 4.1 say "here" or "without this section"; §6.1 says "there"). |

The repair changed no statement, hypothesis or Check. The reworded passages were re-read against the sources and the rows for §§1.4, 3.3, 3.5, 4.3 and 5.3 below were recomputed.

## Verified sound

### Principles, shape, house style

- General library: arbitrary ground field, no normality, inseparable degree counted, geometric integrality only where the base-changed map must be a map of varieties; no algorithm, no `set_option`, no sorry'd data, no Lean file at this stage.
- Shape: Summary, Scope and ownership, Conventions, Exact supplier contracts (Mathlib, Tau Ceti, eight roadmaps), How to read the build, six layers each ending with Examples and Dependencies, Downstream consumers, Worked examples, References. `plan.json` parses: 6 layers, 27 targets, tests per target counted by script, minimum 3 (2.1, 2.2, 3.6, 4.3, 5.1, 5.2, 5.3); definitions and constructions 1.1, 1.2, 1.3, 2.3, 4.1, 5.1, 5.4 carry 6, 6, 3, 4, 5, 2, 3 API entries; no prerequisite starts with `gap:`.
- Organisation: layers named by their mathematics. Forced order: Layer 3 *Needs* §§2.1–2.4; §4.4 needs §§1.3, 3.6; Layer 5 needs §§4.2–4.5, 3.5; Layer 6 needs §§3.2, 4.1–4.2, 5.1–5.4. Layers 1 and 2 are independent and say so.
- Process residue: a pattern search of the README for LaTeX delimiters, pull-request numbers, round labels, machine paths, HTML anchors, "so far", "checkpoint", "handoff", "optional", "deferred" finds nothing; every hit for "lemma" is prose ("Chow's lemma", "Fekete's lemma", "Lemma 26.16"). The README attributes no backticked Lean name to this roadmap.

### Adversarial table (values computed this round)

On `E × E` without CM: `xF_1 + yF_2 + zΔ ↦ [[x+z, −z], [−z, y+z]]`, pairing `tr(B·adj B')`; checked `F_i² = 0`, `Δ² = tr(Δ·[[1,1],[1,1]]) = 0`, `F_1·F_2 = F_i·Δ = 1`.

| Statement | Instances | Values on each side | Result; change |
| --- | --- | --- | --- |
| Conventions, composition | `f = z²`, `g = z + 1` at `1` | `f.comp g ↦ 1² + 1 = 2`; `f ∘ g ↦ (1+1)² = 4` | holds; none |
| §1.1 (sample) | `z²`; Frobenius; projection `ℙ² ⤏ ℙ¹`; tower | `[K(z):K(z²)] = 2`; `p^d`; trdeg `1` so `finrank = 0`; `e(gf) = e(f)e(g)` via `f^*g^*K(Z) ⊆ f^*K(Y) ⊆ K(X)` | holds; none |
| §1.2 (headline) | `id`; Cremona; projection; constant `[0:1]` | diagonal; three lines over three points; `π_2` onto with fibres `ℙ¹`, not an alteration; `Γ = ℙ¹ × pt`, `π_2` not onto | holds; none |
| §1.3 (sample) | `z², z²`; `ℙ¹_ℂ/ℝ`, `id, id`; general point | `(q_Y,q_Z)` degree `2 = e(f)`, not `4`; triple diagonal, degrees `1,1,1`; `(x, f(x), gf(x)) ↦ (f(x), gf(x)) ∈ Γ_g`, field map `K(Y) → K(X)` is `f^*` | holds; none |
| §1.4 (repair) | `ℙ¹_ℂ/ℝ`; `𝔾_m → 𝔸¹` at origin; `z²`; projection | two diagonals; source `∅` vs inverse image a point; basis `{1, z}`, `2 = 2`; `dim` gap `1`, `0 = 0` | holds; none |
| §2.1 (sample) | `K[ε]/(ε²)`; line ∪ point; `V(xy)` | `χ = 2 = 2·1`; `χ(O_Z(n)) = n + 2`, coefficient `1`; `1 + 1 = 2` | holds; none |
| §2.2 (sample) | `ℙ²`; `ℙ¹×ℙ¹`; blow-up, `O(bE)` | `1`; `(n_1+1)(n_2+1)` gives `1` and `0`; `Σ_{j=1}^{b}(1−j) = (b−b²)/2`, `n_1n_2`-coefficient of `1 + (n−n²)/2` is `−1`, `deg O_E(E) = −1` | holds; none |
| §2.3 | `√2·O(1,0)+O(0,1)`; `2·O(1,1) − O(1,0)` | `2·√2·1 = 2√2`; class `(1,2)`, degrees `2, 1` on the rulings | holds; none |
| §2.4 | `ℙ¹_ℂ/ℝ`; pointless conic; `x²+ty²` over `𝔽_2(t)`; chain for (b) | `c = 2`, `2 = 2·1`; `c = 1`, `2 = 2`; `K' = K(√t)`, `c = 2`, `2 = 2·1`; `(L)_{V/K} = (ν^*L)_{Ṽ/K} = [K':K](·)_{Ṽ/K'} = [K':K]·m·(·)_W` | holds; none |
| §3.1 (sample) | approximation route; `m = 3`, `n = 3`, `δ = 1/5`, `(2.41, 3.41, −1.42)`, `N = 100` | `(β·C) ≥ (ω·C) − n·(δ/2mn)·m(H·C) + (δ/2)(H·C) = (ω·C)`; `A_j = N(Σt'L + δH)`; distances `0.0042, 0.0042, 0.0058 < 1/90`; `det = 1.9701 − 2.0164 = −0.0463`; `2.6061 − 2.0164 = 0.5897`; `261F_1 + 361F_2 − 142Δ`, `26061 − 20164 = 5897` | holds; none |
| §3.1 class `A` | matrix; degrees; `A + I` decomposition; `H/2` on `ℙ²` | `[[1,√2],[√2,2]]`, det `0`, trace `3`; `2, 1, 3+2√2`; coefficients `2+√2`, `3+√2`, `−√2`, with `5 − 3√2 ≈ 0.757 > 0`; `1/4 < 1` | holds; none |
| §3.2 | `O(1,−1)`; `V(x²)`; `O(2,1)` | `−2`; `[(n+1)(n+2) − (n−1)n]/2 = 2n+1`, so `2 = 2·1`; `4`, degrees `1, 2` | holds; none |
| §3.3 (sample, repair) | route; `(1,1),(1,0),(0,1)`; `B = (1,−1)`; `E×E`; `r = 1` | `vol(pA−qB) ≥ p^r(A^r) − r p^{r−1}q(A^{r−1}B)`, then `p(A·C) ≥ q(B·C)`; `2·1 = 2 = 2·1·1`; `2 ≤ 0` false; `8·3 = 24 ≤ 2·3·5 = 30`; `(A)(B) = (B)(A)` | holds; none |
| §3.4 | `D''`; `ℙ¹×ℙ¹`; cone; blow-up `H = 2L+E`; two points | `D''·H' = 0`, `D''² = (H'²)((H'²)(D²) − (D·H')²)`; `0 ≥ −4`; `4 = 2·2`; `H² = 3`, `1 ≥ −3`, `4 ≥ 3`; `0 < 1` | holds; none |
| §3.5 (sample, headline) | `(2,1),(1,1)`; `A + εI`; `ℙ² ⊔ ℙ²`; `C = A^{k−1}B^{d−k−1}` | `3² = 9 ≥ 4·2 = 8`; `(3+2ε)² − (12ε+4ε²) = 9`; `(2+2)² = 16 < 5·5 = 25`; gives `s_k² ≥ s_{k+1}s_{k−1}` | holds; none |
| §3.6 (sample, headline) | slices; `(ℙ¹)³`, `i = 2`; `i = r`; `ℙ² ⊔ ℙ²`; positivity | `dim Z_j = r − (j−1) − (i−j) = r−i+1`; on `Z_j`: `y_{j+1}·x_j ≤ (r−i+1)·y_j·x_{j+1}`, product `(r−i+1)^i·(y_1/y_{i+1})·x_{i+1}`; `6 ≤ 4·1·2 = 8`; equality; `5 ≤ 2` false; `(B^r)(A^r) ≤ c·(A^kB^{r−k})(B^kA^{r−k})` | holds; none |
| §4.1 | `z²` with models `(id, f)`, `(f, f∘f)`; `√2·O(1)` | `e = 1`: `1, 2`; `e = 2`: `2 = 2·1`; cycle of degree `√2`, not in `CH_0 ≅ ℤ` | holds; none |
| §4.2 (headline) | Cremona; `O(1,0)`; `(1.5, 0.5)`; `A ≤ A+I`; `f^*ω = qω` | `(1,2,1)`; `0`; `2·1.5·0.5 = 1.5 < 2`; `0 ≤ 3 ≤ 8`; `e(f)(ω^d) = q^d(ω^d)` | holds; none |
| §4.3 (sample, repair, headline) | `ℙ¹_ℂ/ℝ`, `id`; cuspidal cubic | `deg_1 = e(id)·(O(1))_{/ℝ} = 2 = 1 + 1`; `ν^*O(1) = O(3)`, `3 = 3` | holds; none |
| §4.4 (sample, headline) | route on `W`; `k = 0, d`; `z², z²`; Frobenius then `z²`; Cremona; `E×E` | `e(f_1)(L_2^d)·deg_k(f_2f_1) ≤ (d−k+1)^k·e(f_1)deg_k(f_2)·deg_k(f_1)`; `(L_1^d) = (L_1^d)`, `e(f_2f_1)(L_3^d) = e(f_1)e(f_2)(L_3^d)`; `4 ≤ 4`; `2p = p·2`; `1 ≤ 8`; `0 ≤ (2/2)·3·3 = 9` | holds; none |
| §4.5 (headline) | chain `ω', ω, ω, ω'`; swap on `ℙ¹×ℙ¹`; `E×E` | `C_1 = (d−k+1)^{2k}(ω'^{d−k}ω^k)(ω^{d−k}ω'^k)/(ω^d)²`; `c = 9/4, 9/16`, `C = 9`, ratio `5/2`; `4 − 2 − 2 + 9 = 9`, `c = 25/4, 25/64`, `C = 25`, ratio `9/2` | holds; none |
| §5.1 (sample, headline) | `u_0`; lower bound; degree `a`; Cremona | `u_0 = log (d−k+1)^k ≥ 0`, so `u_n ≤ u_0 + u_n`; `u_n ≥ log(C_k/C)`; `inf_n ((d−k+1)^k a^{nk})^{1/n} = a^k`; `2, 1, 2, 1, …` | holds; none |
| §5.2 (sample, headline) | Fibonacci; Frobenius; `λ_0 = 1` with concavity; `d = 1` | `φ² ≈ 2.618 ≥ 1`; `p^{2k} = p^{k−1}p^{k+1}`; `log λ_k/k` nonincreasing, so `λ_k ≤ λ_1^k`; range `1 ≤ k ≤ 0` empty | holds; none |
| §5.3 (repair) | Cremona conjugated; cuspidal cubic; `ℙ¹_ℂ/ℝ`; ample `H` | `1 = 1` each; `H_{K'}` ample and `deg_{k,H_{K'}}(f_{K'}^n) = deg_{k,H}(f^n)` | holds; none |
| §5.4 (sample, headline) | degree `a`; Fibonacci; `n = 0` | `d·log a`; `0 = log e ≤ 0.4812 ≤ 2·0.4812`; `h(id) = 0` | holds; none |
| §6.1 (sample) | `σ∘σ`; `(x_0², x_0x_1, x_0x_2)`; `(0,0,1)` then `σ`; `σ ∘ [x_i²]`; constant `g`; `d = 0` | `(x_0x_1x_2)·x_i`; degree `1`; `G(F) = 0`; coprime, `4 = 2·2`; `0 = a·0`; reduced form `(1)`, degree `0` | holds; R01 (locator) |
| §6.2 (sample, headline) | section of `aA − B`; `k = 0`; Cremona | `a·deg_k − deg_{k+1} = (A^{d−k−1}B^k·E) ≥ 0`; `(A^{d−1}·E) = 0`, so `deg_1 = a`; `deg_2 = 1 = 4 − 3 ≤ 4` | holds; none |
| §6.3 (headline) | Cremona `d`; Fibonacci `n = 1, 2, 3`, `n = 0`; inverse | `Π_{j≠i}F_j = (Πx)^{d−1}·x_i`; `[xyz : xy² : z³]`, `[xy²z² : x²y³ : z⁵]`, `fib(n−1) + 2fib(n) = fib(n+2)`: `2, 3, 5`; `(1, y, z)` sends `(2,3,1)`, `(4,6,2)` to different points; `(u,v) ↦ (v/u, u)` | holds; none |
| §6.4 (headline) | `(x², y)`; Hénon; `(y, z, x+yz)`; `(x, xy)` | `[x_0² : x_1² : x_0x_2]`, base point `[0:0:1]`, `(1,2,2)`, `4 ≥ 2`; `F² = (x+y², y+(x+y²)²)`, degree `4`; `F³` contains `z(x+yz)²`: degrees `2, 3, 5`; fibre over `(0,1)` empty | holds; none |

### Sources: the seeded sample

The manifest flags no locator as unverified. Every locator below was opened in the cached text this round.

| Target | Locators opened | Outcome |
| --- | --- | --- |
| 1.1 | `stacks-morphisms` lines 6046–6050; `dinhsibony2005` lines 69–70 | as cited |
| 1.3 | `dang2020` lines 1285–1288, 1334 (diagram (5.1)) | as cited |
| 2.1 | `stacks-varieties` lines 4716–4721, 4784–4788; `kleiman2005` lines 3624–3627 | as cited |
| 2.2 | `stacks-chow` lines 3995–3997 | as cited |
| 3.1 | `cutkosky2015` lines 274–287 | as cited (complete variety, arbitrary field) |
| 3.3 | `dang2020` lines 840–869; `dangfavre2021` lines 427–434; `lazarsfeld2004` by locator | as cited; line 434 gives `C_d = d` for `k = 1` |
| 3.5 | `cutkosky2015` lines 983–1033, 1014–1020; `guedj2010` lines 1178–1181; `dangfavre2021` lines 464–467 | as cited; Remark 6.2 with `n = 2` gives `16 < 25` |
| 3.6 | `dang2020` lines 141–143, 871–883; `dangfavre2021` lines 427–433 | as cited; constant `(r−i+1)^i` at line 874 |
| 4.3 | `dang2020` lines 18–20; `truong2020` lines 1529–1533 | conventions, as the repaired text says |
| 4.4 | `dang2020` lines 27–30, 1271–1284, 1335–1358; `dangfavre2021` lines 448–451; `truong2020` lines 763, 999–1003, 1104–1106; `dinhsibony2005` lines 245–247; `silverman2014` line 387 | as cited; constant at line 1284 |
| 5.1 | `dangfavre2021` lines 461–465; `dang2020` lines 42–46; `dinhsibony2005` lines 256–259; `silverman2014` lines 383–389; `truong2020` lines 143–158 | as cited |
| 5.2 | `dang2020` lines 42–46; `dangfavre2021` lines 464–467; `guedj2010` lines 1136–1140, 1180; `dinhsibony2005` lines 69–70 | as cited |
| 5.4 | `dinhsibony2005` lines 33–37; `guedj2010` lines 1178–1181 | as cited |
| 6.1 | `stacks-constructions` lines 1267–1274; `silverman2014` lines 350–357 and 43–45; `guedj2010` lines 1145–1147; `russakovskiishiffman1997` line 510 | Lemma 13.1 as cited; R01 for the Silverman lines |
| 6.2 | `russakovskiishiffman1997` lines 506–541, 542–543, 582–583; `guedj2010` lines 1141–1147; `silverman2014` line 387 | as cited ("equality iff `codim I_P > ℓ`" at line 518; `δ_2 = (deg P)² − q` at line 542) |

Also opened: `stacks-morphisms` lines 488–489, 2198–2203, 3862–3865; `stacks-varieties` lines 691–695 (Lemma 8.6 (3) is the condition §2.4 (a) uses) and 4778–4780; `dinhsibony2005` lines 45–51, 61–68; `dangfavre2021` lines 148–150, 177–180; `guedj2010` lines 1272–1275; `truong2020` lines 159–164, 1542–1544; `silverman2014` lines 358–380. All fifteen manifest entries are cited in the README (2 to 17 mentions) and every cited work has an entry; `lazarsfeld2004` and `fulton1998` are settled uncertified. No source was fetched; the manifest is unchanged.

### Suppliers resolved at their current heads

| Supplier | Where read | Found |
| --- | --- | --- |
| SchemeAndStackFoundations | main | headings §§0.3, 0.7, 0.11, 0.20, 0.30, 2.6, 3.3, 4.11, 4.12, 4.13, 4.16, 4.19, 5.1, 5.2, 5.3, 5.9, 5.10; §5.9 `Chow.intersectionNumber` as the `n₁n₂` coefficient for proper `S` of dimension ≤ 2 and its Chow comparison on smooth projective `S`; §5.10 `hodge_index` with `H² > 0`, `D·H = 0` giving `D² ≤ 0`; §4.19 `alteration_theorem` with `X_1` open in a regular projective scheme, the finite extension `k'/k` retained |
| StableReduction | main | "Layer 2: coherent curve theory, duality, and positivity" |
| CyclotomicClassGroupsAndStickelberger | open head | §4.3: numerical intersection as the coefficient of `n₁⋯n_d`; polynomiality of degree ≤ `dim Supp F`; symmetry, additivity, projection formula with the function-field degree and zero on a dimension drop, Cartier restriction, ample positivity, field-extension compatibility |
| AlgebraicModuliForArithmeticGeometryPartII | open head | §0.1 length-weighted law and field invariance; §1.1 `Num(X/S)`, `N¹`; §1.2 Check `ρ(E × E) = 2 + rank End(E)`; §1.4 Check with the matrix `[[1,√2],[√2,2]]`; §1.5 base change of Noetherian schemes, geometric fibres; §1.7 (ii), (iii), (v), with `(L₁⋯L_d·V)` the Chow degree, and the two API facts |
| AlgebraicModuliForArithmeticGeometry | open head | §1.4 relative very ampleness; §5.4 "The image of f after flat base change is the pullback of C", "For a scheme morphism the construction is exactly `Scheme.Hom.image`"; §9.10 `nefMixedIntersectionBound` (not consumed) |
| ArakelovGeometryAndAbelianHeightsPartII | open head | §0.1 geometric nefness; §0.3 (1′) and, for `d ≥ 1`, (2′), on a projective `k`-variety |
| LefschetzPencilsAndVanishingCycles | open head | §5.1: Bertini irreducibility, `dim g(X) > s`, "part of this target" |
| ArithmeticDynamics | open head | §0.18 `deg(f g) = deg f · deg g`; §0.26 injective monoid map onto the `K`-endomorphisms of `ℙ¹_K` |

SchemeAndStackFoundations and StableReduction are on main; the other six are open pull requests that add a new roadmap folder and are earlier in `merge-order/ORDER.txt`; none is on the never-cite list. The worker's citation resolver lists no unresolved citation or Lean name; the overlap listing lists no dropped or revision-only id. Dependency check, full output:

```text
candidate: DynamicalDegreesOfRationalMaps is not in the merge order yet; checked as if placed after ArakelovGeometryAndAbelianHeightsPartII (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2247 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

### Pinned declarations

A script opened every file-and-line locator of the two library contracts at the pins: 46 Mathlib and 25 Tau Ceti locators, 0 mismatches (among them `Scheme.RationalMap.comp`, Mathlib/AlgebraicGeometry/Birational/Composition.lean:155, with `[f.IsDominant]` on the first map only; `comp_assoc`, line 182, with `[IrreducibleSpace X₂] [Nonempty X₃]` and `f₁`, `f₂` dominant; `Subadditive.tendsto_lim`, Mathlib/Analysis/Subadditive.lean:155; `Scheme.Hom.functionFieldAlgHom`, TauCeti/AlgebraicGeometry/Scheme/BaseAlgebra.lean:409; `isReduced_image`, TauCeti/AlgebraicGeometry/SchemeTheoreticImage/Basic.lean:78; `intersectionNumber_eq_finrank_mul`, TauCeti/AlgebraicGeometry/IntersectionNumber/FieldTower.lean:66). By object: the pinned Mathlib has no graph of a rational map under `Mathlib/AlgebraicGeometry`; the pinned Tau Ceti has no nefness predicate, no topological degree and no pullback along a rational map; its `TauCeti/AlgebraicGeometry/Birational/RationalMap.lean` and `AlgHom.lean` give morphisms from maps of function fields (valuation-ring stalks, proper targets), as the Scope says.

### Ownership and overlap

No second copy: main has no `DynamicalDegreesOfRationalMaps` folder and the board index lists no package of this subject. A search of main and every open head for "dynamical degree", "algebraic entropy", "graph of a rational map" finds nothing; "Khovanskii" finds only AlgebraicModuliForArithmeticGeometry §9.10 (named in Scope with its clause of difference); "Siu" finds the arithmetic inequality of ArithmeticDynamics §4.3 and the geometric volume inequality of ArakelovGeometryAndAbelianHeightsPartII §0.3, which HeightsRationalPointsAndObstructionsPartII also imports from there; this roadmap imports it and owns only the intersection form and the product form.

Overlap check: read AlgebraicModuliForArithmeticGeometryPartII, AdicCoefficientsAndComparisonsPartII, ArakelovGeometryAndAbelianHeightsPartII, AbundanceStatement, JacobianChallenge, SchemeAndStackFoundations; nefness, `N¹`, Kleiman and the ample and nef cones: AlgebraicModuliForArithmeticGeometryPartII (imported); volume and Siu's volume inequality: ArakelovGeometryAndAbelianHeightsPartII (imported); alterations, Chow operations, the surface pairing and Hodge index: SchemeAndStackFoundations (imported); nothing shared with the other three.

### Headline theorems and `Suggested.lean`

Headlines (README, "The headline statements"): graph properties (§1.2); Khovanskii–Teissier and Siu for products (§§3.5–3.6); positivity, boundary values and field invariance of the degrees (§§4.2–4.3); sub-multiplicativity and comparison (§§4.4–4.5); existence and properties of `λ_k` and `h_alg` (§§5.1–5.4); projective and affine formulas with the Cremona and Fibonacci computations (§§6.2–6.4). Each is a target with hypotheses and a row above. No `Suggested.lean` exists at the design stage: the one-tactic probe, the `#check` comparison and the import check had nothing to run on.

### Copyright, wording, arrangement, reuse

- Wording, set beside the sources: §1.1 (`stacks-morphisms` 6046–6050; `dinhsibony2005` 69–70), §2.1 (`stacks-varieties` 4716–4721; `kleiman2005` 3624–3627), §2.2 (`stacks-chow` 3995–3997), §3.1 (`cutkosky2015` 274–287), §3.3 statement and route (`dang2020` 842–866: the source subtracts general members of `|B|`; the README's route goes through the imported volume inequality), §3.5 (`cutkosky2015` 983–1033), §3.6 (`dang2020` 871–883: same telescoping idea, the README's own `x_j, y_j`), §4.3 (`truong2020` 1529–1533), §4.4 (`dang2020` 27–30, 1281–1358), §5.1 (`dangfavre2021` 461–465; `silverman2014` 383–389), §5.2 (`guedj2010` 1136–1140, 1178–1181), §5.4 (`dinhsibony2005` 33–37), §6.1 (`stacks-constructions` 1267–1274), §6.2 (`russakovskiishiffman1997` 499–541). No sentence or proof plan follows a source clause by clause or translates it; shared runs are formulas and standard names.
- Arrangement: `dangfavre2021` (17 mentions) and `dang2020` (16) lead. Headings read from the texts: `dangfavre2021` 1 (1.1 numerical cycles, 1.2 positive cycles, 1.3 dynamical degrees), 2 b-classes, 3 intersection of b-divisors, 4 spectral interpretation, 5, 6; only its §1.3 and the setting of Theorem 2 are used. `dang2020` 1 Chow group, 2 numerical cycles, 3 positivity (3.4 Siu), 4 relative classes, 5 dynamics (5.1 degrees, 5.2 sub-multiplicativity, 5.3 norms), 6 semi-conjugation, 7 mixed degree formula. Common matter: `§§3.3, 3.6 ↔ 3.4` and `§§4.1, 4.4 ↔ 5.1, 5.2`; Layers 1, 2, 5, 6 have no counterpart there and its §§1, 2, 4, 6, 7 none here. No one-to-one run; the order of Layers 2, 3, 4 is forced by the *Needs* lines above.
- Reuse: no table, figure or list taken over. The worked-examples table is the roadmap's own; the `ℙ² ⊔ ℙ²` non-example is the case `n = 2` of `cutkosky2015` lines 1015–1020, recomputed and cited.

Source independence: 15 passages compared with 11 sources, none shared; largest share dangfavre2021, 17 of 111 mentions of a source id (dang2020 16); contents compared with dangfavre2021 and dang2020: independent.

## Not verifiable

- Lean elaboration: not available (this lane does not elaborate; say so in the report). No Lean command was run.
- `lazarsfeld2004` (Theorems 1.4.9, 1.6.1, 2.2.15; Corollaries 1.4.10, 1.6.3) and `fulton1998` (Theorem 1.4, Proposition 2.5): settled uncertified, cited by locator, not read. `dang2020` line 842 attributes Siu's inequality to Lazarsfeld's Theorem 2.2.13 where the README cites Theorem 2.2.15; which number is right could not be checked without the book.
- The formula `deg(F^{∘n}) = fib(n + 2)` for `(y, z, x + yz)` in the §6.4 Check was computed for `n = 1, 2, 3` only (`2, 3, 5`).
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

<!-- tauceti-roadmap-review {"agent": "claude", "head": "5a8d13d6070b324728440d6955040f7ad3bf3236", "job": "REV-DESIGN-DynamicalDegreesOfRationalMaps~12", "model": "fable", "worker": "chris-x88"} -->
