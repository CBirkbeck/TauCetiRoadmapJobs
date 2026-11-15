<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12938#issuecomment-6898583262 -->
Review (claude) of d0a9838

Verdict: needs_changes

1. **F01** (P3) the locators for extension of the field point to a convention, not to the identities stated

   **Location:** `packages/DynamicalDegreesOfRationalMaps/design/README.md`, §1.4: "`Γ_{f_{K'}} = (Γ_f)_{K'}` (truong2020 §6.3, line 1529)"; §4.3: "(dang2020 lines 18–20; truong2020 §6.3, lines 1529–1533)"; §5.3: "truong2020 … §6.3, line 1529".

   **Claim:** the cited passages state the base-change identities of the graph, of `e`, of `deg_k` and of `λ_k`.

   **Witness:** truong2020 lines 1529–1533 only lift `X` and `f` to the algebraic closure, note the lift may be reducible, and define the degrees of `f` through the lift. dang2020 lines 18–20 say to pass to the algebraic closure. Neither states an equality.

   **Repair:** in the three places say what the locator supports, for instance in §1.4: "(truong2020 §6.3, lines 1529–1533, where the degrees over a field that is not algebraically closed are defined through the lift to the algebraic closure, which may be reducible; the identities here are proved in this section)"; in §4.3 "(dang2020 lines 18–20 and truong2020 §6.3, lines 1529–1533, which pass to the algebraic closure by convention)"; in §5.3 the same clause for §6.3. Tested on the witness: the reworded sentences claim only what lines 1529–1533 and 18–20 contain; the statements keep their proofs in §§1.4 and 4.3. The birational part of §5.3 keeps truong2020 Theorem 1.1 (2), lines 159–164, which does state it.

2. **F02** (P3) "read through §2.2" after a supplier name, twice in §3.3

   **Location:** `packages/DynamicalDegreesOfRationalMaps/design/README.md`, §3.3: "by ArakelovGeometryAndAbelianHeightsPartII §0.3 (1′) read through §2.2" and, in the Route, "ArakelovGeometryAndAbelianHeightsPartII §0.3 (2′), read through §2.2, gives".

   **Claim:** §2.2 is this roadmap's comparison with Chow degrees.

   **Witness:** ArakelovGeometryAndAbelianHeightsPartII has its own §2.2 at its open head, "2.2 Analytic arithmetic divisors and continuous metrized line bundles"; the sentence reads as that section. The round-10 repair fixed the same pattern in §§2.2, 3.1 and 4.1.

   **Repair:** write "read through §2.2 here" in both places. Tested: with "here" the reference can only be this roadmap's §2.2, which is what the route uses (Chow degrees of §0.3 identified with numerical intersections).

Two findings, both P3 (no P1, no P2). Each carries a repair, so the verdict asks for changes: a fix round applies R01 and R02. The single finding of round 10 is repaired, and so are the pattern repairs the fix worker added. No declared supplier gaps (`plan.json` `gaps` is empty), so nothing is conditional on a supplier. No maintainer notes were given. Lean elaboration: not available (this lane does not elaborate; say so in the report); the design has no `Suggested.lean`, so nothing was elaborated or probed.

## Previous finding (round 10), checked first

| Finding | Repaired passage | Status |
| --- | --- | --- |
| F01 (P3): Scope and `plan.json` placed ArithmeticDynamics §0.26 in §6.2; it is used in §6.1 | README Scope: "ArithmeticDynamics §§0.18 and 0.26, used in Checks of §§6.1 and 6.2". `plan.json` 6.1 prerequisites now end with `roadmap:ArithmeticDynamics §0.18`, `roadmap:ArithmeticDynamics §0.26`; 6.2 keeps only `roadmap:ArithmeticDynamics §0.18`; supplier `what`: "(Checks of §§6.1 and 6.2)" | **Repaired.** The §6.1 Check names both sections, the §6.2 Check only §0.18; both headings exist at that roadmap's open head ("0.18 Rational self-maps of ℙ¹ over a field", "0.26 Rational maps as endomorphisms of the scheme ℙ¹_K"). |

