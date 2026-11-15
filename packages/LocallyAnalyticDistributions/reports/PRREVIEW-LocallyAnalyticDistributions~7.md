# Review of LocallyAnalyticDistributions (pull request #854 at 87685e1)

**Verdict:** accepted

## Previous findings

- R01 — repaired: `TauCetiRoadmap/LocallyAnalyticDistributions/README.md:99` cites §§2.7–2.8 and describes the supplied character space, strong dual and scalar Mellin map mathematically; §3.3 uses the same interfaces, with `distributionMellin(μ)=M_G^b(i_G(μ))`.
- R02 — repaired: `TauCetiRoadmap/LocallyAnalyticDistributions/README.md:1083` allows complete nontrivially valued nonarchimedean fields; the eight other revised hypothesis blocks retain only the coefficient-field and, where used, compact-manifold assumptions.
- R03 — repaired: the description and `roadmap-summary` block now credit PadicFunctionalAnalysis with the stages and Amice bijection, and CompactOperators with Fredholm theory and spectral mapping.
- R04 — repaired: the description lists all four Coram suppliers as roadmaps on main and removes SchemeAndStackFoundations from its supplier list.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §0.2 field hypotheses; Hahn–Banach | `K=𝔽₂((t))`, `U=K×0⊂K²`, coordinate functional | Extension `(x,y)↦x`; both operator norms `1`; zero functional extends with both norms `0`. | Pass | Equal characteristic admitted |
| §0.2 Fréchet open mapping | Projection `K²→K`; identity on zero | Projection sends the open unit ball onto the open unit ball; zero-space map sends `{0}` onto `{0}`. | Pass | Broader explicit field hypotheses retained |
| §0.3 chart and tensor hypotheses | Point, empty chart, `x²⊗y³` | Point coefficients give `K→K`; empty coefficients give `0→0`; product coefficient at `(2,3)` is `1` on both sides. | Pass | Irrelevant algebra/slopes removed |
| §1.3 pushforward and multiplication hypotheses | `K=ℚ₃`, `f(x)=1+3x`, test `y²`, mass `δ₁` | Pullback `1+6x+9x²`; evaluation at `1` is `16=f(1)²`; multiplication by `x` gives `1·δ₁`. | Pass | Compact `X,Y` retained |
| §1.4 derivative and φ/ψ hypotheses | `p=2`, `dδ₀`, `δ₁` | Transpose derivative on `x` is `1`; coefficient of `T` in `log(1+T)` is `1`; `ψφδ₁=δ₁`, `φψδ₁=0`. | Pass | Field hypothesis retained |
| §1.4 restriction formula | `p=2`, odd residue class, `μ=δ₁` | Fourier average `((1+T)−(−1−T))/2=1+T`, equal to the restricted mass transform. | Pass | Character extension retained |
| §1.5 primitive and logarithm hypotheses | `K=ℚ₂`, function `x`; `dδ₀` | Primitive `x²/2` differentiates to `x`; logarithm coefficients at `1,2` are `1,−1/2`, matching transposed moments. | Pass | Characteristic zero retained |
| §2.2 tensor hypotheses | `p=2`, `r=(1/2,0)`, `f=1⊗1_(2ℤ₂)`; empty product | Tensor contains `f`; joint-difference valuation at `(m,0)` is `0`, giving `−m/2`; empty tensor and point functions both equal `K`. | Pass | Tensor correction preserved |
| §2.2 rectangular growth | Haar functional, depths `(1,2)` at `p=2`; point mass | Haar mass `1/8`, norm `8=2³`; point-mass box values `0,1`, bounded by `1`. | Pass | No manifold/algebra hypothesis needed |
| §2.3 critical-order hypotheses | `N=0`, `r=1`, `dδ₀`; polynomial `x` | On locally constant tests: `0`; on `x`: `1`; the strict uniqueness condition `1<1` fails. | Pass | Strict endpoint preserved |
| §3.3 geometric adapter, line 2013 | `G=ℤ₂ˣ`; `Δ=C₃`, `K=ℚ₂` | Sign evaluations on `−1`: `1,−1`; `ℚ₂[C₃]≃ℚ₂×ℚ₂(ζ₃)`, dimensions `3=1+2`; splitting gives three components. | Pass | Supplier §2.7 resolved |
| Same, coordinate pullback | `p=2`, homomorphisms `z↦2z` and `z↦0` | Weight coordinate pulls back to `2T+T²` and `0`, respectively; character evaluation gives `(1+T)²−1` and `1−1`. | Pass | Supplier notation replaced |
| §3.3 distribution adapter, line 2025 | `μ=δ_(-1,2)` on `C₂×ℤ₂`, sign component | Series `−(1+T)²`; coefficients `−1,−2,−1`; moments `−binom(2,n)` give the same values. | Pass | Identity-on-tests map retained |
| §3.3 Fréchet algebra adapter, line 2035 | `δ₁*δ₁` on `ℤ₂`; trivial group, mass `c` | Both transforms equal `1+2T+T²`; on the trivial group both maps send `c` to `c`, with norm `‖c‖`. | Pass | Strong/projective comparison retained |
| §2.8 supplier contract, line 99 | `Γ=ℤ₂`, `A=ℚ₂[ε]/(ε²)` | Constant distribution `ε·δ₀` maps to constant section `ε`; squares are `0` on both sides. | Pass | Relative ring cited at §2.8 |
| §3.4 comparison and clearing hypotheses | `δ_(-1)` at `p=2`; `λ=δ₀`, clearing denominator `T` | Rigid and adic component values are `1,−1`; numerator `T` gives `T/T=1` for `T≠0`, extending to `1`. | Pass | Finite-field hypothesis retained |

