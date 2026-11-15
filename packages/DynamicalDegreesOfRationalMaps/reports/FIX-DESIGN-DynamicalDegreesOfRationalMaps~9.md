# FIX-DESIGN-DynamicalDegreesOfRationalMaps~9: repair report

Review settled: `REV-DESIGN-DynamicalDegreesOfRationalMaps~8`, with two findings, both P3. Both were checked against the suppliers at their current heads, and both are right. F01 is applied with a corrected last sentence. F02 is applied as asked, with one Check of §2.2 rewritten in the same pattern.

## F01 (P3) — applied differently

Old → new: the Scope bullet for §§3.1–3.6 now says how §3.1 differs from AlgebraicModuliForArithmeticGeometryPartII §1.7 (iii) and (v). Those state, in `N¹(X/K)` for projective `X`, that `Amp(X/K)` is the interior of the nef cone, that the nef cone is its closure, and that nef plus `Amp` lies in `Amp`. §3.1 works in `Pic(X) ⊗ ℝ` and produces one ample line bundle `N⁻¹A_j` per class. Its route uses §1.7 (ii) and two §1.7 API facts.

Verification: I read AlgebraicModuliForArithmeticGeometryPartII §1.7 at its open head (`roadmaps show`, README lines 388–437).
- (iii) defines `Amp(X/k)` as the cone of finite positive real combinations of ample classes. For `X` with an ample sheaf, it says `Amp` is the interior of `Nef` and `Nef` is its closure.
- (v) says "a nef real class plus an ample real class is ample", meaning a class of `Amp`.
- Neither statement gives what §3.1 gives: a rational perturbation within the tolerance `δ/(2mn)`, plus `δH`, that equals `N⁻¹` times a single ample line bundle in `Pic(X) ⊗ ℝ`. The homogeneity arguments of §§3.2–3.6 need exactly that form.

Why the suggested text was changed: it ended "Its route uses §1.7 (ii) only", which is false. The §3.1 route also uses two API facts of §1.7, both already in the supplier contract:
- ample line bundles have positive degree on integral curves (this gives `|(L_i · C)| < m(H · C)`);
- `mH ± L_i` is ample for large `m`.

The sentence now says "§1.7 (ii) and the two facts of §1.7 listed in the supplier contracts, not (iii) or (v)". No supplier edge changes.

Pattern search: I looked for other statements of §3.1 that sit next to a supplier's statement without a Scope clause. I found one more. §3.1's field-extension item proves, for projective `X` and every `K'/K`, that `L_{K'}` nef implies `L` nef, curve by curve. AlgebraicModuliForArithmeticGeometryPartII §1.5 at its head only preserves nefness under base change and detects it on geometric fibres. The same Scope bullet now says this in one sentence.

The other owned-beside-imported statements already carry such a clause: §2.1 (the `r = 1` law of §0.1), §3.2 (Kleiman, "This subsection adds …"), §3.4 (the smooth case of SchemeAndStackFoundations §5.10) and §3.5 (§9.10). §2.2 gets its clause under F02.

Ownership: I searched main and the 475 open heads for `interior of Nef` and for statements of the nef cone as a closure. The only hits are AlgebraicModuliForArithmeticGeometryPartII §1.7 (iii) and (iv). A search for an approximation of nef classes by ample line bundles found nothing.

## F02 (P3) — applied

Old → new:
- **Scope import and contract.** SchemeAndStackFoundations §5.9 is added. Its pairing is `χ(O_S) − χ(−L) − χ(−M) + χ(−L − M)` (`Chow.intersectionNumber`). On proper surfaces it is the coefficient of `n_1n_2`; on smooth projective ones it is the Chow degree. The §5.10 entry now says it uses this pairing.
- **§2.2.** "For `r ≤ 1` it is §3.3's degree" and "identifies … §5.10 with numerical intersections" become: `r = 0`, `r = 1`, and `r = 2` with `Z = X` smooth (that case is §5.9). The statement here covers all `r`. §5.10's numbers are numerical by its §5.9.
- **§3.4.** "read through §2.2" becomes "whose pairing is the numerical intersection (§5.9)". In *Needs:*, §2.2 is replaced by §5.9.
- **Elsewhere.** §5.9 is added to the Layer 3 Dependencies. In `plan.json`, target 3.4's prerequisite `target:2.2` becomes SchemeAndStackFoundations §5.9, and the SchemeAndStackFoundations supplier entry gains §5.9.

