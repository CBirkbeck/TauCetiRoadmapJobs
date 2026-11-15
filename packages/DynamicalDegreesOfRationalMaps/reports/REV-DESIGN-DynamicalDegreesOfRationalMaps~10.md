<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12938#issuecomment-6898002197 -->
Review (claude) of ae92cf8

Verdict: needs_changes

1. **F01** (P3) Scope and `plan.json` place the ArithmeticDynamics §0.26 citation in §6.2; it is used in §6.1

   **Location:** `packages/DynamicalDegreesOfRationalMaps/design/README.md`, Scope, last imported bullet: "ArithmeticDynamics §§0.18 and 0.26, used in a Check of §6.2"; `design/plan.json`, targets 6.1 and 6.2, `prerequisites`.

   **Claim:** both sections are consumed by a Check of §6.2, and only there.

   **Witness:** README §6.1 Checks, first bullet: "the coprime binary forms of ArithmeticDynamics §0.18, and the scheme maps agree with §0.26 there". The §6.2 Check cites §0.18 only. `plan.json` 6.1 test "d = 1 agrees with ArithmeticDynamics §0.18 and §0.26" has neither prerequisite; 6.2 lists both.

   **Repair:** in Scope write "used in Checks of §§6.1 and 6.2". In `plan.json` add `roadmap:ArithmeticDynamics §0.18` and `roadmap:ArithmeticDynamics §0.26` to the prerequisites of target 6.1, and drop `roadmap:ArithmeticDynamics §0.26` from target 6.2. Tested: after the change each target lists exactly the sections its own tests name; the Layer 6 Dependencies line ("ArithmeticDynamics §§0.18, 0.26 (Checks)") is already right, and the dependency check is unaffected (same supplier, earlier in the order).

One finding, P3 (no P1, no P2): R01 carries a repair, so the verdict asks for that change; nothing else is to be repaired. All three findings of the previous review are repaired. No declared supplier gaps (`plan.json` `gaps` is empty). No maintainer notes were given. Lean elaboration: not available (this lane does not elaborate; say so in the report); the design has no `Suggested.lean`, so nothing was elaborated or probed.

## Previous findings (round 9), checked first

| Finding | Repaired passage | Status |
| --- | --- | --- |
| F01 (P3): §4.4 cited Truong's Theorem 1.1 (1), a limit, for the inequality | §4.4: "truong2020 Lemma 4.5, lines 999–1003, with an unspecified constant, for correspondences between smooth projective varieties over an algebraically closed field of characteristic zero … and the proof of Theorem 5.3, lines 1104–1106"; §5.1: "truong2020 Theorem 1.1 (1), lines 143–158, for smooth `X` …" | **Repaired.** `truong2020` line 1002 is `(f∘g)^*(ω^p) ≤ C·deg(f^*ω^p)·g^*(ω^p)`; line 763 is the characteristic-zero hypothesis of its §4; line 1106 is `deg′_p(f^{n+m}) ≤ C·deg′_p(f^n)·deg′_p(f^m)`; lines 150–158 state a limit only. `plan.json` 4.4 and 5.1 and the manifest (`locator`, `cited_for` §5.1) agree. |
| F02 (P3): "projective" where the argument gives "proper" | §3.1: "For every proper `K`-scheme `X`, `L` is nef on `X` if and only if `L_{K'}` is nef on `X_{K'}`"; Scope: "for proper `X` and every extension `K'/K`"; `plan.json` 3.1: "X proper over K" | **Repaired.** Each input read at its head is for proper schemes (table of suppliers below). |
| F03 (P3): §§2.3 and 3.1 had no source locator in the text | §2.3: "stacks-varieties Lemma 45.5, tag 0BER, line 4778; dangfavre2021 §1.3, lines 436–443, for real classes as polarizations"; §3.1: "cutkosky2015 §2.2, lines 274–287, for nef and ample real classes on a complete variety over an arbitrary field" | **Repaired.** Line 4778 is additivity of the intersection number; lines 436–443 define `deg_{k,ω}` for a big and nef class; lines 274–287 define nef and ample real divisors on a complete variety over any field. |

