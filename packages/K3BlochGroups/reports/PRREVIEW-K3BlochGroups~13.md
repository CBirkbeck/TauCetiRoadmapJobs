# Review of K3BlochGroups (pull request #1430 at cf5467c)

**Verdict:** accepted

No findings. Incremental re-review of the 14 lines changed since `b5d451c` (all in `TauCetiRoadmap/K3BlochGroups/README.md`; `Suggested.lean` unchanged; nothing changed outside the folder).

## Previous findings

- R01 — repaired: `README.md:1835` “Define ιe:C¹→SL₂(F) by restricting `TauCeti.unitsLeftMulMatrix e` to C¹ and corestricting to SL₂ using `TauCeti.val_det_unitsLeftMulMatrix` and N(u)=1”; scope (`:29`), contract (`:67`) and *Needs* (`:1853`) name the three pinned declarations.
- R02 — repaired: `README.md:51` “The acceptance file uses Mathlib; the Tau Ceti interfaces below are consumed by the mathematical development.”
- R03 — repaired: `README.md:27` “The former generalLinear_homology_stable target of §4.8 is now supplied by HomologicalStabilityOfGeneralLinearGroups §2.3; the former generalLinearStabilization is `TauCeti.stabilizeGL`.”

## Verified sound

| Statement | Instances tried | Computed left side | Computed right side | Result / change |
| --- | --- | --- | --- | --- |
| §5.1 norm-one embedding via pinned `unitsLeftMulMatrix` (R01) | 𝔽₄/𝔽₂, basis (1,ω), u=ω | Entries repr(ω·eⱼ)ᵢ: ω·1=ω, ω·ω=1+ω, so ((0,1),(1,1)); det=−1=1; trace 1 | N(ω)=ω·ω²=ω³=1; README Check matrix ((0,1),(1,1)), det 1, trace 1 | Agree; ω∈C¹, image in SL₂(𝔽₂) |
| §5.1 exclusions and identity | u=1; u=0; u=ω² | I₂; 0 is not a unit, not in the domain Eˣ; ((1,1),(1,0)), det 1 | I₂; excluded from C¹; ω²=ω⁻¹, inverse of ((0,1),(1,1)) is ((1,1),(1,0)) | Agree; homomorphism and injectivity on C₃ |
| §5.1 basis change | e=(1,ω), e′=(1,ω²), u=ω | U=((1,1),(0,1))=U⁻¹; U·((0,1),(1,1))·U⁻¹=((1,1),(1,0)) | Direct in e′: ω·1=1+ω², ω·ω²=1, columns (1,1),(1,0), so ((1,1),(1,0)) | Conjugation by U=e′⁻¹∘e confirmed; entries not fixed |
| Tau Ceti contract `README.md:67` against the pin | Binder classes at `LeftMulMatrix.lean:65–72`, `:89`, `:120` | Embedding and injectivity: `[CommSemiring R] [Semiring S] [Algebra R S]`, `[Fintype ι] [DecidableEq ι]`; determinant: `[CommRing R] [Ring S]` | README: semiring S over commutative semiring R, finite index; determinant for R commutative ring, S ring | Generality equal; file path as cited |
| §4.8 identifier mapping (R03) | ℚ: (m,n)=(1,1); (1,0) | H₁(GL₁)→H₁(GL₂): 2↦det diag(2,1)=2, ℚˣ→ℚˣ bijective; H₁(GL₀)=0→ℚˣ not onto | Supplier §2.3: bijective for m≤n; (1,0) outside range | New owner states the former target; `stabilizeGL` is g↦diag(g,1) |
| Acceptance imports (R02) | `Suggested.lean` whole file | One import line (Mathlib); 0 occurrences of `TauCeti.` | README:51 claims Mathlib only | Agree |

Rows for untouched statements stand as in the previous review, of `b5d451c`.

- Source locators: 1 checked (the only one in a changed passage): §5.1's CGZ §4.2 at cgz2021 lines 1047–1068 (arXiv v3 p.23) supports C¹=ker N→SL₂(𝔽_q), defined up to conjugation; printed p.406 = 383+23 is consistent, not read in print.
- Pinned declarations opened: `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/LeftMulMatrix.lean:72`, `:89`, `:120`; `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Stable.lean:79`; `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/NonSplitTorus.lean:120` (4 files, 5 declarations).
- Remark: `TauCeti.GL2NonSplitTorusHom` at the pin is the same embedding for one chosen basis into GL₂ only; it has no SL₂ corestriction and no basis-change statement, so §5.1's two remaining targets are not duplicated.
- Cross-roadmap citations resolved: HomologicalStabilityOfGeneralLinearGroups §§1.3 and 2.3 exist at its open head (#2036; §2.3 states bijectivity for m≤n via `TauCeti.stabilizeGL`); its README lines 78, 520 and 694 still name the two former identifiers, which `README.md:27` now maps.
- Gate: all checks 0, OK (worker's run includes the targeted build; rerun here with the same result on the text checks). Changes outside the folder: 0.
- Elaboration: `lake env lean` on `Suggested.lean` gives exactly nine `sorry` warnings (lines 51, 94, 106, 119, 144, 168, 180, 192, 205) and nothing else; the file is unchanged since `b5d451c`, so the 13 signatures and the padding probes stand.
- Pull request text against this head: the §5.1 paragraph, the identifier-mapping sentence, “nine headline theorems using four simple definitions against the pinned Mathlib” (9 theorems, 4 definitions, one Mathlib import) and the supplier paragraph all agree with the head; no sentence contradicted, no change left unstated.
- Seeded sample: none of the 15 targets lies in a changed passage; §4.8 is touched only by the mapping sentence, checked in the table.

`depcheck: 235 roadmaps, 2115 edges, 0 problem(s)`

Overlap check: read Polylogarithms, HomologicalStabilityOfGeneralLinearGroups, K2SymbolsBrauer, ArithmeticKTheory, EllipticKTheory, PolylogarithmFunctions and AlgebraicKTheory; nothing shared beyond the ownership recorded in the previous review (frame spectral sequence and GL stability with HomologicalStabilityOfGeneralLinearGroups, cited). The multiplication-matrix embedding is owned by Tau Ceti and now cited; no other roadmap, open or on main, states the norm-one SL₂ restriction (`roadmaps grep unitsLeftMulMatrix`: this roadmap only). No second copy, conflicting head or dropped id.

Source independence: changed passages only; 5 passages compared with 1 source (cgz2021) and with the pinned module's docstring, none shared; largest share weibel, 118 of 224 locators, unchanged; contents not compared again since the diff adds, removes and reorders no layer (previous result: independent).

## Not verifiable

- suslin-1984 (§4.8 locators, pp.196–198): waived in the manifest; no readable text; unchanged by this diff.
- suslin-1991, bloch, mirzaii-erratum: waived or uncertified in the manifest; no readable text; none cited in a changed passage.
- CGZ printed page 406 for §5.1: only the arXiv v3 text is in the cache; section and content verified there.

## Source issues

- none

## For the human reviewers

- none
