# Review of CFSGBasicProperties (pull request #698 at 28a7abc)

**Verdict:** rejected

This head is a pre-merge draft of a roadmap that the content repository's main branch already carries in a revised, extended form (`TauCetiRoadmap/CFSGBasicProperties/`, 811-line README plus a 171-line `Suggested.lean`, merged 2026-10-26). The head has no `Suggested.lean`, its README is a strict predecessor of main's text, and merging it over main would delete reviewed material. Nothing in this head is mergeable as it stands; the material it carries is already on main. The findings below record what a rebased revision would still have to fix if the author has anything beyond main's text to add.

## R01 (P1) — Gate fails: `Suggested.lean` is missing

Location: `TauCetiRoadmap/CFSGBasicProperties/` at this head contains only `README.md` and `metadata.toml`.

Claim: the push gate reports `missing-files: TauCetiRoadmap/CFSGBasicProperties/Suggested.lean`; the targeted build cannot run.

Witness: the gate record for this head (`gate CFSGBasicProperties: missing-files=1 FAIL`); the folder listing.

Repair: a rebase onto main restores main's `Suggested.lean`. Note for any rewrite: at the pinned Tau Ceti neither `CFSGIndex.Group` nor `ValidLieTypeIndex.Group` exists (only per-family `TypeALieIndex.Group`, `TypeCLieIndex.Group`, … and `SporadicName.Group`), so the two uniform headline theorems `CFSGIndex.finite` and `CFSGIndex.isSimpleGroup` are not statable at the pin and belong in the module docstring; the statable headlines are the per-family and per-name statements (`Finite (TauCeti.SporadicName.M.Group)`, `IsSimpleGroup (TauCeti.TypeALieIndex.Group d)`, and so on).

## R02 (P1) — Re-plans a roadmap already on main, and regresses it

Location: the whole README (588 lines) against main's `TauCetiRoadmap/CFSGBasicProperties/README.md` (811 lines).

Claim: this head is an earlier state of the same roadmap. Its branch forks from main at 2026-09-25 and targets the feature branch `roadmap/cfsg-basic-properties`, which was merged to main as the current roadmap on 2026-10-26. A word-level comparison shows every passage of this README present on main in revised wording, while main additionally has: the `P2M` section (Monster conjugacy classes, 194 classes and characters), supplier contracts for `Rank24LatticeConstructions` Layer 6 and `SporadicOrders` O0–O2, the L0/L5 "actual carrier or compatible transport" rule for the Lie-type families, the `fixedWeylRepresentative` target, consumption of native `TitsSystem` Bruhat-uniqueness and parabolic API, and a `Suggested.lean`.

Witness: paragraph-level set difference of the two READMEs: 19 paragraphs of this head differ from main only by revision, 34 paragraphs of main have no counterpart here; `git merge-base origin/main HEAD` is dc60e006 (2026-09-25); main's folder history is the single squash commit 3468df05 of pull request #446.

Repair: close this pull request as superseded, or rebase onto main and submit only material that main lacks as a revision of main's README. Do not reopen the roadmap from this text.

## R03 (P2) — Supplier drift: the Lie-type carrier is misdescribed

Location: README lines 30–34, "the fixed points of a Steinberg map on one ambient group, the simply connected Chevalley group `ChevalleyGroup d.dynkinType _ d.Closure` of its Dynkin type; there is no family-specific carrier".

Claim: false at the pin and against CFSGStatement on main. The pinned Tau Ceti has no `ChevalleyGroup`; each family has its own `AmbientGroup` (`TypeA.lean:119` full-weight carrier, `TypeC.lean:154` `SpStd.points`, `TypeB/Basic.lean:157` `TypeBSpinCarrier.points`, `TypeE6.lean:108` `E6Minuscule.points`, `Unimodular.lean:160` `GeckGroup`, `ReeG2/Carrier.lean:100`, `Tits/Carrier.lean:85`, …), assembled by cases in `Assembly/AmbientGroup.lean:105`. CFSGStatement on main (L0 "Explicit carriers", "The carrier plan", and L5) designates these explicit carriers and makes agreement with the pinned Chevalley–Demazure points a separate obligation L5. Consequently F1/T1/T3 here consume the ChevalleyGroups roadmap's C2–C5 (stated for `ChevalleyGroup t ht k`) as if they were theorems about `d.AmbientGroup`, with no transport.