Pattern search. F01 (a locator whose item does not state the claim): I opened every locator of the fifteen sampled targets and of §§2.1, 2.2, 3.6, 4.2, 4.3, 4.5, 5.2, 5.4, 6.2 and 6.3 (table below); each item states what it is cited for, with the restriction the README names. F02 (a hypothesis stronger than the route): §2.3 (proper), §3.2 (proper `X`, any closed `Z`), §3.4 (no positivity of `H`), §4.4 (no normality) carry the hypotheses their routes use. F03 (a subsection without a source id): a count over the README finds a source id in every `### k.n` subsection.

## Verified sound

### Principles, shape, house style

- General library: arbitrary field, no normality, inseparable degree counted, geometric integrality only where the base-changed map must be a map of varieties; no algorithm, no `set_option`, no sorry'd data, no Lean file at this stage.
- Shape: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, six layers each ending with Examples and Dependencies, Downstream consumers, Worked examples, References. `plan.json`: 6 layers, 27 targets, every target with at least 3 tests (definitions and constructions 1.1, 1.2, 1.3, 2.3, 4.1, 5.1, 5.4: 6, 5, 4, 4, 4, 3, 4 tests and 6, 6, 3, 4, 5, 2, 3 API entries).
- Organisation: layers named by their mathematics. Forced order: Layer 3 needs §§2.1–2.4; §4.4 needs §§1.3 and 3.6; Layer 5 needs §§4.2–4.5 and §3.5; Layer 6 needs §§3.2, 4.1–4.2, 5.1–5.4. Layers 1 and 2 are independent and say so.
- Process residue: a mechanical search of the README for LaTeX delimiters, pull-request numbers, machine paths, round labels, "so far", "checkpoint", "handoff", "optional", "deferred", "removed", `lemma` as a keyword: none (the hits are "Chow's lemma", "Fekete's lemma" and "for later roadmaps" in the list of exclusions). The roadmap attributes no backticked Lean name to itself.

### Adversarial table (values recomputed this round)

On `E × E` without CM: `xF_1 + yF_2 + zΔ ↦ [[x+z, −z], [−z, y+z]]`, intersection `tr(B·adj B')`, `I = F_1 + F_2 ↦ diag(1,1)`, `A ↦ [[1, √2], [√2, 2]]`.

