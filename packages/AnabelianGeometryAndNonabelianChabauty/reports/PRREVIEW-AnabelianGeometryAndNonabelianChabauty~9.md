# Review of AnabelianGeometryAndNonabelianChabauty (pull request #1021 at c71ec32)

**Verdict:** accepted

Incremental re-review of the 49 lines changed since 4a7e05e (the named `finiteEtale` property and its base-change instance in `Suggested.lean`, the README sentence describing them, the completed `### Dependencies` paragraphs of Layers 1–7, two corrected `*Needs:*` citations), and of the pull request's title and description against this head. No finding.

## Previous findings

- R01 — repaired: `Suggested.lean:44–54` declares `abbrev finiteEtale` and `instance finiteEtale_isStableUnderBaseChange := MorphismProperty.IsStableUnderBaseChange.inf`; `anabelian_isom` (lines 76–80) uses them, with no `let`/`letI`; `README.md:6483` names both. Gate `statement-hygiene=0`.
- R02 — repaired: `README.md:9015` now ends "…[ArithmeticKTheory] §§3.2–3.4 …; [KTheoryFiniteLocalFields] §1.8 (ℓ-adic étale Chern classes, their inverse-limit description over rings of S-integers and the transfer formula with the weight factor); …".

## Verified sound

### Adversarial pass (statements the diff changes)

| Statement | Instance | Values on each side | Result/change |
|---|---|---|---|
| `anabelian_isom` (restated through `finiteEtale`) | head file elaborated from the worktree; elaborated type against the head `4a7e05e` type | one message, `declaration uses sorry` at 61:8; binders `p, K, L, embedding, hL, X, Y`, the eight instance binders, `hX, hY` unchanged; `P` replaced by `finiteEtale` | Same statement; no binder lost |
| `finiteEtale` determines its object | identity of `X`; closed point `Spec k → 𝔸¹_k`; `𝔾_m → 𝔸¹` | finite and étale; finite, not étale (not flat); étale, not finite (not proper) | In; out; out — the meet excludes both one-sided models |
| `finiteEtale_isStableUnderBaseChange` is needed, not padding | scratch copy with the instance deleted | three errors `failed to synthesize finiteEtale.IsStableUnderBaseChangeAlong (X ↘ Spec ↧K)`, `(Y ↘ …)`, `f.inv` | Kept: required for `MorphismProperty.Over.pullback` to elaborate |
| Instance body | Mathlib `CategoryTheory/MorphismProperty/Limits.lean:396` | `IsStableUnderBaseChange.inf : IsStableUnderBaseChange (P ⊓ Q)` from the two factors; real body, no `sorry` | No sorry'd data |
| `README.md:4021`, `4445`: "ReductiveGroups Layer 4 (tori)" | ReductiveGroups on main | Layer 0 "the functor of points and the three-way dictionary"; Layer 4 "Jordan decomposition, diagonalizable groups, tori" | Corrected citation resolves |
| `README.md:8477`, `9015`: "ProfiniteCohomology Layer 2" | ProfiniteCohomology on main, line 1023 | "Layer 2: the explicit low-degree complex and its functoriality" | Resolves; description agrees |
| `README.md:8433`: ArithmeticGaloisDuality §D7.4, §D7.5 | supplier at its open head | D7.4 contains "The local invariant map as a quasi-isomorphism"; D7.5 contains "Local duality over finite and local coefficient fields" | Both resolve to the statements named |

Rows for statements the diff leaves untouched stand as in the previous review, of `4a7e05e`.

