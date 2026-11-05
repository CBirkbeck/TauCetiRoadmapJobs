# Review of PositiveMass (pull request #956 at 4753c24)

**Verdict:** needs changes

🤖 Independent AI re-review of the repaired head, incremental over the 101 lines changed since ef9ad8b. One finding, P2. The push gate, the dependency check and an independent Lean elaboration pass. No pull-request file was changed.

## R01 (P2) — 4.2 and 6.2 assert a mass without the integrability clause that 0.1 now promises

**Location:** `TauCetiRoadmap/PositiveMass/README.md:219`–`222`, “here it is a separate hypothesis, stated wherever a mass is asserted (0.2, 5.2, 7.1, 8.1–8.3)”; `README.md:826`–`827`, “For asymptotically constant solutions, `lim G_r(u) = −(n−1)|S^(n−1)| m |v_∞|²/2`”; `README.md:960`, “the mass identity gives `m(E) ≥ 0` at each end”.

**Claim:** On an AE end of a spin manifold (0.1, decay only), every asymptotically constant harmonic spinor has `G_r(u)` converging to `−(n−1)|S^(n−1)| m |v_∞|²/2`; and in Layer 6's setting (“a finite-ended AE manifold with nonempty ends”, `README.md:926`) each end has mass `m(E) ≥ 0`.

**Witness:** the metric of the new 8.3 Check (`README.md:1094`–`1101`): ℝ³, `g = u⁴δ`, `u = 1 + (1+r²)^(−3/8)`, spin, complete, end of order 3/4, `Scal ≈ (3/2) r^(−11/4) > 0` not integrable, flux `≈ (3/2) r^(1/4)` divergent. It satisfies every hypothesis of 4.2 and of 6.2. A harmonic asymptotically constant spinor exists explicitly: in dimension 3, `D_(f²δ)(f^(−1)ψ) = f^(−2) D_δ ψ`, so with `f = u²` and ψ a constant spinor v, `u^(−2) v` is `g`-harmonic with `v_∞ = v` (the difference `(u^(−2) − 1)v ≈ −2 r^(−3/4) v` lies in `H¹_(−1/2)`: `∫ r^(−3/2) r^(−2) r² dr < ∞`, gradient `∫ r^(−7/2) r² dr < ∞`). The integrated identity of 4.2's own sign Check, `0 = ‖∇u‖² + ∫_(Ω_r) Scal|u|²/4 + G_r(u)`, then gives `−G_r(u) ≥ ∫_(Ω_r) Scal|u|²/4 → +∞` since `|u|² → |v|²`, so `lim G_r(u)` does not exist in ℝ and “`m`” is undefined. 6.2's `m(E) ≥ 0` asserts the sign of the same undefined number. The clause the author added in 5.2 (`README.md:895`–`896`) and 7.1 does not reach 4.2, which 5.2 cites, nor 6.2's own statement.

**Repair:** in 4.2, “For asymptotically constant solutions on an end with integrable scalar curvature, …”; in 6.2, “On a complete connected finite-ended AE spin manifold with nonempty ends, Scal≥0 and integrable scalar curvature, …”; and in 0.1 extend the list to “(0.2, 4.2, 5.2, 6.2, 7.1, 8.1–8.3)”. Retest: on the instance above 4.2 and 6.2 no longer apply; on spatial Schwarzschild (scalar-flat, mass m) 4.2 gives the limit `−(n−1)|S^(n−1)| m |v|²/2` and 6.2 gives `m ≥ 0`, unchanged.

## Previous findings

