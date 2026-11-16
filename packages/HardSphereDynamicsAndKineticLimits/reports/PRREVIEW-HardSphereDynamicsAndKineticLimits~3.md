# Review of HardSphereDynamicsAndKineticLimits (pull request #2448 at 5372027)

**Verdict:** accepted

## Previous findings

- The previous review, of this same head, was an acceptance with no finding; there is nothing to repair. The folder has 0 changed lines since it.

## Verified sound

| Statement | Instances tried | Values computed (roadmap / check) | Result | Change |
|---|---|---|---|---|
| §2.2 involution `Θ`, kernel, cross-section | §2.1 witness `v=(0,0.9)`, `w=(0.9,0)`, `ω=(1,0)`; d = 1, 2, 3 | kernel `0.9 → 0.9`; `∫_B⟨e,x⟩_+ = ω_{d−1}/(d+1)`; values `|k|`, `2|k|`, `π|k|` | holds | none |
| §3.1 `hardCoreSet`, packing | unit torus d=2, ε=0.4; unit circle ε=1.5, ε=1 | `1/(0.04π) = 7.96`, so 7 fit; thresholds `2/3` and `1`; `𝒟̄_2 = ∅` at ε=1 | holds | none |
| §3.2 contacts, normals, `∂^±` | torus ε=0.3, `π(0.1,0)`, `π(0.8,0)`; ordered pair swapped | lift `(0.3,0)`, `ν=(1,0)`; `⟨v_1−v_2,ν_12⟩ = ⟨v_2−v_1,ν_21⟩ = 1` | holds | none |
| §3.3 `contactScatter`, `reversal` (Lean bodies) | ε=1 outgoing `V=((1,0),0)`; ε ≤ 0; ε ≥ ρ | `σ_M V=(0,(1,0))`, `ℛ` gives `(0,(−1,0))`, again outgoing; normal 0 gives identity | involution for every real ε | none |
| §3.5 `P`, `H` | §2.1 witness; reversal of the outgoing state | `P=(0.9,0.9)`, `H=0.81` before and after; `ℛ`: `P=(1,0) → (−1,0)`, `H=½` | holds | none |
| §4.1 collision time | `a=(2,0)`; `(1,3)`; `(2,3)`; `(−2,1)` with `u=(−1,0)` or `(0,−1)` | `D = 1, 0, −3, 0`; `τ=1`, `⟨q,u⟩=−1=−√D`; larger root 3 | holds | none |
| §4.3–4.4 Jacobian | `a=(2,0)`, `u=(−1,0)`; d=1 rectangle `(2,3)×(−1,−½)`, `s=4` | `C=(0,(1,0))`; `det DC = (−1)(−1)(−3+4) = 1`; `B_4=(2−a−4u,−u)`, det 1, image in `a>1` | holds | none |
| §5.1 `IsTrajectory` | head-on witness; left-continuous variant; `N=1` | `𝒯={1}`, two velocity values off `{1}`; variant has `⟨v_1−v_2,ν⟩=−1` at time 1, fails (5) | determines the dynamics | none |
| `IsTrajectory.eqOn` | every real ε; `J=[0,1]∪[2,3]`; forward and backward from `t₀` | `σ_M` injective at fixed positions in all three ε-ranges; disconnected `J`: paths differ at 2 (0 against 5) | true as stated; `OrdConnected` needed | none |
| §6.1 near-triple bound; `volume_hardCoreSet_diff_goodSet` | `N=2`; d=2 shell; d=0; `N=2` constant of §6.3 | `I=∅`; shell `π(2η+η²)`; d=0: `𝒟̄_N=∅` for `N≥2`; `8(12π)²(π²/2)=576π⁴≈56108` | holds; step complement is `I` ∪ null | none |
| `flow_add`, `flow_reversal` | `Z∉G`; ε=−1, d=1; unit circle ε=½; head-on `t=3` | off `G` all maps fix `Z` and `ℛZ∉G`; ε=−1: positions `−2,0` both ways; `G=∅` at ε=ρ | hold for every real ε | none |
| `measurePreserving_flow` | `N=0,1`; torus d=2, ε=0.4, `N=8`; `E`, `N=2` | `𝒟̄_8=∅`, flow is identity; `λ(𝒟̄ᶜ)=∞`, flow is identity there | holds; carrier `G ∪ 𝒟̄ᶜ` | none |
| §7.3 conservation, Galilean covariance | grazing state `x_1=(2,1)`, boost `c=(1,0)` | `D=4−4=0`, state off `G`; `T_1` fixes it, formula would give `(3,1),(1,0)` | covariance only on `G`, as stated | none |
| §7.4 Koopman group | `N=d=1` circle; torus `N=8`; circle ε=⅓, `N=3`; `p=∞` | mass `1·∞`; `q_8=0`; `q_3=0`; `‖U_tf−f‖_∞=1` | holds for `p<∞`; no main owner covers infinite mass with a measurable action | none |
| §8.1 transport, duality | `N=1` on `E`, `t=1` | `W(1)((1,0),(1,0)) = W⁰(0,(1,0))` | sign as in Conventions | none |
| `weak_liouville` | d=1 box example; head-on `φ`; grazing state | `τ∈(0.9519,1.0521)`, `H∈(0.4802,0.5204)`, defect `−1` without specular condition; `χ(t)(2−t)` then `χ(t)t`; off `G`: `≤−5` against `−2` | true as stated (FTC on closed pieces, `𝒟̄∖G` null) | none |
| §8.3 marginals | torus `N=2`, `g⊗g·1_𝒟̄`; truncated Gaussian | first marginal factor `1−ω_dε^d`; `e^{−1.62}≈0.1979` against 0 | holds | none |
| §8.4 symmetric expectations | `(s,N)=(1,N)`, `(2,3)`, `(2,1)` | `N∫W`; `6∫W_3` (9 for all maps); `descFactorial 1 2 = 0` | holds | none |
| §9.2 invariant densities | `u≠0`; torus `N=8`; `E`, `N≥1` | `ΠM = (β/2π)^{dN/2}exp(−β(2H−2⟨u,P⟩+N|u|²)/2)`; `Z^{can}=0`; mass ∞ | holds | none |
| `grandCanonical_flow_invariant` | `μ=0`; `c=0`; `X=E`, d=1, `μ=c=β=1` | vacuum; `N=1` term `√(2π)·∞`, `Z=∞`, zero measure | true in all cases | none |
| `lintegral_sum_distinct_eq_correlation` | `μ=0`, `n=0` and `n≥1`; `Z=∞`; ε=0 Poisson, `μ=2`, `∫_Bf⁰=½` | `n=0`: both sides the total mass; `μ=0<n`: `0=0`; factorial moment `1=1` (2 for all pairs) | true as stated | none |
| §9.6, `boltzmannGrad_scaling` | d=3, ε=0.01; d=1; d=0 | `ω_3ε=0.0419`; d=1: `μ=1`, bounds `1−2ε‖ρ⁰‖ ≤ E[N] ≤ 1`; d=0: `E[N]=½`, bound `1−ε` fails for ε<½ | true; `1 ≤ d` needed | none |
| `tendsto_empirical_of_correlation` | `∫f⁰=∞`; `F_2→2f⊗f`; ε=0, `μ=2` | zero measure, trivially true; second moment `→ m²`; `Var=½=μ⁻¹∫f⁰` | true; mass 1 from `∫f⁰<∞`, `μ_ε>0` eventually | none |
| §10.4 `LanfordStatement` | d=0; d=1; Maxwellian; cover `π∘B`, quarter turn | d=0: `F_1=½` against `f=1`; BGSS2023 lines 119, 167–168, 316–321 read; `π(B(0.3,0))=π(0,0.3)` | for `d≥2` is BGSS2023 Theorem 1 with continuity added | none |
| `LanfordStatement.tendsto_empirical` | d=1 circle, `f⁰=M`, `h=1`, δ=½ | `μ_ε=1`, `P(N≠1)→1−e⁻¹≈0.632` | `2 ≤ d` needed and present | none |

