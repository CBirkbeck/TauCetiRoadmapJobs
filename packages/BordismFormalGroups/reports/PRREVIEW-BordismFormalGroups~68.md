# Review of BordismFormalGroups (pull request #1807 at 78bda3b)

**Verdict:** needs changes

## R01 (P2) — Steenrod algebras, Adams towers, MO splitting, James construction and Toda brackets have two owners on main

**Location:** `TauCetiRoadmap/BordismFormalGroups/README.md` lines 70–72: "The ordinary-operation items of TangentialBordism's Layer 4 and its additive MO splitting are F2 targets, which TangentialBordism consumes". Also F4.1 (line 1353) and F6.2 (line 2161), each opening with "Own …".

**Claim:** TangentialBordism and HomotopySpheres reached main after this pull request's base, at 5f7befb6 and 3ba54598. Each claims these objects as its own and names BordismFormalGroups as the consumer. This head claims the same objects and cites neither roadmap. Once this merges, each roadmap on main hands the same objects to the other.

**Witness:** Main TangentialBordism lines 76–77: "Owned here: the mod p Steenrod algebras and Adams towers (B4.1–2, B4.7), which BordismFormalGroups consumes". Main HomotopySpheres line 3317: "consumes the James stages of 3B in F6.2 and the Toda brackets of 3C.3 in F4".

**Repair:** Keep the ownership here. Citing TangentialBordism would close a loop: BordismFormalGroups → TangentialBordism (supplier row at line 462) → StringOrientation (line 249) → BordismFormalGroups. HomotopySpheres is never a supplier. Instead, add TangentialBordism and HomotopySpheres to this pull request:
- In TangentialBordism, replace "Owned here: the mod p Steenrod algebras and Adams towers (B4.1–2, B4.7), which BordismFormalGroups consumes" (lines 76–77) with "The mod p Steenrod algebras and Adams towers are BordismFormalGroups F2.2, which B4.1, B4.2 and B4.7 cite".
- In TangentialBordism, make §6.1 (B4.4) cite F2.4. Delete the clauses saying that BordismFormalGroups consumes B4.1–B4.2, B4.4–B4.8 and B5.4 (lines 48–51, 3434–3436 and 3450–3451).
- In HomotopySpheres, 3B cites F6.2 and 3C.3 cites F4.1. Delete the consumer clause at lines 3316–3317.

## R02 (P3) — The description says that TangentialBordism and HomotopySpheres are not on main

**Location:** Description, BordismFormalGroups paragraph: "BordismFormalGroups no longer consumes TangentialBordism or HomotopySpheres (not on main)."; last paragraph: "once this merges, TangentialBordism (#942) B4.1, B4.2, B4.7 → BordismFormalGroups F2.2 … and HomotopySpheres 3B → F6.2 and 3C.3 → F4.1."

**Claim:** Both roadmaps are on main. The last paragraph addresses them as open pull requests. A reader is not told that main's copies still name BordismFormalGroups as their consumer and must change when this merges (R01).

**Witness:** On main, commit `5f7befb6` "(#942)" adds `TauCetiRoadmap/TangentialBordism/` and commit `3ba54598` "(#1287)" adds `TauCetiRoadmap/HomotopySpheres/`. Both are from 2026-11-11, after this pull request's base `c1107359`.

**Repair:**
- Replace the sentence with: "BordismFormalGroups no longer consumes TangentialBordism or HomotopySpheres, both on main. It owns F2.2, F2.4, F4.1 and F6.2, and this pull request revises those two roadmaps to cite them: TangentialBordism B4.1, B4.2 and B4.7 → F2.2, B4.4 → F2.4; HomotopySpheres 3B → F6.2, 3C.3 → F4.1."
- Delete the last paragraph's clause from "once this merges, TangentialBordism (#942)" to "→ F4.1".
- Add a paragraph for each of the two revised roadmaps.

## Previous findings

- None: the review of `8cb420c` raised no finding.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| AlgebraicTopology §8.8 pointed classification, changed: now from ClassifyingSpaces items 1.1–1.2, for Hausdorff CW X. Consumed here only as 8.8's bar model (F2.2, F6.3) | π=C₂ with X=RP∞; π=S₃ with X=S¹ | [RP∞,BC₂]_* ↔ Hom(ℤ/2,ℤ/2): 2 elements, which is \|H¹(RP∞;𝔽₂)\| by 8.10. Hom(ℤ,S₃): 6 based classes and 3 unbased orbits (conjugacy classes) | holds; no statement here uses the classification | — |
| CharacteristicClasses C3.1 Leray–Hirsch, changed to an arbitrary base. Consumed through C3's `H^*(BO(n);𝔽₂)` in F2.4 | BO(1)²→BO(2), fibre RP¹; W×S² with W the Warsaw circle | ranks of 𝔽₂[x₁,x₂] by degree are 1,2,3,4,5 = (1,1,2,2,3)·(1+t). W is weakly contractible, so H*(W×S²) has ranks 1,0,1 = H*(W)⊗H*(S²) | holds; `hatcher-at` line 18718 extends 4D.1 to an arbitrary B | — |
| F2.2 admissible basis and Milnor dual at p=2 (R01: also TangentialBordism B4.2) | degrees 0–5 | Admissible monomials: 1; Sq¹; Sq²; Sq³, Sq²Sq¹; Sq⁴, Sq³Sq¹; Sq⁵, Sq⁴Sq¹, dimensions 1,1,1,2,2,2. 𝔽₂[ξ_i] with \|ξ_i\|=2^i−1: 1,1,1,2,2,2 | agree | R01 |
| F2.2 Serre–Cartan theorem (Hatcher p. 500), n=1 | p=2, p=3 | p=2: excess below 1 leaves ι alone, giving 𝔽₂[ι]. p=3: β has excess 0 in the odd convention (`hatcher-at` line 21557), giving Λ[ι]⊗𝔽₃[βι] | matches lines 21574–21575 | — |
| F2.4 additive MO splitting and π_*MO (R01: also TangentialBordism B4.4) | degrees 0–5 | H_*(MO)=𝔽₂[a_i]: 1,1,2,3,5,7. A_*: 1,1,1,2,2,2. Primitives P: 1,0,1,0,2,1, the same as 𝔽₂[x_d : d≠2^j−1] (x₂; x₄, x₂²; x₅) | agree | R01 |
| F4.1 three-fold Toda brackets (R01: also HomotopySpheres 3C.3) | ⟨2,η,2⟩ and ⟨η,2,η⟩ stably; ⟨2,2,2⟩ on S⁰ | ⟨2,η,2⟩={η²}, indeterminacy 2π₂ˢ=0. ⟨η,2,η⟩={2ν,6ν}, indeterminacy {0,η³}={0,4ν}. ⟨2,2,2⟩ is undefined, since 4≠0 in π₀ˢ=ℤ | definition fixes these | R01 |
| F6.2 James construction (R01: also HomotopySpheres 3B) | Y=S², Y=S⁰ | J(S²) has cells in dimensions 0,2,4,…; H_*(ΩS³;ℤ)=ℤ[b] with \|b\|=2, and H*(ΩS³;ℤ) has x²=2γ₂. π₀J(S⁰)=ℕ≠ℤ=π₀ΩS¹, which connectedness excludes (line 2181) | holds | R01 |

