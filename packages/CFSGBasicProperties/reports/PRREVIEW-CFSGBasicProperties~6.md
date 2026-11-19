# Review of CFSGBasicProperties (pull request #2541 at c2f6158)

**Verdict:** needs changes

**Summary.** One finding needs changes. §8.2 introduces the Leech isometry group `Co0` afresh and plans to prove it finite. The pinned Tau Ceti already has that isometry group as a group, and proves it finite for every positive-definite lattice. All eleven findings of the previous review are repaired. The rest of the mathematics checked out: the orders, index products, Leech counts and Monster counting identities recompute, the sampled locators support the text, and `Suggested.lean` elaborates with only `sorry` warnings. There are two small corrections (one of them to the pull-request description) and one format note, none blocking. Two questions go to the author, and three facts go to the human reviewers.

## R01 (P2) — §8.2 plans the finiteness of `Co0 = Aut(Λ)`, which the pinned Tau Ceti proves for the isometry group of every positive-definite lattice

As written, an implementer of §8.2 would define a second carrier for the Leech isometry group and reprove its finiteness through the minimal vectors. The library already provides both, so the target asks for finished work. The text (lines 943–945) reads: "so the faithful permutation action of the isometry group `Co0 := Aut(Λ)` on them proves `Co0` finite. Construct `Co1 := Co0 / {±1}` and deduce its finiteness."

At the pinned Tau Ceti:
- `TauCeti.IntegralLattice.Isometry L M` (`TauCeti/LinearAlgebra/IntegralLattice/Isometry/Basic.lean`, line 77) is the type of isometries of the ambient rational spaces that carry `L` onto `M`. `Isometry L L` is a group under composition (`Isometry/Group.lean`, line 102).
- `TauCeti.IntegralLattice.IsPosDef.finite_isometry` (`PosDef/Finite.lean`, line 147) proves `Finite (Isometry L M)` whenever `M` is positive definite.
- `TauCeti.isPosDef_leechLattice` (`Rank24/Leech/Basic.lean`, line 299) says that `TauCeti.leechLattice` is positive definite.

At the pins, `Finite (TauCeti.IntegralLattice.Isometry TauCeti.leechLattice TauCeti.leechLattice)` elaborates as the single term `TauCeti.IntegralLattice.IsPosDef.finite_isometry TauCeti.isPosDef_leechLattice`, and its `Group` instance comes from `inferInstance`. OrthogonalTamagawaAndLatticeMass, an open roadmap, already says that finiteness of the automorphism group of a definite lattice is Tau Ceti's (its README line 9).

The smallest change:
- In §8.2, take `Co0` to be `TauCeti.IntegralLattice.Isometry TauCeti.leechLattice TauCeti.leechLattice`. Replace "so the faithful permutation action … proves `Co0` finite" by a citation of `TauCeti.IntegralLattice.IsPosDef.finite_isometry` with `TauCeti.isPosDef_leechLattice`. The finiteness of `Co1` then follows from that of `Co0`.
- Keep as targets what the library lacks: the antipodal pairs, `Co1`, the actions and the Conway generators, and the spanning by the minimal vectors, which makes the action on them faithful and which the order computation uses.
- Add the three names to the *Needs:* line of §8.2, to the Leech-lattice bullet of "From Tau Ceti", and to "Already in the libraries" under Scope and ownership. The description's list of pinned results and its list of the remaining §8.2 targets change accordingly.

## C01 — The double-coset bullet of §4.2 cites an index bound that, in Lean, does not give finite index

The bullet (lines 404–408) cites `Subgroup.index_le_sum_of_doubleCoset_cover` for `[G : H] ≤ ∑_i [H : w_i H w_i⁻¹ ∩ H]`. At the pin (`TauCeti/GroupTheory/DoubleCoset/Cover.lean`, line 96) this bound also holds when the index is infinite, because `Subgroup.index` is then `0`, as the docstring says. So it does not bound a presented group by itself, and the J4 argument of §7.3 needs finite index. The finiteness statement is `Subgroup.finiteIndex_of_doubleCoset_cover` (same file, line 85): a finite cover whose intersection indices are finite gives `H.FiniteIndex`. Naming it beside the other two declarations, in the bullet and in the *Needs:* line, would close the gap. The coset-table bullet already does this with `TauCeti.CosetTable.finiteIndex`.

## C02 — The description's list of remaining Layer 4 targets omits three items the head keeps