Passages the repair round added, each read and checked:

- §2.2 Check and SchemeAndStackFoundations §5.10: `plan.json` 2.2 lists `§5.10`; Layer 2 Dependencies say "§5.10 (a Check of §2.2)". Values recomputed in the table below.
- §3.1 Check and AlgebraicModuliForArithmeticGeometryPartII §§1.2, 1.4: `plan.json` 3.1 lists both; the supplier contract has the new bullet; Layer 3 Dependencies say "§§1.2, 1.4 (a Check of §3.1)". At that roadmap's open head §1.2 states `ρ(E × E) = 2 + rank End(E) ∈ {3, 4, 6}` and the Checks of §1.4 state the positive-semidefinite nef cone for `End(E) = ℤ`, with the same matrix `[[1, √2], [√2, 2]]`.
- The three disambiguations ("§2.2 here" in §§3.1 and 4.1, "without this section" in §2.2) are in place. The same pattern survives twice in §3.3: R02.

## Verified sound

### Principles, shape, house style

- General library: arbitrary ground field, no normality, inseparable degree counted, geometric integrality asked only where the base-changed map must be a map of varieties. No algorithm, no `set_option`, no sorry'd data, no Lean file at this stage.
- Shape: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, six layers each ending with Examples and Dependencies, Downstream consumers, Worked examples, References. `plan.json` parses: 6 layers, 27 targets, every target with at least 3 tests (counted by script: minimum 3, at 2.1, 2.2, 3.6, 4.3, 5.1, 5.2, 5.3); the definitions and constructions 1.1, 1.2, 1.3, 2.3, 4.1, 5.1, 5.4 carry 6, 6, 3, 4, 5, 2, 3 API entries.
- Organisation: layers are named by their mathematics. Forced order: Layer 3 needs §§2.1–2.4; §4.4 needs §§1.3 and 3.6; Layer 5 needs §§4.2–4.5 and §3.5; Layer 6 needs §§3.2, 4.1–4.2, 5.1–5.4. Layers 1 and 2 are independent of each other and say so.
- Process residue: a pattern search of the README for LaTeX delimiters, pull-request numbers, machine paths, round labels, "so far", "checkpoint", "handoff" finds none; the six hits for "lemma" are prose ("Chow's lemma", "Fekete's lemma", "the reduction lemma"). The roadmap attributes no backticked Lean name to itself.

### Adversarial table (values computed this round)

On `E × E` without CM: `xF_1 + yF_2 + zΔ ↦ [[x+z, −z], [−z, y+z]]`, pairing `tr(B·adj B')`, `I = F_1 + F_2 ↦ diag(1,1)`, `A ↦ [[1, √2], [√2, 2]]`.

