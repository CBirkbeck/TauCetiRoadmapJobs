<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12938#issuecomment-6895012850 -->
Review (claude) of fb44ba3

Verdict: needs_changes

1. **F01** (P3) Layer 6 does not state `d ≥ 1`

   **Location:** `packages/DynamicalDegreesOfRationalMaps/design/README.md`, §6.1: "A morphism of degree `0` is constant, not dominant … So `deg(f^n) = (deg f)^n` for every morphism `f` and every `n ≥ 0`, with `0^0 = 1`"; §6.4: "`a ≥ 1`".

   **Claim:** stated for `ℙ^d` and `𝔸^d` with no bound on `d`; Layers 4 and 5 open with "`d ≥ 1`", Layer 6 does not, and `plan.json` target 6.1 has the hypothesis `d ≥ 1` while target 6.4 does not.

   **Witness:** `d = 0`: `ℙ⁰ = Spec K`, the identity has reduced form `(1)` of degree `0` and is dominant; `deg(f^0) = 0 ≠ 0^0 = 1`. In §6.4 the tuple is empty and `a = max ∅`.

   **Repair:** add after the heading `## Layer 6: Projective space and affine space` the line "Throughout, `d ≥ 1`." and add `d ≥ 1` to the hypotheses of plan target 6.4. Add to the §6.1 Checks: "Non-example: for `d = 0` the identity of `ℙ⁰ = Spec K` has the reduced form `(1)`, of degree `0`, and is dominant; the statements on morphisms of degree `0` need `d ≥ 1`."

   **Repair test:** for `d ≥ 1` the identity is `[x_0 : ⋯ : x_d]`, forms of degree `1` without common factor, so `deg(f^0) = 1 = 0^0` for a constant `f`; a degree-`0` tuple is a constant point, not dominant. Both sentences hold.

2. **F02** (P3) Scope does not say how §3.5 differs from the log-concavity bound an earlier roadmap states

   **Location:** `design/README.md`, Scope and ownership, fourth owned bullet: "the Khovanskii–Teissier inequalities and Siu's inequality for products (§§3.3–3.6)".

   **Claim:** the roadmap owns Khovanskii–Teissier; no other roadmap is named for it.

   **Witness:** AlgebraicModuliForArithmeticGeometry §9.10 (open head, `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:10319`), `nefMixedIntersectionBound`: proves `(H^p L^(n−p))² ≥ (H^(p−1) L^(n−p+1))(H^(p+1) L^(n−p−1))` for ample `L`, nef `H`, on smooth projective geometrically integral varieties in characteristic zero.

   **Repair:** append to that bullet: "AlgebraicModuliForArithmeticGeometry §9.10 states the log-concavity of `(H^p · L^{n−p})` for an ample and a nef line bundle on a smooth projective geometrically integral variety over a field of characteristic zero; §3.5 is the statement for integral projective varieties over every field, for all nef real classes, with the mixed factors `C_j`." No supplier edge is added: §3.5 does not consume §9.10, and that roadmap is earlier in the merge order, so the general statement stays here.

   **Repair test:** the instance that separates the two: `E × E` with the irrational boundary class `A` (§3.5 Checks, `9 ≥ 0·2`) and the quadric cone (§3.4 Checks) are outside §9.10's hypotheses (real class; singular) and inside §3.5's.

3. **F03** (P3) §3.3 plans again an imported fact that nothing here consumes

   **Location:** `design/README.md`, §3.3: "Prove also that a nef line bundle `A` with `(A^r) > 0` is big."; route: "Bigness is ArakelovGeometryAndAbelianHeightsPartII §0.3 (1′), read through §2.2."

   **Claim:** a target of this roadmap.

   **Witness:** the supplier states it: ArakelovGeometryAndAbelianHeightsPartII §0.3 (1′), "If L is nef then vol(L) = L^d" (README:208 at its open head); AlgebraicModuliForArithmeticGeometryPartII §1.6 (README:371), "for integral proper V and nef L, bigness is equivalent to (L^n·V)>0". The §3.3 route uses (2′) only.

   **Repair:** replace the sentence by "A nef line bundle `A` with `(A^r) > 0` is big by ArakelovGeometryAndAbelianHeightsPartII §0.3 (1′), read through §2.2; this is an import, not a target." Delete "Bigness is … read through §2.2." from the route, and "a nef A with (A^r) > 0 is big" from the statement of plan target 3.3.

   **Repair test:** the route still closes: for `p(A^r) > rq(A^{r−1}·B)`, (2′) alone gives `vol(pA − qB) ≥ p^{r−1}(p(A^r) − rq(A^{r−1}·B)) > 0`; on `ℙ¹ × ℙ¹` with `A = O(1,1)`, `B = O(1,0)`, `p/q > 1`: `2p² − 2pq > 0`.