Verification on main (SchemeAndStackFoundations README lines 8526–8538 and 8661–8663; Suggested.lean lines 1172–1203):
- `Chow.intersectionNumber` is the second mixed difference of `χ` described above.
- For `S` proper of dimension at most two, the README identifies it with the coefficient of `n₁n₂`, and for smooth projective `S` with `deg(c_1(L) ∩ c_1(M) ∩ [S])` (0BFI).
- `hodge_index` is stated in this pairing (`0 < Chow.intersectionNumber k S H H`).

For a polynomial `P` of total degree at most two, `P(0,0) − P(−1,0) − P(0,−1) + P(−1,−1)` is its `n₁n₂` coefficient. I checked this term by term: `n₁²`, `n₂²`, the linear terms and the constant contribute `0`, and `n₁n₂` contributes `1`. So the §3.4 hypothesis `(H'²) > 0` and the conclusion are §5.10's, with no Chow comparison needed.

Pattern search, the other places:
- **The §2.2 Check.** It said that Riemann–Roch "shows" the coefficient of `n_1n_2` is the Chow intersection. Since §5.10's Riemann–Roch is stated in §5.9's pairing, that claim was circular. The Check is replaced by a computed instance (`plan.json` test `surface_rr` → `negative_self_intersection`). On the blow-up of `ℙ²` at a point, `χ(O_S(bE)) = 1 + (b − b²)/2`, both from the sequences and from Riemann–Roch with `K_S = −3L + E`. That gives `(E²) = −1`, which equals the degree of `O_E(E)` on the Chow side.
- **Remaining "read through §2.2" uses.** These are §3.1 (ArakelovGeometryAndAbelianHeightsPartII §0.1), §3.2 (AlgebraicModuliForArithmeticGeometryPartII §1.7 (ii)) and §3.3 (ArakelovGeometryAndAbelianHeightsPartII §0.3 (1′), (2′)). I checked these suppliers at their heads. §1.7 (ii) is written with "the degree of `c₁(L₁) ∩ ⋯ ∩ c₁(L_d) ∩ [V]` (SchemeAndStackFoundations §§5.2–5.3)". §0.3's geometric case cites SchemeAndStackFoundations §§5.2–5.3 for "degrees of products of first Chern classes". So these numbers really are Chow degrees, and §2.2 is needed there. No change.

## Adversarial pass on the changed text