- Source locators checked against the cached texts: 75 line ranges (GST2013 36, BGSS2023 27, DengHaniMa2024 12), covering every locator of the 15 sampled sections and of §6.4, §8.2, §9.5, §10.5; all hold. The README flags no locator as unverified.
- Library declarations opened at the pins: 64 Mathlib names by `#check` in a scratch file (no unknown identifier); 10 Tau Ceti names by file and line (`Probability/Distributions/Gaussian/Density.lean` 82, `Analysis/Semigroups/Group/Basic.lean` 74, `Probability/Process/EmpiricalMeasure.lean` 58, 75, 224, `Dynamics/Flow/OfLipschitz.lean` 59, `Algebra/Module/ZLattice/SuccessiveMinima.lean` 111, 424, 492).
- Cross-roadmap citations resolved: 7. ClassicalErgodicTheory §3.5 items 1, 3, 4 and §0.2 at its open head `e3c5108` (a new roadmap by another author; its README names the hard-sphere flow as a consumer, so no cycle); on main MathematicalBilliards §10.3, §10.5, §12.3, RandomMatrices §8.1, ProbabilisticAndMetricNumberTheory §4.9a.
- Gate: every check 0, OK. Dependency check: `depcheck: 258 roadmaps, 2463 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. No change outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives 11 `declaration uses sorry` warnings (lines 262–515) and nothing else. `#check @name` on the 11 theorems and 18 definitions: every theorem carries the five class binders its statement needs; `hardCoreSet` keeps only the norm, the three definitions of §9.3 only the norm and the measure, as the README says.
- Padding probe: each of the 11 theorems tried with `rfl`, `simp`, `infer_instance`, `simp_all` on a scratch copy; none closes. The 11 headlines listed in the module docstring are all stated; none is declared not statable.
- Pull-request text: title, summary block and prose agree with the head (a new roadmap, eleven sorried theorems, one open supplier, Lean importing only Mathlib).

