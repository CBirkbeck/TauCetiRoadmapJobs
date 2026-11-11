# Review of ClassifyingTopoi (pull request #1997 at a2de104)

**Verdict:** needs changes

## R01 (P3) — 4.2's sheaf input is already at the pins; §2.9 now hands `𝔾_a` to Tau Ceti

**Location** `TauCetiRoadmap/ClassifyingTopoi/README.md` lines 68–70 (also 29–30, 203–206, 771–772, 779, 825): "**Left to SchemeAndStackFoundations.** The sheaf `𝔾_a = (O_S)^a`, `T ↦ Γ(T, O_T)`, on the big site over a scheme `S`, and the fact that it is a sheaf for the Zariski, étale, fppf and fpqc topologies (SchemeAndStackFoundations §2.9)."

**Claim** SchemeAndStackFoundations §2.9, as changed on main, now gives this sheaf to Tau Ceti. The fact that 4.2 consumes, that `Γ` is a Zariski sheaf, is a pinned declaration. The README instead routes it through §2.9's unbuilt `bigSheaf_isSheaf`, and its Tau Ceti and Mathlib contracts leave the pinned names out.

**Witness** SchemeAndStackFoundations README lines 4602–4604 say `bigStructureSheaf S` and `Ga S` "are Tau Ceti's". At the pins, `example : Presheaf.IsSheaf Scheme.zariskiTopology Scheme.Γ := GrothendieckTopology.isSheaf_Γ _` elaborates (Tau Ceti `StructureSheaf.lean:72`; Mathlib `BigZariski.lean:57`).

**Repair** Replace lines 68–73 with: "**Supplied by Tau Ceti and Mathlib.** The global sections functor `Scheme.Γ` is a sheaf for every subcanonical topology on schemes (Tau Ceti `CategoryTheory.GrothendieckTopology.isSheaf_Γ`, `TauCeti/AlgebraicGeometry/Sites/Big/StructureSheaf.lean`), in particular for Mathlib's `Scheme.zariskiTopology` (`Scheme.subcanonical_zariskiTopology`). On the big fpqc site over `S` its additive group is Tau Ceti's `AlgebraicGeometry.Scheme.Ga`. The forgetful functor of 4.2 is its restriction to the `Spec A` with `A` finitely presented (`Scheme.ΓSpecIso`). This roadmap owns only the Zariski topology on `FPRing.{u}ᵒᵖ` and the restriction."

Then make four matching edits:
- In 4.2 (lines 771–772), replace "SchemeAndStackFoundations §2.9: `𝔾_a` is a sheaf for the Zariski topology of the big site over `Spec ℤ`" with "Tau Ceti's `GrothendieckTopology.isSheaf_Γ` for Mathlib's `Scheme.zariskiTopology`".
- In 4.2's *Needs:* (line 779), replace "SchemeAndStackFoundations §2.9" with "Tau Ceti `CategoryTheory.GrothendieckTopology.isSheaf_Γ`; Mathlib `Scheme.zariskiTopology`, `Scheme.subcanonical_zariskiTopology`, `Scheme.ΓSpecIso`".
- List those names under "From Tau Ceti" and "From Mathlib".
- Drop the "From SchemeAndStackFoundations" contract (lines 203–206), the §2.9 supplier mentions at lines 29–30 and 825, and the description's SchemeAndStackFoundations bullet.

The probe in the Witness elaborates at the pins.

## R02 (P3) — the description's dependency-check sentence no longer holds

**Location** Pull request description, "Acceptance test": "The worker's gate gives 0 on every check. Locally, depcheck only reports that the roadmap is not in the public merge-order file."

**Claim** At this head the dependency check reports nothing: the merge order now lists ClassifyingTopoi, so the "not in the merge-order file" report is gone.

**Witness** The gate at a2de104 gives `depcheck=0 … OK`. The dependency check prints only `depcheck: 207 roadmaps, 1914 edges, 0 problem(s)`. ClassifyingTopoi is line 408 of the merge order.

**Repair** Replace the second sentence with: "The merge order lists ClassifyingTopoi, and the dependency check reports no problem: nothing is UPWARD or a CYCLE."