| Statement | Instances tried | Values on each side | Result; change |
| --- | --- | --- | --- |
| Scope, §1.7 (iii)/(v) clause | `ℙ¹ × ℙ¹`; `E × E` without CM (§3.1 Checks); `X` finite over `K` | `O(1,0)`: nef boundary, not in `Amp`; `O(1,0) + O(1,1) = O(2,1)` in the open quadrant. `A + I`: matrix `[[2,√2],[√2,3]]`, det `4 > 0`, interior. Rounded `A`: det `−0.0463`, outside `Nef`. Approximant `261F_1 + 361F_2 − 142Δ`: `[[119,142],[142,219]]`, det `26061 − 20164 = 5897 > 0`. Finite `X`: `Amp = Nef = N¹ = {0}`, every line bundle ample | consistent with (iii), (v) and §3.1; none |
| Scope, "route uses (ii) and two API facts" | §3.1 route, `m = 3`, `n = 3`, `δ = 1/5` on `E × E` | `(β·C) ≥ 0 − 3·(1/90)·3(H·C) + (1/10)(H·C) = 0` uses ample ⇒ positive on curves. `3H ± Δ` ample uses `mH + E` ample. `A_j = Nβ_j + (Nδ/2)H` ample uses (ii) | the suggested "(ii) only" was false; corrected |
| Scope, field-extension clause | `ℙ¹_ℂ` over `ℝ` with `O(1)` and `O(−1)`; `ℙ¹_K` over `K(t)` | `2 = 1 + 1 ≥ 0`, both nef; `−2 = −1 − 1`, both not nef; `a = a` | holds in both directions; none |
| §2.2, `r = 0` | `Spec 𝔽_4 ⊆ ℙ¹_{𝔽_2}`; `Spec K[ε]/(ε²)` | `χ = 2 = 1·[𝔽_4 : 𝔽_2]`; `χ = 2 = 2·1` | holds; the old "`r ≤ 1` is §3.3's degree" was wrong at `r = 0` (§3.3 has no zero-cycle degree): restated |
| §2.2, `r = 1` | conic `Z ⊆ ℙ²`, `O(1)` | `n`-coefficient of `χ(O_{ℙ¹}(2n)) = 2n + 1` is `2`; `χ(O_Z(1)) − χ(O_Z) = 3 − 1 = 2`; Chow degree `2` | holds; none |
| §2.2, `r = 2`, `Z = X` smooth (§5.9) | `ℙ¹ × ℙ¹`: `(O(1,0), O(0,1))`, `(O(1,0), O(1,0))` | `1 − 0 − 0 + 0 = 1` against the `n₁n₂` coefficient `1` of `(n₁+1)(n₂+1)` and `h₁h₂ = 1`; `1 − 0 − 0 + χ(O(−2,0)) = 1 − 1 = 0` against `n₁ + n₂ + 1`, coefficient `0`, and `h₁² = 0` | holds; none |
| §2.2 beyond §5.9 (singular `Z`) | quadric cone `Q ⊆ ℙ³` | `χ(O_Q(n)) = (n+1)²`, coefficient of `n₁n₂` in `(n₁+n₂+1)²` is `2 = deg(h² ∩ [Q])` | the general statement is needed; none |
| §2.2 new Check | blow-up of `ℙ²`: `b = −1, 0, 1, 2` | sequences: `χ(O(−E)) = 1 − 1 = 0`, `1`, `1 + χ(O_{ℙ¹}(−1)) = 1`, `1 + χ(O_{ℙ¹}(−2)) = 0`. Formula `1 + (b − b²)/2`: `0, 1, 1, 0`. RR `½(bE)·(bE + 3L − E) + 1 = ½(−b² + b) + 1`, same. Coefficient of `n₁n₂` in `f(n₁+n₂)`: `−1`. Chow: `deg O_E(E) = −1` | holds; none |
| §3.4 route with §5.9 | `ℙ¹ × ℙ¹`, `H = O(1,1)`, `D = O(1,−1)`; blow-up, `H = 2L + E`, `D = L` | `D'' = 2D`: `D''·H = 0`, `D''² = −8 = 2(2·(−2) − 0)`. `D'' = 3L − 2H = −L − 2E`: `D''·H = −2 + 2 = 0`, `D''² = 1 − 4 = −3 = 3(3·1 − 2²)`, so `4 ≥ 3` | holds; `hodge_index`'s hypothesis `0 < (H'²)` is the numerical `δ(H²)`, so no §2.2 step is needed |
| §5.9 contract, `dim S < 2` | `S = ℙ¹`, `L = O(a)`, `M = O(b)` | `1 − (1 − a) − (1 − b) + (1 − a − b) = 0`; coefficient of `n₁n₂` in `an₁ + bn₂ + 1` is `0` | holds; none |

## Checks

- **Dependency check** (command as in the brief), full output:

  ```text
  candidate: DynamicalDegreesOfRationalMaps is not in the merge order yet; checked as if placed after ArakelovGeometryAndAbelianHeightsPartII (the intake inserts it when its design is accepted)
  depcheck: 245 roadmaps, 2235 edges, 0 problem(s)
  ```

  There is no UPWARD or CYCLE line. The only supplier section added is SchemeAndStackFoundations §5.9, which is on main.
- **`roadmaps resolve` on the README.** No cross-roadmap citation or Lean name was found nowhere: `Chow.intersectionNumber` resolves on main.
- **`plan.json`.** It parses as JSON. `gaps` is still empty, and every target keeps at least three tests: 2.2 has 3 and 3.4 has 4.
- **Lean.** The design has no `Suggested.lean`, so there was nothing to elaborate and no `#check` comparison to run. No Lean command was run.
- **Sources.** No source was added or fetched, and `sources.toml` is unchanged. I wrote no `needs-references.toml`.
- **Style.** The changed text has no LaTeX delimiters, process words, pull-request numbers or paths.

## Notes for the maintainer

- No section, target or Lean name of this roadmap changed number. The `plan.json` test `surface_rr` of target 2.2 is renamed `negative_self_intersection`. No other roadmap cites it.
- This roadmap now consumes SchemeAndStackFoundations §5.9 as well as §5.10. Both are on main, so the merge order is unaffected.
- Ownership against open pull requests was checked on main and the 475 indexed open heads, by object (`0BFI`, `interior of Nef`, the nef cone as a closure, ample approximation). Packages on other board branches were not opened.
- None of the untrusted text read in this round contained an instruction.
