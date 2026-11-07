# Review of HilbertModularVarietiesAndShimuraCurves (pull request #1005 at d3e151e)

**Verdict:** needs changes

🤖 Independent AI review: 8 findings, 1 P1, 4 P2, 3 P3. This is a full review of the head; the folder changed by 236 lines since 6084533. Below, README means `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md` and Suggested.lean the file beside it.

## Previous findings

The previous review (at 6084533) raised no findings, so nothing needs to be marked repaired. The r2 repairs it confirmed are in passages this head leaves unchanged: the R18.5.21 tower route, the R18.5.12a–c scope note, the catalogue residues, the locators and the Néron anchors. The §R18.5.17a Needs line did change, but it still links NeronModelsAndSemistableAbelianVarieties §4.2 and Layer 4.

## R01 (P1) — The gate's build check fails on Lake's module-system warning

**Location.** Suggested.lean:1–2, `import Mathlib` / `import TauCeti.RingTheory.IntegralOrder.Maximal`.

**Claim.** The acceptance build may emit only `sorry` warnings. The worker's gate records `build=2 FAIL` (gate rule `build`). The cause is the pin and toolchain bump that came in with the merge of main: Mathlib 1b1ccf4b, Tau Ceti 2fd255d9, Lean v4.36.0-rc2.

**Witness.** gate.md, build=2: Lake warns twice “imports `Mathlib` from package `mathlib`, which is designed for use with the module system”. `lake env lean` on the file exits 0 with five `sorry` warnings and nothing else.

**Repair.** Put `module` on line 1, change the imports to `public import Mathlib` and `public import TauCeti.RingTheory.IntegralOrder.Maximal`, and add `@[expose] public section` after the module docstring. TauCetiRoadmap/AffineMorseLefschetz/Suggested.lean:1–5, 35 on main uses the same form. I tested this on a scratch copy: it elaborates with only the five `sorry` warnings. The declaration-free file that R03, R04 and R06 lead to (header, `public import Mathlib`, docstring, `@[expose] public section`, empty namespace) elaborates with no output at all. After the change, rerun the targeted build.

## R02 (P2) — Citations of GL2AutomorphicRepresentationsAndTransfer §§R17.3.8a–R17.3.8d, which name no target at its head

**Location.** 27 lines: README:9 (“GL2AutomorphicRepresentationsAndTransfer owns the algebraic coefficient modules, the quaternionic level forms with their evaluation equivalence, the classical quaternionic forms and their Hecke operators”), and 32, 131, 2352, 2359, 2362, 2377, 2409, 2413, 2424, 2465, 2553, 2772, 2776, 2778, 2796, 2804, 2822, 2826, 2830, 2836, 2848, 2878, 2888, 2919, 2930, 3337.

**Claim.** Every carrier that the definite strand (R18.3.1–R18.3.8), the Eichler levels (R18.5.16a) and the Brandt normalization (R18.5.16c) cite is attributed to sections that the supplier itself redirects. The ownership sentence at README:9 contradicts that supplier's head.

**Witness.** GL2AutomorphicRepresentationsAndTransfer/README.md at #931, line 83, says the identifiers R17.3.8a–R17.3.8d name no target of that roadmap. Its lines 86–92 send them to QuaternionicModularForms §§1.3, 2.1, 2.2–2.3, 0.4 and 3.1, and the inverse-coset identity to its own R17.3.9.

