# GATE-OrthogonalTamagawaAndLatticeMass~2: answers to review

One unanswered comment (roed-math, 2026-11-06), item 1 of an overlap cross-check. It makes three points: §4.2 loses its supplier when the IntegralLattices revision merges, with the suggestion to cite Rank24LatticeConstructions Layers 3 and 6 (H01); make that revision a dependency (H02); and settle who proves pairwise non-isometry (H03). The status change to `awaiting-author` is a process note, not a point. Line numbers refer to `TauCetiRoadmap/OrthogonalTamagawaAndLatticeMass/README.md` at the new commit.

## H01 (roed-math) — applied differently

The comment is right that §4.2 had no supplier for the lattices: §6E was deleted at the head the comment checked (6cbd696), and at the IntegralLattices revision's current head (ee3d302) it is back as "Rank 24: the root system separates the 24 lattices", but it says "no milestone here constructs them". §4.2 (line 551), "all twenty-four actual Gram/glue lattices … from IntegralLattices §6E", now reads: the 23 table lattices `RootfulNiemeierType.lattice` and `leechLattice`. These are already native at the pinned Tau Ceti (`Rank24/Niemeier.lean`, `Rank24/Leech/Basic.lean`) and are built under Rank24LatticeConstructions Layers 3 and 6, as the comment suggested; §4.2 moves them into `GramClass 24` through §0.0. The new supplier contracts are at lines 30 (Tau Ceti rank-24 declarations, with files), 60–62 (Rank24LatticeConstructions Layers 3, 5, 6) and 64–66 (CFSGBasicProperties P2-L: on main it owns `Co0 := Aut(Λ)` on this same Leech lattice and computes its order, so §4.2 now uses that order instead of proving it again, lines 553 and 555). Lines 9, 34, 555 and 582 were changed to match.

## H02 (roed-math) — answered

The dependency is real, and it was there before this point: the README already cites IntegralLattices ids in the numbering that only the revision's head defines, for example §9B "Exhaustion from mass saturation" (on main, 9B is the LMFDB completeness certificate), §§N0–N1, and now §6E as non-isometry. So the IntegralLattices revision must merge first. It is listed below under "only an open revision defines" for the merge-order paragraph of the pull-request description, which this job does not edit.

## H03 (roed-math) — applied differently

§4.2 does not derive the non-isometry itself. At head ee3d302, IntegralLattices §6E states it: isometries carry root sublattices onto root sublattices (`Isometry.map_span_vectorsOfNorm`), the component multisets are pairwise distinct (`RootfulNiemeierType.components_multiset_injective`), and the Leech lattice has no roots. That head's own consumer list includes "6E for the pairwise non-isometry of the 24 rank-24 lattices" (its lines 90–91). §4.2 (line 551) therefore consumes §6E and discharges its hypothesis that each row's root sublattice is the displayed root lattice: by native `RootfulNiemeierType.span_vectorsOfNorm_two_lattice_of_ne` for 19 rows, and by Rank24LatticeConstructions Layer 3 for A₁²⁴, A₂¹², D₄⁶ and A₁₁D₇E₆. A new Check (line 559) shows why the hypothesis is needed and inclusion of the root lattice is not enough.

## Further repairs of the same pattern (citations whose content differs at the cited head)

- §0.3 (lines 167, 169): "the IL4D Eichler … application" and "IntegralLattices §4D's class/spinor-genus interface" were wrong in two ways. 4D is the label IntegralLattices gives to Eichler's theorem with this roadmap as owner (main line 1359; head line 82). The interface it supplies is §§4A–4C and N0–N1 (head lines 1419–1421). The citations now say both.
- Downstream consumers (line 586): "IntegralLattices §§7H/7I and §9B consume the mass values" claimed a supply edge back into a supplier. IntegralLattices assigns 7H/7I to this roadmap and says "No milestone of this roadmap consumes OTM" (head lines 86–93), and its 9B takes the mass as a hypothesis. The line is replaced. It adds LatticePackingsAndPerfectForms, an open new roadmap whose README lists this roadmap's §4 automorphism orders, mass and class-number columns among its inputs.
- RootSystems (lines 9, 58): the old text said "Layers 5–6, the reduced crystallographic root classification". The classification is Layer 3 §3.1 (main and head). At the RootSystems revision's head, Layer 5 is the Weyl-group complement of the based diagram automorphisms and the lattice-preserving subgroups, and Layer 6 §6.1 is the irreducible components. The citations now name those sections.
- Line 9: automorphism-group finiteness is native (`IntegralLattice.IsPosDef.finite_isometry`). At the IntegralLattices head, label 2C names that native declaration (its lines 684–686) rather than a milestone.

