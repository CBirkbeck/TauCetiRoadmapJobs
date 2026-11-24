# Review of ComplexComparisonPartII (pull request #3027 at 3b77a6a)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 1614 changed lines since `74a09b7`. Both remarks of the previous review are repaired: C7.15 now asks for `φ ≤ φ_m`, strict only where `φ > −∞`, with a Check on `ℙ¹` that shows why, and the citation of C7.1 (b) says that the cited theorem is for smooth weights and how the general case follows. I recomputed the new Check, the convolution step added to the route of C7.1, and the normalisations of the statements the change adds; the file elaborates with `sorry` as its only warning and the dependency check reports no problem. There is no finding, no small correction and no format note; one question to the author stays open, and nothing is left for a human to decide.

## Questions for the author

- C5.4j (a) and (b) are cited as Theorems 1 and 2 of Błocki–Kołodziej 2007, in that order. Is that right? The DOI resolves to the AMS journal page, a host I cannot certify, so I could not open the paper.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| C7.15, lower bound (changed) | `ℙ¹`, `φ = log|s|²_h`, `s` with a simple zero at `x`, `m ≥ 2`; a point with `φ(x) > −∞` | at `x`: `ν(φ_m, x) ≥ 2 − 2/m > 0`, so `φ_m(x) = −∞ = φ(x)`: `≤` holds, `<` not asked; elsewhere source gives `φ_m ≥ φ + (C₃/4)ε(δ)δ² > φ` | holds; previous R01 repaired |
| C7.15, new Check | Lelong–Poincaré with `h = e^{−φ_h}`; `ν` of `log|z|²` on `ℂ` | `i∂∂̄log|s|²_h = 2π[x] − iΘ_h`, so `α + i∂∂̄φ = 2π[x] ≥ 0`; `liminf log|z|²/log|z| = 2`; `2 − 2n/m = 2 − 2/m` | true; agrees with C5.4e (b), C5.4f (b) and line 3684 |
| C7.15, Lelong and upper bounds against the source | *Analytic Methods* 14.12 with weight `e^{−2mφ}`, `m ↦ m/2` | `ν − n/m` becomes `ν − 2n/m`; `(1/2m)log` becomes `(1/m)log`; C7.13 (a): `(2/m)log(C₂/rⁿ) = (1/m)log(C₂²/r^{2n})` | matches lines 7120–7131 and 6821–6825 |
| C7.1 route, convolution step (added) | `ρ` radial of mass 1, `ρ_ε`; `φ − c|z|²` plurisubharmonic | `(|z|² ∗ ρ_ε)(z) = |z|² − 2Re⟨z, ∫wρ_ε⟩ + ∫|w|²ρ_ε = |z|² + const`; so `φ∗ρ_ε − c|z|² = (φ − c|z|²)∗ρ_ε + c·const` | true; the regularised weights keep hypothesis (b) |
| C7.1 (b) citation, `hormanderL2_strict` docstring (changed) | Demailly VIII.6.5; last step of the proof of VIII.6.9 | 6.5 assumes a smooth weight (demailly-agbook lines 18475–18477, p. 378); regularised weights `ρ_ε ⋆ φ ≥ φ` on exhausting domains, weak limit (lines 18561–18563, p. 379) | as now cited; previous C01 repaired |
| `hormanderL2_strict` (C7.1 (b)) | `ℂ`, `φ = c|z|²`, `g = dz̄`, every `c > 0`; one-tactic probe | `u = z̄`: `∫|z|²e^{−c|z|²} = π/c²`; right side `(1/c)(π/c) = π/c²`; `simp` makes no progress | sharp; signature unchanged, all binders kept |
| `dbarDistribution`, `hormanderL2`, `hormanderL2_leviNorm` | `z̄`, `z` on `ℂ` | `½(∂_x + i∂_y)(x − iy) = ½(1 + 1) = 1`; `½(1 + i·i) = 0` | unchanged since the previous head; normalisation holds |
| `ohsawaTakegoshi` (C7.7) | unit disc, `φ = 0`, `f = 1` | `F = 1`: `∫|F|² = π·vol(Ω′)`; bound `π/c_D(0)²·vol(Ω′)` with `c_D(0) = 1` | equality; unchanged since the previous head |
| `skodaDivision` (C7.6) | `p = 1`, so `q = 0` | `h = f/g`: `∫|h|²e^{−φ} = ∫|f|²|g|^{−2}e^{−φ} ≤ α/(α−1)` times itself | holds; unchanged |
| `strongOpenness` (C7.12) | `φ = c·log|z|²` on `ℂⁿ` | `e^{−φ} = |z|^{−2c}` integrable at `0` iff `c < n`; then `(1+ε)c < n` for small `ε` | holds; unchanged |
| `CurrentCalculus` (sample) | demailly-agbook I §2.D.3, I (3.20), III (1.21) | lines 818, 1095, 6761 hold the cited items | as cited; passage unchanged since the previous head |