4. **F04** (P3) Scope excludes "correspondences" while §1.3 defines one

   **Location:** `design/README.md`, Scope: "Correspondences and resolution of singularities. No statement here uses either."; §1.3: "Define the *correspondence of the composite* `W_{f,g} ⊆ X ×_K Y ×_K Z`".

   **Claim:** no statement uses a correspondence.

   **Witness:** §1.3 and the route of §4.4 ("Let `W = W_{f_1,f_2}` (§1.3)") use the object the roadmap itself calls a correspondence.

   **Repair:** replace the Scope bullet by "The dynamics of correspondences, that is of multivalued maps (truong2020 Theorem 1.1), and resolution of singularities. The subvariety `W_{f,g}` of §1.3 is a common model of the three graphs `Γ_f`, `Γ_g`, `Γ_{g∘f}` of rational maps; no statement here iterates or composes a correspondence, and none uses resolution (§3.4 uses alterations)."

   **Repair test:** with the new wording, §1.3 (`W_{σ,σ}` for Cremona, projection degrees `1, 1, e(σ) = 1`) and §3.4 (de Jong, SchemeAndStackFoundations §4.19) contradict no sentence of the Scope.

Four findings, all P3 (no P1, no P2), each with a written repair: a fix round applies them, so the verdict asks for changes. The one finding of the previous review is repaired. Lean elaboration: not available (this lane does not elaborate); the design has no `Suggested.lean`, so nothing was elaborated or probed. No declared supplier gaps (`plan.json` `gaps` is empty).

## Previous finding (round 6), checked first

| Finding | Repaired passage | Status |
| --- | --- | --- |
| F01 (P3): manifest page of the plane Cremona example | `packages/DynamicalDegreesOfRationalMaps/sources.toml`, entry `russakovskiishiffman1997`: `locator = "Section 4: Lemma 4.4, Lemma 4.6, example p. 14"` | **Repaired.** `russakovskiishiffman1997` line 538 is the marker of page 14 and line 584 that of page 15; the example is at lines 544–552 (`δ_1 = 2`, `δ_2 = 1`, three base points). The diff of the repair changes this one string only. |

Pattern search: no other `p. N` locator in `sources.toml`, `design/README.md` or `design/plan.json` (searched mechanically). The repair touched no mathematical text, so the adversarial pass below is on the design as a whole, with the sampled targets recomputed.

## Verified sound

### Principles, shape, house style

- General library, no shortcut: arbitrary field, no normality, no geometric integrality except where the base-changed map must be a map of varieties (§1.4 Check: `ℙ¹_ℂ` over `ℝ`). Inseparable degree counted (`e(Frobenius) = p^d`). No algorithm, no `set_option`, no sorry'd data, no Lean file at this stage.
- Shape: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, six layers each ending with Examples and Dependencies, Downstream consumers, Worked examples, References. 27 sections, each with a *Needs:* line and a locator or supplier citation. `plan.json`: 27 targets, 115 tests, 0 unknown and 0 forward prerequisite; definitions and constructions (§§1.1, 1.2, 1.3, 2.3, 4.1, 5.1, 5.4) carry API/tests 6/6, 6/5, 3/4, 4/4, 5/4, 2/3, 3/4, so each has at least three discriminating Checks.
- Organisation: layers named by mathematics; the order is forced: Layer 3 *Needs* §§2.1–2.4, Layer 4 needs Layers 1–3 (§4.4 needs §§1.3, 3.6), Layer 5 needs §§4.2–4.5, Layer 6 needs §§3.2, 4, 5. Layers 1 and 2 are independent and say so.
- Process residue: searched the README for pull-request numbers, round labels, dates, machine paths, LaTeX delimiters: none. Backticked names are all Mathlib or Tau Ceti declarations (resolved below); the roadmap attributes no backticked Lean name to itself.
- No maintainer notes were given. No suspicious instruction in any text read.

### Adversarial table (values computed this round)

Notation on `E × E` (no CM): `I = F_1 + F_2`, `A = (1+√2)F_1 + (2+√2)F_2 − √2Δ`, matrices `diag(1,1)` and `[[1,√2],[√2,2]]`, intersection `tr(B·adj B')`.