## Adversarial pass on the statements added or changed

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §4.2: non-isometric native lattices give distinct `GramClass 24` classes (§0.0 two-way comparison) | diag(1,2) vs [[1,1],[1,3]] (congruent, A=[[1,1],[0,1]]); [1] vs [2] | AᵀGA=[[1,1],[1,3]], det A=1; unit 1×1 matrices square to 1 ≠ 2 | holds in both directions | none |
| §4.2: the §6E hypothesis (root sublattice = displayed root lattice) is needed, not just containment (new Check, line 559) | A₁²⁴ row with Golay glue; hypothetical weight-4 glue word | coset minimum w/2: w=8 → 4, w=4 → 2 (a root); roots of A₁²⁴ = 24·2 = 48; \|H\|=4096 (`natCard_a1TwentyFourGlueSubgroup`), 4096² = 2²⁴ = \|A_R\| | Check correct | added Check |
| §4.2: root counts alone do not separate rows (why §6E uses component multisets) | D₁₆E₈ vs E₈³ | 2·16·15+240 = 720 = 3·240 | equal counts, multisets {D₁₆,E₈} ≠ {E₈,E₈,E₈} | none (IntegralLattices §6E Check) |
| §4.2 route: O(N) equals the stabilizer of the glue subgroup H in Aut(R), for full-rank R | E₈³ (H trivial); D₂₄ (H = spinor class) | E₈³: \|O/W\| = \|S₃\| = 6; D₂₄: Aut(Φ) = W(B₂₄), order 2²⁴·24!, stabilizer of the spinor class W(D₂₄), order 2²³·24!, so \|O/W\| = 1 | agrees with the Borcherds factors 6 and 1 | none |
| §4.1 neighbouring values used by the same route | E₈², D₁₆⁺ | 2·696729600² = 970864271032320000; 2¹⁵·16! = 685597979049984000 (Weyl-group stabilizer of the spinor class in W(B₁₆)) | match the §4.1 Check | none |
| Leech order from CFSGBasicProperties P2-L | \|Co1\| = 4157776806543360000 (CFSGBasicProperties Suggested.lean line 71) | 2·4157776806543360000 = 8315553613086720000; a model using the empty root system gives 1; using Co1 gives 4157776806543360000, which doubles the reciprocal | matches the §4.2 Checks | Leech order consumed, not planned |
| Leech separated from every table row | `vectorsOfNorm_two_leechLattice` = ∅; each row contains its R_r ≠ 0 | Leech minimum 4 (`minimum_leechLattice`); table minimum 2 | holds | none |
| Native unimodularity for the four excluded rows | A₁²⁴, A₂¹², D₄⁶, A₁₁D₇E₆ | `isUnimodular_lattice_of_ne` excludes them; `natCard_glueSubgroup_{a1TwentyFourth,a2Twelfth,d4Sixth,a11d7e6}` exist in `Rank24/Glue/IdentifiedRows.lean`, so `isUnimodular_lattice_iff` gives unimodularity; the root-sublattice theorem for the table lattice is native only for separately glued models | wording made exact (line 30) | reworded |
| Downstream: IntegralLattices consumes nothing here | IntegralLattices head 9B Checks | 9B's examples use masses 3/4 and 1/12 from B8, not from this roadmap; head line 93 "No milestone of this roadmap consumes OTM" | single supply direction restored | line 586 |
| §0.3 citation | main 4D, head 4D/4A–4C/N0–N1 | main line 1359 "4D. Eichler's theorem. Owner: OrthogonalTamagawaAndLatticeMass"; head lines 1419–1421 "OTM §0.3 consumes 4A–4C and N0–N1" | the old citation pointed at our own statement | lines 167, 169 |
| RootSystems citation | A₂, D₄, D₁₆ | \|Aut(A₂)\| = 6·2 = 12 (RootSystems head §5.1 Check, IntegralLattices 6G Check \|O(A₂)\|=12); D₄ diagram group S₃ of order 6; D₁₆ diagram swap of order 2 exchanging the two spinor classes | Layer 5 is the automorphism layer; Layer 3 §3.1 is classification | lines 9, 58 |