| Statement | Instances | Values on each side | Result; change |
| --- | --- | --- | --- |
| Conventions, composition | `f = z²`, `g = z + 1` at `z = 1` | `f.comp g = z² + 1 ↦ 2`; `f ∘ g ↦ (1+1)² = 4` | holds; none |
| §1.1 (sample) | `z²`; Frobenius; projection `ℙ² ⤏ ℙ¹`; tower | `[K(z):K(z²)] = 2`; `p^d`; trdeg `1`, `finrank = 0`; `4 = 2·2` | holds; none |
| §1.2 (headline) | `id`; Cremona; constant `[0:1]` | diagonal; three lines over three points; `Γ = ℙ¹ × pt`, `π_2` not onto | holds; none |
| §1.3 (sample) | `z², z²`; `ℙ¹_ℂ/ℝ`, `id, id`; general point of `U` | `(q_Y,q_Z)` degree `2 = e(f)`, not `4`; triple diagonal, degrees `1, 1, 1`; `(x, f(x), gf(x))` lies over `Γ_g` on a dense open, image dense since `f` is dominant | holds; none |
| §1.4 (sample) | `ℙ¹_ℂ/ℝ`; `𝔾_m → 𝔸¹` at the origin; rank argument for `z²`; projection | two diagonals; source `∅`, inverse image a point; basis `{1, z}` gives `2 = 2`; `dim` difference `1`, `0 = 0` | holds; R01 (locator wording) |
| §2.2 (repair) | blow-up of `ℙ²`, `O(bE)` | `Σ_{j=1}^{b}(1 − j) = (b − b²)/2`; Riemann–Roch `½(bE)·(bE + 3L − E) + 1 = ½(b − b²) + 1`; `n_1n_2` coefficient of `1 + (n − n²)/2`: `−1` | holds; none |
| §2.3 (sample) | `√2·O(1,0) + O(0,1)`; `2·O(1,1) − O(1,0)`; `−O(1)` | `2·√2·1 = 2√2`; class `(1,2)`, degrees `2, 1`; `−1` | holds; none |
| §2.4 | `ℙ¹_ℂ/ℝ`; pointless conic; `x² + ty²` over `𝔽_2(t)` | `c = 2`, `2 = 2·1`; `c = 1`, `2 = 2`; chart `K[x,z]/(x²+t) = K'[z]`, `χ = 2n + 1`, `2 = 2·1` | holds; none |
| §3.1 approximation | route; `m = 3`, `n = 3`, `δ = 1/5`, `(2.41, 3.41, −1.42)`, `N = 100` | `(β·C) ≥ (ω·C) − n·(δ/2mn)·m(H·C) + (δ/2)(H·C) = (ω·C)`; `A_j = Nβ_j + (Nδ/2)H`; distances `0.0042, 0.0042, 0.0058 < 1/90`; `1.9701 − 2.0164 = −0.0463`; `2.6061 − 2.0164 = 0.5897`; `26061 − 20164 = 5897` | holds; none |
| §3.1 class `A` (repair) | matrix; degrees; `A + I` | entries `1+√2−√2 = 1`, `2`; `2, 1, 3 + 2√2`; `F_1`: `4 − 2√2 + 3√2 − 3 + 1 = 2 + √2`, `F_2`: `4 − 2√2 + 6√2 − 6 + 5 − 3√2 = 3 + √2`, `Δ`: `−2 + √2 − 2√2 + 2 = −√2` | holds; none |
| §3.2 (sample) | `O(1,−1)`; `O(2,1)`; `V(x²)`; `A` | `−2`; `4`, degrees `1, 2`; `2 = 2·1`; `0`, `3` | holds; none |
| §3.3 | route; `(1,1),(1,0),(0,1)`; `B = (1,−1)`; `E × E`; `r = 1` | `vol(pA − qB) ≥ p^{r−1}(p(A^r) − rq(A^{r−1}B))`; `2 = 2`; `2 ≤ 0` false; `8·3 = 24 ≤ 2·3·5 = 30`; `(A)(B) = (B)(A)` | holds; R02 (wording) |
| §3.4 (sample) | `D''`; `ℙ¹×ℙ¹`; blow-up, `H = 2L + E`; two points | `D''·H' = 0`, `D''² = (H'²)((H'²)(D²) − (D·H')²)`; `0 ≥ −4`; `H² = 3`, `1 ≥ −3`, `4 ≥ 3`; `0 < 1` | holds; none |
| §3.5 (sample, headline) | `(2,1),(1,1)`; `A + εI`; `ℙ² ⊔ ℙ²`; `C = A^{k−1}B^{d−k−1}` | `9 ≥ 8`; `(3+2ε)² − (12ε + 4ε²) = 9`; `16 < 25`; gives `s_k² ≥ s_{k+1}s_{k−1}` | holds; none |
| §3.6 (headline) | slices; `(ℙ¹)³`, `i = 2`; `i = r`; `ℙ² ⊔ ℙ²`; positivity | `dim Z_j = r − i + 1`; on `Z_j`: `(B^{r'}) = y_{j+1}`, `(A_j·C) = x_j`, `(B^{r'−1}A_j) = y_j`, `(B·C) = x_{j+1}`, product `(r−i+1)^i·y_1/(B^r)·x_{i+1}`; `6 ≤ 8`; equality; `5 ≤ 2` false; `(B^r)(A^r) ≤ c·(A^kB^{r−k})(B^kA^{r−k})` | holds; none |
| §4.2 (sample, headline) | Cremona; `O(1,0)`; `(1.5, 0.5)`; `A ≤ A + I`; `f^*ω = qω` | `(1,2,1)`; `0`; `2·1.5·0.5 = 1.5 < 2`; `0 ≤ 3 ≤ 8`; `e(f)(ω^d) = q^d(ω^d)` | holds; none |
| §4.3 (sample, headline) | `ℙ¹_ℂ/ℝ`, `id`; cuspidal cubic | `2 = 1 + 1`; `ν^*O(1) = O(3)`, `3 = 3` | holds; R01 (locator wording) |
| §4.4 (sample, headline) | route on `W`; `k = 0, d`; `z², z²`; Frobenius then `z²`; Cremona; `E × E` | `(B^d) = e(f_1)(L_2^d)`, `(A^kB^{d−k}) = e(f_1)·deg_k(f_2)`, `(B^kC^{d−k}) = deg_k(f_1)`; `(L_1^d) = (L_1^d)`, `e(f_2f_1)(L_3^d) = e(f_1)e(f_2)(L_3^d)`; `4 ≤ 4`; `2p = p·2`; `1 ≤ 8`; `0 ≤ (2/2)·3·3 = 9` | holds; none |
| §4.5 (sample, headline) | chain `ω', ω, ω, ω'`; swap on `ℙ¹×ℙ¹`; `E × E` | `C_1 = (d−k+1)^{2k}(ω'^{d−k}ω^k)(ω^{d−k}ω'^k)/(ω^d)²`; `c = 9/4, 9/16`, `C = 9`, ratio `5/2`; `tr([[2,√2],[√2,3]]·[[2,−√2],[−√2,3]]) = 2 + 7 = 9`, `c = 25/4, 25/64`, `C = 25`, ratio `9/2` | holds; none |
| §5.1 (headline) | `u_0`; lower bound; degree `a` morphism; Cremona | `u_0 = log (d−k+1)^k ≥ 0`, so sub-additivity holds at `m = 0`; `u_n ≥ log(C_k/C)`; `inf_n ((d−k+1)^k a^{nk})^{1/n} = a^k`; `2, 1, 2, 1, …` | holds; none |
| §5.2 (sample, headline) | Fibonacci; Frobenius; concavity from `λ_0 = 1` | `φ² = 2.618 ≥ 1·1`; `p^{2k} = p^{k−1}p^{k+1}`; `log λ_k / k` nonincreasing | holds; none |
| §5.3 (sample) | Cremona conjugated; cuspidal cubic; `ℙ¹_ℂ/ℝ` | `1 = 1` in each | holds; R01 (locator wording) |
| §5.4 (sample, headline) | degree `a`; Fibonacci; `n = 0` | `d·log a`; `log φ = 0.4812 ≤ 2·0.4812`, `log e = 0`; `h(id) = 0 = 0·h` | holds; none |
| §6.1 (repair) | `σ∘σ`; `(x_0², x_0x_1, x_0x_2)`; `(0,0,1)` then `σ`; `σ ∘ [x_i²]`; `d = 0` | `G_0(F) = x_0²x_1x_2 = (x_0x_1x_2)·x_0`; degree `1`; `G(F) = 0`; coprime, `4 = 2·2`; reduced form `(1)`, degree `0` | holds; none |
| §6.2 (repair, headline) | section of `aA − B`; `k = 0`; Cremona | `a·deg_k − deg_{k+1} = (A^{d−k−1}B^k·E) ≥ 0`; `(A^{d−1}·E) = 0`, so `deg_1 = a`; `deg_2 = 1 = 4 − 3 ≤ 2·2` | holds; none |
| §6.3 (headline) | Cremona `d`; Fibonacci `n = 1, 2, 3`, `n = 0`; inverse | `Π_{j≠i}F_j = (Πx)^{d−1}·x_i`; `f∘f = [xyz² : xy²z : z⁴]/z`, `f∘f² = [xy²z³ : x²y³z : z⁶]/z`, degrees `fib(n−1) + 2fib(n) = fib(n+2)`: `2, 3, 5`; `(1, y, z)` not homogeneous; `(u,v) ↦ (v/u, u)` | holds; none |
| §6.4 (sample, headline) | `(x², y)`; Hénon; `(y, z, x+yz)`; `(x, xy)` | `[x_0² : x_1² : x_0x_2]`, base point `[0:0:1]`, `(1,2,2)`, `4 ≥ 2`; `F² = (x+y², y+(x+y²)²)`, degree `4`; `F² = (z, x+yz, y+z(x+yz))`, `F³` of degree `5`: `2, 3, 5`; fibre over `(0,1)` empty | holds; none |

