# Review of EtaleMassFormula (pull request #1820 at 3be13a5)

**Verdict:** accepted

**Summary.** Accepted: no finding. The mathematics of Layers 0–4 held on every instance computed, including Kedlaya's and Wood's formulas, the counting function, the fibre count, the recursion and the `D_4` values (`121/8` against `17`), which I recomputed from the roadmap's own formulas; `Suggested.lean` elaborates with its 23 `sorry` warnings only, and the six points of the previous review are repaired. There are five small corrections (a supplier contract that names layers LocalFieldsRamification does not have, one statement and two definitions the pinned Tau Ceti already provides, an uncited pinned equivalence, a Check that needs `n ≥ 1`) and three format notes, none blocking. For the humans: Bhargava's published article could not be read, so its numbering and wording were not compared.

## C01 — The LocalFieldsRamification contract names three layers that roadmap does not have

A reader who follows "Layer 2 (unramified extensions and Frobenius)", "Layer 3 (the discriminant)" and "Layer 0 (residue degree and the structure adapters)" in the supplier contracts (README lines 573, 586, 593) lands on other subjects. `Completed/LocalFieldsRamification/README.md` on main has exactly three layers: Layer 0 "complements on the native carriers" (line 299), Layer 1 "lower breaks of cyclic `p`-power extensions" (line 367) and Layer 2 "the Hasse–Arf theorem" (line 476); there is no Layer 3. What this roadmap consumes is listed there under "From Tau Ceti" (line 151) and "Names imported by other roadmaps" (line 591).

Every declaration the contract names is at the pin under the name and file given (list under *Verified sound*), so only the three labels need to change: drop them, or point to that roadmap's "Names imported by other roadmaps", keeping the three groups of Tau Ceti names.

## C02 — The orbit count of §1.3 closes in one step from the pinned theorem, so as a target it asks an implementer for nothing

`ncard_isomorphic_mul_natCard_algEquiv_eq_finrank` (`Suggested.lean` line 272) is proved by `exact IntermediateField.ncard_isomorphic_mul_natCard_algEquiv_of_isSepClosed K L (SeparableClosure K)` once `TauCeti.FieldTheory.IntermediateField.Isomorphic` is imported: on a copy of the file with that term in place of the `sorry`, the declaration elaborated and the count of `sorry` warnings fell from 23 to 22 (the theorem is at line 107 of `TauCeti/FieldTheory/IntermediateField/Isomorphic.lean` at the pin). The README (lines 221–222) and the docstring already say it is that theorem with `Ω = SeparableClosure K`.

§1.3 keeps its statement and already names the declaration. In the Lean file, either mark the theorem as a sanity check that the general theorem specialises to this carrier, or let it leave the file.

## C03 — Two definitions of `Suggested.lean` are definitions the pinned Tau Ceti already has

`homMulAction` (line 170) is `AlgEquiv.mulActionAlgHom` (`TauCeti/Algebra/GroupAction/AlgHom.lean` line 36, postcomposition on `L →ₐ[K] M`): with that module imported, `homMulAction K A = AlgEquiv.mulActionAlgHom` holds by `rfl` (checked on a copy). `intermediateFieldDiscriminantExponent` (line 57) has, line for line, the body of `IntermediateField.discriminantExponent` (`TauCeti/NumberTheory/LocalField/MassFormula/Basic.lean` line 168), as the module docstring says. An implementer who takes the file literally gets two copies of each object, and §0.4 does not name the first.

The smallest repair: name `AlgEquiv.mulActionAlgHom` in §0.4 and in the Tau Ceti contract; for the weight, either import `TauCeti.NumberTheory.LocalField.MassFormula.Basic` and use the library's definition, or keep the copy as it is (the docstring already explains it).

## C04 — §0.4 derives the correspondence between étale algebras and Galois sets without naming the pinned equivalence

The route for `tsum_etaleDiscriminantExponent` (README lines 141–146) builds the bijection from `Algebra.FormallyEtale.iff_exists_algEquiv_prod` "and the Galois correspondence", and the docstring appeals to "Grothendieck's Galois theory for étale algebras". The pinned Tau Ceti has that theorem on exactly this functor: `TauCeti.galoisFiber K Ω : (FiniteEtale K)ᵒᵖ ⥤ ContAction FintypeCat Gal(Ω/K)`, sending `A` to `A →ₐ[K] Ω` with the action by postcomposition, is an equivalence for `[IsSepClosed Ω] [IsGalois K Ω]` (`TauCeti/RingTheory/Etale/Galois.lean`, lines 277 and 467). Without the name an implementer may prove the classification again.