- R01 — repaired: `README.md:987`–`988`, “one specified AE end E satisfying 0.1 with integrable scalar curvature on E”; `README.md:1085`–`1088` likewise, with Theorem B's Definition 2.1 named; the divergent-flux metric is the first 8.3 Check and the Schwarzschild control the second. The repair's coverage sentence in 0.1 omits 4.2 and 6.2: R01 above.
- R02 — repaired: `README.md:56`–`57`, `:184`–`186`, `:690`–`691`, `:696`–`697`, `:796`–`797` cite “GeometricTopology, the smoothing-and-triangulation comparison, item 1 (smooth implies PL)”. On main (`aa43542`) that section is `GeometricTopology/README.md:930`, item 1 at `:937`–`943`: every smooth manifold has a smooth triangulation (Whitehead, Munkres); GeometricTopology builds manifolds-with-boundary from the start (`:50`, `:99`–`103`), so compact surfaces with boundary are within its statement.
- R03 — repaired: `README.md:1012`–`1017`: no ball contains X₀; `X_λ = ℝⁿ` and the exterior `{|x| ≥ R − 1/λ − ε}` for `1/λ + ε < R`, with `H = −1/(R − 1/λ − ε)` and the bound on `h_λ`. Values recomputed below.
- R04 — repaired: `Suggested.lean:25`, “P3.1's torus obstruction”; `:28`, “P1's weighted Fredholm theorems, P1.3's round spinor spectrum and P6.1's Callias solvability”; headings 1.3, 3.1, 6.1 are at `README.md:446`, `:658`, `:924`.
- R05 — repaired: `README.md:930`–`935` cite “the argument of Cecchini–Zeidler's Lemma 3.4 (p. 14–15) applied to the unbarred estimate of 5.2”, spell the argument out, and say the lemma itself is barred; the new Check at `:951`–`954` separates the two sign hypotheses. Values below.

## Verified sound

**Scope and mechanical checks.** Head `4753c24ff9691032d14e91ffdbeb56cf276d4763`; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`; `git diff --stat origin/main...HEAD` outside the folder is empty; the diff since `ef9ad8b` touches only `README.md` (93 lines) and `Suggested.lean` (8 lines, docstrings only). The worker's gate reports every check zero and `OK`. The changed passages contain no process word, pull-request number, LaTeX delimiter, copied passage or local path. Main was read at `aa435424`.

The dependency check returned exactly:

```text
depcheck: 200 roadmaps, 1308 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**Lean.** `lake env lean TauCetiRoadmap/PositiveMass/Suggested.lean` exits 0 with exactly the two `sorry` warnings (lines 124 and 150). A scratch copy with `#check @name` for all seven declarations elaborated; the printed types of `exists_tendsto_mass_nonneg` and `nonempty_isometryEquiv_of_mass_eq_zero` carry every binder of the README's 8.1 statement (`3 ≤ n`, `n ≤ 7`, `(n−2)/2 < t`, `FiniteEndedAE n M t`, `0 ≤ scalarCurvature`, `Integrable scalarCurvature riemannianVolume`, `CompleteSpace`, `ConnectedSpace`, `SecondCountableTopology`, `IsRiemannianManifold`); nothing changed against the README. One-tactic probes on the same scratch copy: `simp` “made no progress” on both theorems; `infer_instance` fails on the rigidity theorem; `exact?` finds only the sorried originals in the same file, no library lemma. Neither theorem is padding. The docstring of `AsymptoticallyEuclideanEnd` (`Suggested.lean:78`–`80`) names `hint`, which is the hypothesis at lines 139 and 165. The headline inventory of the module docstring is unchanged from the previous review, where the pins were searched for spin structures, Dirac operators, mapping degree and weighted Sobolev spaces.

**Cross-roadmap citations resolved at this head** (the changed ones; the others are as in the previous report):

| Citation | Where found | Boundary |
| --- | --- | --- |
| GeometricTopology, the smoothing-and-triangulation comparison, item 1 | `GeometricTopology/README.md:930`–`943` on main `aa435424` | “Every smooth manifold has an essentially unique PL structure (a smooth triangulation, Whitehead)”, far-horizon; manifolds-with-boundary are in GeometricTopology's scope (`:50`, `:99`–`103`). The citation is a stated contract against a far-horizon target, which is allowed; PositiveMass uses only compact surfaces with boundary. |
| AlgebraicTopology Stage 7 (Euler identification in 3.1) | unchanged | as in the previous report |

**Source sample at the changed targets.** `cecchini-zeidler` is `sources` text of arXiv 2108.11972v2; page numbers are printed pages.

