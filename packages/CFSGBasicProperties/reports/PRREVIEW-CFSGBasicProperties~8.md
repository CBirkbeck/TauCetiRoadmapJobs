# Review of CFSGBasicProperties (pull request #2541 at 9803de2)

**Verdict:** accepted

**Summary.** Accepted: a full second reading of this head found no statement that is false, unsupported or unowned. Every order identity and every Check was recomputed, the cited theorems of Höhn–Seysen, Breuer–Magaard–Wilson and Conrad were read at their locators, and the Tau Ceti declarations the text relies on were opened at the pin. There are no small corrections and no format notes. Three questions go to the author (two carried over, one new, on the source for the `Y₅₅₅` theorem of §10.2), and four facts go to the human reviewers.

## Questions for the author

- §10.2 (line 1128) selects "the `Y₅₅₅` presentation of Ivanov, *Presenting the Baby Monster*" and asks for a `MulEquiv` of the presented group with `BiM`. Which theorem, in which source, gives the upper bound for the `Y₅₅₅` group? Breuer–Magaard–Wilson cite Ivanov's 1994 paper only for the step from the `Y₅₅₅` presentation of the Bimonster to `Y₄₃₃` (bmw-baby lines 31–34 and 63–66), and treat the Bimonster theorem as given. Ivanov's paper is behind a paywall, so I could not see whether it proves the Bimonster identification itself or assumes it.
- §5.2 (line 570) asks first to prove that the ambient root relations give a complete presentation of `²F₄(2)`. Which theorem is this, and where is it proved? The section gives no locator and I found none in the cited sources. (Carried over.)
- §11.3 follows Breuer–Magaard–Wilson, whose argument assumes the suborbit lengths and stabilizers of `2·B` on the class `2A` (bmw-monster line 71, their Fact 1) and the character tables of `2·B` and other ATLAS groups (line 78). Which section supplies these? §9.2 produces only the orbit of `K` on the axis `v⁻`. (Carried over.)

## Previous findings

