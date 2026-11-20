# Review of OptimalControlAndHamiltonJacobi (pull request #2733 at 3145b94)

**Verdict:** needs changes

**Summary.** Changes are needed for one reason: the existence, uniqueness and continuous-dependence theorem for trajectories (1.2 and the first estimate of 1.3) is the nonlinear Carathéodory theorem that DiracScatteringAndNonlinearFourierTransform §1.7, on main, already owns, and the README says it is in no library and plans it again. Every other statement, Check and worked example was recomputed and holds, every locator in the three sources was read and is right, and `Suggested.lean` elaborates with `sorry` as its only warning. There is one small correction and one format note, neither blocking; the human reviewers are asked to look at the fact that all three located sources are lecture notes.

## R01 (P2) — The trajectory theorem of 1.2 and the first estimate of 1.3 are a case of the nonlinear Carathéodory theorem that DiracScatteringAndNonlinearFourierTransform §1.7 owns on main, and the scope section says no one has it

An implementer of Layer 1 would build a second Picard iteration for equations measurable in time, beside the one a roadmap on main already plans in a Banach space, and the two would have to be reconciled later. The scope section, lines 614–619, says "The nonlinear existence theorem of 1.2 follows the route of the first; it is not in the libraries", and 1.2 ends "(Proved here, following the route of the cited Tau Ceti theorem.)"; the survey behind it looked at the pinned libraries and not at this roadmap.

`TauCetiRoadmap/DiracScatteringAndNonlinearFourierTransform/README.md` on main, §1.7 (line 692, owned at line 44 of its scope; the section is unchanged at the head of its open revision): for `F : ℝ × E → E` with `t ↦ F(t, x)` strongly measurable, `‖F(t, x) − F(t, y)‖ ≤ L(t)‖x − y‖` and `‖F(t, x₀)‖ ≤ m(t)`, `L` and `m` locally integrable, it proves a continuous solution of `Y(t) = x₀ + ∫ F(s, Y(s)) ds` on the interval, its uniqueness, and the bound `‖x₀ − x₀′‖ exp|∫ L|` between solutions from two initial values. With `F(s, y) = f(y, α s)`, `L = K` and `m = max_{u ∈ U} ‖f(x, u)‖` (finite, `U` compact and `f(x, ·)` continuous) the hypotheses hold, since `s ↦ f(y, α s)` is a continuous function of a measurable one; the conclusions are the trajectory of 1.2, its uniqueness, and `‖y s − y' s‖ ≤ e^(K (s − t)) ‖x − x'‖` of 1.3. Its Check with `2√|x|` is the second Check of 1.2.

The smallest change: in 1.2 and 1.3 replace the Picard route by this reduction and put `DiracScatteringAndNonlinearFourierTransform §1.7` on the two *Needs:* lines; keep `ControlProblem.exists_isAdmissiblePair` and `ControlProblem.eqOn_of_isAdmissiblePair` as the statements on admissible pairs, saying in a clause what they add (the integrability of `L(y, α)` along the trajectory, and uniqueness from the Lipschitz bound and the integrability clauses alone, without the measurability and growth hypotheses of §1.7); correct the scope sentence to name §1.7 as the owner of the general theorem; add a `### From TauCetiRoadmap.DiracScatteringAndNonlinearFourierTransform` contract; and name that roadmap among the suppliers in the pull request's description, whose paragraph on suppliers lists Mathlib and Tau Ceti only. The second estimate of 1.3, `‖y s − x‖ ≤ M (s − t)`, is not in §1.7 and stays.

## C01 — The first Check of 5.1 needs `U` nonempty

In the Check that `t ≤ T` is needed (line 465), "the costs `g(y T)` are then all real numbers" holds only if some control with values in `U` exists; for empty `U` there is no admissible pair and the set of costs is empty. Add "and `U` nonempty" to the data of the example (for instance `U = [−1, 1]`, as in the next Check).

## N01 — No Check separates the Hamiltonian from the one with `+p(f)` in place of `−p(f)`

