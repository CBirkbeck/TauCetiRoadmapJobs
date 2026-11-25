# Review of LieGroups (pull request #3119 at 19032d8)
Folder: `TauCetiRoadmap/RepresentationTheory/LieGroups/`
**Verdict:** needs changes

**Summary.** A review of the change against `main`: 149 changed lines since `3496bd2`. I checked the new §4.3 paragraph, all of §4.4, the corrected §4.1 Check and the three new Lean statements against computed examples, against the pinned libraries, by elaboration and with the dependency check. The new statements and Checks are mathematically sound, but the §4.3 coreflection is stated on a category of Lie groups, a category of Lie algebras and a Lie functor that exist neither at the pins nor as targets of any layer (R01, P1), and §4.4 cites four Tau Ceti lemmas the pin lacks and gives a false reason for its second-countability hypothesis (R02, P2). There are three small corrections and five format notes (one on untouched text), and nothing is left for the human reviewers to decide.

## R01 (P1) — The §4.3 coreflection is stated on categories and a functor that neither the pins nor any layer provide

An implementer at the pinned Mathlib and Tau Ceti cannot write down `Γ ⊣ TauCeti.LieGroupCat.lieFunctor`. The paragraph presents its carriers as existing library declarations, no layer plans them, and no supplier is named for them. At the pinned Mathlib there is no `FGLieAlgCat`, and `Algebra/Category/` has no category of Lie algebras at all. The pinned Tau Ceti has none of `TauCeti.LieGroupCat`, `TauCeti.LieGroupCat.lieFunctor`, `TauCeti.LieGroupCat.isSimplyConnected.FullSubcategory`, `TauCeti.Lie.lieMapEquiv` or `LieHom.integrate`: I searched both trees for each name. The README's Tau Ceti contract says that every declaration it lists is proved at the pin, and it lists none of these. Yet §4.3 describes the hypotheses of the missing bijection ("`TauCeti.Lie.lieMapEquiv` assumes second-countable source and target", line 695). It fixes the universes because "the integration API takes models in `Type`" (line 707). The module docstring of `Suggested.lean` calls it "the pinned `TauCeti.Lie.lieMapEquiv`" (line 35). The mathematics itself holds: I checked the adjunction, the unit and the counit at `L = ℝ` and at `H = Circle`, `ℤ/2` and `O(2)` (table below).

The smallest repair is to make the carriers targets of §4.3, in prose with proposed names. They are the category of finite-dimensional real Lie groups and smooth homomorphisms, the category of finite-dimensional real Lie algebras, and the Lie functor between them, built from §3.1's `lieMap`, `lieMap_id` and `lieMap_comp`, which are at the pin. Take the hom-set bijection from this section's `exists_monoidHom_of_lieHom` together with §3.2's `lieMap_injective`, and either give the universe choice a reason that does not rest on the missing API or drop it. In the docstring, say that the adjunction is not statable because the pins have neither category nor the functor, and drop "pinned".

## R02 (P2) — §4.4 cites four Tau Ceti lemmas that the pin lacks and gives a false reason for its second-countability hypothesis

A reader who looks for the route's inputs at the pin finds none of them. The false reason also puts a hypothesis on all three new Lean statements that the pinned definition does not need.

The names `LieSubalgebra.lieSubalgebraOfSubgroup_integralLeafSubgroup` (line 731), `LieSubalgebra.integralLeafSubgroup_eq_closure_lieExp_image` (lines 734, 753), `TauCeti.Lie.integralLeafSubgroupOrderIso` (line 736) and `lieSubalgebraOfSubgroup_map_conj` (line 766) occur nowhere in the pinned Tau Ceti. There, the only declarations about the integral leaf subgroup are in `TauCeti/Geometry/Lie/InvariantVectorField/Foliation.lean`: the definition, its carrier, its membership lemma and its path-connectedness. That file says that the immersed structure on the leaf is work still to be done. The pull request's description itself attributes the order isomorphism to a pull request of the Tau Ceti library. Separately, the sentence "Throughout this section `G` is second-countable, the hypothesis under which Tau Ceti constructs the integral leaf subgroup" (line 720) is false at the pin. `LieSubalgebra.integralLeafSubgroup` (Foliation.lean, line 156) assumes only a finite-dimensional model and `LieGroup I ∞ G`, and the README's own contract (line 2346) lists it with no such hypothesis.