## Previous findings

- None: the report of 5e87b40 raised no finding.

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 4.2 `isSheaf_forget_zariskiTopology`, degenerate cover | zero ring `⟨0, ⊤, _⟩`, `s = ∅` | `Ideal.span ∅ = ⊥ = ⊤`: empty sieve covers; sheaf value must be one point; `MvPolynomial (Fin 0) ℤ ⧸ ⊤` has one element | holds |
| 4.2, binary cover | `ℤ`, `s = {2, 3}` | `3 − 2 = 1`; `a/2^i = b/3^j` in `ℤ[1/6]` gives `a·3^j = b·2^i`, so `2^i ∣ a`, unique glued element in `ℤ` | holds |
| 4.2, non-cover | sieve of `ℤ ⟶ ℤ[1/2]` | `span {2} = 2ℤ ≠ ⊤`; `ℤ[1/2] ⊗ ℤ[1/2] = ℤ[1/2]`, equalizer `ℤ[1/2] ≠ ℤ` | excluded, as the Check says |
| 4.2 input at the pins (R01) | `Scheme.zariskiTopology`, `Spec ℤ`, `Spec A` | `isSheaf_Γ _` elaborates (exit 0); `ΓSpecIso` gives `ℤ`, and `A` = `FPRing.forget` value | input pinned |
| 4.3 (uses 4.2) | `ℤ`, `x = 3`; cover `{ℤ[1/3], ℤ[1/(−2)]}` | `3`, `−2` non-units in `ℤ`; `3` a unit in `ℤ[1/3]`, `1 − 3` a unit in `ℤ[1/(−2)]` | local on the cover only, as stated |

The rows for statements that did not change stand as in the previous review, of `5e87b40`.

- Gate, run by hand at a2de104: every check 0, `OK`, with `depcheck=0`. The worker's gate: the same, with `build=0`.
- Dependency check against the candidate order: `depcheck: 207 roadmaps, 1914 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `TauCetiRoadmap/ClassifyingTopoi/Suggested.lean`: exit 0, 18 warnings, all "declaration uses `sorry`". The folder and the pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`) are unchanged since 5e87b40, so the earlier signature and one-tactic passes stand. `git diff --stat origin/main...HEAD` outside the folder is empty.
- Cross-roadmap citations resolved, 16: SchemeAndStackFoundations §2.9 on main (lines 4587–4642, identical to the head's copy, with `bigSheaf_isSheaf` and `bigSheaf_structureSheaf`); GrothendieckTopoi at its head, 11 (1.1, 1.2, 2.1, 2.2 `homEquivInverse`, 2.5 `IsFiltering`, 4.1, 4.2 at line 678, 6.1 `nonempty_point_equivalence`, Conventions 1 and 4, Out of scope); LocallyPresentableCategories at its head, 4 (1.5, 3.1, 3.5, Left to other roadmaps).
- Library declarations opened at the pins, 10: Tau Ceti `StructureSheaf.lean` lines 72, 84, 96, 103 and 116; Mathlib `BigZariski.lean` lines 51 and 57, `Fpqc.lean` lines 81 and 88, `Scheme.lean` line 602.
- Overlaps: none reported. An ownership grep of main and the open heads for classifying topoi, geometric theories, syntactic sites and object classifiers finds only exclusions (GrothendieckTopoi, LocallyPresentableCategories) and example uses (AdicSpacesPartIV on main, AlgebraicModuliForArithmeticGeometry line 7163).
- Remark on untouched text: GrothendieckTopoi 1.2 at its head does not mention images, although README line 195 cites it for them. Mathlib's `HasImages (Sheaf J (Type u))` (line 177) supplies them.

## Not verifiable

- Mac Lane–Moerdijk, VIII.6, pp. 445–450 (4.2 and 4.3): Springer, paywalled. Its sample locator was not checked against the text.
- Hakim 1972, Chapitre III, §3 (4.3): Springer, paywalled.
- The other seeded-sample targets (1.1–4.1) fall in text that did not change since 5e87b40 and were not reopened.

## Source issues

- none
