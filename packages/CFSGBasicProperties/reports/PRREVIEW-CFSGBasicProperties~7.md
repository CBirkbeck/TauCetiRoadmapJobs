# Review of CFSGBasicProperties (pull request #2541 at 9803de2)

**Verdict:** accepted

**Summary.** Accepted: no finding remains. All four points of the previous review are repaired. §8.2 now takes `Co0`, its group law, its element `−1` and its finiteness from the pinned Tau Ceti lattice-isometry library, and §4.2 names the double-coset theorem that gives finite index. Both repairs were elaborated against the pins, and neither introduces a new problem. There are no small corrections and no format notes. The two questions of the previous round are still open, and four facts go to the human reviewers.

## Questions for the author

These are carried from the previous round, because the passages they concern have not changed.

- §5.2 (line 570) asks first to prove that the ambient root relations give a complete presentation of `²F₄(2)`. Which theorem is this, and where is it proved? Which relations does it use beyond the commutator relations of the twisted root groups at `q = 2`? The section gives no locator, and I found none in the cited sources.
- §11.3 follows Breuer–Magaard–Wilson, whose route assumes two inputs. The first is the suborbit lengths and stabilizers of `2·B` on the class `2A` (bmw-monster line 71, their Fact 1). The second is the character tables of `2·B` and other ATLAS groups (line 78). Which section supplies these? §9.2 produces only the `2B` suborbit.

## Previous findings

- R01 — repaired: "The isometry group `Co0 := Aut(Λ)` is Tau Ceti's `TauCeti.IntegralLattice.Isometry TauCeti.leechLattice TauCeti.leechLattice` … It is finite by `TauCeti.IntegralLattice.IsPosDef.finite_isometry` applied to `TauCeti.isPosDef_leechLattice`" (§8.2, lines 944–948; also in its *Needs:* line, Scope and the Tau Ceti contract).
- C01 — repaired: "A cover whose intersections `w_i H w_i⁻¹ ∩ H` have finite index in `H` gives `H` finite index in `G` (`Subgroup.finiteIndex_of_doubleCoset_cover`)" (§4.2, lines 406–410; also in its *Needs:* line and in the contract at lines 1487–1491).
- C02 — repaired: the description now reads "In P0: presentation dictionaries, a Schreier free basis for an arbitrary Schreier transversal, straight-line words, transport along `MulEquiv`s, the coset cover with word witnesses, …".
- N01 — repaired: "[C][src-c]: the Tau Ceti sporadic dispatcher and its imported presentations at the pinned revision `2fd255d997f47c0b5d834ee416c7015d55444ce5`" (line 1627; link at line 1652). This is the Tau Ceti revision in the manifest.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §4.2 double-coset finite index (`Subgroup.finiteIndex_of_doubleCoset_cover`) | `S₃`, `H = ⟨(1 2)⟩`, `w = 1, (1 3)`; `GL₂(𝔽_q)`, `B` | `(1 3)H(1 3) = ⟨(2 3)⟩`, indices `1 + 2 = 3 = [S₃:H]`; `1 + q = q + 1 = [G:B]` | true; hypotheses `[Finite ι]`, `IsFiniteRelIndex` as in prose (`Cover.lean` 85) | none |
| §4.2 index bound at infinite index | `PGL₂(ℚ)`, `B`, Bruhat cover `{1, w}` | `[B : T]` infinite, so `relIndex = 0`; bound reads `0 ≤ 1 + 0`; finite-index hypothesis fails | the text's "gives no finiteness" is right (`Cover.lean` 96) | none |
| §8.2 `Co0` carrier and finiteness | probe at the pins | `Finite (Isometry leechLattice leechLattice)` by `IsPosDef.finite_isometry isPosDef_leechLattice`; `Group` by `inferInstance`; both elaborate | true (`PosDef/Finite.lean` 147, `Leech/Basic.lean` 299) | none |
| §8.2 `−1` and `Co1` finite as a quotient | probe; orders | `f * neg = neg * f` by `ext; simp`; `Finite (Co0 ⧸ zpowers (neg leechLattice))` by `inferInstance`; `2 · 4157776806543360000 = 8315553613086720000` | true | none |
| §8.2 spanning makes the action faithful | rank 1 `ℤ`, norm `x²`; `ℤe₁ ⊕ ℤe₂` with norms 1, 2 | `±1` span, `{±1}` acts faithfully; `diag(1, −1)` fixes the minimal vectors `±e₁` and is not `1` | spanning hypothesis needed and stated | none |
| §8.2 `−1` does not descend | antipodal pairs | `v = −v` forces `v = 0`, norm `0 ≠ 4`; `196560 / 2 = 98280` | true | none |
| Tau Ceti contract, lattice isometries | `mul_apply`, `finite_isometry` hypotheses | `(f * g) x = f (g x)` (`Group.lean` 121); only `M.IsPosDef`, `L` arbitrary (`Finite.lean` 147) | as stated | none |

The rows for the untouched statements stand as in the previous review, of c2f6158.

