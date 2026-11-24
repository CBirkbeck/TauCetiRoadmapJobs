# Review of SelfAdjointSpectralTheory (pull request #1854 at 2f1f33b)
Folder: `TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory/`
**Verdict:** needs changes

**Summary.** A review of the change against `main`: 4306 changed lines since `2c2bcf5`. All 274 items of main's README are kept under their ids with their statements, both findings of the previous review are repaired, every Teschl locator is on the stated page, `Suggested.lean` elaborates with `sorry` as its only warning, and the dependency check reports no problem. Two findings remain, both in lines this change adds: the graph core of SA-C39–SA-C40 is identified with Mathlib's `LinearPMap.HasCore`, which is a different notion for an operator that is not closed, and SA-C40 is false for it; and SA-B64 is handed to VonNeumannAlgebras V2.BorelCalculus, which does not state it. There are two small corrections and one format note, and one licence question for the human reviewers.

## R01 (P2) — The graph core of SA-C39 is not Mathlib's `LinearPMap.HasCore` unless `A` is closed, and SA-C40 fails for `HasCore`

An implementer who reads the two *In Mathlib:* lines (SA-C39 and SA-C40, lines 1003–1008) takes the items as done and uses `HasCore` where the README's sequential notion is meant; for an operator that is not closed the two disagree, and SA-C40 as attributed is false.

SA-C39 defines `D ⊆ dom A` to be a graph core "when every `x ∈ dom A` is the limit of a sequence `x_n ∈ D` with `A x_n → A x`", and SA-C40 says "`dom A` is a graph core of `A`", each followed by "*In Mathlib:* `LinearPMap.HasCore`". At the pin (`Mathlib/Topology/Algebra/Module/LinearPMap.lean`, line 141) `A.HasCore S` is `S ≤ A.domain` together with `(A.domRestrict S).closure = A`. Take `A` the identity of `ℓ²` restricted to the finitely supported sequences. In the sense of SA-C39 `dom A` is a graph core (constant sequences). But `A` is closable, its closure is the identity on all of `ℓ²`, and `(A.domRestrict A.domain).closure = A.closure ≠ A`, so `A.HasCore A.domain` is false. Mathlib's statement is `LinearPMap.closureHasCore`: the domain of `A` is a core of the closure of `A`. For closed `A` the two notions agree, and the Tau Ceti lemmas named in SA-C42 are stated for `HasCore` (the second with `A.IsClosed` as a hypothesis).

Smallest change: in SA-C39 say that for closed `A` this is Mathlib's `LinearPMap.HasCore` (the closure of the restriction of `A` to `D` is `A`), and that for a closable `A` that is not closed `HasCore` is the stronger condition; state SA-C40 for closed `A` with *In Mathlib:* `LinearPMap.closureHasCore`, or keep it for the sequential notion without the *In Mathlib:* line. The `ℓ²` example would serve as a Check.

## R02 (P2) — SA-B64 is marked as supplied by VonNeumannAlgebras V2.BorelCalculus, which does not state it

SA-B64 (lines 586–593) is the calculus of a bounded Borel density against an arbitrary complex measure `μ` of finite regular variation on a compact Hausdorff space: `|g · μ| = |g| |μ|`, regularity, `∫ f d(g · μ) = ∫ f g dμ`, `(g h) · μ = g · (h · μ)` and independence of the almost-everywhere class of `g`. It ends "*Supplied by:* VonNeumannAlgebras V2.BorelCalculus", and Scope (line 1824) and the supplier contract (line 1915, "weighted measures") repeat the attribution. On main the item was this roadmap's own. With the new line nobody owns it, while Milestone B1 still lists it and SA-B59's route still uses it.

V2.BorelCalculus on main (its README, lines 485–540) states only the identity `f dμ_(ξ,η) = dμ_(ξ,π(f)η)` for the polarised measures of a representation; it has no statement about a general complex measure, the variation of `g · μ`, the change-of-density formula or its associativity. The pinned libraries do not have the item either: Mathlib has `MeasureTheory.VectorMeasure.withDensity`, `withDensity_congr` and `variation_withDensity` (`Mathlib/MeasureTheory/VectorMeasure/WithDensityVec.lean`, lines 42, 70 and 354), and neither library has the integral formula for a density against a vector measure.

