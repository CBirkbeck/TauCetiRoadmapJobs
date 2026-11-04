# Review of CFSGBasicProperties (pull request #1779 at 3cec41e)

**Verdict:** accepted

This is a full re-review of the repaired head. The folder changed by 497 lines since the head the previous review read, so every passage was reviewed again, changed or not. The pinned libraries are Tau Ceti `358314d4` and the Mathlib of `lake-manifest.json` (`f6090c70`); every "at the pin" verdict below used those. The pull request touches nothing outside `TauCetiRoadmap/CFSGBasicProperties/` (the diff against `origin/main` outside the folder is empty).

## Repairs of the previous review's findings

- **R01 (sorried data), repaired.** `Suggested.lean` now has one definition, `sporadicOrder`, with a real body (lines 55–81), and eleven sorried theorems; the gate reports `sorry-data=0`.
- **R02 (absent headlines), repaired.** The file states `CFSGIndex_finite`, `CFSGIndex_isSimpleGroup`, `validLieTypeIndex_finite`, `validLieTypeIndex_isSimpleGroup`, `sporadicName_finite`, `sporadicName_isSimpleGroup`, `sporadicName_card`, and the four Monster statements; the `Invertible` hypothesis is gone from `monster_card_irreducibleCharacters`; the docstring has the form "<title>: target signatures" and names the three not-statable headlines with the missing carriers (lines 7–22).
- **R03 (E0/F0/F1/T0 "implemented"), repaired.** README lines 78–85: "E0, F0 and F1 below are this roadmap's targets … Tau Ceti revision `d7dad378` implements each of them under the names recorded"; F0 (lines 122–143), F1 (145–159), T0 (190–199) are stated as targets with the hypotheses of the later revision, and the twelve names are attributed to `d7dad378`/`a9d0ba7b`, which I confirmed (see Verified sound). The "(native)" row labels and "is implemented" are gone from the milestone table.
- **R04 (Hex checker), repaired.** Lines 59–67 now say SporadicOrders supplies "theorems, not a checker or a certificate format: the stabilizer-chain order formula (its §0.1), the orbits … (§0.2) and the membership criterion … (§0.3)", and P0 (lines 353–359) proves the certificate soundness from those three theorems; no "Hex" remains.
- **R05 (`import Mathlib`), repaired.** Line 2; the gate reports `imports=0`, `no-import-mathlib=0`.
- **R06 (commit-pinned links, fork link, "catalogue"), repaired.** `[rank24]` and `[sporadic-orders]` are relative links (lines 905–906), ChevalleyGroups is `../ChevalleyGroups/README.md` (line 49), CertifiedPermutationComputation is cited by name and section (line 68); "the ATLAS representation list" replaces "catalogue" (line 860); gate `blob=0`, `residue=0`.
- **R07 (`Fin 12 ⊕ Fin 12`), repaired.** Line 502: "on `Ω = Fin 24`".
- **R08 (41 in the Baby Monster Sylow list), repaired.** Lines 613–617 list `2,3,5,7,11,13,17,19,23,31,47` and note the spurious factor in Höhn–Seysen Corollary 5.2 (confirmed below).
- **R09 (`suzukiGroup` attribution), repaired.** Line 48: "Tau Ceti's `suzukiGroup`".
- **R10 (padding), repaired.** No proved `example` or API lemma remains in the file.
- **R11 (`U` solvable; iterate wording), repaired.** Line 205: "If `U` is solvable, the Coxeter graph is connected and nonempty, `Z ∩ U = 1`, and `H⁺` is perfect"; lines 132–135: "No characteristic hypothesis and no positive power of `F` are required, but the Frobenius iterate number `k` must be nonzero".
- **R12 (Leech count ownership), repaired.** Lines 510–513 cite the theta identity `Θ_Λ = E₄³ − 720Δ` to ThetaSeries Layer 8 item 8D (which exists on main, ThetaSeries README line 966) and keep the explicit families here.

## R01 (P3) — F0 narrows the index type below what the criterion needs

Location: `README.md` lines 122–124 ("`n` a finite type with decidable equality and `ρ : G → Matrix n n K` injective").

