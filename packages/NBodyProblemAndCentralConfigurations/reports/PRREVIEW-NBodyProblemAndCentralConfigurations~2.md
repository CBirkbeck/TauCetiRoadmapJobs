# Review of NBodyProblemAndCentralConfigurations (pull request #2951 at 2b18567)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement was recomputed (identities, proof routes, all numerical Checks, the Lean signatures against the README) and every source locator was read at its place; nothing false was found in a stated result. There are two small corrections (the total-mass hypothesis missing from three sentences of D.4; two redundant hypotheses in Layer 4) and three format notes, none blocking. Two points are left for the human reviewers (the kind of sources, and that Layer 4 rests on no cited proof).

## C01 — Three sentences of D.4 hold only when the total mass is not zero, and D.4 does not say so

The Conventions admit arbitrary real masses and the junk centre of mass `0` when `Σ mⱼ = 0`, and the Check of 3.4 uses exactly that case, so a reader takes D.4 at the same generality and is then told things the definition does not satisfy. With `IsCentralConfiguration` as defined: masses `1, −2, 1` at `−1, 0, 1` on a line have accelerations `−7/4, 0, 7/4`, so the configuration is central with `lam = −7/4` (centre of mass the junk value `0`); translated to `0, 1, 2` the accelerations are unchanged but `−lam·xⱼ` is `0, 7/4, 7/2`, so it is no longer central. Hence "Central configurations are closed under similarity" (line 141) fails for total mass `0`. Likewise the Check "`n = 2`: every collision-free configuration is central" (line 155) fails for masses `1, −1`, as the Check of 3.4 itself computes (line 519), and the Check for `n = 1` (line 153) uses `x₀ − c = 0`, which needs `m₀ ≠ 0`.

The smallest change: add "when the total mass is not zero" (or "for positive masses") to the similarity sentence and to the `n = 1` and `n = 2` Checks, and let the Conventions sentence on junk values name D.4 beside 3.1 and 3.2.

## C02 — In three statements of Layer 4 the hypotheses `0 < μ` and `μ < 1` follow from the other hypothesis

`triangular_spectrum_of_gt`, `triangular_spectrum_of_eq` and `not_isLyapunovStable_triangular` assume `0 < μ < 1` together with `27μ(1 − μ) > 1` (respectively `= 1`). The latter gives `μ(1 − μ) > 0`, which is `0 < μ < 1`. The two binders could be dropped from these three signatures, or kept for uniformity with `triangular_spectrum_of_lt` (where they are needed: `μ = −1` satisfies `27μ(1 − μ) < 1`); if kept, a clause in 4.2 saying they are implied would save an implementer the question.

## N01 — Four sentences report how the text was produced instead of stating mathematics

"both checked as polynomial identities for two bodies" (D.2, line 109), "No open source with complete proofs of the statements of this layer was found" (Layer 4, line 579), "were checked symbolically" (Check of 4.2, line 655) and "A grid check is not the proof" (Check of 4.3, line 689). The first Check of 4.2 thereby tests nothing a reader can evaluate; it would become a Check by giving one evaluated instance (for example `μ = ½`: `a = 3/4`, `b = 0`, `c = 9/4`, `k = 27/16`, characteristic polynomial `λ⁴ + λ² + 27/16`).

## N02 — One sentence of D.4 follows Moeckel's wording clause by clause

"Every acceleration points to the centre of mass and is proportional to the distance from it" (line 137) tracks Moeckel2014 lines 181–182 (longest shared run five words). It is a short forced statement, so not a finding; a rewording such as "each body is attracted to the centre of mass with strength `lam` times its displacement from it" would remove the resemblance.

## N03 — Two reference URLs redirect

