# Review of SingularHermitianMetricsAndL2Methods (pull request #3027 at 7b5fe43)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/SingularHermitianMetricsAndL2Methods/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 1407 changed lines since `b8f3652`. Checked: the repair of each remark of the previous review; every changed statement, Origin, Method and Corollary line; the five removed sections against the general sections that now state them; the seeded sample against its sources; the build; and the dependency check. Both earlier findings are repaired: the last clause of 0.4 now carries the uniformity it needs and a Check that shows why, and 7.3 now gives `φ ≤ φ_m`, strict only where `φ > −∞`, as ComplexComparisonPartII §C7.15 states it. No finding remains, and there are no small corrections and no format notes. The human reviewers' decision on sections that leave the family was applied; three points are left for them below.

## Previous findings

- R01 — repaired. The clause of 0.4 (line 350) now reads "for all smooth functions `w_i` and `Ω_i` on open neighbourhoods `V_i` of the closures `Ū_i` of the chart domains `U_i`, with `i∂∂̄Ω_i > 0` on `V_i`, there is a constant `C`…". On the compact `Ū_i` the two Levi forms are bounded against a Hermitian form, so `C` exists; the fifth Check records the counterexample on `ℙ¹`, which I recomputed (table).
- R02 — repaired. 7.3 (line 2038) now reads "`φ ≤ φ_m ≤ sup…` … and `φ < φ_m` where `φ > −∞` (both are `−∞` at a point `x` with `ν(φ, x) > 2n/m`)", which is the statement of ComplexComparisonPartII §C7.15.
- C01 — repaired. The description now says that this roadmap "loses 1.3, 4.3, 7.2, 7.6 and 9.5, and gains HeightsRationalPointsAndObstructions and ArakelovGeometryAndAbelianHeights as suppliers".
- C02 — repaired. The scope list names §C5.4e (k), §C5.4i, §C7.14, §5.17c.3 and §5.17c.7 individually.
- C03 — repaired. The Labels paragraph counts 2.3 among the sections that add this roadmap's own forms, and says that only 7.7 rests on the wider form of 7.4.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| 0.4, last clause (new form) | compact `Ū_i`, `i∂∂̄Ω_i ≥ cω`, `i∂∂̄w_i ≥ −Mω` there | `C = max_i M_i/c_i` gives `i∂∂̄(w_i + CΩ_i) ≥ 0`; a chart with `Ū_i = X` admits no `Ω_i` (Levi `≤ 0` at a maximum) | holds |
| 0.4, fifth Check | `ℙ¹`, chart `ℂ`, `Ω = F(t)`, `t = |z|²`, `F′ = (1 − e^{−t})/t`; `w = −1/t` | `(tF′)′ = e^{−t}`; `(t·t^{−2})′ = −t^{−2}`; sum `Ce^{−t} − t^{−2} < 0` for large `t`; `w = −|ζ|²` at `∞` is smooth | true, and tests the clause |
| 0.4, iff and closure | `u ∈ C²`, `γ = i∂∂̄θ` | `γ + i∂∂̄u = i∂∂̄(θ + u)`; `M_η(θ + u₁, θ + u₂) = θ + M_η(u₁, u₂)` by the translation rule of §C5.4i | holds |
| 7.3, sentence on §C7.15 | `ℙ¹`, `φ = log|s|²_h`, `ν = 2`, `m ≥ 2` | `ν(φ_m, x) ≥ 2 − 2/m > 0`, so `φ_m(x) = −∞ = φ(x)`; `≤` holds, `<` only where `φ > −∞` | matches §C7.15 |
| 0.6 (i), (ii) | disc `g` into `{f = 0}` | `Levi(φ∘g)(ξ) = Levi(φ)(dg·ξ)`, and `df(dg·ξ) = 0` | holds |
| 1.1 (polydisc maxima) | `u = |z₁|²`; `u = Re z₁` | `M(e^s) = e^{2s}`; `e^s`: both convex, nondecreasing, limit `0 = u(0)` | holds |
| 1.2 (form of the formal proof) | `c = n`, `c = n − ½`, `c ≤ 0`; `f = 1`, `f = z₁` | `∫₀¹ r^{2n−1−2c}dr`: `∞`, `1`, finite; `|f|²|z|^{−2n}`: divergent, integrable | holds |
| 1.2 Corollary line | `u = c·log|z|²` | `ν = 2c`: (h) needs `c ≥ n`, (g) gives `c < 1` only | as stated |
| 2.2 (form of the formal proof) | `m = 1`, `s = z` on `ℂ` | coefficient `m − ½ = ½ > 0`; `i∂∂̄ log|z|² = 0` off `0`; `i∂∂̄φ = i∂∂̄φ₀ + ` Levi of `½log Σ|v_k|² ≥ 0` | holds |
| 2.3 | `h = e^{−φ}`, `s = f·e` | `(i/2π)∂∂̄ log|f|² − (i/2π)∂∂̄φ = [div s] − c₁(L, h)`; `(i/π)∂∂̄ log‖s‖ = (i/2π)∂∂̄ log‖s‖²` | matches §C5.4f (b) |
| 2.6 (form of the formal proof) | `O(1)`, `O(−1)` on `ℙ¹` | `deg ≥ −(ε(t)/2π)∫_C ω → 0`; `deg O(−1) = −1` excludes the hypothesis | holds |
| 3.5, form with a function `ε` | constant `ε` | `(1/q)∫ε^{−1}|g|² = (1/(qε))∫|g|²` | consistent, matches §C7.5 |
| 3.9, last step | weight `(n + s)·log|w − z|²` | `ν = 2(n + s)`, the hypothesis of 1.2(c); conclusion order `≥ s + 1` | consistent |
| 5.3 Corollary line (transpose) | `H′ = Hᵀ` | `H′^{−1}∂H′ = ((∂H)H^{−1})ᵀ` | holds |
| 6.3(d) with §C5.4e (k) | `g = z₁^a z₂^b` | exponent `1/max(a, b)`; `ν = 2(a + b)`; `1/(a+b) ≤ 1/max(a,b) ≤ 2/(a+b)` | holds |
| 7.4 (i) | `|s_j| < ½` | `log(1/|s|²) ≥ log 4 > 1`; `ε(t) → 0`; `φ + ε(t)R_s → +∞` at `D`, compatible with `φ_t ≤ C` | consistent |
| 7.4 (ii) against the wider form | bounded `φ` | `λ_r ≤ 2sup|φ|/log(r₀/r)`; loss `≤ C/log(1/t) + Ct → 0` | consistent |
| 8.1 Method line | `i∂∂̄φ_k ≥ εω` | `|v|²_{i∂∂̄φ_k} ≤ ε^{−1}|v|²` | as stated |
| Headline 4.1 (§C7.7) | unit polydisc, `φ = 0`, `f = 1` | `∫|F|² ≥ π·vol(Δ^{n−1})`, equality at `F = 1`; disc of radius `r`: `π/c_D(0)² = πr²` | holds |
| Headline 8.1 (§C7.16) | `ℂ`, `φ = |z|²`, `g = dz̄` | least-norm `u = z̄`; `∫|z̄|²e^{−|z|²} = π = ∫e^{−|z|²}` | holds |
| Former 1.3, 4.3, 7.2, 7.6, 9.5 | each destination opened | §C5.4e (k): both bounds and `c = ∞ ⇔ ν = 0`; §5.17c.3: `c_D² ≤ πK_D`; §C7.14: `E_c` analytic; §C5.4i: `u ≤ v ≤ u + δ`; §5.17c.7 present | stated in full |