The description says: "In P0: a Schreier free basis for an arbitrary Schreier transversal, the coset cover with word witnesses, recognition from an order bound, the action lemmas, and compressed proofs of centralizer orders and nonconjugacy." But §4.1 (lines 364–378) also keeps presentation dictionaries, straight-line words and transport along `MulEquiv`s as targets. A reader of the description would conclude that these moved to Tau Ceti. Text that would be right: "In P0: presentation dictionaries, a Schreier free basis for an arbitrary Schreier transversal, straight-line words, transport along `MulEquiv`s, the coset cover with word witnesses, recognition from an order bound, the action lemmas, and compressed proofs of centralizer orders and nonconjugacy."

## N01 — Reference [C] links a Tau Ceti revision other than the pin

`[src-c]` (line 1629) links `Presentation.lean` at `a91d3aaf…`. That revision is an ancestor of the pinned `2fd255d9…`, and the sporadic presentation files have changed since (among them `Presentation.lean`, `Rudvalis.lean` and `Thompson.lean`). The text means "the exact Tau Ceti presentation named in its section", so linking the pinned revision would match it.

## Questions for the author

- §5.2 asks first to "prove that the ambient root relations give a complete presentation of `²F₄(2)`" (line 568). Which theorem is this, and where is it proved? In particular, which relations does it use beyond the commutator relations of the twisted root groups at `q = 2`? The section gives no locator, and I found none in the cited sources.
- §11.3 follows Breuer–Magaard–Wilson, whose route assumes two inputs: the suborbit lengths and stabilizers of `2·B` on the class `2A`, taken from the uniqueness paper they cite (bmw-monster line 71, their Fact 1), and the character tables of `2·B` and other ATLAS groups (line 78). Which section supplies these? Are they among the "individual local subgroup, table and representation inputs" of §11.3, or the "local-group and character-table facts" of §11.1? §9.2 produces only the `2B` suborbit, `|X⁻| = 11707448673375`. The README does not say where the other suborbits come from.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 split Tits system, simplicity | `SL₂(𝔽₅)`, `SL₂(𝔽₃)`, `GL₂(𝔽₃)`, `S = ∅` | `|B|=20`, `|U|=5`, `|B∩N|=4`; `SL₂(3)/Z ≅ A₄`; `GL₂(3)`: `H⁺=[G,G]=SL₂(3)` not perfect, quotient `A₄`; `S=∅` forces `G=B`, `U=1` | true; conrad-tits 71–80, `NormalClosure.lean` 178 | none |
| §2.1 root calculus (sample) | `SL₃` commutator; graph map with `J = antidiag(1,−1,1)` and with all-ones `J` | `[x₁₂(a),x₂₃(b)] = 1+abE₁₃`; `J E₂₁ J⁻¹ = −E₂₃` gives `x₂₃(u)`; all-ones gives `x₂₃(−u)` | true; ChevalleyGroups C3 (commutator, Bruhat, Tits system), C5 (endomorphisms) | none |
| §2.2 fixed Weyl representatives (sample) | `SL₂(K)`, `F = Frob_q`, lift `[[0,c],[−c⁻¹,0]]` | image `[[0,c^q],[−c^{−q},0]]`; fixed iff `c^q = c`; `c ∉ 𝔽_q` not fixed | true | none |
| §2.3 Check | `SL₂(𝔽₃)` | `6 + 18 = 24 = q(q²−1)`; `|B|²` count `6+36 = 42 > 24` | true | none |
| §2.4 Check | `²A₂(3)` | orbit group order `27`; `|SU₃(3)| = 6048 = 2⁵·3³·7`; simple-root folding `9` | true | none |
| §2.6 comparisons (sample) | four cited comparisons | `TypeA.lean` 75, `TypeC.lean` 68, `TypeB/Two.lean` 89, `TwistedA.lean` 74; namespaces `TypeALieIndex`, `TypeCLieIndex`, `TypeB2LieIndex` | exist as cited | none |
| §§3.2–3.3 simplicity (sample) | `A₁(2)`, `A₁(3)`, `A₁(7)`, `²A₂(3)` | candidates trivial, `V₄`, order 168; `U₃(3)` order 6048, centre `gcd(3,4)=1`; `isSimpleGroup_A` (`TypeA.lean` 199), `ofConj` (`Iwasawa.lean` 91) | true | none |
| §4.2 upper bounds | `⟨a,b | a²,b³,(ab)²⟩`; `⟨a | ⟩`; double-coset bound at infinite index | six words closed: `ba=ab²`, `b·ab=a`, `b·ab²=ab`; `(1 2)(1 2 3)=(2 3)`; bound reads `0 ≤ …` at infinite index | Checks true; finiteness lemma unnamed | C01 |
| §4.3 recognition lemma | `[P:L] ≤ n`, `|L| ≤ m`, `|M| = nm`, surjection `P → M` | `|P| = [P:L]·|L| ≤ nm = |M| ≤ |P|`, so the surjection is bijective | true | none |
| §§4.4–4.5 certificates | `A₅`, `A₄`, `S₃` | 5-cycle classes `(1 2 3 4 5)`, `(1 3 5 2 4)`; `A₄`-normal closure of `(1 2)(3 4)` is `V₄`; `S₃` indices `1,3,2` sum 6 | true; `Sift.lean` 208, 222 match | none |
| §5.1 Ree | `m = 1`, `m = 0` | `|²G₂(27)| = 10073444472`; `|²F₄(8)| = 264905352699586176614400`; `²G₂(3)`: `1512 = 3·504` | true | none |
| §5.2 Tits group (sample) | ATLAS 1600-point representation, maximal subgroups | `35942400 = 2·17971200`; `17971200/1600 = 11232 = |L₃(3):2|`; suborbits `1+312+351+936 = 1600` | true; presentation step lacks locator | question |
| §5.3 Lie-type endpoint (sample) | 17 constructors | `13 + 4`; `ValidLieTypeIndex.finite` (`LieTypeFinite.lean` 129), `isSimpleGroup_suzuki` (`Suzuki.lean` 32) | true | none |
| §6.1 `sporadicOrder` | 26 entries | each equals its standard factorization, 0 mismatches; `|B| mod 41 = 4`; `2·|Fi₂₄′| = 2510411418381323442585600` | correct | none |
| §§6.2, 6.4 models (sample) | M11, M24, J1 models; 14 names | `card_M11 = 7920` (`Eleven.lean` 401); seven `exists_surjective_*`; `10 + 4 = 14`; no pinned `Finite`/`IsSimpleGroup` for presented groups | sound | none |
| §7.1 scheme (sample) | relator counts at the pin | 8, 12, 12, 29, 57, 136 on 11 generators, 19, 53, 39; [C] revision is an ancestor of the pin | consistent | N01 |
| §7.2 J3 (sample) | ATLAS `J3G1-P1.M` | 2 generators, 8 relators incl. `(xy)^19`, `(x,y)^9`; `⟨xy⟩` of index 2643840; `19·2643840 = 50232960` | true | none |
| §§7.3–7.10 index products | J4, Ru, O’N, Fi23, Fi24′, HN, Th | `21799895040·3980549947`, `35942400·4060`, `3753792·122760`, `129123503308800·31671`, `177408000·1539000`, `634023936·143127000` equal the orders | true | none |
| §7.9 Ly (sample) | arithmetic; pinned transcription | `1500000·3906 = 5859000000 = |G₂(5)|`; `·8835156 = |Ly|`; `Lyons.lean`: 6 generators, 53 relators, (14.1)–(14.86), §14.4 | consistent; source unread | none |
| §7.11 local data | nine prime sets; suborbits | prime sets equal prime divisors; `1+1755+2304 = 4060`; `1+3510+28160 = 31671`; `92897280/1512 = 61440` | true | none |
| §8.2 Leech, `Co0` (sample) | three families; `Isometry leechLattice leechLattice` | `1104+97152+98304 = 196560`, raw norms 32; `Finite` by `IsPosDef.finite_isometry isPosDef_leechLattice` elaborates | families cited; `Co0` finiteness duplicated | R01 |
| §§8.3–8.4 | `|Co₁|/|Co₂|`; pairs to type-2 classes | `98280`, remainder 0; `v ≡ w mod 2Λ`, `v ≠ ±w` forces `(v,w) ≤ −4`, so `w = −v` | true | none |
| §9.1 local representations (sample) | hohnseysen §2.1, Lemma 2.1 | shapes match lines 158–163; `1+1+23+275 = 300` (line 262); `300+98280+98304 = 196884` (line 204) | true | none |
| §§9.2, 9.4 counting | `|S|`, `|X⁻|`, `|X⁺|`, `|B|` | `709767191322427392000`; `11707448673375` (bmw-monster 52); `97239461142009186000`; product `= |M|`; `|X⁻||S|/2 = |B|` | true | none |
| §9.3 simplicity route | hohnseysen Lemmas 5.3–5.5, Thm 5.6 | Lemma 5.4 uses odd order and inversion only (lines 1037–1045), no Feit–Thompson; Lemma 5.5 needs `Co₁` simple (§8.3) | sound | none |
| §§10.4–10.5 (sample) | 80- and 69-relator presentations; 26 names | `12+66+2 = 80`; `11+55+3 = 69`; cases `10+4+9+1+2 = 26` | true | none |
| `monster_two_involution_classes` | centralizer orders | `2|B| = 8309562962452852382355161088000000`; `2²⁵|Co₁| = 139511839126336328171520000`; both divide `|M|` | bmw-monster 62–65, hohnseysen Thm 5.8 | none |
| `monster_card_conjClasses` (§11.3 sample) | bmw-monster Prop 1 | 194 classes (line 410); running counts 182, 184, 190, 194 | true | question |
| `monster_exists_irreducible_196883` | degree | `196883 = 47·59·71` divides `|M|`; `B = 1x ⊕ 196883x` (hohnseysen 231) | true | none |
| `monster_card_irreducibleCharacters` (§11.4 sample) | hypotheses of `card_irreducibleCharacters` | `[Finite G] [IsAlgClosed k] [Invertible (Nat.card G : k)]` (`Table.lean` 155, 181); ℂ has characteristic 0; uses §11.3 | true; not one tactic | none |
| `CFSGIndex_finite`, `CFSGIndex_isSimpleGroup` | `cyclic 2`, `cyclic 7`, `alternating 5`, Lie, sporadic | orders 2, 7, 60; `finite_cyclic`, `isSimpleGroup_cyclic`, `isSimpleGroup_alternating` (`Elementary.lean` 46–54); `cases i <;> infer_instance` fails | true | none |
| `validLieTypeIndex_isSimpleGroup`, `sporadicName_*` | excluded indices; probes | excluded `A₁(2)`, `A₁(3)`, `B₂(2)`, `G₂(2)`, `²G₂(3)` have non-simple candidates; `infer_instance`, `cases <;> infer_instance` fail | true on valid indices | none |