- Previous findings: all four are repaired. No repair introduced a new problem. `Suggested.lean` has 0 changed lines since c2f6158.
- Library declarations opened at the pinned Tau Ceti `2fd255d9`, 11 in all:
  - `IntegralLattice.Isometry` (`Isometry/Basic.lean` 77);
  - in `Isometry/Group.lean`: its `Group` instance (102), `mul_apply` (121), `Isometry.neg` (174) and `neg_apply` (186);
  - `IsPosDef.finite_isometry` (`PosDef/Finite.lean` 147);
  - `leechLattice` (`Rank24/Leech/Basic.lean` 236) and `isPosDef_leechLattice` (299);
  - in `DoubleCoset/Cover.lean`: the three double-coset theorems (42, 85, 96).
- Probe file elaborated at the pins (exit 0): the four Leech-isometry facts of the table, and `#check` of the three double-coset theorems.
- Cross-roadmap citations: the change adds none. I read the `Co0` passages of OrthogonalTamagawaAndLatticeMass (README line 96) and LevelOneAutomorphicFormsForClassicalGroups (lines 2780–2783, 3098–3101) at their heads. The overlap tool lists no dropped id.
- Automatic checks: all passed, and a rerun here gave the same result. The dependency check printed `depcheck: 200 roadmaps, 2200 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. Nothing outside the folder changed.
- Elaboration of `Suggested.lean`: ten `declaration uses sorry` warnings (lines 35, 74, 78, 82, 90, 100, 105, 111, 119, 124), nothing else, exit 0. The file has not changed, so the signature comparison and the one-tactic probe of the previous review stand.
- Seeded sample: none of the fifteen targets lies in a changed passage. The changed text cites no source locator, and the README flags none as unverified.
- Description read against this head: no sentence is contradicted. Its count of 37 Checks agrees with the README.

Overlap check: this round I read the `Co0` passages of OrthogonalTamagawaAndLatticeMass and LevelOneAutomorphicFormsForClassicalGroups (open), and searched every open head and main for `Co0`. The scopes of LocalFiniteGroupTheory, GlaubermanZStar, PotentialAutomorphyDworkMotivesPartII (open) and of CFSGStatement, SporadicOrders and OddOrderTheorem (main) stand as read in the previous review, and the change touches none of their objects. The third list is empty. Ownership of the one shared object, the Leech isometry group `Co0`:
- the pinned Tau Ceti owns its carrier and its finiteness;
- this roadmap owns its generators and order, and `Co1` (§8.2);
- OrthogonalTamagawaAndLatticeMass and LevelOneAutomorphicFormsForClassicalGroups consume it from here.

Source independence: changed passages only. Six passages were compared: the §4.2 bullet, the two §8.2 paragraphs, the two Scope bullets and the two Tau Ceti contract bullets. They were set beside the pinned Tau Ceti docstrings they paraphrase (`Cover.lean` 83–84, `Isometry/Basic.lean` 75–76, `PosDef/Finite.lean` 145–146). Nothing is shared beyond the theorem's own statement, "finitely many isometries into a positive definite lattice" (8 words). The diff adds no source locator and no layer, so the arrangement was not compared again. The largest share is as in the previous review: the ATLAS, a database with no table of contents.

Research link: Layers 9–11 formalize the Monster order and simplicity of Höhn–Seysen (2025) and the 194-class verification of Breuer–Magaard–Wilson (2024). Layer 10 rests on Ivanov's Y-group presentations (1994, 1999). The endpoint is the concrete half of CFSG that CFSGStatement pairs with its classification proposition. This rests on the README's Summary and References, hohnseysen Thms 5.1 and 5.6, and bmw-monster Prop 1.

## Not verifiable

- Steinberg, *Lectures on Chevalley Groups*, Chapter 11, Theorem 33 (§2.3): no legal copy located (previous round; not retried).
- Havas–Sims, *A presentation for the Lyons simple group* (§7.9): a paywalled book chapter, checked only against the pinned transcription.
- Ivanov (1994, 1999) and Griess (1985): paywalled, or no legal text located; cited by locator only.
- The Layer 7 construction sources and the two external formalizations: outside the changed passages and not reopened.

Automatic checks set aside as false positives: none of the checks failed. However, the change summary of the description's diff, and the signature listing, still read line 18 of `Suggested.lean` as two declarations, `needs` and `TauCeti.ValidLieTypeIndex.finite`. That line is a docstring line that begins with the word "theorem", and the file declares neither name.

## Source issues

- none

## For the human reviewers

- Two open roadmaps declare supplier gaps against this roadmap that this head does not state:
  - NonabelianLevelStructures declares gap:vdovin-abelian-subgroups (its README line 1061). It presupposes the classification, which lines 26–27 here exclude.
  - LevelOneAutomorphicFormsForClassicalGroups declares gap:conway-group-average-charpoly (its line 3101).
- OrthogonalTamagawaAndLatticeMass (open), README line 96, takes from this roadmap's P2-L the finiteness of `Co0` "from the faithful action on the 196560 minimal vectors". This head takes that finiteness from Tau Ceti (§8.2, lines 944–948).
- Licence: §6.3 and "Existing formalizations" name KitaKen1/finite-simple-groups-lean and AxiomMath/CFSG (commit `69cb972f`) as porting sources. Both repository pages report Apache-2.0. README lines 1670–1672 say the latter proves the sporadic finiteness and simplicity headlines on the exact carriers.
- Not tested: the most-cited reference, the ATLAS of Finite Group Representations, is a database with no table of contents. The wording and arrangement checks of the previous review were run against hohnseysen instead.