The URL given for Moeckel's notes now resolves on the host `www-users.cse.umn.edu`, and the two pages given for Tong's notes resolve to `davidtong.org`. The texts are the same; the References could give the current addresses.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| D.2 Euler identity | general; masses 1,2,3 on equilateral side 2 | `Σ mⱼ⟨xⱼ,aⱼ⟩ = −½Σ_{i≠j} mᵢmⱼ/rᵢⱼ = −U`; `U = 11/2`, `I_c = 22/3`, `lam = 3/4`, `lam·I_c = 11/2` | true | none |
| D.2 `angularMomentumSq` | one body `x=(1,2,3)`, `v=(−2,0,5)`; basis formula | `‖x‖²=14`, `‖v‖²=29`, `⟨x,v⟩=13`, `|C|²=237`, `237+169=406`; `Σ_{a,b}C_ab² = 2|C|²` | true | none |
| D.2 link to Tau Ceti | `TauCeti.angularMomentum u w (q,p)` | pin: `⟪q,u⟫⟪p,w⟫ − ⟪q,w⟫⟪p,u⟫`; README sum is `Σ mⱼ` times this at `(xⱼ,vⱼ)` | agrees | none |
| D.3 circular two-body Check | `x₀ = ½(cos√2t, sin√2t)` | accel of body 0 `= −2x₀ = ẍ₀`; `T=½`, `U=1`, `H=−½`, `C=√2/2` | true | none |
| D.4 definition and Checks | `n=2` masses 2,5 at distance 5; `−a,0,a`; `0,1,3`; `M=0` | `7/125`; `5m/(4a³)`; `lam = 5/6` vs `−9/4`; masses 1,−2,1: central at `−1,0,1`, not at `0,1,2` | true for `M≠0` | C01 |
| D.5 conventions | Hamilton's equations; `Ω(L₄)`; `μ_R` | `ẍ−2ẏ = x+∂ₓV`, `ÿ+2ẋ = y+∂ᵧV`; `3/2 − μ(1−μ)/2`; `0.038521` | true | none |
| 1.1–1.3 conservation | `s={0,1}`; real masses | pair forces antisymmetric; `dT/dt = dU/dt = −Σ_{i<j}mᵢmⱼ⟨xᵢ−xⱼ,vᵢ−vⱼ⟩/r³` | true; `OrdConnected` needed | none |
| 2.1 Lagrange–Jacobi | general | `J' = Σm‖v‖² + Σm⟨x,a⟩ = 2T − U`; Volchan (6) with `I/2` | true | none |
| 2.2 negative energy | drift 3; `n=1`; masses 1,0 | `17/2 > 0`; `H=0`; `H=0`; route: `Ï ≥ 2m₀m₁/R` | true | none |
| 2.3 virial | free body; circular orbit | avg `T = ½‖v‖² = H ≠ −H`, `J` unbounded; `T=½=−H` | true | none |
| 2.4 Sundman | one body; `X = α + B` in `ℝ⁴`; masses 1,−1 | `406 = 406`; `16α²+8β² ≤ 16(α²+β²)`; `1 ≤ 0` fails; steps 1–5 rederived | true | none |
| 2.5 total collapse | `n=0,1`; masses 1,−1 Check | `Ψ' = İ(Ï − |C|²/I − 2H) ≤ 0`; `I=(1−t)²`, `C₁₂ = −1`; Volchan (19)→(20) needs `h ≥ 0` | true | none |
| 3.1 homothetic and converse | masses 1,−¼,1 at 0,1,2; `n=1` | accelerations `0,0,0`, centre `1`; `r'=|t|` not differentiable | true | none |
| 3.2 homographic | `z = e^(i√lam t)`, `lam = 2` | `a(c+z(x₀−c)) = (z/|z|³)a(x₀)`; `z̈ = −2z` | true | none |
| 3.3 variational | `n=1`; masses 1,1,0 | `dU = Σmⱼ⟨aⱼ,hⱼ⟩`; `lam = √2/2` vs `51/3001.25 = 204/12005` | true | none |
| 3.4 simplex | `n=0,1,2`; masses 1,−1 | identity `aⱼ+lam(xⱼ−c) = Σmᵢ(r⁻³−lam/M)(xᵢ−xⱼ)`; both sides hold for `n ≤ 2` | true | none |
| 3.5 Moulton | `n=2`; masses 1,2,3; masses 1,−½ | `3ρ⁵+7ρ⁴+5ρ³−11ρ²−13ρ−5` root `1.2809479`; reversed `0.7806719`; `I = −x₀²` | true | none |
| 4.1 five equilibria | `μ=½`; primaries | `∂ᵧΩ = y(1−A)`, `f' = 1+2(1−μ)/|s₁|³+2μ/|s₂|³ > 0`; junk zero at `(−μ,0)` excluded | true | none |
| 4.2 Routh trichotomy | general; `μ=½`; `μ=−1` | `a=3/4`, `c=9/4`, `b=±(3√3/4)(1−2μ)`, `k=(27/4)μ(1−μ)`; minor `= b+2λ` | true | C02 |
| 4.3 collinear eigenvalue | `μ=⅓, x=1/7`; `μ=½` | `s₁=10/21`, `s₂=−11/21`; `A₀=8`, `σ²−6σ−119`, `σ₊ = 3+√128`; `A₀>1` at `L₁,L₂,L₃` | true | none |
| 4.4 instability | localisation route | cited 5.3 needs `C¹` on `n → ℝ`, `fderiv = A`, eigenvalue `re > 0`; `g` satisfies all three | true | none |