Smallest change: remove the *Supplied by:* line from SA-B64, so that it is a target of this roadmap as on main, with *Needs:* Mathlib `MeasureTheory.VectorMeasure.withDensity`, `MeasureTheory.VectorMeasure.variation_withDensity`, `MeasureTheory.VectorMeasure.withDensity_congr` and SA-B83; and take SA-B64 and "weighted measures" out of the V2.BorelCalculus list in Scope and out of the supplier contract.

## C01 — Two dependency sentences leave out needs that the items themselves state

The Dependencies paragraph of Part B (line 875) says "B.4 needs B.2 and B.11", but SA-B56 in B.4 lists SA-B30 (B.3) under *Needs:*, and SA-B54, SA-B55 and SA-B57 rest on B.3 and B.5; with "B.3 needs B.2, B.4 and B.5" a reader sees B.3 and B.4 each before the other. The milestones give the real order (SA-B40–SA-B53 in B2, SA-B54–SA-B57 in B4). Adding "SA-B54–SA-B57 also need B.3 and B.5" would do.

In How to read the build (lines 62–64), "Parts A, C and D rest on Mathlib and Tau Ceti" omits what the Dependencies paragraph of Part C says: SA-C84–SA-C85 need SA-B32–SA-B33, SA-C62–SA-C65 need SA-D01–SA-D02, and SA-C86 needs BanachAlgebras §8.1.

## C02 — The description does not say which sections of main's README are folded away, nor that the reference list changed

The description says each README "opens with an overview … followed by a guide to the build", but not that main's sections "Worked examples (acceptance criteria)", "Ordering", "Definitions" and "Acknowledgements" no longer exist as sections (their content is now in the Examples and Dependencies of each Part, the Conventions and the References), nor that the References replace Reed–Simon, Rudin, Kato, Weidmann and Engel–Nagel by Teschl and Conway, keeping Schmüdgen. A sentence in the SelfAdjointSpectralTheory bullet would cover both.

## N01 — Some targets have no locator

