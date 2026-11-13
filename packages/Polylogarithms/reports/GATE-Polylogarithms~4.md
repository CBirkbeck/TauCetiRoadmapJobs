## H01 (CBirkbeck) — applied differently

`TauCetiRoadmap/Polylogarithms/README.md:578`: the induction now defines `higherBlochGroup F n` only for `n≥3`. Its weight-two stage is K3BlochGroups' `P(F)⊗ℚ` (Layer 3, the field case of its commutative-ring presentation), cited by reference rather than defined again. §4.2 (line 610) and §4.6 (line 710) follow: `explicitToInductive_two_isomorphism` is deleted because both presentations now share that group, and the obstruction square uses `q = id`. The rational-curve form of K3BlochGroups §4.21 is cited only over infinite fields, because over `𝔽₃` the two disagree (new Check, line 598). `P(𝔽₃)⊗ℚ=ℚ[-1]` (K3BlochGroups §3.7), whereas the weight-two rational-curve relations kill every symbol: the families `[1+t]+[(1+t)⁻¹]` and `[s]+[1-s]` with `s=1/(1-t)` contribute `2[-1]-2[1]` and `2[∞]-[1]-[0]`.

## H02 (CBirkbeck) — applied

`trilogGroup` (line 312) is now defined for every field ("For an infinite field" → "For every field"), and so are `higherBlochGroup` (line 578) and, as the same defect, `explicitRawCycleFour` (line 678). The text now says where a field's size enters each theorem:
- For `δ₃`, the size of `F` enters through K3BlochGroups §§3.6 and 4.21, which assume at least four elements. For finite `F` the map is trivially well defined, because `U(F)=0`.
- For `higherDelta_wellDefined` and `relationSpecialization_induction` (line 580), size enters only through the weight-two specialization of K3BlochGroups §4.21. The proof of [G95] Lemma 1.16 applies lower-weight specialization only on function fields of curves, which are infinite.
- Higher-symbol inversion (line 602) holds for every field when `n≥3`. In weight two it needs at least four elements and fails over `𝔽₃`, where `2[-1]₂≠0`.
- The §3.3 residue (line 381) was "infinite `K`, `k`" and is now "residue field with at least four elements". It fails at `𝔽₃` (new Check, line 395).

## H03 (CBirkbeck) — applied

Both remedies the review offered are used:
- **Names dropped, prose kept.** `polylogMotivicComparisonConjecture` (§4.2, line 612), `polylogHomotopyConjecture_four` (§4.7, line 729), `HasPolylogReciprocityHomotopy` with its conditional consequences (§5.17, line 1414), and the regulator-comparison proposition of §4.4 (line 657).
- **Predicates kept, assumed by no target.** In §4.4 (line 648), rational existence and every-family rationality stay as predicates. The roadmap proves instances of them and no target assumes them.
- **Targets deleted because they assumed a conjecture.** `zagierAssertion_implications` (its content is the unconditional `zagierPeriod_calibration`) and the `conditionalComplexTransfer` subsection of §4.7.

The locators were checked against the legal copies: [G95] Conjecture A (p.222; G95 line 813), Conjecture 1.39 (p.240; G95 line 1446), [GR] §1.1 (p.5, line 201; p.6, line 224), Conjecture 1.4 (p.7, line 251), §1.2 (p.9, line 339), [Z90] §8 (p.417, line 995) and [G04] Conjecture 6.3 (p.54, line 2379).

## Build and gate

- Build: `lake build TauCetiRoadmap.Polylogarithms.Suggested` gave `Build completed successfully (8976 jobs)`, with only `declaration uses 'sorry'` warnings at lines 118, 139, 145, 150, 162, 221, 232, 246 and 274.
- Gate after the commit:

  `gate Polylogarithms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck: `depcheck: 222 roadmaps, 1971 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- Citations: `roadmaps resolve` on the edited README reports no unresolved cross-roadmap citations and no unresolved Lean names.
- Commit: `1cf0554e Polylogarithms: review repairs (supplier weight-two stage, groups over every field, conjectures as prose)`. Only `TauCetiRoadmap/Polylogarithms/README.md` changed (39 insertions, 53 deletions). It is not pushed.

## Verification notes

**`Suggested.lean` and signatures.** The file is unchanged, so the elaborated types in the job's signature list still describe it. I compared each type with its README statement. The README change from "infinite field" to "every field" now matches the Lean declarations, which were already stated over every field: `unitVector`, `FiveTermFunction`, `trilogCyclic`, `TrilogRelationFunction` and `IsCycle3` all take an arbitrary `[Field F]`. No binder was lost. No declaration is added, so no new `#check` was needed.

**Ownership.** No carrier is added. The weight-two stage is now cited from its owner, K3BlochGroups (Layer 3, §§3.6–3.7, 4.21, read at its open head), which comes earlier in the merge order. No notion moved down from a later roadmap. Six names were deleted: `explicitToInductive_two_isomorphism`, `polylogMotivicComparisonConjecture`, `zagierAssertion_implications`, `polylogHomotopyConjecture_four`, `conditionalComplexTransfer` and `HasPolylogReciprocityHomotopy`. A `roadmaps grep` over main and all open heads finds no other roadmap citing any of them. The downstream Part II entry was updated to "existence and every-family predicates" (line 1553).