- Source locators checked against the text: 24. [CADG] I Def. 5.1, Th. 5.4–5.8, 5.11, Def. 5.20, Def. 5.22, Th. 5.23–5.24 (pp. 39–45) and VIII Th. 6.1, 6.5, Lemma 7.3; [AMAG] Lemma 5.6 (p. 35), Remark 5.17, Th. 14.2, Th. 14.12 (pp. 142–143); Demailly 1982 Th. 1.5, Prop. 1.6 (p. 464), Th. 4.1 with Rem. 4.2 (p. 472), Lemme 6.9 (p. 485); Demailly 2015 Th. 2.8, Lemma 3.6, (3.10), Prop. 3.11; Mumford 1977 Prop. 1.1–1.3, Th. 1.4 (pp. 240–243); Demailly 1992 Prop. 3.7; Demailly 1994 Prop. 2.9, Th. 4.1.
- Cross-roadmap citations resolved at this head: ComplexComparisonPartII §§C5.4a–C5.4j (clauses (a)–(k) of C5.4e, (a)–(d) of C5.4f and C5.4g, (a)–(c) of C5.4h and C5.4j) and §§C7.1–C7.18; PDE §§3.2a, 3.4a; ComplexKahlerGeometry §§3.5a, 4.2a; ArakelovGeometryAndAbelianHeights §§5.1a–5.1d; HeightsRationalPointsAndObstructions §§5.17c.2–5.17c.7; MultiplierIdealsOfPairsAndPointSeparation §§9.10b–9.12c.
- Record: the README at the merge base has 10 layers and the head keeps all 10 ids and titles. The five sections removed are those the decision covers. No remaining text cites 1.3, 4.3, 7.2, 7.6 or 9.5 of this roadmap, and no other roadmap does.
- Overlap check: read ComplexKahlerGeometry, MinimalSurfaces and HeightsRationalPointsAndObstructionsPartII (open), and HeightsForLogSingularMetrics, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties and ComplexHessianEquations (main); nothing shared. The general theorems this roadmap cites are owned by ComplexComparisonPartII, PDE, ComplexKahlerGeometry, ArakelovGeometryAndAbelianHeights and HeightsRationalPointsAndObstructions, and its scope section says so.
- Dependency check output: `depcheck: 129 roadmaps, 1442 edges, 0 problem(s)`.
- Automatic checks: every check passed at this head. Elaboration: `lake env lean` of `Suggested.lean` printed nothing and exited 0. The file declares nothing, so there are no signatures to compare and nothing to probe with one tactic; its docstring names the four headlines (8.1; 6.2 and 8.2; 4.1 and 4.2; 9.1 and 9.2) as not statable and says which carriers each lacks.
- Source independence: changed passages only; 11 passages compared with 7 sources, none shared beyond formulas the mathematics forces; largest share DemaillyAMAG, 37 of about 190 source citations; no layer is added, removed or reordered, so contents were not compared.
- Research link: Layers 3–8 state the `L²` methods of Hörmander (1965), Demailly (1982), Ohsawa–Takegoshi (1987), Nadel (1990), Demailly (1992) and Guan–Zhou (2015) in the forms that, by the README's References ([FormalProof], [Announcement]), Alpöge's formal proof of the Riemann hypothesis for Dirichlet L-functions announced in 2026 uses.

