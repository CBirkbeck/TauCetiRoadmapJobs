# Review of CyclicHomologyLieHomologyAndQuasiFreeAlgebras (pull request #2037 at 20efc97)

**Verdict:** needs changes

## R01 (P3) — The provenance paragraph names no target and omits the theorem's owner on main

**Location:** `TauCetiRoadmap/CyclicHomologyLieHomologyAndQuasiFreeAlgebras/README.md` lines 1045–1046: "proves the Eilenberg–Zilber theorem for bisimplicial objects, with the shuffle map and the normalized comparison, a tool of the simplicial computations around Layer 1."

**Claim:** The section says that it "maps existing Lean code to targets", but this paragraph names no target. No route and no *Needs:* line in Layers 1–5 uses Eilenberg–Zilber, a shuffle map or a bisimplicial object: 1.1 uses the cyclic bicomplex, which is a double complex with no diagonal. The paragraph also leaves out two things:
- the bisimplicial theorem is already planned by a roadmap on main;
- that plan uses carriers at the pinned Tau Ceti, which LeanPool's `F₁`, `F₂` and `alexanderWhitney` duplicate.

**Witness:** DerivedModuleAlgebra on main, README line 1153 (§0.2.2, "Bisimplicial module diagonal comparison"), states this theorem using the pinned Tau Ceti's `diagAlexanderWhitney` (`TauCeti/AlgebraicTopology/SimplicialObject/Bisimplicial.lean` line 313). In this README, "shuffle" and "bisimplicial" occur only at lines 1045–1046.

**Repair:** Replace README lines 1045–1047 with the following text. It was tested on a scratch copy: `roadmaps resolve` finds nothing unresolved, the dependency check reports `0 problem(s)`, and all three Tau Ceti names elaborate with `#check` at the pin.

```text
`LeanPool/EilenbergZilber` proves the Eilenberg–Zilber theorem for a bisimplicial object of an
abelian category: a chain homotopy equivalence between the total complex and the complex of the
diagonal, built from the shuffle and Alexander–Whitney maps on normalized complexes. That theorem is
DerivedModuleAlgebra §0.2.2 (bisimplicial module diagonal comparison), stated on Tau Ceti's
`CategoryTheory.SimplicialObject.diag`, `CategoryTheory.SimplicialObject.doubleComplex` and
`CategoryTheory.SimplicialObject.diagAlexanderWhitney`; no target of this roadmap uses it. Nothing
there treats cyclic homology, the Loday–Quillen–Tsygan theorem or quasi-free algebras.
```

In the description's Provenance paragraph, replace "a tool of the simplicial computations around Layer 1" with "a theorem planned on main as DerivedModuleAlgebra §0.2.2, which no target here uses".

## Previous findings

- none: the review of `1a9242b` raised no finding.

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| README 1045–1046: LeanPool proves bisimplicial Eilenberg–Zilber, with the shuffle map and the normalized comparison | constant bisimplicial `P`; `ℤ[S¹ ⊠ S¹]`; LeanPool at `f8b9b72` | constant: both sides `H₀ = P`, `H_(>0) = 0`; `S¹ ⊠ S¹`: both `ℤ, ℤ², ℤ`; `eilenbergZilber : HomotopyEquiv (F₁.obj X) (F₂.obj X)`, sorry-free | holds | — |
| README 1046: "a tool … around Layer 1" | routes and *Needs:* of 1.1–1.4 and Layers 2–5 | 1.1: cyclic bicomplex, a double complex; 1.3: homotopy orbit space or 1.2's `Ext`; no route uses a diagonal comparison | no target named | R01 |
| Pinned Tau Ceti against LeanPool | `Bisimplicial.lean` lines 42–43, 83, 143, 313; `SimplicialSet/EilenbergZilber.lean` line 761 | `diagAlexanderWhitney : s(diag X) ⟶ Tot(doubleComplex X)`; Dold–Puppe only in the docstring; `HomotopyEquiv` only for `K × L` | LeanPool adds the shuffle map and the equivalence | R01 names the carriers |
| README 1047: nothing there treats cyclic homology, Loday–Quillen–Tsygan or quasi-free algebras | every directory of `LeanPool/` at `f8b9b72`, matched against 23 keywords | matches by name: `ConnesKreimer`, `ConnesRigidity`, `LieTrotter`, `LiebThirring`, `QuasiBorelSpaces`, `KasamiCyclicAdditive`, `BeckFialaMatrix`, `EilenbergZilber`; none is cyclic homology | holds, by name | — |
| README 1040–1042: Apache-2.0 or MIT; v4.35.0, earlier than the pin | LeanPool `LICENSE`, `README.md`, `lean-toolchain`, `lake-manifest.json`; our `lean-toolchain` | `LICENSE`, file headers: Apache 2.0; its README: Apache-2.0 or MIT; toolchain and Mathlib `v4.35.0`; pin `v4.36.0-rc2` | holds | — |

