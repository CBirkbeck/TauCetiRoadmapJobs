# Review of EigenvalueIterations (pull request #2816 at 9a98a8e)

**Verdict:** needs changes

**Summary.** Needs changes, for one sentence: a Check of 2.2 asserts that subspace iteration started from a subspace larger than the dominant one never converges to it, which is false for a singular operator (`diag(1, 0)`). Every stated theorem, formula and numerical value was recomputed and holds, all source locators hold, and `Suggested.lean` elaborates with `sorry` as its only warning and no statement closing in one tactic. There are two small corrections and two format notes, none blocking; two facts about the sources are left for the human reviewers.

## R01 (P2) — The second Check of 2.2 says that subspace iteration with `dim W > dim U` does not converge to `U`; for a singular `T` it does

A reader takes the sentence as a general fact about the roadmap's own objects, and it contradicts them. In the second Check of 2.2 (README line 261): "subspace iteration with more vectors than the dominant subspace has dimensions does not converge to it." Take `T = diag(1, 0)` on `𝕜²`, `α = 1`, `ρ = 0` (admissible, since `‖0‖ ≤ 0 · 1`) and `W = 𝕜²`. Then `U = dominantSubspace T 1` is the line of `e₁`, `dim W = 2 > 1 = dim U`, and `T W` is the line of `e₁`, so `Tᵏ W = U` and both the gap and the directed gap to `U` are `0` for every `k ≥ 1`. The first half of the Check is correct (`W` meets `U⊥`, `s(W) = 1`, and the inequality of 2.2 reads `0 ≤ ρᵏ √(1 − s(Tᵏ W)²)`).

The smallest change is to state the hypothesis under which the sentence is true: when `T` is injective on `W` (for instance when `T` is invertible), `dim Tᵏ W = dim W > dim U`, so `Tᵏ W` meets `U⊥` and `s(Tᵏ W) = 1` for every `k`. The example above would serve as the companion case where the dimension drops.

## C01 — `Suggested.lean` has five definitions, not four

The module docstring of `Suggested.lean` (lines 8–9) says the headline theorems are stated "together with the four definitions they need", and the pull-request description says "its 4 definitions have real bodies". The file declares five: `dominantSubspace`, `subdominantSubspace`, `rayleigh`, `rqiSeq` and `tanToEigenspace` (13 declarations, 8 theorems). Write "five" in both places.

## C02 — The convention on iterates claims scale invariance of every quantity, which 1.2 does not have

In Conventions, under Iterates (README line 85): "Every quantity in the statements is invariant under nonzero scaling, so a normalized iteration has the same angles and Rayleigh quotients." This is right for the tangents, gaps and Rayleigh quotients of 1.3 and Layers 2 and 3, but the quantity of 1.2 is the vector `λ⁻ᵏ Tᵏ v` and the norm `‖λ⁻ᵏ Tᵏ v − u‖`, which change when an iterate is rescaled; 1.2 fixes one particular scaling. Restricting the sentence to "the angles, gaps and Rayleigh quotients in the statements" (and saying that 1.2 uses the scaling by `λ⁻ᵏ`) would make it exact.

## N01 — "The sectioned numbering" is not explained

Scope and ownership cites "3.11 to 3.14 in the sectioned numbering" for SpectralSubspacePerturbation and "3.5 in the sectioned numbering" for MarkovChainsAndRenewal. The texts of those two roadmaps on main have only `SSP-C11`–`SSP-C14` and Layer 3 item 5; the section numbers exist only in their open revisions (where they do match). The main ids are cited alongside, so nothing breaks; a clause saying that the second numbering is that of the revised texts would spare a reader the search.

## N02 — A Check could pin the order of the inner product in `rayleigh`