| Statement | Instances | Values on each side | Result; change |
| --- | --- | --- | --- |
| §3.1 field extension (repaired) | `ℙ¹_ℂ/ℝ`, `O(±1)`; `V(x² + ty²)` over `𝔽_2(t)`; `dim X = 0` | `±2 = ±1 ± 1` on two components; `2 = 2·1` through the double line (`m = 2`); no curves, both sides vacuous | holds; none |
| §4.4 (repaired locator; sample, headline) | route on `W`; `k = 0, d`; `z², z²`; Frobenius then `z²`; `E × E` | §3.6 with `i = k`: `(B^d) = e(f_1)(L_2^d)`, `(A^kB^{d−k}) = e(f_1)·deg_k(f_2)`, `(B^kC^{d−k}) = deg_k(f_1)`; `(L_1^d) = (L_1^d)`; `e(f_2∘f_1)(L_3^d) = e(f_1)e(f_2)(L_3^d)`; `4 ≤ 4`; `2p = p·2`; `0 ≤ (2/2)·3·3 = 9` | holds; none |
| §5.1 (repaired locator; headline) | `u_n` bound; degree `a` morphism; Cremona | `u_n ≥ log(C_k/C)`, `u_0/0 = 0`; `inf_n ((d−k+1)^k a^{nk})^{1/n} = a^k`; `2, 1, 2, 1, …`, limit `1` | holds; none |
| §2.3 (repaired locator; sample) | `√2·O(1,0) + O(0,1)`; `2·O(1,1) − O(1,0)`; `−O(1)` | `2·√2·1 = 2√2`; class `(1,2)`, degrees `2, 1`, nef; `−1`, not nef | holds; none |
| §1.1 (sample) | `z²`; Frobenius; projection `ℙ² ⤏ ℙ¹`; tower | `[K(z):K(z²)] = 2`; `p^d`; `finrank = 0`, trdeg `1`; `4 = 2·2` | holds; none |
| §1.2 (sample, headline) | `id`; `z²`; Cremona; constant `[0:1]` | diagonal; `π_2` of degree `2`; three lines over three points; `Γ = ℙ¹ × pt`, `π_2` not onto | holds; none |
| §1.3 | `ℙ¹_ℂ/ℝ`, `id, id`; `z², z²` | triple diagonal, three degrees `1`; `(q_Y,q_Z)` of degree `2 = e(f)`, not `4` | holds; none |
| §2.1 | `K[ε]/ε²`; `V(xy)`; `V(x²)` | `2 = 2·1`; `2 = 1 + 1`; `χ(O(n)) − χ(O(n−2)) = 2n + 1`, `2 = 2·1` | holds; none |
| §2.2 | blow-up of `ℙ²`, `O(bE)` | `Σ_{j=1}^{b}(1 − j) = (b − b²)/2`; Riemann–Roch `½(bE)·(bE + 3L − E) + 1 = ½(b − b²) + 1`; `n_1n_2` coefficient of `1 + (n − n²)/2`: `−1` | holds; none |
| §2.4 (sample) | `ℙ¹_ℂ/ℝ`; pointless conic; `x² + ty²` over `𝔽_2(t)`; pinched `ℙ¹_ℂ` | `c = 2`, `2 = 2·1`; `c = 1`, `2 = 2`; chart `K[x,z]/(x²+t) = K'[z]`, `c = 2·1`, `2 = 2·1`; functions `f(i) = f(−i) ∈ ℝ`, `H⁰ = ℝ`, `ℂ ⊆ K(V)` | holds; none |
| §3.1 ample approximation (sample) | route; `m = 3`, `n = 3`, `δ = 1/5`, `(2.41, 3.41, −1.42)` | `(β·C) ≥ (ω·C) − n·(δ/2mn)·m(H·C) + (δ/2)(H·C) = (ω·C)`; `A_j = N(Σt'L + δH)`; `1.9701 − 2.0164 = −0.0463`; `2.6061 − 2.0164 = 0.5897`; `[[119,142],[142,219]]`, det `5897`; `H/2` on `ℙ²`: `1/4 < 1` | holds; none |
| §3.1 class `A` | degrees; `Av`; decomposition of `A + I` | `2, 1, 3 + 2√2`; `A·(−√2, 1) = (0, 0)`; entries `2 − √2 + √2 − 1 + 1 = 2`, `2 − √2 + 2√2 − 2 = √2`, `2 − √2 + 4√2 − 4 + 5 − 3√2 = 3` | holds; none |
| §3.2 (sample) | `O(1,−1)`; `O(2,1)`; `V(x²)` | `−2`, not nef; `4`, degrees `1, 2`; `2 = 2·1` | holds; none |
| §3.3 (sample) | route; `(1,1),(1,0),(0,1)`; `B = (1,−1)`; `E × E` | `vol(pA − qB) ≥ p^{r−1}(p(A^r) − rq(A^{r−1}B))`; `2 = 2`; `2 ≤ 0` false; `24 ≤ 30` | holds; none |
| §3.4 (sample) | `D''`; `ℙ¹×ℙ¹`; blow-up, `H = 2L + E` | `D''·H' = 0`, `D''² = (H'²)((H'²)(D²) − (D·H')²)`; `0 ≥ −4`; `H² = 3`, `H·E = −1`, `1 ≥ −3`, `4 ≥ 3` | holds; none |
| §3.5 (sample, headline) | `(2,1),(1,1)`; `A + εI`; `ℙ² ⊔ ℙ²`; `C = A^{k−1}B^{d−k−1}` | `9 ≥ 8`; `(3+2ε)² − (12ε + 4ε²) = 9`; `16 < 25`; gives `s_k² ≥ s_{k+1}s_{k−1}` | holds; none |
| §3.6 (headline) | telescoping; `(ℙ¹)³`, `i = 2`; `i = r`; `ℙ² ⊔ ℙ²` | `dim Z_j = r − i + 1`, `x_j ≤ (r−i+1)(y_j/y_{j+1})x_{j+1}`, product `(r−i+1)^i·y_1/(B^r)·x_{i+1}`; `6 ≤ 8`; equality; `5 ≤ 2` false | holds; none |
| §4.1 (sample) | `z²` with models `(id, f)`, `(f, f∘f)`; `√2·O(1)` | `(1, 2)`; `k = 0`: `2 = 2·1`; degree `√2 ∉ ℤ` | holds; none |
| §4.2 (headline) | Cremona; `O(1,0)`; `(1.5, 0.5)`; `A ≤ A + I` | `(1,2,1)`; `0`; `2·1.5·0.5 = 1.5 < 2`; `0 ≤ 3 ≤ 8` | holds; none |
| §4.3 (headline) | `ℙ¹_ℂ/ℝ`, `id`; cuspidal cubic | `2 = 1 + 1`; `ν^*O(1) = O(3)`, `3 = 3` | holds; none |
| §4.5 (headline) | chain `ω', ω, ω, ω'`; swap on `ℙ¹×ℙ¹`; `E × E` | `C_1 = (d−k+1)^{2k}(ω'^{d−k}ω^k)(ω^{d−k}ω'^k)/(ω^d)²`; `c = 9/4, 9/16`, `C = 9`, ratio `5/2`; `tr([[2,√2],[√2,3]]·[[2,−√2],[−√2,3]]) = 4 − 2 − 2 + 9 = 9`, `C = 25`, ratio `9/2` | holds; none |
| §5.2, §5.4 (headline) | Fibonacci; concavity | `(1, φ, 1)`, `φ² = 2.618 ≥ 1`; `log λ_k ≤ k·log λ_1`; `log φ = 0.4812 ≤ 2·0.4812` | holds; none |
| §5.3 (sample) | Cremona conjugated; cuspidal cubic; `ℙ¹_ℂ/ℝ` | `1 = 1` in each | holds; none |
| §6.1 (sample; R01) | `σ∘σ`; `(x_0², x_0x_1, x_0x_2)`; `(0,0,1)` then `σ`; `σ ∘ [x_i²]`; `d = 0` | `P^{d−1}·x_i` with `P = Πx_j`; degree `1`; `G(F) = 0`; `(x_1²x_2², …)` coprime, `4 = 2·2`; reduced form `(1)`, degree `0` | holds for `d ≥ 1`; R01 (citation only) |
| §6.2 (sample; R01) | section of `aA − B`; `k = 0`; Cremona | `a·deg_k − deg_{k+1} = (A^{d−k−1}B^k·E) ≥ 0`; `(A^{d−1}·E) = 0`, `deg_1 = a`; `deg_2 = 1 = 4 − 3` | holds; R01 (citation only) |
| §6.3 (headline) | `M^n` for `M = [[0,1],[1,1]]`, `n = 1, 2, 3`; `n = 0`; inverse | `(y, xy) ↦ (xy, xy²) ↦ (xy², x²y³)`; coordinate degrees `fib(n−1) + 2fib(n) = fib(n) + fib(n+1) = fib(n+2)`: `2, 3, 5`; tuple `(1, y, z)`, degrees `0, 1, 1`; `(u,v) ↦ (v/u, u)` | holds; none |
| §6.4 (sample, headline) | `(x², y)`; Hénon; `(y, z, x+yz)`; `(x, xy)` | `[x_0² : x_1² : x_0x_2]`, base point `[0:0:1]`, `(1,2,2)`, `4 ≥ 2`; `F² = (x+y², y+(x+y²)²)`, degree `4`; degrees `δ_{n+3} = max(δ_n, δ_{n+1}+δ_{n+2})`: `2, 3, 5`; fibre over `(0,1)` empty | holds; none |