The rows for every other statement stand as in the previous review, of `1a9242b`.

- **Change:** `git diff 1a9242b HEAD` adds 16 lines to the README: the Provenance section and one References entry. Nothing changes outside the folder. `lake-manifest.json` and `Suggested.lean` are unchanged. None of the 15 seeded sample targets falls in the changed passages.
- **Gate:** the worker's gate passes every check, with `build=0`.
  - My run has every scanner at 0 and one line against the public order, `depcheck: NOT IN ORDER: CyclicHomologyLieHomologyAndQuasiFreeAlgebras (insert it after its last supplier)`. This is not a finding: the candidate order lists the roadmap at line 349, right after RefinedTraceMethods at line 348.
  - Dependency check (`--movable`, candidate order, `--pr 2037`): `depcheck: 234 roadmaps, 2232 edges, 0 problem(s)`.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives 0 errors and five `declaration uses 'sorry'` warnings, at lines 80, 106, 119, 130 and 135. The seven types in `signatures.md` are as before; `on` is a docstring artefact.
- **Library declarations opened:**
  - Tau Ceti at the pin: 5 places in two files, and 4 `#check`s elaborate.
  - LeanPool at `f8b9b72`: 9 files.
  - DerivedDeRhamCohomology on main (line 5425) has the same Provenance wording, and it names the supplier section that owns the outside code.
- **Pull-request text:** the description's Provenance paragraph agrees with this head on the commit `f8b9b72`, on v4.35.0, on the `EilenbergZilber` project, and on "not adapted in `Suggested.lean`". "Three files" and "Nothing outside the folder changes" still hold. Its phrase "around Layer 1" changes with R01.
- **Overlap check:** read RefinedTraceMethods, RefinedTraceMethodsPartII, RationalHomotopyModels, K2SymbolsBrauer and ProjectiveModulesOverPolynomialRings (open), and NoncommutativeGeometry (main); the results-based list is empty. Shared objects and their owners:
  - `Λ`, `HC` and `HP`: RefinedTraceMethods §§1.1–1.4, cited.
  - Nil-invariance over ℚ: RefinedTraceMethods §4.18, cited.
  - Normalised forms: NoncommutativeGeometry N1, cited.
  - Chevalley–Eilenberg chains `𝓒(L)`: RationalHomotopyModels owns them for reduced DG Lie algebras over ℚ, which excludes 2.1's ungraded Lie algebras.
  - The bisimplicial Eilenberg–Zilber theorem: DerivedModuleAlgebra §0.2.2 (R01). Orbifolds on main (line 527) also claims it for `Sing_q(N_pS)`.
  - K2SymbolsBrauer and ProjectiveModulesOverPolynomialRings share nothing.
- **Source independence:** changed passages only. 2 passages (the Provenance section and the References entry) were compared with the LeanPool files they describe; nothing is shared beyond project and declaration names. No source locator was added. Largest share: Loday–Quillen 1984, 15 of 68 locators. Contents were not compared again, since no layer was added, removed or reordered.
- **Remark on untouched text:** 2.4 cites Milnor–Moore 1965 for the structure theorem without a theorem number.

## Not verifiable

- Marín 1998 and González-Férez–Marín 2007: paywalled (DOI prefix 10.1016), with no open copy, as in the previous review. The README names them only in Out of scope, with no locator.

## Source issues

- none

## For the human reviewers

- SmoothRepresentationsOfLocalGroups on main (README lines 81–83) assigns left xst rings and the abelian category of their firm modules to this roadmap. This README's Out of scope (lines 112–116) excludes them. SmoothRepresentationsOfLocalGroups cites no section here.
