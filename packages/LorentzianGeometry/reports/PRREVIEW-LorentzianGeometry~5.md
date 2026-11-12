# Review of LorentzianGeometry (pull request #2232 at fc070ae)

**Verdict:** accepted

No findings.

## Previous findings

- R01 — repaired: `Suggested.lean` lines 473–485 state `lorentzianLength_le_of_meanCurvature_le`, using `ricci`, `levelSetUnitNormal` and `levelSetMeanCurvature` (lines 445–466). Docstring lines 26–28 move Hawking's theorem to the stated list, and README lines 2308–2313 name all four declarations.
- R02 — repaired: README line 528 "Barzen–Leymann, Lemma 24, (54), p. 42"; lines 1067 and 1075 "Minguzzi 2019, Proposition 6.3, p. 159" and "p. 160"; line 2307 "O'Neill, Theorem 14.55A"; Geroch locators at lines 1936 and 1963–1967 and `Suggested.lean` 302–303.
- R03 — repaired: §2.4 Checks (lines 694–700) compute `Γ^t_xx = a a′`, `Γ^x_tx = a′/a` and the conformal `∂_t`, each with a wrong-sign control. §12.7 Checks (lines 2210–2217) compute two Filippov geodesics.

## Verified sound

| Target | Instances | Roadmap value | Computed or source value | Result |
| --- | --- | --- | --- | --- |
| §2.1 locator | tangent bundle in coordinates | `DΓ(u)v − DΓ(v)u + [Γ(u),Γ(v)]` | barzenleymann2026 lines 1925, 1945, 1948: (54) `∂_iΓ^l_jk − ∂_jΓ^l_ik + Γ^m_jkΓ^l_im − Γ^m_ikΓ^l_jm` under (53) | sound |
| §2.4 Christoffel Check | `−dt² + a(t)² dx²` | `Γ^t_xx = aa′`, `Γ^x_tx = a′/a`; `+1` gives `−aa′` | `½(−1)(−2aa′) = aa′`; `½a⁻²(2aa′) = a′/a`; `½(+1)(−2aa′) = −aa′` | sound |
| §2.4 conformal Check | `ĝ = e^{2t}(−dt² + dx²)`, `X = Y = ∂_x` | `∂_t`; wrong sign `−∂_t` | `g(−∂_t, v) = dt(v)`, so `sharp(dt) = −∂_t`; `−1·(−∂_t) = ∂_t`; `Γ̂^t_xx = 1`, `Γ̂^x_xx = 0` | sound |
| §5.1 locators | de Sitter `κ = 1` | `J″ + R(J,γ′)γ′ = 0`; Wronskian conserved | minguzzi2019 lines 6700–6706 (p. 159, `R_u(X) = R(X,u)u`); lines 6726–6727 (p. 160) | sound |
| §12.2 Cauchy surface gives `D(S) = M` | `{t = 0}` in Minkowski; graph `t = min(max(x,0),1)` | via Corollary 3.34 | minguzzi2019 line 3580 (`D̃` uses timelike curves); line 4046 (p. 95): `D̃(S) = M ⇔ D(S) = M` for closed achronal `S` | sound |
| §12.3 Geroch (`isGloballyHyperbolic_iff_exists_isCauchySurface`) | `(ℝ, −dt²)`; `(S¹, −dθ²)`; the graph above | ⇒ Thm 4.119 with Def. 3.35; ⇐ §12.2 with Thm 3.45 | lines 6195 (p. 147), 4052–4053 (acausal, `D(S) = M`), 4210 (p. 99). The non-acausal graph is Cauchy, so the ⇐ route covers it | sound |
| §12.7 Filippov Check 1 | `−dt² + e^{2\|t\|}dx²`, curve `(0, s)` | hull contains `0 = −x″` | off `t = 0`: `Γ^t_xx = sign(t)e^{2\|t\|}`, `Γ^x_tx = sign(t)`; near `w = (0,1)` the values tend to `(±1, 0)`, midpoint `0` | sound |
| §12.7 Filippov Check 2 | same metric, curve `(s, x₀)` | `x″ = 0` admissible | `Γ(w,w) = (±e^{2\|t\|}w_x², ±2w_tw_x) → 0` as `w_x → 0`; for `s ≠ 0`, `Γ` is continuous with value `0` | sound |
| `ricci` | 2D de Sitter (`κ = 1`) | `Ric(u,v) = tr(w ↦ R(w,u)v)` | Tau Ceti `Ricci.lean`:29–30, `Ric = (d−1)κg`: `Ric(v,v) = g(v,v) < 0` for timelike `v`, so TCC fails, as it should; the reversed sign would pass | sound |
| `levelSetUnitNormal` | Minkowski `t`; `I⁺(0) ⊂ ℝ^{1,3}`, `τ = √(t² − \|x\|²)` | future unit normal | `ν = ∂_t`; `grad τ = −P/τ`, `g(grad τ, grad τ) = −1`, `ν = P/τ` (future) | sound |
| `levelSetMeanCurvature` | hyperboloid `τ = 1`; reversed Milne | `tr(X ↦ ∇_Xν) = tr_h k` (§9.1, line 1539) | `tr(X/τ − dτ(X)P/τ²) = 4/τ − 1/τ = 3`, the §9.1 Check's `H = 3`; Milne: `−1/t₀` | sound |
| Hawking (`lorentzianLength_le_of_meanCurvature_le`) | reversed Milne `n = 1`, `T = t₀ − t`; reversed `I⁺(0)`, `n = 3`; Minkowski; dimension 1 | length `≤ n/\|b\|` | bounds `t₀` and `3/3 = 1`, each equal to the proper time to the vertex (sharp); Minkowski `H = 0`; in dimension 1 `H = 0`, so the hypotheses fail | sound |
| Docstring: timelike focusing lemma not statable | Tau Ceti Jacobi API | no semi-Riemannian Jacobi field or focal point | `IsJacobiFieldOn` (`Riemannian/Jacobi/Basic.lean`:59) and `IsConjugateOn` (`Conjugate.lean`:80) need `[RiemannianBundle …]` (lines 51–52); no focal-point declaration | true |