Add it to the *Needs* line of §0.4 and to the supplier contracts as an available input; the elementary route through the product decomposition may stay as the sketch.

## C05 — The last Check of §4.5 holds for `n ≥ 1` only

"`K = 𝔽_2((t))`, `m = 2`: infinitely many wreath Galois sets" (README line 495) leaves `n` free, and for `n = 0` there is exactly one wreath Galois set (the §4.1 Check says so). Write "for `n ≥ 1`", as the matching Check of §3.3 fixes `n = p`.

## N01 — Four theorem statements open an instance inside the statement

`GaloisSet.finrank_fixedField_stabilizer`, `GaloisSet.discriminantExponent_of_isTransitive`, `tsum_isTransitive` and `WreathGaloisSet.natCard_base_fibre` (lines 124, 145, 161, 484) write `letI := ρ.mulAction` inside the statement. The statements are right as they stand; a named definition for the fixed field of the stabilizer of a point of a Galois set would let all four, and `splittingSymbol`, be stated without it. Offered, not required.

## N02 — The *Needs* line of §4.3 omits §4.1 and §4.2

The fibre count is stated on the wreath carrier of §4.1 and on a Galois set over `L` of §4.2, but its *Needs* line (README line 427) lists only 0.2 and two Mathlib declarations.

## N03 — Line length

30 lines of the README exceed 100 characters (for example lines 373, 480 and 568, where an edit was appended to a wrapped line), and so do lines 74, 272 and 344 of `Suggested.lean`.

## Questions for the author

- The locator for the general local field changed in this revision from "§8" to "the Appendix" of Bhargava's article, and the References give the published numbering "Thm. 1.1, Props. 2.1–2.3, eqs. (2.1)–(2.4)". The article is behind the publisher's paywall and the two texts I could read cite it as "Theorem 1", "Proposition 1" and "Section 8.2" (wood2008 lines 44, 103, 168; kedlaya2007b line 42). Was the numbering read from the published text?
- `## Scope and ownership` hands "the archimedean mass" to the arithmetic statistics roadmaps. A search of those roadmaps, on main and open, for "archimedean mass" finds no statement of it. Which section owns it?

## Verified sound

The previous review's findings at this head. R01 (the build counted the module-system advisory as a failure): repaired, `Suggested.lean` lines 1–8 read `module` / `public import Mathlib` …, and elaboration gives `sorry` warnings only. R02 (supplier declarations cited by names and files absent at the pin): repaired, the pin is now Tau Ceti `2fd255d` and each exists where cited (`MassFormula/Main.lean` 72, `MassFormula/Orbit.lean` 65, `MassFormula/Basic.lean` 168 and 283, `FieldTheory/IntermediateField/Isomorphic.lean` 107). R03 (finite-dimensional Galois correspondence cited in §4.3): repaired, "Mathlib `InfiniteGalois.fixingSubgroup_fixedField`, `Subgroup.isClosed_of_isOpen`". R04 (two Lean names absent from the README): repaired, "(`WreathGaloisSet.mulAction`)" in §4.1 and "(`wreathTransitiveMass`, the base-transitive part of `wreathMass`)" in §4.4. R05 (a ⚠ marker and a claim about the source's text): repaired, "The unramified factors form the component `t = 0`: the statement needs `S_{n_0}` …". R06 (natural-number coefficients attributed to Wood): repaired, "a polynomial in `q^{−1}` with integer coefficients … The coefficients are natural numbers, because the generating function below is a product of binomial series".

Adversarial table (`x = q⁻¹`, `q` the residue cardinality; `d` the discriminant exponent; `M_n` the étale mass, `T_{m,n}` and `W_{m,n}` the transitive and total wreath masses; `B_m(y) = ∑_k q(k, m−k) y^k`).

