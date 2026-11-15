# Review of DeligneWeightsAndPurityPartII (pull request #1760 at 7268ab8)

**Verdict:** accepted

Incremental re-review of the 10 lines changed since 71dd669 (the new `## Provenance` section, `TauCetiRoadmap/DeligneWeightsAndPurityPartII/README.md:1002`–`:1010`), and of the pull request's title and description against this head. No finding.

## Previous findings

- none: the previous report, of 71dd669, had no finding of its own (its R01 and R02 bullets, both repaired, concern f44c08c; the passages at :33, :953 and the description's `Suggested.lean` sentence are unchanged at this head).

## Verified sound

| Statement | Instances and computed values on both sides | Result/change |
|---|---|---|
| :1004, repository facts | At commit 27cdb20: `LICENSE` is Apache 2.0; `lean-toolchain` is `v4.34.0-rc2`; `lakefile.toml` requires AxiomMath/Stacks. This repository's `lean-toolchain`: `v4.36.0-rc2` | As written; not a dependency (`Suggested.lean` imports only Mathlib) |
| :1006, `Weil.satisfiesWeilEstimate` against DeligneWeightsAndPurity §7.15(ii) | External (`DeligneWeilConjecture.lean:367`): `[IsProper f] [Smooth f]`, k `Fintype`, ℓ ≠ `ringChar k`; root μ of charpoly of geometric Frobenius is algebraic with norm `(#k)^(ν/2)`. §7.15(ii): eigenvalues are Weil q-numbers of weight i. ν = 0: norm 1 both sides | Same eigenvalue assertion; integrality and ℓ-independence of §7.15(ii) are not claimed for the file. §0.10 (:399) and §1.1 (:423) both list §7.15 |
| :1007, all-embeddings criterion against DeligneWeightsAndPurity §0.6 | External (`WeilEstimateFromPurityAllEmbeddings.lean:79`): φ on finite-dimensional `ℚ_[ℓ]`-space, hypothesis for every `ι : ℚ_[ℓ] →+* ℂ`, conclusion norm `Q^(w/2)` on `ℚ⟮x⟯`. §0.6: E of characteristic 0, `#E ≤ 𝔠`, q > 1; `#ℚ_ℓ = 𝔠` | E = `ℚ_ℓ` is admissible; the external statement also allows Q ≤ 1, outside §0.6. §1.1 (:414) applies "its all-embeddings scalar criterion" |
| :1008, `ArisesByGoodReduction` against §0.10 | External (`Definitions.lean:298`): domain R of finite type over ℤ, smooth projective X → Spec R, `R →+* ℂ`, `R →+* κ`, two base-change isomorphisms. §0.10: proper smooth scheme over `O_k`, k local. `O_k` = `ℤ_p` is not of finite type over ℤ | Different notions, as the bullet says |
| :1010, the other files of the directory | 30 files at the commit; the 27 others by name: Betti numbers, charpoly degree and integrality, closed-point degrees, field of constants, point counts, Poincaré pairing, trace formula, representation sheaves, zeta series, Euler product, rationality, functional equation | None names a local field, inertia, monodromy, tilting, rigid neighbourhoods or toric varieties |
| §0.10 (seeded target the change cites) | SCH12 line 2564 (p. 308): good-reduction primes and the Weil conjectures. Unramified case: N = 0, only `Gr_0`, weight i | Locator as cited; statement untouched |

Rows for statements the diff does not touch stand as in the previous review, of 71dd669.

- Gate rerun at 7268ab8: every counter 0, `OK`; the worker's run adds `build=0`. Nothing changed outside the folder against the base.
- Dependency check rerun: `depcheck: 238 roadmaps, 2254 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. The change adds no supplier.
- Elaboration: `lake env lean` on `TauCetiRoadmap/DeligneWeightsAndPurityPartII/Suggested.lean` exits 0 with no output; the file declares nothing, so the `#check` comparison and the one-tactic probe have empty inventories.
- External files opened at commit 27cdb20 (7): `Trace/DeligneWeilConjecture.lean`, `Trace/WeilEstimateFromPurityAllEmbeddings.lean`, `Trace/BettiNumberGoodReduction.lean`, `Definitions.lean`, `LICENSE`, `lean-toolchain`, `lakefile.toml`, and the listing of `Trace`. All six links of the section resolve; the three backticked names are declared there.
- Cross-roadmap citations resolved (2): DeligneWeightsAndPurity §0.6 and §7.15 at its open head (README :665, :2309). Its own provenance section maps the same two files to its §§0.6 and 7.15(i)–(ii), which agrees.
- Shape and policy: a secondary provenance section is what the repository README asks for under "Porting existing work"; no pull-request number, no process narrative, no backticked name of this roadmap's own.
- Title and description read against the head: every sentence still holds (adds the folder; `Suggested.lean` declares nothing; nine open suppliers unchanged); the new section adds no supplier, target or declaration, so nothing the description must state.
- Remark on untouched text: §1.1's *Needs* line (:423) and Layer 1's Dependencies (:443) name DeligneWeightsAndPurity §§0.19, 5.11, 7.15 but not §0.6, whose criterion §1.1's route (:414) applies.

Overlap check: read DeligneWeightsAndPurity (§§0.6, 7.15 and its provenance section), ClassicalAdicEtaleCohomology (its provenance section), AnalyticToricGeometryPartII and EtaleCohomologyFoundations; the changed passage shares the finite-field Weil estimate and the all-embeddings criterion with DeligneWeightsAndPurity, which owns them and is cited; nothing else shared.

Source independence: changed passages only; 3 passages compared with 1 source (the docstrings of the three linked AxiomMath/Weil files), none shared beyond forced hypothesis lists (longest common run 7 words); largest share ITO20, 94 of 187 source mentions; no layer added, removed or reordered, so the contents were not compared again.

## Not verifiable

- LUT93, HUB96, HUB98: settled as uncertified; the changed passage does not cite them.
- The description's account of earlier review rounds and of who ported the package: not checkable from the head.
- Whether the AxiomMath/Weil declarations compile: not built here (another toolchain); only their statements were read.

## Source issues

- none

## For the human reviewers

- ITO20, the source with the largest share of locators, is cited as arXiv:2008.07794v1 (`TauCetiRoadmap/DeligneWeightsAndPurityPartII/README.md:994`); the README gives no journal reference for it.
- The README now links AxiomMath/Weil at commit 27cdb20 (`TauCetiRoadmap/DeligneWeightsAndPurityPartII/README.md:1004`); its `LICENSE` there is Apache 2.0. `Suggested.lean` declares nothing, so no Lean here is adapted from it.