### Sources: the seeded sample

The manifest flags no locator as unverified. Each locator below was opened in the cached text.

| Target | Locators opened | Outcome |
| --- | --- | --- |
| 1.1 | `stacks-morphisms` lines 6046–6050; `dinhsibony2005` lines 69–70 | as cited |
| 1.3 | `dang2020` lines 1285–1288 (the graph of `π_3^{−1} ∘ f_1 ∘ π_1`) | as cited |
| 1.4 | `stacks-morphisms` lines 2198–2203; `truong2020` lines 1529–1533 | Lemma 26.16 as cited; §6.3 is a convention: R01 |
| 2.3 | `stacks-varieties` lines 4778–4780; `dangfavre2021` lines 436–443 | as cited |
| 3.2 | `cutkosky2015` lines 274–287; `lazarsfeld2004` by locator | as cited; the book not read |
| 3.4 | `kleiman2005` lines 3803–3808; `cutkosky2015` lines 994–1003 | geometrically irreducible complete surface, `H² > 0`; line 1002 drops geometric irreducibility: as the README says |
| 3.5 | `cutkosky2015` lines 983–1033 and 1014–1020; `guedj2010` line 1180; `dangfavre2021` lines 464–467 | Theorem 6.1 with `p = 2` is the inequality stated; as cited |
| 4.2 | `dangfavre2021` line 454; `russakovskiishiffman1997` lines 506–511 | as cited |
| 4.3 | `dang2020` lines 18–20; `truong2020` lines 1529–1533 | conventions: R01 |
| 4.4 | `dang2020` lines 27–30, 1271–1284, 1344–1358; `dangfavre2021` lines 448–451; `dinhsibony2005` lines 245–247; `silverman2014` line 387; `truong2020` lines 763, 999–1003, 1104–1106 | constant at `dang2020` line 1284; as cited |
| 4.5 | `dang2020` lines 31–41; `dangfavre2021` lines 457–460; `dinhsibony2005` lines 256–263 | as cited |
| 5.2 | `dang2020` lines 42–46; `dangfavre2021` lines 464–467; `guedj2010` lines 1136–1140, 1180; `dinhsibony2005` lines 69–70 | as cited |
| 5.3 | `dang2020` lines 35–46; `truong2020` lines 159–164, 1529; `dinhsibony2005` lines 256–263; `dangfavre2021` lines 464–465 | birational part as cited; §6.3: R01 |
| 5.4 | `dinhsibony2005` lines 33–37; `guedj2010` lines 1178–1181 | as cited |
| 6.4 | `dangfavre2021` lines 177–180; `silverman2014` lines 373–380 | as cited |

