# Review of SelmerIwasawaCohomology (pull request #869 at 8e1b4ae)

**Verdict:** accepted

No findings. Incremental re-review of the 6 lines changed since `ebadda3`, and of the title and description as they stand now.

## Previous findings

- R01 — repaired: `TauCetiRoadmap/SelmerIwasawaCohomology/Suggested.lean:73` declares `theorem nonempty_padicKummer_equiv [NeZero (p : K)]`; `README.md:226` cites the new name; the gate reports `statement-hygiene=0`.
- R02 — repaired: the description now opens its prose with “This pull request adds the new roadmap `TauCetiRoadmap/SelmerIwasawaCohomology`, comprising `README.md`, `Suggested.lean` and `metadata.toml`.”
- R03 — repaired: the dependency paragraph names only SchemeAndStackFoundations and PadicMeasuresIwasawaAlgebras as main-branch suppliers (both cited, both on main) and points consumers to the README's “Downstream consumers” section (`README.md:2617`).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result / change |
| --- | --- | --- | --- |
| §0.8 `nonempty_padicKummer_equiv` (renamed) | `K=ℝ`, `p=2` | `H¹(C₂, ℤ₂ with sign action) = ker(1+σ)/im(σ−1) = ℤ₂/2ℤ₂`, order 2; `lim ℝ^×/(ℝ^×)^{2^m} = {±1}`, order 2. | Agree; statement unchanged by the rename. |
| §0.8, same | `K=𝔽₅`, `p=2` | `H¹(Ẑ, ℤ₂(1)) = ℤ₂/(5−1)ℤ₂ ≅ ℤ/4`; `C₄/C₄^{2^m} = C₄` for `m ≥ 2`, limit `C₄`. | Agree, order 4. |
| §0.8, same | `K=ℂ`, `p=3` | Trivial Galois group: `H¹ = 0`; `ℂ^×` is 3-divisible, every quotient trivial, limit `0`. | Agree. |
| §0.8, hypothesis `NeZero (p : K)` | `K=𝔽₂(t)`, `p=2` | `μ_{2^m}(K^sep)=1`, Tate module `0`, `H¹=0`; `K^×/K^{×2}` infinite. | Statement would fail; excluded by the `NeZero` binder, which the elaborated type keeps. |

Rows for untouched statements stand as in the previous review, of `ebadda3`.

- Changed passages: 2 (README §0.8 opening, the theorem's name); 1 elaborated signature compared (`nonempty_padicKummer_equiv`: `p`, `Fact p.Prime`, `K`, `Field K`, `NeZero ↑p` all present); the statement's body is byte-identical to `ebadda3`.
- Library declarations opened at the pin: `TauCeti.padicCompletionUnits` (`TauCeti/NumberTheory/Padics/MultiplicativeCompletion/Basic.lean:81`), `TauCeti.PadicTateTwist` (`TauCeti/RingTheory/RootsOfUnity/PadicTateTwist.lean`); Loogle lists no pinned statement of the Kummer equivalence.
- Cross-roadmap citations resolved: 1 inbound. PadicHodgeTheory (open revision) cites §0.8's former name at its `README.md:1457` and `:1552`; the mapping line at `README.md:224` keeps that citation followable, in the form main already uses (AlgebraicTopology `README.md:4596`). The gate reports `dropped=0`, `readme-ids-missing=0`.
- Pull request text: title and 4 prose paragraphs plus the `roadmap-summary` block read against the head: adds a new roadmap (folder absent on main, 2894 insertions, 0 deletions); the five Lean target groups named match the 6 theorems of `Suggested.lean`; the rename is stated; §3.15, §§2A, 4.28, 4.29 and the HeegnerPointEulerSystems / HeightsRationalPointsAndObstructions consumers are at the head as described; `metadata.toml` has `topic = "math.NT"`. No sentence contradicted, no unstated change.
- Gate at `8e1b4ae`: OK, every counter 0 (worker's run and a fresh run). Elaboration with `lake env lean`: 6 `sorry` warnings (lines 73, 102, 122, 196, 202, 223), nothing else.
- Dependency check: `depcheck: 245 roadmaps, 2219 edges, 0 problem(s)`.
- Files changed outside the folder against the merge base: 0; checkout clean.
- Remark (untouched, lead from the signature tool): `[FiniteDimensional ℂ W]` is absent from one Archimedean definition's elaborated type; the previous review checked both Gamma theorems keep it.

Overlap check: read ArithmeticGaloisDuality, EulerSystemsAndKolyvaginSystems, NoncommutativeAndEquivariantIwasawa, ModularIwasawaMainConjectures, ModularIwasawaMainConjecturesPartII, PadicMeasuresIwasawaAlgebras, ProfiniteCohomology (ownership as recorded in the previous review); the change is a rename and shares nothing new. The overlap data lists no other pull request changing this roadmap, no dropped id and no revision-only id.

Source independence: changed passages only; 2 passages compared with 0 external sources (the diff adds a name mapping and a renamed identifier, no source-bearing prose); no locator, layer or arrangement changed, so the contents comparison is not reopened.

## Not verifiable

- none within the changed passages; external-source locators outside the diff were not reopened in this incremental review.

## Source issues

- none

## For the human reviewers

- none