| Statement | Instances | Values on each side | Result; change |
| --- | --- | --- | --- |
| §1.1 `e(f)`, multiplicativity, birationality | `z²` (char 0 and 2); projection `ℙ² ⤏ ℙ¹`; `z² then z+1` at `z = 1` | `[K(z):K(z²)] = 2` in both; trdeg 1 so finrank junk `0`; `comp` value `2`, reverse order `4`; two squarings `4 = 2·2` | holds; none |
| §1.2 graph (sample) | identity; `z²`; Cremona; projection from a point; constant map | projection degrees `(1,1)`; `(1,2)`; three line fibres over base points, both degree 1; `π_2` fibres `ℙ¹` (not an alteration); image of `π_2` a point | holds; none |
| §1.3 composite (sample) | `z², z²`; Cremona twice; `ℙ¹_ℂ` over `ℝ` | `W → Γ_g` degree `2 = e(f)`, not `4`; degree `1`; `ℂ ⊗_ℝ ℂ = ℂ²` so `Y × Z` has 2 components, `W` = triple diagonal, integral, degrees `1,1,1` | holds; R04 wording |
| §1.4 base change (sample) | `id` of `ℙ¹_ℂ/ℝ` to `ℂ`; `𝔾_m → 𝔸¹` pulled back to `t = 0`; rank argument for `z²` and for the projection | image has 2 diagonal components = pullback of diagonal; `K[t,t⁻¹]/(t) = 0`, image ideal `(1)` versus pulled-back ideal `(0)`; basis `{1,z}` rank `2 = 2`; `0 = 0` by dimension, not by rank | holds; none |
| §2.1 component formula (sample) | double point; line ⊔ point; `V(xy)`; `V(x²)` | `χ = 2 = 2·1`; `(O(1)·Z) = 1` (point ignored); `2 = 1+1`; `χ(O_Z(n)) = (n+1)(n+2)/2 − n(n−1)/2 = 2n+1`, so `2 = 2·1` | holds; none |
| §2.2 Chow comparison (sample) | `ℙ²`; `ℙ¹×ℙ¹`; coefficient convention | `1 = 1`; `χ(O(n_1,n_2)) = (n_1+1)(n_2+1)` gives `h_1h_2 = 1`, `h_1² = 0`; `n_1n_2`-coefficient of `½(n_1D_1+n_2D_2)²` is `D_1·D_2`, not `2D_1·D_2` | holds; none |
| §2.3 real classes | `√2·O(1,0)+O(0,1)`; `2·O(1,1) − O(1,0)` | square `2√2`; equals `O(1,2)`, ruling degrees `2, 1`, nef | holds; none |
| §2.4 reduction | `ℙ¹_ℂ/ℝ`; `x² + ty²` over `𝔽_2(t)` | `c_V = 2`, `2 = 2·1`; `χ_K(O_V(n)) = 2n+1`, normalization `ℙ¹_{K(√t)}`, `2 = [K':K]·1` | holds; none |
| §3.1 ample approximation | `m = n = 3`, `δ = 1/5`, `(2.41, 3.41, −1.42)` | errors `0.0042, 0.0042, 0.0058 < 1/90`; raw `det = 0.99·1.99 − 1.42² = −0.0463`; with `δH`: `1.19·2.19 − 2.0164 = 0.5897`; `N = 100`: `261F_1+361F_2−142Δ`, `det 5897`, `Nδ/2 = 10 ≥ 1`; `(β·C) ≥ 0 − 3·(δ/18)·3(H·C) + (δ/2)(H·C) = 0` | route sound; none |
| §3.1 `A` and its decomposition | `A`; `A + I` | eigenvalues `0, 3`; degrees `2, 1, 3+2√2`; `(2−√2)[[1,1],[1,1]] + (√2−1)[[1,2],[2,4]] + diag(1,0) + (5−3√2)diag(0,1) = [[2,√2],[√2,3]]`, `5−3√2 ≈ 0.757 > 0` | holds; none |
| §3.2 Kleiman (sample) | `O(1,0)²`; `O(1,−1)²`; `V(x²)`; `A`, `F_1 − F_2` | `0`; `−2` (not nef); `2`; `(A²) = 0`, `(A·I) = 3`; `−2` (not nef, degree `−1` on `F_1`) | holds; none |
| §3.3 Siu (sample) | `ℙ¹×ℙ¹`: `A=(1,1), B=(1,0), C=(0,1)`; `B=(1,−1)`; `r = 1`; `E×E`: `A+I, A, I`; limit `(A^{r−1}·B) = 0` | `2 ≤ 2`; `2 ≤ 0` false (nefness needed); `(A)(B) = (B)(A)`; `8·3 = 24 ≤ 2·3·5 = 30`; `p/q → 0⁺` gives `(B·C) ≤ 0 =` right side | holds; R03 wording |
| §3.4 Hodge | blow-up, `H = 2L+E`, `D = E`, `D = L`; two points `H = E_1, D = E_2`; `D''` identity | `H² = 3`, `H·E = −1`; `1 ≥ −3`; `4 ≥ 3`; `0 ≥ 1` false with `H² = −1`; `(D''²) = (H'²)((H'²)(D²) − (D·H')²)` expanded term by term | holds; none |
| §3.5 Khovanskii–Teissier (headline) | `(2,1),(1,1)`; `A + εI, I`; `ℙ² ⊔ ℙ²`; consequence indices | `9 ≥ 4·2 = 8`; `(3+2ε)² − 2(6ε+2ε²) = 9`; `16 < 25`; with `C = A^{k−1}B^{d−k−1}`: `s_k² ≥ s_{k+1}s_{k−1}` | holds; R02 scope clause |
| §3.6 product Siu (headline) | `(ℙ¹)³`, `i = 2`; telescoping indices; `ℙ²⊔ℙ²` | `6·1 ≤ 4·1·2 = 8`; on `Z_j` (dim `r−i+1`): `y_{j+1}x_j ≤ (r−i+1)y_jx_{j+1}`, product `x_1 ≤ (r−i+1)^i (y_1/y_{i+1}) x_{i+1}`; `5 ≤ 2` false (reducible) | holds; none |
| §4.1 mixed degrees (sample) | `z²` with models `(id, f)` and `(f, f∘f)`; `√2·O(1)`; Cremona | `(1,2)`; `e = 2`: `(f^*H) = 2 = 2·1`; cycle degree `√2 ∉ ℤ`; `deg_1 = 2` | holds; none |
| §4.2 values, positivity (sample) | Cremona; Frobenius; `ω = O(1,0)`; `(1.5, 0.5)` vs `(1,1)`; `A ≤ A+I` | `(1,2,1)`; `p^k`, `e = p^d`; `0` (bigness needed); `2·1.5·0.5 = 1.5 < 2` with difference of degree `−0.5`; `0 ≤ 3 ≤ 8` | holds; none |
| §4.3 invariance (sample) | cuspidal cubic; `ℙ¹_ℂ/ℝ` | `ν^*O(1) = O(3)`, `3 = 3`; `2 = 1 + 1` on the two diagonals | holds; none |
| §4.4 sub-multiplicativity (sample, headline) | route identities; `z², z²`; Cremona²; Frobenius then `z²`; `E×E` | `(B^d) = e(f_1)(L_2^d)`, `(A^kB^{d−k}) = e(f_1)deg_k(f_2)`, quotient gives the stated constant; `4 ≤ 4`; `1 ≤ 8`; `2p = p·2`; `0 ≤ (2/2)·3·3 = 9`; `k = 0`: `(L_1^d) = (L_1^d)(L_2^d)/(L_2^d)`; `k = d`: `e(f_2f_1) = e(f_1)e(f_2)` | holds; `k = 0` handled outside §3.6 (`i ≥ 1`), as the route says |
| §4.5 comparison (headline) | swap, `(1,1)` vs `(2,1)`; `I` vs `A+I` | `2` vs `(2,1)·(1,2) = 5`; `c = 9/4`, `9/16`, `C = 9`; `2` vs `tr([[2,√2],[√2,3]]·[[2,−√2],[−√2,3]]) = 9`; `c = 25/4`, `C = 25` | holds; none |
| §5.1 existence (headline) | morphism degree `a`; Cremona; `u_0/0` | `inf_n ((d−k+1)^k a^{nk})^{1/n} = a^k`, value at `n=1` larger for `1 ≤ k ≤ d−1`; degrees `2,1,2,1,…` so `λ_1 = 1`; lower bound `min(0, log(C_k/C))` covers `0` | holds; none |
| §5.2 properties (sample) | Fibonacci; Frobenius; `λ_k ≤ λ_1^k` | `(1, φ, 1)`, `φ² = 2.618 ≥ 1`; `p^k`, equality; concave `log λ_k` with `log λ_0 = 0` | holds; none |
| §5.3 invariance (sample) | cubic; `ℙ¹_ℂ/ℝ`; field extension with an ample `H` | `3^{1/n} → 1`; `2^{1/n} → 1`; `deg_{k,H_{K'}}(f_{K'}^n) = deg_{k,H}(f^n)`, so no base change of real nef classes is needed | holds; none |
| §5.4 entropy (headline) | degree-`a` morphism; Fibonacci | `d·log a`; `log φ = 0.4812`, maximum at `k = 1` only; `log e ≤ h ≤ d log λ_1`: `0 ≤ 0.48 ≤ 0.96` | holds; none |
| §6.1 forms (sample) | `d = 0`; Cremona²; `(x_0², x_0x_1, x_0x_2)`; constant into base point; `σ ∘ [x_i²]` | identity of `ℙ⁰` has degree `0` and is dominant; `h = x_0x_1x_2`, degree `1 < 4`; reduces to degree `1`; `G(F) = (0,0,0)`; `(x_1²x_2², …)` coprime, `4 = 2·2` | `d = 0` fails: R01 |
| §6.2 degrees on `ℙ^d` (sample) | section of `aA − B`; `k = 0`; Cremona; morphism | `s = F_j(x)/y_j` on `y_j ≠ 0`, zero scheme inside `π_1^{−1}V(F)`; `(A^{d−1}·E) = 0` as `dim V(F) ≤ d−2`, so `deg_1 = a`; `deg_2 = 1 ≤ 2·2`, `4 − 3 = 1`; `E = ∅`, `a^k` | holds; none |
| §6.3 examples (headline) | Fibonacci `n = 0,1,2,3`; inverse | degrees `1,2,3,5 = fib(n+2)`; `n = 2`: `[xyz : xy² : z³]`; `n = 0` formula gives `(1, y, z)`, not homogeneous; inverse `(u,v) ↦ (v/u, u)`, `e = 1` | holds; none |
| §6.4 affine maps (headline) | `(x², y)`; Hénon; `(y, z, x+yz)`; `(x, xy)`; `d = 0` | extension `[z² : x² : yz]`, base point `[0:0:1]`, `λ = (1,2,2)`; `2^n`, `λ_2 = 1`; degrees `2, 3, 5`; fibre over `(0,1)` empty; `max ∅` | `d = 0`: R01 |