The previous review, of this same head, had no finding, no small correction and no format note; its two questions are the second and third above.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 split Tits system, simplicity statement | `SL₂(𝔽₅)`, `SL₂(𝔽₃)`, `GL₂(𝔽₃)`; wrong model `U = B` | orders `20, 5, 4`; `6, 3, 2`, closure 24, derived `Q₈`; `12, 4`, `[G,G] = SL₂(𝔽₃)`, quotient `A₄`; `U = B`: intersection of order 4 | Checks true; perfectness needed; matches pin statement (`TitsSystem/NormalClosure.lean` 178) | none |
| §2.1 commutator and graph-map sign | `SL₃`, `J = antidiag(1, −1, 1)` and all-ones `J` | commutator `1 + ab E₁₃`; `J E₂₁ J⁻¹ = −E₂₃`, so `x₁₂(u) ↦ x₂₃(u)`; plain `J` gives `x₂₃(−u)` | true | none |
| §2.2 fixed Weyl representatives (sampled) | `SL₂(K)`, lift `[[0, c], [−c⁻¹, 0]]` | image under `Frob_q` has `c^q`; fixed iff `c^q = c` | true; no source locator to check | none |
| §2.3 fixed-point Bruhat cells | `SL₂(𝔽_q)`, `q = 3` | `q(q−1) + q²(q−1) = q(q²−1)`; `6 + 18 = 24`; wrong count `6 + 36 = 42` | true | none |
| §2.4 twisted root groups | `²A₂(3)` | `q³ = 27`; `6048 = 2⁵·3³·7`; folding simple roots only: 9 | true | none |
| §2.5 and §3.1 on every valid index (sampled) | excluded `A₁(2)`, `A₁(3)`, `B₂(2)`, `G₂(2)`, `²A₂(2)`; retained `B₂(4)`, `²A₃(2)`, `G₂(3)` | `G₂(2)`: closure of `U` has order 12096, `[H,H]` 6048, so bridge fails, but `Valid` needs `3 ≤ q` (`CFSG/Index.lean` 127–136) | the non-perfect fixed-point groups are exactly the excluded indices | none |
| §3.2 small fields | `A₁(2)`, `A₁(3)`, `A₁(7)` | candidate orders `1`, `4`, `336/2 = 168` | true | none |
| §3.3 simplicity (sampled) | type `A`, Suzuki at the pin | `isSimpleGroup_A` (`BasicProperties/TypeA.lean` 199), `isSimpleGroup_suzuki` (`Suzuki.lean` 32); no other family theorem at the pin | cited, not restated; the other twelve families are owned here | none |
| §4.2 covering bound and Check | `⟨a, b ∣ a², b³, (ab)²⟩` | `ba = ab²`; `b·ab = a`, `b·ab² = ab`; `(1 2)(1 2 3) = (2 3)`; bound 6 | true; pin statement has `R` finite nonempty, `K` finite (`Subgroup/Closure.lean` 152) | none |
| §4.3 recognition (sampled) | `M` infinite; `n = 0` or `m = 0` | finite `P` onto `M` forces `M` finite; finite index gives `n ≥ 1`, `m ≥ 1`, so `nm ≠ 0` | no junk-value loophole | none |
| §4.4 and §4.5 Checks | `S₃`, `A₅`, `A₄` | left-to-right product `(1 3)`; two classes of 5-cycles; closure of `(1 2)(3 4)` in `A₄` has order 4; indices `1 + 3 + 2 = 6`, `1 + 3 = 4` | true | none |
| Conventions 7, conjugation | `TauCeti.Relator.conj` | body is `s⁻¹ · (r · s)` (`Presentation/Relator.lean` 361) | as stated | none |
| §5.1, §5.2 orders | `²G₂(27)`, `²F₄(8)`, `²F₄(2)`, `²G₂(3)` | `10073444472`; `264905352699586176614400`; `35942400 = 2·17971200`; `17971200/1600 = 11232`; `1512 = 3·504` | true | none |
| §6.1 order table and `sporadicOrder` | all 26 entries | each equals its standard prime factorization; `|B| mod 41 = 4`, `|M| mod 41 = 0` | true; no such table at the pin or in another roadmap | none |
| §6.3, §6.4 the four further models (sampled) | FiniteSimpleGroups repository page | lists order and simplicity for 14 groups, including `Co2 Suz Fi22 He`, as subgroups of `Equiv.Perm (Fin n)` | supports the text | none |
| §7.2 J3 | ATLAS `J3G1-P1.M` | eight relators; `⟨xy⟩` of order 19, index 2643840; `19·2643840 = 50232960` | true | none |
| §7.3 J4 (sampled) | ATLAS `J4G2-P1.M`; pin | twelve relators in both; `q` and the five generators of `H` as in the file; `2¹³·3·443520·2 = 21799895040`; times `3980549947` is `|J₄|` | true | none |
| §7.4 Ru (sampled) | `tcenum` file at the pinned revision | subgroup field as quoted; ten listed relators, `v²`, `t²` not among them; `35942400·4060 = |Ru|` | true | none |
| §7.5 O’Nan (sampled) | Group Presentations Library record | path `a3b3c8d3e3f`, eight further relations, subgroup `a,…,f` labelled `L₃(7):2`; `21 + 8 = 29`; `1876896·2 = 3753792`; times `122760` is `|O’N|` | true | none |
| §7.6–7.10 | products | `129123503308800·31671 = |Fi₂₃|`; `2|Fi₂₃|·306936 = 2|Fi₂₄′|`; `177408000·1539000 = |HN|`; `1500000·3906 = 5859000000`, times `8835156` is `|Ly|`; `634023936·143127000 = |Th|` | true | none |
| §7.11 table (sampled) | nine prime sets, suborbits, Th index | each set equals the prime divisors of the order; `1+1755+2304 = 4060`; `1+5586+6384+52136+58653 = 122760`; `1+3510+28160 = 31671`; `512·181440/1512 = 61440` | true | none |
| §8.2 minimal vectors, `Co0`, `Co1` | three families | norms `32/8 = 4`; `1104 + 97152 + 98304 = 196560`; pairs 98280 | true; isometry declarations exist at the pin | none |
| §8.4 type-2 classes and `Co2` (sampled) | counts | `|Co₁|/|Co₂| = 98280`, the number of antipodal pairs | consistent with §8.2 and §8.3 | none |
| §9.1 fixed space | hohnseysen Lemma 2.1 (line 244) | `Sym²(1 + 23) = 1 + 23 + (1 + 275)`; `300 + 98280 + 98304 = 196884` | source supports it (lines 259–262) | none |
| §9.2 order of `M_alg` (sampled) | hohnseysen Thms 2.9, 5.1 (lines 390, 1006) | preimage of `Co2` has order `2²⁵|Co₂|`, centralizer of `β⁺` index 2; `|S| = 709767191322427392000`; `|X⁻| = 11707448673375`; `|X⁺| = 97239461142009186000`; product `|M|` | true; kernel `2²⁴`, not `2²⁵` | none |
| §9.3 simplicity (sampled) | hohnseysen Lemmas 5.3–5.5, Thm 5.6 (lines 1029–1067) | normal subgroups `1, ⟨z⟩, Q, G₀`; three cases excluded by triality | source supports it | none |
| §9.4 Baby Monster | hohnseysen Cor 5.2 (lines 1022–1024) | `|X⁻||S|/2 = |B|`; printed factorization has a factor 41, decimal value does not | README's remark is right | none |
| §9.5, §10.4 presentations | bmw-baby §3.1 (lines 63–74) | `11 + 55 + 3 = 69`; `12 + 66 + 2 = 80`; spider gives `2 × 2·B`, two further relators give `B` | source supports it | none |
| §10.1 Bimonster carrier (sampled) | swap `σ` | `σ(g, h)σ⁻¹ = (h, g)`; fixed pairs are `g = h` | Example true | none |
| `validLieTypeIndex_isSimpleGroup` | one-tactic probe | `infer_instance`, `rfl`, `simp`, `decide` all fail | not padding | none |
| `sporadicName_finite`, `_isSimpleGroup`, `_card` | probe; junk value | all fail; an infinite group has `Nat.card = 0 ≠ sporadicOrder s` | `_card` is not vacuous | none |
| `monster_two_involution_classes` | probe; orders | fails; `2|B| = 8309562962452852382355161088000000`; `2²⁵|Co₁| = 139511839126336328171520000`; hohnseysen Thm 5.8, App. E (lines 1094, 1530) | Lean equals README | none |
| `monster_card_conjClasses` | probe; bmw-monster Prop 1 (line 410) | fails; `190 + 4 = 194` (line 389) | source supports it under its Hypothesis 1, which is §§11.1–11.2 | none |
| `monster_exists_irreducible_196883` | probe; trivial group | fails; trivial group has no irreducible module of dimension 196883 | not vacuous | none |
| `monster_card_irreducibleCharacters` | probe | fails; needs finiteness of the group, which is another target | follows from §11.3 and §10.5, kept as a stated headline | none |
| §12.1 `CFSGIndex_finite`, `CFSGIndex_isSimpleGroup` (sampled) | probe; dispatcher Check | both fail; orders `7, 60, 168, 6048, 64·65·7 = 29120, 17971200, 7920, 50232960` | Lean equals README | none |