Rows for untouched statements stand as in the previous review, of `473fb50`.

- Scope: 44 changed lines, all in `TauCetiRoadmap/LocallyAnalyticDistributions/README.md`; no changes outside this folder against the PR merge base; title and description checked against the added folder and all four repairs.
- Sources: 8 texts opened; checked the affected hypotheses and adapters against schneider lines 2074, 2181, 2227; schneider-teitelbaum-duality lines 110–139; schneider-teitelbaum lines 105–139, 256–320; colmez lines 1179, 1840–1898; loeffler lines 118–250; colmez-niziol lines 2876–2952; kohlhaase lines 849–886; rjw lines 1453–1465, 1492–1522, 1974–2013.
- Library: 3 declarations opened at the pins: `MvPowerSeries.coeff`, `Mathlib/RingTheory/MvPowerSeries/Basic.lean:137`; `AbstractMeasure.amiceTransform`, `Mathlib/NumberTheory/Padics/Measure/AmiceTransform.lean:78`; `mellin`, `Mathlib/Analysis/MellinTransform.lean:91` (real-domain integration, a different object).
- Citations: revised PhiGammaModulesAndIwasawaCohomology contract resolved against #1310, `TauCetiRoadmap/PhiGammaModulesAndIwasawaCohomology/README.md:1256` and `:1319`; compact-manifold comparison checked against PadicLocalLanglandsForGL2Qp §0.1; citation resolver reports zero unresolved roadmap citations. Dependency output: `depcheck: 245 roadmaps, 2213 edges, 0 problem(s)`; no UPWARD or CYCLE.
- Gate: every scanner zero, `OK`; worker gate also reports `build=0`. Fresh targeted build succeeds; fresh direct elaboration gives only four `sorry` warnings. Lake additionally emits its advisory about importing Mathlib without `module`.
- Signatures: all 8 declarations checked with `#check @name` in one scratch elaboration; no lost binders or changed signatures. The four headline statements and the docstring's unavailable-carrier list remain as reviewed at `473fb50`.
- Overlap check: read PadicFunctionalAnalysis (main, #1807, #1808), CompactOperators, RestrictedPowerSeries, PadicDifferentialEquationsAndRigidCohomology, LocallyAnalyticDistributionsPartII and PadicFamilies. Owners: analytic stages/Amice bijection—PadicFunctionalAnalysis; Fredholm operators—CompactOperators; series algebra—RestrictedPowerSeries; manifold strong duals—PadicLocalLanglandsForGL2Qp; compact abelian Mellin—PhiGammaModulesAndIwasawaCohomology; general locally convex calculus and distribution-growth comparisons—this roadmap; eigenvariety spaces—PadicFamilies. No new duplicate ownership in the changed passages.
- Source independence: changed passages only; 12 changed mathematical passages compared with 8 sources, no copied expression or reused source material identified. Largest share: Colmez, 27 of 176 source–paragraph citation groups. No layer was added, removed or reordered; the previous arrangement check stands.

## Not verifiable

- None within the changed passages. Kohlhaase's Corollary 4.3 and proof of Theorem 4.4 are now readable through OCR.

## Source issues

- **Misprint** in loeffler at Theorem 2.9, printed p. 4, line 170: the source says the extension restricts to locally constant functions on ℤ_p; it should be locally constant functions on G; affects a stated result.
- **Error** in loeffler at Definition 2.12 and Remark 2.13, printed pp. 4–5, lines 200–231: the source says the simultaneous cofinite oscillation space equals the completed tensor product; it should use the tensor-wavelet space, which contains `1⊗1_(pℤ_p)`; affects a stated result.

## For the human reviewers

- none
