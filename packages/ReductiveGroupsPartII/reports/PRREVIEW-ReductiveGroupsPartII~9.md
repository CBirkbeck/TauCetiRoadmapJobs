# Review of ReductiveGroupsPartII (pull request #3027 at e47c8ec)

**Verdict:** accepted

**Summary.** An incremental re-review of the 54 lines changed since `855180d`. There is no finding: the repaired route of RG2.3.5a (b) now names every input it uses, each exists where it is cited, and the argument holds in residue characteristic 2; the four restated Lean statements say what they said before and elaborate with `sorry` as the only warning. Both small corrections and one of the two format notes of the previous review are repaired; one format note remains, not blocking. One point is left to a human: Tits's Corvallis article, which carries five of the seven locators of RG2.3.5a, could not be read from a legal copy.

## N01 — A proposed name in the split-case route of RG2.3.5a is still in code font

In the split-case route (line 4532) `SmoothModel.generalLinear_isReductive` is in code font, but neither `Suggested.lean` nor the pinned libraries declare it, so a reader cannot tell it from a library name. Italicise it, as the README does for *SmoothModel.IsReductive.hasConnectedFibres*, or write "the reductivity of the standard `GL_n` model (RG2.3.1)".

## Questions for the author

- Does the description say that four statements of `TauCetiRoadmap/ReductiveGroupsPartII/Suggested.lean` are restated (`lang_surjective` and `lang_proAlgebraic_surjective` over `[Finite F]` with `Nat.card F`; `modularCharacter_eq_adjointModulus` and `modularCharacter_eq_one` with `[MeasurableSpace _] [BorelSpace _]` binders in place of a `letI`)? The part I could read names only §RG2.3.5a for this roadmap, but the copy I had is cut off inside the section "For reviewers". If it does not, one sentence there would do: "ReductiveGroupsPartII: Lang's theorem is stated over `[Finite F]`, and the two Haar statements take the Borel σ-algebra as instance binders; no statement changes its meaning."
- As in the previous review: are the vertex labels `v_m`, `v_0` and the absence of a residue-characteristic hypothesis in the source parenthesis of RG2.3.5a as printed in Tits 1.15 and 3.11? I could not open the article from a legal copy.

## Previous findings

- The previous review raised no finding (no R-numbered item). Its other remarks:
- C01 (inputs of the route of RG2.3.5a (b)) — repaired: the route cites ReductiveGroups §9D.1 for both fibres, treats `char κ = 2` through `κ′ ⊗_κ κ′ ≅ κ′ × κ′`, and names the four Mathlib smoothness inputs; the *Needs* line lists them.
- C02 (description calls RG2.3.5a (b) published) — repaired: the description now lists "ReductiveGroupsPartII §RG2.3.5a (b) … from the published cases (Tits 1979; Bruhat–Tits 1987) and ReductiveGroups §9D.1" among the derived sections.
- N01 (proposed name in code font) — not repaired: line 4532 still reads "(*reductive-model*, `SmoothModel.generalLinear_isReductive`)"; written again as N01.
- N02 (signature style of four Lean statements) — repaired: `[Finite F]` with `Nat.card F` at lines 212 and 225; `[MeasurableSpace …] [BorelSpace …]` binders at lines 317 and 333; no `letI` remains.

## Verified sound

