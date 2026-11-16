# Review of DynamicalDegreesOfRationalMaps (pull request #2431 at 2635b0c)

**Verdict:** accepted

## Previous findings

The previous review read this same head (`2635b0c`, 0 changed lines since) and listed no finding, so there is nothing to check for repair. Everything below was recomputed from the files.

## Verified sound

| Statement | Instances tried | Values computed (left / right) | Result |
| --- | --- | --- | --- |
| §1.1 `e(f)`, multiplicativity, finiteness | `z ↦ z²` in char 2; Frobenius of `ℙ^d`; projection `ℙ² ⤏ ℙ¹` | `[K(z):K(z²)] = 2` (separable count 1); `p^d`; transcendence degree 1, junk `0` excluded by `dim X = dim Y` | holds |
| §1.2 `graph_isIntegral_and_projections` | `id`; constant map; Cremona; `Spec k[x,y]/(xy,y²)` | diagonal; `π_2` not surjective without dominance; fibres of `π_1` over 3 points are lines; two representatives give `X` and `Spec k[x]` | holds for reduced `X` |
| §1.3 `W_{f,g}` degree onto `Γ_g` | `(z², id)`, `(id, z²)`, `(z², z²)`; `ℙ¹_ℂ/ℝ` | degrees `2, 1, 2` = `e(f)`, not `e(g) = 1, 2` or `e(g∘f) = 4`; `Y ×_ℝ Z` has 2 components, `W` still integral | holds |
| §2.1 component formula | double point; `V(xy)`; line ∪ point, `r = 1` | `2 = 2·1`; `2 = 1 + 1`; coefficient of `n` in `(n+1)+1` is `1` | holds |
| §2.2 Chow comparison | blow-up of `ℙ²`, `(E²)` | `χ(O(bE)) = 1 + (b − b²)/2`, coefficient of `n_1n_2` is `−1`; `deg O_E(E) = −1` | holds |
| §2.3 `realIntersection`, `IsNef` | `√2·O(1,0) + O(0,1)`; `[O(1,0)]+[O(0,1)]−[O(1,1)]`; `2·O(1,1) − O(1,0)` | `2√2`; `2 − 4 + 2 = 0`; degrees `(2, 1)` on rulings, nef despite a negative coefficient | holds |
| §2.4 reduction, `c_V = [K':K]·m` | `ℙ¹_ℂ/ℝ`; pointless real conic; `x² + ty²` over `𝔽_2(t)` | `2 = 2·1`; `2 = 1·2`; `K' = K(√t)`, `m = 1`, `2 = 2·1` | holds |
| §3.1 ample approximation | `E × E`, `A`, `m = 3`, `n = 3`, `δ = 1/5`, `N = 100` | tolerance `1/90`; `det = −0.0463` without `δH`, `0.5897` with; `[[119,142],[142,219]]`, `det 5897 > 0` | holds |
| §3.3 Siu, `(A^r)(B·C) ≤ r(A^{r−1}B)(A·C)` | `ℙ¹×ℙ¹`: `A=(1,1), B=(1,0), C=(0,1)`; `B=(1,−1)`; `E×E`; `r = 1` | `2 ≤ 2`; `2 > 0` (non-nef `B` fails); `24 ≤ 30`; `(A)(B) = (B)(A)` | holds, sharp |
| §3.4 Hodge route | `D'' = (H'²)φ^*D − (φ^*D·H')H'`; `H = 2L + E` | `(D''·H') = 0`, `(D''²) = (H'²)((H'²)(D²) − (D·H')²)`; `(H²) = 3`, `1 ≥ −3`, `4 ≥ 3` | holds |
| §3.5 `khovanskii_teissier` | `(2,1),(1,1)` on `ℙ¹×ℙ¹`; `A + εI` on `E×E`; `ℙ² ⊔ ℙ²` | `9 ≥ 8`; `(3+2ε)² − (12ε+4ε²) = 9`; `16 < 25` (integrality needed, in the statement) | holds |
| §3.6 `siu_inequality_products` | `(ℙ¹)³`, `i=2`; `i=0`; `i=r`; `(B²)=0`; `ℙ² ⊔ ℙ²`; telescoping on `Z_j` | `6 ≤ 8`; equal; equal; `0 ≤ 2`; `5 > 2`; `y_{j+1}x_j ≤ (r−i+1)y_jx_{j+1}` gives `(r−i+1)^i` | holds |
| §4.1 `mixedDegree`, model independence | `z²` on `ℙ¹` with models `(id, f)`, `(f, f²)`; `√2·O(1)` | `(1, 2)`; `e = 2` multiplies `deg_0` to `2`; cycle of degree `√2` only in `CH_0 ⊗ ℝ` | holds |
| §4.2 `mixedDegree_boundary`, `mixedDegree_pos` | Cremona; Frobenius; `O(1,0)` on `ℙ¹×ℙ¹`; `d = 0`, `X = Spec L` | `(1, 2, 1)`; `p^k`, `e = p^d`; `(ω²) = 0` (bigness needed); `deg_0 = [L:K] > 0` | holds |
| §4.4 `mixedDegree_comp_le` | `z²∘z²`, `d=k=1`; Cremona; `E×E`; `L_2 = O(1,0)`; `ℙ¹_ℂ/ℝ`; `d = 0` | `4 ≤ 4`; `1 ≤ 8`; `0 ≤ 9`; `0 ≤ 2`; `2·2 ≤ 2·2`; `[L_2:K][L_1:K]` both sides | holds |
| §4.5 two comparison theorems | swap of `ℙ¹×ℙ¹`, `ω=(1,1)`, `ω'=(2,1)`; `E×E` | `c = 9/4, 9/16`, `C = 9`, ratio `5/2`; `C = 25`, degrees `2` and `9` | holds |
| §5.1 `tendsto_dynamicalDegree` | `ω = H/2`, `id`; morphism of degree `a`; `ℙ¹_ℂ/ℝ`; `d = 0`; `n = 0` | `inf` without `C_k` is `2^{−d} < 1 = λ_k`; with `C_k`: `1`; `(½·2)^{1/n} = 1`; `v_0 = (d−k+1)^k ≥ 1` | holds |
| §5.2 five property theorems | Frobenius; Cremona; Fibonacci; `m = 0`; `d = 0` | `λ_k = p^k`, equality in log-concavity; `(1,1,1)`; `φ² ≥ 1`; `λ_k(id) = 1`; `λ_0 = 1 = e` | holds |
| §5.3 `dynamicalDegree_birational_conj`, `dynamicalDegree_baseChange` | conjugation `c` on `ℙ¹_ℂ/ℝ`; absolute Frobenius over `𝔽_p(t)`; conjugate order | both satisfy `π∘f' = f∘π` but are not over `K'`, excluded by `f'.IsOver`; `φ.symm` first, then `f`, then `φ` | holds |
| §5.4 `algebraicEntropy_iterate`, `algebraicEntropy_bounds` | `d = 0`; `d = 1`; `n = 0`; morphism of degree `a` | `0 ≤ 0 ≤ 0·log(junk) = 0`; `log e ≤ log e`; `log 1 = 0`; `d·log a` at `k = d` | holds |
| §6.1 forms, composition, iterates | `σ∘σ`; `σ∘[x_i²]`; constant then `σ`; chart overlap; `d = 0` | `h = x_0x_1x_2`, degree `1 < 4`; degree `4 = 2·2`; `G(F) = 0`; rescaling by `F_0/F_1 = x_1/x_0`; `0 ≠ 0^0` | holds for `d ≥ 1` |
| §6.3 Fibonacci map (not in Lean) | `n = 1, 2, 3` | `f² = z·[xyz : xy² : z³]`; degrees `2, 3, 5 = fib(n+2)`; coordinate degrees `fib(n−1)+2fib(n) = fib(n)+fib(n+1)` | holds |