Claim: the base criterion and its iterate form need only `[Finite n]`; decidable equality (and `Fintype`) enter only for the `Subgroup (GL n K)` and faithful-representation forms. The README states all three forms under the stronger hypothesis.

Witness: Tau Ceti `d7dad378`, `GroupTheory/FixedSubgroup/MatrixCoordinates.lean` line 58 (`variable … {n : Type*} [Finite n]`) for the two `TauCeti.` forms, lines 103 and 122 (`[Fintype n] [DecidableEq n]`) for the `Subgroup` and `Representation` forms.

Repair: "`n` a finite type and `ρ : G → Matrix n n K` injective … ; state it also, for `n` a `Fintype` with decidable equality, for a subgroup of `GL n K` … and for a faithful representation …".

## R02 (P3) — A backticked name of this roadmap's own that `Suggested.lean` does not declare

Location: `README.md` line 241 ("First construct a named `fixedWeylRepresentative` for every Weyl element invariant under the induced Steinberg action").

Claim: a backticked camel-case name of this roadmap's own is a claim that `Suggested.lean` declares it; the file declares twelve names and this is not among them, and no pinned library has it.

Witness: `grep fixedWeylRepresentative` over `Suggested.lean`, the pinned Tau Ceti and Mathlib returns nothing; the roadmap grep finds it only in this README (and its copy on main).

Repair: write it as prose, "a fixed Weyl representative for every invariant Weyl element", or declare it (it is a T1 construction, not a headline, so prose is the right choice).

## R03 (P3) — CharacterTheory is cited without its roadmap path or section

Location: `README.md` line 779 ("does not duplicate CharacterTheory's generic irreducible/class-count theorem").

Claim: there is no roadmap folder `CharacterTheory`; the roadmap is `RepresentationTheory/CharacterTheory` on main, and the class-count theorem is its §2.3 "The center splits, and the count" (README line 377 there). Cross-roadmap citations name the roadmap and its section.

Witness: `ls TauCetiRoadmap` on main has `CharacteristicClasses` and `RepresentationTheory/CharacterTheory`, no `CharacterTheory`.

Repair: "RepresentationTheory/CharacterTheory §2.3".

## R04 (P3) — The Conrad handout cited for Theorem 2.4 is not in References

Location: `README.md` lines 212–214 (T0 cites `titssystem.pdf`, Theorem 2.4) and 833–835 (References list only `roottits.pdf`).

Claim: the References section should carry the text the criterion is taken from; the two handouts are different documents.

Witness: the fetched `titssystem.pdf` (conrad-tits line 75) carries Theorem 2.4; the References entry links `roottits.pdf`.

Repair: add the `titssystem.pdf` handout to the Conrad reference line ("… and his handout on Tits systems, Theorem 2.4").

## Verified sound

**Gate, build, dependency check.** The worker's gate at this head passes every check (`sorry-data=0 … build=0 OK`). `lake env lean TauCetiRoadmap/CFSGBasicProperties/Suggested.lean` at the pin: eleven `declaration uses sorry` warnings (lines 32, 36, 43, 48, 85, 89, 93, 101, 111, 116, 122), no error, exit 0. Dependency check: `depcheck: 205 roadmaps, 1651 edges, 0 problem(s)`; no UPWARD or CYCLE line. Every supplier is on main (CFSGStatement, ChevalleyGroups, ReductiveGroups, Rank24LatticeConstructions, SporadicOrders, ThetaSeries, RepresentationTheory/CharacterTheory, Completed/AlgebraicCodingTheory) or is CertifiedPermutationComputation, open pull request #717 by another author adding a new folder, whose §2.1 "Encoding and denotation" and §2.2 "Orbit and primitivity checking" exist at its head (its README lines 143, 177). The sections cited on main exist: SporadicOrders §§0.1–0.3 (lines 161, 195, 221), Layers 1–2 (280, 416); Rank24 Layer 6 heading (line 312, anchor matches); AlgebraicCodingTheory Layer 5 (line 240) with its statement that the Mathieu identification is not a target (lines 30, 319); ChevalleyGroups C2–C5 (lines 241, 311, 377, 455); CFSGStatement L0–L3, L5, S0, S1, A0 (lines 298–811); ThetaSeries 8D (line 966).

