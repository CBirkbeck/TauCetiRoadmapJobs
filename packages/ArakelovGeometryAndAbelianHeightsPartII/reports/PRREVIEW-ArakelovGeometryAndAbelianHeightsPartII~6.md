# Review of ArakelovGeometryAndAbelianHeightsPartII (pull request #1833 at e2a7179)

**Verdict:** accepted

Incremental re-review of 7 changed lines since 581cf9f (the new section `## Existing formalizations outside Tau Ceti`, `README.md` lines 2138–2143), and of the pull request's title and description against this head. No finding.

## Previous findings

- The previous report, of 581cf9f, had no finding (R01–R03 of the round before it were recorded there as repaired); nothing to carry.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `README.md` line 2143: [n]^*c = ((n² + n)/2)c + ((n² − n)/2)[−1]^*c, "even classes by 4 and odd classes by 2" | n = 0, 1, −1, 2; c even; c odd | n=0: 0. n=1: c. n=−1: [−1]^*c. n=2: 3c + [−1]^*c; even 3c + c = 4c; odd 3c − c = 2c | agrees with `Faltings.multiplication_pullback` (`Mordell/AbelianVariety/ParallelogramRelation.lean:188` at the cited commit) and with §5.1(3), §7.1 | none |
| line 2143: a statement in `ℚ ⊗ Pic(A)` does not give [2]^*M ≅ M⁴ | M of order 2 in Pic⁰(A) | class of M in ℚ ⊗ Pic is 0, so the rational identity reads 0 = 0 and says nothing about [2]^*M ≅ M⁴ ≅ 𝒪 | the stated limitation is real | none |
| line 2142: positive definiteness on ℝ ⊗ Γ "so a point of height zero is torsion" | Γ = ℤx, x non-torsion; Γ = ℤ/m | ℤx: 1 ⊗ x ≠ 0, B > 0; for even c, B(x,x) = ĥ(x) + ĥ(−x) = 2ĥ(x) > 0. ℤ/m: ℝ ⊗ Γ = 0, no condition | agrees with `Faltings.neronTateBilinear_posDef` (`Mordell/NeronTate/PositiveDefinite.lean:524`) | none |
| line 2142: these are "the case d = 0 of §6.3" | k₀ = ℚ; quadratic k₀ | §6.3 at d = 0: empty polarization, ĥ = [k₀:ℚ]·absolute height: 1·a over ℚ, 2a over a quadratic field; the passage requires comparing normalization before use | consistent with §6.3 and its Checks; HeightsRationalPointsAndObstructions §§0.18–0.20 exist at its open head (Tate's limit, Néron–Tate heights, positivity and kernel) | none |
| line 2142: Mumford formula bounded, §9.2(2) exact | genus ≥ 1, P of degree one | outside statement: h(z,w) + ⟨jz, jw⟩ bounded on (C × C)(k̄), `[NumberField k]`; §9.2(2): j^*Θ̄ = 2D + p₁^*w + p₂^*w, an identity in P̂ic | distinction as stated; `Mordell/NeronTate/MumfordFormula/Delta.lean:94` | none |
| line 2143: outside theorem of the cube is for three maps into one abelian variety | the cube-for-products contract (line 125): U × V × W of three curves | outside: `schemePullbackClass_cube` takes (f, g, h) : B ⟶ A (`Mordell/AbelianVariety/TheoremOfTheSquare.lean:56`); contract: a sheaf on a triple product of complete varieties | not the same statement; the contract is not met from there | none |

The rows for all other statements stand as in the previous review, of 581cf9f.

- Outside declarations opened at commit `82a30cb` of AxiomMath/Mordell (7 of 7 named exist with the stated content): `Faltings.ProjectiveEmbedding.finite_setOf_pointDegree_le_height_le` (`Mordell/Height/Machine/Northcott.lean:272`), `Faltings.exists_isNeronTateHeight_of_isAlgebraic` (`Mordell/NeronTate/Existence.lean:228`), `Faltings.IsNeronTateHeight.comp` (`Mordell/NeronTate/Functoriality.lean:55`), `Faltings.IsEvenClass.finite_setOf_neronTateHeight_le_of_numberField` (`Mordell/NeronTate/Northcott.lean:188`), `Faltings.neronTateBilinear_posDef`, `Faltings.IsHeightOfClass.exists_abs_add_neronPairing_le`, `Faltings.multiplication_pullback`. The six names `scratch/citations.md` lists as found nowhere are these: they are names of the outside repository, not of the pins, and the text says so.
- Other claims of the passage checked at that commit: LICENSE is Apache-2.0; `lean-toolchain` is `leanprover/lean4:v4.35.0`; `lakefile.toml` requires AxiomMath/Stacks; carriers are `Over (Spec (.of k))` with `GrpObj` and `IsAbelianVariety k A`, classes in `ℚ ⊗[ℤ] Stacks.Picard.ofScheme A.left`; the file list of `Mordell/AbelianVariety` matches "Its remaining files".
- Pinned declarations named: `TauCeti.AlgebraicGeometry.AbelianVariety` (`TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95`), `TauCeti.AlgebraicGeometry.InvertibleSheaf` (`TauCeti/AlgebraicGeometry/LineBundle/Basic.lean:119`).
- Internal references of the passage resolved: §6.2 (line 1009), §6.3 (line 1022), §5.1(3) (line 886), §7.1 (line 1068), §9.2(2) (line 1439), §10.9a (line 1645), the cube-for-products contract (line 125); HeightsRationalPointsAndObstructions §§0.18–0.20 are consumed at line 55.
- Gate re-run on this head: every check 0, OK; the worker's gate reports build=0. No file changed outside the folder.
- Dependency check with `--movable`: `depcheck: 237 roadmaps, 2250 edges, 0 problem(s)`; no UPWARD or CYCLE line. The new section names no roadmap as supplier and says the outside repository is not one.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output. No declaration, so no `#check` comparison and no one-tactic probe. Source locators: none re-read (the changed passage carries no source locator; the seeded sample falls outside it).
- Description against the head: no sentence contradicted; the new section adds no layer, target, supplier or declaration, so the description leaves nothing unstated. A section of this kind has precedent on main (AlgebraicCurves, "Existing formalizations of this material").
- Overlap check: read HeightsRationalPointsAndObstructionsPartII, ArakelovGeometryAndAbelianHeights, ArithmeticDynamics; number-field Néron–Tate heights: HeightsRationalPointsAndObstructions §§0.18–0.20 owns, the new passage cites it; global-field adelic Picard group: ArithmeticDynamics §4.3a owns, §4.9 here compares; nothing has two owners.
- Source independence: changed passages only: 3 passages compared with 1 text (the docstrings of AxiomMath/Mordell at the cited commit), none shared beyond declaration names and the formula; largest share yuan-2026, 86 of 209 locators; contents not compared again (no layer added, removed or reordered).

## Not verifiable

- moret-bailly-1989 Théorème 2.5 (§10.12): settled as uncertified.
- faltings-1984 Theorem 6 and pp. 401–402 (§§10.11–10.12): settled as uncertified.
- Heinz, Proposition 4.3 (§7.4 route): cited only through yuan-2026 p. 112; the text itself was not consulted.
- The description's "5 independent review rounds and 2 red-team rounds": a statement about the process, not checkable against the head.
- AxiomMath/Mordell was read, not built: that its declarations compile under Lean `v4.35.0` is its README's claim.

## Source issues

- none

## For the human reviewers

- Licence: yuan-2026, the source of 86 of 209 locators, is read from the author manuscript on the author's faculty page (README References), with the journal reference Annals of Mathematics 203 (2026) given beside it.
- Licence: yuan-zhang-2025 (56 locators) and looper-silverman-wilms-2021 are cited in the README References by arXiv version only (2105.13587v9, 2101.11593v3), with no journal or book reference.
- Licence: `README.md` line 2140 allows code adapted from AxiomMath/Mordell (Apache-2.0, LICENSE at commit 82a30cb) with attribution and coordination with its authors; no code of it is in `Suggested.lean`, which declares nothing.
- Scope: `Suggested.lean` states no theorem: its docstring lists all headline theorems as not statable at the pins, so the build tests nothing about the mathematics.
