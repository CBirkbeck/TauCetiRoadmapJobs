# Review of FukayaTheory (pull request #1045 at c8b157a)

**Verdict:** needs changes

Incremental re-review of the 2 changed lines since b14869f (one line of `TauCetiRoadmap/FukayaTheory/README.md`, line 58; `Suggested.lean` is unchanged). The previous finding R01 is repaired. The gate run for this review fails one check that passed at push time: `dropped=8`. The project's never-cite list now names HamiltonianSystems, and the README cites it on eight lines. Everything those lines take from it is already at the Tau Ceti pin, so the repair is a re-citation and nothing is left without an owner.

## R01 (P2) — HamiltonianSystems is cited as a supplier; the gate refuses it (`dropped=8`)

**Location.** `TauCetiRoadmap/FukayaTheory/README.md` lines 33 (Scope), 84 (contract heading), 86 (contract), 284 (FK1.2), 298 (FK1.2 *Needs:*), 306 (Layer 1 Dependencies), 985 (FK9.2 *Needs:*), 993 (Layer 9 Dependencies). Line 86 reads: "HamiltonianSystems Layer 2: symplectic maps and symplectomorphisms of manifolds, and the theorem that the flow of a time-independent Hamiltonian vector field is symplectic".

**Claim.** FK1.2, FK9.2 and Layers 1 and 9 take manifold symplectomorphisms, the symplecticity of time-independent Hamiltonian flows and Hamiltonian isotopies from HamiltonianSystems Layer 2.

**Witness.** Gate at c8b157a: `dropped=8 … FAIL`, one hit on each of lines 33, 84, 86, 284, 298, 306, 985 and 993. The project's never-cite list names HamiltonianSystems, an open pull request by another author that is not in the merge order.

**Why P2.** This supplier citation points outside the merge order and the project never cites this roadmap, the same class as an upward supplier. It is not P1 because nothing becomes unowned. The pin proves the time-independent statement at `TauCeti/Geometry/Symplectic/Hamiltonian/CommutingFlow.lean` line 149 (`SmoothTwoForm.IsHamiltonianVectorField.mpullback_globalFlow`: for a closed `σ`, a `C²` function and a complete `C²` Hamiltonian field, `ψ_t^*σ=σ`) and line 167 (`SmoothTwoForm.IsSymplectic.mpullback_globalFlowDiffeomorph`, the same for the diffeomorphism `globalFlowDiffeomorph`). A symplectomorphism is the equation `φ^*ω=ω` on the pinned `TauCeti.mpullback`, with `mpullback_id` and `mpullback_comp` at `TauCeti/Geometry/Manifold/DifferentialForm/Pullback/Basic.lean` lines 368 and 408. The isotopy is `timeDependentFlowDiffeotopy` (`TauCeti/Geometry/Diffeomorphism/Diffeotopy/Flow.lean` line 158), which line 58 already names. FK1.2 proves the time-dependent case itself (line 284).

**Repair.** Remove every mention of HamiltonianSystems and cite the pinned declarations:

- Line 33: delete the item "**HamiltonianSystems Layer 2** (symplectic maps and the symplecticity of Hamiltonian flows; … named in the Tau Ceti contract), ".
- Line 58 (From Tau Ceti): add "A symplectic map is a diffeomorphism `φ` with `φ^*ω=ω` for the pinned `mpullback`, with `mpullback_id` and `mpullback_comp`. `SmoothTwoForm.IsHamiltonianVectorField.mpullback_globalFlow` (closed `σ`, a `C²` function with a complete `C²` Hamiltonian field, `ψ_t^*σ=σ`) and `SmoothTwoForm.IsSymplectic.mpullback_globalFlowDiffeomorph` are the symplecticity of a time-independent Hamiltonian flow."
- Line 84: change the heading to "### From TauCetiRoadmap.DifferentialGeometry and TauCetiRoadmap.SymplecticGeometry/CotangentLagrangian".
- Line 86: delete the two sentences from "HamiltonianSystems Layer 2: symplectic maps …" to "… named in the Tau Ceti contract."
- Line 284: change "the time-independent case being HamiltonianSystems Layer 2's symplecticity of Hamiltonian flows" to "the time-independent case being Tau Ceti `SmoothTwoForm.IsHamiltonianVectorField.mpullback_globalFlow`".
- Line 298: replace "HamiltonianSystems Layer 2 (symplectomorphisms, symplecticity of Hamiltonian flows)" with "Tau Ceti `mpullback_comp` and `SmoothTwoForm.IsHamiltonianVectorField.mpullback_globalFlow` (symplectomorphisms, symplecticity of time-independent Hamiltonian flows)".
- Line 306: delete "HamiltonianSystems Layer 2; " and add `IsHamiltonianVectorField.mpullback_globalFlow` to the Tau Ceti list on the same line.
- Line 985: replace "HamiltonianSystems Layer 2 (Hamiltonian isotopies)" with "Tau Ceti `timeDependentFlowDiffeotopy` (Hamiltonian isotopies)".
- Line 993: delete "HamiltonianSystems Layer 2; " and add `timeDependentFlowDiffeotopy` to the Tau Ceti list on the same line.

The pull request's own "Depends on" and merge-order paragraphs then drop HamiltonianSystems as well. They are outside the folder and are the worker's to update.

**Tested.** After these edits, `grep -c HamiltonianSystems` on the README gives 0, which is exactly the eight hits the gate counts. The pinned theorem's hypotheses (`[I.Boundaryless]`, `[T2Space M]`, `[BoundarylessManifold I M]`, `[FiniteDimensional ℝ E]`, closed `σ`, `C²` function, complete `C²` field; CommutingFlow.lean lines 93–95, 144–151) are what FK1.2 has for a time-independent compactly supported `H` after the sign conversion `X_H=hamiltonianVectorField ω (−H)`. Check on `ℝ²`, `ω=dq∧dp`, `H=(q²+p²)/2`: the condition `ι_Xω=X^q dp−X^p dq=−dH` gives `X=(−p,q)`. Its flow is rotation by `t`, with determinant 1 and `ψ_t^*ω=ω`.

## Previous findings

- R01 — repaired: line 58 now reads "a Lagrangian map with a smooth function `h` and `f^*θ=dh`; the predicate imposes no equation between `θ` and `σ`, so it serves both the cotangent convention `σ=−dθ` and the Liouville convention `dα=ω` of FK4.2 and FK9.0". This matches the pinned fields; the repair introduced nothing new.

## Verified sound

