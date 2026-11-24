# Review of ReductiveGroupsPartII (pull request #3027 at 0b5086d)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 86 changed lines since `aecb53a`. I checked the added §RG2.3.5a, the new clause in the RG2.3 introduction and the new reference against the head, the merge-base README, Bruhat–Tits 1987 and the pinned libraries. There is no finding. Both statements of RG2.3.5a hold in every case I computed (split, inert, dyadic unramified), the ramified non-example fails as its Check says, and the two Bruhat–Tits 1987 locators say what is claimed. There are two small corrections and two format notes, none blocking. The first correction is that the route's *Needs* line omits two of its inputs, and the only owner of one of them excludes residue characteristic 2. The second is that the description calls every addition a published theorem in its source's generality, which RG2.3.5a (b) is not. One thing is left for a human: Tits's Corvallis article, which carries five of the section's seven locators, could not be read from a legal copy.

## C01 — The *Needs* line of RG2.3.5a omits two inputs that its route uses, and the one available owner of the first excludes residue characteristic 2

An implementer following the route of (b) will not find two of the facts it relies on among the listed inputs. The first is that a unitary group over a field is connected reductive. The route ends with the special fibre, "the unitary group of the nondegenerate reduction of `h` … which is connected reductive in every characteristic" (line 4540), and the generic fibre must be connected reductive as well. The *Needs* line (line 4547) cites ReductiveGroups layer 6, which defines reductivity but says nothing about unitary groups. The statement is in ReductiveGroups §9D.1, which this pull request adds. That section assumes a field of characteristic other than two and a quadratic field extension. So it covers the generic fibre, since `char K ≠ 2` is among RG2.3.5a's hypotheses, and the special fibre in odd residue characteristic. It does not cover residue characteristic 2, which (b) explicitly includes: for `κ = 𝔽_2` and `κ′ = 𝔽_4`, no supplier states that `U_n` over `𝔽_2` is reductive.

The second input is that "the differential is onto, so the fibre over `H` is smooth". This is the relative Jacobian criterion. Mathlib's `Algebra.Smooth.of_formallySmooth_fiber` (Mathlib/RingTheory/Smooth/Fiber.lean:238) cannot supply it, because it assumes flatness through the section variable at line 47, and flatness is what the route derives. `Algebra.SubmersivePresentation` (Mathlib/RingTheory/Extension/Presentation/Submersive.lean:511) does supply it locally, together with the instance from `Algebra.IsStandardSmooth` to `Algebra.Smooth` (Mathlib/RingTheory/Smooth/StandardSmoothCotangent.lean:341).

The smallest change has three parts:

- In the *Needs* line, cite ReductiveGroups §9D.1 instead of, or beside, layer 6.
- Add one clause to the route: in residue characteristic 2 the special fibre becomes `GL_n` over `κ′` after base change along `κ′ ⊗_κ κ′ ≅ κ′ × κ′`, by the split-case argument already in the section.
- Name the Mathlib smoothness input.

The definition of `U(V)` could also say that it is §9D.1's definition, extended to `K′ = K × K`, rather than give it a second time.

## C02 — The description says that every added section is a published theorem stated in its source's generality, but RG2.3.5a (b) is derived in the roadmap, as the section itself says

A reader of the description will take RG2.3.5a (b) for a published theorem. Part 1 of the description says the added sections are "each a theorem published before 20 November 2026 and stated in the generality of its source". The parenthesis that follows lists the exceptions, and this roadmap is not among them. The section itself says that its cited locators give special cases and that "none states it in this form" (line 4526). Would the author add to that parenthesis: "in ReductiveGroupsPartII §RG2.3.5a, clause (b), for the full unitary group of any rank and in every residue characteristic, is derived in the section from the published cases (Tits 1979; Bruhat–Tits 1987)"?

## N01 — A proposed name in the split-case route is set in code font

In the split-case route (line 4532), `SmoothModel.generalLinear_isReductive` is in code font. It is declared neither in `Suggested.lean` nor in the pinned libraries, so a reader cannot tell it from a library name. The README writes other proposed names in italics (*SmoothModel.HasConnectedFibres*). Italicise it here, or write "the reductivity of the standard `GL_n` model (RG2.3.1)". The same name in RG2.3.1 (line 3566) is untouched text.

## N02 — Untouched text: `TauCetiRoadmap/ReductiveGroupsPartII/Suggested.lean`, signature style

`Lang.lang_surjective` and `Lang.lang_proAlgebraic_surjective` (lines 212 and 225) take `[Fintype F]` beside `[Field F]`. The house form is `[Finite F]` with `Nat.card F`. `LocalIntegration.modularCharacter_eq_adjointModulus` and `Decomposition.modularCharacter_eq_one` (lines 317 and 333) put a `letI` in the statement. An instance binder, or a named Borel `MeasurableSpace` instance, would avoid it. This is for a separate pull request.

