# Review of IdelicReciprocityCountsAndCyclotomicClassGroups (pull request #3182 at 958132c)
Folder: `TauCetiRoadmap/ShortGRH/IdelicReciprocityCountsAndCyclotomicClassGroups/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 48 changed lines since `5c8f654`. The rewritten items 1, 2 and 4 of §1.1, the comparison paragraph after item 5 and the *Needs* line were checked statement by statement against the *Absolute-value places* target of ArithmeticGaloisRepresentations §2.1 at this head, and the untouched passages that use "place of `Ω`" were reread under the new definition; no stated result is false or unsupported, so the folder is accepted. There are three small corrections and no format note, none blocking. One point is left for a human: the pull request also carries the regenerated GRH umbrella files, which lie outside the roadmap folders.

## C01 — Three untouched sentences still describe every place of `Ω` as a valuation subring, and one clause of 1.2 (a) now has a hypothesis that always holds

A reader who meets these before §1.1 takes a place to be a valuation subring, and then cannot read "the infinite places of `Ω`" of 4.1 item 1 (line 707); the description's claim that "§§1.2 onwards need no change" is true of the results but not of this wording. The sentences are: in the Summary, "Layer 1 sets up places of the fixed algebraic closure `Ω` as valuation subrings" (line 46); in the table of symbols, "place of `Ω` (valuation subring)" for `A, D_A, I_A` (line 96); in the introduction of Layer 1, "with places of `Ω` given as valuation subrings" (line 121); and in 1.2 (a), "A place whose valuation is nontrivial on `Ω^×` lies over some `v`" (line 206). The last was written when `Ω` itself, the trivial valuation subring, was a place: `w ↦ A_w` of item 1 now maps onto the valuation subrings other than `Ω`, so every finite place has a nontrivial valuation, and an infinite place has none.

The smallest change: "finite place" for "place" at lines 46, 96 and 121 (or "with finite places written as valuation subrings"), and in 1.2 (a) "Every finite place of `Ω` lies over some `v`".

## C02 — Item 4 of §1.1 no longer says that the valuation subring `A` of a henselian local field datum is a place, although items 2 and 3 and §1.4 are then applied to it

Item 2 defines `D_A`, `I_A` and the Frobenius elements at a finite place written as its valuation subring; item 4 now takes "a valuation subring `A` of `Ω`" of an arbitrary algebraically closed field of characteristic zero, and §1.4 opens with such a datum and speaks of `I_A` and of Frobenius elements at `A`. The definitions do apply, but the text leaves the reader to see why: `Ω/k` is algebraic, so the value group of `A` lies in the divisible hull of that of the discrete valuation ring `A ∩ k` and has rank one; the residue field of `A ∩ k` is finite of some characteristic `p`, so `A ∩ ℚ = ℤ_(p)`; hence `A = A_w` for the absolute value `w` normalised by `w(p) = 1/p`, which is a finite place of `Ω` in the sense of ArithmeticGaloisRepresentations §2.1, and it is the only one, since that target states `w ↦ A_w` injective for every field of characteristic zero. (The target defines places for every field of characteristic zero, so "place" was not wrong in item 4; only the bijection of item 1 needs `Ω` algebraic over `ℚ`.)

The smallest change is a clause in item 4, for example: "`A` is then `A_w` for exactly one finite place `w` of `Ω`, and items 2 and 3 are read at it".

## C03 — The comparison paragraph of §1.1 credits the target with a closed inertia group "for any group acting on `Ω` by field automorphisms"; the target states closedness only for a topological group acting continuously

The sentence "Its *Absolute-value places* target states items 1 and 2 for any group acting on `Ω` by field automorphisms … and the inertia group, closed and normal in it" (lines 167–171) runs two hypotheses together. In ArithmeticGaloisRepresentations §2.1 at this head, normality is proved for every group with `MulSemiringAction G L`; closedness of the decomposition and inertia groups is proved "for `G` a topological group acting continuously on `L` with the discrete topology". The `Γ` of §1.1 acts with open stabilisers, so item 2 is covered; the attribution would be exact with "normal in it, and closed when the group is topological and acts continuously on the discrete `Ω`".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.1 item 1: `w ↦ A_w` is a bijection from finite places of `Ω` onto valuation subrings `≠ Ω` | `Ω = ℚ̄` (Conventions); `ℚ̄_p`; trivial subring `Ω` | `ℚ̄`: every proper valuation subring has rank one over some `ℤ_(p)`, normalise `w(p)=1/p`. `ℚ̄_p`: subrings trivial on `ℚ` exist, but `Ω` is fixed algebraic over `ℚ`. `Ω` itself excluded on both sides | true as scoped; target states it for `L` algebraic over `ℚ` | none |
| item 1: action `(σw)(x) = w(σ⁻¹x)`, `A_{σw} = σA_w` | `x ∈ σA_w`, `x = σy`, `w(y) ≤ 1` | `(σw)(x) = w(σ⁻¹σy) = w(y) ≤ 1`; conversely `w(σ⁻¹x) ≤ 1` gives `σ⁻¹x ∈ A_w` | equal; inverse convention needed for a left action (`(στ)w(x) = w(τ⁻¹σ⁻¹x)`) | none |
| item 1: `A` lies over `v` iff `𝒪_K ∩ 𝔪_A = v`; infinite places | `ℚ(i)`, `5 = (1+2i)(1−2i)`; place above `∞` | two finite places above `5`, exchanged by conjugation; one infinite place, restricting to the complex place | agrees with the target's Check | none |
| item 2: decomposition group of `w` is the stabiliser of `A_w`; inertia at infinity is `D_w` | `ℚ(i)/ℚ`: above `5`; above `∞` | above `5`: stabiliser trivial on both descriptions; above `∞`: `D_w = I_w` of order 2 | agree; target: stabiliser of `w` = stabiliser of `A_w` by injectivity | none |
| item 2: Frobenius for `q` at `A` versus the target's two hypotheses | `q = 1`; `q = q_v` | `σ(x) − x^q ∈ 𝔪_A` for `x ∈ A` ⇔ `w(σx − x^q) < 1` for `w(x) ≤ 1`; `q = 1` gives the target's inertia group | same condition | none |
| item 2: inertia closed and normal in the decomposition group | `Γ` with open stabilisers; abstract `G` | open stabilisers ⇒ continuous action on discrete `Ω` ⇒ target's closedness applies; abstract `G`: only normality stated | true for `Γ` | C03 (attribution) |
| item 3 (untouched, cited by the changed paragraph): `στ` Frobenius for `qq′` iff `τ` for `q′` | `σ` for `q`; residue field `𝔽̄_p` | `(τx)^q ≡ σ(τx) ≡ x^{qq′}`; `x ↦ x^q` is induced by `σ`, so injective on the residue field, giving `τx ≡ x^{q′}` | converse holds; target states only the forward product, as the paragraph says | none |
| item 4: valuation subring `A` of `Ω` fixed by `Gal(Ω/k)`, `A ∩ k` a DVR with finite residue field | `Ω = ℚ̄_p`, `k = ℚ_p`; `A = Ω` | rank one, `A ∩ ℚ = ℤ_(p)`, `A = A_w` with `w(p) = 1/p`; `A = Ω` gives `A ∩ k = k`, not a DVR | `A` is a unique finite place | C02 |
| comparison paragraph: what the target states of items 1–3 | each clause read at the target | places and action ✓; bijection ✓ (algebraic over `ℚ`); `A_{σw} = σA_w` ✓; `Q_w = {x ∈ O : w(x) < 1}` ✓; conjugation, forward product, restriction to `G`-stable subfield ✓; closedness under topology only | accurate except the closedness clause | C03 |
| 1.2 (a) (untouched, affected): "a place whose valuation is nontrivial lies over some `v`" | finite place; infinite place; old place `A = Ω` | finite: always nontrivial, `A ∩ K ≠ K`, lies over a prime; infinite: no valuation; `Ω` no longer a place | true, hypothesis now vacuous | C01 |
| 4.1 item 1 (untouched, affected): "the infinite places of `Ω`" | before and after the change | before: undefined among valuation subrings; after: the archimedean places of item 1, permuted by `G_K` | now defined | none |
| *Needs* of §1.1: ArithmeticGaloisRepresentations §2.1, Mathlib `AbsoluteValue` | supplier on `main`; merge order | supplier is on `main` and earlier in the merge order; that README does not cite this roadmap | no upward edge, no cycle | none |

- Source locators checked against the text: 0 (the change adds none; none of the seeded sample falls in the changed or affected passages; the manifest records no texts).
- Cross-roadmap citations resolved: 1 (ArithmeticGaloisRepresentations §2.1, *Absolute-value places*, read in full at this head, with its change in this pull request); the citations of §1.1 from CongruencesOfTwistedThetaLifts, CrystallineRepresentationsAndKisinModules, GaloisRepresentationsOfUnitaryEigenforms, PadicComparisonForFunctorCohomology and SelmerBoundsForAnticyclotomicTwists still resolve (no heading or id changed).
- Library declarations opened at the pin: `Valuation.toAbsoluteValue` in `TauCeti/RingTheory/Valuation/AbsoluteValue.lean` line 32 (Tau Ceti's, as the supplier now says); Mathlib `AbsoluteValue`, `ValuationSubring`.
- Record: 10 layers at the merge base, 10 at the head; no layer, item or heading removed or retitled; items 1–5 of §1.1 all kept with their statements.
- Dependency check output: `depcheck: 35 roadmaps, 279 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`: no error and no warning; the file states nothing (its docstring names the five headlines as not statable and what each lacks) and is unchanged, so there is no declaration to probe or to compare with `#check`.
- Headline theorems (4.4/4.5, 6.1, 8.4, 9.1, 10.7): untouched by the change.
- Overlap check: read ClassFieldTheory (both open revisions, by the overlap list only: neither changes this roadmap nor drops an id cited here), GaloisRepresentationsOfUnitaryEigenforms, SelmerBoundsForAnticyclotomicTwists, CongruencesOfTwistedThetaLifts; the one shared object, the places of a characteristic-zero field with their decomposition and inertia groups, is owned by ArithmeticGaloisRepresentations §2.1 and cited from §1.1; nothing else shared.

