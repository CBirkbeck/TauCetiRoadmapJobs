# Review of CFSGBasicProperties (pull request #2541 at f6f732d)

**Verdict:** needs changes

**Summary.** Changes are needed for two findings. Both concern work the pinned Tau Ceti already does. Layer 4 plans soundness theorems for coset-table, covering-bound and stabilizer-chain/sifting certificates that the library proves, and §8.2 plans the classification and count of the Leech minimal vectors, which the library also proves. In both places the README claims ownership of these results. Otherwise the mathematics checked is sound: every order, index product, relator count and Monster count I recomputed agrees, `Suggested.lean` elaborates with only `sorry` warnings, and the four earlier findings are repaired. There are seven small corrections and two format notes, none blocking. Three facts are left for the human reviewers.

## R01 (P2) — Layer 4 plans, as its own targets, certificate-soundness theorems that the pinned Tau Ceti already proves

An implementer of §§4.2 and 4.4 would rebuild library theorems. The Scope section also claims "the soundness of every permutation certificate it uses (§4.4)" (line 1297), which contradicts the pin.

At the pinned Tau Ceti:
- **Coset tables (§4.2).** `TauCeti.CosetTable.index_le`, `TauCeti.CosetTable.index_eq_of_check` and `TauCeti.CosetTable.finiteIndex` (`TauCeti/GroupTheory/Coset/Table.lean`, lines 264, 273, 282) prove the following: a coset table whose deduction certificate checks against the relators and the subgroup words bounds the subgroup index, or computes it exactly. This is the "closed and consistent coset table" instance of §4.2's coset-cover bullet (lines 383–388).
- **Normal-form and tower bounds (§4.2).** `Subgroup.natCard_closure_le_ncard_mul` (`TauCeti/Algebra/Group/Subgroup/Closure.lean`, line 152) is the covering form of these bounds: a finite set that the generators map into itself, up to a finite subgroup, bounds the order of the generated group.
- **Stabilizer chains and sifting (§4.4).** These declarations are the order and membership soundness that §4.4 opens by asking to "Prove" (line 415):
  - `Subgroup.natCard_eq_prod_length_of_sift`, `TauCeti.inv_mul_mem_closure_of_sift` and `Subgroup.stabilizerChain_eq_bot_of_sift` (`TauCeti/GroupTheory/GroupAction/Stabilizer/Sift.lean`, lines 208, 120, 222);
  - `Subgroup.prod_ncard_orbit_mul_card_stabilizerChain` and `Subgroup.mem_iff_exists_inv_mul_mem_stabilizerChain` (`Stabilizer/Chain.lean`, lines 119, 193).
- **Centralizers (§4.5).** `TauCeti.CosetTable.eq_centralizer_of_check` (`TauCeti/GroupTheory/Coset/Recognition.lean`, line 58) recognizes a full centralizer from a certified table, which §4.5's centralizer certificates can use.

BelyiMaps on main already consumes `TauCeti.CosetTable.index_le` (its README line 1744).

The smallest change:
- In §4.2, say that the coset-table and covering bounds are Tau Ceti's. Keep as targets only what is not there: the general coset cover with explicit word witnesses (which the double-coset cover of §7.3 needs), straight-line words and dictionaries.
- In §4.4, replace "Prove the soundness of the stabilizer-chain certificates …" by a citation of the sifting theorems, keeping the action lemmas as targets.
- Add the names to the *Needs:* lines and to "From Tau Ceti", and narrow the ownership sentence at line 1297.

## R02 (P2) — §8.2 plans, and claims to own, the classification and count of the Leech minimal vectors, which the pinned Tau Ceti proves

The target asks for finished work, and the text claims ownership of it twice: "owned here with the count they give" (line 882) and "the explicit minimal-vector families are §8.2 here" (line 1292).