- Cross-roadmap citations resolved, 33 (every entry the diff adds to the seven `### Dependencies` paragraphs), each against main or the supplier's open head and against a use inside the same layer: JacobianChallenge Layers D–F and E; AlgebraicModuliForArithmeticGeometry §§7.3–7.6; AbelianSchemesAndArithmeticModuli §A3.2; ReductiveGroups Layer 4; ReductiveGroupsPartII §RG2.0a and §RG2.0a.1; ComplexComparisonPartII §§C5.1, C5.5, C5.7, C6.2–C6.3; DerivedModuleAlgebra §§1.2–1.6; MotivesAndAlgebraicCycles §§6.1–6.3, 6.8; HeightsRationalPointsAndObstructions §§0.18–0.20, 1.1, 1.6–1.7; ProfiniteCohomology Layers 2, 5, 9; NeronModelsAndSemistableAbelianVarieties §§1.1, 5.0a; ArakelovGeometryAndAbelianHeights §1.13; PadicPeriodRings §§4.1–4.3; ResolutionOfSingularitiesCharacteristicZero §§6.1–6.2; AffineMorseLefschetz §A5; RigidAnalyticGeometry §6.2; PadicDifferentialEquationsAndRigidCohomology Layer RD.3; ArithmeticGaloisDuality Layer D7, §§D7.4–D7.5; ArithmeticKTheory §§3.2–3.4; KTheoryFiniteLocalFields §1.8; GeometryOfNumbersAndQuadraticArithmetic §6.1. All exist with the stated content; none is in the list of roadmaps never cited as suppliers.
- Library declarations opened at the pin, 3: Mathlib `MorphismProperty.IsStableUnderBaseChange.inf` (`CategoryTheory/MorphismProperty/Limits.lean:396`); Tau Ceti `AlgebraicGeometry/FiniteEtale/MorphismProperty.lean:40–50` (uses `(@IsFinite ⊓ @Etale).Over ⊤ S` with a local `letI … := .inf`, so neither pin has a named finite étale morphism property or a global instance to cite instead); `TauCeti.AlgebraicGeometry.Cohomology.Genus` (the file's only Tau Ceti import, builds).
- Ownership of the new names: `finiteEtale` occurs as `TauCetiRoadmap.LocalPurity.finiteEtale` on main with the same body; the fully qualified names differ and a `Suggested.lean` imports no roadmap module, so there is no clash.
- Merge order and dependency check: `depcheck: 247 roadmaps, 2261 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Every roadmap the README names is on main, in the description's dependency blocks, or a consumer (EffectiveDiophantineMethods, PeriodsAndSpecialValues).
- Gate (my run on this head): every counter 0, `OK`; the worker's run adds `build=0`. Elaboration of `Suggested.lean`: `sorry` the only warning. `git diff --stat origin/main...HEAD` outside the folder is empty.
- Pull request text against this head: title and each prose sentence read against the README (Summary, Scope and ownership, Conventions, How to read the build, §7.5, Downstream consumers) and the Lean header. The folder is described as an added roadmap of three files; "S-unit finiteness by Chabauty–Kim" is §7.5; "holds over any field" is `README.md:3774–3775`; the consumer sentence agrees with Downstream consumers; "real-bodied definitions and theorems" agrees with the three declarations; the validation sentence agrees with the gate. Nothing contradicted, nothing a reader must know left out.
- Seeded sample (0.5, 0.6, 0.11, 0.15, 0.32, 0.33, 1.1, 1.2, 2.1, 2.5, 4.1, 6.2, 6.4, 7.4, 7.5): none falls in the changed passages (the diff touches §1.7's and §7.0's `*Needs:*` lines, §3.11's description of the Lean statement and the seven dependency paragraphs); not re-examined.
- Overlap leads: the anchor `#layer-4-the-tame-quotient-of-the-absolute-galois-group` (`README.md:5808`, `5925`, `6538`) resolves on main, and the open revision of LocalFieldsRamification maps "Layer 4" in its table of former layer numbers, so the citation stays valid. The lead "AlgebraicVectorBundles has no Layer 0" (`README.md:13`) is a false positive: that roadmap maps its labels L0A and L0B to Layers 1 and 2.

Overlap check: read EffectiveDiophantineMethods, PadicDifferentialEquationsAndRigidCohomology, HeightsRationalPointsAndObstructions, InverseGaloisAndArithmeticFundamentalGroups, PadicHodgeRegulators (the open list by vocabulary; the lists on main and by results are empty); nothing shared: each object in common has one owner and a citation from the other side (universal unipotent connection, quadratic Chabauty pairs and the determinant criterion: this roadmap, cited by EffectiveDiophantineMethods; formal logarithms: HeightsRationalPointsAndObstructions §§1.15a–1.16, cited at `README.md:19`; étale path groupoid and tame tangential fibres: InverseGaloisAndArithmeticFundamentalGroups Layer IG.0 and §IG.1.2, cited here).

Source independence: changed passages only; the changed passages carry no source locator and no source-derived prose (supplier lists, one sentence describing the Lean declarations, two Lean docstrings), so 0 passages compared with 0 sources; no layer added, removed or reordered, so the contents were not compared again.

## Not verifiable

- The passages the diff does not touch were not re-examined; the earlier reports' unverifiable items stand (Huber–Wildeshaus Lemma B.4.7 and Theorem B.4.8, Hadian's thesis, Labute 1967, the published Achinger, Serre Chapter V, Stix 2013, Kim 2008's published pagination).
- Ownership against open pull requests whose files the brief does not supply was checked only through the index search.

## Source issues

- none

## For the human reviewers

- **Not tested.** Huber–Wildeshaus (Documenta Mathematica 3, 1998), cited at `README.md:8459` for Lemma B.4.7 and Theorem B.4.8, could not be read; its two locators and wording were not compared.
- **Licence.** The Weibel reference (`README.md:9067`) is cited from the author-hosted preprint with the preprint's pagination, not from the published version.