| Target | Source at locator | Result |
| --- | --- | --- |
| 0.1 AE ends | `cecchini-zeidler` line 210–219 (Def. 2.1, pp. 5–6): `scal ∈ L¹(E)` plus `C²_(−τ)` decay, τ>(n−2)/2; line 252–255 (Def. 2.3) | The README's split (decay in the structure, integrability as a hypothesis) is stated at `README.md:219`–`222`; the list of places is incomplete (R01). |
| 3.1 boundary Gauss–Bonnet | do Carmo §4-5 unreadable (below); GeometricTopology item 1 as above | Triangulation supplier resolved; values carried from the previous table. |
| 5.2 integrated estimates | `cecchini-zeidler` line 361–363 (Prop. 2.5, p. 9): complete connected AE spin manifold with compact boundary, ψ compactly supported, u asymptotically constant; (2.9)–(2.10) at line 364–382 | The added hypotheses “complete connected finite-ended AE spin manifold X with compact boundary and integrable scalar curvature” are exactly the source's (AE through Def. 2.3 and 2.1). |
| 6.1 Fredholm, surjectivity | line 556–561 (Thm 2.12, p. 12: nonnegative index, iso iff injective); line 642–644 (Lemma 3.4: `θ̄_ψ ≥ 0`, `η̄_ψ ≥ 0`); line 647–660 (proof) ; line 436–438 (Lemma 2.6) | The README's unbarred statement is now attributed to the argument, not the lemma; the lemma's barred form is stated. The argument is checked below. |
| 7.1 truncations | line 725–736 (proof of Thm A, p. 16): X₀, K, f, ξ₀ with `supp ξ₀ ⊂ X₀∖K`, the admissible class and λ₀; line 742–757 (p. 17): `h_λ`, `ψ_λ`, (i)–(iii) | Matches; the README's “connected” on X_λ is a harmless strengthening (take the component containing X₀). The end E is AE in the sense of Def. 2.1, so integrability on E is the source's hypothesis, now stated. |
| 8.3 arbitrary ends | line 113–116 (Thm B, p. 3) | Complete connected spin, no boundary, scal≥0, one AE end (Def. 2.1 with integrability): mass ≥ 0, zero mass gives ℝⁿ. As stated. |

**Adversarial table.** Rows for statements the diff leaves untouched are those of the previous report (review at ef9ad8b), carried forward unchanged; the rows below are the changed statements, recomputed.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| 0.1 integrability split | the 8.3 instance; the Lean structure | `u⁴ − 1 ≈ 4r^(−3/4)` passes `decay` with t=3/4; `Scal ∉ L¹`; `hint` separate in Lean | split is consistent with Lean; the README's list of places misses 4.2 and 6.2: R01 |
| 0.1 list of places | 0.2, 5.2, 7.1, 8.1, 8.2, 8.3; 4.2; 6.2 | clause present at `:260`, `:895`–`896`, `:988`, `:1066`, `:1076`, `:1086`; absent at `:826`, `:960` | 6 of 8 |
| 3.1 triangulation input | compact surfaces with boundary | GeometricTopology item 1: every smooth manifold; manifolds-with-boundary in scope | supplier makes the statement |
| 5.2 hypotheses | two-ended Schwarzschild, m>0, ψ=0, u constant frame spinor with `|u|_(E,∞) = 1` on one end, 0 on the other | left `(n−1)|S|m/2 + ‖𝓓u‖²`; right `‖∇u‖² + ∫Scal|u|²/4 = ‖∇u‖²` | consistent with 4.2's limit |
| 6.1 kernel elements have `|u|_(E,∞) = 0` | u ∈ H¹_(−q), q=(n−2)/2, n=3 | a nonzero constant has `∫ r^(−2)·r² dr = ∞`, not in `L²_(−1/2)` | asymptotic value 0 |
| 6.1 unbarred surjectivity argument | `B_ψ u = 0`, `θ_ψ ≥ 0`, `η_ψ ≥ 0` | (2.9): `0 ≥ ‖∇u‖² + ∫θ|u|² + ∫η|u|² ≥ ‖∇u‖²`; ∇u=0; `|u|` constant, in `L²_(−q)` only if 0; index ≥ 0 and ker = 0 give coker = 0 | argument valid at the README's generality (complete connected, nonempty ends) |
| 6.1 barred vs unbarred | Scal ≥ 0; H ≥ 0; exterior of unit ball, ψ=0, n=3 | `θ̄ − θ = Scal/(4(n−1)) ≥ 0`; `η̄ − η = H/2`; `η_0 = −1 > η̄_0 = −3/2` | neither pair implies the other; Check correct |
| 7.1 flat admissible X_λ | n=3, R=2, λ=1, ε=1/2 | ball ⊅ `{|x| ≥ 2}`; `X_λ = ℝ³`: ∂=∅, admissible; exterior radius ρ = 1/2: `dist = 3/2 > 1`, annulus `1/2 ≤ |x| < 2` relatively compact; inward normal outward from origin, `H = −1/ρ = −2`; `h_λ ≥ (n−1)/(2ρ) = 2` | Check correct; barrier `h(t) = 1/(1−t)` reaches 2 at t = 1/2 < 3/2, consistent |
| 7.1 mean-curvature sign | unit ball from inside, exterior of unit ball | H = +1, H = −1 (5.1 Check at `:886`–`888`) | scaling gives `−1/ρ` |
| 8.3 instance, Laplacian | `f = (1+r²)^(−3/8)` | `f′ = −(3/4) r (1+r²)^(−11/8)`; `f″ = −(3/4)(1+r²)^(−11/8) + (33/16) r² (1+r²)^(−19/8)`; `Δu = f″ + 2f′/r = (1+r²)^(−19/8)(−9/4 − (3/16) r²) = (3/4)(1+r²)^(−19/8)(−3 − r²/4)` | matches the Check, `< 0` |
| 8.3 instance, Scal | n=3, `a₃ = 8`, exponent 5 | `Scal = −8 u^(−5) Δu > 0`; `≈ 8·(3/16) r^(−11/4) = (3/2) r^(−11/4)` | positive, matches |
| 8.3 instance, integrability | volume `u⁶ r² dr dω` | `∫ r^(−11/4) r² dr = ∫ r^(−3/4) dr = ∞` | not integrable |
| 8.3 instance, flux | `g = wδ`, `w = u⁴`, n=3 | `Σ_i(∂_i g_ij − ∂_j g_ii) = −2 ∂_j w`; sphere integral `−2w′·4πr²`; normalizer `2·2·4π = 16π`; flux `−w′r²/2 = (3/2) u³ r³ (1+r²)^(−11/8) ≈ (3/2) r^(1/4)` | 15 at r=10⁴, 150 at r=10⁸, divergent |
| 8.3 instance, order and completeness | `g − δ = (u⁴−1)δ` | `u⁴ − 1 ≈ 4 r^(−3/4)`, derivatives lose one order each; `g ≥ δ` | order 3/4 > 1/2; complete |
| 8.3 control | spatial Schwarzschild m>0, two ends | scalar-flat, Def. 2.1 holds; either end specified, mass m (`cecchini-zeidler` line 239–251) | theorem applies |
| 8.3 with the clause | the instance; Schwarzschild | excluded; included | hypothesis discriminates |
| Lean docstring labels | P3.1, P1.3, P6.1, P8.2, P8.3 | headings at `README.md:658`, `:446`, `:924`, `:1074`, `:1083` | all exist |
| Lean `hint` | `exists_tendsto_mass_nonneg`, rigidity | `Integrable scalarCurvature (riemannianVolume)` over all of M | README 8.1 says the same (“Scal integrable for `TauCeti.riemannianVolume`”) |

