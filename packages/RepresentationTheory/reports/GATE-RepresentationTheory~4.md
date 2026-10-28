# GATE-RepresentationTheory~4: answers to human review

The review concerns the `RootSystems` sub-roadmap. The edits for the review points are in `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md` and `TauCetiRoadmap/RepresentationTheory/RootSystems/Suggested.lean`, the two files this pull request changes. Commit: `RepresentationTheory: review repairs (closed-chamber uniqueness supplier, diagram automorphism and SGA 3 citations, typography)`. A second commit, `RepresentationTheory: review repairs (restore family-level Suggested.lean stating no headline of its own)`, adds `TauCetiRoadmap/RepresentationTheory/Suggested.lean`. It is the family index's acceptance test: it states no theorem, and its docstring says that each of the thirteen member roadmaps states its own headlines. The same file was written earlier on the SchurWeyl family branch. Neither commit was pushed.

## H01 (roed-math) — applied

At the reviewed head the realization indexed roots by `Fin t.rank`. At `d736f55` it already reads `RootPairing (Fin t.numRoots) ℚ (Fin t.rank → ℚ) (Fin t.rank → ℚ)`, both in the existential and in the explicit `@HasCartanType (Fin t.numRoots) …` application (`RootSystems/Suggested.lean`, `exists_rootPairing_of_dynkinType`). `DynkinType.numRoots` is defined just before it. The realization now goes through the native `TauCeti.DynkinType.rationalRootSystem` / `rationalBase` / `hasCartanType_rationalRootSystem`, imported from `TauCeti.LinearAlgebra.RootSystem.SimplyConnectedRootDatum.Rational`, by way of `nativeRationalRootSystem_has_local_type`. No statement in the file still indexes a root carrier by `Fin t.rank`; I checked with `grep "RootPairing (Fin t.rank"`, which finds nothing. The `A 1` witness: `numRoots (A 1) = 1·2 = 2` root indices, against a rank of 1.

## H02 (roed-math) — answered

The review raises no objection to Layer 4A, so nothing changed there. I checked the stated conventions against SGA 3 Exp. XXI as re-edited by Gille–Polo (`SGA3-XXI` line 1368: `u s_α u⁻¹ = s_{u(α)}` and normality of `W`; line 1374: `Aut(R) = W(R) ⋊ E_Δ(R)`), and they agree with the section's `g = wδ` factorization and its multiplication `(w,δ)(v,η) = (w δ(v), δη)`.

## H03 (roed-math) — answered

Agreed. The ReductiveGroups §9A.1a-L cover-lift group and the LieGroups Layer 8N compact-normalizer application consume Layer 4A; this roadmap supplies them. `gate --depcheck` reports `0 problem(s)` for both the roadmap README and `RootSystems/README.md`, so there is no UPWARD or CYCLE line. LieGroups Layer 8N exists only at the head of the open LieGroups revision. It is cited as a downstream owner, not as a supplier.

## H04 (roed-math) — applied

Layer 4A gains a paragraph on the pinned `SimplyConnectedRootDatum/DiagramAutomorphism.lean`, which covers:
- `TauCeti.DynkinType.diagramSymmetry`, the permutations preserving the native Cartan matrix;
- `rationalDiagramAut` and `diagramAut`, and the multiplicative `diagramAutHom`;
- three further properties of the construction: it is injective, it extends `σ` on the simple roots, and it is unique given its weight map;
- the transpose convention: the character map is precomposition with `σ⁻¹`, the cocharacter map precomposition with `σ`.

The based-subgroup identification is restated as consuming these maps and adding the converse.

In Layer 6, "`rationalRootSystem` is `rootPairingBaseChange`" became "`TauCeti.rootPairingBaseChange` (`TauCeti/LinearAlgebra/RootSystem/BaseChange.lean`, …, with its base `TauCeti.rootPairingBaseChangeBase`)".

SGA 3 Exp. XXI is now cited at its claims in 4A and in References: Prop. 6.1.3, Lemma 6.7.1, Prop. 6.7.2, Cor. 7.3.4, Cor. 7.4.5 and Rem. 7.4.6. Every number was checked in the Gille–Polo re-edition from Polo's author page (`SGA3-XXI` lines 1051, 1368, 1374, 1627, 1654, 1660), and the README states that it uses the re-edition's numbering.

## H05 (roed-math) — applied

The objection is correct. `eq_of_mem_dominantChamber_interior` and `eq_one_of_smul_eq_self_of_interior` need `x` interior, and a wall point is fixed by a nontrivial simple reflection. In `A₁` (`α = 2`, `α^∨ = 1`, `s x = −x`), `s • 0 = 0` with `s ≠ 1`. So the interior statements cannot give closed-chamber uniqueness.

Old wording in the Layer 4 "fundamental domain" bullet: "Together with the existence statement, this is the closed dominant chamber being a strict fundamental domain".

New wording: simple transitivity on open chambers. The closed-chamber uniqueness is attributed to the pinned `TauCeti.smul_eq_self_of_smul_mem_dominantChamber` and `TauCeti.eq_of_mem_orbit_of_mem_dominantChamber` (`FundamentalDomain.lean`), with their pinned hypotheses: finite, crystallographic, `P` and `P.flip` reduced, over a strictly ordered commutative ring. `TauCeti.stabilizer_eq_closure_wallReflections` is cited as the mechanism. The interior statements are noted as their special case, present at the pin as `TauCeti.eq_one_of_smul_mem_dominantChamber` and `TauCeti.eq_one_of_smul_eq_self_of_mem_openDominantChamber`. A Check computes the `A₁` wall point `0` and the interior point `1`.

