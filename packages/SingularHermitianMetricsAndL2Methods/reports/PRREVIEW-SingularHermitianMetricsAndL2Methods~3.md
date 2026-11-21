# Review of SingularHermitianMetricsAndL2Methods (pull request #2884 at fb5186a)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/SingularHermitianMetricsAndL2Methods/`
**Verdict:** accepted

**Summary.** Accepted. The one finding of the previous round is repaired. 3.3(a) keeps its global claim that `X ∖ Z` is complete Kähler for every weakly pseudoconvex Kähler `X`, now states correctly how far Demailly 1982 goes, and proves the general case with a new route, which I checked step by step. Every one of the 28 new locators matches its source, and the continuous-ε forms added to 3.5, 8.1 and 8.2 are correct. There are three small corrections, none blocking (7.4 still cites Demailly 1992 as a whole paper, a remark in 3.3's route overstates a point, and two locators describe their sources' scope too broadly), no format notes, and the human reviewers' questions on provenance and licence still stand.

## C01 — 7.4's route, and 7.3 off the compact case, still cite Demailly 1992 as a whole paper

This is the remaining part of the previous round's request for theorem-level locators. All of that request is now met except this point. 7.3 now cites [AMAG] Th. 14.12 for compact `X`, but its statement allows a relatively compact `X′ ⋐ X` in a noncompact `X`. 7.4's route (line 1713) derives its statement from Demailly's estimate in the 1992 paper and gives no theorem or page. So an implementer looking for "that estimate" is sent to the whole paper. Would you name the theorem of Demailly 1992 that gives the approximation on `X′ ⋐ X`, and the result containing the Hessian estimate that 7.4 starts from? I could not read that paper, so I cannot supply the numbers.

## C02 — The remark that "no constant `A` serves on a noncompact `X`" (3.3's route, line 852) is stronger than intended

Read literally, the sentence says that on every noncompact `X` the glued function `|g|²` has no constant lower bound for `i∂∂̄log|g|²`. That is not so: for `X = ℂ`, `Z = {0}` and `|g|² = |z|²`, one has `i∂∂̄log|g|² = 0` off `0`, so `A = 0` works. The point the route needs is right: in general the gluing gives only a continuous `A`, which is why the scale of `|g|²` grows with `ψ`. "A constant `A` need not exist on a noncompact `X`" would say exactly that.

## C03 — Two new locators describe their sources more broadly than the sources do

- In 0.4(b) (lines 284–285), "for closed `γ`, Guedj and Zeriahi 2005, Proposition 1.7" omits that paper's standing hypothesis. Guedj and Zeriahi work throughout on a compact connected Kähler manifold, with `ω` closed and having continuous local potentials (GuedjZeriahi2005 lines 138–141, 150). The `X` of 0.4(b) is any compact connected complex manifold. "For closed `γ` on compact Kähler `X`" would be exact.
- In 2.2 (lines 552–553), the locator "[AMAG] Def. 1.10, p. 8" sits inside the parenthesis that introduces *neat*. AMAG Def. 1.10 defines analytic singularities (real `α ≥ 0` and `v` locally bounded) and does not use the word "neat". Moving the locator out of the parenthesis, to the end of the definition, would stop the term being attributed to it.

## Deferred findings

- D01 — stands

## Previous findings