**Ownership.** Unchanged from the previous report: the mass, the Callias argument, the round monogenic spectrum, the weighted AE analysis and the torus obstruction have no other owner on main or among the open heads; the board's package index lists no PositiveMass sibling; no fully qualified name of `Suggested.lean` appears in another roadmap.

## Not verifiable

- **do Carmo §4-5** (3.1's boundary Gauss–Bonnet, cited in a changed sentence): a textbook with no legal online copy and not in the operator's local directory; the statement was checked by the disc, annulus, hemisphere and square values of the previous table.
- **Bartnik 1986, Schoen–Yau 1979 (both), Parker–Taubes 1982, Witten 1981, ADM 1961**: cited in passages the diff does not touch; not re-fetched this round, as in the previous report (paywalled or blocked; the README marks the four as uncertified).
- No manifest was edited, no paywall was circumvented, no Lean job is left running.

## Source issues

- **Misprint** in cecchini-zeidler at proof of Lemma 3.4, printed p. 15: the source says the unbarred θ_ψ and η_ψ are nonnegative while invoking (2.10); it should be the barred θ̄_ψ, η̄_ψ of the lemma's hypothesis and of (2.10); affects the proof.
- **Misprint** in cecchini-zeidler at proof of Theorem A, printed p. 16: the source says the admissible X_λ satisfies dist(∂X, ∂X_λ) > 1/λ; it should be dist(∂X₀, ∂X_λ) > 1/λ, as used on p. 17; affects nothing.
- **Gap** in cecchini-zeidler at Theorem 3.1 and Lemma 3.4, printed pp. 13–14: the source states them for a complete (Theorem 3.1) or bare (Lemma 3.4) AE spin manifold with compact boundary; their proofs use Proposition 2.5 and Lemma 2.6, which assume complete and connected; it should add “complete connected” or argue componentwise; affects the proof.
