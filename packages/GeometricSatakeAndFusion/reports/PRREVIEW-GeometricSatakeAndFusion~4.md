# Review of GeometricSatakeAndFusion (pull request #1235 at 392d28e)

**Verdict:** accepted

Incremental re-review of the 16 lines changed since `140b5a7`, and of the pull request's title and description against this head. No finding; the gate passes.

## Previous findings

- R01 — repaired: `README.md:526`–530 adds the API: “Each `Fil^m` is a direct summand … the rank of `Fil^m` is the number of `i` with `k_i≤m`; in the inverse convention of CS … `k_i≥−m`”, equivariance under `GL_n(B⁺)`, the tensor filtration for general `G`.
- R02 — repaired: `README.md:2391` reads “Author-hosted 356-page PDF; PDF page `=` printed page”, and the four “(PDF p. 344)”/“(PDF p. 359)” labels are gone. The PDF has 356 pages with matching headers; the offset the previous R02 reported came from a text extraction that splits pages, not from the PDF.
- R03 — repaired: the description now says “`Suggested.lean` states no declaration: none of the geometric headline theorems is statable against the pinned Mathlib and Tau Ceti”, and lists the carriers the module docstring names.
- R04 — repaired: the description lists the twelve open suppliers by section and the nine roadmaps used from main; each range occurs in the README (table below).
- R05 — repaired: the description reads “for the port from the accepted explorer package and the red-team repairs included in this head”.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §0.15 API, rank formula | `GL₂`, `Λ=diag(ξ,1)(B⁺)²`, `μ=(1,0)`, `m=−1,0,1` | Coordinate `i`: `ξ^{max(k_i−m,0)}B⁺` mod `ξ`, nonzero iff `k_i≤m`: ranks 0, 1, 2. CS label `(0,−1)`, count of `k_i≥−m`: 0, 1, 2. Check 1: 0, 1, 2 | Agree | — |
| §0.15 API, rank formula, degenerate | `GL₁`, `μ=(k)`; `μ=0`; `μ=(2,0)`, `m=−1…2` | `GL₁`: 0 for `m<k`, 1 for `m≥k`. `μ=0`: 0 for `m<0`, `n` for `m≥0`. `(2,0)`: 0, 1, 1, 2 | Formula holds, also off the minuscule case | — |
| §0.15 API, wrong model | Count of `k_i≥m` for `μ=(1,0)` | 2, 2, 1 at `m=−1,0,1`: decreasing | Excluded by `Fil^m ⊂ Fil^(m+1)` and Check 1 | — |
| §0.15 API, target parabolic | `GL_n`, flag by weights `≤m` | `E_ij` preserves it iff `k_i≤k_j`, i.e. Lie weight `k_i−k_j≤0`: the stabilizer is `P⁻_μ` | Agrees with `G/P⁻_μ` | — |
| §0.15 API, equivariance | `g=[[1,1],[0,1]]`, `Λ=diag(ξ,1)(B⁺)²` | `gΛ=⟨ξe₁, e₁+e₂⟩`; `Fil⁰(gΛ)` = line `e₁+e₂`; `ḡ·Fil⁰(Λ)=ḡ·⟨e₂⟩` = line `e₁+e₂` | Agree | — |
| §0.15 API, tensor filtration | `V=det`, `GL₂`, same `Λ` | Induced lattice `ξB⁺`: jump at `m=1`. Determinant of a flag with jumps at 0 and 1: jump at `0+1=1` | Agree | — |
| §0.15 API against CS | Proof of Proposition 3.4.3 | CS line 1361: the same filtration formula; CS lines 1364–1367: quotients finite projective, rank the largest `i` with `k_i≥−m` | README agrees | — |
| FS page note (line 2391) | PDF pages 190, 196, 235, 285, 286, 300, 321, 334, 344, 356, 357 | Printed headers 190, 196, 235, 285, 286, 300, 321, 334, 344, 356; page 357 does not exist; 356 page objects | Note true | — |
| §4.16 locator | FS Theorem VI.0.2 p190; VI.11.1 p235; IX.2 p321 | Page 190 states Theorem VI.0.2; page 235 opens §VI.11; page 321 opens §IX.2 | Agree | — |
| §4.19 locator | FS IX.7.1 p334 | Page 334: Definition IX.7.1 and the heading of §IX.7.1 | Agrees | — |
| §§4.24, 4.25 locators | FS IX.2 p321 | Page 321, header “IX.2. Hecke operators 321” | Agrees | — |
| Description, open suppliers | 12 named ranges against the README | RelativeFarguesFontaine §§0.18–0.20 (1 use), 3.1–3.9, 4.7–4.13, 6.5–6.10, 6.16, 7.0–7.6; EtaleDualityAndPerverseSheaves §§1.1, 2.1–2.12, 3.1–3.3, 5.3, 5.5–5.6; the other ten as written: all found | Agree | — |
| Description, roadmaps from main | Every roadmap name in the README against main | On main: 9 names, the 9 the description lists. Open and cited as supplier: 12, the 12 unticked entries of the task list | Agree | — |

No Lean statement changed, and `Suggested.lean` still declares nothing; the rows for the untouched statements stand as in the previous review, of `140b5a7`.

- Source locators checked against the text: 6 (CS Proposition 3.4.3 at CS lines 1349–1368; FS VI.0.2, VI.11, IX.2, Definition IX.7.1 and §IX.7.1 on PDF pages 190, 235, 321, 334).
- Seeded sample: none of the fifteen targets lies in a changed passage; the README flags no locator as unverified.
- Cross-roadmap citations: the diff changes none. The description's 21 supplier names resolve as above; its consumers (HeckeStacksAndLocalShtukas, BunGAndNewtonStrata, IgusaVarietiesAndTorsionConcentration) and GeometricSatakeAndFusionPartII are named in the README as consumers or as owner of the extensions, not as suppliers.
- Library declarations opened: none; the change touches no library claim.
- Gate at `392d28e`: every counter 0, including build, depcheck, stray-files and outside-folder. Dependency check: `depcheck: 245 roadmaps, 2244 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file differs from the merge base outside the folder.
- Elaboration of `TauCetiRoadmap/GeometricSatakeAndFusion/Suggested.lean`: exit 0, no warning; zero declarations, so the `#check` inventory and the one-tactic probe have no candidates.
- Title and description read against the head: the summary block and the prose agree with the README (Keel's criterion and determinant descent in GS0, `ℓ=2` included, reconstruction imported from MotivesAndAlgebraicCycles §§6.1–6.4, Mathlib's `TStructure` and `RigidCategory` reused); the description states that the pull request adds the folder and that the Lean file declares nothing.
- Overlap check: read GeometricSatakeAndFusionPartII, SheafTheoreticSmithTheory, HeckeStacksAndLocalShtukas, ReductiveGroupsPartII; nothing shared. The overlap report lists no other pull request changing this roadmap, no dropped id and no id that only an open revision defines.
- Source independence: changed passages only; 4 passages compared with 2 sources (CS, FS), none shared beyond the rank count `k_i≥−m`, which the mathematics forces; largest share FS, 78 of 143 locators; the diff adds, removes and reorders no layer, so the contents were not compared again.

## Not verifiable

- CS printed pages 684–686 (§0.15): the text read in this round is the arXiv version, whose pages differ; the proposition numbers agree, and the previous review read p. 684 in the Annals copy.

## Source issues

- none

## For the human reviewers

- none
