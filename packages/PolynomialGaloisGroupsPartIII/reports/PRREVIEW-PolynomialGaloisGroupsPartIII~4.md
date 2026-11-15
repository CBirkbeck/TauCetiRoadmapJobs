# Review of PolynomialGaloisGroupsPartIII (pull request #763 at 19de72e)

**Verdict:** accepted

No findings. Incremental re-review of 0 changed lines since 19de72e: the folder is identical to the head the previous review read, so this round re-ran the gate and the elaboration, re-resolved the citations against main as it is now (`4d169a9`), and re-read the pull request's text against the head.

## Previous findings

- none: the previous report (of `19de72e`) raised no finding; its two `## Previous findings` bullets recorded repairs of an earlier round and both passages are unchanged (README lines 226–242, 263–269, 668–697, 710–714).

## Verified sound

| Statement | Instances | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 4.1 Gassmann, with its residue-degree lemma (README 636–697), `dedekindZetaCoeff_fixedField_eq_of_almostConjugate` | `E = ℚ(ζ₃, ∛2)`, `G = S₃`, `H`, `K` two order-2 subgroups (conjugate, so almost conjugate: each meets classes `1, transpositions, 3-cycles` in `1, 1, 0`); `p = 2, 3, 5, 7, 31` | Field side, `ℚ(∛2)`: `2 = 𝔭³`, `3 = 𝔭³` (f = 1 each); mod 5 `X³ − 2 = (X − 3)(quadratic)`, f = `{1, 2}`; mod 7 cubes are `{1, 6}`, inert, f = `{3}`; mod 31 `4³ = 64 ≡ 2`, split, `{1, 1, 1}`. Group side: `p = 2`: `D = S₃`, `I = A₃`, one `I`-orbit of 3 cosets, `φ` type `{1}`; `p = 3`: `I = D = S₃`, `{1}`; `p = 5`: Frobenius a transposition, `{1, 2}`; `p = 7`: 3-cycle, `{3}`; `p = 31`: identity, `{1, 1, 1}`. Coefficients at `2, 3, 5, 25, 7, 343, 31`: `1, 1, 1, 2, 0, 1, 3` for both `H` and `K`. | holds; raw coset cycle types at `p = 2` (`{1, 2}` or `{3}`) would give coefficient 1 at 4 or 0 at 2, against the true `1, 1` | none |

The rows for all other statements stand as in the previous review, of `19de72e`.