### Sources: the seeded sample and the further locators opened

Thirteen cached texts were read at the cited lines; every locator below matches (theorem number, line, hypotheses), on the arXiv or Stacks versions the manifest records.

| Target | Locators opened | Outcome |
| --- | --- | --- |
| 1.2 | `dinhsibony2005` lines 45–51; `dang2020` lines 21–25; `guedj2010` lines 1099–1110; `stacks-morphisms` line 488 (Lemma 6.7, 056B) | graph and projections in each source's setting; reduced image = reduced structure on the closure, as used |
| 1.3 | `dang2020` lines 1285–1334 | the graph of `π_3^{−1} ∘ f_1 ∘ π_1` and diagram (5.1); the roadmap's `W_{f,g}` is its own direct-image construction |
| 1.4 | `stacks-morphisms` line 2198 (Lemma 26.16, 081I: flat `f`, quasi-compact `g`); `truong2020` line 1529 (§6.3) | hypotheses match those the README checks (quasi-compact `γ_f`, flat `Spec K' → Spec K`); the reducibility warning is there |
| 2.1 | `stacks-varieties` lines 4716, 4784 (Lemmas 45.2, 45.6); `kleiman2005` line 3624 (Lemma B.12) | length-weighted sum over top-dimensional components, as stated |
| 2.2 | `stacks-chow` line 3995 (Lemma 41.4, 0BFI) | proper `X`, closed `Z` of dimension `d`, `[Z]_d`: as stated |
| 3.2 | `cutkosky2015` lines 274–287 (§2.2); AlgebraicModuliForArithmeticGeometryPartII §1.7 (ii) at its head | nef and ample cones over an arbitrary field; `lazarsfeld2004` not read (settled uncertified) |
| 3.3 | `dang2020` lines 840–869 (Proposition 3.4.1, Remark 3.4.3); `dangfavre2021` line 434 | Siu with constant `r`; "for `k = 1` we may take `C_d = d`" is at line 434 |
| 4.1 | `dang2020` 21–25; `dangfavre2021` 436–443, 452–453; `dinhsibony2005` 61–63; `russakovskiishiffman1997` 499–505 | definitions agree with the index convention (`k` copies from the target) |
| 4.2 | `dangfavre2021` line 454 (footnote 5); `russakovskiishiffman1997` lines 506–511 | integrality for line bundles; `δ_n` topological degree, `δ_ℓ = (deg P)^ℓ` for holomorphic `P` |
| 4.3 | `dang2020` lines 18–20; `truong2020` lines 1529–1533 | as cited |
| 4.4 | `dang2020` lines 27–30 and 1271–1284 (Theorem 5.2.1, `C = (e−i+1)^i/(…)`); `dangfavre2021` 448–451; `truong2020` 143–158; `dinhsibony2005` 245–247; `silverman2014` line 387 | the constant `(d−k+1)^k/(L_2^d)` is the absolute case of line 1284; sources assume normal or complex, the roadmap's route does not rely on them |
| 5.2 | `dang2020` 42–46; `dangfavre2021` 464–467; `guedj2010` 1136–1140, 1180; `dinhsibony2005` 69–70 | `[1, ∞)`, independence, log-concavity; README's range `1 ≤ k ≤ d−1` corrects the source's |
| 5.3 | `truong2020` 159–164, 1529; `dang2020` 35–46; `dinhsibony2005` 256–263 | birational invariance; as cited |
| 6.1 | `stacks-constructions` line 1267 (Lemma 13.1, 01NE); `silverman2014` 350–357; `guedj2010` 1145–1147; `russakovskiishiffman1997` line 510 | functor of points of `ℙ^n`; coprime forms |
| 6.2 | `russakovskiishiffman1997` 516–541 ("equality if and only if `codim I_P > ℓ`" at line 518), 506–514, 582–583; `guedj2010` 1141–1147; `silverman2014` 350–357, 387 | as cited |