The smallest repair is to replace each name by the statement it stands for, as a step of this roadmap:
- the identity `lieSubalgebraOfSubgroup (integralLeafSubgroup 𝔥) = 𝔥` is where §4.1's route ends. It is statable at the pin, and declaring it in `Suggested.lean` beside the Galois connection would state the coinsertion as well as the connection;
- generation of the leaf by `lieExp 𝔥` follows from §4.1's leaf topology and §3.2;
- the order isomorphism is §4.1's bijection;
- `lieSubalgebraOfSubgroup (g K g⁻¹) = Ad g (lieSubalgebraOfSubgroup K)` follows from `TauCeti.Lie.conj_lieExp` and §2.1.

For the hypothesis, either give it a reason that holds at the pin or drop it. The three statements remain true without it, since every leaf lies in the second-countable `G⁰`. A copy of `Suggested.lean` with `[SecondCountableTopology G]` and `[SecondCountableTopology G']` deleted elaborates with only the `sorry` warnings.

## C01 — §4.4 states its three results without a source locator

Every other target of Layer 4 carries a locator, so a reader cannot tell where the normal-subgroup criterion or the range formula is proved. Three locators would do:
- Kirillov, online author copy, Thm. 3.19(2), p. 26 (kirillov2008 lines 870–876) states the normal-subgroup criterion for closed subgroups. Its converse omits that `G` is connected, which this section's Check on `ℝ² ⋊ ℤ/2` shows is needed.
- Knapp, Ch. I, §10, p. 72 (knapp2002 lines 3360–3362) states that the image of a smooth homomorphism is an analytic subgroup, which is the range formula.
- Neeb, Rem. II.6.5(b) and Problem IV.1 (neeb2015 lines 1925, 3337–3341) identifies `integralLeafSubgroup (lieSubalgebraOfSubgroup Q)` with the arc-component of `Q`, through Yamabe's theorem.

Adding them, with a clause on Kirillov's missing hypothesis, would be enough.

## C02 — Two of the three new Lean declarations are not named in the README

`map_integralLeafSubgroup` and `normal_iff_exists_lieIdeal` are declared in `Suggested.lean` (lines 157 and 170), but §4.4 states naturality (line 749) and the normal-subgroup criterion (line 763) without naming them. A reader therefore cannot go from the prose to the formal statement, as they can for the Galois connection (line 725). "Prove `map_integralLeafSubgroup`: …" and "prove `normal_iff_exists_lieIdeal`: …" at those two places would do it.

## C03 — The description repeats the second-countability reason that the head's contract contradicts

The description says: "§4.4 states its second-countability hypothesis, under which Tau Ceti builds the integral leaf subgroup, and says to remove it through the identity component." The contract at line 2346 lists `LieSubalgebra.integralLeafSubgroup` with no such hypothesis, and so does the pin (R02). After the repair of R02, the sentence would follow the new text, for example "§4.4 states its results for every finite-dimensional real Lie group". After the repair of R01, the same applies to "The hom-set bijection is `TauCeti.Lie.lieMapEquiv`".

## N01 — The `haveI` in the statement of `map_integralLeafSubgroup` (line 164) is redundant