SA-C20–SA-C24, SA-C34–SA-C38, SA-C87, SA-E12–SA-E13 and SA-E36–SA-E41 are targets without an *In Tau Ceti:* line and without a source locator; a textbook locator for each group would do (for SA-E12, Teschl2009 Theorem 2.18 as in SA-E11).

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| Milestone A1: SA-A20 Duhamel and its Check | `S=[[0,1],[1,0]]`, `T=[[0,1],[1,−1]]`, `e₁` | `(S−T)e₁=0`; `S²e₁=e₁`, `T²e₁=(1,−1)`; left side `≈ t²/2·‖(0,1)‖ ≠ 0`, right `0` | commutation needed; Teschl l.5215 p.124 | none |
| Milestone A1: Check on the translation group | `1_[0,1]`, small `t` | `‖f(·+t)−f‖² = 2|t|`, quotient norm `√(2/|t|) → ∞` | true | none |
| Milestone A2: SA-A21, SA-A22 | `U(t)=e^{it}` | `(e^{it}−1)/(it) → 1`; pinned `stoneGenerator = (−i)•complexGenerator` (`Group/Unitary.lean:282`) | agrees with pin | none |
| Milestone B1: SA-B64 | supplier text | V2.BorelCalculus has only `f dμ_(ξ,η)=dμ_(ξ,π(f)η)`; Mathlib has `withDensity`, `variation_withDensity`, no integral formula | no owner | R02 |
| Milestone B2: SA-B53 | Teschl Thm 3.1 | l.3687 p.90: bounded pointwise convergence gives strong convergence | supported | none |
| Milestone B4: SA-B36 Check | `h=1_[0,1/2]` on `L²[0,1]` | essential range `{0,1}`; `P({1}) = M_{1_[0,1/2]}`; Teschl (3.7) l.3605 p.88 | true | none |
| Milestone B4: SA-B74 Check | closed disc, `π(f)=f(z₀)` | `T=z₀`, `σ(T)={z₀}`, `P_π(K∖{z₀})=0`; Teschl Thm 3.8 l.4015, Cor 3.9 l.4031 | true | none |
| Milestone B5: SA-B63, SA-B65 | `K=[0,1]`, atomic-part functional; `f=1_[0,1/2]` | atomic part: Lebesgue `↦0`, `ι(1)`: `↦1`; `sup|g−f| ≥ 1/2` for continuous `g` | embedding not onto; WOT not norm | none |
| Milestone B6: SA-B85–SA-B86 | VonNeumannAlgebras V4.0.Multiplication on main | cyclic models, control measure, multiplicity, `C₀(X)` case, essential symbols all stated there (lines 1267–1310) | supplier states them | none |
| Milestone C1: SA-C39, SA-C40 | identity on finitely supported sequences in `ℓ²` | sequential core: yes; `HasCore A (dom A)`: closure is identity on `ℓ²` `≠ A`, so no | notions differ | R01 |
| Milestone C2: SA-C66, SA-D24 | `X, C : F → E`; `A x + i x` | `R(−i)(Ax+ix) = −x`, so `U_A(Ax+ix) = Ax − ix`; pin `cayley = 1 + (2i)•R(−i)` | true | none |
| Milestone C3: SA-C83 Check, SA-C84 | rotation by `π/2` on `ℝ²`; `diag(0,1)`, `U=ℂe₂` | `⟪Tx,x⟫=0` and `T` not symmetric; `σ(T|_U)={1}`, bound `1` on `U`, `0` on `ℂ²` | true; Teschl l.3170 p.77 | none |
| Milestone C5: SA-C87 Check | the `5×5` matrix | column norms² `45,128,2,350,280`; all 10 column products `0`; Frobenius² `805`; max entry `15` | `‖T‖=√350` | none |
| Milestone D2: SA-D39 | `R(z)=R(w)(1−(w−z)R(w))⁻¹` | `z−A=(1−(w−z)R(w))(w−A)`; tail `≤ ‖R(w)‖q^N/(1−q)` | true | none |
| Milestone E1: SA-E10 Check | `diag(0,1)`, `B=(−∞,1/2)`, `λ=1`, `δ=1/2` | restriction `0`; resolvent at `1` is `1 ≤ 2` | true | none |
| Milestone E2: SA-E14–SA-E21 | scalar `s`; `A=1`, `n=1` | `A_n^+ = ins/(in−s)`, `A_n^- = ins/(in+s)`; `R(i)+R(−i)=−1`, `S_1=1/2`; `A_1^+=(1−i)/2`; `sup s_n = n/2` | true | none |
| Milestone E3: SA-E39, SA-E41 Checks | `ξ=1_[0,1/2]`, `δ=1`; `Q_1=e₁₁`, `x=e₂`, `y=0` | `A G_δ ξ = 1_{|t|≥1}ξ = 0 ≠ ξ`; block bounds hold, `c‖x‖ ≤ ‖y‖` fails | true | none |
| `projValMeasure_eq_of_regular_of_integral_eq` (SA-B62) | `K` a point; `[0,ω₁]` with the Dieudonné measure | point: `P=Q=1`; Dieudonné and `δ_{ω₁}` both integrate `f` to `f(ω₁)`, differ on `{ω₁}` (`0` and `1`) | regularity needed, present in Lean | none |
| `exists_hilbertBasis_forall_hasEigenvector_of_isStarNormal` (SA-C86) | Jordan block; rotation `[[0,−1],[1,0]]`; `H=0` | Jordan: eigenvectors only `ℂe₁`; rotation: `±i` with `(1,∓i)/√2`; `H=0`: `s=∅` | true | none |
| `existsUnique_isSpectralMeasure` (SA-E05, SA-E44) | `A=a`; `diag(0,1)`, `ξ=(1,1)`; `A=0` with `δ₁` | `|ξ|²/(z−a)` both sides; `1/z+1/(z−1)`; `1/(z−1) ≠ 1/z` | true; Teschl Thm 3.7 l.3983, Thm 3.21 l.4497 | none |
| `forall_le_re_inner_iff_proj_Iio_eq_zero` (SA-E11) | `diag(0,1)`, `c=0`, `c=1/2`; `H=0` | `c=0`: bound holds, `P(Iio 0)=0`, `P((−∞,0])=e₁₁`; `c=1/2`: fails at `e₁`, `P=e₁₁` | true with open half-line | none |
| `inner_apply_eq_integral_exp` (SA-E43) | `A=a`, `t=π/2`, `a=1`; `t=0` | `i|ξ|²` both sides; `‖ξ‖²`; `complexGenerator = i•A` forces `A` self-adjoint (pin l.517) | true | none |
| `tendsto_ofBoundedExp_yosidaApproximant` (SA-E27), `yosidaApproximant` | `A=a`; `M_t`; `n=0`; bounded `T` | `e^{itn²a/(n²+a²)} → e^{ita}`; phase gap `tn/2` at `s=n`; `S_0=0`; `‖S_n−T‖ ≤ ‖T‖³/n²` | strong, not norm | none |
| SA-E47 Check | `h=t` on `L²[0,1]`, `g=1`, `z=i` | `∫₀¹(i−t)⁻¹dt = −(log 2)/2 − iπ/4`; with `−h`: `(log 2)/2 − iπ/4` | true | none |

