# Review of ClassicalAdicEtaleCohomologyPartII (pull request #1549 at 3cf97a5)

**Verdict:** accepted

Incremental re-review of 10 changed lines since 03b098b: the new section `## Existing formalizations outside Tau Ceti` of `TauCetiRoadmap/ClassicalAdicEtaleCohomologyPartII/README.md` (lines 1342–1350). No finding.

## Previous findings

- The previous report (of 03b098b) had no finding; nothing is carried.

## Verified sound

**The changed passage against what it cites.** Each claim of `README.md:1342`–`1350` was set beside the repository it describes at the pinned commit 27cdb20, and beside the roadmap sections it names:

| Claim of the new section | What was read | Result |
|---|---|---|
| AxiomMath/Weil is Apache-2.0, follows Freitag–Kiehl, built on Mathlib and AxiomMath/Stacks, Lean `v4.34.0-rc2`, modules by AI agents, not reviewed by humans | its README and `lean-toolchain` at 27cdb20 | agrees |
| `AlgebraicGeometry/EtaleCohomology` has 283 Lean files, `RingTheory/Henselian` 37 | recursive tree at 27cdb20 (1239 entries, not truncated): 283 and 37 | agrees |
| no adic, rigid-analytic or formal spaces, no almost modules | tree paths matching rigid, almost, perfectoid, huber: 0; "formal": only `Morphisms/FormallyUnramified.lean`; "adic": 28, all ℓ-adic | agrees |
| its Poincaré duality: ℓ-adic cohomology of X_k̄, X smooth proper over finite k, ℓ invertible in k | `Duality/PoincareDualityConstantSystem.lean`: `Fintype k`, `IsProper f`, `SmoothOfRelativeDimension d f`, `ℓ ≠ p`, ℚ_ℓ pairing in degrees i, 2d−i | agrees |
| `Constructible/ConstructibleIffGenericEtaleNbhdFlc.lean`: criterion by étale neighbourhoods of generic points, Noetherian | theorem with `[NoetherianSpace X.obj]`, étale `U→Y` through the generic point of each irreducible closed `Y` | agrees; EtaleCohomologyFoundations §F.0.1 (main, line 173) owns constructible sheaves |
| `CompactificationIndependence/Independence.lean`: separated finite type to qcqs, bounded below, torsion cohomology | `IsSeparated`, `LocallyOfFiniteType`, `QuasiCompact`, base compact quasi-separated, `DerivedCategory.Plus` with torsion cohomology | agrees; EtaleCohomologyFoundations §0.8 (line 966) has the same domain |
| `DerivedLowerShriek/ConstructibilityUnconditional.lean`: single sheaves, no invertibility | `R^v f_!` of one constructible abelian sheaf; no invertibility hypothesis | agrees; §F.3 compactSupportFiniteness (line 1120) is the `Dᵇ_ctf` form with `N` invertible |
| "the supplier contract above (§§F.0 and 0.5–0.11, and the extension of §F.3), which §7.2 uses" | `README.md:184`, `:186`–`:188`, `:1234` | agrees |
| ClassicalAdicEtaleCohomology §9.7 is the prime-to-residue duality, §1.5(c) the rank-one strict localisations | its open head: §9.7 perfect pairing with ℓ invertible in O_K; §1.5 strict-localisation stalk formula, as `README.md:176` cites it | agrees |
| "changes no target, owner or hypothesis above" | folder diff since 03b098b: 10 insertions, 0 deletions, all in the new section | agrees |

### Adversarial pass

The diff changes no statement; the rows are for statements the changed text cites.

| Statement | Instances tried | Values on one side | Values on the other side | Result; change |
|---|---|---|---|---|
| §5.5 mod-p duality, against the scheme ℓ-adic duality the new section says is no counterpart | elliptic curve E; ℙ¹; coefficient 𝔽_p | rigid E over C: ranks of Hⁱ(E,𝔽_p) are (1,2,1), pairing ranks 1·1, 2·2. ℙ¹_C: (1,0,1) | scheme supersingular E over 𝔽̄_p at ℓ=p: ranks (1,0,0), H⁰ and H² ranks 1≠0, no perfect pairing; so the scheme theorem needs ℓ≠p | distinct statements, as the section says; none |
| gap:quasi-excellent-direct-images keeps invertibility, against "without an invertibility hypothesis" for `Rf_!` | 𝔸¹ over 𝔽̄_p, Λ=𝔽_p | `Rf_*`: H¹(𝔸¹,𝔽_p)=k[t]/{g^p−g}, infinite: invertibility needed | `Rf_!`: H⁰_c=0, H¹_c=coker(𝔽_p→𝔽_p)=0, H²_c=H²(ℙ¹,𝔽_p)=0: finite | both consistent; none |

The rows for the untouched statements stand as in the previous review, of 03b098b.

- Gate at 3cf97a5: every count 0, `build=0`, OK. Elaboration rerun (`lake env lean` on `Suggested.lean`): one warning, `declaration uses sorry` at line 89, exit 0.
- Dependency check rerun: `depcheck: 237 roadmaps, 2250 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- External files opened at 27cdb20: 6 (README, `lean-toolchain`, the three linked Lean files, `Duality/PoincareDualityConstantSystem.lean`), and the tree listing; all five links of the section resolve.
- Cross-roadmap citations of the passage resolved: 7 (EtaleCohomologyFoundations §§F.0, F.0.1, 0.5–0.11, 0.8, F.3 on main; ClassicalAdicEtaleCohomology §§9.7, 1.5(c) at its open head).
- The pull request's text against this head: no sentence contradicted; the change adds no supplier, removes no heading or declaration (0 removed, 89 headings and 8 declarations added), and the section is the secondary provenance section the repository README's "Porting existing work" describes.
- Seeded sample: no target lies in the changed passage; the locators stand as verified in the earlier reviews. `Suggested.lean` is unchanged.
- Citations and overlaps (worker's lists, main ea83ad8 and 454 open heads): no unresolved citation or Lean name, no dropped id, no other pull request changing this roadmap, no second copy. The same repository is described, consistently, in ClassicalAdicEtaleCohomology's provenance section.
- Remark, untouched text: the layers are numbered 0–5 and 7; no Layer 6 exists and nothing cites one.

Overlap check: read ClassicalAdicEtaleCohomology, AInfCohomology, AdicCoefficientsAndComparisons, DeligneWeightsAndPurityPartII, DiamondEtaleCohomology, AdicSpacesPartV, EtaleCohomologyFoundations, AdicSpacesPartIV; nothing shared (the third list is empty).

Source independence: changed passages only; 4 passages compared with 1 source (the AxiomMath/Weil README and the docstrings of 4 of its files), none shared beyond the names of hypotheses; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- H, Heuer, *A p-adic Simpson correspondence for smooth proper rigid varieties*, Proposition 2.18: settled as uncertified; §7.7 cites it by locator only.
- AxiomMath/Weil's Mathlib pin ("its own … Mathlib pins"): its Lake manifest was not opened; the Lean pin was.
- The description's "3 independent review rounds and 2 red-team rounds": a statement about the history, not about the head.

## Source issues

- none

## For the human reviewers

- `TauCetiRoadmap/ClassicalAdicEtaleCohomologyPartII/README.md:1346` commits that porting an AxiomMath/Weil file "is agreed with that repository's maintainers first"; that repository is Apache-2.0 and, by its README, AI-written and unreviewed. `Suggested.lean` takes nothing from it.