Every example has a control set symmetric about `0`, for which `sup_u (−p u)` and `sup_u (p u)` are both `|p|`. A Check that tells them apart: `ẏ = u`, `U = [0, 1]`, `L = 0`, `g(x) = x`, where `v(t, x) = x`, `H(x, p) = max(0, −p)` and `−∂ₜv + H(x, ∂ₓv) = 0`, while `max(0, p)` gives `1`.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 admissible pairs, cost | `ẏ=u`, control 1, `g=min(|x|,1)`, `T=2` from `(0,0)`; `α=s^(-1/2)`, `L=u²/2` | `y(2)=2`, cost 1; control 0 cost 0; `y=2√s`, `L=1/(2s)` not integrable, junk integral 0 | holds | none |
| 1.2 existence, uniqueness | `U=∅`; `t>T`; `f=2√|x|`; bang-bang control | vacuous; `Icc` empty so `EqOn` trivial; `(s−t)²` and 0 both solve; `min(s,2−s)` | holds; duplicates supplier | R01 |
| 1.3 trajectory estimates | `f=−x+u`; `f=x`; `‖f‖≤M` | difference `e^(−(s−t))(x−x')` ≤ bound; equality `e^(s−t)`; `‖y s−x‖≤M(s−t)` | holds; first is §1.7's bound | R01 |
| 2.1 value function | `g=±min(|x|,1)`, `T=2` | `v(1,0.5)=0`, `v(1,1.5)=0.5`, `v(0,4)=1`; `v(1.5,0)=−0.5`, `v(0,0)=−1` | holds | none |
| 2.2 dynamic programming | `τ=t`, `τ=T`; `t=0,τ=1,x=2.5` | both sides `v(t,x)`; inf of costs; `v(0,2.5)=0.5`, `min v(1,·)` on `[1.5,3.5]` = 0.5 | holds | none |
| 2.3 bounded, Lipschitz | first example; `T<0`, `T=0` | `C_x=(K_L T+K_g)e^(K_f T)=1`, time constant `M_L+C_x M_f=1`, attained; vacuous / trivial | holds | none |
| 3.1 viscosity definitions | `w=min(0,|x|−(2−t))` at `(1,0)`, `φ=t−2`; extrema exchanged | `w−φ=|x|`, `−1+0<0` fails super; exchanged: slopes `(1,q)`, `−1+|q|≤0` passes | holds; sign pinned | none |
| 3.2 Hamiltonian estimates | `f=u`; `f=u sin x` | `H=|p|`; `|H(0.01,p)−H(0,p)|=|p| sin 0.01` unbounded, ≤ `|x−y|(1+|p|)` | holds | N01 |
| 3.3 classical solutions | `u=x−(2−t)`, `u=x+(2−t)`, `H=|p|` | `−1+1=0`; `1+1=2` | holds | none |
| 3.4 value function is a viscosity solution | kinks `(1,1)`, `(1,2)`; `(1.5,0)` second example; sign reversed | slopes `(λ,λ)`: `−λ+|λ|=0`; `(1,q)`: `−1+|q|≤0`; reversed `1−|q|≤0` fails at `q=0` | holds | none |
| 4.1 comparison | USC `u=1` on `{0}×ℝⁿ`; penalty `ε(T−t)+ε/t+λlog(1+|x|²)`; `T≤0` | counterexample only without continuity; perturbed inequality `≤−ε−ε/t²+ω₁(λ)`; vacuous/trivial | holds | none |
| 4.2 uniqueness | `w` of 3.1 with `g=0`; `T=0` | `w(2,·)=0`, bounded by 2, not a supersolution, value function 0; `w(0,x)=g(x)=v(0,x)` | holds | none |
| 5.1 verification | `w=x−(T−t)`; LQ `w=x²/(2(1+T−t))`, `T=1.5`; `t>T`; `U=∅` | `1+u≥0`; `(u+∂ₓw)²/2≥0`; values 0.2, 1, 3 match constant-control costs; no least cost; costs empty | holds | C01 |
| 6.1 needle variations | product rule `p ξ`; cost split at `s−ε`, `s` | `(pξ)'=−∂ₓL ξ`; change `ε(Dg ξ(T)+∫∂ₓL ξ+L(u)−L(α))` | holds | none |
| 6.2 minimum principle | `L=x,g=0`; `f=−y+u,g=x`; `g=x²/2,x=2,T=1`; `t≥T` | `p=T−s`, cost `xT−T²/2=−0.075`; `p=e^(s−T)`; `p≡1`; all select `u=−1`; null set | holds; Evans sign `p_E=−p` consistent | none |

