# Review of SheafTheoreticSmithTheory (pull request #1734 at 9184217)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 9184217; this round reads the pull request's title and description against the head. The folder's files are unchanged and stand as reviewed. One finding, about the description only.

## R01 (P3) — The description does not say that the roadmap owns the loop-Grassmannian geometry over an arbitrary field (§3.0)

**Location** The pull request's description, block `<!-- roadmap-summary -->`, "What this roadmap builds": "It extends modular Satake to coefficients k=F̄_p and W(k) and identifies normalized parity sheaves with tilting modules for good p."

**Claim** The description was written for the first head (98ab730), where Layer 3 began at §3.1. The head adds §3.0 and with it the ownership of a general geometry library that four other roadmaps border; neither the summary block nor the prose names it.

**Witness** `TauCetiRoadmap/SheafTheoreticSmithTheory/README.md` line 7: "This roadmap owns … the loop Grassmannian, affine flag, convolution, Beilinson–Drinfeld and semi-infinite geometry of a split connected reductive group over an arbitrary field"; heading at line 640, absent at 98ab730.

**Repair** Replace the quoted sentence by: "It constructs the loop Grassmannian of a split connected reductive group over an arbitrary field, with its affine flag variety, convolution, Beilinson–Drinfeld and semi-infinite geometry (§3.0; GeometricSatakeAndFusion §0.29, GlobalShtukasAndFunctionFieldLanglands §§1.1–1.3, EndoscopicTransferAndUnitaryTraceComparison §3.2 and FormalConnectionsOpers §3A.5 keep the finite-field and complex cases, with which §3.0 identifies it). On it, it extends modular Satake to coefficients k=F̄_p and W(k) and identifies normalized parity sheaves with tilting modules for good p."

## Previous findings

- none: the previous report (of 9184217) listed no finding of its own; its one carried finding was recorded there as repaired, and the passages it names (README lines 644, 650, 1679) are unchanged at this head.

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §8.1 `algebra_tate_diagonal` (cited by the description) | `A=ℤ`, `σ=id`, `p=3`; `A=𝔽₂×𝔽₂`, swap, `p=2`; control `p=4`, `A=ℤ`, `σ=id` | Transfer ideal `(3)`, `Nm(a)=a³≡a`, `(a+b)³−a³−b³=3ab(a+b)∈(3)`: δ is reduction mod 3. Swap: `Tr(1,0)=(1,1)`, quotient zero ring, δ unique. `p=4`: `1⁴+1⁴=2≠2⁴≡0` mod 4, not additive | agrees; `Fact p.Prime` needed and present; description's "any prime and commutative ring" matches |
| §8.2 `tate_character_extension` (cited by the description) | `A=𝔽₃[x]`, `σ=id`, `S=𝔽₃[x³]`, `κ=𝔽̄₃`; control `κ=𝔽₃(t)`, `χ(x³)=t`; `A=ℤ[i]`, conjugation, `p=2`, `S=ℤ` | `χ′(x)=χ(x³)^{1/3}`, the unique cube root; control: `t∉κ³`, no extension; `ℤ[i]`: `Nm=a²+b²`, `Tr=2a`, `χ′(i)²=1` forces `χ′(i)=1`, unique | agrees with Feng24 line 1869 (Lemma 5.15); `PerfectRing κ p` needed and present |
| §3.0 orbit dimensions and components (the object of R01) | `G_m`; `GL₂`, `λ=(1,0)`, `(1,−1)` | `G_m`: orbits points, `⟨2ρ,λ⟩=0`. `GL₂`: `⟨2ρ,(1,0)⟩=1` (`ℙ¹`), `⟨2ρ,(1,−1)⟩=2`; `λ₁−λ₂≡λ₁+λ₂` mod 2, constant on the components indexed by `π₁=ℤ` | agrees with README line 644 |
| Description, "good primes, not merely very good ones" against §4.5 | `Ĥ=SL₂`, `p=2` | 2 good for `A₁` (highest-root coefficient 1), not very good (2 divides 2); README line 904 reaches it through `GL₂` and the derived-group reduction | description agrees with the head |

The rows for every other statement stand as in the previous review, of `9184217`.

- Description sentences checked against the head: 14 (summary block and prose). 13 agree: the BC comparison `Sat_H∘BC ≅ Res_Δ∘Sat_G` for odd good `p` (README line 3), Galois descent (§7.4), the consumers (README line 1652), no prime restriction on Smith, Satake and tilting tensor theorems (README lines 22, 24), the folder's three files, the two Lean theorem names, 0 outside-folder paths. One omission: R01.
- Library declaration opened at the pin: Mathlib `tateCohomology`, `Mathlib/RepresentationTheory/Homological/TateCohomology/Basic.lean` line 145, which the description says the sheaf theory extends.
- Suppliers: the 13 supplier headings of the README are 5 roadmaps on main (EnhancedDerivedSheaves, EtaleCohomologyFoundations, SchemeAndStackFoundations, ModularCurves, ReductiveGroups with ReductiveGroupsPartII) and 8 open ones, which are the 8 of the generated `depends-on` block; the three supplier headings added since 98ab730 (FormalConnectionsOpers, ArithmeticGaloisRepresentations, RelativeFarguesFontaine) are among them. The five declared gaps (`witt-adic-uniform-operations`, `finite-highest-weight-ideals`, `admissible-invariant-quotient-gluing`, `integral-highest-weight-orders`, `integral-tilting-lifts`) appear by slug at README lines 66, 74, 116, 118, 120.
- Gate rerun at 9184217: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate adds `build=0`.
- Dependency check: `depcheck: 239 roadmaps, 2255 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on a scratch copy of `TauCetiRoadmap/SheafTheoreticSmithTheory/Suggested.lean` with `#check @algebra_tate_diagonal` and `#check @tate_character_extension` appended: two `declaration uses sorry` warnings (lines 61, 73), nothing else; both types coincide with the worker's signature file and with §§8.1–8.2 (no binder lost, nothing changed).
- Seeded sample: no sampled target lies in a changed passage (the folder's diff is empty); source locators opened this round: Feng24 lines 1863 (Definition 5.14) and 1869 (Lemma 5.15), both as cited.
- Overlap check: read GeometricSatakeAndFusion, GlobalShtukasAndFunctionFieldLanglands, EtaleDualityAndPerverseSheaves, HeckeStacksAndLocalShtukas, GeometricSatakeAndFusionPartII; shared object the loop Grassmannian: over an arbitrary field this roadmap §3.0, finite-field Schubert models GeometricSatakeAndFusion §0.29, Beilinson–Drinfeld over curves over finite fields and finite-extension Satake GlobalShtukasAndFunctionFieldLanglands §§1.1–1.3, 1.14; no other roadmap, open or on main, states Smith restriction, parity sheaves or the algebra Tate diagonal (AInfCohomology §AI.7.2 is the spectral one, as README line 16 says).
- Source independence: changed passages only; the folder's diff is empty, so 0 passages compared with 0 sources; largest share Feng24, 78 of 150 line locators; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- Don93, Theorem 1.1: `uncertified`, cited by locator.
- The description's sentence on AI assistance (the counts of review and red-team rounds) describes the job board, not the head; not checked.

## Source issues

- none

## For the human reviewers

- none