- R01 — repaired: "Demailly 1982 proves (a) on the relatively compact sublevel sets of the exhaustion, and on `X` when the exhaustion is strictly plurisubharmonic outside a compact set … and the route below proves (a)". The new route with `ℓ = F(ψ) − log|g|²` is correct. The source-issue entry of the previous review is corrected below.
- C01 — partly repaired: locators now at 0.3, 0.4, 0.5, 1.2, 2.2, 2.3, 4.2, 6.6, 7.1, 7.2, 7.3 (compact case), 8.1–8.4, 9.3 and 9.5, for example "Nadel; [AMAG] Th. 5.11, p. 39". 7.4's route still cites Demailly 1992 as a whole paper (C01 above).
- C02 — repaired: "MultiplierIdealsOfPairsAndPointSeparation §9.10b (the multiplier ideal `J(X, Δ)` of a pair)"; neither Lean name remains.
- C03 — repaired: "the hermitian form on `T^{1,0}X ⊗ E` by which ComplexKahlerGeometry §6.1 (K6.0) defines Nakano positivity (the *Nakano form*)".
- C04 — repaired: "for the alternative route for `n ≥ 2` only, 4.1 (which does not use 1.2)"; at item level 4.1 needs only 0.1–0.3, 3.1 and 3.2.
- C05 — repaired: "for `ρ = (3/π)(1 − |w|²)²` it is `−(24/π)·d²∫f dλ + O(d³)`, from `∫Δf·|u|² = 4∫f`".
- C06 — repaired: 2.2 has "a real `c ≥ 0`"; 8.2 has "`iΘ_h(L) ≥ εω` for a continuous function `ε > 0` on `X` (for instance a constant)".
- C07 — repaired: the description no longer has the validation sentence; it says "`Suggested.lean` declares nothing: no headline is statable against the pinned Mathlib and Tau Ceti".
- C08 — not repaired: deferred (D01)

## Verified sound