| statement | instances | values computed on each side | result |
|---|---|---|---|
| 0.1 orbit weight | one point; `G/H`, `H` fixing `ℚ_2(i)`; countably many copies plus one | `d(⊥) = 0`; `2`; `∑ᶠ` on infinite support is `0`, so `0 ≠ 0 + 2` | holds; finiteness needed as the Check says |
| 0.2 Galois sets | `n = 0`; trivial hom; onto `S_2` with kernel fixing `ℚ_2(i)` | one element, weight `0`; `n` orbits of weight `0`; one orbit, weight `2`, degree `2` | holds |
| 0.3 mass, `tsum_isTransitive` | `n = 0, 1`; `n = 2` over `ℚ_2`, `g = q^{−d}` | `1`; `1 = 0!·1`; `1 + 2·2⁻² + 4·2⁻³ = 2 = 1!·2` | holds; `(n−1)!` labellings fixing the base point |
| 0.4 `tsum_etaleDiscriminantExponent`, `…_pi` | `n = 0`; `ℚ_2(i) × ℚ_2`; `n = 2` over `ℚ_2` | zero algebra `1 = M_0`; `2 + 0 = 2`; `1/2 + 1/2 + (2/4 + 4/8)/2 = 3/2` | holds |
| 1.1 classification | quadratic `ℚ_2`; cubic `ℚ_3`; quartic `ℚ_2`, `f = 2` | `6 + 1 = 7`; `9 + 1 = 10`; `14` ramified, `3` biquadratic `+ 3` cyclic stable, `4` swapped pairs, `10` orbits | holds |
| 1.2 `natCard_algEquiv_eq_mul` | `ℚ_2(ζ_12)`; `ℚ_2(∜−3)`; `ℚ_4`; `⊥` | `4 = 2·2`; `−√−3 ≡ 1 + 2ζ_3² mod 4`, not a square, so `2 = 2·1`; `2 = 1·2`; `1 = 1·1` | holds |
| 1.3 subfield form, orbit count | `⊥`, `ℚ_2(i)`, `ℚ_4`, `K^ur`; `ℚ_4`; `ℚ_2(∜−3)`; quartic `f = 2` | `K_1`, `K_1`, `K_2`, junk `K_0 = ⊥ ≠ K^ur`; `1·2 = 2`; `2·2 = 4`; `6·1 + 4·2 = 14` | holds; equals the pinned theorem (C02) |
| 2.1 Serre over `K_f` | `f = 1`; `e = 1`; `e = 2` over `ℚ_2` | Theorem 1; one field, sum `1`; `2·2⁻¹ + 4·2⁻² = 2` | holds |
| 2.2 `tsum_inertiaDegree_eq` | `(2,1)`; `(1,2)` over `ℚ_2`; `(1,2)`, `p` odd; general | `1`; `2/4 + 4/8 = 1 = 2/2`; `2/p`; `q^{−f(e−1)} ∑ (q^f)^{−c} = e q^{−f(e−1)}` | holds |
| 2.3 symbol, transitive mass | trivial set; `(2,1)`; `(1,2)` over `ℚ_2`; general | `n·{(1,1)}`; `1/2`; `1/2`; `(fe−1)!·e·q^{−f(e−1)}/(fe)! = q^{−f(e−1)}/f` | holds; equals kedlaya2007b (4.0.1) |
| 3.1 `etaleMass_splittingSymbol` | `{(1,1),(1,1)}`; `{(1,2),(1,1)}`; `{(1,2),(1,2)}`; `σ = {(0,1)}` | `1/2`; `x`; `3·(2x)²/4! = x²/2`; left `0`, right `1/0` | holds; `hσ` needed |
| 3.2 `etaleMass_ramificationPartition` | `n = 4`, `π = (1,1)`; `π = ∅`, `n = 2`; `n = 3`, `k = 2`, `π = (1,1)` | `1/2 + 1/2`, mass `x²`; `1/2 + 1/2 = 1`; no symbol, left `0 ≠ x²` | holds; `hπ` needed |
| 3.3 `etaleMass_eq` | `n = 0, 1, 2, 3, 4` | `1`; `1`; `1 + x`; `1 + x + x²`; `1 + x + 2x² + x³`; term `k = n > 0` is `0` | holds; agrees with kedlaya2007b lines 44–57 |
| 4.1 counting function | base orbit `L`, fibre `M/L`; `L = ℚ_2(i)`, `M = L × L`; `m = 1`; `n = 0, 1` | share `m·d(L) + f·d(M/L) − (m−1)d(L) ≥ 0`; `4 − 2 = 2`; `c = d(X)`, `W_{1,n} = M_n`; `1`, `M_m` | holds; subtraction exact; equals wood2008 (5) and kedlaya2007b Lemma 8.4 |
| 4.1 wrong models of `c` | `d(X) − m·d(Y)`; `d(X)` alone | `0 ≠ 2` on `L × L`; `D_4` over `ℚ_2`: `121/8` against `17` | both excluded by Checks |
| 4.2 `tsum_relativeGaloisSet` | `L = ⊥`; `m = 0`; `m = 2`, `L = ℚ_2(i)`; `L = ℚ_4` | `M_m(K)`; `1`; `d_K = m·d(L) + f·d_L`, `1/2 + (1/2)·2 = 3/2 = 1 + 2⁻¹`; `1 + 4⁻¹ = 5/4` | holds; `[FiniteDimensional K L]` in scope |
| 4.3 `natCard_base_fibre` | `n = 1`; `m = 1`; `m = n = 2`; general | `1`; `1`; `2`; cocycle count: orbit `|A|^n/|C(χ)|` over class `|A|/|C(χ)|` gives `(m!)^{n−1}` | holds; kernel contains the core of `ker χ` |
| 4.4 `wreathTransitiveMass_eq` | `m = 2`, `n = 1, 2`; `m = 1`; `n = 0` | `1 + x`; `1/2 + x + (3/2)x²` (`11/8` at `q = 2`); `∑_{f∣n} x^{n−f}/f`; left `1`, right `0` | holds; `hn` needed; equals kedlaya2007b (8.5.2) |
| 4.4 normalisation | `(m!)^{n−1}·m!·(n−1)!·∑_f (n/f) x^{n−f} B_m(x^f)` over `(m!)^n n!` | `∑_f (1/f) x^{n−f} B_m(x^f)` | matches |
| 4.5 `wreathMass_recursion` | `m = 2`, `n = 2, 3`; `n = 0` | `2W_2 = (1+x)² + 1 + 2x + 3x²`; `3W_3 = 3 + 6x + 12x² + 9x³`; `0 = 0` | holds; `C(n−1,k−1) k!(n−k)!/n! = k/n` |
| 4.5 `wreathMass_two` | `n = 1, 2, 3` | `1 + x`; `x + (1+x) + 2x² = 1 + 2x + 2x²`; `3x³ + 2x² + (x + x²) + (1 + x + x²) = 1 + 2x + 4x² + 3x³` | both routes agree; equals kedlaya2007b (8.6.1) |
| 4.5 proof route | `t_k = σ(k) x^k/k`; `T_{2,k} − T_{1,k}` | `∑_{f∣k} x^k/f` on both sides | Euler's recursion and Leibniz suffice |
| 4.5 `exists_wreathMass_eq_aeval` | `∑_k T_{m,k} y^k`; `m = 1, 2`; coefficients | `−∑_{k<m} q(k,m−k) ∑_e log(1 − y^e x^{e−1+k})`; Bhargava's and Kedlaya's products; exponents `e−1+k ≥ 0` | holds, coefficients in `ℕ` |
| 4.5 `D_4` Checks | `8·W_{2,2}`; weight `d(X)` over `ℚ_2`; odd `q` | `8 + 16x + 16x²`; `T' = 49/64`, `8·(9/4 + 49/32)/2 = 121/8`; `8 + 8x + 16x² + 8x³`, `17` at `q = 2` | agree with wood2008 lines 416, 474, 478 |
| `wreathMass_one` | `m = 1` | fibre condition vacuous, `c = d(X)`, normalisation `n!` | holds; a comparison of carriers that §4.5 uses, not padding |
| generality | README "every non-archimedean local field", `m ≥ 1` | Lean `[IsNonarchimedeanLocalField K]`, `[NeZero m]`, sums in `ℝ≥0∞` | equal |