The rows for the untouched statements stand as in the previous review, of `145033c`.

- Gate: the worker's run at fc070ae is OK. My rerun against the default order fails only on `depcheck: NOT IN ORDER: LorentzianGeometry`, which is not a finding. Against the candidate order the result is `depcheck: 206 roadmaps, 1899 edges, 0 problem(s)`, with LorentzianGeometry on line 216, right after RelativisticQuantumFieldTheory. Nothing changed outside the folder.
- Elaboration: `lake env lean` gives 0 errors and 8 `sorry` warnings (lines 151, 304, 312, 323, 348, 358, 427, 473). `#check @` on all 46 declarations gives 0 errors. The four new declarations keep `[FiniteDimensional ℝ E]`, `ricci` also keeps `[T2Space M]`, and their types match README §13.3.
- Padding: the probe `first | rfl | infer_instance | simp | trivial | aesop` on line 485 fails (aesop finds nothing; unsolved goals).
- Source locators checked against the cached text: 10 (minguzzi2019 lines 3580, 4046, 4052, 4210, 6195, 6704, 6726, 8006; barzenleymann2026 lines 1925, 1948). Seeded sample: the changed text covers §2.1, §12.3 and §13.3, which are checked; the other 12 sampled sections are untouched.
- Library declarations opened at the pins: Tau Ceti `ricciTensor` (`Curvature/Ricci.lean`:65), `curvatureOperator` (`Curvature/Basic.lean`:89), `curvatureTensor` (`Curvature/Tensor.lean`:152), `flat`, `sharp` and `apply_sharp_apply` (`NondegenerateMetric/Basic.lean`:350, 361, 390), `IsJacobiFieldOn` and `IsConjugateOn`; Mathlib `CovariantDerivative` (`CovariantDerivative/Basic.lean`:366).
- Cross-roadmap citations: the change adds none. RelativisticQuantumFieldTheory §1.1 still resolves at its open head (README 309; `Suggested.lean` 79, 84), and HopfRinow is under `Completed/`.
- Pull request text: "The 48 targets" matches the 48 numbered sections. The stated and not-statable lists match docstring lines 16–45, and the supplier list and depends-on block are unchanged and correct.
- Overlap check: read RiemannianGeometry (main and open #2222–#2226), HopfRinow, RicciFlow and PositiveMass. Nothing is shared: `roadmaps grep` finds Hawking's theorem, timelike convergence and level-set mean curvature only here. PositiveMass line 68 leaves spacetime data out of its scope, and RiemannianGeometry's mean curvature (line 163) is the averaged Riemannian one.

## Not verifiable

- `oneill1983` is settled as uncertified, so "Theorem 14.55A" was not read. Graf's 2020 paper, arXiv:1910.13915, cites O'Neill's Theorem 14.55A as the Cauchy-hypersurface, mean-curvature form, consistent with this use.
- Geroch 1970, Hawking 1967 and Bernal–Sánchez 2006 are not in the manifest and were not checked.
- The description's "Annals definitions 50 and 51" names no locatable source.

## Source issues

- none
