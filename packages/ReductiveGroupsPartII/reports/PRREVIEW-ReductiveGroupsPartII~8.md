# Review of ReductiveGroupsPartII (pull request #3027 at 855180d)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 86 changed lines since `74a09b7`. I checked the added §RG2.3.5a, the clause added to the RG2.3 introduction and the new reference against the head, the README at the merge base, Bruhat–Tits 1987 and the pinned libraries; the folder's text is the one the previous review read. There is no finding: both statements of RG2.3.5a hold in every case I computed (split, inert, unramified dyadic), the ramified non-example fails as its Check says, and the two Bruhat–Tits 1987 locators support what is claimed. Two small corrections and two format notes remain from the previous review, none blocking: the route of (b) uses two inputs its *Needs* line does not name, and the description still calls every added section a published theorem, which RG2.3.5a (b) is not. One point is left to a human: Tits's Corvallis article, which carries five of the section's seven locators, could not be read from a legal copy.

## C01 — The route of RG2.3.5a (b) uses two inputs that its *Needs* line does not name, and no supplier states the first in residue characteristic 2

An implementer who follows the route will look in vain among the listed inputs for two of its steps. The first is that a unitary group over a field is connected reductive: the route ends with the special fibre, "the unitary group of the nondegenerate reduction of `h` … which is connected reductive in every characteristic" (line 4540), and the generic fibre `U(V)` must be connected reductive for *reductive-model* to apply. The *Needs* line (line 4545) cites ReductiveGroups layer 6, which defines reductivity and says nothing of unitary groups. The statement is ReductiveGroups §9D.1, which assumes "a field of characteristic other than two" and a quadratic field extension. That covers the generic fibre (`char K ≠ 2` is a hypothesis here) and the special fibre in odd residue characteristic, but not `κ = 𝔽_2`, `κ′ = 𝔽_4`, a case (b) includes by name. The fact is true there (`U_n ⊗_κ κ′ ≅ GL_n` through `κ′ ⊗_κ κ′ ≅ κ′ × κ′`, the section's own split-case argument), so no stated result is affected.

The second is the step from "the differential is onto" to "the fibre over `H` is smooth over `O`": a relative Jacobian criterion. Mathlib's `Algebra.Smooth.of_formallySmooth_fiber` (Mathlib/RingTheory/Smooth/Fiber.lean:238) does not give it, since it assumes `Module.Flat R S` (the variable at line 47), and flatness is what the route deduces. `Algebra.SubmersivePresentation` (Mathlib/RingTheory/Extension/Presentation/Submersive.lean:511), with the instance from `Algebra.IsStandardSmooth` to `Algebra.Smooth` (Mathlib/RingTheory/Smooth/StandardSmoothCotangent.lean:341), does.

The smallest change: in the *Needs* line, cite ReductiveGroups §9D.1 beside layer 6; add one clause to the route saying that in residue characteristic 2 the special fibre becomes `GL_n` over `κ′` after base change along `κ′ ⊗_κ κ′ ≅ κ′ × κ′`, as in the split case; and name the Mathlib smoothness input.

## C02 — The description says every added section is a published theorem in its source's generality; RG2.3.5a (b) is derived in the roadmap, as the section says

A reader of the description takes RG2.3.5a (b) for a published statement. Part 1 says the added sections are "each a theorem published before 20 November 2026 and stated in the generality of its source"; the exceptions it then lists (sections stated more narrowly, or derived in their roadmap) do not include this one, and the description does not name this roadmap at all. The section itself says of its locators that "none states it in this form" (line 4526), and HermitianFormsAndLattices 4.6 labels the same statement "derived from the published cases". Would the author add to the list of derived sections: "ReductiveGroupsPartII §RG2.3.5a (b), for the full unitary group of any rank in every residue characteristic, is derived in the section from the published cases (Tits 1979; Bruhat–Tits 1987)"?

## N01 — A proposed name in the split-case route is set in code font

In the split-case route (line 4532) `SmoothModel.generalLinear_isReductive` is in code font, but neither `Suggested.lean` nor the pinned libraries declare it, so a reader cannot tell it from a library name. Italicise it, as the README does for *SmoothModel.IsReductive.hasConnectedFibres*, or write "the reductivity of the standard `GL_n` model (RG2.3.1)". The same name at line 3566 is untouched text.

## N02 — Untouched text: `TauCetiRoadmap/ReductiveGroupsPartII/Suggested.lean`, signature style

`lang_surjective` and `lang_proAlgebraic_surjective` (lines 212 and 225) take `[Fintype F]` beside `[Field F]`, where `[Finite F]` with `Nat.card F` is the house form; `modularCharacter_eq_adjointModulus` and `modularCharacter_eq_one` (lines 317 and 333) have a `letI` in the statement, which an instance binder would avoid. For a separate pull request.

## Questions for the author

- The source parenthesis of RG2.3.5a says that Tits 1.15 and 3.11 treat the quasi-split special unitary group in odd dimension "with no hypothesis on the residue characteristic", and that `v_m` is hyperspecial exactly in the unramified case while `v_0` never is. Are the vertex labels and the absence of a residue-characteristic hypothesis as printed there? I could not open the article from a legal copy.

## Previous findings

- The previous review raised no finding. Its two small corrections and two format notes concern text this head leaves as it was; they are C01, C02, N01 and N02 above, not repaired, and they do not block.

## Verified sound

| Statement | Instances tried | Values computed (roadmap / independent) | Result | Change |
|---|---|---|---|---|
| Definition of `𝒢_Λ` | `n = 1`, `K′ = ℚ_5 × ℚ_5`, `Λ = ℤ_5²` | closure of `{(x, x⁻¹)}` in `𝔾_m²` over `ℤ_5` is `𝔾_m`; Check says `𝔾_m` | agrees | none |
| (a) `𝒢_Λ(O) = U(Λ)` | `ℚ_3(i)/ℚ_3`, `Λ = ℤ_3[i]` | closure points `U(V)(K) ∩ GL_{O′}(Λ)` = norm-one units of `ℤ_3[i]` = `{g : gΛ = Λ}` | agrees | none |
| (b) inert, odd residue | `ℚ_3(i)`, `n = 1` | special fibre `U_1/𝔽_3`: `(9 − 1)/(3 − 1) = 4 = q + 1`; Check says 4 | agrees | none |
| (b) split | `5 = (2 + i)(2 − i)` | `𝒢 ≅ GL_1 = 𝔾_m` over `ℤ_5`, `4` points over `𝔽_5`, reductive | agrees | none |
| (b) unramified, residue char 2 | `ℚ_2(ζ_3)/ℚ_2`, `n = 1` | `Tr(ζ_3) = −1`, a unit, so `Tr` onto; `U_1(𝔽_2)` has `(4 − 1)/(2 − 1) = 3` points, a torus | holds | none |
| Route: differential of `g ↦ g^*Hg` | tangent `X` at `g`; `n = 2`, `g = H = 1` | `X^*Hg + g^*HX = (g^*HX)^* + g^*HX`; image all of `Herm_2`: diagonal `Tr(z)`, off-diagonal free; rank `4 = n²` | agrees | none |
| Route: fibre dimension | general `n` | `dim Res GL = 2n²`, `dim Herm_n = n²`, fibre `n² = dim U(V)` | agrees | none |
| Ramified non-example | `ℚ_3(√−3)`, `Λ = O′` | `N(a + bΠ) = a² + 3b²`; `ℤ_3[a,b]/(a² + 3b² − 1)` flat; mod 3: `a² = 1`, law `(aa′, ab′ + a′b)`, `≅ μ₂ × 𝔾_a` by `(a, ab)` | Check true | none |
| Ramified, residue char 2 (control) | `ℚ_2(i)`, `Λ = ℤ_2[i]` | `Tr(a + bi) = 2a`, image `2ℤ_2 ≠ ℤ_2`: the route's surjectivity fails, as the hypothesis predicts | consistent | none |
| Route input: reductivity of unitary groups | `κ = 𝔽_2`, `κ′ = 𝔽_4` | `U_n ⊗ 𝔽_4 ≅ GL_n` (true); ReductiveGroups §9D.1 assumes characteristic ≠ 2 | true, unnamed | C01 |
| Route input: smooth fibre | Mathlib at the pin | `of_formallySmooth_fiber` needs `Module.Flat` (circular here); `SubmersivePresentation` fits | unnamed | C01 |
| [Bruhat–Tits 1987] 3.9, pp. 180–181 | BruhatTits1987 lines 1413–1430 | scheme = closure of `G` in the product of `GL` of the lattices; integral points = stabilizer of the point | supports | none |
| [Bruhat–Tits 1987] §5 Théorème, p. 194 | BruhatTits1987 lines 1890–1894, 108 | smooth and equal to the scheme of part II for every point; only exception even orthogonal, residue char 2; `G = SU(f)` | supports | none |
| AdelicAlgebraicGroups AA.1.1 pointer | head lines 639, 658 | both named items are in §1.1 | resolves | none |
| Description, part 1 | README line 4526 | "published … in the generality of its source" against "none states it in this form" | contradicted | C02 |
| Headline theorems in `Suggested.lean` | file untouched by the change | elaboration: 11 `sorry` warnings, nothing else | unchanged | N02 (untouched) |

- Source locators checked against the text: 2 of the 7 of the added section (BruhatTits1987 lines 1413–1430 and 1890–1894); the 5 [Tits] locators could not be read.
- Library declarations opened at the pin: `Submodule.IsLattice` (Mathlib/Algebra/Module/Lattice.lean:68; any commutative ring `A`, so `K × K` is admitted), `Algebra.Smooth.of_formallySmooth_fiber` (Mathlib/RingTheory/Smooth/Fiber.lean:238, flatness at line 47), `Algebra.SubmersivePresentation` (Mathlib/RingTheory/Extension/Presentation/Submersive.lean:511), the `IsStandardSmooth → Smooth` instance (Mathlib/RingTheory/Smooth/StandardSmoothCotangent.lean:341). The pinned Tau Ceti has no unitary group scheme and no `generalLinear_isReductive`.
- Cross-roadmap and internal citations resolved: *smooth-affine-model* (line 3490), *reductive-model* (3546), *schematic-closure* (3584), RG2.0a *weil-restriction-base-change* (759), *weil-restriction-group-scheme* (817), *integral-weil-restriction* (1019); AdelicAlgebraicGroups AA.1.1 (two items); ReductiveGroups layer 6 and §9D.1 at this head. The consumers HermitianFormsAndLattices 4.6 and FunctionFieldArithmetic cite what the section states.
- The record: 7 layers at the merge base and at the head; no heading, layer or item removed; one heading added (RG2.3.5a); the one deleted line returns with the clause on RG2.3.5a inserted. No Lean declaration removed, added or restated.
- Seeded sample: the 15 targets all lie in text the change neither touches nor affects (the diff touches lines 3460–3464, 4482–4561 and 7281–7283 only), so none is checked in this review of the change.
- Automatic checks: four hits of form, all in the untouched `Suggested.lean` (N02); none set aside. Dependency check: `depcheck: 132 roadmaps, 1489 edges, 0 problem(s)`, no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/ReductiveGroupsPartII/Suggested.lean` with `lake env lean`: 11 `sorry` warnings and nothing else. The file is unchanged by the pull request; the elaborated signatures show no lost section binder; no one-tactic probe was needed, since no declaration changed.
- Ownership against open pull requests: searched by object (schematic closures and integral models of unitary groups, stabilizers of Hermitian lattices) on main, at this head and in the sibling checkouts of the closest open roadmaps. Another open pull request changes this roadmap; its head conflicts with this one only in files outside this folder.

Overlap check: read HeckeStacksAndLocalShtukasPartII, ShimuraVarietiesPartII, PadicHodgeTheoryPartII (open), AdelicAlgebraicGroups, GeometricSatakeAndFusionPartII, ReductiveGroupsPartIII (main), and ReductiveGroups, GanGrossPrasadUnitaryGroups, FunctionFieldArithmetic and EndoscopicTransferAndUnitaryTraceComparison at this head. One object is shared: the unitary group `U(V)` over a field, owned by ReductiveGroups §9D.1 (C01). The integral models of stabilizers of Hermitian lattices are owned here alone: GanGrossPrasadUnitaryGroups assumes them as a hypothesis, FunctionFieldArithmetic and HermitianFormsAndLattices 4.6 cite this roadmap.

Source independence: changed passages only; 6 passages of RG2.3.5a (the setting, (a)–(b), the source parenthesis, the split route, the unramified route, the Checks) compared with 1 source (BruhatTits1987, in French), none shared; largest share of the section's locators [Tits], 5 of 7, which could not be read; contents not compared, since the change adds, removes and reorders no layer.

Research link: RG2.3.5a gives the reductive models at unimodular Hermitian lattices, the unitary case of the lattice schemes of Bruhat–Tits (1987); the layer's models at points of the building are those Kisin–Pappas (2018) use for integral models of Shimura varieties with parahoric level. Rests on README RG2.3 and its references, and on Bruhat–Tits 1987 §§3 and 5, read.

## Not verifiable

- [Tits] 1.15 (pp. 40–42), 3.8.1 (p. 55), 3.9 (p. 55), 3.10 (p. 56), 3.11 (pp. 56–58): the sources service found only a landing page behind an access-control host and no legal copy; I looked nowhere else.

## Source issues

- none

## For the human reviewers

- Not tested: [Tits] (Corvallis 1979), the source of 5 of the 7 locators of the added §RG2.3.5a (README lines 4508–4520), could not be read legally; wording and locators were compared with Bruhat–Tits 1987 only.
- The two recorded decisions concern other folders and were not needed here: this folder loses no section, and RG2.3.5a states in full the clauses (a) and (b) that HermitianFormsAndLattices 4.6 cites.