Also opened: `stacks-varieties` line 691 (Lemma 8.6, 054Q), `stacks-morphisms` lines 3862 (Lemma 38.7 (2): ample pulled back along a quasi-affine morphism) and 6046 (Definition 52.8), `kleiman2005` line 3803 (Theorem B.27), `cutkosky2015` lines 983–1033 (Theorem 6.1, Remark 6.2 with `n = 2` giving `16 < 25`, Corollary 6.3), `silverman2014` lines 358–413, `dangfavre2021` lines 148–180 and 427–433, `dinhsibony2005` lines 33–37, `truong2020` lines 166–180 and 1542–1544, `guedj2010` lines 1272–1282, `dang2020` lines 122, 141, 176, 871–883. All fifteen manifest entries correspond to works the README cites, and every cited work has an entry. No source was fetched; no manifest entry was changed by this review.

### Suppliers resolved at their current heads

| Supplier | Where read | Sections found, with the statement consumed |
| --- | --- | --- |
| SchemeAndStackFoundations | main, `TauCetiRoadmap/SchemeAndStackFoundations/README.md` | §0.3:792, §0.7:1049, §0.11:1370, §0.20:1930, §0.30:2681, §2.6:4357, §3.3:5863, §4.11:6824, §4.12:6921, §4.13:6951, §4.16:7371, §4.19:7737, §5.1:7957, §5.2:8057, §5.3:8102, §5.10:8625 (`hodge_index` on smooth projective integral surfaces) |
| StableReduction | main | Layer 2 present |
| CyclotomicClassGroupsAndStickelberger | open head | §4.3 at README:754; numerical intersection defined at :797, with polynomiality, symmetry, additivity, projection formula with function-field degree and zero on dimension drop, Cartier restriction, ample positivity, field extension at :803 |
| AlgebraicModuliForArithmeticGeometryPartII | open head | §0.1:95 (length-weighted law, field-extension invariance), §1.1:246, §1.2:277 (`ρ(E×E) ∈ {3,4,6}`), §1.4:310 (the `E × E` matrix Check with `A = [[1,√2],[√2,2]]`), §1.5:335 (base change of Noetherian schemes, pullback), §1.7:387 ((ii) Kleiman and nef + ample; API: ample positive on curves, `L^m ⊗ E` ample) |
| AlgebraicModuliForArithmeticGeometry | open head | §1.4:706 (`amplePowersAndFixedTwists`), §5.4:8674 (schematic image, "commutes with flat base change", scheme chart ideal `ker(O_U → (f_U)_*O)`) |
| ArakelovGeometryAndAbelianHeightsPartII | open head | §0.1:151, §0.3:208 ((1′), (2′) for `d ≥ 1`, any field) |
| LefschetzPencilsAndVanishingCycles | open head | §5.1:2801, Bertini irreducibility with `dim g(X) > s` for the generic linear subspace of codimension `s` |
| ArithmeticDynamics | open head | §0.18:1332, §0.26:1564 |

