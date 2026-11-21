# Review of EtaleMassFormula (pull request #1818 at abba2fe)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every stated theorem, Check and convention held on every instance computed (the table is kept on the board), `Suggested.lean` elaborates with the 16 `sorry` warnings only, and the three open points of the previous review are repaired. There are six small corrections (a supplier contract that names layers LocalFieldsRamification no longer has, two statements the pinned Tau Ceti already provides, an uncited pinned equivalence, an out-of-date description, the order against the sibling pull request) and two format notes, none blocking. For the humans: Bhargava's published article could not be read, so its numbering and its contents were not compared.

## C01 — The LocalFieldsRamification contract names three layers that roadmap does not have

A reader who follows "Layer 2 (unramified extensions and Frobenius)", "Layer 3 (the discriminant)" and "Layer 0 (residue degree and the structure adapters)" in the supplier contracts (README lines 418, 431, 438) lands on the wrong sections. `Completed/LocalFieldsRamification/README.md` on main has exactly three layers: Layer 0 "complements on the native carriers" (line 299), Layer 1 "lower breaks of cyclic `p`-power extensions" (line 367) and Layer 2 "the Hasse–Arf theorem" (line 476); there is no Layer 3. What this roadmap consumes is listed there under "Names imported by other roadmaps" (line 591) and "From Tau Ceti" (line 151).

The declarations themselves are all at the pin, with the names and files the contract gives (list under *Verified sound*), so only the three labels need to change: drop them, or replace them by a pointer to that roadmap's "Names imported by other roadmaps", keeping the three groups of Tau Ceti names as they are.

## C02 — The orbit count of §1.3 closes in one step from the pinned theorem, so as a target it asks an implementer for nothing

`ncard_isomorphic_mul_natCard_algEquiv_eq_finrank` (`Suggested.lean` line 268) is proved by `IntermediateField.ncard_isomorphic_mul_natCard_algEquiv_of_isSepClosed K L (SeparableClosure K)` once `TauCeti.FieldTheory.IntermediateField.Isomorphic` is imported: I replaced the `sorry` by that term on a copy of the file and it elaborated (the theorem is at line 107 of `TauCeti/FieldTheory/IntermediateField/Isomorphic.lean` at the pin, with `[IsSepClosed Ω] [FiniteDimensional K E] [Algebra.IsSeparable K E]`). The README (lines 216–217) and the docstring already say that it is that theorem with `Ω = SeparableClosure K`.

If it is kept as a sanity check that the general theorem specialises to this carrier, say so in its docstring; otherwise §1.3 can cite the Tau Ceti theorem directly, as the supplier contract (lines 410–413) already does, and the declaration can leave the Lean file.

## C03 — `intermediateFieldDiscriminantExponent` restates a definition the pin now has, and the commentary about the pin is out of date

The module docstring (lines 26–30) and the contract (README lines 413–414) explain that the Lean file copies the body of Tau Ceti's `IntermediateField.discriminantExponent` and cites Serre's Theorem 1 "from the README". Both declarations are at the pin this head builds against: `IntermediateField.discriminantExponent` at line 168 of `TauCeti/NumberTheory/LocalField/MassFormula/Basic.lean` (the same `if … then … else 0` body, read side by side) and `TauCeti.tsum_one_div_natCard_residueField_pow_wildExponent` at line 72 of `MassFormula/Main.lean`. An implementer who takes the file literally gets two definitions of one object.

The smallest repair: import `TauCeti.NumberTheory.LocalField.MassFormula.Basic` and state the weight with `IntermediateField.discriminantExponent` (a copy of the file with that import added still elaborates, and both names resolve side by side), or keep the copy and change the two sentences to say that the declaration is at the pin and why the copy stays.

## C04 — §0.4 derives the correspondence between étale algebras and Galois sets without naming the pinned equivalence

The route for `tsum_etaleDiscriminantExponent` (README lines 137–141) builds the bijection from `Algebra.FormallyEtale.iff_exists_algEquiv_prod` "and the Galois correspondence", and the docstring appeals to "Grothendieck's Galois theory for étale algebras". Tau Ceti at the pin has that equivalence: `FiniteEtaleScheme.galoisEquivalence K Ω : FiniteEtaleScheme (Spec (.of K)) ≌ ContAction FintypeCat Gal(Ω/K)` for `[IsSepClosed Ω] [IsGalois K Ω]`, whose functor is `Ω`-valued points of the coordinate algebra (`TauCeti/AlgebraicGeometry/FiniteEtale/Galois/Basic.lean` line 95), and ModularCurves §0.4 on main cites it as Tau Ceti's. Without the name an implementer may prove the classification a second time.