Source independence: changed passages only; 3 passages (items 1, 2 and the comparison paragraph) compared with 1 text, the supplier target ArithmeticGaloisRepresentations §2.1, which is this project's own and not a source; none shared with an external source; the change adds no source locator and no layer, so shares and arrangement were not recomputed. The text of `[ShortProof]` was not read.

Research link: the roadmap states the class field theory, cocycle counts, Hecke characters and cyclotomic class-group bounds used by the shorter formal proof of the Riemann hypothesis for Dirichlet `L`-functions (`[ShortProof]`, the `grh` folder of the cited repository); it rests on the README's Summary and References, not on a refereed text I read.

## Not verifiable

- `[ShortProof]`, `Lib/ClassField/Places/GaloisDefs`: that it "uses" the valuation-subring description (item 1) was not checked against the repository; the manifest records no text for it and the claim is untouched in substance.

Automatic checks set aside as false positives: two reports of TeX-only syntax (`a^{h_K}` in 2.2 (a) and `N_{K/ℚ}(x)` in 2.2 (b)), both inside code spans that continue over a line break; and the report that the pull request changes files outside its roadmap folders, which names the two generated GRH umbrella files: the repository's generator reports them in sync with the roadmaps at this head, and the description says they were regenerated.

## Source issues

- none

## For the human reviewers

- **Scope.** The pull request commits the regenerated `umbrellas/GRH-targets.md` and `umbrellas/GRH.toml` (6 and 2 lines); the generator finds them in sync at this head, but a daily job regenerates them on `main`, so a conflict is possible.
- **Licence.** `[ShortProof]` is a public Lean repository cited by commit, not a refereed publication; its licence was not read in this review (the change adds nothing taken from it).