- Gate, re-run on this head with the supplied merge order: every counter 0, `OK`. With the configured default order it reports only `depcheck: NOT IN ORDER: PolynomialGaloisGroupsPartIII (insert it after its last supplier)`; the supplied order lists the roadmap (line 411), so this is not an upward edge.
- Dependency check, as the brief gives it: `depcheck: 244 roadmaps, 2206 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration of `TauCetiRoadmap/PolynomialGaloisGroupsPartIII/Suggested.lean`: exit 0, eight `sorry` warnings (lines 50, 62, 72, 84, 94, 107, 119, 128), nothing else. The nine elaborated signatures were compared with README 1.1, 3.1, 3.2, 3.3, 4.1, 4.2, 4.3: no binder lost, generality equal.
- Cross-roadmap citations resolved on main at `4d169a9`, 8 of 8: `Completed/PolynomialGaloisGroups/README.md` Layers 1, 4, 6, 9 (lines 532, 777, 1172, 1385); `TauCetiRoadmap/RepresentationTheory/InductionRestriction/README.md` Layer 2.1 (line 346, with `Gassmann.restrictEquiv` at 393 and `Gassmann.normalInvariantEquiv` at 399) and Layer 2.2 (line 433); `Completed/NumberFieldArithmetic/README.md` 1.4 (line 548); `TauCetiRoadmap/BelyiMaps/README.md` Layer 1.6 consumer (lines 81, 229). The resolver's one lead, `Gassmann.normalInvariantEquiv`, is that supplier contract, not a pinned name.
- Pinned declarations reopened, 10: `Subgroup.AlmostConjugate` (`TauCeti/GroupTheory/AlmostConjugate.lean:92`), `TauCeti.exists_S16_gassmann_pair` (`GassmannPair.lean:66`), `TauCeti.almostConjugate_iff_nonempty_equiv_ofMulAction` (`FixedPointCount.lean:183`), `TauCeti.invariantOrbitSumBasis` and `TauCeti.orbitSumEquiv` (`OfMulAction.lean:297, 385`), `Ideal.fullCycleType_toPerm_quotient_eq_map_inertiaDeg` (`SplittingType.lean:48`), `Ideal.ramificationIdx_under_fixedField_eq_relIndex` (`Inertia.lean:177`), `Subgroup.fixedField_map_conj` (`FixedField.lean:488`), `TauCeti.isSolvable_gal_iff_exists_isRoot_specialize_quinticF20Spec` (`Quintic/Solvable.lean:79`), `TauCeti.dedekindZetaCoeff` (`Trivial.lean:51`).
- Pull request text against the head, 9 sentences checked and none contradicted: the roadmap is added, not on main (967 insertions, three files); one definition and eight theorems; eight `sorry` warnings; the three suppliers are on main; nothing outside the folder differs from main (empty diffstat); #1419 is PolynomialGaloisGroupsPartII; FiniteGroupInvariants (#1708) is absent from the supplied merge order while this roadmap is in it; the "Library carriers" names match README 216–248.
- Overlap inventory: no other open pull request changes this folder, no cited id is dropped, no cited id is defined only by an open revision.
- Remark on untouched text, assessed by the earlier reviews: #986 at its head (`TauCetiRoadmap/PolynomialGaloisGroups/README.md` lines 17–24) still lists the radical criterion, the quintic separation and Dummit's criterion as owned, and #1708 (`TauCetiRoadmap/FiniteGroupInvariants/README.md` lines 94–96, 1228) still claims both directions of Perlis' theorem; this README's scope section (lines 78–90) and the description state the intended single owner.

Overlap check: read #986 PolynomialGaloisGroups, #1708 FiniteGroupInvariants, #1419 PolynomialGaloisGroupsPartII, #1711 ArtinRepresentations, and on main PolynomialGaloisGroups, InductionRestriction, NumberFieldArithmetic; the radical criterion and Dummit's criterion (shared with #986): owner this roadmap, Layer 3; the sufficient direction of Perlis' theorem and the conjugacy criterion (shared with #1708): owner this roadmap, 4.1 and 4.2; almost-conjugacy and the `S₁₆` pair: owner InductionRestriction 2.1–2.2; the double-coset law: owner NumberFieldArithmetic 1.4; nothing shared with #1419 or #1711.

Source independence: changed passages only; the diff is empty, so 0 passages compared with 0 sources and the arrangement was not compared again (no layer added, removed or reordered); the earlier reviews' comparison stands.

## Not verifiable

- The description's sentence that the description of #986 names this pull request as single owner: the text of #986's description is not among the supplied data; only its README at head `645bf25` was read.
- Butler–McKay (1983) and Perlis (1977), Theorem 1: paywalled, cited by locator as uncertified; unchanged.
- The ten seeded source targets were not re-fetched: no passage or locator changed since the head at which they were read.

## Source issues

- **Gap** in dummit-quintics at Theorem 1, proof, p. 389: the source says a rational root of the sextic gives the stabilizer criterion and an irreducible complementary quintic, without showing the six resolvent values distinct; it should be preceded by the distinctness argument, which uses irreducibility and `5 ≠ 0`, as in Chapman's note; affects the proof.

## For the human reviewers

- **Scope.** #986 (`TauCetiRoadmap/PolynomialGaloisGroups/README.md` lines 17–24 at `645bf25`) and this roadmap's Layer 3 both plan the radical criterion and Dummit's criterion; the description here says #986 should not merge. Which pull request merges is yours to decide.
- **Scope.** #1708 (`TauCetiRoadmap/FiniteGroupInvariants/README.md` lines 94–96, 1228 at `60b9e45`) still claims both directions of Perlis' theorem; this roadmap's 4.1 owns the sufficient direction and asks #1708 to cite it. The change needed is in #1708.
- **Licence.** README 1.3 takes its generators from the TransGrp library at commit `165fc21` (README lines 102–105, 804–808); the library's licence was not read in this round.