## Questions for the author

- The source parenthesis of RG2.3.5a says that Tits 1.15 and 3.11 treat the quasi-split `SU_{2m+1}` "with no hypothesis on the residue characteristic". That would include the ramified case in residue characteristic 2. Is that so at those locators? I could not open the Corvallis article from a legal copy.

## Verified sound

| Statement | Instances tried | Values computed (roadmap / independent) | Result | Change |
|---|---|---|---|---|
| Definition of `𝒢_Λ` (closure in `Res GL(Λ)`) | `n = 1`, split `ℚ_5 × ℚ_5`, `Λ = ℤ_5²` | closure = graph `{(x, x⁻¹)}` ≅ `𝔾_m` over `ℤ_5`; the Check says `𝔾_m` | agrees | none |
| (a) `𝒢_Λ(O) = U(Λ)` | `ℚ_3(i)`, `Λ = ℤ_3[i]`, `n = 1` | `U(Λ)` = norm-one elements, all in `ℤ_3[i]^×`; closure points `U(V)(K) ∩ GL(Λ)` = same set | agrees | none |
| (b) inert, odd residue | `ℚ_3(i)/ℚ_3`, `n = 1` | special fibre `U_1/𝔽_3`: `(9 − 1)/(3 − 1) = 4 = q + 1`; the Check says 4 | agrees | none |
| (b) split | `p = 5 = (2+i)(2−i)` | `𝒢 ≅ 𝔾_m` over `ℤ_5`; `|𝔾_m(𝔽_5)| = 4`; reductive | agrees | none |
| (b) unramified, residue char 2 | `ℚ_2(ζ_3)/ℚ_2`, `n = 1` | `Tr(ζ_3) = −1`, a unit, so Tr is onto; `|U_1(𝔽_2)| = 3/1 = 3`, a torus | holds | none |
| Route: differential of `g ↦ g*Hg` | `g = H = 1`, `n = 2` | `X ↦ X + X*`; image `Herm_2`, rank `n² = 4` (2 diagonal + 2 for one off-diagonal pair) | agrees | none |
| Ramified non-example (negative control) | `ℚ_3(√−3)`, `Λ = O′` | `N(a + bΠ) = a² + 3b² ≡ a²`; law `(aa′, ab′ + a′b)` ≅ `μ_2 × 𝔾_a` via `(a, ab)`; 6 points over `𝔽_3` | the Check is correct | none |
| Ramified, residue char 2 | `ℚ_2(i)`, `Λ = ℤ_2[i]` | `Tr(a + bi) = 2a`, image `2ℤ_2 ≠ ℤ_2`: the route fails, consistent with the hypothesis | consistent | none |
| Hypothesis `char K ≠ 2` | `𝔽_2((t))`, `K′ = 𝔽_4((t))` | the argument goes through (`Tr(ω) = 1`); the hypothesis matches §9D.1, which serves the generic fibre | kept | none |
| Route input: special fibre reductive | `κ = 𝔽_2`, `κ′ = 𝔽_4`, `n = 2` | `U_2 ⊗ 𝔽_4 ≅ GL_2`, so true; ReductiveGroups §9D.1 assumes char ≠ 2 | true, uncited | C01 |
| Route input: smoothness of the fibre | Mathlib at the pin | `of_formallySmooth_fiber` needs `Module.Flat` (circular); `SubmersivePresentation` fits | uncited | C01 |
| [Bruhat–Tits 1987] 3.9, pp. 180–181 | text pp. 180–181 | `𝔊_p` = closure of `G` in the product of the `GL` of the lattices; its integral points are `Stab_p` (p. 181) | supports | none |
| [Bruhat–Tits 1987] §5 Théorème, p. 194 | text p. 194 | smooth and equal to the scheme of II for every point; only even orthogonal forms in characteristic 2 are excepted | supports "every residue characteristic" | none |
| AdelicAlgebraicGroups AA.1.1 items | main lines 634, 653; head lines 639, 658 | both named items are present in §1.1 | resolves | none |
| Description, part 1 | head line 4526 | "published … in the generality of its source" against "none states it in this form" | contradicted | C02 |
| Headline theorems (`Suggested.lean`) | unchanged by the diff | elaboration: 11 `sorry` warnings, nothing else | unchanged | N02 (untouched) |