**Pinned declarations opened (Tau Ceti `358314d4`).** `CFSGIndex` with constructors `cyclic (p) (p.Prime)`, `alternating (degree) (5 ≤ degree)`, `lie`, `sporadic` (`CFSG/Index.lean` 1464–1467); `CFSGIndex.Group` (`Classification.lean` 41: `Multiplicative (ZMod p)`, `alternatingGroup (Fin degree)`, `index.Group`, `name.Group`); `ValidLieTypeIndex.FixedPoints` and `.Group` (`Assembly/LieType.lean` 129, 133); `steinberg_steinberg_of_usesHalfFrobenius` (116); `SporadicName` with exactly the 26 constructors of `sporadicOrder` (`Index.lean` 1444) and `SporadicName.Group` (`Sporadic/Presentation.lean` 131); `Monster.spiderRelator = (a b₁ c₁ a b₂ c₂ a b₃ c₃)^10`, `centralInvolutionRelator = (a b₃ c₃ d₃ b₁ c₁ b₂)^9` (`Monster.lean` 152, 164); `BabyMonster.spiderRelator = (t₅t₄t₃t₅t₆t₇t₅t₉t₁₀)^10`, `extraRelatorOne = (t₅t₄t₃t₆t₇t₈t₉)^9`, `extraRelatorTwo = (t₅t₄t₃t₆t₉t₁₀t₁₁)^9` (`BabyMonster.lean` 238, 249, 259), all as README lines 697–707 state; `irreducibleCharacters` and `card_irreducibleCharacters` (`CharacterTable/Table.lean`); `fixedSubgroupCongr`, `FixedPointCandidate.congr`, `DerivedCentralQuotient.congr`, `one_lt_fieldOrder`, `card_fixedField`, `twistOrder`, `twistOrder_pos`, `bruhatCell_injective`, `disjoint_bruhatCell_iff`, `existsUnique_mem_bruhatCell`, `IsSchreierIndexTwoSource.mulEquivKerParityHom`, `GroupPresentation.mulEquivCommutator`, `ClassData`, `numClasses_eq_card_conjClasses`, `MulEquiv.conjClassesEquiv`, `mulEquivPresentedGroupCoxeterAppend`, `Fi24AutomorphismGroup`, `fi24PrimeGroupMulEquivCommutator`, `co1Presentation`, `j3Presentation`, `j4Presentation`, `ruPresentation`, `onanPresentation`, `fi23Presentation`, `fi24PrimePresentation`, `hnPresentation`, `Lyons.presentation`, `Thompson.presentation`, `suzukiGroup` (Tau Ceti, not Mathlib): all present. Mathlib: `MulAction.IwasawaStructure.isSimpleGroup`, `isSimpleGroup_of_prime_card`, `alternatingGroup.isSimpleGroup`, `Representation.IsIrreducible`: present. Absent at the pin, as the README now says: any `Finite` or `IsSimpleGroup` instance on `CFSGIndex.Group`, `ValidLieTypeIndex.Group` or `SporadicName.Group` (grep of the pinned tree; `#synth Finite TauCeti.SporadicName.M.Group` fails), and the twelve `d7dad378`/`a9d0ba7b` names.