- Source locators checked against the text: 28 (Moeckel 17, Montgomery 5, Volchan 3, Suzuki–Nakamura–Yamada 1, Tong 2); all found at the stated place with the stated hypotheses.
- Library declarations opened at the pin: 17 (for example `IsIntegralCurveOn`, `Mathlib/Analysis/ODE/Basic.lean:44`; `constant_of_derivWithin_zero`, `Mathlib/Analysis/Calculus/MeanValue.lean:366`; `ODE_solution_unique_of_mem_Icc_right`, `Mathlib/Analysis/ODE/ExistUnique.lean:194`; `TauCeti.angularMomentum`, `TauCeti/Geometry/Symplectic/Hamiltonian/CentralForce.lean:104`); all exist. No n-body, central-configuration or Lagrange-point declaration exists in the pinned Mathlib or Tau Ceti.
- Cross-roadmap citations resolved: LyapunovStabilityOfODEs 1.1, 1.2, 5.3 (open head; the two copied definitions are identical to that head's); SymplecticGeometry, IntegrableSystems §I4 (main); RestrictedThreeBody Lane B items 7–9 and its conventions (open head).
- Dependency check: `depcheck: 170 roadmaps, 1983 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates with 21 `sorry` warnings and nothing else; no `set_option`, no `lemma`, single `import Mathlib`. Elaborated types compared with the README statements: every theorem carries its hypotheses explicitly; five definitions do not mention the inner product instance, which they do not use.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `simp` with the definitions unfolded) on a copy: closes none of the 21 theorems.
- The pull request's title and description agree with the head (21 theorems, 16 definitions, one supplier).
- Overlap check: read RestrictedThreeBody, LyapunovStabilityOfODEs, IntegrableSystems (SymplecticGeometry); nothing shared: Lyapunov stability is owned by LyapunovStabilityOfODEs and copied by name, the restricted Hamiltonian by RestrictedThreeBody, the Kepler problem by SymplecticGeometry.

Source independence: 12 passages compared with 6 sources, none shared beyond one short sentence (N02); largest share Moeckel2014, 17 of 28 locators; contents compared with Moeckel2014 (15 sections): only Layer 3 draws on it (§§3, 8, 9, non-consecutive), Layers 1, 2 and 4 do not: independent.

Research link: Layer 3 is the base of the theory of central configurations whose Morse-theoretic and finiteness questions Moeckel (2014, §§10–15) surveys; Layer 2 is Sundman's total collapse theorem as in Volchan (2008) and the bounded-motion criterion of Montgomery (2014). Rests on the sources read.

## Not verifiable

- none

Automatic checks set aside as false positives: the scan for retired roadmap names flagged HamiltonianSystems in the scope section; the sentence names it as a neighbour this roadmap does not depend on, not as a supplier.

## Source issues

- **Gap** in Volchan2008 at Theorem 1, proof, eqs. (19)–(20), p. 9: the source says the energy term `h(I(t₂) − I(t₁))` is at most `h·I(t₂)`; it should be bounded by `|h|·I(t₁)`, since the stated bound needs `h ≥ 0`; affects the proof.
- **Gap** in Montgomery2014 at Corollary 1, p. 7: the source says a strictly convex moment of inertia is unbounded; it should use the uniform bound `Ï ≥ 2U ≥ const > 0`, since on a half-line strict convexity allows boundedness; affects the proof.
- **Misprint** in Moeckel2014 at Proposition 12, proof, p. 26: the source says the constraint set is `{I₀ = x}`; it should be `{I₀ = 1}`; affects nothing.

## For the human reviewers

- **Scope.** The sources are lecture notes on authors' pages (Moeckel2014, TongCosmology, TongDynamics) and arXiv articles (Montgomery2014, Volchan2008, SuzukiNakamuraYamada2020); the results are classical (Euler, Lagrange, Moulton, Sundman, Routh). No refereed monograph is cited.
- **Scope.** Layer 4 cites no source for its proofs (README line 579 says so); its only locator is TongDynamics §2.5.5, a statement of the five points. All routes there are the roadmap's own; they were recomputed in this review.
- **Licence.** Moeckel2014, TongCosmology and TongDynamics were read from the hosts the README's URLs redirect to (`www-users.cse.umn.edu`, `davidtong.org`), taken as the authors' own pages.