Also opened: `stacks-morphisms` lines 3862–3865 (Lemma 38.7 (2), the quasi-affine case used in §2.4 (c)); `truong2020` lines 143–158; `dinhsibony2005` lines 45–51, 61–68; `silverman2014` lines 383–387; `russakovskiishiffman1997` lines 499–505. All fifteen manifest entries are works the README cites (mention counts 2 to 17) and every cited work has an entry; `lazarsfeld2004` and `fulton1998` are settled uncertified. No source was fetched and the manifest was not changed.

### Suppliers resolved at their current heads

| Supplier | Where read | Found |
| --- | --- | --- |
| SchemeAndStackFoundations | main | headings §§0.3, 0.7, 0.11, 0.20, 0.30, 2.6, 3.3, 4.11, 4.12, 4.13, 4.16, 4.19, 5.1, 5.2, 5.3, 5.9, 5.10 exist; `Chow.intersectionNumber := χ(O_S) − χ(L⁻¹) − χ(M⁻¹) + χ(L⁻¹ ⊗ M⁻¹)` (README line 8526); `hodge_index` with `H² > 0`, `D·H = 0`, `D² ≤ 0` on that pairing (line 8661); `alteration_theorem` (line 7739) |
| StableReduction | main | "Layer 2: coherent curve theory, duality, and positivity" |
| CyclotomicClassGroupsAndStickelberger | open head | §4.3: the coefficient of `n₁⋯n_d`, polynomiality of total degree `≤ dim Supp F`, symmetry, additivity, projection formula with the function-field degree and zero on a dimension drop, Cartier restriction, ample positivity, field extension |
| AlgebraicModuliForArithmeticGeometryPartII | open head | §0.1 (length-weighted law, tower factor, field invariance); §1.1 (`Num = Pic/Pic^τ`, `N¹ = Num ⊗ ℝ`); §1.2 Check `ρ(E × E)`; §1.4 Check (semidefinite cone); §1.5 ("preserved by base change T → S of Noetherian schemes and detected on geometric fibres"); §1.7 (ii), (iii), (v) and the two API facts, `X` proper over a field |
| AlgebraicModuliForArithmeticGeometry | open head | §1.4 (`amplePowersAndFixedTwists`: high powers of an ample sheaf very ample, closed embeddings for proper `f`); §5.4 ("The image of f after flat base change is the pullback of C"; "For a scheme morphism the construction is exactly `Scheme.Hom.image`"); §9.10 (`nefMixedIntersectionBound`, not consumed) |
| ArakelovGeometryAndAbelianHeightsPartII | open head | §0.1 ("Over a field k the geometric analogue is a projective k-variety with ordinary line bundles, nef meaning nonnegative degree on curves"); §0.3 (1′) and, for `d ≥ 1`, (2′) |
| LefschetzPencilsAndVanishingCycles | open head | §5.1: Bertini irreducibility with `dim g(X) > s`, "part of this target" |
| ArithmeticDynamics | open head | §0.18 (classes of lifts, `deg(fg) = deg f·deg g`); §0.26 (injective monoid map onto the `K`-endomorphisms of `ℙ¹_K`) |