Overlap check: read ClassicalErgodicTheory, PointProcesses, RelativisticQuantumFieldTheory, CompressibleEulerEquations, DimerModelsAndLozengeTilings, MathematicalBilliards, OptimalTransport, RandomMatrices; nothing shared. Conull flows are ClassicalErgodicTheory §3.5's, cited; unlabelled point processes and count-based correlation functions stay with PointProcesses and RandomMatrices §8.1; the normed, measured torus `E ⧸ L` has no other owner on main or at an open head.

Source independence: 75 passages compared with 3 sources (the text at every locator checked, and a scan of the README and the Lean file for six-word runs), none shared (the runs in common are titles, formulas and stock phrases such as "mild solution of the Boltzmann equation"); largest share GST2013, 30 of 65 line locators; contents compared with GST2013: independent (its Chapter 4 is spread over Layers 5–8, and Layers 1–4, 9 and 10 have no chapter counterpart). Alexander1976, Lanford1975 and the four background references were not read.

## Not verifiable

- Alexander1976 Proposition 4.3 (§6.4, `Suggested.lean` line 273): uncertified, not read; the locator rests on GST2013 line 855 and lines 5439–5440, which I checked.
- Lanford1975 as the fixed-`N` statement (§10.4): uncertified, not read; rests on BGSS2023 lines 313–315.
- The published versions of GST2013 and BGSS2023: numbering checked in arXiv v2 only.

## Source issues

- **Misprint** in GST2013 at (4.4.1), printed page 33 (line 1222): the source says the starred velocities are the pre-image under (4.1.1), the free-flow equations; it should be (4.1.2), the reflection law; affects nothing.

## For the human reviewers

- `HardSphere.LanfordStatement.tendsto_empirical` assumes `HardSphere.LanfordStatement d`; the roadmap assigned to prove that proposition (README lines 11 and 987) is neither on main nor among the open roadmap pull requests.
- BGSS2023 prints Theorem 1 without proof (line 322 refers elsewhere); GST2013 Theorem 8 (lines 2069–2080) prints convergence of velocity averages only. The uniform and almost-everywhere clauses of `LanfordStatement` rest on BGSS2023's wording (README line 947).