### Sources: the seeded sample

The manifest flags no locator as unverified. Opened in the cached texts; each matches in number, line and hypotheses.

| Target | Locators opened | Outcome |
| --- | --- | --- |
| 1.1 | `stacks-morphisms` lines 6046–6050; `dinhsibony2005` lines 69–70 | as cited |
| 1.2 | `dinhsibony2005` lines 45–51; `dang2020` lines 21–25; `guedj2010` lines 1099–1111; `stacks-morphisms` lines 488–489 | as cited |
| 2.3 | `stacks-varieties` lines 4778–4780; `dangfavre2021` lines 436–443 | as cited |
| 2.4 | `stacks-varieties` lines 691–695; `stacks-morphisms` lines 3862–3865 | as cited; item (2) is the quasi-affine case |
| 3.1 | `cutkosky2015` lines 274–287 | complete variety, any field: as the README says |
| 3.2 | `cutkosky2015` lines 281–287; `lazarsfeld2004` by locator | as cited; the book not read |
| 3.3 | `dang2020` lines 840–869; `dangfavre2021` line 434 | constant `r`; `C_d = d` for `k = 1` |
| 3.4 | `kleiman2005` lines 3803–3808; `cutkosky2015` lines 994–1003 | geometrically irreducible complete surface, `H² > 0`: as cited |
| 3.5 | `cutkosky2015` lines 983–1033 and 1014–1020; `guedj2010` line 1180; `dangfavre2021` lines 464–467 | as cited |
| 4.1 | `dang2020` lines 21–25; `dangfavre2021` lines 436–443, 452–454; `dinhsibony2005` lines 61–63; `russakovskiishiffman1997` lines 499–505 | `k` copies from the target in each |
| 4.4 | `dang2020` lines 27–30, 1271–1288, 1348–1358; `dangfavre2021` lines 448–451; `dinhsibony2005` lines 245–247; `silverman2014` line 387; `truong2020` lines 763, 999–1003, 1104–1106 | constant at `dang2020` line 1284; as cited |
| 5.3 | `truong2020` lines 159–164, 1529–1533; `dang2020` lines 35–46; `dinhsibony2005` lines 256–263 | as cited |
| 6.1 | `stacks-constructions` lines 1267–1274; `silverman2014` lines 350–357; `guedj2010` lines 1145–1147; `russakovskiishiffman1997` line 510 | as cited |
| 6.2 | `russakovskiishiffman1997` lines 506–541, 582–583; `guedj2010` lines 1141–1147 | equality condition at line 518; as cited |
| 6.4 | `dangfavre2021` lines 177–180; `silverman2014` lines 373–380 | as cited |

