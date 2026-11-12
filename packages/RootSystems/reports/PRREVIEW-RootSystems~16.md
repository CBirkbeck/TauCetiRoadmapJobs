# Review of RootSystems (pull request #2212 at 46cd680)
Folder: `TauCetiRoadmap/RepresentationTheory/RootSystems/`

**Verdict:** accepted

Incremental re-review of the 65 lines changed since `41120c6`. No finding.

## Previous findings

- R01 — repaired: `README.md:10–11` now reads "finite exactly when its generating set is finite and its geometric form is positive definite", matching `finite_iff_geometricForm_posDef` and `README.md:857–858`.
- R02 — repaired: `README.md:383–387` and `1009–1013` give all eight names in full (`TauCeti.DynkinType.coxeterMatrix_A` … `coxeterMatrix_G2`); gate `readme-ids-missing=0`.
- R03 — repaired: `README.md:1005–1015` and `1083–1084` say "the dictionary from Dynkin types" and "the image of t"; `ofDynkinType` occurs nowhere in the README or `Suggested.lean`.
- R04 — repaired: `README.md:933–934` cites "(Davis, §C.1, p. 433, for a finite index set)"; `README.md:1029–1030` cites "(Davis, §C.1, p. 433, with Theorem 6.12.9, p. 119, and Theorem C.1.2, p. 433)".
- R05 — repaired: `README.md:115–117` restricts finiteness of W and positive definiteness to §§3.3–3.5 and names the two earlier uses of finite I (§1.3 transport, §1.4 Gram matrix).
- R06 — repaired: the description's summary block now ends "finite exactly when it has finitely many generators and every component of its graph has one of these types".
- R07 — repaired: `packages/RootSystems/sources.toml` has a `davis08` record (author-page, certified, `cited_for` 3.3, 3.4, 3.5); the manifest has eight `[[source]]` tables.

## Verified sound

| Statement | Instances tried | Values computed on the two sides | Result |
|---|---|---|---|
| Summary criterion (`README.md:10–11`), against §3.3 `finite_iff_geometricForm_posDef` | I₂(5); ∞ pair; ℕ chain with labels 3 | \|W\|=10, det = sin²(π/5) ≈ 0.345 > 0; W infinite, B = 0 at (1,1); form positive definite, I infinite, W ⊇ S_{n+1} infinite | Pass; both sides agree in each case |
| Conventions sentence (`README.md:115–117`) | every "finite" on the Coxeter index type in lines 100–856 | only `README.md:614` (§1.3 transport to `I → ℝ`) and `README.md:660` (§1.4 integral Gram matrix); other hits concern root-pairing index types | Pass |
| §3.4 form decomposition, with its new locator | A₁ × A₂ at x = (1,1,1); ℕ with all entries 2 | direct: 3 + 2(−1/2) = 2; blockwise: 1 + (1+1−1) = 2; each block [1], B the dot product on finite supports | Pass; the locator's "for a finite index set" matches Davis's setting |
| §3.5 `finite_iff_forall_connectedComponent`, with its new locator | A₁ × I₂(5); ∞ pair; ℕ with all entries 2 | \|W\| = 20, components A 1 and I 5 valid; no valid type, W infinite; all components A 1, I infinite, W infinite | Pass |
| §3.5 dictionary bullet (`README.md:1005–1015`) | B n, C n, G2 at the pin | `coxeterMatrix_B` and `coxeterMatrix_C` both give `CoxeterMatrix.B n`; `coxeterMatrix_G2` gives `CoxeterMatrix.G₂`, entry 6 | Pass; names resolve |

Rows for the untouched statements stand as in the previous review, of `41120c6`; the diff changes no Lean statement.

- Source locators checked against the text: 3, all in the sampled §§3.4–3.5. §C.1 at davis08 lines 17326–17332 (printed p. 433): reducible matrices and positive definiteness blockwise. Theorem 6.12.9 at davis08 line 5000 (printed p. 119). Theorem C.1.2 at davis08 line 17338 (printed p. 433).
- Library declarations opened at the pin: the eight `coxeterMatrix_A` … `coxeterMatrix_G2` theorems, `coxeterMatrix_apply` and `coxeterMatrix_D_apply`, in `TauCeti/LinearAlgebra/RootSystem/Coxeter/DynkinType.lean` (lines 170, 189, 198, 257, 264, 271, 287, 296, 124, 224).
- Gate rerun at this head: OK, every counter 0. Dependency check: `depcheck: 205 roadmaps, 1896 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `Suggested.lean`: exit 0, 15 `declaration uses sorry` warnings and nothing else. The file is unchanged since `41120c6`, so its signatures and the one-tactic probe stand as before.
- Pull request text against the head: the title, the summary block and the prose agree with it (three sections added, none removed, nine declarations added, the two finiteness sentences carry finite generation, suppliers unchanged). No file changes outside the folder.
- Cross-roadmap: no open pull request changes RootSystems or drops an id it cites; the citation resolver's one lead, `FiniteCoxeterType.connected_graph_and_posDef`, is this roadmap's own declaration in `Suggested.lean`.
- Overlap check: read RootSystemsPartII, KacMoody, ReductiveGroups (main), OrthogonalTamagawaAndLatticeMass, SchubertGeometry, EnriquesSurfaces, PseudolineArrangementsAndOrientedMatroids, LieHighestWeight (open); nothing shared. A search of all open heads and main for the finite Coxeter classification finds no second owner.

## Not verifiable

- humphreys90, bourbaki46, bjornerbrenti05, humphreys72, kac90: settled as uncertified; no changed passage cites them.
- The 15 admitted theorems were elaborated and tested on instances, not proved.

## Source issues

- none
