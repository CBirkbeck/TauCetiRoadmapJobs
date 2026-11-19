# Review of PurityForFlatCohomology (pull request #1840 at 261d3fe)

**Verdict:** accepted

**Summary.** Accepted: the 109 lines changed since `06dec78` are correct. The new definition of `RΓ_Z(X, −)` as a right derived functor with its triangle, the local groups, the Mayer–Vietoris route through excision and the étale comparison through EtaleCohomologyFoundations §0.7 were recomputed and their library and supplier citations opened; the small correction of the previous review is repaired. There is one small correction (a locator) and two format notes, none blocking. Three facts on the merge order and on a source not read remain for the human reviewers.

## C01 — The locator "[CS24] §1.4 and Lemma 7.1.1, p. 86" does not contain the derived-functor description of `H^i_Z(X, −)` that it is attached to.

In the bullet "The complex" of §0.2 (line 920), a reader who opens the source to find "`H^i_Z(X, −)` is the `i`-th right derived functor of `Γ_Z(X, −)` on fppf abelian sheaves" finds something else: §1.4 (CS24 lines 321–322, printed p. 8) only fixes that cohomology is formed in the fppf topology, and Lemma 7.1.1 (CS24 lines 3623–3626, printed p. 86) is the local-to-global spectral sequence, proved by reference to [BC22] Lemma 2.3.2. The statement itself is true and the route written after it proves it (`Γ_Z(X, −) = Hom(ℤ_X/ℤ_U, −)`), so nothing depends on the source. It would be enough to say what the locator is for, for instance "(the convention of [CS24] §1.4; used in the proof of Lemma 7.1.1, p. 86)", or to drop it here, since the spectral-sequence bullet already cites Lemma 7.1.1.

## N01 — Convention 3 (line 265) writes `localFppfCohomology` in code font, while §0.2 (line 926) introduces it in italics as a proposed name and `Suggested.lean` does not declare it; italics in both places would tell a reader it is a proposal.

## N02 — "later in the merge order" (Scope and ownership, lines 234–235) is still process vocabulary in a text meant to be timeless; "SchemeAndStackFoundationsPartII takes statements of this roadmap" says the same.

## Previous findings

The previous review, of `06dec78`, had no finding; its two remarks:

- C01 (the bullet on HeightsRationalPointsAndObstructions) — repaired: "No statement or route here uses them; they are named because the forms kept here are wider" (line 227).
- N01 ("later in the merge order") — not repaired: the phrase stands at lines 234–235; written again as N02.

The repair introduced no new problem. The pull request's title and description were read against this head: no sentence is contradicted (EtaleCohomologyFoundations, already a supplier on main, is now also cited for §0.7; the description says roadmaps on main are cited by name, and names §2.9a and the pull request that adds it). No change outside the folder.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §0.2 `RΓ_Z(X, −)` as right derived functor of `Γ_Z`, with its triangle | `Z = ∅`; `Z = X`; DVR, `𝔾_m`; injective `I` | `ℤ_X/ℤ_U = 0`, `RΓ_Z = 0`; `ℤ_∅ = 0`, `RΓ_Z = RΓ`; `H⁰ = ker(R^× → K^×) = 0`, `H¹ = K^×/R^× = ℤ`; `Hom(ℤ_X, I) → Hom(ℤ_U, I)` onto since `ℤ_U ↪ ℤ_X` | sound; agrees with the Checks of §0.2 |
| §0.2 functoriality in `(X, Z, F)` under `f⁻¹(Z) ⊆ Z′` | `X′ = U`, `Z′ = ∅`; `X′ = X`, `Z = X`, `Z′ = ∅` | `U′ ⊆ f⁻¹(U)`, map to `0`; condition fails and `F(X) → 0` is not restriction | sound; same condition as §2.9a at its head |
| §0.2 local groups `H^i_𝔪(R, F)` | field; DVR | `U_R = ∅`, `H^i_𝔪 = H^i(R, F)`; `U_R = Spec K` | sound; `TauCeti.IsLocalRing.puncturedSpectrum` is an open of `Spec R` |
| §0.2 Mayer–Vietoris through excision | `V_1 = V_2 = X`; `V_2 = ∅`; `ℙ¹ = 𝔸¹ ∪ 𝔸¹`, `𝔾_m` | `Z = ∅`, diagonal then difference, exact; `Z = X ⊂ V_1`, `H(X) → H(X) ⊕ 0 → 0`; `(k^×)² → k^× × ℤ → Pic = ℤ → 0` | sound; `V_1 ∖ Z = V_1 ∩ V_2` |
| §0.2 smooth groups: fppf against étale supports | DVR, `𝔾_m`; `𝔽_p⟦x⟧`, `μ_p` (not smooth) | `ℤ` on both sides; étale `H¹(U) = 0` against fppf `K^×/K^{×p} ≠ 0`, excluded by smoothness | sound; §0.7 of EtaleCohomologyFoundations allows every ring `Λ`, so `Λ = ℤ` |
| Mathlib contract: Mayer–Vietoris needs `HasSheafify J AddCommGrpCat.{v}` | the variable block of the file | sheaf in `AddCommGrpCat.{v}`, `HasSheafify J AddCommGrpCat.{v}`, `HasExt.{w}` | true at the pin |
| Coefficients enter through the lift of §2.9a | `Ga`, `Gm`, `mu`; `homPresheaf G` | `Sheaf (fpqcTopology.over S) AddCommGrpCat.{u}` each; representable, fpqc subcanonical | sound |
| C01 (locator) | CS24 §1.4; Lemma 7.1.1 | fppf convention only; spectral sequence only | small correction |