Also opened: `truong2020` lines 77–89, 143–158, 169–181, 1540–1544; `stacks-varieties` lines 4716–4721, 4784–4789; `stacks-chow` lines 3995–3997; `stacks-morphisms` lines 2198–2203; `kleiman2005` lines 3624–3627; `dang2020` lines 122, 141–143, 176, 871–883; `dangfavre2021` lines 148–180, 427–433, 457–465; `silverman2014` lines 358–413; `guedj2010` lines 1136–1140, 1178–1181, 1272–1282; `russakovskiishiffman1997` lines 542–552; `dinhsibony2005` lines 33–37. All fifteen manifest entries are works the README cites and every cited work has an entry. No source was fetched; this review did not change the manifest.

### Suppliers resolved at their current heads

| Supplier | Where read | Found |
| --- | --- | --- |
| SchemeAndStackFoundations | main | headings §§0.3, 0.7, 0.11, 0.20, 0.30, 2.6, 3.3, 4.11, 4.12, 4.13, 4.16, 4.19, 5.1, 5.2, 5.3, 5.9, 5.10 exist; `Chow.intersectionNumber := χ(O_S) − χ(L⁻¹) − χ(M⁻¹) + χ(L⁻¹ ⊗ M⁻¹)` (README line 8526), which is the `n_1n_2` coefficient: `P(0,0) − P(−1,0) − P(0,−1) + P(−1,−1) = e`; `hodge_index` on that pairing (line 8661); `surface_riemann_roch` (line 8630); `alteration_theorem` (line 7739) |
| StableReduction | main | Layer 2 |
| CyclotomicClassGroupsAndStickelberger | open head | §4.3: the coefficient of `n₁⋯n_d`, polynomiality of total degree `≤ dim Supp F`, symmetry, additivity, projection formula with the function-field degree and zero on a dimension drop, Cartier restriction, ample positivity, field extension |
| AlgebraicModuliForArithmeticGeometryPartII | open head | §0.1 (length-weighted law, field invariance); §1.1; §1.5 ("preserved by base change T → S of Noetherian schemes and detected on geometric fibres", `f` proper); §1.7 (ii), (iii), (v) and the two API facts (ample is positive on curves; `L^{⊗m} ⊗ E` ample for large `m`), `X` proper over a field |
| AlgebraicModuliForArithmeticGeometry | open head | §1.4 (`amplePowersAndFixedTwists`: high powers of an ample sheaf are very ample, closed embeddings for proper `f`); §5.4 ("The image of f after flat base change is the pullback of C"); §9.10 (`nefMixedIntersectionBound` with the log-concavity step) |
| ArakelovGeometryAndAbelianHeightsPartII | open head | §0.1 ("Over a field k the geometric analogue is a projective k-variety with ordinary line bundles, nef meaning nonnegative degree on curves"); §0.3 (1′), (2′) for `d ≥ 1`, numbers from SchemeAndStackFoundations §§5.2–5.3 |
| LefschetzPencilsAndVanishingCycles | open head | §5.1: Bertini irreducibility, `dim g(X) > s`, stated as part of the target |
| ArithmeticDynamics | open head | §0.18 (classes of lifts, `deg(fg) = deg f·deg g`, constants in degree 0); §0.26 (injective monoid map onto the `K`-endomorphisms of `ℙ¹_K`) |