**Left unchanged on purpose.** `geometricTrilogGroup` (§3.5) keeps "infinite field". Its only use is the comparison `M₃` inside the configuration maps, which need infinite fields. I could not locate in [G95] §5.2 (pp.285–287) the step where `M₃` uses infinitude, so I could not state that honestly. Generalizing it would also go beyond the two groups the review names.

**Adversarial pass** (statements added or changed):

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| `trilogGroup` for every field | `𝔽₂`; `ℚ` | `𝔽₂`: `R(1,1,1)=3[1]+4[-1]=7[1]` (A=1≠0), so the group is 0. `ℚ`: `L₃([1])=ζ(3)≠0` | Definition holds for every field; endpoint generator kept |
| `δ₃` well-defined for every field | `𝔽₅`; `ℚ` | `U(𝔽₅)=ℚ⊗ℤ/4=0`, so the target is 0. Over `ℚ`, `δ₃[1]=[1]₂⊗u(1)=0` and `δ₃[3]=[3]₂⊗u(3)≠0` | Finite case trivial; infinite case uses K3BlochGroups §§3.6 and 4.21 (at least four elements) |
| §3.3 residue needs `|k|≥4` | `ℚ` at 3; `ℚ(t)` at `t`; `k=𝔽₂` | At 3, `(x,y)=(-1,4)`: arguments `-1,4,-4,8/3,-2/3` reduce to `2[-1]≠0` in `P(𝔽₃)⊗ℚ`. At `t`, existing Checks hold. `P(𝔽₂)=0` | Hypothesis added; new Check. At `𝔽₂` the hypothesis is not needed (P3 note) |
| Weight-two stage is the supplier's group | `𝔽₃`; `𝔽₂`; `ℚ` | `𝔽₃`: `P⊗ℚ=ℚ` versus recipe 0. `𝔽₂`: both 0. `ℚ`: equal by `rationalCurve_relations_eq` | Supplier's group by reference; rational-curve form only over infinite fields; new Check |
| Weight-two boundary sign | `x=3` | `δ₂[3]=(-2)∧3=u(2)∧u(3)`; supplier `∂[3]=3∧(-2)=-u(2)∧u(3)` | Negation convention unchanged |
| Inversion for `n≥3`, every field | `n=3,x=1`; `n=4,x=1`; `n=4,𝔽₃,x=-1`; `n=2,𝔽₃`; `n=1,x=2` | `n=3,x=1`: `[1]-[1]=0`. `n=4,x=1`: `2[1]=0`. `n=4` over `𝔽₃`: the family `[-t]+[(-t)⁻¹]` has zero boundary by weight-3 inversion over `𝔽₃(t)`, giving `2[-1]₄=0`. `n=2` over `𝔽₃`: `2[-1]₂≠0`. `n=1`: `u(2)+u(1/2)=0` | Weight two restricted to at least four elements |
| `higherDelta_wellDefined` for every field | `𝔽₃`, `n=3`; `ℚ`, `n=3` | Over `𝔽₃` the target `B₂⊗U(𝔽₃)=0`. Over `ℚ` it uses specialization to residue field `ℚ` | No hypothesis needed |
| `relationSpecialization_induction` (`n≥3`) | `ℚ` at 3, `n=3` | Lower-weight specialization runs on `𝔽₃(s)` (infinite). Direct weight-2 specialization to `𝔽₃` fails, as in the §3.3 Check | Restricted to `n≥3`; weight two is the supplier's |
| `explicitRawCycleFour` for every field | `𝔽₅`; `ℚ` with `[1]`, `[2]` | `𝔽₅`: `U=0`, so every raw sum is a cycle, matching the universal test (`unitVector=0`). `ℚ`: `[1]` is a cycle; `[2]` pairs to `7ζ(3)/8≠0` | Consistent with `IsCycle3`/`isCycle4` on `[Field F]` |
| §4.6 with `q=id` | weight 3; `C=D=E=ℚ`, `J=0` | `T=ker q=0`, so `ω=0` and `[1]₃` lifts. In the control, `ω(1)≠0` | Lifting proved; control kept |
| §4.3 restricted to `n≥3` | weight 2 via §2.1 | `D(i)>0`; the five-term cycle has period 0 | Weight two is `blochWignerDesc` |
| §4.4 predicates | `ℚ,n=3`; `ℚ,n=4`; zero column; `ℚ(√2),n=2` | `Z₃([1])=ζ(3)` (q=1). `Z₄=π⁴=90ζ(4)` with empty determinant 1. Zero column gives `q=0`, allowed for every-family but not existence. `Z₂=24ζ_F(2)` | Predicates kept; no target assumes them |
| Regulator forms (prose) and `zagierPeriod_calibration` | `ℚ,n=3`, zero K-class | `0=λ₃π²·0` gives determinant 0, so the coefficient is 0 and the zero class is not a basis | Calibration stays unconditional; implication target deleted |
| §4.7 finite-place Check | `ℚ(t)`, `t∧2∧3∧5` | Residues are `V` at 0, `-V` at ∞, 0 elsewhere, with `V=u(2)∧u(3)∧u(5)` (valuation determinant 1). The total over `ℙ¹` is 0 | Rewritten without the conjecture |
| §5.17 Check | `a=3` | `Res(t∧(t-1)∧(t-3))=3∧(-2)≠0`, so the zero map fails the triangle | Rewritten without the conjecture |

**Suspicious text.** None found in the review.