Every supplier is on main or earlier in the merge order (lines 34, 35, 69, 262, 339, 341 of `merge-order/ORDER.txt`); none is on the never-cite list. Dependency check, full output:

```text
candidate: DynamicalDegreesOfRationalMaps is not in the merge order yet; checked as if placed after ArakelovGeometryAndAbelianHeightsPartII (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2235 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

### Pinned declarations opened (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`)

All 47 Mathlib locators of the contracts were opened and each line carries the named declaration: `Mathlib/AlgebraicGeometry/Birational/RationalMap.lean` 48, 377, 396, 440, 501, 562, 575, 586, 608; `Dominant.lean` 74; `Composition.lean` 155 (`comp (f : X ⤏ Y) [f.IsDominant] (g : Y ⤏ Z)`, `f` first), 170, 173, 182, 193, 217; `Birational.lean` 39, 55, 88, 166, 182 (`Birational X Y := Nonempty (PartialIso X Y)`: a relation on schemes, with no base and no map); `IdealSheaf/Subscheme.lean` 658, 661, 706, 716; `IdealSheaf/Basic.lean` 691; `Morphisms/SchemeTheoreticallyDominant.lean` 37, 112; `IdealSheaf/Functorial.lean` 39, 79, 139, 163; `FunctionField.lean` 37; `Morphisms/Proper.lean` 97; `ProjectiveSpectrum/Scheme.lean` 855; `RingTheory/MvPolynomial/Homogeneous.lean` 87, 613; `RingTheory/Polynomial/UniqueFactorization.lean` 128; `Analysis/Subadditive.lean` 33, 35, 106, 109, 155 (`tendsto_lim` needs `BddBelow (range fun n => u n / n)`, all `n`); `LinearAlgebra/Dimension/Free.lean` 76; `Data/Nat/Fib/Basic.lean` 56; `NumberTheory/Real/GoldenRatio.lean` 36.