`rayleigh T x = ⟪x, T x⟫ / ‖x‖²` and the plausible variant `⟪T x, x⟫ / ‖x‖²` agree for symmetric `T` and are conjugate in general. No Check separates them. One that does: for `T = i` on `ℂ` and `x = 1` the value is `i` (the variant gives `−i`, and 3.1 with `λ = i`, `c = 0` would then fail).

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 definitions and Checks | `[[2,1],[0,1]]`, `α=2`; Jordan block, `α=1` | `T(1,−1)=(1,−1)`; eigenspace variant gives line `e₁`, subdominant `0` | holds |
| 1.2 power iteration | `E=0`; `λ` not an eigenvalue; `r≤0`; `diag(2)⊕J`; `T=0, λ=0` | `u=0`, `V=⊤`, iff reads false↔false; error `(0,k2⁻ᵏ,2⁻ᵏ)`; `λ=0`: iterates `1,0,0,…`, no `u` works | holds; `λ≠0` needed |
| 1.3 subspace iteration | `V=0` (then `W=E`, gap `0`); `U=0`; `[[2,1],[0,1]]`, `W=⟨e₂⟩`; `T=0, α=0` | gaps `1, .7071, .3162, .1414` = `1/√((2ᵏ−1)²+1)`; `α=0`: gap `1` for `k≥1` | holds; `α>0` needed |
| 1.3 route | Jordan block at modulus `α` in `U` | `‖(αT_U⁻¹)ᵏ‖` polynomial, absorbed by strict `‖μ‖<rα` | holds |
| 2.1 tangent bound | `ρ<0`; `λ=0`; `k=0`; `diag(1,ρ)`, `v=(1,1)`; non-normal `[[1,1],[0,½]]` | `ρ<0` or `λ=0` force no `dᵢ≠λ`, both sides `0`; equality `ρᵏ=ρᵏ`; non-normal: `1` vs `½` | holds |
| 2.1 remark on the sine form | `diag(1,½)`, `x₀=(1,1)` | `sin θ₁=.447 > ½·.707=.354` | README right, source wrong |
| 2.2 tangent bound | `ρ<0`; `α≤0`; `s(W)=1`; `ρ=0`; `diag(2,1,½)`, `W=⟨e₁+e₂⟩` | `ρ<0` or `α≤0`: `U=E`, `0≤0`; `s=.7071,.4472,.2425,.1240`, tangents `2⁻ᵏ` | holds |
| 2.2 Check 2 | `diag(1,0)`, `α=1`, `W=𝕜²` | `TW=U`, gap `0` | last sentence false: R01 |
| 2.3 inverse step | `σ` an eigenvalue; `λ` not an eigenvalue; `δ≤‖λ−σ‖`; `diag(0,1)`, `σ=ε`; `δ=2`, `σ=½` | `y=0`, `0≤0`; `P=0`, `0≤0`; left `≤0`; `1=1`; `3` vs `1` | holds |
| 3.1 `rayleigh`, quadratic error | `x=0`; `c<0`; `diag(λ,λ+c)`; `[[0,1],[0,1]]`, `t=½` | `0≤0`; `c<0` forces `E=0`; `ct²`; `¾ > ¼` | holds |
| 3.2 Kato–Temple | `diag(0,1)`, `x=(1,½)`, `(−1,1)`, `(−1,2)`; `x=0`; `λ=R` | `R=1/5`, `ε²=4/25`, bound `1/5` attained; `1/5>4/45`, `−4/5<−2/15`; `x=0`: `0≤−1` | holds; `x≠0`, uniqueness needed |
| 3.3 Rayleigh quotient iteration | `Px₀=0`; shift `=λ`; `diag(0,1)`, `(1,½)`; `diag(0,1,3)`, `(1,.2,.2)` | `h₀` forces `Px₀≠0`, `δ>0`; `t=½,⅛,1/512,2⁻²⁷`; `t=.2828,.03630,5.362e−5` vs bounds `.1358, 2.87e−4` | holds |
| Layer 3 example | `diag(1,½)`, `v=(1,1)`, `k=1`; `Tᵏv=0` | `R=.9`, error `.1 ≤ .125`; `Tᵏv=0` gives left side `0` | holds |
| Lean signatures against README | all 13 elaborated types read | binders `FiniteDimensional`, `Fintype ι` present where used; `rayleigh`, `rqiSeq` need none | agree |