- Earlier findings, all eleven repaired: R01 (§§4.2, 4.4; Scope lines 1296, 1360), R02 (§8.2 lines 932–940; Scope 1332–1333), C01 (removed, cited in §5.3), C02 (lines 157–167), C03 (line 1328), C04 (Conventions item 10), C05 (§6.2), C06 (docstring lines 21–25), C07 (description), N01 (line 122), N02 (link dropped).
- Source locators checked against the text: 17 locators in 4 texts. These are conrad-tits (the split definition and Thm 2.4); hohnseysen (§2.1, Lemma 2.1, Thm 2.9, Thm 5.1, Cor 5.2, Lemmas 5.3–5.5, Thm 5.6, Thm 5.8, Appendix E); bmw-monster (Hypothesis 1, Table 1, Prop 1); and the ATLAS (`J3G1-P1.M`, `TF42G1-p1600B0`, the `²F₄(2)′` page).
- Library declarations opened at the pins: about 70, read in source with their namespaces resolved. They cover coset tables, covering and double-coset bounds, stabilizer chains, sifting, the Tits normal closure, Iwasawa, the Leech families, sporadic models, family comparisons, finiteness, the class count, the mass criterion and the lattice isometry group. Of these, 3 were also elaborated in a probe.
- Cross-roadmap citations resolved on main: CFSGStatement Layers 1–3 and §§3.1, 4.1, 5.1; ChevalleyGroups C2–C5; ReductiveGroups Layer 7; SporadicOrders §§1.1–1.2, 2.2 and Layers 1–2; Rank24LatticeConstructions Layer 6; AlgebraicCodingTheory Layer 5; the root README anchor. Seven roadmaps that cite this one use labels the head keeps (T0–T2, P0 items, P1, P2-L).
- Automatic checks: all passed, and a rerun here gave the same result. The dependency check printed `depcheck: 200 roadmaps, 2200 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. Every supplier is on main, and nothing outside the folder changed.
- Elaboration of `Suggested.lean` at the pins: ten `declaration uses sorry` warnings (lines 35, 74, 78, 82, 90, 100, 105, 111, 119, 124), nothing else, exit 0. The elaborated types of the eleven declarations match the README statements, and there is no `variable` block.
- One-tactic probe on a copy of the file (`infer_instance`, `rfl`, `decide`, `simp`, `cases … <;> infer_instance`): none of the ten theorems closes.
- Arithmetic and Checks: 26 orders, 9 index products, 3 suborbit sums, the Leech counts and the Monster and Baby Monster counts were recomputed, and all 37 Checks were evaluated. Every numbered section has a *Needs:* line.

Overlap check: read LocalFiniteGroupTheory, GlaubermanZStar, LevelOneAutomorphicFormsForClassicalGroups and PotentialAutomorphyDworkMotivesPartII (open), and CFSGStatement, SporadicOrders and OddOrderTheorem (main). Nothing is shared:
- LocalFiniteGroupTheory, CFSGStatement, LevelOneAutomorphicFormsForClassicalGroups and PotentialAutomorphyDworkMotivesPartII consume this roadmap or defer to it, and so does OrthogonalTamagawaAndLatticeMass.
- SporadicOrders supplies Layers 1–2. Its §0.2 orbit lemma is a different statement from the orbit witnesses of §4.4.
- GlaubermanZStar and OddOrderTheorem own no listed group.
- The third list (closest by results) is empty, and a search of the open heads for split BN-pairs, `Co0`, the Conway groups, the Griess algebra, the Bimonster and the Baby Monster finds no second owner.

The only second owner is the pinned Tau Ceti (R01).

Source independence: 14 passages compared with 4 sources (conrad-tits, hohnseysen, bmw-monster, ATLAS). Nothing is shared beyond forced phrases: "the double cover of the Baby Monster" (6 words, bmw-monster line 64) and group shapes. The largest share is the ATLAS, about 34 of about 128 citing lines; it is a database with no table of contents. Contents compared with hohnseysen (11 lines): independent. Its §§2.1, 3–5 and Appendices D–E feed §§9.1–9.4 and 11.1 only, in the order the *Needs:* lines force, with simplicity (§9.3) placed before the Baby Monster (§9.4). Ten layers have no counterpart there.

Research link: Layers 9–11 formalize the Monster order and simplicity of Höhn–Seysen (2025) and the 194-class verification of Breuer–Magaard–Wilson (2024). Layer 10 rests on Ivanov's Y-group presentations (1994, 1999). The endpoint is the concrete half of CFSG that CFSGStatement pairs with its classification proposition. This rests on the README's Summary and References, hohnseysen Thms 5.1 and 5.6, and bmw-monster Prop 1.

## Not verifiable

- Steinberg, *Lectures on Chevalley Groups*, Chapter 11, Theorem 33 (§2.3): no legal copy located, in either the 1967 notes or the AMS edition.
- Havas–Sims, *A presentation for the Lyons simple group* (§7.9): a paywalled book chapter. The relation numbering agrees with the pinned Tau Ceti transcription, but the text was not read.
- Ivanov (1994, 1999) and Griess (1985): paywalled or no legal text located; cited by locator only.
- Bolt–Bray–Curtis, Bradley–Curtis–Malik, Praeger–Soicher, Bray–Curtis, Havas–Soicher–Wilson, Kim–Michler, `tcenum` and the Group Presentations Library: outside this round's sample. The Layer 7 rows were checked arithmetically and against the pinned relator counts.
- KitaKen1/finite-simple-groups-lean and AxiomMath/CFSG: contents not opened, only their licence notices.

Automatic checks set aside as false positives: none of the checks failed. However, the listing of elaborated signatures and the library near-match listing read line 18 of `Suggested.lean`, a docstring line that begins with the word "theorem", as two declarations, `needs` and `TauCeti.ValidLieTypeIndex.finite`, and the change summary counts them as added declarations. The file declares neither.

## Source issues

- **Misprint** in hohnseysen at Corollary 5.2, printed page 24: the source says the displayed factorization of the Baby Monster's order includes a factor 41, which does not divide the decimal value printed beside it; it should omit the factor 41; affects nothing.
- **Misprint** in conrad-tits at Theorem 2.4, printed page 2: the source says the split BN-pair uses a subgroup U contained in N; it should say contained in B, as in the definition of split given just before; affects nothing.

## For the human reviewers

- Two open roadmaps declare supplier gaps against this roadmap that this head does not state. NonabelianLevelStructures declares gap:vdovin-abelian-subgroups (its README line 1061), which presupposes the classification that README lines 26–27 exclude. LevelOneAutomorphicFormsForClassicalGroups declares gap:conway-group-average-charpoly (its line 3101).
- Licence: §6.3 and "Existing formalizations" name KitaKen1/finite-simple-groups-lean and AxiomMath/CFSG (commit `69cb972f`) as porting sources. Both repository pages report Apache-2.0. README lines 1647–1649 say the latter proves the sporadic finiteness and simplicity headlines on the exact carriers.
- Not tested: the most-cited reference, the ATLAS of Finite Group Representations, is a database with no table of contents. The wording and arrangement checks were run against hohnseysen instead.
