# Review of MinimalSurfaces (pull request #2491 at cd32a39)
Folder: `TauCetiRoadmap/RiemannianGeometry/MinimalSurfaces/`
**Verdict:** accepted

**Summary.** Accepted. This head repairs the one finding of the previous review. The Reduction of 7.8 now assumes `c₀ ≥ 0`, which costs no generality: a bound `|A|² + Ric(ν,ν) ≤ c₀ w⁻²` with negative `c₀` implies the same bound with `c₀ = 0`. The four small corrections and the format note are repaired as well. The two new Chodosh locators match the text, the "without boundary" convention matches Simon's, and the repairs introduce no new problem. There are no small corrections or format notes this round. The four facts for the human reviewers from the previous review still stand.

## Previous findings

- R01 — repaired: "If `|A|² + Ric_g(ν,ν) ≤ c₀ w⁻²` on Σ for some `c₀ ≥ 0`, then Σ is strictly stable with weight w iff there is `λ > 0`" (README lines 1703–1704).
- C01 — repaired: "a smooth embedded two-sided hypersurface without boundary, not necessarily closed in U" and "near which `Σ̄` is a smooth embedded hypersurface without boundary lies in Σ" (README lines 1665–1669).
- C02 — repaired: "and stable iff `λ₁ + ((n−2)/2)² ≥ 0` [Chodosh, Proposition 26.1, p. 64]" (README lines 1713–1714). The same locator is added to the sources line of 7.8 (line 1663).
- C03 — repaired: "*Sources:* [Simons]; [CM, §1.8]; [Chodosh, Theorem 23.2, p. 60], for the index form." (README line 1188).
- C04 — repaired: the description now reads "beside the stability theory it uses", "a positive multiple of `∫(|∇ζ|² + w⁻²ζ²)`" and "the lowest eigenvalue of `−Δ_Γ − |A_Γ|²` on the link".
- N01 — repaired: the docstring's list of headlines that are not statable at the pins (`Suggested.lean` lines 20–40) no longer names 7.8. This matches the README summary, which does not name 7.8 either.

## Verified sound