SchemeAndStackFoundations and StableReduction are on main; the other six are open pull requests that add a new roadmap folder, at lines 34, 35, 69, 262, 339 and 341 of `merge-order/ORDER.txt`; none is on the never-cite list. The worker's citation resolver lists no unresolved citation or Lean name. Dependency check, full output:

```text
candidate: DynamicalDegreesOfRationalMaps is not in the merge order yet; checked as if placed after ArakelovGeometryAndAbelianHeightsPartII (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2247 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

### Pinned declarations opened this round

- Mathlib: `Scheme.RationalMap.comp (f : X ⤏ Y) [f.IsDominant] (g : Y ⤏ Z)` (Mathlib/AlgebraicGeometry/Birational/Composition.lean:155), `f` first and no dominance of `g`; `comp_assoc` (line 182) asks `f₁`, `f₂` dominant, which every use here supplies; `RationalMap.equivFunctionFieldOver` (Birational/RationalMap.lean:562) with `[IsIntegral X] [LocallyOfFiniteType (Y ↘ S)]`; `RationalMap.compHom` (line 440); `IsSchemeTheoreticallyDominant.of_isPullback` (Morphisms/SchemeTheoreticallyDominant.lean:112) with `[QuasiCompact f] [Flat g]`; `IsFinite.iff_isProper_and_isAffineHom` (Morphisms/Proper.lean:97).
- Tau Ceti: `Scheme.Hom.functionFieldAlgHom` (TauCeti/AlgebraicGeometry/Scheme/BaseAlgebra.lean:409), with `[f.IsOver (Spec (.of k))] [IsDominant f]` and no finiteness; `isReduced_image` (SchemeTheoreticImage/Basic.lean:78); `topologicalKrullDim_eq_toNat_trdeg_functionField` (Scheme/FunctionField.lean:101); `intersectionNumber_eq_finrank_mul` (IntersectionNumber/FieldTower.lean:66).

The remaining file-and-line locators of the two library contracts rest on round 10's scripted check (46 Mathlib and 25 Tau Ceti locators, 0 mismatches); the pins have not moved and no repair touched those lines.

### Ownership and overlap

The overlap listing gives no shared pull request, no dropped id, no revision-only id, no second copy and no roadmap close in results or headings. Main has no `DynamicalDegreesOfRationalMaps` folder; the open list and the board index have no other package of that subject. A search of every open head and of main for "dynamical degree", "algebraic entropy", "Khovanskii", "graph of a rational map" and "topological degree" finds only AlgebraicModuliForArithmeticGeometry §9.10 (log-concavity as a step, smooth, characteristic zero; named in Scope with its clause of difference) and unrelated uses. ArithmeticDynamicsPartII is open and does not state dynamical degrees.

Overlap check: read AlgebraicModuliForArithmeticGeometryPartII, AdicCoefficientsAndComparisonsPartII, ArakelovGeometryAndAbelianHeightsPartII, AbundanceStatement, JacobianChallenge, SchemeAndStackFoundations; nefness, `N¹`, Kleiman and the ample and nef cones: AlgebraicModuliForArithmeticGeometryPartII (imported); volume and Siu's volume inequality: ArakelovGeometryAndAbelianHeightsPartII (imported); alterations, Chow operations, the surface pairing and Hodge index: SchemeAndStackFoundations (imported); nothing shared with the other three.

### Headline theorems and `Suggested.lean`

Headlines (README, "The headline statements"): graph properties (§1.2); Khovanskii–Teissier and product Siu (§§3.5–3.6); positivity, boundary values and field invariance of the degrees (§§4.2–4.3); sub-multiplicativity and comparison (§§4.4–4.5); existence and properties of `λ_k` and `h_alg` (§§5.1–5.4); the projective and affine formulas with the Cremona and Fibonacci computations (§§6.2–6.4). Each is a target with hypotheses and has a row above. There is no `Suggested.lean` at the design stage: the one-tactic probe, the `#check` comparison and the import check had nothing to run on.