| Statement | Instances tried | README side | Source or computation | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 3.3(a), new route | `X = ℂ`, `Z = {0}`, `ψ = |z|²` | `|g|² = |z|²`, `A = 0`, `F(t) = 2 + 2t`, `ℓ = 2 + 2|z|² − log|z|² ≥ 1 + |z|²` | `|d log ℓ| ~ 1/(r log(1/r))`; radial length `∫dr/(r log(1/r)) = ∞` near `0` | holds | — |
| 3.3(a), outside Demailly 1982 | `X = ℂ × E` (`E` an elliptic curve), `ψ = |z₁|²`, `Z = ℂ × {p}` | `X ∖ Z` complete Kähler `≥ ω` | Dem82 Prop. 1.6 needs `ψ` strictly psh off a compact set, which fails everywhere; the route needs no strictness, and `A` is constant since `E` is compact | holds | — |
| 3.3(a), inequality chain | general | `i∂∂̄(−log ℓ) ≥ −ω − (2F′/F)i∂∂̄ψ − (2F″/F)i∂ψ∧∂̄ψ + i∂logℓ∧∂̄logℓ` | `A/ℓ ≤ 1` from `ℓ ≥ A + 1`, `1/ℓ ≤ 2/F`; `χ₁′ = m̃ + ∫2F″/F` with increasing `m̃ ≥ 2F′/F` exists | holds | — |
| 3.3, "no constant `A`" remark | `X = ℂ`, `Z = {0}` | no constant `A` on noncompact `X` | `i∂∂̄log|z|² = 0` off `0`, so `A = 0` | overstatement | C02 |
| 8.1, constant ε (headline) | `X = ℂ`, `ω = i dz∧dz̄`, `φ = a|z|²`, `g = dz∧dz̄`, minimal `u = −z̄dz` | `(1/(qε))∫|g|²e^{−φ}dV = (1/a)·2π/a` | `∫|u|²e^{−φ}dV = 2·π/a² = 2π/a²`; `u ⊥ z^k dz` | holds, sharp | — |
| 3.5 and 8.1, continuous ε (new) | `ε ≥ 0.5` on the closure of `X_c`, `ε_m = 0.01` | `(ε − ε_m)^{−1} ≤ (1 + o(1))ε^{−1}` | `≤ ε^{−1}/(1 − 0.02) = 1.0204·ε^{−1}`; C1.4's bound is pointwise in `B^{−1}` | holds | — |
| 8.2, continuous ε (new) | `X = ℂ`, `φ = log(1 + |z|²)` | `ε = (1 + |z|²)^{−2}`, `inf ε = 0`: only the function form applies | `J(h) = O`, `H¹(ℂ, K) = 0` (Stein); AMAG Th. 5.11 has a continuous ε | holds | — |
| 2.2, real `c` | `φ = (1/√2)·log(|z₁|² + |z₂|²)` | `ν(φ, 0) = 2c·min ord = √2`; polar set `{0}` | `liminf φ/log|z| = 2/√2`; AMAG Def. 1.10 takes `α ∈ ℝ₊` | holds | — |
| 1.2, alternative route and its *Needs:* line | `u = ½·log|z₁|²` on `ℂ²` | `ν = 1 < 2`; `e^{−u}` integrable | on lines `t(1, v)`: `ν = 1`, `|t|^{−1}` integrable; only `(0,1)` is exceptional; 4.1 → 3.1, 3.2 → Layer 0 | holds, no cycle | — |
| 1.2, Skoda locator | Skoda Prop. 7.1 with `p = n − 1` | (a) `ν < 2`, (b) `ν ≥ 2n`: threshold ratio `n` | integrable if `ν < (1 − p/n)c`, not if `ν ≥ c`: ratio `n` | holds | — |
| 3.2a, Nakano form | `E = L` with weight `φ` | `θ_E(u) = Σφ_{jk̄}u_jū_k` | K6.0 on main defines Nakano positivity by this form on `T^{1,0} ⊗ E` | holds | — |
| 6.6, Guan–Zhou locator | `φ = c·log|z₁|² − C` on `Δ²`, `F = 1`, `c < 1` | `J(φ) = ⋃J((1 + ε)φ)` | Th. 1.1: negative psh, unit polydisc, weight `e^{−φ}`; `p = (1 + c)/(2c)` gives `pc < 1` | holds | — |
| 7.4, fifth Check | `ρ = (3/π)(1 − |w|²)²`, `r = √d` | `−(24/π)d²∫f + O(d³)` | `(3/π)[−8d²∫f + 16d³∫f|u|²]`, with `∫Δf|u|² = 4∫f` and `∫Δf|u|⁴ = 16∫f|u|²`; `∫ρ = 1` | holds | — |
| 7.1, locator with halved weight | `φ = 2φ_D` | `(1/m)log(C₂/r^{2n})`; `ν − 2n/m` | AMAG Th. 14.2: `(1/2m)log Σ`, loss `n/m`; doubling gives `C₂ = C₂′²` and `2n/m` | holds | — |
| 0.4(b), Guedj–Zeriahi locator | `u_a` on `ℙ¹` | `sup u ≤ mean + C` for closed `γ` | Prop. 1.7: `sup ϕ − C_µ ≤ ∫ϕ dµ` on compact Kähler `X` | holds; source narrower | C03 |
| 2.3, locator | `h = 1/|s|²` | `(i/2π)∂∂̄log|s|²_h = [div s] − c₁` | AMAG (3.11), with `dd^c = (i/π)∂∂̄` and `log‖σ‖ = ½log|σ|²` | holds | — |
| 9.5, locator | `O(1)` and `O` on `ℙ¹` | `O(1)`: `2πω_FS ≥ εω`, big; `O`: no such metric | degree `∫c₁ ≥ ε·vol/2π > 0` excludes `O`; AMAG Def. 6.16(d), Th. 6.17(b) | holds | — |
| 4.2, locator | `q = 0` | holomorphic sections of `K_X ⊗ L` on `Y` | AMAG Th. 13.6, `D″`-closed `(0,q)`-forms with values in `ΛⁿT*X ⊗ L` | holds | — |
| 9.3, locator | model weight `Σλ_j|w_j|²` | limit `∏λ_j/(π^n c)` or `0` | Berman Th. 1.1 with `q = 0`, on p. 3 of arXiv v1 | holds | — |

The rows of the previous review for statements the change does not touch stand as in that review, of 13a1d61.

- Source locators checked against the text: 28, which is every locator the diff adds (CADG 5, AMAG 15, Demailly1982 4, Skoda1972 1, GuedjZeriahi2005 1, GuanZhou2015 1, Berman2004 1).
- Library declarations: the change cites none, and `Suggested.lean` is unchanged.
- Cross-roadmap citations resolved:
  - ComplexKahlerGeometry K6.0 on main (README line 2202);
  - ComplexComparisonPartII C1.4 on main (line 874; pointwise `B^{−1}` bound);
  - MultiplierIdealsOfPairsAndPointSeparation §9.10b and §9.10c at its open head (lines 59 and 88);
  - RealAnalyticGeometry R3.1 on main.
  Every supplier except that sub-roadmap is on main.
