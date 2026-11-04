# Review of CFSGBasicProperties (pull request #1779 at 34893e6)

**Verdict:** needs changes

This pull request amends the `CFSGBasicProperties` roadmap that is already on main (merged as #446); the diff against main touches `README.md` only (E0/F0–F1 rewritten as consumption of Tau Ceti, the milestone table, A0, and a new "Existing formalizations and model comparisons" section). The folder is reviewed as a whole, so findings on `Suggested.lean` below predate this pull request and are marked as such; they still block acceptance because the worker's gate fails on them (`sorry-data=8`, `imports=1`, `no-import-mathlib=1`, `blob=3`, `residue=1`, build OK). The pinned Tau Ceti is `358314d4` in both the pull-request worktree and the content checkout; every "at the pin" verdict below used that revision.

## R01 (P1) — `Suggested.lean` has eight sorried data definitions (pre-existing on main)

Location: `TauCetiRoadmap/CFSGBasicProperties/Suggested.lean` lines 49–53 (`classDataTransport`, two sorried proof fields), 80–81 (`monster2AWord`, `monster2BWord`), 99–107 (`monsterGriessAction`, `monster196883Representation`, `monsterGriessSplitting`), 116 (`monsterClassWords`), 126–127 (`monsterCentralizerOrder`).

Claim: the binding principle forbids a `def` whose body is `sorry` and anything that mentions one; the worker's gate reports `sorry-data=8`. Every Monster statement in the file (`orderOf_monster2A`, `monster_involution_classes`, `monster196883_isIrreducible`, `monsterClassWords_length`, `monsterCentralizerOrder_eq`, `monsterClassRepresentatives_mass`, `monsterClassData`, `monster_card_conjClasses`, `monster_card_irreducibleCharacters`) is stated about these sorried objects, so none of them is a statement about the Monster: `monster2A := monsterWordEval monster2AWord` with `monster2AWord := sorry` is satisfiable by the identity word, and `monster_card_conjClasses` then counts the classes of a list nobody has fixed.

Witness: the gate record for this head; `lake env lean` on the file gives fifteen `declaration uses sorry` warnings and no error, which checks elaboration, not content.

Repair (tested, see R02): delete the eight definitions and everything that mentions them, and state the Monster headlines directly on the native carrier `TauCeti.SporadicName.M.Group`: the class count `Nat.card (ConjClasses TauCeti.SporadicName.M.Group) = 194`; the two involution classes as an existential over two elements of order two, non-conjugate, with every element of order two conjugate to one of them; the existence of an irreducible `Representation ℂ TauCeti.SporadicName.M.Group (Fin 196883 → ℂ)`; and `Nat.card (TauCeti.irreducibleCharacters ℂ TauCeti.SporadicName.M.Group) = 194`. The representative words, the centralizer table and the Griess action stay README targets of P2M.

## R02 (P2) — The headline theorems statable at the pin are absent (pre-existing on main)

Location: `Suggested.lean` lines 6–13 (module docstring) and the whole file; README lines 8–11 state the endpoint `CFSGIndex.finite` and `CFSGIndex.isSimpleGroup`.

Claim: `TauCeti.CFSGIndex.Group` exists at the pin (`TauCeti/GroupTheory/SpecificGroups/CFSG/Classification.lean` line 41, an `abbrev CFSGIndex.Group : CFSGIndex → Type`), as do `TauCeti.ValidLieTypeIndex.Group` (`Assembly/LieType.lean` line 133) and `TauCeti.SporadicName.Group`. So the two endpoint theorems, `IsSimpleGroup d.Group` for every valid Lie index (T2/T3), and `Finite s.Group` and `IsSimpleGroup s.Group` for every sporadic name (P1/P2) are all statable now and none is stated; the docstring does not say they are not statable. The file instead displays P0 tooling and the sorried Monster interface of R01.

Witness: a scratch file with exactly these nine statements (`CFSGIndex_finite`, `CFSGIndex_isSimpleGroup`, `validLieTypeIndex_isSimpleGroup`, `sporadicName_finite`, `sporadicName_isSimpleGroup`, `monster_card_conjClasses`, `monster_two_involution_classes`, `monster_exists_irreducible_196883`, `monster_card_irreducibleCharacters`), importing `Mathlib`, `TauCeti.GroupTheory.SpecificGroups.CFSG.Classification`, `…CFSG.Assembly.LieType`, `…CFSG.Sporadic.Presentation` and `TauCeti.RepresentationTheory.CharacterTable.Table`, elaborates under `lake env lean` at the pin with exactly nine `declaration uses sorry` warnings and no error (the `Classification` and `Assembly.LieType` modules were built first with `lake build`).

Repair: replace the body of `Suggested.lean` by those headline statements (each with `sorry`), keep `conjugacyCoverage_of_mass` only if the author regards the P0 exhaustion criterion as a headline, drop the `[Invertible (Nat.card … : ℂ)]` hypothesis on the character count (it follows from `Finite`, `Nonempty` and `CharZero ℂ`; the native `TauCeti.card_irreducibleCharacters` at `Table.lean` line 160 carries it as a section variable, so the final statement discharges it with `invertibleOfNonzero`), and write the docstring in the form "<title>: target signatures".

## R03 (P2) — E0, F0, F1 and T0 are declared "implemented" through Tau Ceti declarations that do not exist at the pin

Location: README lines 78–85, 113–116, 120–140, 148–152, 159–163 ("**F0 is implemented.** Consume `FixedSubgroup/MatrixCoordinates` …", "**F1 is implemented for every designated carrier.** Consume `ValidLieTypeIndex.finite_fixedPoints` and `ValidLieTypeIndex.finite`", "Consume `CFSGIndex.finite_cyclic` … from `BasicProperties/Elementary`", "Consume native `TauCeti.TitsSystem.standardParabolicOrderIso` from Parabolic/Classification"); milestone rows E0, F0, F1, T2, T3, A0 (lines 95–106).

Claim: at the pinned Tau Ceti `358314d4` none of the files `GroupTheory/SpecificGroups/CFSG/BasicProperties/Elementary.lean`, `…/BasicProperties/LieTypeFinite.lean`, `…/BasicProperties/TypeA.lean`, `…/BasicProperties/TypeC.lean`, `GroupTheory/FixedSubgroup/MatrixCoordinates.lean`, `GroupTheory/TitsSystem/Parabolic/Classification.lean` exists (there is no `CFSG/BasicProperties/` and no `GroupTheory/FixedSubgroup/` directory), and none of `CFSGIndex.finite_cyclic`, `CFSGIndex.isSimpleGroup_cyclic`, `CFSGIndex.isSimpleGroup_alternating`, `finite_fixedSubgroup_of_iterate_apply_eq_pow`, `finite_fixedSubgroup_of_iterate_eq_iterate`, `finiteFixedPointCandidate`, `ValidLieTypeIndex.finite_fixedPoints`, `ValidLieTypeIndex.finite`, `iterate_steinberg_twistOrder_of_not_usesHalfFrobenius`, `specialLinearEquivFixedPoints`, `symplecticEquivFixedPoints`, `standardParabolicOrderIso` occurs in it (the worker's citation check lists the same eleven names). They do exist at the linked revision `d7dad378` (2026-10-30, 9628 commits after the pin; `Elementary.lean` lines 46–55, `LieTypeFinite.lean` lines 119–130, `MatrixCoordinates.lean` lines 65–135, `Assembly/LieType.lean` line 163, `Parabolic/Classification.lean` line 146 at `a9d0ba7b`), and their hypotheses agree with the README's description (injective coordinate map into `Matrix n n K` over an integral domain, iterate acting by `x ↦ x ^ m` with `1 < m`; the `eq_iterate` forms need `k ≠ 0`, `MatrixCoordinates.lean` lines 85–86). The amendment deleted the roadmap's own statements of the finite-coordinate criterion and of `Finite d.FixedPoints`, `Finite d.Group` on the strength of these citations, so at the pin the finiteness of every Lie-type group, the elementary branches and the parabolic classification consumed by T0 have no owner: T2, T3 and A0 say "native LieTypeFinite" where main said F1.

Witness: `lake-manifest.json` pins Tau Ceti at `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`; `ls` of `CFSG/` at that revision lists `Assembly Classification.lean … Unimodular.lean` and no `BasicProperties`; the only `finite_fixedPoints` at the pin is `Isogeny.Hom.finite_fixedPoints_pow_ofIsogeny_baseChangeFrobenius` (elliptic curves).

Repair: keep E0, F0 and F1 as this roadmap's targets, stated with the hypotheses of the newer files (so the README is correct at any pin): the finite-coordinate criterion for an injective `ρ : G → Matrix n n K`, `K` an integral domain, `n` finite, an endomorphism `F` and `r, m` with `1 < m` and `ρ (F^[r] g) i j = ρ g i j ^ m`; its `Subgroup (GL n K)` and faithful-representation forms; transport through `fixedSubgroupCongr` and to the derived central quotient; `Finite d.FixedPoints` and `Finite d.Group` for every `ValidLieTypeIndex` from the branch iterate formulas (`steinberg_steinberg_of_usesHalfFrobenius` exists at the pin, `Assembly/LieType.lean` line 116; the twist-order iterate formula does not); the two elementary theorems; the parabolic order isomorphism. Then say in one clause that Tau Ceti revision `d7dad378` already implements each of them under the names cited, so an implementer consumes them once the pin reaches that revision and otherwise proves them as stated. Drop "is implemented" and the "(native)" row labels. Also correct line 128–129: the criterion needs no positive `r`, but the `eq_iterate` forms need the Frobenius iterate number `k ≠ 0`.

## R04 (P2) — The "Hex permutation-group kernel checker" is an unowned, unpinned prerequisite

Location: README lines 69–73 ("SporadicOrders … owns the ten canonical ATLAS permutation models …, their orders and presentation surjections, using the Hex permutation-group kernel checker. … Consume that checker for finite permutation order/membership certificates"), line 101 (P0 depends on "shared Hex/word/orbit interfaces"), line 315 ("Reuse Hex stabilizer-chain cardinality/membership soundness").

Claim: SporadicOrders on main says the opposite: "What its P0 receives from here for finite permutation groups is theorems, not a checker or a certificate format: the order formula (0.1), the orbit description (0.2), the membership criterion along a base (0.3), and the ten orders of Layer 1" (`TauCetiRoadmap/SporadicOrders/README.md` lines 53–58), and names Hex only as an external library (`leanprover/hex-perm-group-theory`, reference `[hex]`, lines 519–532) that its own proofs may or may not use. Nothing named `Hex` exists in the pinned Tau Ceti (the only hits are `Hexacode` and hexagon lemmas). So P0's order/membership certificate soundness has no owner: not SporadicOrders, not the pin, and P0 says it reuses it rather than proving it.

Witness: SporadicOrders README lines 53–58 and 519–532 on main (929496d); `grep -rl 'Hex' TauCeti/` at the pin returns coding-theory and knot-theory files only.

Repair: cite SporadicOrders §§0.1–0.3 and Layer 1 as theorems; make the stabilizer-chain cardinality/membership soundness (and any coset-table or normal-form checker P0 needs) targets of P0 item 2–3 with their statements, and remove "Hex" from the supplier sentences and the milestone table.

## R05 (P3) — `Suggested.lean` lacks `import Mathlib` and the gate refuses its header (pre-existing on main)

Location: `Suggested.lean` lines 1–4.

Claim: the file imports four `TauCeti.*` modules and never `Mathlib`; the gate reports `imports=1` and `no-import-mathlib=1`.

Witness: the gate record; the brief's form rule ("the single line `import Mathlib` followed only by the individual `TauCeti.*` modules actually used").

Repair: put `import Mathlib` first; after R01/R02 the needed `TauCeti.*` lines are `…CFSG.Classification`, `…CFSG.Assembly.LieType`, `…CFSG.Sporadic.Presentation` and `…CharacterTable.Table` (the scratch file of R02 elaborates with exactly these).

## R06 (P3) — Links into the roadmap repository pinned to commits, a link to a fork, and a residue word

Location: README line 49 (`…/TauCetiRoadmap/blob/1d6918b…/ChevalleyGroups/README.md`), 852 (`[rank24]`, blob at `a838aeb…`), 853 (`[sporadic-orders]`, blob at `6486269…`), 854 (`[certified-perm]`: `github.com/vincentqb/TauCetiRoadmap/blob/6a9ba06…`), 815 ("catalogue").

Claim: the gate's `blob` rule rejects the three commit-pinned links (all three roadmaps are on main: `../ChevalleyGroups/README.md`, `../Rank24LatticeConstructions/README.md#layer-6…`, `../SporadicOrders/README.md`); the fourth links a personal fork at a commit for a roadmap that is open pull request #717 (a new folder, so citable, by name and section); `residue` rejects "catalogue".

Witness: the gate record (`blob=3`, `residue=1`); `ls content/TauCetiRoadmap` shows the three folders.

Repair: relative links on main for the three; "CertifiedPermutationComputation, §§2.1–2.2" by name for the fourth; "the ATLAS representation list" for "catalogue".

## R07 (P3) — Rank24 Layer 6 lives on `Fin 24`, not `Fin 12 ⊕ Fin 12`

Location: README line 495 ("Consume the canonical Leech lattice `Λ` of Rank24LatticeConstructions Layer 6, on `Ω = Fin 12 ⊕ Fin 12`").

Claim: Layer 6 on main fixes "the dependency's fixed coordinate type `Ω = Fin 24`" (`TauCetiRoadmap/Rank24LatticeConstructions/README.md` line 314); the form `B(x,y) = (∑ i, x_i y_i)/2`, `K.ofIsotropicSubgroup(H_s)`, the raw coordinates `x_i = a_i/2` and norm `∑ a_i²/8` all agree (lines 316–360).

Repair: write `Ω = Fin 24`.

## R08 (P3) — The Baby Monster Sylow list contains 41

Location: README line 598 ("construct its Sylow normal forms for primes `2,3,5,7,11,13,17,19,23,31,41,47`").

Claim: `41 ∤ |B|`: `|B| = 2^41·3^13·5^6·7^2·11·13·17·19·23·31·47` (hohnseysen line 1023, Corollary 5.2), and `4154781481226426191177580544000000 mod 41 = 4`. The prime 41 divides `|M|`, not `|B|`; the target as written asks for a trivial Sylow subgroup.

Repair: delete `41`.

## R09 (P3) — `suzukiGroup` is Tau Ceti's, not Mathlib's

Location: README line 47 ("identifying the Suzuki branch with Mathlib's `suzukiGroup`").

Claim: the pinned Mathlib has no declaration or file mentioning Suzuki groups; `suzukiGroup (n : ℕ) : Subgroup (GL (Fin 4) (GaloisField 2 (2 * n + 1)))` is `TauCeti/GroupTheory/SpecificGroups/CFSG/Suzuki/Generated.lean` line 253. (CFSGStatement on main carries the same misattribution in its L4 row.)

Repair: "Tau Ceti's `suzukiGroup`".

## R10 (P3) — Padding in `Suggested.lean` (pre-existing on main)

Location: `Suggested.lean` lines 40–43 (`classDataOfMass_reps`, `rfl`), 55–57 (`classDataTransport_reps`, `rfl`), 59–61 (`card_conjClasses_of_mulEquiv`, one library lemma `Nat.card_congr e.conjClassesEquiv`), 146–148 (`monsterClassData_numClasses`, unfolds a definition), 159–162 (`monsterClassLabel_eq_iff`, the native `ClassData.index_eq_index_iff`).

Claim: each restates a definition or follows in one step from the pinned library (`TauCeti/RepresentationTheory/CharacterTable/Dixon/ClassData/Basic.lean` lines 161, 213, 236, 276). The one-tactic probe on the sorried theorems found none that closes (`rfl`/`simp`/`infer_instance`/`decide` all fail on lines 29, 74, 91, 110, 120, 123, 131, 138), so the sorried statements are not padding; the proved ones are.

Repair: delete them (they disappear with R01 anyway).

## R11 (P3) — The T0 criterion omits the solvability of `U`, and the F0 wording on iterate numbers

Location: README lines 166–169 ("If the Coxeter graph is connected and nonempty, `Z ∩ U = 1`, and `H⁺` is perfect, then …"); line 128–129.

Claim: Conrad's Theorem 2.4 assumes a split BN-pair with `U` solvable (conrad-tits line 75: "and assume that U is solvable"); the README mentions solvability two sentences earlier as API to "specify", but the criterion sentence states the theorem without it. Separately, "They need neither a characteristic hypothesis nor a positive iterate number" is true of `finite_fixedSubgroup_of_iterate_apply_eq_pow` (`r = 0` allowed) but the `eq_iterate` forms require the Frobenius iterate number `k ≠ 0` (`MatrixCoordinates.lean` line 85 at `d7dad378`).

Repair: add "`U` solvable" to the hypotheses of the criterion; say "no positive power of `F` is required, but the Frobenius iterate number is nonzero".

## R12 (P3) — Two other open roadmaps state the Leech minimal-vector count

Location: README lines 500–505 (the three families with counts 1104, 97152, 98304 and the total 196560).

Claim: LatticePackingsAndPerfectForms (pull request #1723) derives `r_Λ(4) = 196560` from theta identities (its README line 260) and OrthogonalTamagawaAndLatticeMass (#1222) records the count and `|Aut Λ| = 8315553613086720000` as Checks (line 547). This roadmap needs the explicit three-family classification for the Co0 action, which neither supplies, so ownership here is right, but the README should say so in one clause and cite the count as independently available. Ownership against open pull requests not listed with files in the brief (none remain) was not checked.

Repair: one sentence in P2-L: "the count alone is also a corollary of theta identities (LatticePackingsAndPerfectForms, Layer 8D); the explicit families and sign/congruence data are what the Co0 action needs and are owned here".

## Verified sound

**Gate and build.** `lake env lean` on `Suggested.lean` at the pin: fifteen `declaration uses sorry` warnings, no error, exit 0. Dependency check: `depcheck: 205 roadmaps, 1651 edges, 0 problem(s)` (the roadmap is on main and not in the merge order; every supplier it cites is on main or is CertifiedPermutationComputation, open pull request #717 by another author adding a new folder, whose §§2.1 "Encoding and denotation" and 2.2 "Orbit and primitivity checking" exist at its head). No UPWARD or CYCLE line. The worker's gate failures are exactly R01, R05 and R06.

**Pin checks (Tau Ceti `358314d4`, Mathlib of `lake-manifest.json`).** Present: `CFSGIndex.Group` (`Classification.lean:41`), `ValidLieTypeIndex.Group` (`Assembly/LieType.lean:133`, `FixedPointCandidate d.steinberg`), `steinberg_steinberg_of_usesHalfFrobenius` (`:116`), `card_fixedField` (`Frobenius.lean:148`), `fixedSubgroupCongr`, `FixedPointCandidate.congr`, `DerivedCentralQuotient.congr`, `TitsSystem.bruhatCell_injective`, `disjoint_bruhatCell_iff`, `existsUnique_mem_bruhatCell` (`TitsSystem/Bruhat/Uniqueness.lean`), `ClassData` with fields `reps`, `pairwise_not_isConj`, `exists_isConj` and `numClasses`, `index`, `index_eq_index_iff`, `numClasses_eq_card_conjClasses` (`Dixon/ClassData/Basic.lean:98–276`), `card_irreducibleCharacters` with section variables `[Finite G] [IsAlgClosed k] [Invertible (Nat.card G : k)]` (`Table.lean:160–187`), `IsSchreierIndexTwoSource.mulEquivKerParityHom`, `GroupPresentation.mulEquivCommutator`, `mulEquivPresentedGroupCoxeterAppend`, `Fi24AutomorphismGroup` (`Fischer/TwentyFour.lean:694`), `fi24PrimeGroupMulEquivCommutator`, `Sporadic.Monster.spiderRelator` and `centralInvolutionRelator` (`Monster.lean:152`), `Sporadic.BabyMonster.spiderRelator`, `extraRelatorOne`, `extraRelatorTwo` (`BabyMonster.lean:238`), `MulAction.IwasawaStructure.isSimpleGroup` (Mathlib `GroupAction/Iwasawa.lean:81`, needs `[Nontrivial M]` and `commutator M = ⊤`), `isSimpleGroup_of_prime_card`, `LieTypeIndex.Valid` (`Index.lean:181`; `InStandardRange` at `:128` excludes `A₁(2)`, `A₁(3)`, `²A₂(2)`, `B₂(2)`, `G₂(2)` and needs `m ≥ 1` for Suzuki/Ree, as the README's T2/T3 assume). Absent: the twelve names of R03, `Hex` (R04), Mathlib `suzukiGroup` (R09), `StatedLieAdmissible` (an Axiom name, correctly attributed).

**Sporadic presentation rows against the pin** (generator names, relator counts): J3 `a,b`/8; J4 `x,y,t`/12; Ru `u,v,t`/12; O'Nan `a…g`/29; Fi23 `a…j`/57; Fi24′ eleven Schreier generators `ab…al`/136; HN `a,b,c,d,t`/19; Ly `a,b,c,d,e,z`/53; Th `a,b,c,d,e,s,t,u`/39; Monster 12 generators/80; Baby Monster `t1…t11`/69; Co1 eight generators/45 (Praeger–Soicher `GPLTable.Co1.1`, "nine words following the Coxeter paths", `Conway/One.lean:182`). All twelve rows agree.

**Seeded sample.**
- "F0 is implemented", "F1 is implemented for every designated carrier": false at the pin, true at Tau Ceti `d7dad378` (R03); the statements there match the README's hypotheses except the `k ≠ 0` wording (R11).
- P2-L: AlgebraicCodingTheory Layer 5 (Completed) supplies the extended Golay codes and states that identification with Mathieu groups is not a target (its README lines 30, 319); Rank24 Layer 6 supplies the lattice as cited except the coordinate type (R07).
- P2-G: hohnseysen §2.1 (line 158): `Gx0` of shape `2^{1+24}_+.Co1`, `N0` of shape `2^{2+11+22}.(M24×S3)`, `Nx0 = N0 ∩ Gx0` of shape `2^{1+24+11}.M24` and index 3, `Qx0` extraspecial with central involution, `Qx0/⟨z⟩ → Λ/2Λ` (lines 159–168); Lemma 2.1 (line 244) with the `χ1⊕χ1⊕χ23⊕χ275` restriction of `300x` to `Co2` (lines 259–263). All as cited.
- P2-M: Theorem 2.9 (line 390) `C_M(x_{-1}) = Gx0`; `β⁺ = x_{ij}`, `β⁻ = β⁺ x_{-1}`, axes `v±` (lines 392–395); Theorem 5.1 (line 1006) `|M| = |X⁺|·|X⁻|·|S|` with `S` of shape `2^{1+23}.Co2` (lines 1012–1017); Corollary 5.2 `|B| = |X⁻|·|S|/2` (lines 1019–1024); Lemmas 5.3–5.5 and Theorem 5.6 (lines 1029–1060) with the normal-subgroup list `⟨x_{-1}⟩, Qx0, Gx0`; Tables 2 and 4 (lines 767, 944); Appendix D (line 1472); Theorem 5.8 and Appendix E with the odd-index reduction (lines 1094–1097, 1530–1534). All as cited.
- P2-D: bmw-baby §3.1 (lines 63–66): the `Y433` presentation proved by Ivanov subject to the Monster having no proper double cover, which Griess proved; §2 (lines 31–34) invokes the `Y555` presentation of the BiMonster. Relators `(t5t4t3t5t6t7t5t9t10)^10`, `(t5t4t3t6t7t8t9)^9`, `(t5t4t3t6t9t10t11)^9` and "`2 × 2.B`" (lines 70–72) match README lines 653–656 and the pinned relator names.
- P2-R: Ivanov 1994 and 1999 are paywalled (uncertified; cited by locator only); the Monster relator names and the 80/69 counts agree with the pin; bmw-monster §2 "Basic hypotheses" (line 59: two involution classes with centralizers `2.B` and `2^{1+24}.Co1`, a 196883-dimensional irreducible) and §4.9 Proposition 1 "exactly 194 conjugacy classes" (lines 409–411) as cited for P2M.
- T0: conrad-tits Theorem 2.4 (lines 75–80) as cited, with the `U` solvable hypothesis (R11).
- Kim–Michler (OCR text): Lemma 6.2 (line 1279) and the degree-306936 faithful permutation representation (lines 15, 136, 1297) as cited.
- Axiom sources: `FAM_sporadic_converse.lean` states `Finite s.Group ∧ IsSimpleGroup s.Group` for every `TauCeti.SporadicName` (axiom-sporadic lines 18–22); `FAM_M_simplicity.lean` proves `IsSimpleGroup MonsterY443Derived` (axiom-msimp line 17); `Blueprint/Catalog.lean` defines `StatedLieAdmissible`-based models (axiom-catalog lines 37–90). The Tau Ceti revision `6e0c6aca` the README names is a real commit (2026-10-02); the Feit–Thompson claim could not be checked from the three files fetched.

**Adversarial table.**

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `conjugacyCoverage_of_mass` | `reps = []`; `reps` with a repeated element; `G = S₃` with reps `1, (12), (123)` | empty sum `0 ≠ Nat.card G ≥ 1`; duplicates excluded by `Pairwise ¬IsConj` since `IsConj x x`; `S₃`: indices `1 + 3 + 2 = 6 = |S₃|`, classes disjoint and of those sizes | true; `index = 0` junk value impossible for finite `G` | none |
| `classDataTransport` fields | `e = id`; `e` swapping two non-conjugate reps | `IsConj (e x) (e y) ↔ IsConj x y` for a `MulEquiv` | true | sorried proofs (R01) |
| `monster_card_irreducibleCharacters` | hypothesis `[Invertible (Nat.card M : ℂ)]` | `Nat.card M ≠ 0` from `Finite` and `Nonempty`; `ℂ` has `CharZero` | hypothesis derivable | R02 |
| F0 criterion | `r = 0`; `k = 0`; `m = 1`; `K = ℤ` | `r = 0`: hypothesis bounds all of `G`, finite; `k = 0`: `Φ^[0] = id`, conclusion false for infinite `G`, so `k ≠ 0` needed; `m = 1`: `X − X = 0` has every root, needs `1 < m`; integral domain needed for finitely many roots | matches `MatrixCoordinates.lean` 65–86 | R11 wording |
| F1 iterate formulas | Suzuki/Ree/Tits `F² = Frob_q`; ordinary `t = 1`; `²Aₙ, ²Dₙ, ²E₆` `t = 2`; `³D₄` `t = 3` | `k = 1` or `k = t ≠ 0` in each case | consistent with LieTypeFinite 119–125 at `d7dad378`; absent at pin | R03 |
| T2 validity ranges | `A₁(2), A₁(3), ²A₂(2), B₂(2), G₂(2), ²G₂(3), ²B₂(2)` | all excluded by `InStandardRange` (`Index.lean:128–137`); `G₂(3)`, `F₄(2)`, `Bₙ(2)` for `n ≥ 3` retained | agrees with README 221–228 | none |
| T3 Tits case | `²F₄(2)` | root-generated subgroup is the full group; derived subgroup index 2 | README's bridge warning correct | none |
| J3 bound | `19 × 2,643,840` | `50,232,960 = |J3|` | consistent | none |
| J4 bound | `2^13·3·443,520·2`; `H × index` | `21,799,895,040`; `× 3,980,549,947 = 86,775,571,046,077,562,880 = |J4|` | consistent | none |
| Ru bound | `35,942,400 × 4,060`; suborbits | `145,926,144,000 = |Ru|`; `1+1755+2304 = 4060` | consistent | none |
| O'Nan bound | `3,753,792 × 122,760`; suborbits | `460,815,505,920 = |ON|`; `1+5586+6384+52136+58653 = 122,760` | consistent | none |
| Fi23 bound | `2·|Fi22| × 31,671`; suborbits | `129,123,503,308,800 × 31,671 = 4,089,470,473,293,004,800 = |Fi23|`; `1+3510+28160 = 31,671` | consistent | none |
| Fi24′ bound | `2·|Fi23| × 306,936` | `= 2 × 1,255,205,709,190,661,721,292,800 = 2|Fi24′|` | consistent | none |
| HN bound | `4·|HS| × 1,539,000` | `177,408,000 × 1,539,000 = 273,030,912,000,000 = |HN|` | consistent | none |
| Ly bound | `1,500,000 × 3,906`; `× 8,835,156` | `5,859,000,000 = |G₂(5)|`; `51,765,179,004,000,000 = |Ly|` | consistent | none |
| Th bound | `12,096·17,472·3`; `512·|A₉|`; `1512·61,440`; `× 143,127,000` | `634,023,936 = 3·|³D₄(2)|`; `92,897,280` twice; `90,745,943,887,872,000 = |Th|` | consistent | none |
| Co1 | `|Co2| × 98,280`; `2|Co1|` | `4,157,776,806,543,360,000 = |Co1|`; `8,315,553,613,086,720,000 = |Co0|` | consistent | none |
| Leech families | `C(24,2)·4`; `759·2⁷`; `24·2¹²`; antipodal pairs | `1104 + 97152 + 98304 = 196560`; `98280` | consistent | none |
| Monster counting | `|S| = 2^24·|Co2|`; `|X⁺| = |M|/(2|B|)`; `|X⁻| = 2|B|/|S|` | `|X⁺| = 97,239,461,142,009,186,000`, `|X⁻| = 11,707,448,673,375`, both integral; kernel `C_Q(β⁺)` of index 2 in `Q` of order `2^25` | consistent with hohnseysen 1012–1017 | none |
| B_alg prime list | `41 ∣ |B|?` | `|B| mod 41 = 4` | false | R08 |
| Prime supports of the nine P2-N candidates and of Co1 | each list against the standard factorizations | all match | consistent | none |
| Lemma 2.1 constituents | `1 + 1 + 23 + 275` | `300` | consistent | none |
| Rank24 coordinates | `Ω` | `Fin 24` on main vs `Fin 12 ⊕ Fin 12` here | drift | R07 |

**Repair test.** The nine-statement scratch file of R02 elaborates at the pin: nine `sorry` warnings, exit 0.

**Binders.** The worker's elaborated signatures (37 declarations) were compared with the README statements; none lost a section binder. `conjugacyCoverage_of_mass` and `classDataOfMass` carry `[Finite G]` explicitly.

**Cross-roadmap citations resolved on main (929496d):** CFSGStatement L0 "Explicit carriers" and "The carrier plan" (lines 340–400), L1–L3, L5 (line 652), S0 (676), S1 (721), L4 as a milestone row (line 219); ChevalleyGroups C2–C5 (lines 241–627: commutator formula, Bruhat decomposition and Tits system, centre, Steinberg's presentation in C3; generation by root subgroups over a field in C4; Frobenius, graph automorphisms and exceptional isogenies in C5); ReductiveGroups (Borel, root-datum, Bruhat theory); Rank24LatticeConstructions Layer 6 (line 312); SporadicOrders O0–O2 (Layers 0–2); AlgebraicCodingTheory Layer 5 (Completed, line 240); RepresentationTheory/CharacterTheory for the class-count theorem. The README's Mathlib BN-pair pull request link is a Mathlib citation, allowed.

## Not verifiable

- Ivanov, *Presenting the Baby Monster* (1994) and *Y-groups via transitive extension* (1999): the DOI landing pages are paywalled (Elsevier); recorded as uncertified, cited by locator only.
- Griess, *The Schur multipliers of the known finite simple groups, III* (1985): the AMS proceedings page is on a host in no licence class and the text could not be read; listed in `needs-references.toml`.
- Steinberg, *Lectures on Chevalley Groups*, Chapter 11, Theorem 33 (README line 202): no legal copy located (the UCLA author page returns 404); the AMS reprint is behind a paywall.
- The claim that Axiom's Monster simplicity proof uses Feit–Thompson through `Monster/Existence/StdOdd/Seven`: only the three milestone files were fetched; that file was not read.
- ATLAS representation pages, GPL `gpl.g`, Soicher's `tcenum` input, Bray's `HNpb.m`, Havas–Sims and Havas–Soicher–Wilson texts: not fetched this round; the P2-N rows were checked against the pinned presentations and the published orders instead.

## Source issues

- none
