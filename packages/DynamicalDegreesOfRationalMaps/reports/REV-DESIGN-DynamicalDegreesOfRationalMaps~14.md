<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12938#issuecomment-6900670860 -->
Review (claude) of a3eb432

Verdict: needs_changes

1. **F01** (P3) §1.4 re-derives a pinned Tau Ceti theorem and leaves "geometrically integral" unpinned

   - **Location:** `packages/DynamicalDegreesOfRationalMaps/design/README.md`, §1.4, first item of the proof of `e(f_{K'}) = e(f)`: "Both rings are domains, being localizations of coordinate rings of affine opens of the integral `X_{K'}` and `Y_{K'}`"; and "If `X` and `Y` are geometrically integral" (§§1.4, 4.3, 5.3, 5.4).
   - **Claim:** the "From Mathlib" and "From Tau Ceti" contracts list every pinned declaration the routes use, and every predicate is pinned.
   - **Witness:** `TauCeti/AlgebraicGeometry/Geometrically/FunctionField.lean:82`, `isDomain_functionField_tensorProduct_of_geometricallyIntegral`: for `X` integral and geometrically integral over `k`, `K(X) ⊗_k L` is a domain for every field `L/k`. `Mathlib/AlgebraicGeometry/Geometrically/Integral.lean:40`: `AlgebraicGeometry.GeometricallyIntegral`. Neither is named in the README.
   - **Repair:**
     1. Conventions, add: "*Geometric integrality* of a `K`-variety is Mathlib's `AlgebraicGeometry.GeometricallyIntegral` (Mathlib/AlgebraicGeometry/Geometrically/Integral.lean:40) of its structure morphism: every base change to a field is integral."
     2. "From Tau Ceti", add: "`TauCeti.AlgebraicGeometry.isDomain_functionField_tensorProduct_of_geometricallyIntegral` (TauCeti/AlgebraicGeometry/Geometrically/FunctionField.lean:82): for an integral, geometrically integral `K`-scheme `X` and every field extension `L/K`, `K(X) ⊗_K L` is a domain. Its companion `nonempty_functionField_algEquiv_of_isPullback` (line 111) identifies the function field of the base change only for algebraic `L/K`; §1.4 proves the fraction-field statement for every extension."
     3. §1.4, replace the quoted sentence by "Both rings are domains (Tau Ceti's `isDomain_functionField_tensorProduct_of_geometricallyIntegral`), with fraction fields `K(X_{K'})` and `K(Y_{K'})`", and add the declaration and Mathlib's `GeometricallyIntegral` to the *Needs:* line of §1.4.
     Tested on the README's own instance: `ℙ¹_ℂ` over `ℝ` is not geometrically integral and `ℂ(t) ⊗_ℝ ℂ ≅ ℂ(t) × ℂ(t)` is not a domain, so the hypothesis of the cited theorem fails exactly where the §1.4 Check says the statement fails; for `z ↦ z²` on `ℙ¹_K`, `K(z) ⊗_K K' ` is a domain with basis `{1, z}` over `K(z²) ⊗_K K'`, giving `2 = 2`.

