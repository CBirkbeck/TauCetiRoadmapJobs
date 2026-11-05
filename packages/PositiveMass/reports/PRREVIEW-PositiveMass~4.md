# Review of PositiveMass (pull request #956 at 3d0220a)

**Verdict:** accepted

🤖 Independent AI re-review of the repaired head, incremental over the 53 lines changed since 4753c24 (`README.md` only; `Suggested.lean` is byte-identical to the previous head). One finding, P3, not blocking. The push gate, the dependency check and an independent Lean elaboration pass. No pull-request file was changed.

## R01 (P3) — 0.1's enumeration of the places that state integrability omits two that do

**Location:** `TauCetiRoadmap/PositiveMass/README.md:221`–`222`, "here it is a separate hypothesis, stated wherever a mass is asserted (0.2, 0.4, 2.2, 4.2, 5.2, 6.2, 7.1, 8.1–8.3)".

**Claim:** the parenthesis lists every target that asserts a mass under the integrability hypothesis.

**Witness:** `README.md:565`–`566` (2.1, "of order t>(n−2)/2 with integrable scalar curvature", asserting `|m(E,g_j) − m(E,g)| → 0`) and `README.md:779`–`780` (3.3, "AE of order n−2 with integrable scalar curvature and mass 0") both state the clause and assert a mass, and neither is listed. Nothing is false: every mass assertion in the file carries the clause or inherits it (3.2 from 2.1's scalar-flat ends, 7.2 from 7.1 at `:1017`, 8.4 from scalar-flatness).

**Repair:** write "(0.2, 0.4, 2.1–2.2, 3.3, 4.2, 5.2, 6.2, 7.1, 8.1–8.3)". Retest: the enumeration then matches the grep of "integrable" against every target that names a mass.

## Previous findings

- R01 — repaired: `README.md:838`–`839`, "For asymptotically constant solutions on an end of order t>(n−2)/2 with integrable scalar curvature, `lim G_r(u) = …`"; `README.md:980`–`981`, "On a complete connected finite-ended AE spin manifold without boundary, with nonempty ends, Scal≥0 and integrable scalar curvature"; `README.md:222` lists 0.4, 2.2, 4.2 and 6.2. The repair's Checks (`:857`–`864`, `:998`–`1002`) are recomputed below and are correct; the only residue is the enumeration of R01 above.

## Verified sound

**Scope and mechanical checks.** Head `3d0220ab3bd5e3586d5b285b1deca1440205b6c6`; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`; `git diff --stat origin/main...HEAD` outside the folder is empty; the diff since `4753c24` touches `README.md` only (41 insertions, 12 deletions). The gate run on this head returned every check zero and `OK` (set_option, blob, latex, tex, prnum, sorry-data, sorry-examples, residue, private-paths, imports, mathlib-subimports, lean-lines, forbidden, dropped, readme-ids-missing, empty-sections, round-labels, long-fences, layer-ids, target-ids, depcheck, metadata, stray-files, dirty, outside-folder, source-material, build). The changed passages contain no process word, pull-request number, LaTeX delimiter, copied passage, local path or new cross-roadmap citation (0.4's new reference to 0.2 is internal to Layer 0, earlier in build order).

The dependency check returned exactly:

```text
depcheck: 200 roadmaps, 1319 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**Lean.** `lake env lean TauCetiRoadmap/PositiveMass/Suggested.lean` exits 0 with exactly the two `sorry` warnings (lines 124 and 150). A scratch copy with `#check @name` for all seven declarations elaborated (exit 0, same two warnings); the printed types of `exists_tendsto_mass_nonneg` and `nonempty_isometryEquiv_of_mass_eq_zero` carry `3 ≤ n`, `n ≤ 7`, `(↑n − 2)/2 < t`, `FiniteEndedAE n M t`, `0 ≤ scalarCurvature`, `Integrable scalarCurvature (riemannianVolume)`, `ConnectedSpace M`, `CompleteSpace M`, `SecondCountableTopology M`, `IsRiemannianManifold (𝓡 n) M`: the README's 8.1 statement (`README.md:1093`–`1097`), nothing changed. The file is unchanged since the previous head, so the previous report's one-tactic probes (`simp` no progress, `infer_instance` fails, no library lemma closes either theorem) and headline inventory stand; the module docstring's "not statable" list (spin structures, mapping degree, weighted Sobolev spaces of sections) is unchanged. README names `coordinateFluxIntegrand`, `normalizedCoordinateFlux`, `pullbackMetricCoeff`, `AsymptoticallyEuclideanEnd`, `FiniteEndedAE`, `exists_tendsto_mass_nonneg`, `nonempty_isometryEquiv_of_mass_eq_zero` all declared; no new backticked name of the roadmap's own appears in the diff.

**Source sample at the changed targets.** `cecchini-zeidler` is the sources text of arXiv 2108.11972v2; `lee-parker` is the AMS Bulletin 1987 text; page numbers are printed pages.

| Target | Source at locator | Result |
| --- | --- | --- |
| 0.1 AE ends, integrability split | `cecchini-zeidler` line 210–219 (Def. 2.1, pp. 5–6): `scal ∈ L¹(E)` plus `C²_(−τ)` decay, τ>(n−2)/2; line 252–257 (Def. 2.3: bounded K, nonempty finite disjoint union of ends, boundary allowed) | The README keeps decay in the structure and integrability as a hypothesis (`README.md:219`–`223`, Lean docstring `Suggested.lean:78`–`80`); "without boundary" at `:218` is the README's restriction, stated. |
| 0.2 the mass | `cecchini-zeidler` line 225–234 (equation (2.1): `1/(2(n−1)ω_(n−1))` times the sphere integral of `Σ x_j/ρ (∂_i g_ij − ∂_j g_ii)`); `lee-parker` line 1449–1453 (Def. 8.2), 1650–1659 (Lemma 9.4: continuous affine for τ>(n−2)/2, proof via `S = −div μ + O(ρ^(−2τ−2))`), 1691–1692 (Thm 9.6: independence of coordinates) | Normalization, existence argument and continuity statement as written at `README.md:256`–`273`. |
| 0.4 conformal law and mass shift | `lee-parker` line 68–75 ((1.1): `S̃ = φ^(1−p)(aΔφ + Sφ)`, `p = 2n/(n−2)`, `a = 4(n−1)/(n−2)`, Δ the positive Laplacian in (2.6)); line 283–300 (§2, (2.6)–(2.7)) | `1 − p = −(n+2)/(n−2)` and `a_3 = 8` as at `README.md:315`–`316`, `:335`. The flux-difference statement (`:321`–`325`) is the README's own; recomputed below. |
| 2.2 zero-mass deformation | `lee-parker` line 1917–1946 (Lemma 10.7, p. 84–85): `g_t = g + th`, h compactly supported; φ_t solves `□_t φ_t = S φ_t`, equivalently `(aΔ_t + γ_t)ψ_t = −γ_t` with `γ_t = S_t − S` compactly supported, `‖ψ_t‖_(C²_(−τ)) → 0`; corrected scalar curvature `S̃_t = φ_t^(2−p) S ≥ 0` (line 1932); `ṁ = −∫ h^(jk) R_jk dV` from (8.11) (line 1944–1946); line 1456 ((8.11)) | The README's parenthesis "it equals `φ^(−4/(n−2)) Scal_g` … bounded between positive constants" is exactly line 1932 with `2 − p = −4/(n−2)` and `φ_t = 1 + ψ_t → 1`; the first-variation claim is line 1944–1946. |
| 4.2 boundary mass identity | `cecchini-zeidler` line 361–363 (Prop. 2.5: complete connected AE spin, compact boundary, u asymptotically constant); line 385–428 (proof, pp. 9–10: `∫_(∂Ω_r∖∂X) ⟨u, c(ν)Du + ∇_ν u⟩ dS → −(n−1)ω_(n−1)/2 · Σ_E m(E)|u|²_(E,∞)`, ν interior); `lee-parker` line 1797–1800 (Thm 10.3: "If N has finite mass and nonnegative scalar curvature, then m(g) ≥ 0") | Sign, constant and interior normal as at `README.md:836`–`842`; the "finite mass" phrase is in the source; AE in Prop. 2.5 means Def. 2.3, hence Def. 2.1 with `scal ∈ L¹`, as the README now says. |
| 6.2 positivity | `cecchini-zeidler` line 662–673 (proof of Thm 3.1, p. 15: ξ₀ asymptotically constant, nonzero at infinity in E, vanishing on the other ends; `B_ψ ξ = B_ψ ξ₀`; `u = ξ − ξ₀`; (3.3) gives `m(E) ≥ 0`); line 592–596 (Thm 3.1 statement) | Construction as at `README.md:980`–`985` (`u = ξ₀ − ξ`, a sign that changes nothing). Thm 3.1's statement lacks "connected" while its proof uses Prop. 2.5 (connected): the README's added "connected" is the source's real hypothesis (Source issues). |
| 8.2 spin theorem | `cecchini-zeidler` line 592–596 (Thm 3.1 with `∂X = ∅`, ψ = 0: `θ̄_0 = n/(n−1)·scal/4 ≥ 0` is `Scal ≥ 0`, `η̄_0` vacuous) | Nonnegativity as at `README.md:1105`–`1108`; rigidity through 6.2's parallel-spinor route and 2.3 (unchanged design). |
| 8.3 one end, arbitrary others | `cecchini-zeidler` line 113–116 (Thm B, p. 3: complete connected spin, no boundary, `scal ≥ 0`, one AE end; `m ≥ 0`, zero mass gives flat, hence ℝⁿ) | As stated at `README.md:1114`–`1117`; unchanged by the diff, re-read because 0.4's and 6.2's new Checks cite its Check. |

**Adversarial table.** Rows for statements the diff leaves untouched are those of the previous report (review at 4753c24) and of the report before it (at ef9ad8b), carried forward unchanged and cited as such; the rows below are the changed statements, recomputed.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| 0.1 list of places (`:222`) | every target naming a mass | clause present at `:261`, `:323`, `:565`, `:591`–`:595`, `:779`, `:839`, `:918`, `:981`, `:1017`, `:1095`, `:1105`, `:1115`; 3.2 inherits scalar-flat ends from 2.1, 7.2 inherits 7.1, 8.4 is scalar-flat | no mass asserted without the clause; the enumeration omits 2.1 and 3.3: R01 (P3) |
| 0.4 flux difference, error terms (`:321`–`:325`) | `ĝ = (1+w) g`, `g_ij = δ_ij + e_ij`, `e = O_1(r^(−t))`, t>0 | difference of integrands `= Σ_j[Σ_i(∂_i w g_ij − ∂_j w g_ii) + w Σ_i(∂_i g_ij − ∂_j g_ii)] x_j/r = −(n−1)∂_r w + ∂w·O(r^(−t)) + w·O(r^(−t−1))`; with `w = O_1(r^(2−n))` both errors are `O(r^(1−n−t)) = o(r^(1−n))` | statement holds for every t>0 as written |
| 0.4 flux difference, leading term | `u = 1 + c r^(2−n) + o_2(r^(2−n))` | `w = u^(4/(n−2)) − 1 = (4/(n−2)) c r^(2−n) + O(r^(4−2n)) + o_1(r^(2−n))`; `−(n−1)∂_r w = −(n−1)(4/(n−2))(2−n) c r^(1−n) = 4(n−1) c r^(1−n)`; sphere integral `4(n−1)c|S^(n−1)| + o(1)`; divided by `2(n−1)|S^(n−1)|`: `2c` | matches the Check at `:337`–`:340` and the 0.2 Check (c = m/2 gives Schwarzschild mass m) |
| 0.4 flux difference, dependence on a mass of g | g = δ (mass 0); g with divergent flux | ĝ-flux = g-flux + 2c + o(1): converges iff g's does; for g = δ, `2c` | "when g has a mass … the mass of `u^(4/(n−2)) g` is `m(g) + 2c`" is exactly the right quantifier |
| 0.4 negative control (`:340`–`:342`) | ℝ³, `u − 1 = (1+r²)^(−3/8)` | `u − 1 ≈ r^(−3/4) ≠ c r^(−1) + o(r^(−1))` for any c (ratio `r^(1/4)` unbounded); flux `≈ (3/2) r^(1/4)` (previous report) | the hypothesis `1 + c r^(2−n) + o_2` discriminates; a "u → 1" version would give 0 + 0 |
| 2.2 setting (`:591`–`:592`) | the hypotheses of 2.1 | 2.1 at `:565`–`:566`: finite-ended AE, t>(n−2)/2, integrable Scal, Scal≥0 | 2.2 now carries the hypotheses of the source (Lemma 10.7 under Thm 10.1's hypotheses) |
| 2.2 corrected scalar curvature (`:594`–`:596`) | `ĝ_s = φ_s^(4/(n−2))(g + sh)`, φ_s solving `a_n Δ⁺_(g_s) φ_s + (Scal_(g_s) − Scal_g) φ_s = 0` | by the 0.4 law `Scal_(ĝ_s) = φ_s^(−(n+2)/(n−2))(a_n Δ⁺ φ_s + Scal_(g_s) φ_s) = φ_s^(−(n+2)/(n−2)) Scal_g φ_s = φ_s^(−4/(n−2)) Scal_g`; Lee–Parker line 1932: `φ^(2−p) S`, `2 − p = −4/(n−2)` | identical |
| 2.2 integrability of the corrected metric | `dV_(ĝ) = φ^(2n/(n−2)) dV_(g_s)`, `g_s = g` outside supp h | `∫|Scal_(ĝ)| dV_(ĝ) = ∫ φ^(−4/(n−2)+2n/(n−2)) |Scal_g| dV_(g_s) = ∫ φ² |Scal_g| dV_(g_s) ≤ sup φ² · ∫|Scal_g| dV_g + C` | finite; `Scal_(ĝ) ≥ 0` for both signs of s since `Scal_g ≥ 0` |
| 2.2 first variation | `h = χ Ric`, s → 0 | `d/ds (Scal_(g_s) − Scal_g)|₀ = DScal(h) = div div h + Δ⁺ tr h − ⟨h, Ric⟩`; divergence terms integrate to 0 (compact support), so `∫ DScal(h) dV = −∫ χ|Ric|² dV < 0`; `φ' = c' r^(2−n) + …` with `c' = −(1/((n−2)|S^(n−1)|)) ∫ Δ_g φ' dV = ∫⟨h,Ric⟩/(a_n (n−2)|S^(n−1)|)`; `ṁ = 2c'` by 0.4 | nonzero constant multiple of `∫⟨h,Ric⟩`, Lee–Parker line 1944–1946 up to normalization |
| 4.2 limit with the clause (`:838`–`:840`) | spatial Schwarzschild mass m, u frame-constant with `v_∞ = v`; the u⁴δ metric | Schwarzschild: scalar-flat, Def. 2.1 holds, limit `−(n−1)|S^(n−1)| m |v|²/2`; u⁴δ: excluded by the clause | hypothesis discriminates |
| 4.2 Check, harmonic spinor (`:857`–`:860`) | n = 3, `ĝ = f²δ`, `f = u²` | dimension-n covariance `D_(f²g)(f^(−(n−1)/2) ψ) = f^(−(n+1)/2) D_g ψ`; n = 3: exponents −1, −2; `D_(ĝ)(u^(−2) v) = u^(−4) D_δ v = 0` | harmonic |
| 4.2 Check, asymptotically constant (`:860`–`:862`) | `(u^(−2) − 1) v`, `u − 1 = (1+r²)^(−3/8)` | `u^(−2) − 1 = −2(u−1) + O((u−1)²) ≈ −2 r^(−3/4)`; `L²_(−1/2)` weight in dimension 3 is `r^(−2δ−3) = r^(−2)` (0.3 Check at `:298`): `∫ 4r^(−3/2) r^(−2) r² dr = ∫ 4 r^(−3/2) dr < ∞`; gradient `≈ r^(−7/4)` (also the spin-connection term `O(r^(−t−1))|v| = O(r^(−7/4))`), weight for `L²_(−3/2)` is `r⁰`: `∫ r^(−7/2) r² dr < ∞`; volume density `u⁶ → 1` | in `H¹_(−1/2)`, `v_∞ = v` |
| 4.2 Check, divergence (`:862`–`:864`) | the integrated identity on Ω_r with Du = 0 | `0 = ‖∇u‖²_(Ω_r) + ∫_(Ω_r) Scal|u|²/4 + G_r(u)`, so `−G_r ≥ ∫_(Ω_r) Scal |u|²/4`; `|u|² = u^(−4)|v|² → |v|²`; `∫ (3/2) r^(−11/4) u⁶ r² dr = ∞` (previous report) | `G_r → −∞`, no limit |
| 6.2 hypotheses (`:980`–`:982`) | the hypotheses of Prop. 2.5 plus `∂X = ∅`, ψ = 0 | complete, connected, AE (Def. 2.3 with Def. 2.1: finite nonempty ends, `scal ∈ L¹`), spin | the README's list equals the source's; "without boundary" matches Layer 6's `∂ = ∅` at `:946`–`:948` |
| 6.2 Check, u⁴δ (`:998`–`:1000`) | hypotheses of 6.2 | complete (u ≥ 1), connected, one end of order 3/4 > 1/2, spin, `Scal > 0`; `Scal ∉ L¹` | "every hypothesis except integrable scalar curvature" is exact; `−G_r → +∞` from the 4.2 row |
| 6.2 Check, disjoint union (`:1001`–`:1002`) | `M = ℝⁿ ⊔ Tⁿ`, flat | complete, spin, `Scal = 0`; one end (the exterior of a ball in ℝⁿ) with complement closed ball ⊔ torus, compact, so `FiniteEndedAE` holds with `numEnds = 1`; mass 0; not isometric to ℝⁿ (two components) | without `ConnectedSpace` the rigidity statement is false; Lean has `[ConnectedSpace M]` (`Suggested.lean:126`, `:152`) |
| 8.2 "connected" (`:1105`) | the disjoint union above | same instance; CZ Thm 3.1 proof uses Prop. 2.5 (connected) | hypothesis needed and now stated |
| 0.1–0.2, 1.1, 1.4, 2.3, 3.0, 3.3, 5.2, 7.1, 7.2, 8.1, 8.3 statements | unchanged by the diff | rows of the previous report (4753c24) and the report before it (ef9ad8b) | carried forward |

**Cross-roadmap citations.** The diff adds none; the resolver found no citation or Lean name missing on main (`aa43542`) or at the open heads. The previous report's resolutions (GeometricTopology smoothing-and-triangulation item 1; AlgebraicTopology Stage 7; RiemannianGeometry R1, R4.1, R5a–R5b; SpinGeometry G3–G6; GeometricCurrents G1–G7; VariationalMethods and UnboundedOperators contracts) are unchanged by the diff and not re-resolved.

**Ownership.** Unchanged from the previous report: the diff introduces no new object; the mass, the Callias argument, the round monogenic spectrum, the weighted AE analysis and the torus obstruction have no other owner on main or among the open heads named in the brief; the board's package index lists no PositiveMass sibling.

## Not verifiable

- **Schoen–Yau 1979 §5, Witten 1981, Parker–Taubes 1982** (cited in the changed sentences of 2.2 and 6.2): the README marks them uncertified; paywalled, not re-fetched; the claims they support were checked against Lee–Parker Lemma 10.7 and Cecchini–Zeidler Theorem 3.1 as above.
- No manifest was edited, no paywall was circumvented, no Lean job is left running.

## Source issues

- **Misprint** in cecchini-zeidler at proof of Lemma 3.4, printed p. 15: the source says the unbarred θ_ψ and η_ψ are nonnegative while invoking (2.10); it should be the barred θ̄_ψ, η̄_ψ of the lemma's hypothesis and of (2.10); affects the proof.
- **Gap** in cecchini-zeidler at Theorem 3.1 and Lemma 3.4, printed pp. 13–14: the source states them for a complete (Theorem 3.1) or bare (Lemma 3.4) AE spin manifold with compact boundary; their proofs use Proposition 2.5 and Lemma 2.6, which assume complete and connected; it should add "complete connected" or argue componentwise; affects the proof.