| Statement | Instances tried | Values computed (roadmap / independent) | Result | Change |
|---|---|---|---|---|
| RG2.3.5a (b), route: differential onto | `n = 1`, `ℚ_2(ζ_3)/ℚ_2`; `ℚ_3(i)/ℚ_3` | `X ↦ Tr(ḡHX)`; `Tr(ζ_3) = −1`, `Tr(1) = 2` in `ℤ_3`: units, so onto `O` at every point, also mod `ϖ` | agrees | none |
| Route: Jacobian criterion | fibre: `n²` equations in `2n²` coordinates | rank `n²` everywhere, so the opens "maximal minor a unit" cover; each is a submersive presentation; glued by span-target locality | agrees | none |
| Route: generic fibre by §9D.1 | hypotheses of §9D.1 against (b), unramified case | §9D.1: `char ≠ 2`, separable quadratic field extension; here `char K ≠ 2`, `K′` a field | hypotheses met | none |
| Route: special fibre, `char κ ≠ 2` | `κ = 𝔽_3`, `κ′ = 𝔽_9`, `n = 1` | §9D.1 applies; `U_1(𝔽_3)` has `(9 − 1)/(3 − 1) = 4` points; Check says 4 | agrees | none |
| Route: special fibre, `char κ = 2` | `κ = 𝔽_2`, `κ′ = 𝔽_4`, `n = 1` | `𝔽_4 ⊗ 𝔽_4 ≅ 𝔽_4 × 𝔽_4` (separable); fibre becomes `𝔾_m = GL_1`; `U_1(𝔽_2)` has 3 points | agrees | none |
| Ramified control | `ℚ_2(i)`, `ℚ_3(√−3)` | `Tr(a + bi) = 2a`, image `2ℤ_2`; `Tr(a + b√−3) = 2a` onto `ℤ_3` but `K′` ramified: special fibre `μ₂ × 𝔾_a` | excluded by hypothesis, as the Check says | none |
| `lang_surjective`, `[Finite F]`, `Nat.card F` | `𝔾_m` over `𝔽_2`, `𝔽_3`; `μ₂` over `𝔽_3` | `z ↦ z^{q−1}`: `z ↦ z` and `z ↦ z²`, onto `F̄^×`; `μ₂`: map constant `1`, not onto, excluded by connectedness; `Nat.card 𝔽_2 = 2` | agrees | none |
| `lang_proAlgebraic_surjective` | same binders | only `[Fintype F]` → `[Finite F]`, `Fintype.card` → `Nat.card`; equal for finite `F` | same statement | none |
| `modularCharacter_eq_adjointModulus` | `𝔾_m`; the `ax + b` group, `g = (c, 0)` | `𝔾_m`: both sides `μ`. `ax + b`, left Haar `da db/|a|²`: `μ.map (· * g) = |c| μ`; `det Ad(g) = c`, modulus `|c|` | agrees | none |
| `modularCharacter_eq_one` | `𝔾_m`; Borel of `GL_2` as control | `𝔾_m`: abelian, right invariant; Borel: modulus `|c| ≠ 1`, not reductive, excluded | agrees | none |
| Borel binders against the former `letI` | any `H` | `BorelSpace` forces the σ-algebra to equal `borel _`: the same set of measures | same statement | none |
| *unramified-combinatorial-comparison* (sampled; its *Needs* line changed) | ramified `PU_3`; split `PGL_2` | `X_*(T)_I = ℤ`, both simple coroots map to the generator, `π₁(G)_I = 0`: comparison group `SL_2`; `PGL_2` compares to itself | agrees with its Checks | none |
| Citations of ReductiveGroups §§9B, 9B.1, 9B.2, 9B.3, Layer 9D, §9D.1 | six changed *Needs* lines and the scope clause | each section is at this head with the content named (construction, open cells, central quotients, pinned comparison, forms and automorphism sheaf, unitary groups) | resolves | none |

The rows of the previous review for untouched statements stand as in the previous review, of `855180d`.