- Source locators checked against the text: 27 (Liberzon-cvoc 14, Calder-viscosity 8, Evans-control 5), all correct; printed pages of Liberzon-cvoc are the file's pages minus 10.
- Library declarations opened at the pins: 18 (Mathlib 15, Tau Ceti 3 plus the three named in the scope only); all exist in the files named, with the statements the supplier contracts give.
- Cross-roadmap citations resolved: MarkovDecisionProcesses on main (scope line 44 excludes continuous-time control); one uncited owner found (R01).
- Duplication by object: no viscosity solution of a first-order equation, value function, control problem or maximum principle in the pinned Mathlib or Tau Ceti, nor in another roadmap; PDE excludes viscosity solutions (line 2073 on main).
- Overlap check: read PDE (main and its open revision), OneStepMethodsForODEs, DiracScatteringAndNonlinearFourierTransform (main and its open revision); the nonlinear Carathéodory theorem is shared, owner DiracScatteringAndNonlinearFourierTransform §1.7 (R01); nothing else shared.
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no change outside the folder.
- Elaboration: `Suggested.lean` elaborates, 9 `sorry` warnings and nothing else; `import Mathlib` only, no `set_option`, no sorried data; the 21 elaborated signatures were compared with the README and agree, none lost a binder.
- One-tactic probe (`simp`, `rfl`, `exact?`) on a copy: none of the 9 theorems closes; all 7 headline theorems of the summary are stated, none through a stand-in.

Source independence: 12 passages compared with 3 sources, none shared; largest share Liberzon-cvoc, 14 of 27 locators; contents compared with Liberzon-cvoc: independent (Layers 1, 2, 3, 5, 6 correspond to §3.3, §5.1.2, §5.3, §5.1.4, Ch. 4, not in its order, and Layer 4 has no counterpart there).

Research link: The viscosity-solution theory of Crandall and Lions (1983) and the maximum principle of Pontryagin, Boltyanskii, Gamkrelidze and Mishchenko (1962); Layers 3–4 are the well-posedness theory of the former for Hamilton–Jacobi–Bellman equations, Layer 6 the latter for free final state. Rests on the README's References and Liberzon-cvoc line 6155.

## Not verifiable

- none

## Source issues

- **Error** in Calder-viscosity at Theorem 6.6, pp. 58–59: the source says a bounded upper semicontinuous subsolution lies below a bounded lower semicontinuous supersolution up to the final time; it should be assumed that the values at the final time are limits from earlier times (continuity suffices), the indicator of the final time slice being a counterexample; affects a stated result.
- **Error** in Evans-control at Theorem 4.3, p. 48: the source says the maximization condition holds at every time in `[0, T]` for measurable controls; it should be at almost every time, since an optimal control changed at one instant stays optimal; affects a stated result.
- **Gap** in Evans-control at Lemma A.2, p. 114: the source says the varied and original trajectories differ at `s` by `ε` times the jump of `f` plus `o(ε)` for every `s`; it should be for `s` a Lebesgue point of the velocity along the trajectory; affects the proof.

## For the human reviewers

- **Scope.** All three located sources are lecture notes or a preliminary copy on their authors' pages (Evans-control, Liberzon-cvoc, Calder-viscosity); the refereed papers (Crandall–Lions 1983, Pontryagin et al. 1962) are attributed in the References without locators.
- **Licence.** Liberzon-cvoc is the preliminary version of a book published by Princeton University Press; its first page invites browsing and download (Liberzon-cvoc lines 11–18). No reuse of its text was found.