2. **F02** (P3) §1.1 and §§1.2, 6.1 do not cite Tau Ceti's function-field degree of a finite flat morphism or its everywhere-defined rational maps

   - **Location:** `packages/DynamicalDegreesOfRationalMaps/design/README.md`, Scope, first item: "Neither library has the pullback along a dominant rational map or its degree"; §1.1 API (no agreement with the library's degree of a morphism); §1.2 "*Morphisms.* … then `U = X`"; §6.1 "A morphism `f = [F]` of `ℙ^d`, that is `V(F_0, …, F_d) = ∅`".
   - **Claim:** the topological degree and the passage between morphisms and everywhere-defined rational maps have no counterpart at the pins beyond the declarations listed.
   - **Witness:** `TauCeti/AlgebraicGeometry/Morphisms/Finite/FlatDegree.lean:87`, `Scheme.Hom.finrank_eq_finrank_fieldRange_functionFieldMap`: for finite flat dominant `f` of integral schemes, `f.finrank y = Module.finrank f.functionFieldMap.hom.fieldRange K(X)`. `TauCeti/AlgebraicGeometry/Birational/RationalMap.lean:93, 120`: `RationalMap.toHom`, `RationalMap.toRationalMap_toHom`.
   - **Repair:**
     1. "From Tau Ceti", add: "`AlgebraicGeometry.Scheme.Hom.finrank_eq_finrank_fieldRange_functionFieldMap` (TauCeti/AlgebraicGeometry/Morphisms/Finite/FlatDegree.lean:87): for a finite flat dominant morphism `g` of integral schemes, Mathlib's rank `Scheme.Hom.finrank g y` at every point is `dim_{g^*K(Y)} K(X)`. `AlgebraicGeometry.Scheme.RationalMap.toHom` and `RationalMap.toRationalMap_toHom` (TauCeti/AlgebraicGeometry/Birational/RationalMap.lean:93, 120): a rational map from an integral scheme to a separated scheme whose domain is everything is the rational map of a morphism."
     2. Scope, first item, after "Neither library has the pullback along a dominant rational map or its degree", add: "for a finite flat dominant morphism of integral schemes Tau Ceti identifies the same number `dim_{g^*K(Y)} K(X)` with the rank (`Scheme.Hom.finrank_eq_finrank_fieldRange_functionFieldMap`), and §1.1 records the agreement."
     3. §1.1, add an API item: "*Agreement with the rank.* For a finite flat dominant `K`-morphism `g : X → Y` of varieties, `e(g)` is Mathlib's `Scheme.Hom.finrank g y` for every point `y`, by Tau Ceti's `Scheme.Hom.finrank_eq_finrank_fieldRange_functionFieldMap`." and a Check: "`z ↦ z²` on `ℙ¹` is finite flat of rank `2 = e`. Negative control: the normalization `ℙ¹ → V(y²z − x³)` is finite and dominant with `e = 1`, but its fibre over the cusp is `K[t]/(t², t³)`, of dimension `2`; it is not flat, and the rank is not `e`."
     4. §§1.2 and 6.1: cite `RationalMap.toHom` and `RationalMap.toRationalMap_toHom` where a rational map with domain `X` is read as a morphism, and add them to both *Needs:* lines.
     Tested on the instances: `z ↦ z²` (rank `2`, `e = 2`); the Frobenius of `ℙ^d` (finite, flat between regular schemes of equal dimension, rank `p^d = e`); the cusp normalization (rank `2` at the cusp against `e = 1`, flatness fails), so the added item is true with its hypothesis and false without it.

Two findings, both P3 (library declarations at the pins that the routes re-derive or leave uncited). No P1, no P2; each finding carries a repair, so the verdict asks for changes. `design/plan.json` declares no supplier gap (`gaps` is empty). No maintainer notes were given. Lean elaboration: not available (this lane does not elaborate; say so in the report). The design has no `Suggested.lean`, so nothing was elaborated or probed.

## Previous findings (round 13), checked first

| Finding | Repaired passage | Status |
| --- | --- | --- |
| First round-13 finding, a locator note: §5.3 cited `dangfavre2021` lines 464–465 for invariance | §5.3 now closes "… dinhsibony2005 Corollaire 7, lines 256–263; dangfavre2021 lines 83–84, for invariance under birational conjugacy." | **Repaired.** `dangfavre2021` lines 83–84 say the dynamical degrees do not depend on the polarization and are invariant under birational conjugacy. |
| Second round-13 finding, a manifest note: two `cited_for` fields incomplete | `dinhsibony2005`: `cited_for` now contains "§5.2"; `dangfavre2021`: now contains "§5.3" | **Repaired.** A section-by-section comparison of all 15 entries with the README (script, this round) reports no difference in either direction. |

Passages the repair changed, reopened: §5.1 "dangfavre2021 lines 461–463" (lines 461–463: the sequence `C·deg_{k,ω}(f^n)` is sub-multiplicative, its roots converge to the infimum, definition of `λ_k`): correct. §3.5 "dangfavre2021 lines 465–467" (log-concavity from Khovanskii–Teissier, `λ_1² ≥ λ_2`): correct. §5.2 "lines 464–467" (`[1, +∞)`, independence of the class, log-concavity): correct. Pattern search: every other `dangfavre2021` locator (lines 148–180, 177–180, 427–434, 436–443, 442–443, 448–451, 452–453, 454, 457–460) was reopened and says what it is cited for.

## Verified sound

### Principles, shape, house style

- General library: arbitrary field, no normality, inseparable degree counted, geometric integrality only where the base-changed map must be a map of varieties. No algorithm, no `set_option`, no sorry'd data, no Lean file at this stage.
- Shape: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, six layers each with Examples and Dependencies, Downstream consumers, Worked examples, References. `plan.json` parses: 6 layers, 27 targets, `gaps` empty; tests per target `6,5,4,5 | 3,3,4,4 | 8,6,4,4,4,3 | 4,6,3,5,4 | 3,3,3,4 | 6,4,4,5`, all at least 3.
- Organisation: layers named by their mathematics. Layers 1 and 2 are independent (each says so); Layer 3 needs Layer 2; §4.4 needs §§1.3 and 3.6; Layer 5 needs §§3.5, 4.2–4.5; Layer 6 needs Layers 3–5: the order is forced by the *Needs:* lines.
- Process residue: a pattern search for LaTeX delimiters, pull-request numbers, round labels, machine paths, HTML anchors and the process words finds only "as motivation for later roadmaps" (the out-of-scope list, each item with its named owner) and prose uses of "lemma" (Fekete's, Chow's). The README attributes no backticked Lean name to this roadmap.

### Adversarial table (values computed this round)

| Statement | Instances | Values on each side | Result; change |
| --- | --- | --- | --- |
| §1.1 (sample) | `z²`, char 2; projection `ℙ² ⤏ ℙ¹`; tower | `[K(z):K(z²)] = 2`; trdeg `1`, `finrank = 0`; `e(g∘f) = e(f)e(g)` on `f^*g^*K(Z) ⊆ f^*K(Y) ⊆ K(X)` | holds; R02 (citation) |
| §1.2 (sample, headline) | `id`; Cremona; constant `[0:1]` | diagonal; a line over each of 3 points; `Γ = ℙ¹ × pt`, `π_2` not onto | holds; R02 (citation) |
| §1.3 | `z², z²`; `ℙ¹_ℂ/ℝ` | degree of `(q_Y,q_Z)` is `2 = e(f)`, not `4`; triple diagonal, degrees `1,1,1` | holds; none |
| §1.4 | `ℙ¹_ℂ/ℝ`; `z²` | `ℂ(t) ⊗_ℝ ℂ = ℂ(t)²`, not a domain; basis `{1, z}`, `2 = 2` | holds; R01 (citation) |
| §2.2 (sample) | blow-up, `O(bE)`; `ℙ¹×ℙ¹` | `½(−b² + b) + 1`, `n_1n_2`-coefficient of `1 + (n − n²)/2` at `n = n_1+n_2` is `−1 = deg O_E(E)`; `(n_1+1)(n_2+1)`: `1`, `0` | holds; none |
| §2.3 (sample) | `√2·O(1,0) + O(0,1)`; `2·O(1,1) − O(1,0)` | `2·√2·1`; class `O(1,2)`, ruling degrees `2, 1` | holds; none |
| §2.4 (sample) | `ℙ¹_ℂ/ℝ`; `x² + ty²` over `𝔽_2(t)`; `sx^p + ty^p + z^p` over `𝔽_p(s,t)` | `c = 2`, `2 = 2·1`; charts `K[x,z]/(x²+t) = K'[z]` and normalization `K'[y]` of `K[x,y]/(x²+ty²)`, `c = 2·1`, `2 = 2·1`; `K' = K`, `m = p`, `p = 1·p·1` | holds; none |
| §3.1 approximation | `m = 3`, `n = 3`, `δ = 1/5`, `(2.41, 3.41, −1.42)`, `N = 100` | `(β·C) ≥ (ω·C) − 3·(1/90)·3(H·C) + (1/10)(H·C) = (ω·C)`; errors `0.0042, 0.0042, 0.0058 < 0.0111`; dets `1.9701 − 2.0164 = −0.0463`, `2.6061 − 2.0164 = 0.5897`; `[[119,142],[142,219]]` | holds; none |
| §3.1 class `A` | coefficients of `A + F_1 + F_2` in the stated decomposition | `F_1`: `4 − 2√2 + 3√2 − 3 + 1 = 2 + √2`; `F_2`: `4 − 2√2 + 6√2 − 6 + 5 − 3√2 = 3 + √2`; `Δ`: `−2 + √2 − 2√2 + 2 = −√2`; degrees `2, 1, 3 + 2√2` | holds; none |
| §3.3 | route; `(1,1),(1,0),(0,1)`; `E×E` | `vol(pA − qB) ≥ p^{r−1}(p(A^r) − rq(A^{r−1}B))`; `2·1 = 2·1·1`; `8·3 = 24 ≤ 2·3·5 = 30` | holds; none |
| §3.4 (sample) | `D''`; blow-up `H = 2L + E`; `E_1, E_2` | `D''² = (H'²)((H'²)(D²) − (D·H')²)`; `H² = 3`, `1 ≥ −3`, `4 ≥ 3`; `0 < 1` | holds; none |
| §3.5 (headline) | `(2,1),(1,1)`; `ℙ² ⊔ ℙ²` | `9 ≥ 4·2`; `16 < 25` | holds; none |
| §3.6 (sample, headline) | telescoping; `(ℙ¹)³`, `i = 2`; `ℙ² ⊔ ℙ²`; consequence | `dim Z_j = r−i+1`, `y_{j+1}x_j ≤ (r−i+1)y_jx_{j+1}`, product `x_1 ≤ (r−i+1)^i(y_1/y_{i+1})x_{i+1}`; `6 ≤ 4·1·2 = 8`; `5 ≤ 2` false; `(B^r)(A^r) ≤ c·(A^kB^{r−k})(B^kA^{r−k})` | holds; none |
| §4.1 (sample) | `z²`, models `(id, f)`, `(f, f∘f)`; `√2·O(1)` | `1, 2`; `2 = 2·1`; degree `√2 ∉ ℤ` | holds; none |
| §4.2 (headline) | Cremona; `O(1,0)`; `f^*ω ≅ qω` | `(1,2,1)`; `0`; `e(f)(ω^d) = q^d(ω^d)` | holds; none |
| §4.3 (sample, headline) | `ℙ¹_ℂ/ℝ`, `id`; cuspidal cubic | `χ_ℝ(O(n)) = 2n + 2`, `2 = 1 + 1`; `3 = 3` | holds; none |
| §4.4 (sample, headline) | route; `k = 0, d`; `z², z²`; Cremona; `E×E` | `e(f_1)(L_2^d)deg_k(f_2f_1) ≤ (d−k+1)^k e(f_1)deg_k(f_2)deg_k(f_1)`; `(L_1^d) = (L_1^d)(L_2^d)/(L_2^d)`, `e(f_2f_1)(L_3^d) = e(f_1)e(f_2)(L_3^d)`; `4 ≤ 4`; `1 ≤ 8`; `0 ≤ 9` | holds; none |
| §4.5 (headline) | swap of `ℙ¹×ℙ¹`; `E×E` | `c = 9/4, 9/16`, `C = 9`, ratio `5/2`; `tr = 4 − 2 − 2 + 9 = 9`, `C = 25`, ratio `9/2` | holds; none |
| §5.1 (headline) | `u_0`; Mathlib hypothesis | `u_0 = k·log(d−k+1) ≥ 0`, so `u_n ≤ u_0 + u_n`; `u_n/n ≥ min(0, log(C_k/C))`, `u_0/0 = 0` | holds; none |
| §5.2 (sample, headline) | Fibonacci; Frobenius; `λ_k ≤ λ_1^k` | `φ² ≈ 2.618 ≥ 1·1`; `p^{2k} = p^{k−1}p^{k+1}`; ratios `λ_k/λ_{k−1}` decrease from `λ_1` | holds; none |
| §5.3 (sample, headline, repaired locator) | Cremona conjugated; cusp; `ℙ¹_ℂ/ℝ`; `ω_{K'}` | `1 = 1` in each; `λ_k(f_{K'})` computed with `H_{K'}`, ample, `(H_{K'}^d) = (H^d)` | holds; none |
| §5.4 (headline) | degree `a`; Fibonacci | `d·log a`; `0 ≤ 0.4812 ≤ 2·0.4812` | holds; none |
| §6.1 (sample) | `σ∘σ`; `σ ∘ [x_i²]`; `(0,0,1)` then `σ`; constant `g`; `d = 0` | `(x_0x_1x_2)·x_i`; coprime, `4 = 2·2`; `G(F) = 0`; `0 = a·0`; reduced form `(1)`, degree `0` | holds; R02 (citation) |
| §6.2 (headline) | section of `aA − B`; Cremona | `a·deg_k − deg_{k+1} = (A^{d−k−1}B^k·E) ≥ 0`; `1 ≤ 2·2`, `4 − 3 = 1` | holds; none |
| §6.3 (sample, headline) | Fibonacci induction; Cremona in dimension `d` | applying `[bc : ab : c²]` to the `n`-th tuple and dividing by `z^{fib n}`: `x^{fib n}y^{fib(n+1)}z^{fib(n+1)}`, `x^{fib(n+1)}y^{fib(n+2)}`, `z^{fib(n+3)}`; degrees `fib(n−1) + 2fib(n) = fib(n+2)`; `Π_{j≠i}(P/x_j) = P^{d−1}x_i` | holds; none |
| §6.4 (sample, headline) | `(x², y)`; Hénon; `(y, z, x+yz)`; `(x, xy)` | `[x_0² : x_1² : x_0x_2]`, base point `[0:0:1]`, `(1,2,2)`, `4 ≥ 2`; `F² = (x+y², y+(x+y²)²)`, degree `4`; third coordinate degree `c_{n+1} = b_n + c_n`: `2, 3, 5`; fibre over `(0,1)` empty | holds; none |
| Worked examples table | five rows | agree with the Checks of §§4.2, 5.2, 5.4, 6.3, 6.4 | holds; none |

### Sources: the seeded sample

The manifest flags no locator as unverified. Opened in the cached texts this round:

| Target | Locators opened | Outcome |
| --- | --- | --- |
| 1.1 | `stacks-morphisms` lines 6046–6050; `dinhsibony2005` lines 69–70 | as cited |
| 1.2 | `dinhsibony2005` lines 45–51; `dang2020` lines 21–25; `guedj2010` lines 1099–1110; `stacks-morphisms` lines 488–489 | as cited |
| 2.2 | `stacks-chow` lines 3995–3997 | as cited |
| 2.3 | `stacks-varieties` lines 4778–4780; `dangfavre2021` lines 436–443 | as cited |
| 2.4 | `stacks-varieties` lines 691–695; `stacks-morphisms` lines 3862–3865 | as cited; condition (3) of Lemma 8.6 is the one used |
| 3.4 | `kleiman2005` lines 3803–3808; `cutkosky2015` lines 994–1003 | as cited |
| 3.6 | `dang2020` lines 141–143, 871–883; `dangfavre2021` lines 427–433 | as cited; constant `(r−i+1)^i` at line 874 |
| 4.1 | `dang2020` lines 21–25; `dangfavre2021` lines 436–443, 452–453; `dinhsibony2005` lines 61–63; `russakovskiishiffman1997` lines 499–505 | as cited |
| 4.3 | `dang2020` lines 18–20; `truong2020` lines 1529–1533 | as cited |
| 4.4 | `dang2020` lines 27–30, 1271–1288; `dangfavre2021` lines 448–451; `truong2020` lines 763, 999–1003, 1104–1106; `dinhsibony2005` lines 245–247; `silverman2014` line 387 | as cited |
| 5.2 | `dang2020` lines 42–46; `dangfavre2021` lines 464–467; `guedj2010` lines 1136–1140, 1180; `dinhsibony2005` lines 69–70 | as cited |
| 5.3 | `dang2020` lines 35–46; `truong2020` lines 159–164, 1529–1533; `dinhsibony2005` lines 256–263; `dangfavre2021` lines 83–84 | as cited |
| 6.1 | `stacks-constructions` lines 1267–1274; `silverman2014` lines 43–45, 350–354; `guedj2010` lines 1145–1147; `russakovskiishiffman1997` line 510 | as cited |
| 6.3 | `guedj2010` lines 1272–1282; `russakovskiishiffman1997` lines 542–552; `truong2020` lines 1542–1544; `silverman2014` lines 358–372 | as cited |
| 6.4 | `dangfavre2021` lines 177–180; `silverman2014` lines 373–380 | as cited |

Also opened: `stacks-morphisms` lines 2198–2203; `stacks-varieties` lines 4716–4721, 4784–4788; `kleiman2005` lines 3624–3627; `cutkosky2015` lines 274–287, 983–1033; `dang2020` lines 840–869; `dangfavre2021` lines 148–152, 454, 457–463; `dinhsibony2005` lines 33–37; `truong2020` lines 77–89, 143–158; `guedj2010` lines 1178–1181; `russakovskiishiffman1997` lines 506–541, 582–583; `silverman2014` lines 383–413. All as cited. All fifteen manifest entries are cited in the README and every cited work has an entry. No source was fetched; the manifest is unchanged by this review.

### Suppliers resolved at their current heads

| Supplier | Where read | Found |
| --- | --- | --- |
| SchemeAndStackFoundations | main | headings §§0.3, 0.7, 0.11, 0.20, 0.30, 2.6, 3.3, 4.11, 4.12, 4.13, 4.16, 4.19, 5.1, 5.2, 5.3, 5.9, 5.10; §4.11 uses Tau Ceti's `IsModification`; §4.13 regular locus equals smooth locus over a perfect field; §4.16 `genericDegree`; §4.19 regular projective compactification; §5.9 `Chow.intersectionNumber`; §5.10 `hodge_index` |
| StableReduction | main | "Layer 2" heading present |
| CyclotomicClassGroupsAndStickelberger | open head | §4.3: numerical intersection as the coefficient of `n₁⋯n_d`; polynomiality, symmetry, additivity, projection formula with the function-field degree and zero on a dimension drop, Cartier restriction, ample positivity, field-extension compatibility |
| AlgebraicModuliForArithmeticGeometryPartII | open head | §0.1 length-weighted law; §1.1 `Num(X/S)`, `N¹`; §1.2 Check `ρ(E × E) = 2 + rank End(E)`; §1.4 Check with `[[1,√2],[√2,2]]`; §1.5 nef classes, pullback, base change of Noetherian schemes; §1.7 (ii), (iii), (v), positive degree of ample sheaves on curves, `L^{⊗m} ⊗ E` ample for large `m` |
| AlgebraicModuliForArithmeticGeometry | open head | §1.4 relative very ampleness, `amplePowersAndFixedTwists` (high powers very ample, closed embeddings when proper); §5.4 "The image of f after flat base change is the pullback of C", "For a scheme morphism the construction is exactly `Scheme.Hom.image`"; §9.10 log-concavity inside `nefMixedIntersectionBound` (not consumed) |
| ArakelovGeometryAndAbelianHeightsPartII | open head | §0.1 geometric analogue: projective `k`-variety, nef meaning nonnegative degree on curves; §0.3 (1′) and, for `d ≥ 1`, (2′) |
| LefschetzPencilsAndVanishingCycles | open head | §5.1: Bertini irreducibility with `dim g(X) > s`, "part of this target" |
| ArithmeticDynamics | open head | §0.18 `deg(f g) = deg f · deg g`; §0.26 injective monoid map onto the `K`-endomorphisms of `ℙ¹_K` |

The six open suppliers add new roadmap folders and stand earlier in `merge-order/ORDER.txt` (lines 34, 35, 69, 262, 339, 341); none is on the never-cite list. The citation resolver lists nothing unresolved; the overlap listing lists no dropped or revision-only id, no other pull request changing this roadmap and no second copy. Dependency check, full output:

```text
candidate: DynamicalDegreesOfRationalMaps is not in the merge order yet; checked as if placed after ArakelovGeometryAndAbelianHeightsPartII (the intake inserts it when its design is accepted)
depcheck: 244 roadmaps, 2241 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

### Pinned declarations

Every file-and-line locator of the two library contracts was checked by script at the pins (46 Mathlib and 25 Tau Ceti locators, each line containing the cited name) and matches. Hypotheses read: `Scheme.RationalMap.comp` (Composition.lean:155, `[f.IsDominant]`, section variables `[PreirreducibleSpace X] [Nonempty Y]` at line 42); `comp_assoc` (line 182, `[PreirreducibleSpace X₁] [IrreducibleSpace X₂] [Nonempty X₃]`, first two maps dominant); `Subadditive.lim` (Subadditive.lean:106, `sInf` over `Ici 1`) and `tendsto_lim` (line 155, `BddBelow (range fun n => u n / n)`); `equivFunctionFieldOver` (RationalMap.lean:562, `[IsIntegral X] [LocallyOfFiniteType (Y ↘ S)]`); `toPartialMap` (line 608, `[IsReduced X] [Y.IsSeparated]`); Tau Ceti `functionFieldAlgHom` (BaseAlgebra.lean:409), `isReduced_image` (SchemeTheoreticImage/Basic.lean:78), `topologicalKrullDim_eq_toNat_trdeg_functionField` (Scheme/FunctionField.lean:101). By object: the pinned Tau Ceti has no nefness predicate, no graph of a rational map, no dynamical degree; it does have the declarations of R01 and R02, and native modifications and normalization (`Morphisms/Modification/Basic.lean:53`, `Normalization/Modification.lean:59`), which the README consumes through SchemeAndStackFoundations §§4.11, 0.20, 0.30, where §4.11 names them.

### Ownership and overlap

No second copy: main has no `DynamicalDegreesOfRationalMaps` folder and neither the board index nor the list of open pull requests has a roadmap of this name. Searches of main and all open heads: "dynamical degree", "algebraic entropy", "graph of a rational map": no match. "Khovanskii": only AlgebraicModuliForArithmeticGeometry §9.10, named in Scope with its clause of difference. "Siu's inequality": ArakelovGeometryAndAbelianHeightsPartII §0.3 (imported), its consumer HeightsRationalPointsAndObstructionsPartII, and the arithmetic inequality of ArithmeticDynamics §4.3 (hermitian line bundles, another object). "nef real class": only AlgebraicModuliForArithmeticGeometryPartII, imported. "Hodge inequality": an unrelated p-adic use. "topological degree": three unrelated uses.

Overlap check: read AlgebraicModuliForArithmeticGeometryPartII, AdicCoefficientsAndComparisonsPartII, ArakelovGeometryAndAbelianHeightsPartII, AbundanceStatement, JacobianChallenge, SchemeAndStackFoundations; nefness, `N¹`, Kleiman and the ample and nef cones: AlgebraicModuliForArithmeticGeometryPartII (imported; AbundanceStatement is not cited); volume and Siu's volume inequality: ArakelovGeometryAndAbelianHeightsPartII (imported); alterations, modifications, Chow operations, the surface pairing and Hodge index: SchemeAndStackFoundations (imported); nothing shared with AdicCoefficientsAndComparisonsPartII or JacobianChallenge.

### Headline theorems and `Suggested.lean`

Headlines (README, "The headline statements"): graph properties (§1.2); Khovanskii–Teissier and Siu for products (§§3.5–3.6); positivity, boundary values and field invariance of the degrees (§§4.2–4.3); sub-multiplicativity and comparison (§§4.4–4.5); existence and properties of `λ_k` and `h_alg` (§§5.1–5.4); projective and affine formulas with the Cremona and Fibonacci computations (§§6.2–6.4). Each is a target with hypotheses and a row above. No `Suggested.lean` exists at the design stage: the one-tactic probe, the `#check` comparison and the import check had nothing to run on.

### Copyright, wording, arrangement, reuse

- Wording, set beside the sources at the locators of the sample table: §1.1, §1.2, §2.2, §2.3, §2.4, §3.4, §3.6 (same telescoping idea, the README's own `x_j, y_j`), §4.1, §4.3, §4.4, §5.1, §5.2, §5.3, §6.1, §6.3, §6.4. No sentence or proof plan follows a source clause by clause or translates it; what is shared is formulas (the Fibonacci coordinate formula, the Siu constant) and standard names.
- Arrangement: `dangfavre2021` (17 mentions) and `dang2020` (16) lead. Contents of `dangfavre2021` read at lines 25–47: 1 (1.1 numerical cycles, 1.2 positive cycles, 1.3 dynamical degrees), 2 b-classes, 3 b-divisors, 4 spectral interpretation; the README uses its §1.3 and the setting of Theorems 1–2 only, and no layer corresponds to a chapter. `dang2020`: its §3.4 corresponds to parts of §§3.3 and 3.6 and its §5.2 to §4.4; Layers 1, 2, 5 and 6 have no counterpart. No one-to-one run.
- Reuse: no table, figure or list taken over. The worked-examples table is the roadmap's own; the `ℙ² ⊔ ℙ²` non-example is the case `n = 2` of `cutkosky2015` lines 1015–1020, recomputed (`16 < 25`) and cited.

Source independence: 16 passages compared with 12 sources, none shared; largest share dangfavre2021, 17 of 112 mentions of a source id (dang2020 16); contents compared with dangfavre2021 and dang2020: independent.

## Not verifiable

- Lean elaboration: not available (this lane does not elaborate; say so in the report). No Lean command was run.
- `lazarsfeld2004` (Theorems 1.4.9, 1.6.1, 2.2.15; Corollaries 1.4.10, 1.6.3) and `fulton1998` (Theorem 1.4, Proposition 2.5): settled uncertified, cited by locator, not read. `dang2020` line 842 attributes Siu's inequality to Lazarsfeld's Theorem 2.2.13 where the README cites Theorem 2.2.15; which number is right could not be checked without the book.
- The degrees `fib(n + 2)` of the iterates of `(y, z, x + yz)` in the §6.4 Check were computed for `n = 1, 2, 3` and by the degree recursion `c_{n+1} = b_n + c_n` on leading forms, not by a written induction.
- Ownership against open pull requests was checked on the heads the tools index (main and 475 open roadmap pull requests) and on the board index; packages on other board branches were not opened beyond that index.

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

<!-- tauceti-roadmap-review {"agent": "claude", "head": "a3eb4321c446e92071cabb7dc6af92658429fddb", "job": "REV-DESIGN-DynamicalDegreesOfRationalMaps~14", "model": "fable", "worker": "chris-x88"} -->