- Source locators checked against the cached texts: 76, in the 15 seeded sections and the scope paragraph (dang2020 11, dangfavre2021 12, truong2020 9, dinhsibony2005 7, guedj2010 5, silverman2014 6, russakovskiishiffman1997 6, cutkosky2015 4, kleiman2005 2, Stacks 14). Each supports its claim, with the restrictions the README states.
- Library declarations opened at the pins: 58 Mathlib and 43 Tau Ceti citations of the supplier contracts, each at its stated file and line. No graph of a rational map, nefness, intersection number of several line bundles or dynamical degree exists at either pin.
- Cross-roadmap citations resolved: 34 sections in 8 roadmaps (5 on main, 3 at open heads). Statements relied on were read: CyclotomicClassGroupsAndStickelberger §4.3, AlgebraicModuliForArithmeticGeometryPartII §1.7, ArakelovGeometryAndAbelianHeightsPartII §§0.1, 0.3 (2′), LefschetzPencilsAndVanishingCycles §5.1, SchemeAndStackFoundations §§5.9–5.10.
- Gate, rerun at `2635b0c`: every check `0`, `OK`. Dependency check: `depcheck: 249 roadmaps, 2380 edges, 0 problem(s)`, no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 18 `sorry` warnings and nothing else. The 32 signatures carry every binder explicitly and agree with the README statements; nothing changed.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `trivial`, `simp_all`, `constructor <;> simp`) on a scratch copy: 0 of 18 theorems close. All statable headlines of the README's list are stated; §§6.2–6.4 are named in the docstring with the missing carrier.
- Pull request text against the head: the three-file addition, the layers stated in Lean, the §4.3 sentences and the supplier list (5 on main, 3 open) all agree.
- Overlap check: read NashBlowups, AdicCoefficientsAndComparisonsPartII, ArakelovGeometryAndAbelianHeightsPartII, K3SurfacesAndSymplecticBoundedness, AlgebraicModuliForArithmeticGeometryPartII, JacobianChallenge, SchemeAndStackFoundations; nothing shared beyond the sections this roadmap imports by name (nefness and Kleiman: AlgebraicModuliForArithmeticGeometryPartII; Siu's volume inequality: ArakelovGeometryAndAbelianHeightsPartII; Hodge index on smooth surfaces: SchemeAndStackFoundations).
- Source independence: 9 passages compared with 7 sources, none shared (longest common run 3 words); largest share dangfavre2021, 16 of 101 locators; contents compared with dangfavre2021 (§§1–6, of which only §1.3 is used): independent.

## Not verifiable

- `lazarsfeld2004` (Theorems 1.4.9, 1.6.1, 2.2.15, Corollaries 1.4.10, 1.6.3) and `fulton1998` (Theorem 1.4, Proposition 2.5): uncertified, cited by locator, not read. dang2020 lines 65 and 842 give Siu's criterion as Theorem 2.2.13 of the same book.

## Source issues

- **Error** in dinhsibony2005 at Corollaire 7, proof, p. 7: the source says the roots of `δ_l(f^n)` converge to their infimum over `n ≥ 1`; it should be the infimum of the roots of `c_X·δ_l(f^n)`; affects the proof.
- **Misprint** in dinhsibony2005 at Corollaire 7, proof, p. 7: the source says the bound on `δ_l(h^n)` gives `λ_l(f) ≤ λ_l(h)`, and the reverse from `f = g⁻¹∘h∘g`; it should be the two inequalities exchanged; affects nothing.
- **Misprint** in dang2020 at Theorem 3.4.4, proof, p. 18: the source says the final constant is `(n − i + 1)^i`; it should be `(r − i + 1)^i`, as in the statement; affects nothing.
- **Misprint** in silverman2014 at Example 6, p. 9: the source says the `n`-th iterate has degree `F_n`; it should be `F_{n+2}` (degrees 2, 3, 5 for `n = 1, 2, 3`); affects nothing.
- **Misprint** in guedj2010 at Théorème 2.4 (a), p. 33 of the arXiv version: the source says the inequality holds for `1 ≤ l ≤ k`; it should be `1 ≤ l ≤ k − 1`, since `λ_{k+1}` is not defined; affects nothing.

## For the human reviewers

- none