- Earlier remarks: R01 repaired (README line 5508, "`φ ≤ φ_m ≤ sup…`", "with `φ(x) < φ_m(x)` wherever `φ(x) > −∞`"; Check at lines 5540–5545). C01 repaired (README lines 5031–5033 and the `hormanderL2_strict` docstring, "for smooth `φ`, and for plurisubharmonic `φ` by the regularisation of the route").
- The change since the previous head is 20 lines of the README and 4 of a docstring; every other added statement was computed at the previous head and is unchanged. Source locators checked against the text this round: 7 (demailly-analytic-methods Th. 14.2, Th. 14.12 and its proof at lines 7048–7095; demailly-agbook VIII.6.5, the proof of VIII.6.9, I §2.D.3, I (3.20), III (1.21)).
- Cross-roadmap citations: the change since the previous head adds none; SingularHermitianMetricsAndL2Methods cites this roadmap (116 lines) and this roadmap cites it nowhere. Its §7.3 (line 2032) still quotes C7.15 with the strict inequality at every point; that folder has a review of its own.
- Dependency check: `depcheck: 132 roadmaps, 1472 edges, 0 problem(s)`, no UPWARD or CYCLE line. No file outside the folders named in the pull request is changed.
- Automatic checks: all passed. `lake env lean` on `Suggested.lean` gives ten `sorry` warnings and nothing else; `#check @hormanderL2_strict` on a scratch copy agrees with C7.1 (b).
- Record: the README at the merge base has 8 layers; the head keeps every id and title, adds 33 headings (among them Layer C7) and removes none.
- Seeded sample: 13 of the 15 targets lie in text the change neither touches nor affects; `CurrentCalculus` and the adjacent `closedCurrentExtension` gained cross-references, and their locators are in the table.
- Pull request text: its sentences on this roadmap ("plurisubharmonic functions, L² estimates for ∂̄, regularisation"; strong openness in §C7.12; the suppliers ComplexHessianEquations and ComplexKahlerGeometry) agree with the head.

Overlap check: read SingularHermitianMetricsAndL2Methods (this head), ComplexKahlerGeometry and RealAnalyticGeometry (`main`). Plurisubharmonic functions, Lelong numbers, multiplier ideals and the `L²` theorems of C5.4a–C7.18 are owned here, SingularHermitianMetricsAndL2Methods citing them; RealAnalyticGeometry owns the smooth-weight theorem on complete Kähler manifolds (R3.1), which C7 cites; ComplexKahlerGeometry shares nothing. The other open pull request that changes this README edits *Needs:* lines of Layers C-1 to C6 only, which this change does not touch.

Source independence: changed passages only; 5 passages (the C7.15 statement, its Check, the C7.1 (b) citation, the convolution sentence of the route, the `hormanderL2_strict` docstring) compared with 2 sources (demailly-analytic-methods, demailly-agbook), none shared beyond the displayed inequality the theorem forces; largest share demailly-analytic-methods, about 21 of 67 citations in the added lines; contents compared with demailly-analytic-methods for the added Layer C7: independent (it draws on §§5, 13, 14, 15 out of the source's order, and on other sources for C7.1–C7.7, C7.12, C7.15a).

Research link: Layer C7 states the `L²` theory that work on multiplier ideals and positivity builds on: Hörmander 1965, Skoda 1972, Ohsawa–Takegoshi 1987 with Błocki's constant (2013), Nadel 1990, Demailly 1992, Siu 1974, Guan–Zhou 2015. It rests on the README's references and on *Analytic Methods*.

## Not verifiable

- Błocki–Kołodziej 2007 (C5.4j (a), (b)): the DOI resolves to the AMS journal page, a host I cannot certify.
- Błocki 2013 (C7.7), Fornæss–Narasimhan 1980 (C5.4d, C5.4j (c)), Hörmander's *Introduction* (C5.4e (j), C7.1 (a)) and Lazarsfeld I–II: paywalled.
- Demailly 1992, Proposition 3.7 (C7.15): not opened; I checked its counterpart, *Analytic Methods* Th. 14.12, instead.
- The description's sentence listing the declarations `Suggested.lean` receives is cut off after `hormanderL2_leviNorm` in the copy I was given, so I could not check whether it names the other six.

## Source issues

- **Misprint** in demailly-analytic-methods at Theorem 14.12 (a), p. 142: the source says the approximants are strictly larger than the function at every point; it should be larger or equal, strict only where the function is finite, since both are `−∞` where the Lelong number exceeds `n/m`; affects a stated result.

## For the human reviewers

- none