## Not verifiable

- Grauert–Remmert 1956 (0.5, 0.6, 7.7), Fornæss–Narasimhan 1980 (0.6, 7.5(b)) and Błocki–Kołodziej 2007 (7.4, 7.5(a), 7.7): not among the texts held for this roadmap; not read.
- Hörmander 1994 and Hartogs 1906 (0.3a), Cornalba–Griffiths 1975, Cheng–Yau 1980 and Kobayashi 1984 (5.5), Nadel 1990 (6.1), Berndtsson 1996 (3.8a): not among the texts held; the sampled statements were checked against [CADG], [AMAG] and the general sections instead.
- The declaration and file names of [FormalProof] quoted in 4.2, 7.4, 7.7 and 8.3: that repository is not available here.

## Source issues

- **Error** in DemaillyAMAG at Th. 14.12 (a), p. 142: the source says `φ(x) < φ_m(x)` at every point; it should be `φ ≤ φ_m`, strict only where `φ(x) > −∞`, since both are `−∞` where the Lelong number exceeds the loss; affects a stated result.
- **Error** in Demailly1992 at Proposition 3.7 (i): the source says `ψ(x) < ψ_m(x)` at every point; it should be `ψ ≤ ψ_m`, strict only where `ψ(x) > −∞`; affects a stated result.

## For the human reviewers

- The decision on sections stated in full in a general roadmap was applied: 1.3, 4.3, 7.2, 7.6 and 9.5 are stated at ComplexComparisonPartII §C5.4e (k), HeightsRationalPointsAndObstructions §5.17c.3, ComplexComparisonPartII §§C7.14 and C5.4i, and HeightsRationalPointsAndObstructions §5.17c.7; the README's scope list names each.
- Beyond the removed sections, the Checks of 2.3, 3.5 and 4.1 leave the README with their routes. Their content remains in 2.1's and 3.3's Checks, 4.1's statement and ComplexComparisonPartII §C7.7, except 4.1's Check on twisted norms. The decision does not name Checks.
- The `*Method of the formal proof:*` labels describe a formalisation announced on 20 November 2026 and not published (README References, [FormalProof] and [Announcement]); the theorems stated are from refereed sources.
- Not tested: Grauert–Remmert 1956, Fornæss–Narasimhan 1980 and Błocki–Kołodziej 2007 were not read, so the wording comparison did not cover them.