The section's local instance (line 153) already applies to `G'`, and the file elaborates with that line deleted. Deleting it leaves no inlined instance term in the statement.

## N02 — The new Layer 4 bullet in the module docstring of `Suggested.lean` stands before the Layer 3 bullet and is set off by a blank line

This is at lines 33–36. It would read better after the Layer 3 bullet, with no blank line between bullets.

## N03 — The Needs line of the normal-subgroup paragraph (line 772) omits §3.2

The converse uses the fact that a connected `G` is generated by exponentials, which is §3.2.

## N04 — `conj_lieExp` and `hasDerivAt_Ad_lieExp_smul_apply_zero` (lines 766, 768) are written without their namespace

Both are `TauCeti.Lie.` declarations, and §2.1 writes the second one in full.

## N05 — Untouched text: README, References (lines 2522–2526): Serre and Varadarajan are listed but cited nowhere above

This was the previous review's format note, and it still holds. It would be fixed by citing them where they are used or by dropping the two entries.

## Previous review

The previous review (of `618e56b`, a different pull request) had no findings. Its remarks stand as follows:
- C01 (CotangentLagrangian C2.0 and C2.1): repaired outside this folder. CotangentLagrangian on main now has a former-numbering paragraph ("C2.0, C2.1 and C2.2 are now §2.0, §2.1 and §2.2", its README lines 1274–1277), so the citations at lines 1448, 1459, 1689, 1957 and 1961 resolve.
- C02 (a sentence of that pull request's description): not applicable to this pull request.
- N01 (Varadarajan and Serre cited nowhere): not repaired. It is untouched text and is carried as N05.

## Verified sound

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| §4.4 Galois connection `gc_integralLeafSubgroup_lieSubalgebraOfSubgroup` | `𝔥 = 0`; `𝔥 = ℝ²`, `Q` the dense line in `(ℝ/ℤ)²`; `𝔥 = ℝ`, `Q = ℚ` | `{1} ≤ Q`, `0 ≤ 𝔮` both true; `T² ≰ Q`, `ℝ² ≰ ℝ(1,√2)` both false; `ℝ ≰ ℚ`, `ℝ ≰ 0` both false | sound |
| Coinsertion identity `lie(leaf 𝔥) = 𝔥` (R02) | `𝔥 = ℝ(1,√2)` in `(ℝ/ℤ)²` | leaf is the dense line, its one-parameter subgroups give `ℝ(1,√2)`; a closure-based leaf would give `ℝ²` | sound; named lemma absent at pin |
| Joins preserved (Check) | Heisenberg `X = E₁₂`, `Y = E₂₃`; `(ℝ/ℤ)³`, directions `(1,√2,0)`, `(0,1,√3)` | product set `[[1,t,ts],[0,1,s],[0,0,1]]` has dim 2, join `H₃` dim 3; plane ∩ `ℤ³ = 0` (`1, √2, √3` independent), dense, closure `T³` | sound |
| Meets preserved for arbitrary subgroups (Check) | circles `(t,0)`, `(t,2t)` in `(ℝ/ℤ)²`; empty family | intersection `{(0,0), (1/2,0)}`; `ℝ(1,0) ∩ ℝ(1,2) = 0`, meet `{1}`; `lie(G) = 𝔤` | sound |
| Naturality `map_integralLeafSubgroup` | `φ : ℝ → Circle`, `t ↦ e^{it}`, `𝔥 = ℝ`; `φ` trivial | `φ(ℝ) = Circle = leaf(Lie Circle)`; both sides `{1}` | sound |
| Range formula, connected source (Check) | `id` on `SU(2)`; `id` on `ℤ/2` | `SU(2) = leaf(𝔰𝔲(2))`; `ℤ/2 ≠ {1} = leaf(0)` | sound; connectedness needed |
| `K.map φ ≤ Q' ↔ K ≤ leaf(comap)`; `(φ⁻¹Q')⁰` | `φ(x,y) = x`, `Q' = ℤ`; `K = ℝ×0`, `0×ℝ` | `ℝ ≰ ℤ` and `ℝ×0 ≰ 0×ℝ`; `{0} ≤ ℤ` and `0×ℝ ≤ 0×ℝ`; `(ℤ×ℝ)⁰ = 0×ℝ` | sound |
| `normal_iff_exists_lieIdeal` | `SU(2)` diagonal circle; `ax+b` group; `ℝ² ⋊ ℤ/2` | `[H,E] = 2E ∉ ℝiH`, not normal; translations ideal and normal, dilations (`[B,A] = −B`) neither; ideal, not normal, `G` disconnected | sound; hypothesis in Lean |
| §4.3 coreflection `Γ ⊣ Lie` (R01) | `L = ℝ`; `H = Circle`, `ℤ/2`, `O(2)` | `Hom(ℝ, S¹) ≅ ℝ ≅ Hom(ℝ, ℝ)`; counits `ℝ → S¹`, `{1} ↪ ℤ/2`, `ℝ → SO(2) ↪ O(2)` | mathematics sound; carriers absent |
| §4.1 corrected Check | `K = {1}` and `K = SL₂(ℤ)` without connectedness | both Lie algebras `0`, so `K ↦ lie K` fails injectivity; `𝔥 ↦ leaf 𝔥` injective regardless | corrected sentence true |
| §4.4 second-countability reason (R02) | pinned `Foliation.lean` line 156 | binders: finite-dimensional model, `LieGroup I ∞ G`; no countability; Lean statements elaborate without it | false at pin |