- Source locators checked against the text: 2 of the 7 in the added section (Bruhat–Tits 1987, 3.9 and §5 Théorème); the 5 [Tits] locators could not be read.
- Library declarations opened at the pin: `Submodule.IsLattice` (Mathlib/Algebra/Module/Lattice.lean:68, a ring `A`, so `K × K` is admitted), `Algebra.Smooth.of_formallySmooth_fiber` (Mathlib/RingTheory/Smooth/Fiber.lean:238, flat section variable at line 47), `Algebra.SubmersivePresentation` (Mathlib/RingTheory/Extension/Presentation/Submersive.lean:511), `Algebra.IsStandardSmooth` (Mathlib/RingTheory/Smooth/StandardSmooth.lean:73) and its `Algebra.Smooth` instance (StandardSmoothCotangent.lean:341). Pinned Tau Ceti has no unitary group schemes.
- Cross-roadmap citations resolved: RG2.0a *weil-restriction-group-scheme*, *integral-weil-restriction* and *weil-restriction-base-change* (the split `O′ = O × O` generic fibre goes through the base-change item); RG2.3.1 *smooth-affine-model*, *schematic-closure* and *reductive-model*; AdelicAlgebraicGroups AA.1.1 (two items, on main and at the head); ReductiveGroups layer 6 and §9D.1 (the latter added by this pull request). The one consumer, HermitianFormsAndLattices 4.6, cites (a) and (b) as stated here.
- The record: the merge-base README and the head both have 7 layers. No heading, layer or item is removed. The one deleted line is re-added with the clause on RG2.3.5a inserted.
- Seeded sample: all 15 targets lie outside the changed and affected passages (README lines 179–6504, untouched by the diff), so they are not checked in a review of the change.
- Automatic checks: four form hits, all in untouched `Suggested.lean` (N02). Dependency check output: `depcheck: 132 roadmaps, 1489 edges, 0 problem(s)`, with no UPWARD or CYCLE line. The AdelicAlgebraicGroups pointer is a statement of ownership, not a supplier edge.
- Elaboration of `TauCetiRoadmap/ReductiveGroupsPartII/Suggested.lean` with `lake env lean`: exit 0, 11 `sorry` warnings and nothing else. The file is unchanged by the diff, and the elaborated signatures show no lost section binder.
- Ownership against open pull requests: checked in the sibling checkouts of the open roadmap pull requests and on main, by object. Another open pull request revises this roadmap, but its head conflicts with this one only outside this folder, and the description's merge-order block states the order for this roadmap.

Overlap check: I read the scope of HeckeStacksAndLocalShtukasPartII, ShimuraVarietiesPartII and PadicHodgeTheoryPartII (open), AdelicAlgebraicGroups, GeometricSatakeAndFusionPartII and ReductiveGroupsPartIII (main), and also ReductiveGroups and SmoothRepresentationsOfLocalGroups at this head, GanGrossPrasadUnitaryGroups §5.3, PELModuli M0.6 and GeometryOfNumbersAndQuadraticArithmetic. One object is shared: the unitary group `U(V)` over a field, whose owner is ReductiveGroups §9D.1 (C01). The integral models of Hermitian-lattice stabilizers are owned only here: GanGrossPrasadUnitaryGroups §5.3 assumes them as a hypothesis, and HermitianFormsAndLattices 4.6 cites RG2.3.5a.

Source independence: changed passages only. I compared 6 passages of RG2.3.5a (the setting, (a)–(b), the source parenthesis, the split route, the unramified route and the Checks) with 1 source (Bruhat–Tits 1987, 3.9 and §5), and no wording is shared. The largest share of the section's locators is [Tits], 5 of 7, which could not be read. The arrangement was not compared, because no layer was added, removed or reordered.

Research link: RG2.3.5a supplies the reductive models at self-dual Hermitian lattices that the unitary groups of Bruhat–Tits (1987) specialise to. The README's models at points of the building are those Kisin–Pappas (2018) use for integral models of Shimura varieties with parahoric level. This rests on README §RG2.3 and its references, and on Bruhat–Tits 1987 §5, which I read.

## Not verifiable

- [Tits] 1.15 (pp. 40–42), 3.8.1 (p. 55), 3.9 (p. 55), 3.10 (p. 56) and 3.11 (pp. 56–58). The sources service resolved the DOI to a landing page behind an access-control host, and the publisher's site refused automated reads of the volume page. The only open copy a search found is on a third party's personal page, which is not a legal place and was not used.

## Source issues

- none

## For the human reviewers

- Not tested: [Tits] (Corvallis 1979), the source of 5 of the 7 locators in the added §RG2.3.5a, could not be read legally. The wording and locators of the added section were checked against Bruhat–Tits 1987 only.
- The two decisions recorded for this pull request concern other folders and change nothing here. HermitianFormsAndLattices 4.6, the one family section that cites the new RG2.3.5a, keeps its statement, and RG2.3.5a states the two clauses it cites.