- Source locators checked against the text: 17 (hohnseysen Lemma 2.1, Thms 2.9, 5.1, 5.6, 5.8, Cor 5.2, Lemmas 5.3–5.5, Appendices D and E, Tables 2 and 4; bmw-monster §2 and §4.9 Prop 1; bmw-baby §2 and §3.1; conrad-tits Thm 2.4 and the definition before it), and five open pages (ATLAS J3 and J4 files, the `tcenum` Ru file, the Group Presentations Library records for O’N, Fi23 and Co1, the FiniteSimpleGroups page).
- Library declarations: all 194 dotted names in code font were resolved against the pinned Tau Ceti and Mathlib; 14 were opened and read (those named in the table, and `ValidLieTypeIndex.finite` at `BasicProperties/LieTypeFinite.lean` 129, `card_irreducibleCharacters` at `CharacterTable/Table.lean` 181, `finiteIndex_of_doubleCoset_cover` at `DoubleCoset/Cover.lean` 85, `prod_ncard_orbit_mul_card_stabilizerChain` at `Stabilizer/Chain.lean` 119, `j4Presentation` at `Sporadic/Janko/Four.lean` 164).
- Cross-roadmap citations resolved on main: CFSGStatement Layer 1, §§3.1, 4.1, 5.1; ChevalleyGroups C2–C5; ReductiveGroups Layer 7; SporadicOrders §§1.1–1.2, 2.2; Rank24LatticeConstructions Layer 6; AlgebraicCodingTheory Layer 5. All exist.
- Automatic checks: all passed. Dependency check: `depcheck: 200 roadmaps, 2200 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Nothing outside the folder changed.
- Elaboration of `Suggested.lean`: ten `declaration uses sorry` warnings (lines 35, 74, 78, 82, 90, 100, 105, 111, 119, 124), nothing else, exit 0. The elaborated types of the ten theorems and of `sporadicOrder` equal their README statements; the file has no section variables, so no binder can be lost.
- Headline theorems: all four of the Summary are stated (the Lie-type finiteness half is the pinned `TauCeti.ValidLieTypeIndex.finite`, named in the module docstring). The one-tactic probe closed none of the ten.
- Description read against this head: no sentence is contradicted; its count of 37 Checks and of ten theorems agrees with the files.

Overlap check: read LevelOneAutomorphicFormsForClassicalGroups, GlaubermanZStar, OrthogonalTamagawaAndLatticeMass, PotentialAutomorphyDworkMotivesPartII (open) and CFSGStatement, SporadicOrders, OddOrderTheorem (main); LocalFiniteGroupTheory has no checkout among the open heads given, so it was not read. The third list is empty. Shared objects and owners: the Leech isometry group `Co0` (carrier and finiteness: pinned Tau Ceti; generators, order and `Co1`: this roadmap, consumed by the two lattice roadmaps under the label P2-L); simplicity of `²A`, `C`, `B₂` (this roadmap, consumed by PotentialAutomorphyDworkMotivesPartII under T1–T2); the ten permutation models (SporadicOrders; recognition and simplicity here). No object has two owners.

Source independence: 12 passages compared with 4 sources (§1.1 with conrad-tits lines 71–80; §§9.1–9.4 and 11.1 with hohnseysen lines 244–262, 390–397, 1006–1067, 1530–1539; §§9.5 and 10.4 with bmw-baby lines 63–74; §11.3 with bmw-monster lines 59–86 and 409–411; three docstrings of `Suggested.lean`), none shared beyond formulas and group names; largest share the ATLAS of Finite Group Representations, 28 of 81 source citations counted by name or link (Höhn–Seysen 11, the other Layer 7 labels 25 together), a database with no table of contents; contents compared with hohnseysen (§§1–5, Appendices A–E) instead: independent, since its §§3–4 fall inside §9.2 here, its §5 is split over §§9.2–9.4 and its Appendix E is used in Layer 11.

Research link: Layers 9–11 formalize the Monster order and simplicity argument of Höhn–Seysen (2025) and the 194-class verification of Breuer–Magaard–Wilson (2024); Layer 10 rests on Ivanov's Y-group presentations (1994, 1999). The endpoint is the concrete half of the classification that CFSGStatement states. Rests on the README's Summary and References and on hohnseysen Thms 5.1, 5.6, bmw-monster Prop 1.

## Not verifiable

- Steinberg, *Lectures on Chevalley Groups*, Chapter 11, Theorem 33 (§2.3): no legal copy located.
- Ivanov (1994, 1999) and Griess (1985), for §§9.5, 10.2, 10.3: paywalled or not located; cited by locator only.
- Bolt–Bray–Curtis §5 (§7.3) and Bradley–Curtis–Malik (§7.4): paywalled; the ATLAS and `tcenum` files they accompany were read instead.
- Havas–Sims (§7.9), Kim–Michler (§7.7), Bray–Curtis (§7.8), Havas–Soicher–Wilson (§7.10): outside the sample; only the arithmetic of those sections was recomputed.
- The AxiomMath/CFSG repository named under "Existing formalizations": not opened.

## Source issues

- **Misprint** in hohnseysen at Corollary 5.2, printed page 24: the source says the prime factorization of the Baby Monster's order includes the prime 41, beside a decimal value not divisible by 41; it should be the same product without the factor 41; affects nothing.
- **Misprint** in conrad-tits at Theorem 2.4, printed page 2: the source says the split BN-pair uses a subgroup `U` contained in `N`; it should be `U` contained in `B`, as in the definition just before it; affects nothing.

## For the human reviewers

- Two open roadmaps declare supplier gaps against this roadmap that this head does not state: NonabelianLevelStructures (gap:vdovin-abelian-subgroups, its README line 1061, which presupposes the classification) and LevelOneAutomorphicFormsForClassicalGroups (gap:conway-group-average-charpoly, its line 3101).
- OrthogonalTamagawaAndLatticeMass (open), README line 96, takes finiteness of `Co0` from this roadmap "from the faithful action on the 196560 minimal vectors"; this head takes that finiteness from Tau Ceti (§8.2).
- Licence: §6.3 and "Existing formalizations" name KitaKen1/finite-simple-groups-lean (its page states Apache-2.0) and AxiomMath/CFSG at commit `69cb972f` (not opened this round) as porting sources.
- Not tested: the most-cited reference, the ATLAS of Finite Group Representations, is a database with no table of contents; the arrangement was compared with hohnseysen instead.