- **Source locators read** (8): kirillov2008 Thm. 2.8 (lines 234–236), Thm. 3.19 (870–877), Thm. 3.38 (1113), Thm. 3.43 (1137–1138), Cors. 3.49–3.50 (1223–1234); knapp2002 Ch. I §10, p. 72 (3360–3362); neeb2015 Rem. II.6.5(b) (1925), Problem IV.1 (3337–3341). Seeded targets 4.3 and 4.4 lie in the change; §4.4 has no locator (C01).
- **Library declarations opened at the pin** (9): `LieSubalgebra.integralLeafSubgroup` (`Geometry/Lie/InvariantVectorField/Foliation.lean` 156), `TauCeti.Lie.ImmersedLieSubgroupData` and `IsImmersedLieSubgroup` (`Subgroup/Immersed/Basic.lean` 59, 161), `TauCeti.Lie.lieSubalgebraOfSubgroup_inf` (`Subgroup/LieAlgebra.lean` 370, closed hypotheses), `TauCeti.Lie.hasDerivAt_Ad_lieExp_smul_apply_zero` (same file, 180), `LeftInvariantDerivation.Ad_lieExp` (`Adjoint/Exponential/Formula.lean` 292), `TauCeti.Lie.conj_lieExp` (`Adjoint/Exponential/Basic.lean` 110), `map_lieExp` (`Geometry/Lie/Functor.lean` 315), `TauCeti.Lie.isEmbeddedLieSubgroup_of_isClosed` (`Subgroup/Embedded.lean` 157); Mathlib `LieSubalgebra.map_le_iff_le_comap` (`Algebra/Lie/Subalgebra.lean` 605). Absent at the pins: the eleven names of R01 and R02.
- **Cross-roadmap citations:** the change adds none. No roadmap on main or at an open head names any of the eleven missing declarations.
- **Dependency check:** `depcheck: 121 roadmaps, 1392 edges, 0 problem(s)`; no UPWARD or CYCLE line. The pull request changes only the two files of the folder.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives 24 `sorry` warnings and nothing else (21 before, plus 3 new). I ran `#check @` on the three new declarations and compared each with §4.4: the statements agree, and each carries `[SecondCountableTopology G]` (and `G'`) and `[I.Boundaryless]`.
- **One-tactic probe:** `rfl`, `simp`, `infer_instance` and `exact le_rfl` each fail on all three new theorems. None is padding.
- **Headlines:** the overview's headlines are unchanged. The three new §4.4 statements are stated. The §4.3 adjunction is named in the docstring as not statable, with an incomplete reason (R01).
- **Automatic checks:** one hit, the `haveI` in a statement (N01).

Overlap check: read LieGroupsPartII and RealSemisimpleLieGroups on main, the ownership lines of DifferentialGeometry, and CompactGroupsPartII, ReductiveGroups, QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups, HamiltonianReduction and AutomorphicFormsOnReductiveGroups at their heads, searching for integral subgroups, the Galois connection, normal subgroups versus ideals, and categories of Lie groups. DifferentialGeometry owns Frobenius and leaves and assigns the Lie-specific integration theorems to LieGroups. Nothing in §4.3 or §4.4 is shared.

Source independence: changed passages only. I compared 7 passages with 3 sources (kirillov2008, knapp2002, neeb2015): the §4.3 coreflection, the three §4.4 paragraphs, the §4.1 Check and two docstrings. They share nothing beyond forced terms. The change adds no locator, so the largest share stays with kirillov2008, 14 of about 59 locators. No layer was added, removed or reordered (§4.4 is a new section inside Layer 4), so the contents comparison of earlier reviews stands (independent).

Research link: §4.4's right adjoint `Q ↦ lieSubalgebraOfSubgroup Q` and its interior operator are the finite-dimensional case of Neeb's Problem IV.1 (2006), settled there by Yamabe's theorem; §7.3 is the construction Heins (2025, Prop. 2.1) uses; RealSemisimpleLieGroups and LieGroupsPartII consume Layer 9. Rests on the README and neeb2015 lines 3337–3341.

## Not verifiable

- Seeded targets outside the change (0.4, 1.1, 2.3, 2.4, 5.3, 6.4, 6.8, 6.9, 7.10, 8.5, 8.6, 9.2) are untouched and unaffected; they were not read again and stand as in earlier reviews.
- Whether the eleven missing declarations exist in a Tau Ceti after the pin: only the pinned Mathlib and Tau Ceti were read.

## Source issues

- **Error** in kirillov2008 at Theorem 3.19(2), p. 26 (lines 875–876): the source says a connected Lie subgroup whose Lie algebra is an ideal is normal, with no condition on `G`; it should assume `G` connected (in `ℝ² ⋊ ℤ/2`, `ℝ × 0` is a counterexample); affects a stated result.
- **Gap** in kirillov2008 at Theorem 3.19, p. 26 (line 877): the source prints a placeholder where the proof should be; it should prove both parts (for instance by `Ad(exp X) = e^{ad X}` and generation by exponentials); affects the proof.

## For the human reviewers

- none