Witness: `grep -r ChevalleyGroup` over the pinned `TauCeti/` finds nothing; `TauCeti/GroupTheory/SpecificGroups/CFSG/Assembly/AmbientGroup.lean:105` is a case split over families; CFSGStatement README on main, lines 340–400 and 652–676.

Repair: describe the carrier as `d.AmbientGroup` with `d.steinberg`, family by family, and require before consuming ChevalleyGroups C2–C5 a `MulEquiv e` to the pinned points with `e (d.steinberg g) = F' (e g)` for the independently defined `F'`, or else prove the needed root calculus on the designated carrier itself (this is main's rule in F1/T1/T3).

## R04 (P2) — Supplier drift: the Lyons row describes a presentation that is not the pinned one

Location: README P2-N table, row "**Ly**, `Lyons.presentation`, Havas–Sims six-generator, 53-relator presentation … `a,b,c,d,e,z` … relations (14.1)–(14.86), retaining `e` and the exact 53 surviving relators".

Claim: at the pin `TauCeti.Sporadic.lyPresentation` is Gebhardt's five-generator (`a,b,c,d,z`), twenty-five-relator presentation (blocks R_H2, R_H1, R_G of sizes 9, 7, 9), source Gebhardt, Experimental Mathematics 9 (2000), §3B p. 336. There is no `Lyons.presentation` and no generator `e`. The row's subgroup chain (`⟨a,b,c⟩` of order 1,500,000 and index 3,906 in `⟨a,b,c,d⟩` of order |G₂(5)| = 5,859,000,000, index 8,835,156 in Ly) does match Gebhardt's three stages, so the numbers survive, but the generator set, relator count, source and locators do not.

Witness: `TauCeti/GroupTheory/SpecificGroups/CFSG/Sporadic/Lyons.lean:233–251` (`generatorNames := ["a","b","c","d","z"]`, `expectedRelatorCount := 25`) and its module docstring.

Repair: rewrite the row against `lyPresentation`: generators `a,b,c,d,z`; upper bound for `H = ⟨a,b,c,d⟩` from the sixteen relators of R_H2 ∪ R_H1 (the `z`-free part); index of `H` at most 8,835,156 from all twenty-five relators; cite Gebhardt §3B p. 336; drop the Havas–Sims locators or cite that paper only as the origin of the method.

## R05 (P2) — Supplier drift: Fi24′ row cites declarations absent at the pin

Location: README P2-N table, row Fi24′: "Recognize the 80-relator parent `P₀ = Fi24AutomorphismGroup` first … reuse `fi24PrimeGroupMulEquivCommutator`"; footnote `[src-c]` pinning Tau Ceti revision `63586b16…`.

Claim: neither `Fi24AutomorphismGroup` nor `fi24PrimeGroupMulEquivCommutator` exists in the pinned Tau Ceti (5cb65f0). `Fischer/TwentyFour.lean` defines `fi24AutomorphismRelators` (80 relators on `Fin 12`) and `fi24PrimePresentation` (11 Schreier generators, 136 relators) but no presented parent group and no equivalence of the Schreier presentation with a commutator subgroup. The cited revision is not the pin.

Witness: `grep -r "Fi24AutomorphismGroup\|fi24PrimeGroupMulEquivCommutator"` over the pinned `TauCeti/` is empty; `lake-manifest.json` pins Tau Ceti at 5cb65f0393fd8deeaf3fb6398ba48bad654e479d.

Repair: state the parent presented group and the equivalence `fi24PrimePresentation.Group ≃* [P₀, P₀]` as targets of this roadmap (P0 item 1 or P2-N), with the parity map and the even-relator hypothesis spelled out, and cite only declarations that exist at the pin; remove the revision hash.

## R06 (P2) — Computational certificate machinery specified as roadmap content

Location: README P0 ("sound finite-index, normal-form, finite-action, and normal-closure certificate checkers", "compressed straight-line words and subgroup-chain certificates as data", "verified stabilizer chains"), P2-N J4 paragraph ("double-coset certificate … a rewrite for multiplication by each of `x,y,t` on each parametrized coset block … prove the checker sound"), Ru paragraph ("Decode it with the pinned parser").

Claim: these specify executable verification procedures, data formats and a parser rather than mathematics. The project principles admit the mathematical background of an algorithm and exclude the algorithm itself. The underlying theorems are fine and should stay: a subgroup with a finite set of right-coset words closed under right multiplication by generators has index at most that set's size; the order of a permutation group from a chain of stabilizers and their orbit lengths; the prime-order normal-generation simplicity criterion via Cauchy's theorem; the Iwasawa criterion already in Mathlib.

Witness: README lines 200–235 and 308–330 (quoted above); main's README has the same text, so this is shared with the merged roadmap and is for the human reviewer to weigh.

Repair: state each criterion as a theorem with hypotheses and conclusion, name the group-specific inputs as mathematical data (a transversal, a stabilizer chain, a set of representatives), and leave checker design, certificate encodings and parsers out of the roadmap.

## R07 (P2) — Two owners for the Leech lattice and for ten sporadic permutation models

Location: README P2-L "Construct the Leech lattice `Λ` from this code … Prove that its minimal vectors form a finite spanning set"; P1 "For each [of the fourteen names], prove that the Tau Ceti relators hold of the model's specified generators and that these generate it".

Claim: the Leech lattice by Construction B and an odd shift, with its minimum 4, absence of roots and congruence model, is Layer 6 of `Rank24LatticeConstructions` on main; planning it again is a second owner. The permutation models, orders and presentation surjections for `M11 M12 M22 M23 M24 J1 J2 HS McL Co3` are O1/O2 of the open `SporadicOrders` roadmap, whose scope section states that CFSGBasicProperties consumes them and does not redefine the ten carriers; this head builds all fourteen models itself.

Witness: `TauCetiRoadmap/Rank24LatticeConstructions/README.md` on main, "Layer 6: the Leech lattice by Construction B and an odd shift"; `TauCetiRoadmap/SporadicOrders/README.md` at its open head, "Scope and ownership", second bullet.

Repair: cite Rank24LatticeConstructions Layer 6 for `Λ` (coordinates `Ω = Fin 24`, form `B(x,y) = (∑ x_i y_i)/2`, `Leech = K.ofIsotropicSubgroup(H_s)`) and own only the minimal-vector classification, `Co0`, `Co1` and the actions; cite SporadicOrders O1/O2 for the ten models and own only `Co2 Suz Fi22 He` and the recognition bridges. This is what main's README does.

## R08 (P3) — Library attributions that do not hold at the pin

Location: README line 35, "identifies the Suzuki branch with Mathlib's `suzukiGroup`"; line 23–25 "existing `fixedField` … results in the CFSG files".

Claim: `suzukiGroup` is not in Mathlib at the pin (dc4b8d6); it is `TauCeti/GroupTheory/SpecificGroups/CFSG/Suzuki/Basic.lean`. `fixedField` occurs only in `TauCeti/FieldTheory/`, not in the CFSG files. CFSGStatement on main has no L4 section, only a table row.

Witness: `grep -rl suzukiGroup Mathlib/` is empty at the pin; `grep -rl fixedField TauCeti/GroupTheory/SpecificGroups/CFSG/` is empty.

Repair: "Tau Ceti's `suzukiGroup`"; cite `CFSG/FieldCoordinates.lean` and `CFSG/Suzuki/FieldDescent.lean` by name; cite "CFSGStatement, milestone L4 (workstream table)".

## R09 (P3) — README shape and policy

Location: whole file.

Claim: the README does not follow the roadmap form: no `**Summary.**`, `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, numbered `## Layer k` sections with `*Needs:*` lines, `**Checks.**` lists, `### Examples`/`### Dependencies`, or `## Downstream consumers`; milestone tables stand in for layers. Policy items: a Mathlib pull-request link and "regardless of its timing" (line 47–48); a Tau Ceti revision hash and GitHub blob link (`[src-c]`); "Coordinate with that project's author" (process instruction); the relative link `../AlgebraicCodingTheory/README.md` is broken (the roadmap is under `Completed/`); the anchor `../../CONTRIBUTING.md#porting-existing-work` does not exist (the section is in `README.md`); milestone names E0/F0/T0/P0 are the roadmap's own vocabulary rather than layer numbers.

Witness: compare `TauCetiRoadmap/Rank24LatticeConstructions/README.md` or `Completed/AlgebraicCodingTheory/README.md` on main for the expected shape; `ls TauCetiRoadmap/AlgebraicCodingTheory` on main fails.

Repair: restructure into layers with `*Needs:*` lines and Checks; fix the two links; remove the pull-request link, the revision hash and the coordination instruction.

## R10 (P3) — T0 drops the semidirect condition of its cited theorem

Location: README T0, "a solvable normal subgroup `U` of `B`, with `B = U · (B ∩ N)`".

Claim: the cited Conrad handout defines a split BN-pair by `B = T ⋉ U` (so `U ∩ T = 1`, `T = B ∩ N`), and Theorem 2.4 is stated for split BN-pairs. The roadmap's wording omits `U ∩ (B ∩ N) = 1`. The conclusion as restated (connected nonempty Coxeter graph, `Z ∩ U = 1`, `H⁺` perfect ⟹ `Z ∩ H⁺ = Z(H⁺)` and `H⁺/(Z ∩ H⁺)` simple or trivial) matches Conrad's statement.

Witness: conrad-tits line 72 (definition of split) and lines 75–80 (Theorem 2.4).

Repair: add `U ∩ (B ∩ N) = 1` to the hypothesis (it holds in every intended application, `U` being the unipotent radical's points), or cite Bourbaki Lie IV §2.7 Theorem 5 and its Corollary and match that statement's hypotheses exactly.

## Verified sound

Gate and order. The worker's gate at this head: `missing-files=1 FAIL` (R01). Dependency check run by me: `depcheck: 156 roadmaps, 1063 edges, 0 problem(s)`; no UPWARD or CYCLE line (the README has no `*Needs:*` lines, so the check has little to see). CFSGBasicProperties is line 353 of the merge order; its suppliers CFSGStatement, Rank24LatticeConstructions and AlgebraicCodingTheory are on main, ChevalleyGroups and SporadicOrders are open roadmap pull requests with their own folders. Other changes outside the roadmap folder: none (`git diff --stat origin/main...HEAD` lists only the two files in the folder).

Previous AI review: none.

Seeded sample, verified against the texts.

- P2-L: `Completed/AlgebraicCodingTheory/README.md` Layer 5 defines `G₂₄` from `[I₁₂ | B]` with the bordered reverse-circulant block and states that identification of permutation automorphism groups with Mathieu groups is not a target (lines 275–321), as the roadmap says. The Leech construction it then plans is owned elsewhere (R07).
- P2-G: hohn-seysen-2025 (arXiv:2508.01037, read from the service's text) lines 202–232 define `B = 300x ⊕ 98280x ⊕ 98304x` with `300x = S²(24x)`; lines 94–96 give `N0 = ⟨Nx0, τ⟩` of structure `2^{2+11+22}.(M24 × S3)`; Lemma 2.1 (line 244) is the fixed-space statement for the centralizer of a short `x_r` in `Gx0`, and its proof (lines 259–263) restricts `300x` to `Co2` with constituents `χ1 ⊕ χ1 ⊕ χ23 ⊕ χ275`, dimensions 1, 1, 23, 275, as the roadmap states.
- P2-M: Theorem 2.9 (line 390) is `C_M(x_{−1}) = Gx0`; lines 392–397 define `β⁺ = x_{ij}`, `β⁻ = β⁺·x_{−1}`, the axes `v⁺, v⁻`, and `M_{v⁺} ∩ M_{v⁻} ≅ 2^{1+23}.Co2`; §4 (lines 867–876) defines `X⁻` as the `M_{v⁺}`-orbit of `v⁻` and `H = M_{v⁺} ∩ Gx0 = C_{Gx0}(β⁺)`; Theorem 5.1 (lines 1006–1018) proves `|M| = |X⁺|·|X⁻|·|S|` exactly by the argument the roadmap restates (`β⁺β⁻` central, Theorem 2.9, `S ≤ Gx0`); Corollary 5.2 (line 1022) gives `|B| = |X⁻|·|S|/2`; Lemmas 5.3–5.5 and Theorem 5.6 (lines 1029–1065) are the simplicity route with the normal-subgroup series `1 ◁ ⟨x_{−1}⟩ ◁ Qx0 ◁ Gx0` and the triality exclusions; Tables 2 and 4 (lines 767, 944) and Appendix D (line 1472) are the orbit certificates.
- P2-D: breuer-magaard-wilson-2020 (arXiv:1902.07758v2) §3.1 lines 63–66: the `Y₄₃₃` presentation was proved by Ivanov subject to the Monster having no proper double cover, and that hypothesis is Griess's; §2 lines 31–34: the `Y₅₅₅`/BiMonster presentation implies `Y₄₃₃` for `B` given that the Schur multiplier of `M` has odd order. Both match the roadmap's attributions.
- P2-R: BMW §3.1 lines 67–74 give the Coxeter relations, the spider relation `(t5 t4 t3 t5 t6 t7 t5 t9 t10)^10` presenting `2 × 2.B`, and the two further relations `(t5 t4 t3 t6 t7 t8 t9)^9`, `(t5 t4 t3 t6 t9 t10 t11)^9` presenting `B`; these are letter for letter the pinned `TauCeti.Sporadic.BabyMonster.spiderRelator`, `extraRelatorOne`, `extraRelatorTwo` (`BabyMonster.lean:246–273`), 69 relators. The pinned `Monster.lean:159–225` has the `Y₄₄₃` spider relator, `centralInvolutionRelator = (a b₃ c₃ d₃ b₁ c₁ b₂)^9`, and `expectedRelatorCount := 80`, matching the roadmap's two bullets. Ivanov's own text was not readable (see below).
- T0: conrad-tits lines 75–80, Theorem 2.4, matches the restated criterion (R10 for the split condition).

Pinned declarations opened. `Mathlib/GroupTheory/GroupAction/Iwasawa.lean:47,59` (`IwasawaStructure`, `.isSimpleGroup`); `Mathlib/GroupTheory/SpecificGroups/Alternating/Simple.lean:202` (`alternatingGroup.isSimpleGroup (hα : 5 ≤ Nat.card α)`); `Mathlib/GroupTheory/SpecificGroups/Cyclic.lean:160` (`isSimpleGroup_of_prime_card`); `TauCeti/GroupTheory/SpecificGroups/CFSG/Index.lean:109–215, 1482` (`LieTypeIndex`, `InStandardRange`, `IsDuplicateRepresentative`, `Valid`, `CFSGIndex` with `cyclic p (p.Prime)`, `alternating degree (5 ≤ degree)`, `lie`, `sporadic`); `TauCeti/GroupTheory/TitsSystem/Basic.lean:48` and `Bruhat/Basic.lean` (no cell-uniqueness or parabolic classification at this pin, so T0's "extend" is consistent with the pin); the 26 pinned presentations' `generatorNames`/`expectedRelatorCount` (J3 2/8, J4 3/12, Ru 3/12, ON 7/29, Fi23 10/57, Fi24′ 11/136, HN 5/19, Th 8/39, M 12/80, B 11/69 agree with the README; Ly disagrees, R04); `HaradaNorton.lean:36–64` (corrected twelfth relator `(ad)²`), `ONan.lean:62` (path `a3b3c8d3e3f`), `Fischer/TwentyThree.lean:55` (`(dcbdefdhi)^10, (abcdefh)^9`), `Fischer/TwentyFour.lean:286,455` (80 parent relators, 136 Schreier relators).

Cross-roadmap citations resolved. CFSGStatement (main): I0, L0–L3, L5, S0, S1, A0 exist; L4 is a table row only. ChevalleyGroups (open head): C2 "Chevalley data, their group schemes, and root data", C3 "the group over a field", C4 "flatness, the big cell, and points over an algebraically closed field" (contains generation by root subgroups over an algebraically closed field), C5 "endomorphisms and their character maps" (Frobenius, graph automorphisms, exceptional isogenies with root-subgroup action), as cited. AlgebraicCodingTheory: on main under `Completed/`, Layer 5 as cited (link path wrong, R09). Rank24LatticeConstructions (main) Layer 6 and SporadicOrders (open head) O0–O2: not cited here though they own objects this head plans (R07). ReductiveGroups: on main. The worker's citation resolver found no missing citation; I confirmed `Fi24AutomorphismGroup`, `fi24PrimeGroupMulEquivCommutator`, `Lyons.presentation`, `ChevalleyGroup` are absent at the pin (R03–R05).

Ownership against open pull requests: checked against the sibling checkouts the brief lists (ChevalleyGroups, SporadicOrders, CFSGStatement) and the roadmaps on main; the findings are R02 (main itself) and R07.

Adversarial table (values computed on each side).

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| J3 upper bound `|K| ≤ 19`, index ≤ 2,643,840, so `|P| ≤ 50,232,960` | the one case | 19 × 2,643,840 = 50,232,960 = |J3| | consistent | none |
| J4 `|H| ≤ 21,799,895,040` from `2^{1+12}·3·M22·2`, `[P:H] ≤ 3,980,549,947` | the one case | 2^13·3·443,520·2 = 21,799,895,040; × 3,980,549,947 = 86,775,571,046,077,562,880 = |J4| | consistent | none |
| Ru `|H| ≤ 35,942,400`, index ≤ 4,060 | the one case | 35,942,400 × 4,060 = 145,926,144,000 = |Ru|; 35,942,400 = |²F₄(2)|, twice the Tits group | consistent | none |
| O'Nan `|H| ≤ 3,753,792`, index ≤ 122,760 | the one case | 2 × |L₃(7)| = 2 × 1,876,896 = 3,753,792; × 122,760 = 460,815,505,920 = |ON| | consistent | none |
| Fi23 `|H| ≤ 129,123,503,308,800 = 2|Fi22|`, index ≤ 31,671 | the one case | 2 × 64,561,751,654,400 = 129,123,503,308,800; × 31,671 = 4,089,470,473,293,004,800 = |Fi23| | consistent | none |
| Fi24′ `|M| ≤ 2|Fi23|`, index ≤ 306,936, `|P₀| ≤ 2|Fi24′|`; stated order 1,255,205,709,190,661,721,292,800 | the one case | 2|Fi23| × 306,936 = 2 × 1,255,205,709,190,661,721,292,800 | consistent | none |
| HN `|H| ≤ 177,408,000`, index ≤ 1,539,000 | the one case | 4|HS| = 4 × 44,352,000 = 177,408,000; × 1,539,000 = 273,030,912,000,000 = |HN| | consistent | none |
| Ly `|⟨a,b,c⟩| ≤ 1,500,000`, index 3,906, `|H| ≤ 5,859,000,000`, index ≤ 8,835,156 | the one case | 1,500,000 × 3,906 = 5,859,000,000 = |G₂(5)|; × 8,835,156 = 51,765,179,004,000,000 = |Ly|; 1,500,000 = 5^5 · |GL₂(5)| matches Gebhardt's stage one | numbers consistent, presentation wrong | R04 |
| Th `|U| ≤ 12,096`, `[D:U] ≤ 17,472`, `[H:D] ≤ 3`, `|H| ≤ 634,023,936`, `[P:H] ≤ 143,127,000` | the one case | 12,096 × 17,472 × 3 = 634,023,936; × 143,127,000 = 90,745,943,887,872,000 = |Th| | consistent | none |
| Sylow prime sets of the nine candidates | all nine | factorizations: J3 2^7·3^5·5·17·19; J4 2^21·3^3·5·7·11^3·23·29·31·37·43; Ru 2^14·3^3·5^3·7·13·29; ON 2^9·3^4·5·7^3·11·19·31; Fi23 2^18·3^13·5^2·7·11·13·17·23; Fi24′ 2^21·3^16·5^2·7^3·11·13·17·23·29; HN 2^14·3^6·5^6·7·11·19; Ly 2^8·3^7·5^6·7·11·31·37·67; Th 2^15·3^10·5^3·7^2·13·19·31 | each listed prime set equals the prime support | none |
| Monster count `|M_alg| = |X⁺|·|X⁻|·|S|`, `|S| = 2^24·|Co2|`, `|B_alg| = |X⁻|·|S|/2` | the one case | |S| = 16,777,216 × 42,305,421,312,000 = 709,767,191,322,427,392,000; |X⁺| = |M|/(2|B|) = 97,239,461,142,009,186,000 (integer); |X⁻| = 2|B|/|S| = 11,707,448,673,375 (integer); |X⁻|·|S|/2 = |B| | consistent with Höhn–Seysen Thm 5.1, Cor 5.2 | none |
| `|G| = 2^25·|Co1|`, `|N| = 2^35·|M24|·6` divide `|M|` | the one case | 139,511,839,126,336,328,171,520,000 and 50,472,333,605,150,392,320 both divide |M| | consistent | none |
| Lemma 2.1 restriction: `300 = S²(24)` to `Co2` has constituents 1, 1, 23, 275 | the one case | 24 = 1 + 23 on Co2; S²(1 + 23) = 1 + 23 + S²(23) = 1 + 23 + (1 + 275); fixed space of `C_r` has dimension 2 | matches hohn-seysen-2025 lines 259–263 | none |
| `S = C_G(β⁺)` from `β⁺β⁻ = z`, `C(z) = G`; kernel of `S → Stab_{Co1}(λ)` is `C_Q(β⁺)` of order 2^24 | the one case | centralizing β⁺ and β⁻ = β⁺z ⟺ centralizing β⁺ and z; `C_Q(β⁺)` has index 2 in Q (order 2^25), so 2^24; surjectivity onto Co2 by adjusting with `q ∈ Q`, `[q, β⁺] = z` | consistent | none |
| P2-D: "no perfect group surjects onto `M_alg` with central kernel of order two" versus "no proper double cover" | M perfect; split cover `C2 × M` | a nonsplit central C2-extension E of a perfect group has E′ perfect mapping onto M with E′ ∩ ker = C2, so E′ = E is perfect; conversely a perfect central C2-extension is nonsplit; `C2 × M` is not perfect | equivalence holds; wording sound | none |
| T0 criterion versus Conrad Theorem 2.4 | trivial W excluded by hypothesis; `H⁺` trivial case | hypotheses: split BN-pair, U solvable, W ≠ 1 connected, `H⁺` perfect, `Z ∩ U = 1`; conclusion `Z ∩ H⁺ = Z(H⁺)`, quotient simple or trivial | matches except `U ∩ T = 1` | R10 |
| F0 criterion: `F^r` acts on coordinates by `x ↦ x^{p^e}`, `e > 0` ⟹ `fixedSubgroup F` finite | e = 0; non-faithful embedding | e = 0 gives the identity (infinite fixed points): excluded by `e > 0`; fixed points of F ⊆ fixed points of F^r ⊆ matrices with entries in the p^e-element field, at most p^{e·n²} of them; faithfulness needed and stated | sound | none |
| E0: `.cyclic p hp` and `.alternating n hn` | p = 2; n = 5 | `CFSGIndex.cyclic (p) (p.Prime)`, `alternating (degree) (5 ≤ degree)` at `Index.lean:1483–1484`; `isSimpleGroup_of_prime_card`, `alternatingGroup.isSimpleGroup (5 ≤ Nat.card α)` | statable at the pin only per constructor (no `CFSGIndex.Group`) | R01 note |
| Validity ranges versus "retained cases include higher-rank groups over 𝔽₂, G₂(3), F₄(2); A₁(2), A₁(3), B₂(2) excluded" | q = 2, 3; rank 1, 2 | `InStandardRange`: A rank 1 needs q ≥ 4; ²A rank 2 needs q ≥ 3; B₂(2) excluded; C needs odd p and rank ≥ 3; G₂ needs q ≥ 3; duplicates A₁(4,5,9), A₂(2), A₃(2), B₂(3); `tits` and `suzuki/ree m ≥ 1` (q ≥ 8, 27, 8) retained | 13 ordinary/graph-twisted + 4 half-Frobenius = 17 constructors; claims consistent | none |
| Fi24′ parent: 80 relators including the order-17 word; Schreier 11 generators, 136 relators; index 306,936 | the one case | pin: `length_fi24AutomorphismRelators = 80`, `length_fi24PrimeRelators = 136`, 11 generator names; |Fi24′|/|Fi23| = 306,936 | consistent (names in R05 aside) | none |
| P1 "fourteen names with FiniteSimpleGroups models" | list | SporadicOrders README (open head) lines 68–69 lists the same fourteen; pinned `Lyons.lean` notes Ly is not covered | consistent with the sibling roadmap; repository itself not opened | none |

## Not verifiable

- Ivanov, *Y-groups via Transitive Extension* (J. Algebra 218, 1999): DOI landing page is paywalled (Elsevier); no preprint. The locators (definition p. 413, Lemma 3.2 p. 419, §3.9 pp. 430–431) agree with the pinned `Monster.lean` docstring but were not read.
- Ivanov, *Presenting the Baby Monster* (J. Algebra 163, 1994): paywalled; BMW §3.1 restates the theorem and its hypothesis.
- Griess, *The Schur multipliers of the known finite simple groups, III* (Rutgers Group Theory Year, 1985): no open copy found; BMW §3.1 attributes the hypothesis to it.
- Kim–Michler, arXiv:0906.1064, Lemma 6.2(a)–(c) and Theorem 6.3: the arXiv PDF's text layer is glyph names and OCR is not installed on this worker; the pinned `Fischer/TwentyFour.lean` records a read-through of Lemma 6.2.
- The ATLAS Magma artifacts (J3, J4), Soicher's `tcenum` file, the GPL `gpl.g` records, Bray's `HNpb.m`, Havas–Sims, Havas–Soicher–Wilson, Bolt–Bray–Curtis and Bradley–Curtis–Malik: outside the seeded sample and not fetched; the pinned presentation modules were used as the comparison point instead.
- The FiniteSimpleGroups repository: not opened; its coverage claim was checked only against the SporadicOrders README.

All four unread texts are listed in the job's `needs-references.toml`.

## Source issues

- **Misprint** in conrad-tits at Theorem 2.4, p. 2: the source says the split BN-pair uses a subgroup U inside N; it should be U inside B, the normal subgroup with B = T ⋉ U as defined just above; affects nothing.