The same defect elsewhere is fixed too:
- The Lean docstring of `eq_of_mem_dominantChamber_interior` said "The closed dominant chamber is a fundamental domain"; it now reads "Interior uniqueness" and points to the Tau Ceti theorem.
- The "What is missing" paragraph now says the closed-chamber uniqueness is consumed from Tau Ceti.

## H06 (roed-math) — answered

The verdict asks for the realization signature to be corrected before approval. That correction is the one in H01 and is in place at `d736f55`. The CI observations in the review describe a build with admitted targets and need no reply.

## Other repairs made while editing (same files)

- A stray `</content>` / `</invoke>` artefact at the end of `RootSystems/README.md` is removed.
- A pull-request URL in Layer 6 ("Add CFSG statement roadmap … /pull/156") is replaced by "CFSGStatement roadmap (workstreams L0 and L1)", checked against the CFSGStatement head.
- Spaces lost before numerals in the new sections are restored, for example "Layer4" → "Layer 4", "Layers5–6" → "Layers 5–6", "E6's36" → "E6's 36", "C13's169" → "C13's 169", "ReductiveGroups9A.1a-L" → "ReductiveGroups §9A.1a-L". I recomputed the affected counts and highest roots: E6 36 / `(1,2,3,2,1,2)`, E7 63, E8 120, A7 28, C13 169 = 13², each correct under the stated renumbering.
- Unqualified Mathlib names `cartanMatrix_*` are qualified as `RootPairing.Base.cartanMatrix_*`.
- An unreferenced HTML anchor and a "TODO" phrasing flagged as residue are removed.

## Adversarial pass on changed statements

| statement | instances tried | values | result | change |
|---|---|---|---|---|
| interior theorems ⇏ closed-chamber uniqueness | `A₁`, `x = 0` (wall), `x = 1` (interior) | `s•0 = 0`, `s ≠ 1`; `s•1 = −1`, `⟨α^∨,−1⟩ = −1 < 0` | the old claim was overstated | prose and docstring corrected; Check added |
| `TauCeti.smul_eq_self_of_smul_mem_dominantChamber` as the closed-chamber supplier | `A₁`, `x = 0`, `w = s` | `s•0 = 0 ∈` chamber, conclusion `0 = 0` holds | consistent | hypotheses copied from the pin (lines 124, 135) |
| `numRoots` vs `rank` | `A 1`, `B 2`, `D 4`, `G 2` | 2 vs 1, 8 vs 2, 24 vs 4, 12 vs 2 | differ, so the separate carrier is needed | none (already correct) |
| `diagramAut` transposes | `A₂`, `σ = (1 2)` | `σ = σ⁻¹`, so this case does not distinguish them; for a `D₄` 3-cycle the docstring's transpose rule gives `σ⁻¹` ≠ `σ` | README states both maps separately | stated |
| SGA 3 7.3.4 / 7.4.5 scope | simply connected or adjoint only (line 1627, 1654) | intermediate isogeny lattices not covered | README keeps the lattice-preserving subgroup for `Q⊆X⊆P` | none |

## Build and gate

- `lake build TauCetiRoadmap.RepresentationTheory.Suggested`: `Build completed successfully (8976 jobs)`. The file states no declarations, so it produces no warnings.
- `lake build TauCetiRoadmap.RepresentationTheory.RootSystems.Suggested`: `Build completed successfully (9032 jobs)`, with only `declaration uses sorry` warnings.
- `#check` scratch: not run. The family file declares nothing. In `RootSystems/Suggested.lean` no declaration's type changed; the one Lean edit there is a docstring.
- Gate summary: `gate RepresentationTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Gate on the changed sub-roadmap, `RepresentationTheory/RootSystems`, as run before the family file was added: all counts 0 except `sorry-data=8`, so it FAILs. Those eight were all there before this job: `coxeterMatrixOfBase`, `weylCoxeterSystem`, `longestElement`, `DynkinType.cartanMatrix`, `DynkinType.simplyConnectedRootDatum`, `DynkinType.simplyConnectedBase`, `basedAut`, `latticePreserving`. Fixing them means restructuring that acceptance test, which is outside these review points.
- Depcheck (`--movable`) on `TauCetiRoadmap/RepresentationTheory/README.md` and on `RootSystems/README.md`: `depcheck: 162 roadmaps, 1163 edges, 0 problem(s)` both times.

## Residual (not changed, outside the points raised)

- Tau Ceti at the pin already proves most of Layer 4: `RootPairing.dominantChamber`, `RootPairing.exists_mem_dominantChamber`, and both interior theorems. The local `dominantChamber`, `exists_mem_dominantChamber`, `eq_of_mem_dominantChamber_interior` and `eq_one_of_smul_eq_self_of_interior` therefore duplicate pinned declarations and should be deleted in favour of supplier citations in a later revision. Doing that here would widen the scope.
- `SGA3-XXI` is fetched (author page, Polo's re-edition). There is no `sources.toml` in the folder, and this job may not create one, so the manifest entry is not recorded. `needs-references.toml` was not created: no source is missing.
- Ownership against open pull requests was checked only for the cited consumers (ReductiveGroups, LieGroups, CFSGStatement) through `roadmaps grep`.