**The later-revision claims (seeded F0, F1, T0).** At Tau Ceti `d7dad378` (a real commit in the package's git history): `CFSG/BasicProperties/Elementary.lean` lines 42–54 state `natCard_cyclic`, `finite_cyclic`, `isSimpleGroup_cyclic`, `isSimpleGroup_alternating`; `GroupTheory/FixedSubgroup/MatrixCoordinates.lean` lines 65, 84, 108, 128 state the four F0 forms with exactly the README's hypotheses (injective `ρ` into `Matrix n n K`, `K` an integral domain, `r` arbitrary, `1 < m`, and `k ≠ 0` in the two `eq_iterate` forms), and `FixedPointCandidate.lean` line 67 the instance `finiteFixedPointCandidate`; `CFSG/BasicProperties/LieTypeFinite.lean` lines 119 and 129 state `finite_fixedPoints` and `finite`; `Assembly/LieType.lean` line 163 states `iterate_steinberg_twistOrder_of_not_usesHalfFrobenius` as `steinberg^[t] = frobenius^[t]` with `t = GraphTwistedIndex.twistOrder`, as README lines 149–151 say; `BasicProperties/TypeA.lean` 61 and `TypeC.lean` 68 define `specialLinearEquivFixedPoints` and `symplecticEquivFixedPoints`. At `a9d0ba7b`, `TitsSystem/Parabolic/Classification.lean` line 146 defines `standardParabolicOrderIso`.

**Seeded sample, sources (cached texts, line numbers of the extraction).**
- P2-L: AlgebraicCodingTheory Layer 5 and its Mathieu exclusion as above; Rank24 Layer 6 on `Fin 24`; ThetaSeries 8D `Θ_Λ = E₄³ − 720Δ` and `r_Λ(4) = 196560` (lines 966, 1007).
- P2-G: hohnseysen lines 160–168 (`Gx0` of type `2^{1+24}_+.Co1`, `N0` of structure `2^{2+11+22}.(M24×S3)`, `Nx0 = N0 ∩ Gx0` of structure `2^{1+24+11}.M24` and index 3, `Qx0 → Λ/2Λ` with kernel `{1, x₋₁}`); Lemma 2.1 (line 244) and the `χ1⊕χ1⊕χ23⊕χ275` decomposition of `300x` restricted to `Co2` (lines 262–263). As cited.
- P2-M: Theorem 2.9 (line 390: `C_M(x₋₁) = Gx0`); `β⁺ = x_{ij}`, `β⁻ = β⁺x₋₁`, axes `v±` (392–395); Theorem 5.1 (1006–1018: `|M| = |X⁺|·|X⁻|·|S|`, `S ≤ Gx0` of structure `2^{1+23}.Co2`); Corollary 5.2 (1022–1024, `|B| = |X⁻|·|S|/2`); Lemmas 5.3–5.5 and Theorem 5.6 (1029–1060); Theorem 5.8 and Appendix E with the odd-index reduction (1094–1100, 1530–1539). As cited.
- P2-D: bmw-baby lines 31–34 (`Y555` presentation of the BiMonster implies `Y433` for `B`, given the Schur multiplier result of Griess) and 63–74 (§3.1: proved by Ivanov subject to the Monster having no proper double cover, proved by Griess; spider relation `(t5t4t3t5t6t7t5t9t10)^10` gives `2 × 2.B`; the two extra relations give `B`). As cited; relators agree with the pin.
- P2-R: bmw-monster §2 "Basic hypotheses" (lines 59–67: two involution classes with centralizers `2.B` and `2^{1+24}.Co1`, a faithful character of degree 196883) and §4.9 Proposition 1 (lines 409–410: exactly 194 conjugacy classes). Ivanov 1994 and 1999 remain paywalled (uncertified, by locator).
- T0: conrad-tits lines 75–80: split BN-pair, `U` solvable, `Z = ⋂ hBh⁻¹`, `H⁺` the normal closure of `U`, `W ≠ 1` and connected Coxeter graph, `H⁺` perfect and `Z ∩ U = 1` give `Z ∩ H⁺ = Z(H⁺)` and `H⁺/(Z ∩ H⁺)` simple or trivial. The README's criterion (lines 203–206) now matches it exactly.

**Headline check.** Headlines from the README: the two endpoint theorems (A0), `Finite d.Group` (F1), `IsSimpleGroup d.Group` (T2/T3), `Finite`, `IsSimpleGroup` and `Nat.card = ATLAS order` for every sporadic name (P1/P2), and the four P2M statements. All are stated. The T0 criterion, T1 fixed-point Bruhat theory and the structural centralizer identifications are named in the docstring as not statable, with the missing carriers; I agree (no split structure on `TauCeti.TitsSystem`, no root groups on `d.FixedPoints`, no `2·B` or `2^{1+24}_+.Co1` at the pin). E0's statements are statable but are one-step consequences of Mathlib and are rightly left to the README.

**One-tactic probe** (scratch copy, elaborated at the pin): `infer_instance` and `simp` fail on all six `Finite`/`IsSimpleGroup` headlines; `simp` and `rfl` fail on `sporadicName_card`; `simp`, `rfl`, `decide` fail on `monster_card_conjClasses`; `simp` fails on `monster_exists_irreducible_196883` and `monster_two_involution_classes`; `simp` and `rfl` fail on `monster_card_irreducibleCharacters`. Nothing is padding.

**Binders.** The worker's elaborated signatures (12 declarations) compared with the README statements: each theorem quantifies over exactly the index, the valid Lie index or the sporadic name its README statement does; `#check @TauCeti.card_irreducibleCharacters` confirms its `[Finite G]`, `[IsAlgClosed k]`, `[Invertible (Nat.card G : k)]` are section variables that the Monster statement discharges over `ℂ`.

**Adversarial table.**

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `CFSGIndex_finite`, `CFSGIndex_isSimpleGroup` | `.cyclic 2`, `.cyclic 3`; `.alternating 5`; `.lie` for `A₁(4)`, `tits`; `.sporadic .M11` | `Multiplicative (ZMod 2)` has 2 elements, prime order, simple; `A₅` of order 60 simple; constructor hypotheses are `p.Prime`, `5 ≤ degree` at the pin; `A₁(4) ≅ A₅`; Tits group order 17,971,200 = `|²F₄(2)|/2`; `|M11| = 7920` | true on each; no `Finite` instance at the pin for the Lie and sporadic branches | none |
| `validLieTypeIndex_finite` | `A₁(4)`, `²B₂(8)`, `tits`, `³D₄(2)` | iterate numbers `t = 1, 2 (half-Frobenius square), 2, 3`, all nonzero; field orders `4, 8, 2, 2 > 1` | F0 applies on each | none |
| `validLieTypeIndex_isSimpleGroup` | excluded `A₁(2), A₁(3), ²A₂(2), B₂(2), G₂(2), ²B₂(2), ²G₂(3)`; retained `G₂(3), F₄(2), Bₙ(2)` (`n ≥ 3`), `tits` | `InStandardRange` excludes exactly the solvable/non-simple small cases; `²F₄(2)'` is the derived central quotient of the full fixed points (index 2) | true on every valid index | none |
| `sporadicOrder` | all 26 entries | each recomputed from the standard prime factorizations (`|M| = 2^46·3^20·5^9·7^6·11^2·13^3·17·19·23·29·31·41·47·59·71`, …): 0 mismatches | correct | none |
| `sporadicName_card` | `.M11`, `.M` | `Nat.card s.Group` is of the exact presented group; `rfl`/`simp` fail, so the order is not definitional | sound statement | none |
| `monster_two_involution_classes` | centralizer orders | `2·|B| = 8,309,562,962,452,852,382,355,161,088,000,000`; `2^25·|Co1| = 139,511,839,126,336,328,171,520,000`; both divide `|M|` with quotients 97,239,461,142,009,186,000 (2A count) and 5,791,748,068,511,982,636,944,259,375 (2B count) | consistent with bmw-monster 63–65, hohnseysen 1094–1096 | none |
| `monster_card_conjClasses`, `monster_card_irreducibleCharacters` | 194 | bmw-monster Proposition 1 (line 410); class count = irreducible count over `ℂ` by `card_irreducibleCharacters` with `Nat.card M ≠ 0` invertible in `ℂ` (`CharZero`) | consistent | none |
| `monster_exists_irreducible_196883` | degree | `196883 = 47·59·71` divides `|M|`; `196884 = 1 + 196883` (fixed line plus complement) | consistent with bmw-monster line 12 | none |
| F0 criterion | `r = 0`; `k = 0`; `m = 1`; `n` empty | `r = 0`: every element bounded, finite; `k = 0`: `F^[r] = id` holds for `F = id` on `ℤ`, conclusion false, so `k ≠ 0` needed; `m = 1`: `X − X = 0`, every element a root, so `1 < m` needed; `n` empty: `ρ` injective forces `G` trivial, finite | matches `MatrixCoordinates.lean` 65–135 at `d7dad378` | R01 (index-type generality) |
| T0 criterion | `H = SL₂(𝔽₂)` (Coxeter graph a point, `U` of order 2, `H⁺ = H` not perfect); `H = SL₂(𝔽₅)` | `SL₂(𝔽₂) ≅ S₃` fails perfectness, criterion silent, correct since `S₃` is not simple; `SL₂(𝔽₅)`: `Z ∩ H⁺ = {±1}`, quotient `A₅` simple | hypotheses necessary and matching conrad-tits 75–80 | none |
| P2-L Leech families | `C(24,2)·4`, `759·2⁷`, `24·2¹²`, antipodal pairs | `1104 + 97152 + 98304 = 196560`; `196560/2 = 98280 = |Co1|/|Co2|` (the Co1 point-stabilizer index) | consistent | none |
| P2-M counting | `|S| = 2^24·|Co2|`, `|X⁻| = 2|B|/|S|`, `|X⁺| = |M|/(2|B|)` | `|S| = 709,767,191,322,427,392,000`; `|X⁻| = 11,707,448,673,375` (integral); `|X⁺| = 97,239,461,142,009,186,000`; `|X⁺|·|X⁻|·|S| = |M|` | consistent with hohnseysen 1012–1017 | none |
| Baby Monster prime list | `41 ∣ |B|?` | `|B| mod 41 = 4`; `|M| mod 41 = 0` | README's remark on Corollary 5.2 correct | none (source issue below) |
| P2-N bounds | J3, ON, Fi23, Fi24′, HN, Ru, Ly, Th | `19·2,643,840 = 50,232,960`; `3,753,792·122,760 = 460,815,505,920`; `2|Fi22|·31,671 = |Fi23|`; `2|Fi23|·306,936 = 2|Fi24′|`; `4|HS|·1,539,000 = |HN|`; `35,942,400·4,060 = |Ru|`; `1,500,000·3,906 = |G₂(5)|`, `·8,835,156 = |Ly|`; `12,096·17,472·3 = 634,023,936`, `·143,127,000 = |Th|` | all consistent | none |
| Monster/Baby Monster relators | the five relators | `Monster.lean` 152–165 and `BabyMonster.lean` 238–259 agree letter for letter with README 697–707 and bmw-baby 70–72 | consistent | none |

**Ownership.** The Monster's order, simplicity and conjugacy structure, the sporadic finiteness/simplicity theorems and the Leech minimal-vector families are claimed by no roadmap on main other than this one (CFSGStatement mentions the Monster only for its presentation) and by no open pull request adding a new folder; the Leech count alone is also in LatticePackingsAndPerfectForms (#1723) and OrthogonalTamagawaAndLatticeMass (#1222), which the README now acknowledges through the ThetaSeries citation. Open pull request #698 (draft, another author) also amends this folder on main; that is a coordination matter for the operator, not a defect of this head.

**Process.** The sources service created the package's `sources.toml` (keys `hohnseysen`, `bmw-monster`, `bmw-baby`, `conrad-tits`) while fetching; no other manifest edit was made. The scratch `needs-references.toml` was removed after Conrad's handout was fetched as an author page.

## Not verifiable

- Ivanov, *Presenting the Baby Monster* (1994) and *Y-groups via transitive extension* (1999): Elsevier DOIs, paywalled; cited by locator only (uncertified).
- Griess, *The Schur multipliers of the known finite simple groups, III* (1985): no legal text located; cited by locator only.
- Steinberg, *Lectures on Chevalley Groups*, Chapter 11, Theorem 33 (README line 236): no legal copy located.
- The claim that Axiom's Monster simplicity proof uses Feit–Thompson through `Monster/Existence/StdOdd/Seven` (README lines 808–811): not re-fetched this round; the README draws no dependency from it.
- ATLAS artifacts, GPL `gpl.g`, `tcenum`, `HNpb.m`, Havas–Sims and Havas–Soicher–Wilson texts: not fetched this round; the P2-N rows were checked arithmetically against the pinned presentations and the published orders.

## Source issues

- **Misprint** in hohnseysen at Corollary 5.2, printed page 24: the displayed factorization of `|B|` contains a factor 41 while the decimal value printed beside it is `|B|`, which 41 does not divide; it should omit the 41; affects nothing.
- **Misprint** in conrad-tits at Theorem 2.4, printed page 2: the theorem is stated for a split BN-pair "using `U ⊂ N`"; it should be `U ⊂ B` (the normal subgroup with `B = T ⋉ U` defined four lines earlier); affects nothing.