- Source locators checked against a text: kedlaya2007b (arXiv v4) Thm. 1.1 (lines 44–57), Def. 2.2 (110–116), Lemmas 3.1–3.4 (158–195), (4.0.1) (205–242), Lemmas 8.2–8.4 (454–471), Thm. 8.5 with (8.5.1)–(8.5.2) (472–546), Remark 8.6 (549–587), Props. 9.2–9.3 (602, 644), Thm. A.7 (774); wood2008 (arXiv v1) Thm. 1.1 (99–100), the definition of a mass formula (58–84), Thm. 2.1 with (4)–(5) and the Remark (174–227), Lemma 2.2 with (6) (228–242), (7) (243–281), (8) (386–390), §5 (401–479).
- Library declarations opened at the pins (Tau Ceti `2fd255d`, Mathlib `1b1ccf4`): `Unramified/Existence.lean` 85, 210, 386; `Unramified/Maximal.lean` 97, 298; `Unramified/Factorization.lean` 124, 142, 162; `Discriminant/Basic.lean` 142, 233, 269; `Discriminant/Tower.lean` 42; `InertiaDegree.lean` 75, 113; `FiniteExtension/IntermediateField.lean` 69, 75, 81, 97; `MassFormula/Basic.lean` 168, 283; `MassFormula/Main.lean` 72; `MassFormula/Orbit.lean` 65; `FieldTheory/IntermediateField/Isomorphic.lean` 87, 107; `Algebra/GroupAction/AlgHom.lean` 36; `RingTheory/Etale/Galois.lean` 277, 467; Mathlib `RingTheory/Etale/Field.lean` 194, `GroupTheory/Perm/Centralizer.lean` 696, `GroupTheory/Index.lean` 950, `FieldTheory/Galois/Infinite.lean` 143, `Topology/Algebra/OpenSubgroup.lean` 298, `Combinatorics/Enumerative/Partition/GenFun.lean` 56 and 170, `Partition/Basic.lean` 52, `FieldTheory/IsSepClosed.lean` 309, `FieldTheory/IntermediateField/Basic.lean` 796, `FieldTheory/AbsoluteGaloisGroup.lean` 17.
- Cross-roadmap citations resolved: MassFormula on main (`### Layer 4: the mass formulas`, README line 350; `Suggested.lean` lines 448, 467, 248) and at its open revision (Layer 4 kept, Bhargava handed to this roadmap); LocalFieldsRamification on main (layers at lines 299, 367, 476: C01); PadicExtensionFamilies on main, a consumer of §§1.1–1.3 only.
- Dependency check output: `depcheck: 172 roadmaps, 1998 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 23 `declaration uses sorry` and nothing else. One-tactic probe on a copy (`rfl`, `simp`, `infer_instance`, `simp` with the mass definitions unfolded): none of the 23 closes; the §1.3 orbit count closes by one `exact` from the pinned theorem (C02). Elaborated types of all 47 declarations compared with the README: the nine that keep only `[Field K]` are carriers and actions whose types mention no local-field structure, as intended; every theorem keeps its binders (`[FiniteDimensional K L]`, `[NeZero m]`, `hn`, transitivity). Nothing changed.
- Automatic checks: all pass except the note on `letI` in four statements, taken up as N01. The pull request changes only `README.md` and `Suggested.lean` of this folder; no layer or item of the README on main is removed or renumbered (Layers 0–3 compared item by item with the merge base).
- Headline theorems (`etaleMass_eq`, `etaleMass_splittingSymbol`, `etaleMass_ramificationPartition`, `tsum_etaleDiscriminantExponent`, `wreathMass_two`, `exists_wreathMass_eq_aeval`) are all stated; the module docstring says all are statable. The description of the pull request agrees with the head (a revision adding Layer 4, stacked on #1818, 23 `sorry` warnings, nothing removed).
- Ownership: a search of main and the indexed open pull requests for the wreath carrier, the wreath mass, Kedlaya's and Wood's formulas, Galois sets, the étale mass and splitting symbols finds no second owner; the hyperoctahedral group appears elsewhere only as a group.

Overlap check: read MassFormula (main and its open revision #1819), PadicExtensionFamilies (main), LocalFieldsRamification (main), FieldOfNorms and FilteredLocalGaloisGroups (open); shared objects: the discriminant exponent of a subextension, Serre's formula and the totally ramified orbit count, owner MassFormula (cited); the classification by unramified part, owner this roadmap (PadicExtensionFamilies cites it); unramified extensions, residue degree and the discriminant tower law, owner LocalFieldsRamification (cited); nothing shared with the other two. The sibling pull request #1818 changes this folder; this branch contains it, the description says so, and the two heads merge cleanly.

Source independence: 7 passages compared with 2 sources (kedlaya2007b, wood2008), none shared beyond formulas; largest share wood2008, 9 of 18 bracketed citations; contents compared with wood2008 (§§1–5) and kedlaya2007b (§§3–4, 8): independent. Bhargava 2007 could not be read; wording and arrangement were not compared with it.

Research link: The summit of Layer 3 is the mass formula of Bhargava (2007), the local input to his density heuristics for number-field discriminants; Layer 4 states its extensions by Kedlaya (2007) to `W(B_n)` and Wood (2008) to `S_m ≀ S_n`. Rests on the README's references and on kedlaya2007b and wood2008 as read.

## Not verifiable

- Bhargava 2007 (IMRN rnm052): the publisher's page refuses access and no open or author copy was found; "Props. 2.1–2.3", "(2.1)–(2.4)" and "the Appendix" are unchecked. Its statements are confirmed through kedlaya2007b (Thm. 1.1, Remark 4.1) and wood2008 (lines 27–43, 168).
- Serre 1978: not re-read; consumed through the mass formula roadmap and Tau Ceti's proved theorem.
- Ownership against open pull requests was checked over the indexed pull requests only.

## Source issues

- none

## For the human reviewers

- **Not tested.** Bhargava 2007 (IMRN rnm052) carries the located citations of README §§2.3 and 3.1–3.3; neither its text nor its table of contents could be read, so wording and arrangement were not compared with it.