- Source locators checked against the text: 4, all of the sampled target *unramified-combinatorial-comparison* (vanHoften2024 line 2860, p. 69; He2021 lines 317–319, p. 7; HainesRapoport2008 lines 297–300, p. 9; ConradRGS lines 8159–8182, pp. 196–197). The other 14 sampled targets lie in text the change does not touch.
- Library declarations opened at the pin: `Algebra.SubmersivePresentation` (Mathlib/RingTheory/Extension/Presentation/Submersive.lean:511), `Algebra.IsStandardSmooth` (Mathlib/RingTheory/Smooth/StandardSmooth.lean:73) with its instance to `Algebra.Smooth` (Mathlib/RingTheory/Smooth/StandardSmoothCotangent.lean:341), `RingHom.Smooth.ofLocalizationSpanTarget` (Mathlib/RingTheory/RingHom/Smooth.lean:131), `Algebra.Smooth.flat` (Mathlib/RingTheory/Smooth/Flat.lean:57).
- Cross-roadmap citations resolved: ReductiveGroups §9B (README line 4948), §9B.1 (5030), §9B.2 (5107), §9B.3 (5171), Layer 9D (5834, forms and automorphism sheaf at 5955), §9D.1 (6027), all at this head; §9D.1 is added by this pull request, the others are on main.
- The record: no heading, layer or item removed since `855180d`; no Lean declaration removed or added; four restated with the same meaning.
- Automatic checks: all passed, none set aside. Dependency check: `depcheck: 132 roadmaps, 1489 edges, 0 problem(s)`, no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/ReductiveGroupsPartII/Suggested.lean` with `lake env lean`: 11 `sorry` warnings and nothing else. The elaborated types of the four restated theorems carry `[Finite F]` and the Borel binders; no section binder is lost. No one-tactic probe: the four are Lang's theorem and Haar-measure identities, none closed by unfolding.
- Changes outside the folder: every path the pull request changes lies in a roadmap folder that is the pull request's own; nothing else.
- Ownership against open pull requests: searched by object (stabilizers and schematic closures of Hermitian lattices) in the four closest open roadmaps and the three closest on main; the change adds no object.

Overlap check: read AdelicAlgebraicGroups, GeometricSatakeAndFusionPartII, ReductiveGroupsPartIII (main), HeckeStacksAndLocalShtukasPartII, ShimuraVarietiesPartII, PadicHodgeTheoryPartII, ClassicalGroupsPartII (open), and ReductiveGroups at this head; one object shared, the unitary group `U(V)` over a field, owned by ReductiveGroups §9D.1 and now cited.

Source independence: changed passages only; 5 passages (the Jacobian sentence, the special-fibre sentence, the scope clause on §9D.1, the statement and the *Needs* line of *unramified-combinatorial-comparison*) compared with 4 sources (vanHoften2024, He2021, HainesRapoport2008, ConradRGS), none shared; largest share of the locators of RG2.3.5a [Tits], 5 of 7, which could not be read; contents not compared, since the change adds, removes and reorders no layer.

Research link: RG2.3.5a gives the reductive models at unimodular Hermitian lattices, the unitary case of the lattice schemes of Bruhat–Tits (1987); the layer's models at points of the building are those Kisin–Pappas (2018) use for integral models of Shimura varieties with parahoric level. Rests on README RG2.3 and its references, and on Bruhat–Tits 1987 §§3 and 5, read.

## Not verifiable

- [Tits] 1.15 (pp. 40–42), 3.8.1 (p. 55), 3.9 (p. 55), 3.10 (p. 56), 3.11 (pp. 56–58): no legal copy was found by the previous review; the passage citing them is unchanged and I looked nowhere else.
- The end of the pull request's description: the copy I was given is cut off inside "For reviewers" (first question above).

## Source issues

- **Error** in vanHoften2024 at §A.3.2, printed page 69: the source says the unramified comparison group (named H, then G′) is adjoint, with `π₁(G)_I ≅ π₁(G′)`; it should be semisimple with cocharacter lattice `X_*(T)_I`, not always adjoint (ramified `PU_3` gives `SL_2`); affects nothing.

## For the human reviewers

- Not tested: [Tits] (Corvallis 1979), the source of 5 of the 7 locators of §RG2.3.5a (README lines 4508–4520), could not be read legally; wording and locators were compared with Bruhat–Tits 1987 only.
- The two recorded decisions concern other folders and were not needed here: this folder loses no section, and RG2.3.5a states in full the clauses (a) and (b) that HermitianFormsAndLattices 4.6 cites.