| Statement | Instance | Roadmap side | Computed side | Result |
|---|---|---|---|---|
| 7.8 Reduction, `c₀ ≥ 0` (R01's case) | totally geodesic `ℍ² ⊂ ℍ³`, `w ≡ 1` | `c₀ = −2` now excluded; `c₀ = 0` admissible, `λ = 2`: `κ = ½ min(2, 1) = ½` | `Q = ∫|∇ζ|² + 2∫ζ²`; `Q − ½∫(|∇ζ|²+ζ²) = ½∫|∇ζ|² + (3/2)∫ζ² ≥ 0` | holds |
| 7.8 Reduction, generality | any Σ, w with a bound for `c₀ < 0` | hypothesis needs `c₀ ≥ 0` | `c₀w⁻² ≤ 0 = 0·w⁻²`, so `c₀ = 0` also bounds; no case lost | holds |
| 7.8 Reduction, route | any ζ, `c₀ ≥ 0`, `λ > 0` | `∫|∇ζ|² ≤ Q + c₀∫w⁻²ζ² ≤ (1+c₀/λ)Q` | second step multiplies `Q ≥ λ∫w⁻²ζ²` by `c₀/λ ≥ 0`; averaging gives κ | holds |
| 7.8 Reduction, Simons cone | n = 7, `c₀ = max|A_Γ|² = 6`, `λ = λ₁ + 25/4 = 1/4` | `κ = ½ min(λ, (1+c₀/λ)⁻¹)` | `½ min(1/4, 1/25) = 1/50 > 0` | holds |
| 7.8 Reduction, great sphere | hyperplane `ℝ³ ⊂ ℝ⁴`, n = 3, `c₀ = 0`, `λ = 1/4` | `κ = ½ min(1/4, 1) = 1/8` | Hardy gives the optimal `κ = (1/4)/(5/4) = 1/5 ≥ 1/8` | holds, not sharp |
| 7.8 without-boundary convention | half-plane `{x₃ = 0, x₂ > 0} ⊂ ℝ³`, weight `|x₂|` | `sing Σ` = line `{x₂ = x₃ = 0}` | near the line `Σ̄` is a closed half-plane, which has boundary; ζ ≠ 0 on line: `∫_0 x₂⁻² dx₂ = ∞` | holds; Check consistent |
| 7.8 convention against source | Simon23 line 73–83 (p. 3) | hypersurface without boundary, `reg = Σ` | open parameter domains `V ⊂ ℝ^N`; `reg M = M`, `sing M = (U ∩ M̄) ∖ M` | matches |
| 7.8 Reduction locator | Simon23 line 864–895, 4.12 (pp. 21–22) | constant `c₀ ≥ 0` | Simon's bound `|A_S|² ≤ C r̃⁻²` has `C ≥ 0`; page header 22 at line 896 | matches |
| 7.8 cone criterion, stable half | Chodosh line 2840–2841, p. 64 (header line 2821) | `λ₁ + ((n−2)/2)² ≥ 0`, Γ ⊂ Sⁿ, C ⊂ ℝ^(n+1) | `λ₀(−Δ_Σ−|A|²) ≥ −(n−2)²/4`, `Σ^(n−1) ⊂ Sⁿ`; same n | matches |
| 7.8 cone criterion, `C_(1,1)` | Clifford torus in S³, n = 3 | not stable | `|A_Γ|² = 2`, `λ₁ = −2 < −1/4`; both sides `−7/4 < 0` | holds |
| 7.8 test-function class | vertex cutoff `η_ε`, n ≥ 3 | `C^∞_c(ℝ^(n+1))` | Chodosh uses C∖{0}; `∫|∇η_ε|²ζ² ≲ ε^(n−2) → 0`, `∫_(B_2ε)|A|²ζ² ≲ ε^(n−2) → 0` | same notion |
| 7.8 cone, minimality | Γ not minimal | criterion stated without minimality | `|A_C|²(tω) = t⁻²|A_Γ|²(ω)` and `dr² + r²g_Γ` hold for any cone; proof unchanged | holds |
| 6.1 index form locator | Chodosh line 2663–2668, p. 60 (headers 60, 61 at lines 2612, 2682) | three terms of Q | `|(DX)^⊥|²`, `|X·A|²`, `tr R(X,·,·,X)` match `|∇^⊥V|²`, the 𝒜-term and the ℛ-term | matches |
| 6.1 index form, sign | `S²_eq ⊂ S³`, `X = φν` | `−J = −Δ − 2` | `tr R(φν,e_i,e_i,φν) = 2φ²`, `A = 0`: `∫|∇φ|² − 2φ²` | holds |
| Docstring against README summary | `Suggested.lean` lines 20–40; README lines 3–17 | 7.8 not a headline | neither names 7.8; statable list 4.2, 5.1, 7.5, 7.6, 10.3 on both | consistent |
| Description against head | "`Suggested.lean` is unchanged" | unchanged against main | the diff against main touches only `README.md` (104 insertions, 5 deletions) | true |

Rows for the statements this change leaves untouched stand as in the previous review, of 89b898c.

- Source locators read against the text: 5. They are Chodosh Theorem 23.2 (p. 60) and Proposition 26.1 (p. 64, cited twice), Simon23 p. 3, and Simon23 4.12 (pp. 21–22). The Chodosh notes were fetched from the author's page, version of 15 September 2025, the one the README cites.
- Lean: the change removes four docstring lines and no declaration. `#check @` of all seven declarations elaborates without error, with the types that the previous review compared with the README. No binder was lost.
- Cross-roadmap citations resolved: RiemannianGeometry R5a.2 on main (line 3399, the minimal-cone equivalence), and Varifolds 9.4 on main (line 2114), which leaves strict stability to RiemannianGeometry. This pull request does not change the parent README.
- Automatic checks: the gate run on this head reports 0 for every check (OK). The dependency check printed `depcheck: 214 roadmaps, 2297 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 5 `sorry` warnings and nothing else.
- Padding probe: the declarations are unchanged, so the previous result stands.
- Nothing outside the folder changes against the base.

Overlap check: the scope of GeometricCurrents, LorentzianGeometry, PDE, HeegaardFloer and ManifoldOptimization (open) and of RiemannianGeometry, Surfaces and PositiveMass (main) was read in the previous review. The change adds no object. This round, a search of main and of every open head by object found the following owners:
- Strict stability: this roadmap alone. Varifolds 9.4 on main defers it.
- The eigenvalue criterion for stable cones: this roadmap alone, in 7.8.
- The minimizing Simons cone and the classification of stable minimizing cones: GeometricCurrents G6–G7, on main and in its open revision. In 7.8 the Simons cone is only a Check.
- The minimal-cone equivalence: RiemannianGeometry R5a.2, which 7.8 cites.
- The half-line Hardy inequality: UnboundedOperators UO-D07, which 7.8 says it does not consume.

No open pull request changes this roadmap or drops an id it cites.

Source independence: changed passages only. 4 passages were compared with 2 sources:
- the convention of 7.8, against Simon23 line 73–83;
- the Reduction, against Simon23 line 864–895;
- the cone criterion, against Chodosh line 2840–2894;
- the 6.1 index form, against Chodosh line 2652–2668.

They share nothing beyond formulas and the standard term "smooth embedded hypersurface". The Reduction averages where Simon absorbs with θ, and the cone route expands in eigenfunctions where Chodosh substitutes `t = log r`. No layer was added, removed or reordered, so the comparison of contents stands as in the previous review. The largest share is Chodosh, 59 locators (57 at 89b898c), and the layers are independent of its contents.

Research link: 7.8 is Simon's strict stability (Simon21, Theorem 1.10, 2021; Simon23, Theorem 1.1, 2023), which he uses to build strictly stable minimal hypersurfaces whose singular set is an arbitrary closed `{0}×{0}×K`. Layers 9–12 lead to the Choi–Schoen compactness theorem (1985), and 7.4–7.5 to Schoen's curvature estimate (1983). This rests on the README and on Simon21 and Simon23, which were read.

## Not verifiable

- [Simons] (Annals 1968, JSTOR, paywalled) and [CM, §1.8] (AMS GSM 121, no legal copy) in the unchanged part of the sources line of 6.1, as in the previous review.

## Source issues

- none

## For the human reviewers

- Licence: [Chodosh] was fetched from the author's Stanford page (web.stanford.edu/~ochodosh, Math286-min-surf.pdf). The sources service does not know this host, so it was classified as author-page.
- Scope: the route of 7.4 follows [Lynch], an unrefereed preprint (arXiv:2611.12758v1, 2026; README lines 376, 1527). The theorem that route serves, 7.5, is Schoen's published estimate.
- Scope: no item of this roadmap consumes 7.8; it is mentioned only in the scope section (README lines 52, 112), in the guide to the build (line 388) and in the Dependencies of Layer 7 (line 1763). The uses its sources name are Simon's (Simon21 Theorem 1.10, Simon23 Theorem 1.1).
- Not tested: [CM] has the second-largest share of locators (about 30) and no legal copy, so parts 1 and 2 were not checked against it.