**The repair of the previous R01, against the pin.**
- **The pinned predicate.** `TauCeti.SmoothTwoForm.IsNondegenerate.IsExactLagrangianMap` (`TauCeti/Geometry/Symplectic/Lagrangian/Exact.lean` lines 89–95) has three fields: `isLagrangianMap`, `contMDiff_primitive` (`h` smooth) and `mpullback_eq` (`f^*θ = dh`). `isExactLagrangianMap_iff` (line 99) restates them. Its docstring (lines 84–88) says the predicate is "meant for" `σ=−dθ` but includes no such field. `#check @` at the pin elaborates to `σ.IsNondegenerate → SmoothForm I M ℝ 1 → (N → M) → (N → ℝ) → Prop`, with no binder relating `θ` to `σ`.
- **The new README sentence.** It states the three fields and the absence of an equation. "Serves both conventions" was computed in the table below (both signs accepted, with `h ↦ −h`).
- **The passages that depend on it.** FK4.2 (line 648, "compact branes exact for its primitive in the sense of `IsExactLagrangianMap`", where the primitive is the completion's `α` with `dα=ω`), FK4.2 *Needs:* (664), Layer 4 Dependencies (672), FK9.0 (898) with its *Needs:* (917), and Layer 9 Dependencies (993). In `Suggested.lean`, the module docstring (lines 20, 50), the `liouvilleExact_intersection_bound` docstring (the predicate "is indifferent to the sign of the primitive", lines 140–141) and its hypothesis `hL` (line 156). README and Lean now say the same thing. The line also keeps the Liouville convention: `dα=ω`, `ι_Zω=α`, so the primitive of `(T*L, ω_can)` is `−λ_can`, which agrees with `σ=−dθ` for `θ=λ_can`.
- **Policy of the changed line.** No LaTeX delimiter, process word, round label or pull-request number. The gate's `latex`, `round-labels`, `prnum` and `residue` counters are all 0.

**Gate.** Run for this review with `--base origin/main`: `dropped=8`, and every other counter is 0 (`set_option`, `sorry-data`, `imports`, `statement-hygiene`, `readme-ids-missing`, `depcheck`, `stray-files`, `outside-folder`, …), result FAIL. The eight `dropped` hits are R01, one per line listed there. The worker's push-time gate (all 0, build 0) predates the change to the never-cite list. A check of every other name on that list (fourteen names) against both files gives 0 occurrences.

**Elaboration.** `lake env lean` on a scratch copy of `Suggested.lean`, with seven `#check @` lines appended, takes 6 s. The headline theorems at lines 118 and 151 give only `declaration uses sorry`. The two unknown-constant errors are my appended checks of `IsHamiltonianVectorField.mpullback_globalFlow` and `IsSymplectic.mpullback_globalFlowDiffeomorph`: `CommutingFlow` is not in the file's import closure, and neither the file nor the repair needs it to be. Both were read in the pinned source instead (lines 149 and 167). The four elaborated types of `IsWeaklyExact`, `hamiltonianTimeOne`, `weaklyExact_intersection_bound` and `liouvilleExact_intersection_bound` are character for character those of the previous round. `git diff b14869f..HEAD -- Suggested.lean` is empty.

In the worker's `signatures.md`:
- The `[FiniteDimensional ℝ E]` flagged as dropped from the two `def`s is not needed by their types (a predicate on an arbitrary smooth two-form, and a flow with documented junk values), as in the previous rounds.
- The "class, line 90" entry and the error at its line 171 are artefacts of how the worker extracted the signatures.

**Dependency check.** Output of `gate --depcheck … --movable`: `depcheck: 243 roadmaps, 2456 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. HamiltonianSystems draws no edge because it is not in the merge order. That is why only the `dropped` check catches it.

**Pins and scope.**
- `lake-manifest.json` pins Tau Ceti 2fd255d9 and Mathlib 1b1ccf4b, the same pins as main 3b3f7ef.
- The diff outside the folder (`origin/main...HEAD`) is empty.
- `overlaps.md`, and `roadmaps overlaps FukayaTheory` rerun for this review: no open pull request changes this roadmap, no cited id is dropped, and none is defined only by a revision.
- `citations.md`: nothing unresolved.

**Ownership of the Lean names.** `roadmaps grep --fixed --lean-only` over main and the 476 open heads finds `liouvilleExact_intersection_bound` (2 hits), `weaklyExact_intersection_bound` (2), `hamiltonianTimeOne` (7) and `IsWeaklyExact` (4) only in this pull request's `Suggested.lean`. This closes the ownership item that the previous round left unverified.

**Library declarations opened at the pin (Tau Ceti 2fd255d9).**
- `IsExactLagrangianMap` (`Lagrangian/Exact.lean` 89) and `isExactLagrangianMap_iff` (99).
- `SmoothTwoForm.IsHamiltonianVectorField.mpullback_globalFlow` (`Hamiltonian/CommutingFlow.lean` 149; section variables at 93–95 and `[I.Boundaryless]` at 144).
- `SmoothTwoForm.IsSymplectic.mpullback_globalFlowDiffeomorph` (CommutingFlow.lean 167).
- `mpullback_globalFlow_of_mextDeriv_interior_eq_zero` (`Manifold/DifferentialForm/Flow.lean` 290, Cartan's formula `L_Zβ=d(ι_Zβ)=0`).
- `globalFlowDiffeomorph` (`Manifold/IntegralCurve/GlobalFlow.lean` 190).
- `timeDependentFlowDiffeotopy` (`Diffeomorphism/Diffeotopy/Flow.lean` 158).
- `isCompleteVectorField_timeDependentSuspensionField` (`Manifold/Flow/TimeDependent.lean` 389).
- `TauCeti.mpullback` (`Manifold/DifferentialForm/Pullback/Basic.lean` 241), `mpullback_id` (368) and `mpullback_comp` (408).
- `SymplecticForm.IsSymplectomorphism` (`Symplectic/SymplecticTransport.lean` 119). This one is linear only. A grep of `def Is…` and `structure Is…` in `Symplectic/Manifold`, `Symplectic/Hamiltonian` and `Symplectic/Lagrangian` finds no manifold-level symplectomorphism predicate, so the repair writes the notion as an equation.

**Seeded sample, where it meets the changed passages.**
- FK4.2 (line 648 and its *Needs:*) uses the changed contract and is consistent with it (above).
- FK1.2 (lines 284 and 298) and FK9.2 (line 985) carry the citations of R01. Each was checked against the pinned theorem that replaces it (table).
- The other sampled targets (FK0.1, FK1.2a, FK2.1a, FK3.1, FK3.3, FK4.1, FK5.1, FK5.3, FK6.2, FK7.1, FK8.0, FK8.1) are untouched by the diff. Their locators and statements were checked in PRREVIEW-FukayaTheory~5 and ~6 and are carried forward.

**Headline theorems.** The headlines are FK7 (the filtered curved Fukaya category), FK9.2 (the `Λ_loc` quasi-equivalence under Hamiltonian isotopy), FK9.0 (the intersection bound, in a weakly exact and a Liouville exact branch), FK8.0 (`HF(L,L) ≅ H^*(L; End E)`) and FK8.1 (the torus `H⁰ ≅ Λ₀² ⊕ Λ₀/(T^A)`). Both branches of FK9.0 are stated over `𝔽₂`. The other four are named in the module docstring with the carrier each lacks: no Floer complex, bordered moduli, relative spin data or lune complex at the pin. Nothing changed here, so the padding probe of the previous round stands: `simp` and `omega` fail on both stated theorems.

**Adversarial table.** Rows for statements the diff leaves untouched carry forward PRREVIEW-FukayaTheory~5 and ~6, which computed them; their key values are repeated here. Rows marked "new" are this round's.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| README 58, `IsExactLagrangianMap` as now described — new | pinned fields; zero section of `T*S¹`; graph of `d(cos q)`; circle `p=1` | fields `IsLagrangianMap`, `h` smooth, `f^*θ=dh`, no `(θ,σ)` equation; `q↦(q,0)`: `f^*(p dq)=0=d0` and `f^*(−p dq)=0=d0`, both conventions hold with `h=0`; `q↦(q,−sin q)`: `f^*(p dq)=−sin q dq=d(cos q)`, `h=cos q`, and `f^*(−p dq)=d(−cos q)`, `h=−cos q`; `p=1`: `f^*(±p dq)=±dq`, `∫=±2π≠0`, no `h` exists | holds: the sentence matches the pin, and "serves both conventions" holds with `h↦−h` | none |
| FK4.2 (648), FK9.0 (898), Lean `hL` (156) against the wrong model "the predicate carries `σ=−dθ`" — new | `T*S¹`, `ω=dq∧dp`, `α=−p dq` | `dα=−dp∧dq=dq∧dp=ω`; a field `σ=−dθ` would demand `ω=−dα=−ω`, false for `ω≠0`, so `hL` would be unsatisfiable and the headline vacuous; the pin has no such field and the README now says so | holds | none |
| FK1.2 (284, 298), time-independent symplecticity repointed to the pin — new | `ℝ²`, `ω=dq∧dp`, `H=(q²+p²)/2`, `X=hamiltonianVectorField ω (−H)` | `ι_Xω=X^q dp−X^p dq=−q dq−p dp` gives `X=(−p,q)`; the flow is rotation by `t`, with determinant 1, so `ψ_t^*ω=ω`; the pin's hypotheses: `ω` closed, `−H` is `C²`, `X` complete (linear) and `C²` | holds; the pin covers what line 284 cites HamiltonianSystems for | R01 |
| FK9.2 (985), Hamiltonian isotopies repointed to the pin — new | `H_t` vanishing off a compact `K` | `isCompleteVectorField_timeDependentSuspensionField` gives a complete suspension; `timeDependentFlowDiffeotopy` gives the isotopy `t↦φ_H^(0,t)` from `id`; both are already named at line 58 | holds without HamiltonianSystems | R01 |
| Gate `dropped` (lines 33, 84, 86, 284, 298, 306, 985, 993) — new | the fifteen names on the never-cite list | HamiltonianSystems 8 occurrences, every other name 0 | fails | R01 |
| `liouvilleExact_intersection_bound` hypotheses (Lean 151–167) — ~6 | zero section and fibre circle of `T*S¹` | `f^*α=0=d0`; fibre `∫(−dq)=−2π≠0`, not exact | holds | none |
| `liouvilleExact_intersection_bound` degenerate cases — ~6 | `N=∅`; `dim M=0`; `H=0`; Clifford torus | `0≤0`; `|N|=|N|`; `H=0` fails `htrans`, so the junk `Nat.card=0` never applies; Clifford torus not exact, displaceable (`0<4`) | holds | none |
| `liouvilleExact_intersection_bound` completeness — ~6 | `hK` | `dH_t=0` on the open set `Kᶜ`, so the field vanishes off a compact set and the suspension is complete | holds | none |
| `weaklyExact_intersection_bound` degenerate cases and generality — ~5 | `dim M=0`; `N=∅`; `H=0`; a point in `S²` | both sides `|N|`; `0≤0`; `htrans` fails for `H=0`, `dim N≥1`; a point is not Lagrangian; README and `#check` hypotheses agree clause by clause | holds | none |
| FK9.0 cutoff Check — ~6 | `T*S¹`, `H=εβ(|p|)cos q` | `|p(t)|≤εt<1`; intersections at `q=0,π`, Hessian `∓ε≠0`; `2=b₀+b₁` | holds | none |
| FK1.2b cap formula — ~5, ~6 | `T*S¹`, `ϕ=cos q` | `ϕ(π)−ϕ(0)=−2`, unsigned area `∫₀^π sin=2`; area = action(left) − action(right) | holds | none |
| FK2.4 cutoff curvature — ~6 | `K_s=0`, `K_t=H_t` | `R_{βK}=β′(s)H_t` from `hamiltonianCurvature_mul` | holds | none |
| FK3.1c energy identity — ~5, ~6 | `u=(s,±t)` on `T²` | `u^*ω(∂_s,∂_t)=±1`, holomorphic `+1=|∂_su|²`; `e(F)=2ω(F(1),F(i))` | holds | none |
| FK3.2 collar and `J` — ~5, ~6 | `T*S¹`, `θ=−p dq` | `Z=p∂_p`, `r=|p|`, `dr(Z)=r`, `R_α=−∂_q`, `dr∘J=−rα`, `ω(∂_q,J∂_q)=p>0` | holds | none |
| Conventions, sign `ι_(X_H)ω=−dH` — ~5 | torus, `H=−(4π)⁻¹cos2πq` | time-one map `(q,p)↦(q,p+½sin2πq)`; pin's field is the negative | holds | none |
| Chord degrees — ~5 | `h=±x²/2` | `μ_ch=±½`, `|x|=0,1=ind(h)` | holds | none |
| FK0.1–FK0.4 — ~5 | `d b=T^Av`; `C=(1,2)`, `C′=(3,4)`; `n=2,3,4` | `H⁰=Λ₀/(T^A)`; `C″=(4,6)`; `(−1)^(n(n−1)/2)=−1,−1,+1`; `d²(a)=(λ₀−λ₁)a` | holds | none |
| FK1.1, FK1.2, FK1.2a Checks — ~5 | equator; `ℝP⁵`; `sin²q=±εcos q`, `ε=0.01`; `H=0` | `w₂(ℝP⁵)=a²`; roots near `q≈±0.100`, `π∓0.100`; dictionary identity at `H=0` | holds | none |
| FK2.1–FK2.3a dimensions — ~5 | `k=1,…,4`; `μ=0,2` | `k−2=−1,0,1,2`; `vdim=μ_Z+d(x₀)−d(x₁)−1` | holds | none |
| FK3.1, FK3.1a, FK3.1b, FK3.3 — ~5 | `ℝPⁿ`, `n=3,5,7,9`; `n=3`, `μ′=2`, `k=2` | `w₂=0,1,0,1`; codimension 2; regular index-0 strips impossible | holds | none |
| FK4.1, FK4.2 cup sign and weak exactness — ~5 | `|a₁|=p`, `|a₂|=q`; Clifford torus; `α⊂T²` | `(−1)^(pq)` on both sides; Maslov-two discs of positive area; `π₂(T²,α)=0` | holds | none |
| FK5.1–FK5.3 — ~5 | `(ℝ,ℝ,1,x²)`; `ℤ/2`, `ℤ/3` | count 0; weight `½`; `(1/3)(p₁+p₂+p₃)` pushes to weight 1 | holds | none |
| FK6.1, FK6.2, FK7.1 — ~5 | equator, `U=diag(1,2)` | `W/T^A=(2,2.5),(0,1.5),(0,−1.5),(−2,−2.5)`; weights `2−2k`; `d²=(λ₀−λ₁)a≠0` | holds | none |
| FK8.0, FK8.1 headlines — ~5 | equator; `f(t)=2t+½sin2πt` | roots `0,0.25,0.5,0.75`; `A=∫_(¼)^(½)(2t−1+½sin2πt)dt=0.017077=1/(4π)−1/16`; `H⁰=Λ₀²⊕Λ₀/(T^A)` | holds; not statable at the pin, named in the docstring | none |
| FK9.1, FK9.2 losses and torus control — ~5 | one vertex; `H=0`; FOOO (6.7)–(6.8) | `(k−2)+0+1=k−1`; loss 0 at `H=0`; `T^λ→T^(λ−2‖H‖)` | holds | none |
| Headlines FK7, FK9.2 — ~5 | carriers at the pin | no Floer complex, bordered moduli or relative spin structure at the pin; not statable, as the docstring says | holds | none |

## Not verifiable

- Floer, *Morse theory for Lagrangian intersections*, J. Differential Geom. 28 (1988), Theorem 1 (README 898, 1014; Lean docstrings). The DOI resolves only to a landing page with no article text, so it is cited by locator and recorded as uncertified. Unchanged.
- McDuff–Salamon, Proposition 2.5.1 and §3.2. A paywalled book, uncertified, cited by locator. Unchanged.
- The printed page numbers of Charest and the page-marker offset of de Silva–Robbin–Salamon. Untouched by the diff and not re-read.
- HamiltonianSystems Layer 2 itself was not read. R01 removes the citation, and the pinned declarations above carry its content.
- The board manifest `packages/FukayaTheory/sources.toml` still does not exist, so no source was fetched this round. The diff changes no locator.

## Source issues

- none