### Copyright, wording, arrangement, reuse

- Wording, set beside the sources at their locators: §1.1 degree (`stacks-morphisms` lines 6046–6050; `dinhsibony2005` lines 69–70), §1.2 graph (`dinhsibony2005` lines 45–51), §1.4 flat base change (`stacks-morphisms` lines 2198–2203), §2.3 (`stacks-varieties` lines 4778–4780), §3.1 real classes (`cutkosky2015` lines 274–287), §3.4 (`kleiman2005` lines 3803–3808), §3.5 statement and non-example (`cutkosky2015` lines 983–987, 1014–1020), §4.1 definition (`dang2020` lines 21–25; `dangfavre2021` lines 436–443), §4.4 statement (`dang2020` lines 27–30, 1281–1284; `truong2020` lines 999–1003), §4.5 (`dang2020` lines 31–41; `dinhsibony2005` lines 256–263), §5.1 (`dangfavre2021` lines 461–465), §5.4 (`dinhsibony2005` lines 33–37), §6.4 (`dangfavre2021` lines 177–180; `silverman2014` lines 373–380). No sentence or proof plan follows a source clause by clause; the shared runs are formulas and standard names.
- Arrangement: `dangfavre2021` (17 mentions) and `dang2020` (16) have the largest counts. `dang2020` sections, read from its text: 1 Chow group, 2 numerical cycles, 3 positivity (3.4 Siu), 4 relative classes, 5 dynamics (5.1 degrees, 5.2 sub-multiplicativity, 5.3 norms), 6 semi-conjugation, 7 mixed degree formula, 9 comparison with Fulton. Common matter is `§§3.3, 3.6 ↔ 3.4` and `§§4.1, 4.4 ↔ 5.1, 5.2`; Layers 1, 2, 5, 6 have no counterpart and its §§1, 2, 4, 6–9 none here. `dangfavre2021` sections: 1 positive cycles and dynamical degrees (1.1–1.3), 2 b-classes, 3 intersection of b-divisors, 4 spectral interpretation, 5 spectral gap, 6 polynomial maps; only its §1.3 and the setting of Theorem 2 are used. No one-to-one run.
- Reuse: no table, figure or list is taken over. The worked-examples table is the roadmap's own; the `ℙ² ⊔ ℙ²` non-example is the instance `n = 2` of `cutkosky2015` lines 1015–1020, recomputed (`16 < 25`) and cited.