**Repair.** Apply that resolution table, and restore a QuaternionicModularForms row and a contract paragraph under Exact supplier contracts:
- §1.3 for `L_{n,s}` and the determinant scalar.
- §2.1 for the level forms `M_D(U,A)`, evaluation, central characters and norms, together with AutomorphicFormsOnReductiveGroups §§7.4, 7.6.
- §§2.2–2.3 for the classical forms.
- §§0.4 and 3.1 for the Hecke operators, the opposite-ring law and `[Uη_v⁻¹U]=S_v⁻¹T_v` (QuaternionicModularForms README:1015 at #934).
- §0.2 for the levels `K₀`, `K₁` (its `U₀`, `U₁`).
- §0.3 for finiteness of `Cl(U)` at every open U.

Keep GL2AutomorphicRepresentationsAndTransfer R17.3.9 only for its inverse-coset and symmetric-power comparisons. Rewrite README:9 and the Dependencies lines 2553 and 3337 to match. QuaternionicModularForms is line 70 of the merge order and this roadmap is line 157, so the dependency check stays clean.

## R03 (P2) — §R18.5.16b, its three Lean theorems and §R18.5.16a item 4 restate QuaternionicModularForms §§0.2–0.3

**Location.** README:2379–2400 (§R18.5.16b), README:2359 (item 4, unit indices of `K₀`, `K₁`), Suggested.lean:106–144, and README:9 (“the fibres of class-set refinement maps”).

**Claim.** An earlier supplier already owns this object, and this roadmap plans it again.

**Witness.** QuaternionicModularForms/README.md at #934:
- Line 33 owns “the fibres of class-set refinement” (§0.3).
- Lines 353–381 state the same bijection, both counting formulas, the same three API bullets and the same S₃ and Hurwitz Checks.
- Lines 309–318 state the `U₀`, `U₁` indices.

QuaternionicModularForms is line 70 of the merge order.

**Repair.**
- Delete §R18.5.16b and the Lean theorems `exists_equiv_refinementFiber`, `card_doubleCoset_eq_sum_card_orbits` and `card_doubleCoset_eq_relIndex_mul`.
- Cite QuaternionicModularForms §0.3 in the proof route and Needs line of §R18.5.17a.
- Replace the unit indices in item 4 with a citation of its §0.2.
- Remove the refinement fibres from README:9.
- In §R18.3.3, cite its §2.1 “Central characters” (line 626) for extending the coefficient action to UZ by ψ, and keep only the factorization through `Γ_t` and the τ⁻¹ convention.

## R04 (P2) — Eichler orders, levels, right ideal classes and Brandt matrices have a second owner, QuaternionArithmetic, and the two hand Brandt matrices to each other

**Location.** README:9 (“For quaternion orders over every number field they are Eichler orders with their completed levels and right ideal classes, … and the neighbour ideals with their Brandt matrices”), §§R18.5.16a and R18.5.16c (README:2350–2378 and 2402–2424), and Suggested.lean:67–104.

**Claim.** The same objects are owned by two open roadmaps, and each hands the Brandt matrices to the other. Both `Suggested.lean` files declare the Eichler predicate.

**Witness.** QuaternionArithmetic at #1722:
- README §1.9 (line 660) states the Eichler local form, and §1.10 (line 692) the unit index.
- §§3.2 and 3.4 and Layer 7 cover right ideal classes and Brandt matrices.
- Suggested.lean:216 declares `IsEichler`.
- README:236–239 consumes this roadmap's R18.5.17a “integral Brandt matrices”.

**Repair.** Settle a single owner. QuaternionArithmetic also consumes this roadmap's R18.1 and R18.3.1, so it is placed after this roadmap. That leaves two options:
- **Keep the objects here.** Keep §§R18.5.16a and R18.5.16c. Say in Scope and ownership that QuaternionArithmetic §§1.9–1.10, 1.12, 3.2, 3.4 and Layer 7 cite them. Add QuaternionArithmetic under Downstream consumers. Agree with its author that its `IsEichler` and those sections become citations.
- **Move them to QuaternionArithmetic.** Move the general order theory there and remove its dependence on this roadmap, so that it precedes this one. Then cite it here and delete §§R18.5.16a, R18.5.16c and `IsEichlerOrder`.

Either way, exactly one Eichler predicate remains.

## R05 (P2) — Supplier anchors that open revisions of the suppliers drop

**Location.**
- README:2377: `../ClassicalArithmeticCompletion/README.md#layer-7-topic-4`.
- README:2424: `…#layer-7-topic-72`.
- README:3592: `AlgebraicTopology/README.md#stage-6-cohomology-products-and-manifold-duality`; README:44 and 99 also say “Stage 6”.

**Claim.** These links break when #1409 and #1652 merge.

**Witness.** At #1409's head, ClassicalArithmeticCompletion has no `layer-7-topic-*` anchor; its line 191 links `#772-ideles-and-lattice-gluing-for-an-arithmetic-order` instead. At #1652's head, AlgebraicTopology's lines 448–450 map each `stage-k-…` anchor to `layer-k-…`.

**Repair.**
- **ClassicalArithmeticCompletion.** Link `#74-orders-in-finite-dimensional-algebras` and `#772-ideles-and-lattice-gluing-for-an-arithmetic-order`. These heading anchors exist on main (lines 14393 and 16146) and at #1409's head. Keep the §§7.4, 7.72 text.
- **AlgebraicTopology.** Cite Layer 6, `#layer-6-cohomology-products-and-manifold-duality`, as it is at #1652's head, and name #1652 in the merge-order paragraph.

## R06 (P3) — Suggested.lean states intermediate order lemmas, not headline theorems

**Location.** Suggested.lean:11–14 and 65–144; README:183 (“It states the Eichler-order, local lattice-count and class-set refinement targets of §§R18.5.16a–R18.5.16b, whose carriers are pinned”).

**Claim.** The acceptance test states the roadmap's headline theorems, with only the definitions they need. These six declarations are statable infrastructure: they are not headlines, and `IsEichlerOrder` supports no headline. Their generality also exceeds the README's. The Lean states the local form and the lattice count over every DVR, while README:2356 and README:2359 speak of the completions `O_v`.

**Witness.** README:3 names the end theorems R18.5.15, R18.4.32–R18.4.33, R18.3.8 and H6.2–H6.8, and the inputs R18.5.7, R18.5.11, R18.5.12c, R18.4.29, R18.4.30 and H6.5. None of the sorried theorems is among them. In Voi21 (line 15277), “local” means a complete DVR.

**Repair.** Delete the six declarations, the Tau Ceti import and docstring lines 11–14; the README keeps the targets. Restore README:183's sentence that no headline is stated. If any declaration is kept, README items 1 and 4 must state the every-DVR generality; the Smith-normal-form proof gives it.

## R07 (P3) — The ℚ(√10) Brandt Check asserts what its own example refutes

**Location.** README:2419, “So every diagonal entry of `B(𝔭₂)` vanishes, and `s_{𝔭₂}` need not be the identity.”

**Claim.** The vanishing diagonal is right. The final clause suggests that this example has a nontrivial `s_{𝔭₂}`, and it does not.

**Witness.** Voi21 Example 41.3.16 (lines 31851–31852) treats the same F, D and a maximal order. There P(𝔭₂) is the identity, because 𝔭₂O=(1+i)O.

**Repair.** Replace the clause with: “here `s_{𝔭₂}` is the identity, since `𝔭₂O=(1+i)O`, so `B(𝔭₂)` is self-adjoint although `𝔭₂` is not principal; principality is sufficient, not necessary.”

Optionally, add the computed control below. I checked all of it:
- With four classes, `B(𝔭₂)=((0,0,0,3),(0,0,2,1),(0,3,0,0),(1,2,0,0))`, the transpose of Voight's matrix.
- Its rows sum to 3.
- Item 4 forces the weights (12,2,3,4).
- Their reciprocals sum to 7/6, which equals `2⁻¹ζ_F(−1)h_F` with `ζ_F(−1)=70/60`.

## R08 (P3) — The Zha14 link serves a different article

**Location.** README:4454, `…/cjm/2014/0002/0002/CJM-2014-0002-0002-a001.pdf`.

**Claim.** The locators are right, but the URL points to a different paper.

**Witness.** The linked a001 file is Bezrukavnikov–Finkelberg, “Wreath Macdonald polynomials …”, CJM 2(2), 163–190 (text lines 5–9). Zhang's article is the a002 file: Zha14 line 6 gives pp.191–253, §3.4 is at line 594, and (3.14)–(3.17) are at lines 629–650 (pp.208–209).

**Repair.** Change `a001` to `a002`. I fetched that file and confirmed it.

## Verified sound

**Validation.**
- **Head and diff.** Head is d3e151eff7387dd7944acd2bb59bb7fe17b0eebd. The diff outside the folder is empty. The folder holds README.md, Suggested.lean and metadata.toml (`topic = "math.NT"`).
- **Pins.** Mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e, Tau Ceti 2fd255d997f47c0b5d834ee416c7015d55444ce5, Lean v4.36.0-rc2.
- **Worker's gate.** Every rule except `build` passes. `build` fails (R01).
- **My rerun of the same gate command.** It reported every text rule at 0 and printed no `build` field, so the build verdict rests on the worker's gate.
- **Direct elaboration.** `lake env lean` on Suggested.lean: exit 0, five `sorry` warnings.
- **Dependency check.** Output, exactly: `depcheck: 240 roadmaps, 2463 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- **Worktree.** No tracked file was changed. One manifest file created by a source fetch was removed again: no manifest edited.

**Lean checks.**
- **Signatures.** `#check @` on all six declarations: each elaborated type matches its README statement, and no section binder was lost. `IsEichlerOrder` keeps `[IsScalarTower R F E]`; the five theorems carry their binders in their own signatures.
- **One-tactic probe.** I tried `first | rfl | simp | infer_instance | decide | exact?` on all five theorems. None closed, so none is padding by that test; R06 is about scope, not padding.
- **Module-header repair.** Tested as described in R01.

**Pinned declarations opened.**

| Declaration | File:line at the pin | What was checked |
| --- | --- | --- |
| `TauCeti.IntegralOrder.IsOrder` | TauCeti/RingTheory/IntegralOrder/Basic.lean:75 | It is `Submodule.IsLattice`: finitely generated, with F-span ⊤. The definition has no noetherian hypothesis. |
| `TauCeti.IntegralOrder.IsMaximalOrder` | TauCeti/RingTheory/IntegralOrder/Maximal.lean:67 | `Maximal (IsOrder F)`; `M₂(O)` is maximal over every DVR. |
| `TauCeti.IntegralOrder.leftOrder` | TauCeti/RingTheory/IntegralOrder/LeftOrder.lean:61 | The left multiplier subalgebra, as README:93 says. |
| `Submodule.IsLattice` | Mathlib/Algebra/Module/Lattice.lean:68 | Fields `fg` and `span_eq_top`. |
| `DoubleCoset.Quotient`, `DoubleCoset.mk` | Mathlib/GroupTheory/DoubleCoset.lean:79, 115 | The file has no fibre or counting lemma, so the refinement theorems are not in Mathlib. |
| `Subgroup.normalCore` | Mathlib/Algebra/Group/Subgroup/Basic.lean:724 | The core used in `card_doubleCoset_eq_relIndex_mul`. |
| `Subgroup.relIndex` | Mathlib/GroupTheory/Index.lean:62 | Its value is 0 at infinite index; the junk value is checked in the table. |
| `Subgroup.subgroupOf` | Mathlib/Algebra/Group/Subgroup/Map.lean:284 | `U ∩ x⁻¹Γx` as a subgroup of U. |
| `MulAction.orbitRel.Quotient` | Mathlib/GroupTheory/GroupAction/Defs.lean:349 | The orbit set of `Γ_x` on `U/U′`. |
| `IsRegularLocalRing` | Mathlib/RingTheory/RegularLocalRing/Defs.lean:52 | Checked for the R18.4.30 statability assessment. |
| `TauCeti.Algebra.flat_of_isCohenMacaulay` | TauCeti/RingTheory/RegularLocalRing/MiracleFlatness.lean:72 | Miracle flatness for algebras only. The module form used in R18.4.30 remains DeformationAndDerivedPatchingAlgebra §3.3. |

**Cross-roadmap citations resolved.**

| Citation | Where it resolves | Outcome |
| --- | --- | --- |
| ClassicalArithmeticCompletion §§7.4, 7.20, 7.21, 7.54, 7.55, 7.72, 7.78 | main README:14393, 14829, 14867, 15687, 15732, 16146, 16311; `OrderIdeles.completion`/`unit_change` at 16154–16155 | Resolve on main, and the contents match README:93. The anchors break at #1409 (R05). |
| AdelicAlgebraicGroups §5.3 *quaternion-class-sets*, *definite-quaternion-stabilizers*; §4.6 *quaternion-norm-images*; AA.4.2, AA.4.4 | #792 README:5496–5544, 5101–5119, 4282–4285, 4765–4767 | Resolve. At compact open level, `Z_x=F×∩U`, which is `O_F×` at `U=R̂×`, as item 7 says. |
| GL2AutomorphicRepresentationsAndTransfer R17.1.5 | #931 README:1462 | Resolves. |
| GL2AutomorphicRepresentationsAndTransfer R17.3.8a–d | #931 README:83–92 | Redirect stubs (R02). |
| QuaternionicModularForms §§0.2, 0.3, 1.3, 2.1, 3.1 | #934 README:307, 345, 499, 606, 1003 | These sections own the material (R02, R03). |
| QuaternionArithmetic §§1.9, 1.10, 1.12, 3.2, 3.4, Layer 7 | #1722 README:660, 685, 731, 968, 1012, 1486; Suggested.lean:216 | Second owner (R04). |
| AlgebraicTopology Stage 6 | main README:946; #1652 README:1575, 448–450 | R05. |
| `CanonicalModel.minimal_defined_over_reflex`, `LocallySymmetric.FrankeInput`, `SheafDerived.isoSingular`, `OrderIdeles.unit_change` | ShimuraVarieties #933 README:2746; ArithmeticLocallySymmetricSpaces #871 README:528, 832; ClassicalArithmeticCompletion main:16155 | Planned supplier names. They are not pinned declarations and are not claimed as such. |

Ownership was checked for the objects of the changed sections: Eichler orders, levels, class sets, refinement fibres, Brandt matrices, level forms, central characters and Hecke operators. I used `roadmaps grep` over main and the open heads, and the sibling checkouts of #934 and #1722. Only R03 and R04 surfaced.

**Sources (sampled targets and new locators).**

| Source | Locators read (`<id> line N`) | Conclusion |
| --- | --- | --- |
| Voi21 (author edition v1.0.5, linked from the author's page) | Def 23.4.1–Prop 23.4.3, lines 15523–15542; 23.4.11–23.4.14, 15699–15727; 23.4.19, 15768–15775; Lemma 26.4.1 and 26.4.3, 17923–17963; Lemma 26.6.7, 18251–18255; Lemma 27.6.8, 19225–19229; Ex 41.1.2, 31421–31437; 41.2.2–41.2.4, 31603–31615; Def 41.2.12, 31675–31680; Prop 41.3.1, 31709–31714; 41.3.4, 31738–31750; Ex 41.3.16, 31825–31852; 41.4.1 and Prop 41.4.3, 31865–31882 | The numbers and contents support R18.5.16a–c. The README's statement that Voight's matrices are transposes is correct: Voight's columns index the class whose sub-ideals are counted. The README's weighted relation is the function-side form of Voight's `T*=P(𝔫⁻¹)T`. |
| KW09 | §7 opening pp.57–59, lines 2640–2725, display (5) at 2722; §7.2 pp.61–62, 2832–2862; §7.4 p.65, line 3019 | Supports R18.3.1, R18.3.3 and R18.3.6 as written. |
| MS19 | Thm 6.5 and Remarks 6.6–6.7, p.34, lines 1700–1716; Thm 6.8 and proof, pp.34–35, lines 1718–1754 | Supports R18.4.32 and R18.3.8. The README correctly uses `F_+×` (see Source issues). |
| Tay06 | §1 pp.740–742, lines 535–612 | The weight modules `Symm^{k−2}⊗det^w` and their pairing support R18.3.2. |
| BC91 | Part III Thm 5.2, line 5091 (PDF p.145, printed p.140); §5.4, lines 5223–5309 (printed pp.144–146) | Supports R18.5.16, R18.5.17 and R18.5.17a. |
| Zha14 (a002 file) | §3.4, line 594; (3.14)–(3.17), lines 629–650, pp.208–209 | The locator is correct; the URL is wrong (R08). |

**Sample assignment.** The 15 seeded labels carry no section identifiers, so I assigned them as follows:
1. Theorem: R18.5.16a.
2. Definition: R18.5.16a.
3. Comparison: R18.3.6.
4. Definition: R18.5.16c.
5. Construction: R18.3.2.
6. Comparison: R18.5.16.
7. Definition: R18.3.1.
8. Theorem: R18.5.16b.
9. Construction: R18.5.17a.
10. Definition and comparison: R18.3.3.
11. Theorem: R18.5.16c.
12. Comparison: R18.5.17.
13. Theorem: R18.3.8.
14. Comparison: R18.5.17a, its comparison half.
15. Theorem: R18.4.32.

All 15 were checked against the sources above. No README locator is flagged as unverified.

**Headline theorems.** The end theorems are R18.5.15, R18.4.32–R18.4.33, R18.3.8 and H6.2–H6.8. The deep inputs are R18.5.7, R18.5.11, R18.5.12c, R18.4.29, R18.4.30 and H6.5. At the pins, no file matches Shimura variety or curve, Hilbert modular, Drinfeld half-plane, Čerednik, abelian-scheme or real-multiplication carriers. The docstring names each unstatable group and its missing carrier. The commutative-algebra lemmas inside R18.4.30 are statable, but they are proof lemmas, not headlines, and their general module form belongs to a supplier. No statable headline is missing.

**Adversarial pass.** Values were computed this round.

| Statement | Instances tried | Values on each side | Result; change |
| --- | --- | --- | --- |
| `IsEichlerOrder` / R18.5.16a Definition | `M₂(ℤ_p)`; `ℤ_p+pM₂(ℤ_p)` | `M₂=M₂∩M₂`, so it is Eichler. In `ℤ_p+pM₂`, every element is ≡ scalar mod p, so its only idempotents are 0 and 1, while `O₀` contains `diag(1,0)`. | Correct; second owner (R04) |
| Item 1 / `isEichlerOrder_iff_conj_standard` | `n=(0 1;ϖ 0)`; e=0; non-complete `ℤ_(2)` | `nXn⁻¹=(d, c/ϖ; ϖb, a)`, so `M₂(O)∩nM₂(O)n⁻¹=O₀(𝔭)`. At e=0 the right side is `M₂(O)`. Smith normal form needs only a PID. | True over every DVR; README says `O_v` (R06) |
| `ℤ_p+pM₂(ℤ_p)` Check | index | `p⁴/p=p³`, equal to `[M₂:O₀(p³)]=p³` | Correct, discriminating |
| Item 4 indices | K₀: q=2, e=1,2. K₁: q=2, e=2; q=3, e=1 | K₀: 3 and 2·3=6=#ℙ¹(ℤ/4). K₁: 4·3=12=16−4 primitive rows of (ℤ/4)²; 8 for q=3. | Correct; duplicated (R03) |
| `card_cyclicQuotient_submodule` | `ℤ_(2)`, t=1, 2; t=0 | t=1: 3 lines in 𝔽₂². t=2: 6. At t=0 the true count is 1 (only O²), but the formula gives `2⁰·3=3`, so `ht` is needed. | Correct with `ht` |
| Item 5, adjacent order | q=2 | `n²=diag(ϖ,ϖ)` is central; `nO₀(𝔭)n⁻¹=O₀(𝔭)`; `[R_r×:R′_r×]=3` | Correct |
| Item 6, ideal classes | central idele z | `I(xz)=D∩xR̂z=𝔞(z)I(x)` and `I(γxu)=γI(x)`, matching Voi21 27.6.8 and ClassicalArithmeticCompletion 7.78 | Correct |
| Item 8 and Hurwitz Check | Hurwitz order; level 3; disc 37 | 24 units give w=12. Level 3 gives 24/4=6 units, w=3. Masses 1/12 and 1/3 have ratio 4=3+1. Disc 37: h=3, type number 2. | Correct |
| R18.5.16b / `exists_equiv_refinementFiber` | S₃, `Γ=⟨(01)⟩`, `U′=⟨(12)⟩` | Cosets {e,(12)}, {(01),(012)}, {(02),(021)}. (01) swaps the first two; (01)(02)=(021) fixes the third. 2 orbits = 2 double cosets. | Correct; duplicated (R03) |
| `card_doubleCoset_eq_sum_card_orbits` | Hurwitz level 3; U′=U | SL₂(𝔽₃) is transitive on 4 points, giving 1=#Cl(U′). At U′=U every term is 1. | Correct |
| `card_doubleCoset_eq_relIndex_mul` | Γ=⊥; Hurwitz; infinite index | Γ=⊥: #(G/U′)=[U:U′]·#(G/U). Hurwitz: 4·1≠1, and the hypothesis fails. Infinite index: relIndex 0, infinite left side Nat.card 0, so 0=0. | Correct, including junk values |
| R18.5.16c Definition, neighbours | `M₂(O_v)`, q=3 | `ϖI⊊J⊊I` corresponds to lines of `k²`: 4=q+1. `det diag(ϖ,1)=ϖ` gives `nrd(J)=𝔭nrd(I)`. | Correct |
| p=23 Brandt Check | Φ₂ mod 23 at j=0, 1728≡3, 19 | `Φ₂(0,Y)=(Y+4)³` gives (0,3,0). `Φ₂(3,Y)` has roots 3, 19, 19, giving (1,2,0). `Φ₂(19,Y)=Y(Y²+Y+11)` has roots 0, 3, 19, giving (1,1,1). This is the transpose of Voi21 Ex 41.1.2. | Correct |
| Item 3, commutation | p=23, B(3) = transpose of Voigt's T(3) | `B(2)B(3)=B(3)B(2)=((2,8,2),(4,5,3),(3,9,0))`; row sums 12=3·4 | Correct |
| Item 4, weighted symmetry | p=23, w=(2,1,3) | `w₂B₁₂=2=w₁B₂₁`, `w₃B₂₃=3=w₂B₃₂`. BW is symmetric and WB is not. Σ1/w=11/6=22/12. | Correct |
| ℚ(√10) Check | Voi21 Ex 41.3.16 | The diagonal is 0. P(𝔭₂)=id. The weights are forced to (12,2,3,4), Σ1/w=7/6=2⁻¹·(7/6)·2. | Diagonal correct; s-clause (R07) |
| Item 2 normalization | `η⁻¹=ϖ⁻¹diag(1,ϖ)` | `Uη⁻¹U=ϖ⁻¹UηU`, which is `S_v⁻¹T_v` on `f(xy)` sums | Correct; misattributed (R02) |
| R18.3.1 | KW09 (6), (7); F=ℚ(√3) | `O_F×/(O_F×)²` has order 4; H[2]=1 since h=1 | Correct |
| R18.3.3 | z∈U∩Z | Read as u: `τ(z)⁻¹v=ψ(z)v`; read as z: `ψ(z)v`, so the two agree. The bad case (τ trivial, ψ(z₀)≠1) is excluded by the hypothesis. | Correct |
| R18.3.6 | q=2, trivial ψ, constants | `T_v` has 3 terms, giving 3; `S_v=1`; `X²−3X+2` has roots 1 and 2 | Correct (Eisenstein) |
| R18.3.2 | scalar a, n=2 | `det^{−n}(cz+d)^n` gives `a^{−4}a²=a^{−2}`, which is ¼ at a=2 | Correct central normalization |
| R18.5.17a | q=2, dart x→y | `n²=ϖ`; `a_*Ue=2y=2b_*e`; Zha14 (3.16)–(3.17) | Correct |
| R18.5.16, R18.5.15 | B of disc 6 at 2 | inv₂=inv₃=½, inv∞=0; the swapped algebra is ramified at {3,∞}; `M₂(ℚ)` has inv₂=0 and is excluded | Correct; not statable |
| R18.3.8 | ℚ(√3); MS19 Thm 6.8 | x²−3y²≡−1 mod 3 is impossible, so h⁺=2 and h=1; the norm image is `F_+×` | Correct; not statable |
| R18.4.32 | l=3 | \|SL₂(𝔽₃)\|=24, divisible by 3; the trivial image has 1; the l=5 clause is MS Thm 6.5(2) | Correct; not statable |
| R18.4.33 | `(1,0)` and `(λ,0)`: O→O² | Cokernels O (free) and O/λ⊕O (torsion) | Correct; not statable |
| H6.5, l=7 | x³−3x+1 | Values mod 7: 1,6,3,5,4,6,3, so no root. Roots mod 19: 3, 7, 9 (19, 323=17·19, 703=37·19). | Correct; not statable |
| H6.2–H6.8 | paired 𝔽₃ data | Sp₂(𝔽₃)=SL₂(𝔽₃), order 24, nonabelian | Not statable (paired torsion moduli) |

## Not verifiable

- **Voi21, printed pages.** The service refuses link.springer.com although the book is open access. I read the author's v1.0.5 edition, which notes that its pagination differs. Section numbers and contents match; the author edition's pages run 10–14 lower than the README's printed pages.
- **YZ18 §8.3 (R18.5.17).** Not reread this round.
- **Items carried from the previous review.** Its non-verifiable items (Dim05, Kur79, KL05, PRR23) lie outside this sample.

## Source issues

- **Error** in MS19 at Theorem 6.8, proof, internal p.35: the source factors through F×\A_f×/ν(H); it should use the totally positive F₊×, the reduced-norm image of a totally definite algebra; affects the proof.
