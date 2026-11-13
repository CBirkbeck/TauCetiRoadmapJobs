# Review of LieHighestWeightPartII (pull request #2277 at 26297a5)

**Verdict:** accepted

## Previous findings

- R01 — repaired: `TauCetiRoadmap/LieHighestWeightPartII/README.md:98` cites Layer 7 and `serreLift_injective_of_base`, present on main and at #1797; §2.1 obtains parity from its Gram matrix without the former §5.1 dependency.
- R02 — repaired: `TauCetiRoadmap/LieHighestWeightPartII/README.md:322` cites MAT Proposition 2.1.1 and the following paragraph, p.2, for parity and splitting, explicitly over ℂ; its §2.1 proof supplies the stated generality.
- R03 — repaired: `TauCetiRoadmap/LieHighestWeightPartII/README.md:564` cites CH §6 and §8.1 and identifies `r(s) = q^(ℜ(s))`; `TauCetiRoadmap/LieHighestWeightPartII/Suggested.lean:254` makes the same distinction.
- R04 — repaired: `TauCetiRoadmap/LieHighestWeightPartII/README.md:3` assumes algebraic closure, characteristic zero and finite-dimensional semisimplicity for recognition; the description's `roadmap-summary` block carries those hypotheses.
- R05 — repaired: the description identifies NoncompactQuantumSymmetry Layer 3 as the owner of the analytic comparison and explicitly says §0.2 does not consume it.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Summary recognition hypotheses | `(H,E,F)`, `(H,−E,−F)` in sl₂ | Same `h`; over ℂ, `Ad(diag(i,−i))(H,E,F)=(H,−E,−F)`; over ℝ, `a²=−1` has no solution | Correct field restriction | R04 repaired |
| Layer 7 supplier contract | `A=[[2,−1],[−2,2]]`; rank zero | `[h₁,e₂]=−2e₂=Aᵀ₁₂e₂`; untransposed coefficient `−1`; empty presentation and Killing algebra both zero | Conventions agree at both supplier versions | R01 repaired |
| §0.3 neutral-element recognition | `(H,4E,F/4)` in sl₂ | `Ad(diag(2,1/2))E=4E`, `Ad(diag(2,1/2))F=F/4`; `h=H` on both sides | Replacement supplier supports route | None |
| §2.0 classical-model identification | Rank 4; so(2) | `dim so(8)=28=4+24`; `dim sp(8)=dim so(9)=36=4+32`; so(2) Killing rank `0<1` | Rank exclusions retained | None |
| §2.1 explicit-form parity | `V(1)`, `V(2)` | `β₁ᵀ=−β₁`, `β₂ᵀ=β₂`; both determinants `1`; signs equal `(−1)¹`, `(−1)²` | No general symmetry-sign supplier needed | R01 repaired |
| §2.2 partition conditions and splitting | `(3,1)`, `(4,4)`, empty partition | `(3,1)`: orthogonal allowed, symplectic excluded; `(4,4)`: two SO-classes; empty: `O=SO=1`, one class | MAT states the positive-dimensional complex cases | R02 repaired |
| §3.4 exceptional recognition | G₂ labels `(0,1)`, `(1,0)` | Nonnegative profiles `(4,4,1)` versus `(4,2,1,2)`; both total dimensions `14`, profiles unequal | Distinct classes remain distinguished | None |
| §4.1 factor-selective recognition | sl₂×sl₂, `(t,0)` versus `(0,t)` | Adjoint weights both `(2,0,−2,0,0,0)`; first-factor standard has `dim W₋₁=1` versus `0` | Tests retain factor labels | None |
| §5.4 positive part; Lean docstring | `q=4`, `s=diag(2i,−i/2)` | `ℜ(s)=diag(1/2,−1/2)`; `q^(ℜ(s))=diag(2,1/2)=r(s)`; compact factor `diag(i,−i)` | Group/Lie-algebra normalization agrees | R03 repaired |
| §5.5 positive-part recognition | Gₘ, `q=4`, `s=2i`, `s′=2` | Character `z↦zᵏ`: both patterns `1` at degree `k`; both positive parts act by `2ᵏ`; conjugator `1` | Dependent theorem agrees with repaired docstring | None |