- Source locators checked against the text: 12 (Saad2011: Lemma 3.2, Theorem 3.8, Theorem 4.1, (4.2), p. 87 factor, (4.5), p. 90, Theorem 5.1 and proof; Arbenz2016: (7.21)–(7.23), Theorem 7.6, p. 141 identity, Theorem 7.14 and proof, Theorems 8.5, 8.6); all hold.
- Library declarations opened at the pin: 27 (Mathlib 17, Tau Ceti 10), each in the file the README names; for example `Module.End.independent_genEigenspace` (`Eigenspace/Basic.lean:692`), `Submodule.directedProjectionGap` (`Projection/Gap.lean:78`, `‖P_{V⊥} P_U‖`), `Submodule.principalSines_zero` (`Projection/PrincipalAngle.lean:346`).
- Cross-roadmap citations resolved: 9 (PrincipalAngles PA-C08, PA-C09; SpectralSubspacePerturbation SSP-C11–C14; VariationalMethods Layers 4, 6; IterativeMethodsForLinearSystems 1.2, 4.1; MarkovChainsAndRenewal Layer 3 item 5; MarkovChainMixing 2.3; ManifoldOptimization worked example and O5.2).
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; the roadmap has no roadmap supplier, only Mathlib and Tau Ceti.
- Elaboration of `TauCetiRoadmap/EigenvalueIterations/Suggested.lean`: 8 `sorry` warnings, nothing else. One-tactic probe (`simp`, `rfl`, `infer_instance`, `norm_num`, `positivity`) on a copy: all 8 theorems stay open. No padding.
- Headlines (1.2, 1.3, 2.1, 2.2, 2.3, 3.1, 3.2, 3.3): all stated in `Suggested.lean`; no fully qualified name clashes with another roadmap.
- No change outside the roadmap folder; the automatic checks all passed.

Overlap check: read SpectralSubspacePerturbation (main and its open revision), IterativeMethodsForLinearSystems, ConditioningAndPerturbation, ManifoldOptimization, PrincipalAngles, VariationalMethods; SpectralGraphBounds searched for the objects only; nothing shared (gaps: PrincipalAngles via Tau Ceti; angular operators: SpectralSubspacePerturbation via Tau Ceti; Bauer–Fike and simple-eigenvalue perturbation: ConditioningAndPerturbation, excluded here; Newton on the sphere: ManifoldOptimization, not restated).

Source independence: 9 passages compared with 2 sources, none shared; largest share Arbenz2016, 6 of 11 cited targets; contents compared with Arbenz2016 (Chs. 7–8, by method) and Saad2011 (Chs. 3–5): independent, the layers are by operator class.

Research link: classical numerical linear algebra: the Kato–Temple bound (Saad2011 Theorem 3.8) and Parlett's cubic convergence of Rayleigh quotient iteration (Saad2011 p. 90; Arbenz2016 Theorem 7.14), which Saad2011 Chs. 4–6 use for projection and Krylov methods. Rests on the sources read; no research article is cited.

## Not verifiable

- The description's claims about the author's numerical experiments (instance counts, 80-digit arithmetic) and prior-art survey: not reproducible from the files; the printed values were recomputed instead.

## Source issues

- **Error** in Arbenz2016 at Theorem 7.6, printed p. 133: the source says the sine of the angle decays by `|λ₂/λ₁|ᵏ` times the initial sine, and the eigenvalue error by the squared factor times the initial squared sine; it should be the tangent in both (`diag(1, 1/2)`, `x₀ = (1, 1)`: `0.447 > 0.354`, `0.1 > 0.0625`); affects nothing.
- **Misprint** in Arbenz2016 at Theorems 8.5 and 8.6, printed p. 149: the source says the hypothesis is `|λ_p| < |λ_{p+1}|`; it should be `|λ_p| > |λ_{p+1}|`; affects nothing.
- **Misprint** in Arbenz2016 at (7.32), printed p. 142: the source says the sum of `βᵢ²/|λᵢ − ρ_k|²` is at least `1/min|λᵢ − ρ_k|²`; it should be at most; affects nothing.
- **Misprint** in Saad2011 at the proof of Lemma 3.2, printed p. 62: the source says the last line is `‖r‖² + (β − λ̃)(λ̃ − α) ≥ 0`; it should be `‖r‖² − (β − λ̃)(λ̃ − α) ≥ 0`; affects nothing.

## For the human reviewers

- Scope: the two sources are a SIAM textbook (Saad2011) and unpublished ETH lecture notes (Arbenz2016, 6 of 11 cited targets); the README cites no research article; Kato, Temple, Parlett and Bauer are attributed without locators (README References).
- Licence: both texts were read from their authors' university pages (Saad at Minnesota, Arbenz at ETH); neither page states a licence. No passage or table is reused.