- Source locators checked against the text: 31 lines of Teschl2009 (every locator of the README), all on the stated printed page.
- Library declarations: all 301 dotted names in the README resolved at the pins; 22 opened and read, among them `LinearPMap.HasCore` (Mathlib `Topology/Algebra/Module/LinearPMap.lean:141`), `stoneGenerator` (`Group/Unitary.lean:282`), `LinearPMap.cayley` (`LinearPMap/Cayley.lean:64`), `ofBoundedExp` (`Group/Stone/Basic.lean:35`), `ext_of_resolventTransform` (`ResolventTransform/Inversion.lean:173`), `HasCore.of_graph_subset_closure` (`LinearPMap/GraphCore.lean:79`).
- Record against main: 274 of 274 item ids present with the same titles (four titles reworded, same subject); Parts A–E and milestones A1–E3 kept.
- Cross-roadmap citations resolved: VonNeumannAlgebras V2.BorelCalculus, V4.0.Multiplication and V10.ClosedOperators on main; BanachAlgebras §8.1 on main; BanachSpaceTheory §5.4 at this head; the nine downstream consumers on main cite SA- ids that all exist.
- Signatures: the 8 elaborated types compared with the README statements; no binder lost, generality equal.
- Automatic checks: all passed on this head. Dependency check: `depcheck: 132 roadmaps, 1466 edges, 0 problem(s)`, no UPWARD, CYCLE or moved line. No change outside the pull request's own folders.
- Elaboration: `Suggested.lean` exits 0 with 6 warnings, all `sorry`. One-tactic probe: `simp` closes none of the 6 theorems.
- Previous findings: R01 (locators for the former §1.2–§1.6) repaired, B.7–B.10 cite Conway1990 Theorem IX.1.14 and Teschl2009 at lines 637, 667, 698, 702, 710, 715 and 744, and B.6 says it specialises supplied results; R02 repaired, the description names BanachAlgebras §8.1.

Overlap check: read SchrodingerOperatorsAndSpectralTypes (open), OneParameterSemigroups (open and completed), VonNeumannAlgebras, UnboundedOperators, SpectralSubspacePerturbation and the OperatorTheory index (main and this head). Shared objects: the bounded Borel calculus and representation measure, owner VonNeumannAlgebras; the resolvent predicate of the spectral measure, owner this roadmap (SchrodingerOperatorsAndSpectralTypes names its own copy `IsSpectralMeasureOf` and cites SA-E05 and SA-E44 as the owner); support of the spectral measure equal to the spectrum, owner UnboundedOperators §1.6; Sylvester solvability, owner SpectralSubspacePerturbation. QuantumHarmonicOscillator and the open revision of VonNeumannAlgebras were not given with files and were not read.

Source independence: changed passages only; 14 passages compared with 1 source (Teschl2009), none shared beyond formulas; largest share Teschl2009, 29 of 32 locators; arrangement not compared, the change adds, removes and reorders no layer. Conway1990 and Schmudgen2012 could not be read.

Research link: the spectral theorem and Stone's theorem in the form of Teschl 2009 (Theorems 3.7, 5.1, 5.2) and Schmüdgen 2012 (Theorem 5.7); prerequisites of the Davis–Kahan and Rosenblum theorems of SpectralSubspacePerturbation and of UnboundedOperators. Rests on the README's scope section and Teschl2009.

## Not verifiable

- Conway1990, Theorem IX.1.14: recorded as uncertified, no legal open copy.
- Schmudgen2012, Theorem 5.7: recorded as uncertified, no legal open copy.

## Source issues

- **Gap** in Teschl2009 at Theorem 2.18, p. 77: the source says that for symmetric `A`, `A − E ≥ 0` holds exactly when the spectrum lies in `[E, ∞)`; it should assume `A` self-adjoint for that equivalence, since a closed nonnegative symmetric operator that is not self-adjoint has nonreal spectrum; affects nothing.

## For the human reviewers

- Licence: `Suggested.lean` carries the header "Copyright (c) 2026 Kitware, Inc." and the README's References name the AIQ DKPS formalization (Kitware, Apache-2.0) and the Spectra project (Adam Bornemann, Apache-2.0) as prior formalisations; both were on main already.