Rows for untouched statements stand as in the previous review of `f68e387`.

- Source locators: 5 replacement anchors checked (MAT lines 66, 70; CH lines 781, 1334, 1555), plus 12 contextual anchors in CH, DG and KIR; seeded targets intersecting the changes were checked.
- Pinned declarations opened: 5, at `TauCeti/Algebra/Lie/InvariantForm/Basic.lean:141`, `TauCeti/Algebra/AlgebraicGroup/Representation/Faithful/Basic.lean:311` and `:321`, `TauCeti/Algebra/AlgebraicGroup/Representation/SemisimplePoint/Basic.lean:81`, `TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean:71`.
- Changed supplier citations: LieHighestWeight Layer 7 target resolves at `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:2073` on main and `:1042` at #1797; Layer 8 resolves at `:2220` and `:1100`; no revision-only dependency introduced.
- Dependency output: `depcheck: 239 roadmaps, 2170 edges, 0 problem(s)`; no UPWARD or CYCLE; rerun gate passed every scanner and dependency check.
- Targeted build and direct elaboration passed; 9 warnings, all `declaration uses sorry`. Fresh `#check @name` elaboration covered all 14 declarations: no lost binder or signature change; the nine-theorem padding check stands from `f68e387`.
- Pull-request title, prose and `roadmap-summary` checked against head: new folder, 47 added headings, 14 declarations including 9 headlines; no removed target or heading, and no change outside the folder.
- Overlap check: read LieHighestWeight (main and #1797), SpinRepresentations, RealSemisimpleLieGroups, ClassicalGroups, ChevalleyGroups, ReductiveGroups, RootSystemsPartII, RootSystems and NilpotentOrbits; Serre presentation/exceptional models: LieHighestWeight; half-spin modules: SpinRepresentations; group construction: ReductiveGroups; complex orbit geometry: NilpotentOrbits; real inner groups: RealSemisimpleLieGroups. No new shared ownership.
- Source independence: changed passages only; 7 passages compared with 4 sources, no copied expression or reused material; largest share CH, 26 of 41 explicit line-locator occurrences; no layer added, removed or reordered, so the previous independent-arrangement comparison stands.

## Not verifiable

- Published CH, DG and KIR versions remain uncollated; the checks use the specified arXiv versions and author-page draft. No changed passage needs an unavailable text.

## Source issues

- **Misprint** in CH at §8.1, p.28: the source defines the real part only for positive torus elements; it should define it for all torus elements; affects nothing.
- **Misprint** in CH at §10.1, proof of Proposition 10.2, p.32: the source identifies the Lie-algebra real part with a group element; it should use its q-exponential; affects nothing.
- **Gap** in CH at Appendix, proof of Lemma 10.9, p.35: the source infers E₆ and E₇ adjoint separation from their inclusion as E₈ Levi subalgebras; it should establish separation in each root system; affects the proof.
- **Misprint** in CH at Appendix, proof of Lemma 10.9, p.35: the source combines increasing dominant coordinates with simple roots εᵢ−εᵢ₊₁; it should reverse those roots or the coordinate order; affects nothing.

## For the human reviewers

- **Scope.** The four end theorems are Lemmas 2.4, 6.30, 10.9 and Proposition 10.2 of CH, read at arXiv v1; CH supplies 26 of the README's 41 explicit line-locator occurrences.
- **Scope.** §3.3 asserts injectivity on 7, 28, 34, 274, 245 candidate profiles. CH reports a computer calculation without a proof; the previous review reproduced those counts by script.
- **Licence.** SOM is unpublished, unfinished notes (§3.2 unfinished, §4.1 empty), hosted on another mathematician's university page; the manifest classifies the copy as institutional.
- **Licence.** KIR is the author-page draft of a Cambridge University Press book; the manifest classifies the copy as author-page.