SchemeAndStackFoundations and StableReduction are on main; the other six are open pull requests that add a new roadmap folder, at lines 34, 35, 69, 262, 339 and 341 of `merge-order/ORDER.txt`; none is on the never-cite list. `scratch/citations.md` lists no unresolved citation or Lean name. Dependency check, full output:

```text
candidate: DynamicalDegreesOfRationalMaps is not in the merge order yet; checked as if placed after ArakelovGeometryAndAbelianHeightsPartII (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2247 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

### Pinned declarations opened

Every file-and-line locator of the two library contracts was checked by script at the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, the revisions of `lake-manifest.json`): 46 Mathlib and 25 Tau Ceti locators, 0 mismatches; `TauCeti/AlgebraicGeometry/Birational/AlgHom.lean` exists. Read at the pin: `Scheme.RationalMap.comp (f : X ⤏ Y) [f.IsDominant] (g : Y ⤏ Z)` (Composition.lean:155) applies `f` first and asks no dominance of `g`; `Subadditive.lim` is `sInf ((fun n => u n / n) '' Ici 1)` (Subadditive.lean:106); `tendsto_lim` asks `BddBelow (range fun n => u n / n)` over all `n` (line 155), which §5.1 supplies; `Subadditive` is generated by `to_additive` from `Submultiplicative` (lines 32–35); `functionFieldAlgHom` asks `[f.IsOver (Spec (.of k))] [IsDominant f]` (BaseAlgebra.lean:409) and carries no finiteness.

### Ownership and overlap

`scratch/overlaps.md` lists no shared pull request, no dropped id, no revision-only id, no second copy and no roadmap close in results or headings. Main has no `DynamicalDegreesOfRationalMaps` folder (its only folder with "dynam" in the name is OperatorAlgebraDynamics); the board index and the open list have no other package or pull request of that name. The objects the roadmap owns (pullback of function fields along a rational map, graph of a rational map, degrees `deg_k`, dynamical degrees, algebraic entropy, the inequalities of §§3.3–3.6 over an arbitrary field) have a neighbour only where Scope names one: AlgebraicModuliForArithmeticGeometryPartII §§1.5, 1.7 and AlgebraicModuliForArithmeticGeometry §9.10, each with its clause of difference, read above.

Overlap check: read AlgebraicModuliForArithmeticGeometryPartII, AdicCoefficientsAndComparisonsPartII, ArakelovGeometryAndAbelianHeightsPartII, AbundanceStatement, JacobianChallenge, SchemeAndStackFoundations; nefness, `N¹`, Kleiman and the ample and nef cones: AlgebraicModuliForArithmeticGeometryPartII (imported); volume and Siu's volume inequality: ArakelovGeometryAndAbelianHeightsPartII (imported); alterations, Chow operations, the surface pairing and Hodge index: SchemeAndStackFoundations (imported); nothing shared with the other three.

### Headline theorems and `Suggested.lean`

Headlines (README, "The headline statements"): graph properties (§1.2); Khovanskii–Teissier and product Siu (§§3.5–3.6); positivity, boundary values and field invariance of the degrees (§§4.2–4.3); sub-multiplicativity and comparison (§§4.4–4.5); existence and properties of `λ_k` and `h_alg` (§§5.1–5.4); the projective and affine formulas with the Cremona and Fibonacci computations (§§6.2–6.4). Each is a target with hypotheses and has a row above. There is no `Suggested.lean` at the design stage: the one-tactic probe, the `#check` comparison and the import check had nothing to run on.