Suggested.lean is unchanged. For the mechanical check, I appended `#check @…` for all 17 declarations to a scratch copy of the file and elaborated it once at the pins. Every elaborated type matches `signatures.md` and its README statement (`evenUnimodularMass_eq` for 0 < n, 8 ∣ n; the class numbers 2 and 24; the bounds 10⁷ and 10⁵¹), and no binder was lost.

## Ownership

- The 24 rank-24 lattices are owned by Tau Ceti and Rank24LatticeConstructions Layers 3 and 6, both on main.
- Pairwise non-isometry is owned by IntegralLattices §6E at the revision head.
- The Leech isometry group and its order are owned by CFSGBasicProperties P2-L, on main.
- The rootful automorphism orders and the rank-24 completeness are this roadmap's. IntegralLattices §6E at its head says completeness is "OTM §4.2's", and Rank24LatticeConstructions excludes automorphism groups and classification.
- A grep of the open roadmap pull requests and main for Niemeier automorphism orders and for `Co0` finds only CFSGBasicProperties (owner, now consumed) and LatticePackingsAndPerfectForms (consumer).
- Ownership against open pull requests was checked through the `roadmaps grep` index and the sibling checkouts named in the brief. No `Suggested.lean` declaration was added or renamed.

## Dependencies on open revisions (only an open revision defines)

- IntegralLattices revision (head ee3d302). The overlap index lists every IntegralLattices id this README cites (§§2C, 2G, 3C, 3I, 4B, 4D, 6C, 6D, 6E, 7A, 7C, 7E, 7G, 9B) as defined only there. In content, §9B (exhaustion from a mass), §§N0–N1 and §6E (non-isometry) exist only there, and §2C is a label for native declarations. It must merge before this roadmap.
- RootSystems revision (head 265d185): Layer 5 and Layer 6 §6.1 exist only there; main's RootSystems ends at Layer 3. It must merge before this roadmap.

Suppliers added this round, all on main: Rank24LatticeConstructions and CFSGBasicProperties. Neither cites this roadmap or IntegralLattices' completeness, so no cycle.

## Build

In the pull-request worktree at `36e40dbc`, `lake build TauCetiRoadmap.OrthogonalTamagawaAndLatticeMass.Suggested` exits 0: `Build completed successfully (8993 jobs)`, with only the five expected `declaration uses 'sorry'` warnings (lines 109, 116, 120, 124, 128). This is against the branch's own pins: Tau Ceti a91d3aa, Mathlib 6b7abb3, toolchain v4.35.0-rc3.

The earlier failure ("already exists (error code: 17)" on `.lake/packages`) was an environment fault, not a fault in the roadmap. The worktree's `.lake/packages` is a link to the shared package cache keyed by the branch's manifest, toolchain and lakefile (pin `356835296538146e`). That cache directory was missing when the check ran, so the link dangled and lake could not create the directory. The cache has since been refilled and marked ready for that pin, so the link resolves. No file, manifest, toolchain or cache was changed to get this result.

The same command also succeeds at main's pins (Tau Ceti 2fd255d, Mathlib 1b1ccf4, toolchain v4.36.0-rc2). That build ran in a scratch tree made of origin/main's `lakefile.toml`, `lean-toolchain` and `lake-manifest.json` with this roadmap's `Suggested.lean`: `Build completed successfully (18316 jobs)`, with the same five `sorry` warnings and the module-system import notice. The branch is 520 commits behind origin/main, so the pull request should be rebased before it merges; the build does not depend on that rebase.

## Gate

`gate OrthogonalTamagawaAndLatticeMass: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

Direction check: `depcheck: 239 roadmaps, 2362 edges, 0 problem(s)` (no UPWARD, CYCLE or moved line).

Citation resolver: no cross-roadmap citation or Lean name found nowhere. It did not check names outside TauCetiRoadmap ("no pinned Lake packages on this host"), so I checked every new Tau Ceti name by hand at pin 2fd255d: `RootfulNiemeierType.{lattice, isEven_lattice, isPosDef_lattice, finrank_lattice, isUnimodular_lattice_iff, isUnimodular_lattice_of_ne, span_vectorsOfNorm_two_lattice_of_ne, components_multiset_injective}`, `leechLattice` and its six lemmas, the four `span_vectorsOfNorm_two_*Lattice` models, and `IntegralLattice.Isometry.map_span_vectorsOfNorm`.

Sources: no new source cited; no `needs-references.toml` written.

Commit: `36e40dbc OrthogonalTamagawaAndLatticeMass: review repairs (rank-24 suppliers, Leech order from CFSG, IntegralLattices 6E/4D, RootSystems layers, consumers)`. Not pushed.