All 24 Tau Ceti locators likewise, with namespaces checked: `LineBundle/Basic.lean` 119, `Pullback.lean` 100, `TensorProduct.lean` 65, `Dual.lean` 44, `Class.lean` 50 and 142, `Ample.lean` 71 and 96, `Cohomology/Basic.lean` 61, `Cohomology/EulerCharacteristic.lean` 105, `LineBundle/Degree.lean` 130, `IntersectionNumber/Basic.lean` 111, `IntersectionNumber/FieldTower.lean` 66, `EffectiveCartierDivisor/Basic.lean` 78, `SchemeTheoreticImage/Basic.lean` 65 and 78, `Morphisms/Dominant.lean` 151, 206, 212, 221, `Scheme/BaseAlgebra.lean` 409, 421, 427, `Scheme/FunctionField.lean` 101, `EllipticCurve/Isogeny/FunctionField.lean` 167.

Duplication by object at the pins: searched Tau Ceti for a graph of a rational map, a degree of a rational map, nefness, bigness and dynamical degrees: none. `TauCeti/AlgebraicGeometry/Birational/RationalMap.lean` (`Scheme.RationalMap.toHom`, line 93; `domain_eq_top_of_valuationRing`, line 165) treats rational maps defined everywhere; it restates no target here. Remark for the package stage, no change needed now: `Scheme.RationalMap.toHom` is the natural carrier for the "Morphisms" item of §1.2.

### Ownership and overlap

Searched the open heads and main by object (`dynamical degree`, `algebraic entropy`, `graph of a rational map`, `rational self-map`, `Khovanskii`, `Teissier`, `log-concav`, `Siu's inequality`, `nef real class`, `topological degree`, `Hodge inequality`): the only hits on this roadmap's own objects are its suppliers and the bound of R02. `scratch/overlaps.md` lists no shared pull request, no dropped id, no revision-only id and no second copy; I confirmed main has no `DynamicalDegreesOfRationalMaps` folder and the board index lists no such package elsewhere. The ample approximation of §3.1 is not AlgebraicModuliForArithmeticGeometryPartII §1.7 (v): that item characterises ample real classes in `N¹`, while §3.1 produces rational approximants `N^{−1}A_j` in `Pic(X) ⊗ ℝ` with a stated tolerance, which the homogeneity argument needs.

Overlap check: read AlgebraicModuliForArithmeticGeometryPartII, ArakelovGeometryAndAbelianHeightsPartII, AdicCoefficientsAndComparisonsPartII, JacobianChallenge, AbundanceStatement, SchemeAndStackFoundations; nefness, `N¹` and Kleiman: AlgebraicModuliForArithmeticGeometryPartII (imported here); volume and Siu's volume inequality: ArakelovGeometryAndAbelianHeightsPartII (imported here); alterations, Chow operations, smooth-surface Hodge index: SchemeAndStackFoundations (imported here); log-concavity of mixed intersections: smooth characteristic-zero case AlgebraicModuliForArithmeticGeometry §9.10, general case this roadmap (R02); nothing shared with the other three.

### Headline theorems and `Suggested.lean`

Headlines (README, "The headline statements"): graph properties (§1.2); Khovanskii–Teissier and product Siu (§§3.5–3.6); positivity, boundary values and field invariance of degrees (§§4.2–4.3); sub-multiplicativity and comparison (§§4.4–4.5); existence and properties of `λ_k` and `h_alg` (§§5.1–5.4); projective and affine formulas with the Cremona and Fibonacci computations (§§6.2–6.4). Each is a target with hypotheses and is covered by a row above. There is no `Suggested.lean` at the design stage: zero declarations, so the padding probe, the `#check` comparison and the import check have nothing to run on. The package must state the statable headlines against `Scheme.RationalMap` and `Scheme.Hom.image`, which exist at the pins.

