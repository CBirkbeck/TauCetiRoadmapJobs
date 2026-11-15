# Review of NoncommutativeAndEquivariantIwasawa (pull request #1307 at 45811bd)

**Verdict:** accepted

## Previous findings

- R01 — repaired: `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:4109` constructs the embedding-wise coefficient transfer, proves independence of the complex field isomorphism with rationally normalized measures, and transports the additive character; lines 4124–4125 distinguish the opposite character and the monodromy contribution.
- R02 — repaired: `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:2433` now names artinLValue_induction and §3.14; line 2679 names RepresentationTheory/InductionRestriction Layer 6 for Brauer induction.

## Verified sound

| Statement | Instances tried | Values computed on the compared sides | Result / change |
|---|---|---|---|
| Supplier contract, README:113: Clifford consequence | Over ℂ, `S₃=C₃⋊C₂`; nontrivial χ of C₃ | `H_χ=1`; induced character `(2,0,−1)` at `(1,(12),(123))`, equal to the standard character | The complement extends χ; Clifford correspondence gives the asserted induction. |
| §5.5 dependency repair | `F=ℚ`, `F′=ℚ(√5)`, `Σ={5}`, trivial character, `s=−1` | `B₂,χ₅=4/5`; `(1/3)(−2/5)=−2/15=(1/30)(−4)` | The added inductivity input identifies the two truncated values. |
| §6.4 dependency repair | S₃, at identity, transposition, 3-cycle | `Ind_C₂ 1=(3,1,0)`; `Ind_C₃ χ=(2,0,−1)`; difference `(1,1,1)=1_S₃` | Brauer induction is now named in the Needs line. |
| §3.14, seeded target cited by the repairs | `G=C₂×Γ`, `U=Γ`, scalar unit 2 at p=3 | Transfer gives scalar `2²=4`; evaluation at `Ind_U^G 1=1⊕sgn` gives `2·2=4` | Transfer and induced-character evaluation agree. |
| §7.15 step 3: coefficient transfer and new quadratic Check | p=3, quadratic conductor-3 character; `t₁=ψ_p(1/3)` | `ι₋(ε)=−i√3`, `ι₊(ε)=i√3`; both pull back to `t₁−t₁²` | Transporting ψ with the representation removes dependence on ι. |
| §7.15: opposite-character negative control | Same character, fixed standard complex ψ under both embeddings | Pullbacks are `t₁−t₁²` and `t₁²−t₁`; their difference is `2(t₁−t₁²)≠0` | The new Check rejects this wrong transfer. |
| §7.15: automorphism compatibility and measure extension | Complex conjugation, same quadratic character; normalized dx₀, then `dx=2dx₀` | `σ(−i√3)=i√3=ε(W,σψ,dx₀)`; measure extension gives `2(−i√3)=−2i√3` | Finite sums commute with σ; the real measure ratio is applied after σ⁻¹. |
| §7.15: new Weil-part Check | Tate-curve representation and `ℚ_p⊕ℚ_p(1)` | Both have Frobenius eigenvalues `(1,p)`, ν=0, volume 1: `ε=1·1=1`; respective monodromy ranks are 1 and 0 | The constant uses the Weil representation, without a monodromy determinant. |
| §7.15: transfer at rank zero and Tate twist | `V=0` and `V=ℚ_p(1)` | Rank zero: empty product `1=1`. Tate twist: `ε=1`, `t_H=−1`, and `t(t⁻¹e)=e` | Transfer preserves the unit and the stated period orientation. |

The rows for untouched statements stand as in the previous review, of `77cb9a8`.

- Source locators checked: 5 groups in 2 texts—LVZ §2.3, Propositions 2.3.2–2.3.3 and §2.4 (`lvz line 138`, `lvz line 186`, `lvz line 197`, `lvz line 232`); CFKSV equations (15)–(22), arXiv v1 pp. 8–10 (`cfksv line 314`, `cfksv line 360`).
- Seeded sample: §3.14's evaluation construction and induced-character compatibility checked where cited by the repairs; the other 14 targets have no changed passage.
- Pinned declarations opened: 2—`FDRep.cliffordCorrespondence` (`TauCeti/RepresentationTheory/Induction/Clifford/Classes.lean:125`) and `TauCeti.ClassFunction.character_mem_indCharacterSpanInt_isElementary` (`TauCeti/RepresentationTheory/Induction/Brauer/Induction.lean:127`), both with their algebraically closed characteristic-zero hypotheses.
- Affected supplier sections resolved: 5—ClassicalArithmeticCompletion §§7.12a, 7.12b, 7.63 (README:14065, 14109, 15384), and RepresentationTheory/InductionRestriction Layers 5–6 (README:607, 661), on main.
- Gate rerun: every counter zero, `OK`; dependency output: `depcheck: 245 roadmaps, 2220 edges, 0 problem(s)`. No UPWARD or CYCLE line; no changes outside the folder.
- Targeted build passed; its replay included a module-system advisory. Direct elaboration passed with exactly seven `sorry` warnings and no other warning.
- All 13 declarations were checked with explicit `#check @name` in a scratch copy: signatures agree with the supplied signature report; no binder changed. The seven theorem signatures, headline coverage and padding assessment stand from the previous review.
- PR title, summary block and prose checked against this head: three added roadmap files, 13 declarations, seven sorried theorems; the coefficient adapter remains within the described local epsilon comparisons, with no supplier added or dropped.

Overlap check: read IntegralIwasawaTheory, SelmerIwasawaCohomology, IntegralIwasawaTheoryPartII, EulerSystemsAndKolyvaginSystems, PadicFamilies, PadicMeasuresIwasawaAlgebras and ClassicalArithmeticCompletion. Among the changed objects, ClassicalArithmeticCompletion owns the complex local constants and Artin functions; this roadmap owns their specified coefficient adapter. Clifford and Brauer theory belong to InductionRestriction and the pinned Tau Ceti declarations. No competing owner of the new adapter was found.

Source independence: changed passages only; 3 passages compared with LVZ (the transfer construction and two new Checks), with no copied expression beyond mathematical formulas and standard terminology. LVZ has the largest changed-passage share: 5 of 7 named source-section/proposition locators. Serre's new locator could not be compared. No layer was added, removed or reordered, so the contents comparison was not repeated.

## Not verifiable

- Serre, *Linear Representations of Finite Groups*, Proposition 25: the sources service resolved only a paywalled Springer publication; uncertified. The finite-group consequence was checked through the supplied Clifford correspondence and the explicit complement extension.
- Deligne (1973), §3.12(A)–(D), Theorem 4.1 and §8.12: unchanged locators from the previous review; the Springer LNM 349 text was not read.

## Source issues

- none

## For the human reviewers

- none