- Dependency check: `depcheck: 171 roadmaps, 1992 edges, 0 problem(s)`; no UPWARD or CYCLE line. Within the roadmap, 1.2's alternative route leads to 4.1, then to 3.1 and 3.2, then to Layer 0, with no cycle.
- Elaboration: `lake env lean` of `Suggested.lean` exits 0 with no output. The file declares nothing, so the `#check` comparison and the padding probe had nothing to test.
- Automatic checks: the worker's run passed every check. My own run of the gate flagged the family index files and "not in order"; both are set aside below.

Overlap check: the scopes of HeightsForLogSingularMetrics, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, MultiplierIdealsOfPairsAndPointSeparation, ProjectiveModelsAndPeriodBoundsOnShimuraVarieties and RealAnalyticGeometry (open), and of ComplexHessianEquations, ComplexComparisonPartII and ComplexKahlerGeometry (main), were read in the previous round. This round re-checked the objects the change touches:
- Nakano positivity is owned by ComplexKahlerGeometry K6.0 and is now cited.
- Multiplier ideals of pairs and Nadel vanishing for pairs are owned by MultiplierIdealsOfPairsAndPointSeparation §§9.10b–9.10c and are cited.
- Complete Kähler metrics off analytic sets: a search of the open and main roadmaps found no other owner.

Nothing else is shared.

Source independence: changed passages only. I compared 32 passages with 7 sources: the 28 new locators, and the new routes and statements of 3.3(a), 8.1 and 8.2 against Demailly1982 pp. 462–465 and DemaillyAMAG pp. 34–41. None shares more than forced hypothesis lists. The largest share of in-text theorem locators is DemaillyAMAG, 14 of 23. No layer is added, removed or reordered, so the previous contents comparison (independent of CADG and AMAG) stands.

Research link: Layers 4, 6 and 8 hold the Ohsawa–Takegoshi theorem with Błocki's optimal constant (2013), Guan–Zhou's strong openness (2015) and Nadel vanishing (1990). Layer 9 holds the Bergman asymptotics of Tian (1990) and Berman (2004). 7.7–7.8 feed the arithmetic intersection theory of log-log singular metrics (HeightsForLogSingularMetrics). This rests on the README's References and Downstream consumers.

## Not verifiable

- Demailly 1992 (*Regularization of closed positive currents*; 7.3, 7.4, 7.7): no legal copy found. AMAG Th. 14.12 was used for 7.3 on compact `X`.
- Błocki 2013 (4.1, 4.3): no legal copy found.
- Demailly 2000 (*On the Ohsawa–Takegoshi–Manivel L² extension theorem*): no copy found. AMAG Th. 13.6 was used for 4.2.
- Siu 1974: paywalled (recorded uncertified). AMAG Cor. 14.3 was used for 7.2.
- Ma–Marinescu 2007, chapter 6 (9.4, 9.6) and Lazarsfeld, *Positivity II*, chapter 9 (6.3): paywalled books, not opened.
- [FormalProof] repository: its host is not a recognised legal source; not opened.

Automatic checks set aside as false positives:
- The check for files outside the roadmap folder listed the family index (`README.md`, `Suggested.lean` and `metadata.toml` of the family folder), which this pull request carries as its own.
- The dependency check reported that the roadmap is not yet in the merge order. That is expected for a new roadmap; it is placed after its last supplier.

## Source issues

- **Gap** in DemaillyAMAG at Remark 5.17, p. 41: the source says, citing Demailly 1982, that complements of proper analytic subsets in weakly pseudoconvex Kähler spaces are complete Kähler; that paper proves it only on sublevel sets, or compact or Stein X; it should be a citation of a proof of the general case; for manifolds the statement holds, by a weight whose scale grows with the exhaustion (the route of 3.3(a)); affects the proof.

## For the human reviewers

- Provenance: the family index and the References cite a formal proof of the Riemann hypothesis announced on 20 November 2026. The announcement (4 pages) contains no mathematics. Two passages rest on that proof, which could not be opened: 7.8 "in this form" and the second route of 7.7.
- Licence: the host of the cited repository could not be classified, and its licence was not read. The announcement points to archive parts on the author's site, not to that repository (README References, [FormalProof]).