The rows for this roadmap's other statements stand as in the review of `8cb420c`, including the three headline theorems and the seeded sample.

- **Folder.** `git diff 8cb420c..HEAD -- TauCetiRoadmap/BordismFormalGroups` is empty. The 7 commits since then touch only AdicSpacesPartIII, AlgebraicTopology, CharacteristicClasses, ClassifyingSpaces, ComplexKahlerGeometry and TopologicalKTheory, and none of them adds or removes a mention of BordismFormalGroups.
- **Gate.** The worker's gate at `78bda3b` passes every check (`build=0`). My rerun differs only in `outside-folder=24`: the README and `Suggested.lean` of the 12 sibling folders that the brief names as this pull request's own. `git diff --stat origin/main...HEAD` with all 13 folders excluded is empty.
- **Dependency check.** Output: `depcheck: 206 roadmaps, 1908 edges, 0 problem(s)`, with no UPWARD or CYCLE line. ClassifyingSpaces, newly a supplier of AlgebraicTopology §§8.8 and 8.14, does not mention BordismFormalGroups.
- **Elaboration.** `lake env lean` gives 3 `sorry` warnings (lines 75, 90, 116) and nothing else. `#check @name` on all 4 declarations matches `signatures.md`. That file's fifth entry, "`,` (line 31)", comes from parsing the module docstring and is not a declaration.
- **Citations resolved at this head.** AlgebraicTopology §§5.5, 8.3, 8.7, 8.8, 8.8c and 8.10 are at lines 2366, 3893, 4186, 4251, 4343 and 4600, and its consumer line 5375 names this roadmap. CharacteristicClasses C3 and Conventions, and TopologicalKTheory Conventions and T2.5, also resolve. The diff leaves CharacteristicClasses' Conventions and TopologicalKTheory's Conventions and T2.5 untouched.
- **Sources.** 7 `hatcher-at` locators checked against the text: Theorem 4D.1 (line 18645, p. 432), with its arbitrary-base step at line 18718; Theorem 3.19 (line 9541, p. 220); the theorem on p. 500 (line 21565) and the odd excess (line 21557); Theorems 4L.12, 4L.13 and 4L.16 (lines 21777, 21864, 22197).
- **Overlap.** The anchor `#f65-local-group-actions-and-completion-comparisons` is cited only at main's GeneralizedCohomology line 46. That link is pinned to blob `d5255545`, and the line is gone at this head; the id F6.5 stays in the heading. In the merge-order block, #1808 and #1854 follow this pull request.
- **Pull request text.** The rest of the summary block and the BordismFormalGroups paragraph match the head: the EllipticCohomology and GeneralizedCohomology loop cuts, the §§5.5, 8.3 and 8.8c citations, and the three named headlines.

Overlap check: I read the open ChromaticHomotopyTheory, GeneralAlgebraicKTheoryPartII and StableHomotopyKTheoryPartII; GeneralizedCohomology at this head; and EllipticCohomology and TangentialBordism on main.
- BordismFormalGroups owns the formal groups, BP/K(n), Landweber exactness, Lubin–Tate, F6.1–F6.4 and F6.5's Tate constructions; the three open roadmaps cite them.
- GeneralizedCohomology owns spectra and the G2.11 foundations.
- EllipticCohomology owns elliptic realization and tmf.
- The Steenrod algebras, Adams towers, the MO splitting, the James construction and Toda brackets have no single owner (R01); StableHomotopyKTheoryPartII line 12 names TangentialBordism as the Steenrod owner.

Remark on untouched text (no change requested): F6.3 (line 2619) builds `B_2^(2p^n)` from the skeleta of 8.8's bar model. At odd p these are larger than the lens skeleta whose basis it lists. At p=3, H⁶ of the nerve's 6-skeleton has 𝔽₃-dimension 64−21=43, not 1.

## Not verifiable

- None. Every locator checked is in `hatcher-at`. The uncertified sources are cited by locator only, in text that has not changed.

## Source issues

- none