### Copyright, wording, arrangement, reuse

- Wording, set beside the sources at their locators: §1.2 definition (`dinhsibony2005` lines 45–51), §3.3 route (`dang2020` lines 850–866: an exact sequence of restrictions there, the imported volume bound and a Cartier divisor here), §3.6 route (`dang2020` lines 876–883: the same chain of restrictions, which the mathematics forces, in the roadmap's own `x_j`, `y_j`), §4.1 definition (`dangfavre2021` lines 436–443), §4.4 route (`dang2020` lines 1285–1288, 1348–1358: normalized graphs there, the image in the triple product here), §4.5 (`dinhsibony2005` lines 260–263), §5.1 route (`silverman2014` lines 386–413: a division argument there, Mathlib's Fekete lemma with an explicit lower bound here), §6.3 (`silverman2014` lines 358–372), §6.4 (`silverman2014` lines 373–380), §3.5 non-example (`cutkosky2015` lines 1014–1020), Scope on correspondences (`truong2020` lines 77–89). No sentence or proof plan follows a source clause by clause; the shared runs are formulas.
- Arrangement: `dangfavre2021` and `dang2020` have the largest counts. `dang2020` contents: 1 Chow group, 2 numerical cycles, 3 positivity, 4 relative classes, 5 dynamics, 6 semi-conjugation, 7 mixed degree formula, 8 Kähler case, 9 comparison with Fulton. Common matter: `Layer 3 ↔ §3.4` only and `Layer 4 ↔ §§5.1–5.2`; Layers 1, 2, 5, 6 have no counterpart and its §§1, 2, 4, 6–9 none here. `dangfavre2021` contents: 1 preliminaries (1.1–1.3), 2 b-classes, 3 the space `N¹_Σ`, 4 action of rational maps, 5 spectral theory, 6 polynomial maps; only its §1.3 is used. No one-to-one run.
- Reuse: no table, figure or list is taken over. The worked-examples table is the roadmap's own; the `ℙ² ⊔ ℙ²` non-example is one instance (`n = 2`) of `cutkosky2015` lines 1015–1020, recomputed (`16 < 25`) and cited.

Source independence: 11 passages compared with 6 sources, none shared; largest share dangfavre2021, 17 of 110 mentions of a source id (dang2020 16); contents compared with dangfavre2021 and dang2020: independent.

## Not verifiable

- Lean elaboration: not available (this lane does not elaborate; say so in the report). No Lean command was run.
- `lazarsfeld2004` (Theorems 1.4.9, 1.6.1, 2.2.15; Corollaries 1.4.10, 1.6.3) and `fulton1998` (Theorem 1.4, Proposition 2.5): settled uncertified, cited by locator, not read. `dang2020` lines 65 and 842 attribute Siu's inequality to Theorem 2.2.13 of the same book where the README cites 2.2.15; the book could not be opened to decide.
- Whether `truong2020` §5 depends on its §4, whose standing hypothesis is characteristic zero (line 763): not traced; the README reports each hypothesis as the source states it and its own route uses neither.
- Ownership against open pull requests was checked on the heads the tools index (main and 476 open roadmap pull requests) and on the board index; packages on other board branches were not opened beyond that index.

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

<!-- tauceti-roadmap-review {"agent": "claude", "head": "ae92cf89e538d050426934681e84c3b170e4b9b4", "job": "REV-DESIGN-DynamicalDegreesOfRationalMaps~10", "model": "fable", "worker": "chris-x82"} -->