`TauCeti/LinearAlgebra/IntegralLattice/Rank24/Leech/MinimalVectors.lean` at the pin uses the README's own raw coordinates (`x = a/2`, norm `∑ aᵢ²/8`):
- it defines exactly the three families: `TauCeti.leechPairVectors`, `TauCeti.leechOctadVectors` and `TauCeti.leechOddVectors` (lines 118–129);
- it proves the classification: `TauCeti.intCast_div_two_mem_leechLattice_carrier_and_sum_sq_eq_iff` (line 429) and `TauCeti.mem_vectorsOfNorm_four_leechLattice_iff` (line 455);
- it proves the counts 1104, 97152 and 98304 (lines 525, 607, 660) and pairwise disjointness (lines 668, 705, 714);
- it proves the total 196560: `TauCeti.ncard_vectorsOfNorm_four_leechLattice` (line 739) and `TauCeti.kissingNumber_leechLattice` (line 758).

The lattice is `TauCeti.leechLattice` (`Leech/Basic.lean`, line 236). It is Rank24LatticeConstructions Layer 6's Construction-B lattice with its odd shift, with its minimum, evenness and unimodularity proved. LatticePackingsAndPerfectForms on main already takes the kissing number from `TauCeti.kissingNumber_leechLattice` (its README lines 126–127). It also records that ThetaSeries 8D's `Λ` is a different model (the sphere-packing project's).

The smallest change:
- In §8.2, replace "Classify all minimal vectors … Prove their disjoint counts …" (lines 876–879) by a citation of these declarations, and cite `TauCeti.leechLattice` beside Rank24LatticeConstructions Layer 6.
- Keep as targets what the library lacks: the antipodal pairs, spanning, `Co0`, `Co1` and their actions.
- Adjust line 1292 and "From Tau Ceti".
- The sentence deriving the count from ThetaSeries 8D (lines 880–881) would either go or say that it concerns another model of `Λ`.

## C01 — `validLieTypeIndex_finite` is the pinned theorem verbatim, so as a target it asks for nothing

`Suggested.lean` line 34 states `Finite d.Group` for every valid index. That statement is exactly `TauCeti.ValidLieTypeIndex.finite` (`TauCeti/GroupTheory/SpecificGroups/CFSG/BasicProperties/LieTypeFinite.lean`, line 129). Once that module is imported, `exact TauCeti.ValidLieTypeIndex.finite d` closes it. The module docstring says so, but the declaration's own docstring presents it as work still to do.

Two possible repairs: mark it in its docstring as the pinned theorem, restated as the Lie-type case of the endpoint; or drop it and keep the README citation in §5.3.

## C02 — The SL₂(𝔽₃) Check of §1.1 does not test the simplicity statement as §1.1 states it

In `SL₂(𝔽₃)` the normal closure of `U` is the whole group, while `[G, G]` is `Q₈`. So the hypothesis `H⁺ = [G, G]` of the §1.1 bullet fails, and that bullet without perfectness is not refuted there. Only Conrad's form for `H⁺/(Z ∩ H⁺)` is refuted (lines 155–159).

A witness for the bullet as written is `GL₂(𝔽₃)`, with the same `B`, `N` and `U`:
- `H⁺ = [G, G] = SL₂(𝔽₃)`, which is not perfect;
- `Z` is the scalars `{±1}`, and `Z ∩ U = 1`;
- the derived central quotient is `SL₂(𝔽₃)/{±1} ≅ A₄`, which is nontrivial and not simple.

Two possible repairs: say in the Check that it tests the `H⁺/(Z ∩ H⁺)` form, or add the `GL₂(𝔽₃)` case.

## C03 — Scope and ownership cites "CFSGStatement's S0–S1", labels CFSGStatement no longer has

Line 1267 cites these labels, but CFSGStatement on main has no S0 or S1, as the pull-request description itself says. Write "Tau Ceti's `TauCeti.SporadicName.presentation`" instead.

## C04 — SporadicOrders on main cites ids of this roadmap that the head renames, with no old → new mapping

SporadicOrders' README cites:
- "Starting points and ownership" (line 47);
- "its P0, item 2" (lines 49 and 472);
- "its P0, item 3" (line 50).

At this head the first is "Scope and ownership" and the items are §§4.2 and 4.3. Conventions item 10 maps only the milestone labels. One sentence there would keep these citations followable: "P0 items 1–5 are §§4.1–4.5; *Starting points and ownership* is *Scope and ownership*."

## C05 — The pinned permutation models behind §6.2 are not named

Tau Ceti at the pin has `TauCeti.Sporadic.card_M11` (order 7920; `Sporadic/Mathieu/Eleven.lean`, line 401) and `TauCeti.Sporadic.exists_surjective_M11`, `…_M12`, `…_J2`, `…_HS` and `…_McL`. These implement part of SporadicOrders Layers 1–2. §6.2 (lines 577–583) and its `M₁₁` Example (lines 604–605) cite only SporadicOrders. Naming these declarations under "From Tau Ceti" would point an implementer to them.

## C06 — The module docstring calls the centralizer identification not statable, but its quotient forms are statable with pinned carriers

`Suggested.lean` lines 21–24 give "no such groups at the pins" as the reason. Yet the following can be written now with `TauCeti.SporadicName.B.Group` and `TauCeti.SporadicName.Co1.Group`:
- for the `2A` case: a surjection from `C(a)` onto `B.Group` with kernel `⟨a⟩`, with `C(a)` perfect;
- for the `2B` case: a normal subgroup of `C(b)` of order `2^25` with quotient isomorphic to `Co1.Group`.

Two possible repairs: state these forms, or reword the docstring to say that the structural identification is kept as a README target of §11.1.

## C07 — One sentence of the description is false about main

The description says of CharacterTheory that "No roadmap of that name is on main". `RepresentationTheory/CharacterTheory` is on main, and its Scope assigns the irreducible-character count to Tau Ceti's character-table library (its README line 77). Better text: "That roadmap is RepresentationTheory/CharacterTheory, which assigns the count to Tau Ceti; the README now names `TauCeti.card_irreducibleCharacters`." Once R01 and R02 are repaired, the description's list of targets already in Tau Ceti will also need the coset-table, sifting and Leech items.

## N01 — Carter is cited without a locator

§1.1 (line 121) and the References (line 1463) cite Carter, *Simple Groups of Lie Type*, without a chapter or page. Conrad's handout states the split definition (conrad-tits lines 71–72) and could carry the citation, or Carter's section could be added.

## N02 — The Mathlib pull-request link in the Layer 1 introduction carries process wording

The link at lines 113–114 says the layer is built "regardless of its timing". That wording, and the pull-request reference, would read better as a plain reference or be dropped.

## Questions for the author

- §2.3 cites Steinberg, *Lectures on Chevalley Groups*, Chapter 11, Theorem 33, for the fixed-point Bruhat decomposition. Is that the numbering of the 1967 notes or of the 2016 AMS edition? I could read neither legally, so the locator is unchecked.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 split Tits system, simplicity bullet | `SL₂(𝔽₅)`, `SL₂(𝔽₃)`, `GL₂(𝔽₃)`, `W = 1` | `SL₂(5)`: `|B|=20`, `|U|=5`, `|B∩N|=4`, `Z={±1}`; `GL₂(3)`: `H⁺=[G,G]=SL₂(3)` non-perfect, quotient `A₄`; `W=1` forces `U=1` | bullet true; matches conrad-tits 75–80 and `NormalClosure.lean` 178 | C02 |
| §2.1 Checks | `x₁₂(a)x₂₃(b)` commutator; `J=antidiag(1,−1,1)` versus plain | `1+abE₁₃`; `J E₂₁ J = −E₂₃` gives `x₂₃(u)`; plain gives `x₂₃(−u)`; both involutions | true | none |
| §2.3 Check | `SL₂(𝔽₃)` | `6 + 18 = 24`; wrong `|B|²` count gives `6+36=42 > 24` | true | none |
| §2.4 twisted root groups | `²A₂(3)` | orbit group order `27`; `|SU₃(3)| = 6048 = 2⁵·3³·7`; folding simple roots gives 9 | true | none |
| §3.1 hypotheses | `A₁(q)`, `q ≥ 4`; adjoint `B` carrier | `SL₂(q) = H⁺ = [H,H]`, centre `{±1} = Z_H ∩ [H,H]`; MulEquiv alternative covers `H⁺ ≠ [H,H]` | sound | none |
| §3.2 Checks against `InStandardRange` (Index.lean 128) | `A₁(2)`, `A₁(3)`, `A₁(7)`, `G₂(2)`, `B₂(2)` | candidates trivial, `V₄`, order 168; `A 1 q` needs `q≥4`, `G₂` needs `q≥3`, `B₂(2)` excluded | true | none |
| §4.1 Reidemeister–Schreier | `F(a)`, `L=⟨a²⟩`, `T={1,a}` | Schreier generators `1`, `a²`; basis `{a²}`, rank `1 = 1+2·0`; free-basis form absent at pin (Schreier.lean: predecessor transversals) | true | none |
| §4.2 bounds | `⟨a,b | a²,b³,(ab)²⟩`; `⟨a | ⟩` | six words closed via `ba=ab²`, `b²a=ab`, `aba=b²`, `ab²a=b`; `(1 2)(1 2 3)=(2 3)` | Checks true; coset-table and covering bounds pinned | R01 |
| §4.4 certificates | `A₅`, `A₄` | 5-cycle classes `(12345)`, `(13524)`; normal closure of `(12)(34)` in `A₄` is `V₄`; left-to-right gives `(1 3)` | Checks true; sift soundness pinned (Sift.lean 120, 208) | R01 |
| §4.5 class data | `S₃` | indices `1,3,2`, sum 6; `1,(12)` sums 4 | true; mass criterion ClassEquation.lean 72 | none |
| §5.1–5.2 | `²G₂(27)`, `²F₄(8)`, `²G₂(3)`, `²F₄(2)` | 10073444472; 264905352699586176614400; `1512 = |PΓL₂(8)|`; `35942400 = 2·17971200`; `17971200/1600 = 11232 = |L₃(3):2|` | true | none |
| §6.1 `sporadicOrder` | all 26 entries | each equals its standard prime factorization, 0 mismatches; `|B| mod 41 = 4`, `41 ∣ |M|` | correct | none |
| §6.2 models | M11, M12, J2, HS, McL | pinned `TauCeti.Sporadic.card_M11 = 7920`, `exists_surjective_*` for all five | supplier sound, names absent | C05 |
| §6.3–6.4 | Co2, Suz, Fi22, He; `10 + 4` | Tau Ceti records FiniteSimpleGroups constructions of each (Held.lean 123, Conway/Two.lean 144, TwentyTwo.lean 130, Suzuki.lean 89); 14 names | consistent | none |
| §7.1 relator counts | J3, J4, Ru, ON, Fi23, HN, Ly, Th, Co1 | pinned `expectedRelatorCount` 8, 12, 12, 29, 57, 19, 53, 39, 45 and generator counts equal the README's | agree | none |
| §§7.2–7.9 index products | J3, J4, Ru, ON, Fi23, HN, Ly | `19·2643840`; `2¹³·3·443520·2·3980549947`; `35942400·4060`; `3753792·122760`; `2|Fi22|·31671`; `4|HS|·1539000`; `5859000000·8835156` | each equals the order | none |
| §7.7 Fi24′ | Kim–Michler Lemma 6.2, Thm 6.3 | `l` commutes with `a…j`; `(ABCDEFH)⁹ = l·l⁶³ = 1`; `(DCBDEFDHI)¹⁰` has `l⁹⁰=1`; `2|Fi23|·306936 = 2|Fi24′|`; `12+66+2 = 80` | consistent | none |
| §7.10 Th | HSW Theorem 3.1 and proof | 39 relators `14+6+7+7+1+4`; `12096·17472·3 = 634023936 = 3|³D₄(2)|`; `·143127000 = |Th|` | consistent | none |
| §7.11 local data | nine prime sets; suborbits | prime sets equal prime divisors for all nine; `1+5586+6384+52136+58653 = 122760`; `1+3510+28160 = 31671`; `2⁹·|A₉|/1512 = 61440` | consistent | none |
| §8.2 Leech families | three families | `4·C(24,2)=1104`, `759·2⁷=97152`, `24·2¹²=98304`, sum 196560; `98280 = |Co1|/|Co2|` | true; already pinned | R02 |
| §§9.2, 9.4 Monster counting | `|S|`, `|X⁻|`, `|X⁺|` | 709767191322427392000; 11707448673375 (bmw-monster line 52); 97239461142009186000; product `= |M|`; `|X⁻||S|/2 = |B|` | consistent with hohnseysen 1006–1024 | none |
| §10.4 relator totals | Monster `Fin 12`, Baby `Fin 11` | `12+66+2 = 80`; `11+55+3 = 69`; relators match bmw-baby 67–72 | consistent | none |
| `validLieTypeIndex_finite` | statement against the pin | identical to `TauCeti.ValidLieTypeIndex.finite` (LieTypeFinite.lean 129); `infer_instance` fails under the file's imports | one library lemma | C01 |
| `validLieTypeIndex_isSimpleGroup` | 17 constructors against `Valid` | excluded `A₁(2)`, `A₁(3)`, `²A₂(2)`, `B₂(2)`, `G₂(2)`, `m=0` are non-simple or duplicate; Tits index gives `²F₄(2)′` | true on valid indices; probe fails | none |
| `sporadicName_finite`, `_isSimpleGroup`, `_card` | `.M11`, `.M` | no `Finite` or `IsSimpleGroup` instance at the pin (probe fails); values as row §6.1 | sound | none |
| `monster_two_involution_classes` | centralizer orders | `2|B| = 8309562962452852382355161088000000`; `2²⁵|Co1| = 139511839126336328171520000`; class sizes 97239461142009186000, 5791748068511982636944259375 | matches bmw-monster 62–65 | C06 |
| `monster_card_conjClasses` | 194 | bmw-monster Proposition 1, line 410 | true | none |
| `monster_exists_irreducible_196883` | degree | `196883 = 47·59·71`, divides `|M|`; bmw-monster line 12 | true | none |
| `monster_card_irreducibleCharacters` | hypotheses of `card_irreducibleCharacters` | needs `[Finite G]`, `[IsAlgClosed k]`, `Invertible (Nat.card G : k)`; ℂ has characteristic zero, finiteness from §10.5 | true | none |
| `CFSGIndex_finite`, `CFSGIndex_isSimpleGroup` | `cyclic 2`, `cyclic 7`, `alternating 5`, `lie`, `sporadic` | constructors require `p.Prime`, `5 ≤ degree`; cyclic and alternating pinned (Elementary.lean 42–54); `cases i <;> infer_instance` fails | true | none |

- Earlier findings, all repaired. R01: F0 is now consumed with "`n` finite" (line 1341). R02: "a *fixed Weyl representative*" is now prose (line 217). R03: the count is cited as Tau Ceti's `TauCeti.card_irreducibleCharacters` (§11.4). R04: References list `titssystem.pdf`, Theorem 2.4 (lines 1467–1469).
- Source locators checked against the text: 13 in 6 texts. These are conrad-tits Thm 2.4; Kim–Michler (arXiv:0906.1064v1, fetched this round) Lemma 6.2(a)–(c) and Thm 6.3; Havas–Soicher–Wilson (author page, fetched this round) Thm 3.1, §4, §5 and Statement 5; bmw-monster §2 Hypothesis 1, Table 1 and Proposition 1; hohnseysen Thm 5.1 and Cor 5.2; bmw-baby §3.1.
- Library declarations opened at the pins: 76 through `#check` and 2 through `#print`, elaborated at the pins (exit 0), plus about 60 read in source with their namespaces resolved (TitsSystem, Iwasawa, Presentation, ClassData, Stabilizer, Coset, Leech, Sporadic models).
- Cross-roadmap citations resolved on main, 19 in all:
  - CFSGStatement Layer 1, §§3.1, 4.1, 5.1;
  - ChevalleyGroups C2–C5;
  - ReductiveGroups Layer 7;
  - SporadicOrders §§0.1–0.3, 1.1–1.2, 2.2;
  - Rank24LatticeConstructions Layer 6;
  - Completed/AlgebraicCodingTheory Layer 5;
  - ThetaSeries 8D;
  - the root README anchor "Porting existing work".
- Automatic checks: all passed. Dependency check output: `depcheck: 200 roadmaps, 2196 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. Every supplier is on main.
- Elaboration of `Suggested.lean` at the pins: eleven `declaration uses sorry` warnings (lines 34, 39, 78, 82, 86, 94, 104, 109, 115, 123, 128), nothing else, exit 0. The 12 elaborated signatures match the README statements, and no section binders are involved.
- One-tactic probe: `infer_instance`, `simp` and `cases <;> infer_instance` fail on all eleven theorems under the file's imports. `validLieTypeIndex_finite` was decided by reading the pinned source.
- Arithmetic: 26 orders, 9 index products, 4 suborbit sums, the Monster and Baby Monster counts, and all 36 Checks were evaluated (36 bullets counted; every numbered section has a *Needs:* line).

Overlap check: read LocalFiniteGroupTheory, GlaubermanZStar and PotentialAutomorphyDworkMotivesPartII (open), and CFSGStatement, SporadicOrders and OddOrderTheorem (main). Nothing is shared:
- LocalFiniteGroupTheory, PotentialAutomorphyDworkMotivesPartII and CFSGStatement consume this roadmap or defer to it;
- SporadicOrders supplies its Layers 0–2 to this roadmap;
- GlaubermanZStar and OddOrderTheorem own no finiteness or simplicity of a listed group;
- the third list (closest by results) is empty;
- no other `Suggested.lean` declares these headlines.

The only second owner is the pinned Tau Ceti (R01, R02).

Source independence: 9 passages compared with 6 sources, none shared beyond standard phrases. Those are "two classes of involutions" and "the double cover of the Baby Monster", 4–6 words against bmw-monster lines 63–64, forced by the mathematics. The most-cited reference is the ATLAS (about 25 of about 120 citing lines), a database of representation files with no table of contents. The most-cited paper is hohnseysen (11 lines). Contents compared with hohnseysen: independent. Its §§2.1, 3–5 and Appendices D–E feed Layers 9 and 11 only, in a different order (simplicity in §9.3 before the Baby Monster in §9.4, against Cor 5.2 before Lemma 5.3). Eleven other layers have no counterpart there.

Research link: Layers 9–11 formalize the Monster order of Höhn–Seysen (2025) and the 194-class verification of Breuer–Magaard–Wilson (2024). Layer 10 rests on Ivanov's presentations (1994, 1999) and Griess's Schur multiplier result (1985). The endpoint is the concrete half of the classification that CFSGStatement pairs with the classification proposition. This line rests on the README's Summary and References, hohnseysen Theorem 5.1 and bmw-monster Proposition 1.

## Not verifiable

- Steinberg, *Lectures on Chevalley Groups*, Chapter 11, Theorem 33 (§2.3): no legal copy located.
- Carter, *Simple Groups of Lie Type* (§1.1): cited without a locator; no legal copy located.
- Ivanov, *Presenting the Baby Monster* (1994) and *Y-groups via transitive extension* (1999): paywalled; cited by locator only.
- Griess, *The Schur multipliers of the known finite simple groups, III* (1985): no legal text located.
- Bolt–Bray–Curtis, Bradley–Curtis–Malik, Praeger–Soicher, Bray–Curtis, Havas–Sims, the ATLAS presentation and representation files, the Group Presentations Library and the `tcenum` input: outside the sample and not fetched. The Layer 7 rows were checked arithmetically and against the pinned relator counts.
- The FiniteSimpleGroups and AxiomMath CFSG repositories were not opened. Their He/Co2/Fi22/Suz constructions were checked only through Tau Ceti's recorded comparisons.

## Source issues

- **Misprint** in hohnseysen at Corollary 5.2, printed page 24: the displayed factorization of the Baby Monster's order contains a factor 41, which does not divide the decimal value printed beside it; it should omit 41; affects nothing.
- **Misprint** in conrad-tits at Theorem 2.4, printed page 2: the split BN-pair is said to use a subgroup `U` contained in `N`; it should be contained in `B`, as in the definition of split given just before; affects nothing.

## For the human reviewers

- Two open roadmaps declare supplier gaps against this roadmap that this head does not state. NonabelianLevelStructures (gap:vdovin-abelian-subgroups, its README line 1061) asks for a bound on every nonabelian finite simple group, which presupposes the classification that README lines 26–27 exclude. LevelOneAutomorphicFormsForClassicalGroups asks for gap:conway-group-average-charpoly (its README line 3101).
- Licence: §6.3 and "Existing formalizations" name two external formal repositories, KitaKen1/finite-simple-groups-lean and AxiomMath/CFSG at `69cb972f`, as porting sources. I did not read their licences.
- Not tested: the most-cited reference is the ATLAS of Finite Group Representations, a database of files with no table of contents. The wording and arrangement checks were run against hohnseysen instead.