Add it to the *Needs* line of §0.4 and to the supplier contracts as an available input (the elementary route through the product decomposition may stay as the sketch; a sketch does not make a route mandatory).

## C05 — The pull request's description describes an earlier head

Three sentences are contradicted by the head. "Fable F02 (`module` header): the module note is a warning, and roadmap signatures build without warnings-as-errors", listed under *Not changed*: the head has the module header (`Suggested.lean` lines 1–8 and 35). "The only warnings are 16 `sorry`s and the module-system note": elaboration gives the 16 `sorry` warnings and nothing else. "New `## Downstream consumers` section: PadicExtensionFamilies takes §§1.1–1.3, and the arithmetic statistics roadmaps take the Layer 3 masses": the section (README lines 353–357) names PadicExtensionFamilies only. And "Only the roadmap pin predates it" (of Serre's Theorem 1 in Tau Ceti) no longer holds, see C03.

The description also leaves out what a reader of the diff must know: the README is reordered (the overview and the guide to the layers first, `## Scope and ownership` and `## Exact supplier contracts` moved after the layers, 248 of its lines touched), and the sentence of §3.2 about where the source starts its product is replaced by the statement of the `t = 0` component. Text that would be right: "Revises the roadmap on main; no section, target or `Suggested.lean` declaration is removed or renumbered. `Suggested.lean` now has the module header. The README is reordered (scope and supplier contracts after the layers) and gains `## Downstream consumers` (PadicExtensionFamilies, Layer 1)."

## C06 — No order is stated against the other open pull request that changes this folder

The pull request "EtaleMassFormula: Layer 4, wreath products" (#1820, same author, draft) changes the same README, and a trial merge of the two heads conflicts in `TauCetiRoadmap/EtaleMassFormula/README.md`. Neither description says which goes first. One sentence here settles it, for instance "#1820 is rebased on this pull request after it merges."

## N01 — Three theorem statements open an instance inside the statement

`GaloisSet.finrank_fixedField_stabilizer`, `GaloisSet.discriminantExponent_of_isTransitive` and `tsum_isTransitive` (lines 120, 141, 157) each write `letI := ρ.mulAction` inside the statement. The statements are right as they stand; a named definition for the fixed field of the stabilizer of a point of a Galois set would let all three, and `splittingSymbol`, be stated without it. Offered, not required.

## N02 — Line length and spacing in the README

23 lines exceed 100 characters (for example lines 217 and 413, where an edit was appended to a wrapped line), and lines 419–420 leave a double blank before the first bullet.

## Questions for the author

- `## Scope and ownership` hands "density conjectures … and the archimedean mass" to ArithmeticStatistics and Parts I to V. I found the `n ≤ 5` density theorems in Parts I–V on main, but no statement of Bhargava's density conjecture or of an archimedean mass in them or in the open ArithmeticStatistics roadmap (searched for "archimedean", "mass formula", "Malle", "conjecture" with "discriminant"). Which section owns them? If none does, would the bullet say that no roadmap states them yet?
- The published numbering "Props. 2.1–2.3", "eqs. (2.1)–(2.4)" and "the Appendix for arbitrary local fields": I could confirm only "Theorem 1.1" (through a paper citing the published article); the article itself is behind the publisher's paywall. Was the numbering read from the published text?

## Verified sound

The previous review's findings at this head: R01 (the module-system warning) repaired, `Suggested.lean` lines 1–8 "module / public import Mathlib …" and line 35 `@[expose] public section`, elaboration shows `sorry` warnings only. R02 (consumers that cite nothing here) repaired, the section now reads "The `p`-adic extension families roadmap (PadicExtensionFamilies) consumes Layer 1 …" and PadicExtensionFamilies on main cites §§1.1–1.2 and Layer 1 (its README lines 134, 270, 1363, 1530, 1546, 1645, 2021, 2114, 2158); its `### Examples` part was a matter of shape and is not raised. R03 (a gap attributed to an unread text) repaired, lines 317–319 now read "The unramified factors form the component `t = 0`: the statement needs `S_{n_0}`, and for `π = ∅` it is the count of its conjugacy classes."

Adversarial table (`q` the residue cardinality, `d` the discriminant exponent, a symbol is a multiset of pairs `(f, e)`).

| statement | instances | values computed on each side | result |
|---|---|---|---|
| 0.1 orbit weight, Checks | one point; `G/H`, `H` fixing `ℚ_2(i)`; countably many copies plus one | `d(⊥) = 0`; `v_2(−4) = 2`; `∑ᶠ` on infinite support `0`, so `0 ≠ 0 + 2` | holds; finiteness needed as stated |
| `…_fixedField_stabilizer_smul` | `Stab(σx) = σ Stab(x) σ⁻¹`; non-open stabilizer | fixed fields `K`-isomorphic, equal `d`; both infinite, `0 = 0` | holds |
| 0.2 `GaloisSet`, Checks | `n = 0`; trivial hom; onto `S_2` with kernel fixing `ℚ_2(i)` | one element, empty sum `0`; `n` orbits of weight `0`; one orbit, weight `2`, degree `2` | holds |
| `finrank_fixedField_stabilizer` | trivial `ρ`; `ρ` onto `S_2` | `[⊥:K] = 1 =` orbit size; `2 = 2` | holds (stabilizer contains the open kernel) |
| 0.3 `etaleMass`, `n = 0, 1` | unique Galois set | `(0!)⁻¹·1 = 1`; `1` | holds |
| `tsum_isTransitive` | `n = 1`; `n = 2`, `ℚ_2`, `g = q^{−d}`; general | `g(⊥) = 0!·g(⊥)`; `1 + 2·2⁻² + 4·2⁻³ = 2 = 1!·2`; `(n−1)!` bijections `G/H → Fin n` fixing the base point | holds for every `g`; `finrank = n > 0` excludes infinite `L` |
| `discriminantExponent_of_isTransitive` | one orbit, any `i`; `n = 0` | weight of the single orbit, independent of the point; no `i` | holds |
| 0.4 `etaleDiscriminantExponent_pi` | empty product; `ℚ_2(i) × ℚ_2` | no maps from the zero ring, `0`; orbits of sizes `2, 1`, `2 + 0` | holds |
| `tsum_etaleDiscriminantExponent` | `n = 0`; `n = 2`, `ℚ_2` | zero algebra: `1/(1·1) = 1 = M_0`; `1/2 + 1/2 + (2/4 + 4/8)/2 = 3/2` | holds; `n!/#Aut` Galois sets per class |
| 1.1 classification, Checks | quadratic `ℚ_2`; cubic `ℚ_3`; quartic `ℚ_2`, `f = 2` | `6 + 1 = 7`; `9 + 1 = 10`; `#ℚ_4^×/□ = 2⁴`, `14` ramified; Frobenius-stable ones `3` (biquadratic) `+ 3` (cyclic: `8` characters with square the unramified one give `4` fields, minus `ℚ_16`) `= 6`, `4` pairs, `10` orbits | holds |
| 1.2 `natCard_algEquiv_eq_mul` | `ℚ_2(ζ_12)`; `ℚ_2(∜−3)`; `ℚ_4`; `⊥` | `4 = 2·2`; `−(1+2ζ_3) ≢ 1 mod 4` so `i ∉ L`, roots `±θ`, `2 = 2·1`; `2 = 1·2`; `1 = 1·1` | holds |
| 1.2 weighted identity | one orbit of size `f/s`, `s = #Stab` | `(f/s)/(f·a) = 1/(s·a) = 1/#Aut_K` | holds |
| 1.3 `inf_maximalUnramifiedExtension` | `⊥`, `ℚ_2(i)`; `ℚ_4`; `K^ur` | `⊥ = K_1`; `ℚ_4 = K_2`; junk degree `0`, `K_0 = ⊥ ≠ K^ur` (`unramifiedExtension_zero` at the pin) | holds; finiteness needed |
| 1.3 orbit count | `ℚ_4`; `ℚ_2(∜−3)`; quartic `f = 2` | `1·2 = 2`; `2·2 = 4`; `6·1 + 4·2 = 14` | holds; equals the pinned theorem (C02) |
| `intermediateFieldInertiaDegree_eq_of_algEquiv` | finite; infinite | equal residue degrees; `0 = 0` | holds |
| 2.1 transport | `f = 1`; `e = 1`; `(2, 2)` over `ℚ_2` | Theorem 1; one field, `c = 0`, sum `1`; `14` fields | holds |
| 2.2 `tsum_inertiaDegree_eq` | `(2,1)`; `(1,2)` over `ℚ_2`; `(1,2)`, `p` odd; general | `1 = 1`; `2/4 + 4/8 = 1 = 2·2⁻¹`; `2/p`; `d(L/K) = f·d(L/K_f)`, `∑ q^{−f c} q^{−f(e−1)} = e q^{−f(e−1)}` | holds |
| 2.3 `splittingSymbol`, transitive mass | trivial set; `(2,1)`; `(1,2)`, `ℚ_2`; general | `n·{(1,1)}`; `1/2`; `1/2`; `(fe−1)!·e·q^{−f(e−1)}/(fe)! = q^{−f(e−1)}/f` | holds; `{(f,e)}` on `Fin (fe)` forces one orbit of degree `fe` |
| 3.1 `etaleMass_splittingSymbol` | `{(1,1),(1,1)}`; `{(1,2),(1,1)}`; `{(1,2),(1,2)}`; `∅`, `n = 0` | `1/2`; `(1/3!)·3·(2/q) = 1/q`; `3·(2/q)²/4! = 1/(2q²)`, also `½(1/q)²` by direct count of pairs; `1` | holds |
| 3.1 hypotheses | `σ = {(1,1)}`, `n = 2`; `σ = {(0,1)}`, `n = 0` | left `0`, right `1`; left `0`, right `1/0` | `hn`, `hσ` each needed |
| 3.2 `ramificationPartition`, mass | `{(2,2)}`; `{(1,3),(1,1)}`; `n = 4`, `π = (1,1)`; `π = ∅` | `(1,1)`; `(2)`; `1/2 + 1/2 = 1`; `∑_{λ ⊢ n} 1/z_λ = 1` | holds, mass `q^{−k}` |
| 3.2 bound on parts | `n = 3`, `k = 2`, `π = (1,1)`; `k ≥ n > 0` | no symbol of degree `3`, left `0 ≠ q⁻²`; `parts.card ≤ 0` forces `k = 0`, vacuous | `hπ` needed; never false |
| 3.2 centralizer route | parts of size `t`: `n_t = ∑_{e_i = t+1} f_i`; `n_0 = n − k − #parts` | `#Aut(σ) = ∏ f_i · ∏ mult! = ∏_t z_{λ_t}` | holds, `t = 0` included |
| 3.3 `etaleMass_eq` | `n = 0, 1, 2, 3, 4`; `k = n > 0` | `1`; `1`; `1 + q⁻¹` (`3/2` over `ℚ_2`); `1 + q⁻¹ + q⁻²`; `1 + q⁻¹ + 2q⁻² + q⁻³`; `q(n,0) = 0` | holds; agrees with kedlaya2007b line 44–57 (sum to `n`) |
| generality | README "every non-archimedean local field"; Lean `[IsNonarchimedeanLocalField K]`, `ℝ≥0∞` | equal; equal characteristic covered by `∑'` | consistent |

- Source locators checked against a text: Thm. 1.1 (statement, kedlaya2007b lines 44–57; wood2008 lines 27–43; yasuda2025 lines 22–32), the by-type refinement (kedlaya2007b lines 300–304; wood2008 line 168), the reduction through `K_f` (kedlaya2007b lines 205–242), the étale-algebra side (kedlaya2007b lines 158–197); the long-horizon sentences (kedlaya2007b lines 16–24, 305–316; wood2008 lines 14–23; yasuda2025 lines 9–10, 76).
- Library declarations opened at the pins (Tau Ceti `2fd255d`, Mathlib `1b1ccf4`): `Unramified/Existence.lean` 85, 111, 210, 386; `Unramified/Maximal.lean` 97, 298; `Unramified/Factorization.lean` 124, 142, 162; `Discriminant/Basic.lean` 142, 233, 269; `Discriminant/Tower.lean` 42; `InertiaDegree.lean` 75, 113; `FiniteExtension/IntermediateField.lean` 69, 75, 81; `MassFormula/Basic.lean` 168, 283; `MassFormula/Main.lean` 72; `MassFormula/Orbit.lean` 65; `FieldTheory/IntermediateField/Isomorphic.lean` 107; `AlgebraicGeometry/FiniteEtale/Galois/Basic.lean` 95; Mathlib `RingTheory/Etale/Field.lean` 194, `GroupTheory/Perm/Centralizer.lean` 696, `GroupTheory/Index.lean` 950, `FieldTheory/IsSepClosed.lean` 309, `FieldTheory/KrullTopology.lean` 134, `FieldTheory/AbsoluteGaloisGroup.lean` 17, `Combinatorics/Enumerative/Partition/Basic.lean` 52 and 201, `FieldTheory/IntermediateField/Basic.lean` 796.
- Cross-roadmap citations resolved: MassFormula on main (Layer 4 at README line 350; `Suggested.lean` lines 448, 467, 136, 248); LocalFieldsRamification on main (layers at lines 299, 367, 476: C01); PadicExtensionFamilies on main (consumer only).
- Dependency check output: `depcheck: 172 roadmaps, 1998 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean`, 16 `declaration uses sorry` and nothing else. One-tactic probe (`rfl`, `simp`, `infer_instance`, `simp` with every definition of the file) on a copy: none of the 16 closes. With the two Tau Ceti modules of C02 and C03 imported, the §1.3 orbit count closes by one `exact`. Elaborated types compared with the README: the four declarations that keep only `[Field K]` (`GaloisSet`, `GaloisSet.mulAction`, `GaloisSet.IsTransitive`, `homMulAction`) mention no local-field structure, as intended.
- Automatic checks: all pass except the note on `letI` in three statements, taken up as N01. The change touches only `README.md` and `Suggested.lean` of this folder.
- Headline theorems (`etaleMass_eq`, `etaleMass_splittingSymbol`, `etaleMass_ramificationPartition`, `tsum_etaleDiscriminantExponent`) are all stated; the module docstring says all are statable.
- Ownership: the search for "Galois set", the étale mass and splitting symbols over main and the indexed open pull requests finds no second owner; the categorical equivalence for finite étale schemes is Tau Ceti's (C04), and ArithmeticStatisticsPartV's "splitting symbol" is the global symbol of a prime in a cubic ring, a different object.

Overlap check: read MassFormula (main and its open revision), PadicExtensionFamilies (main), LocalFieldsRamification (main), FieldOfNorms and FilteredLocalGaloisGroups (open); shared objects: the discriminant exponent of a subextension and the totally ramified orbit count, owner MassFormula (cited); the classification by unramified part, owner this roadmap (PadicExtensionFamilies cites §§1.1–1.3); unramified extensions, residue degree, discriminant tower law, owner LocalFieldsRamification (cited); nothing shared with the other two.

Source independence: 6 passages compared with 3 sources (kedlaya2007b, wood2008, yasuda2025), none shared beyond the formula itself; largest share Bhargava 2007, 7 of 7 located citations; its text and contents could not be read, so wording and arrangement were not compared with it; contents compared with kedlaya2007b (§§3–4): independent.

Research link: The summit is the mass formula of Bhargava (2007), the local input to his heuristics for number-field discriminant densities; Kedlaya (2007) and Wood (2008) generalise it to other permutation groups, Yasuda (2025) to motivic versions. Rests on the README's references and on kedlaya2007b, wood2008 and yasuda2025 as read.

## Not verifiable

- Bhargava 2007 (IMRN rnm052): the publisher's page refuses access and no open or author copy was found; "Props. 2.1–2.3", "(2.1)–(2.4)" and "the Appendix" are unchecked. The statements are confirmed through kedlaya2007b, wood2008 and yasuda2025, and "Theorem 1.1" through arXiv 2006.12991 line 103.
- Serre 1978: no legal copy found; consumed through the mass formula roadmap and Tau Ceti's proved theorem, not re-read.
- The open revision of this folder by the same author (Layer 4) was read only for the conflict of C06.

## Source issues

- none

## For the human reviewers

- **Not tested.** Bhargava 2007 (IMRN rnm052) carries all seven located citations (README §§2.3, 3.1–3.3); neither its text nor its table of contents could be read, so wording and arrangement were not compared with it.