Source independence: 13 passages compared with 9 sources, none shared; largest share dangfavre2021, 17 of 110 mentions of a source id (dang2020 16); contents compared with dangfavre2021 and dang2020: independent.

## Not verifiable

- Lean elaboration: not available (this lane does not elaborate; say so in the report). No Lean command was run.
- `lazarsfeld2004` (Theorems 1.4.9, 1.6.1, 2.2.15; Corollaries 1.4.10, 1.6.3) and `fulton1998` (Theorem 1.4, Proposition 2.5): settled uncertified, cited by locator, not read.
- The closed formula `deg(F^{∘n}) = fib(n + 2)` for Silverman's `(y, z, x + yz)` in the §6.4 Check was computed for `n = 1, 2, 3` only (`2, 3, 5`); the source asserts the induction without writing it.
- Ownership against open pull requests was checked on the heads the tools index (main and 477 open roadmap pull requests) and on the board index; packages on other board branches were not opened beyond that index.

## Source issues

- **Misprint** in dinhsibony2005 at Corollaire 7, proof, printed page 7: the source says the roots of the degrees converge to their own infimum; it should be the infimum after multiplying the degrees by the constant; affects the proof.
- **Misprint** in dinhsibony2005 at Corollaire 7, proof, printed page 7: the source says the displayed bound gives `λ(f) ≤ λ(h)`; it should give `λ(h) ≤ λ(f)` first, the other by symmetry; affects the proof.
- **Error** in silverman2014 at Example 5, printed page 9: the source says the indeterminacy loci of the map and of its inverse are disjoint; it should note both contain `[0 : 1 : 0]` (the inverse is `[yz : x² : xz]`); affects nothing.
- **Misprint** in silverman2014 at Example 6, printed page 9: the source says the `n`-th iterate has degree `F_n`; it should be `F_{n+2}` (degrees `2, 3, 5`); affects nothing.
- **Misprint** in guedj2010 at Théorème 2.4 (a), page 33 of the arXiv file: the source says the inequality holds for `1 ≤ l ≤ k`; it should stop at `l = k − 1`, since `λ_{k+1}` is not defined; affects a stated result.
- **Misprint** in cutkosky2015 at §2.2, printed page 6: the source says the Picard group is isomorphic to the group of Cartier divisors; it should be Cartier divisors modulo linear equivalence; affects nothing.

The three dang2020 items of the round-10 register (Proposition 3.4.1 and Theorem 3.4.4) were not reopened this round.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d0a98380047903c07f9bb4d04230bedac86e67b6", "job": "REV-DESIGN-DynamicalDegreesOfRationalMaps~11", "model": "fable", "worker": "chris-x26"} -->