The rows for the untouched statements stand as in the previous review, of `06dec78`.

- Source locators checked against the text: 3 (CS24 lines 321–322 and 3623–3626; BC22 line 1126, Lemma 2.3.2). Of the seeded sample only §0.2 falls in the changed passages.
- Library declarations opened at the pins: `Mathlib/Algebra/Homology/DerivedCategory/RightDerivedFunctorPlus.lean:47` (`Functor.rightDerivedFunctorPlus`, additive, `EnoughInjectives`), `:83` (triangulated), `:156` (`NatTrans.rightDerivedFunctorPlus`); `Mathlib/CategoryTheory/Abelian/GrothendieckCategory/EnoughInjectives.lean:381`; `Mathlib/CategoryTheory/Sites/SheafCohomology/MayerVietoris.lean:33–35`; `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:64`; `Mathlib/AlgebraicGeometry/Sites/Fpqc.lean:88`; `TauCeti/AlgebraicGeometry/Sites/Big/StructureSheaf.lean:103, 126, 202`; `TauCeti/AlgebraicGeometry/PuncturedSpectrum.lean:52`.
- Cross-roadmap citations resolved: EtaleCohomologyFoundations §0.7 on main (README line 766: any scheme, closed subscheme, any ring `Λ`, `i^!`, the triangle, nested supports, excision); SchemeAndStackFoundations §2.9a at the head of its open revision (the lift `Scheme.fppfSheafLift`, values in `AddCommGrpCat.{u+1}`, Grothendieck abelian, naturality in the pair for `f⁻¹ Z ⊆ Z′`, excision; it hands Mayer–Vietoris and the comparisons to §0.2 here).
- Elaboration: `lake env lean` on `TauCetiRoadmap/PurityForFlatCohomology/Suggested.lean` gives 15 `sorry` warnings and nothing else. The Lean file is unchanged since `06dec78`, so the comparison of the 25 elaborated types and the one-tactic probe of the previous review stand.
- Automatic checks: all passed on this head; none set aside. Dependency check: `depcheck: 199 roadmaps, 2191 edges, 0 problem(s)`, no UPWARD or CYCLE line.

Overlap check: read SchemeAndStackFoundations at the head of the open revision that adds §2.9a, SchemeAndStackFoundationsPartII (open) and EtaleCohomologyFoundations (main) for the changed objects; LocalPurity and PerfectoidQuotientsPartII stand as in the previous review. The complex `RΓ_Z` with its triangle, the local groups and Mayer–Vietoris for fppf cohomology: here (§2.9a at its head says so). The construction, long exact sequence, excision for opens and the triple sequence: SchemeAndStackFoundations §2.9a. Étale cohomology with supports: EtaleCohomologyFoundations §0.7, cited.

Source independence: changed passages only; 3 passages compared with 2 sources (CS24, BC22), none shared; largest share CS24, as in the previous review (127 of 213 bracketed locators); the change adds, removes or reorders no layer, so the contents were not compared again: independent as found there.

Research link: The headlines are the theorems of Česnavičius–Scholze, *Purity for flat cohomology* (Ann. of Math. 2024), which settle Gabber's 2004 conjectures on local Picard and Brauer groups, and of Česnavičius, *Purity for the Brauer group* (Duke 2019); README Summary and References, statements read in CS24 and C19.

## Not verifiable

- The sources outside the changed passages were not reopened in this incremental re-review; the list of the previous review stands ([Aus62], [Avr77], [Gab04b], [MB85], [Bou78], [BH], [DF84], [Gro68], SGA 3, SGA 4 cited by locator without text).

## Source issues

- none

## For the human reviewers

- Supplier still open: SchemeAndStackFoundations §2.9a, on which Layer 0 is built, exists only at the head of pull request 2531; the description says that pull request has to merge first.
- Merge order: the merge-order file lists EtaleDualityAndPerverseSheavesPartII (line 423) after this roadmap (line 235), although it is on main and supplies §1.6 here.
- Not read: [Aus62] Theorem 1.3 supports the stated headline `free_of_endomorphisms_iso_pi`; the statement follows its use in CS24 (proof of Theorem 7.1.3, p. 88).