### Copyright, wording, arrangement, reuse

- Wording: at each locator above, and for the routes of §§3.1, 3.3, 3.6, 4.4, 5.1 and 6.2, the definitions of §§1.2 and 4.1, and the Conventions on composition and degrees, the roadmap's text was set beside the source's. No sentence or proof plan follows a source clause by clause: §3.3 is stated in intersection form where `dang2020` line 844 has a class inequality; the §4.4 route uses the triple-product image `W` where `dang2020` lines 1285–1340 use normalized graphs and a general fibre; §5.1 goes through Mathlib's Fekete lemma where `silverman2014` lines 386–413 argue directly. Shared runs are formulas only (the Fibonacci iterate, the Cremona forms).
- Arrangement: `dang2020` and `dangfavre2021` share the largest count. `dang2020` sections: 1 Chow group, 2 numerical cycles, 3 positivity, 4 relative classes, 5 dynamics, 6 semi-conjugation. Pairs with common matter: `Layer 3 ↔ §3` (only §3.4 of five subsections), `Layer 4 ↔ §5.1–5.2`. Layers 1, 2, 5, 6 have no counterpart and §§2, 4, 6 of the source none here: no one-to-one run. `dangfavre2021` (1 positive cycles, 2–3 b-classes, 4–5 spectral theory, 6 polynomial maps) maps onto nothing beyond its §1.3.
- Reuse: no table, figure or list taken over. The worked-examples table is the roadmap's. The `ℙ² ⊔ ℙ²` counterexample is the instance `n = 2` of `cutkosky2015` lines 1014–1020, recomputed and cited.

Source independence: 26 passages compared with 13 sources, none shared; largest share dang2020 and dangfavre2021, 15 each of 89 locators; contents compared with dang2020 and dangfavre2021: independent.

## Not verifiable

- Lean elaboration: not available (this lane does not elaborate; say so in the report). No Lean command was run.
- `lazarsfeld2004` (Theorems 1.4.9, 1.6.1, 2.2.15, Corollaries 1.4.10, 1.6.3) and `fulton1998` (Theorem 1.4, Proposition 2.5): settled uncertified, cited by locator, not read. `dang2020` line 842 attributes Siu's inequality to Lazarsfeld's Theorem 2.2.13 where the README cites 2.2.15; which number is right could not be checked against the book.
- Ownership against open pull requests was checked on the heads the tools index (main and 475 open roadmap pull requests) and on the board index; packages on other board branches were not opened beyond that index.

## Source issues

- **Error** in dang2020 at Proposition 3.4.1, printed page 17, and Theorem 3.4.4, printed page 18: the source says the ratio form of Siu's bound holds on every closed subscheme; it should require irreducible support (two planes give `5 ≤ 2`); affects a stated result.
- **Misprint** in dang2020 at Proposition 3.4.1, proof, printed page 17: the source says the section count of the difference strictly exceeds the difference of section counts; it should be a weak inequality; affects the proof.
- **Misprint** in dang2020 at Theorem 3.4.4, proof, printed page 18: the source says the final constant is a power of `n − i + 1`; it should be `r − i + 1`, as in the statement; affects nothing.
- **Misprint** in dinhsibony2005 at Corollaire 7, proof, printed page 7: the source says the roots of the degrees converge to their own infimum; it should be the infimum of the roots after multiplying by the constant; affects the proof.
- **Misprint** in dinhsibony2005 at Corollaire 7, proof, printed page 7: the source says the displayed bound gives `λ(f) ≤ λ(h)`; it should give `λ(h) ≤ λ(f)` first, the other by symmetry; affects the proof.
- **Error** in silverman2014 at Example 5, printed page 9: the source says the indeterminacy loci of the map and of its inverse are disjoint; it should note both contain `[0 : 1 : 0]`; affects nothing.
- **Misprint** in silverman2014 at Example 6, printed page 9: the source says the `n`-th iterate has degree `F_n`; it should be `F_{n+2}` (degrees `2, 3, 5`); affects nothing.
- **Misprint** in guedj2010 at Théorème 2.4 (a), printed page 31: the source says the inequality holds for `1 ≤ l ≤ k`; it should stop at `l = k − 1`, since `λ_{k+1}` is not defined; affects a stated result.
- **Misprint** in cutkosky2015 at §2.2, printed page 6: the source says the Picard group is isomorphic to the group of Cartier divisors; it should be Cartier divisors modulo linear equivalence; affects nothing.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "fb44ba3ccca2dd4fcae27d5033f0044c507cb7bc", "job": "REV-DESIGN-DynamicalDegreesOfRationalMaps~7", "model": "fable", "worker": "chris-x29"} -->
