# GATE-ModularCurves~3: answers to human review of the ModularCurves pull request

Head reviewed: `fd94f55`. Repairs committed as `b3e034a0` ("ModularCurves: review repairs (Stacks
08HR comparison, uniformizer target, Prop instances as theorems, citations)"), not pushed. The
comments in `reviews.md` are two comments by CBirkbeck: the design edits (H01–H03) and the reply
that applied them in `fd94f55` (H04–H11, one finding per claim). The reply is cut off mid-word
("The field `isSepClosed_residueField` is not regi"); H10 answers what can be checked from that.

## H01 (CBirkbeck) — applied

Present at `fd94f55` and kept. `TauCetiRoadmap/ModularCurves/Suggested.lean` declares the class
`IsStrictlyHenselianLocalRing` (line 747), the instance `IsStrictlyHenselianLocalRing.of_isSepClosed`
built from the pair (line 757), and `IsStrictlyHenselianLocalRing.tfae` (line 769). The TFAE was
checked against Stacks 10.153.3 (04GG), clause (8); clause (3) of the TFAE drops 04GG's hypothesis
`κ = κ(𝔮)`, which is correct because `κ` is separably closed. This round makes one README claim
exact: README 4D (line 1661 ff.) said the class and the pair are "interchangeable". The direction
from the class back to the pair needs the field `isSepClosed_residueField` supplied by name,
because the field is not an instance (see H10). The Lean docstrings at lines 749–760 now say the
same.

## H02 (CBirkbeck) — applied differently

`StrictHenselization.isHenselization` is stated (line 813). `IsHenselization.nonempty_algEquiv` is
not added: `Nonempty (A ≃ₐ[R] B)` drops both the compatibility with the maps to `L` and the
uniqueness that Stacks 10.154.7 (08HT) asserts. The version at `fd94f55` stated only the
bijectivity half (`bijective_of_comp_eq`). Added `IsHenselization.existsUnique_comp_eq` (line 829):
for a henselisation `ψ : A → L` and a surjective `R`-algebra map `χ : B → L` from a henselian
local ring, there is exactly one `f : A →ₐ[R] B` with `χ ∘ f = ψ` (Stacks 10.154.6 (08HR), from
the algebra chapter text). Together with `bijective_of_comp_eq` this is exactly 08HT, with no
chosen isomorphism. README 4D lines 1712–1738 restate it, and three Checks were added at line
1791: the unique map `ℤ_(p)^h → ℤ_p`, which is not surjective; `Aut_R(R^{sh})`, where only the
identity is compatible with `toTarget`; and a non-surjective `χ`, where no map exists.

## H03 (CBirkbeck) — applied

`StrictHenselization.isDiscreteValuationRing_algebra` (line 866) holds for every discrete
valuation ring `R`, matching Stacks 15.46.11 (0AP3), More on Algebra text. Its Lean conclusion
stated only "is a DVR", while README 4D also asserted that a uniformizer of `R` is a uniformizer
of `R^{sh}`. That clause is now its own target, `StrictHenselization.irreducible_algebraMap`
(line 880): the image of an irreducible element stays irreducible. Its negative control is a
Check at README line 1811: in the ramified `ℤ_(p)[√p]`, `p` is the square of a uniformizer.

## H04 (CBirkbeck) — answered

The claim that the comparison is data (`lift` followed by `AlgEquiv.ofBijective`, unique by
`existsUnique_lift`) is correct when one side is `TauCeti.StrictHenselization.algebra R Ω`, because
`lift` exists only for that model (`TauCeti/RingTheory/StrictHenselization/Lift.lean`, line 105).
For two arbitrary henselisations at the same point, `fd94f55` stated no existence, although README
4D promised that every model is compared with every other. `existsUnique_comp_eq` (H02) supplies
that existence. The "D14" rule from the design decision is not readable from this job. The
replacement agrees with this brief's rule against sorry'd data and chosen isomorphisms.

## H05 (CBirkbeck) — answered

Correct. On main, SchemeAndStackFoundations §0.12 is "Étale neighbourhoods and the henselization
of a pair" and defines no `IsHenselization`. SchemeAndStackFoundations on main consumes
ModularCurves 4D: its README lines 108–111, 418, 483–484 and 886 (§0.10,
`isGeometricallyUnibranch_iff_irreducible_strictHenselization`). Citing it from 4D would therefore
close a cycle. The only other `IsHenselization` (`IsLocalRing.IsHenselization`) is in the open
SchemeAndStackFoundations revision #1656, and a revision is never a supplier. One repair belongs
to this point: the Downstream consumers bullet at `fd94f55` cited "the strict local rings of
schemes at geometric points of SchemeAndStackFoundations §0.12", which exist only at #1656's head.
README line 3175 now cites what main has, namely its scope and §0.10.

## H06 (CBirkbeck) — answered

Verified at #1656's head: its §0.12 defines `class IsLocalRing.IsHenselization R L Rh` with
`[IsLocalRing R]` and `∃ e : L ≃+* ResidueField Rh` (its `Suggested.lean`, line 162). Having
#1656 consume `IsHenselization` from ModularCurves 4D respects the direction of supply, because
SchemeAndStackFoundations already consumes 4D. The change belongs to #1656 and nothing here was
edited for it. Draft #1808 changes the picture: it moves 4D's strict henselisation into
SchemeAndStackFoundations §0.12a, and it conflicts with this pull request in `README.md` and
`Suggested.lean`. #1808 should be rebased on this pull request. The 4D targets added here
(`IsStrictlyHenselianLocalRing`, `IsHenselization` and its four theorems,
`isDiscreteValuationRing_algebra`, `irreducible_algebraMap`) then move with the strict
henselisation, and #1656's predicate becomes a duplicate inside SchemeAndStackFoundations, to be
merged into the moved one.

## H07 (CBirkbeck) — answered

Correct, as `#check @IsHenselization` shows: the class takes `ψ : A →ₐ[R] L` with fields
`henselianLocalRing`, `indEtale` and `surjective`, and has no `IsLocalRing R` binder (line 797).
#1656's class instead requires a local `R` and an existential `e`. The predicate covers a
henselisation at a prime: `ker ψ = 𝔪_A`, elements of `R ∖ 𝔭` become units, and `A` is ind-étale
over `R_𝔭` with residue field `L`. This matches the generality of 08HT, which is stated for an
arbitrary ring `R` and field `K` (algebra chapter, Lemma 10.154.7).

## H08 (CBirkbeck) — answered

Correct for declarations. `strictHenselization_not_complete` was never a Lean declaration, either
on main or at `7cf82077` and `fd94f55`. On main it was the backticked label of a README Check
(`TauCetiRoadmap/ModularCurves/README.md`, line 1267 on main), and this branch had already dropped
the label. The DVR half is the general target (H03). Non-completeness remains a Check (README line
1767).

## H09 (CBirkbeck) — answered

Correct: Mathlib's `class IsDiscreteValuationRing (R) [CommRing R] [IsDomain R]`
(`Mathlib/RingTheory/DiscreteValuationRing/Basic.lean`, line 56) needs the domain instance, and
Stacks 15.46.6 (06DI) gives it for a local normal domain. This round restates it from an `instance`
whose body is `sorry` to a `theorem` registered with `attribute [instance]` (lines 851 and 858). The
reason is that the gate refused the `instance … := sorry` form as sorry'd data (H11). The same
change was made to `StrictHenselization.isHenselization` (lines 813 and 820). A negative-control
Check was added at README line 1801: for the node `y² = x²(1 + x)`, a non-normal local domain,
`(y − xs)(y + xs) = 0` in `R^{sh}` with `s² = 1 + x`.

## H10 (CBirkbeck) — answered

The comment is cut off after "is not regi". What can be checked: the field is a plain class field,
not an instance (line 751). In a scratch elaboration, `inferInstance` fails for
`[IsStrictlyHenselianLocalRing S] ⊢ IsSepClosed (ResidueField S)` and succeeds for the pair ⊢ the
class. Leaving it out is right: Mathlib does not register `IsSepClosure.sep_closed` globally
(`Mathlib/FieldTheory/IsSepClosed.lean`, lines 226–228; a local instance at line 307 only).
Registering it here would also close a cycle with `of_isSepClosed`. The README wording was
corrected (H01).

## H11 (CBirkbeck) — disputed

The four checks quoted hold, but the gate did not pass at `fd94f55`. It reports `sorry-data=2` for
the two `instance … := sorry` declarations that `fd94f55` added (`StrictHenselization.isHenselization`
and `StrictHenselization.isDomain_algebra`). The gate run on this round's tree, before those two
were changed, flagged exactly those lines and failed. They are now `theorem`s with
`attribute [instance]` (H09), and the gate passes.

## Build and gate

- `lake build TauCetiRoadmap.ModularCurves.Suggested`: `Build completed successfully (20432 jobs).`
  The only warnings are 30 `declaration uses 'sorry'`; there are no errors and no other warnings.
- Gate: `gate ModularCurves: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check (`--movable`): `depcheck: 239 roadmaps, 2350 edges, 0 problem(s)`. There is no
  UPWARD, CYCLE or `moved:` line.

## Elaborated signatures

All 49 declarations of `Suggested.lean` were put as `#check @name` in one scratch file and
elaborated once. Each elaborated type was compared with its README statement. Changes against
`signatures.md`:

- two declarations are new (`IsHenselization.existsUnique_comp_eq`,
  `StrictHenselization.irreducible_algebraMap`);
- `StrictHenselization.isHenselization` and `StrictHenselization.isDomain_algebra` changed from
  instance to theorem, with identical types;
- no declaration lost a binder;
- `existsUnique_comp_eq` deliberately has `B` and `L` in free universes and needs only
  `[HenselianLocalRing B]`, as Stacks 08HR allows.

## Ownership, overlaps and citations

- **Ownership.** The object search covered main and all 459 open heads (`roadmaps grep` for
  strictly henselian predicates, `IsHenselization` and `IsStrictlyHenselian`). Prose mentions of
  "strictly henselian" occur in many roadmaps, but no other roadmap defines these predicates except
  #1656, a revision (H05, H06). This roadmap is the owner because Layer 4D owns the strict
  henselisation and SchemeAndStackFoundations already consumes it. No declaration takes the fully
  qualified name of another roadmap's declaration.
- **Overlaps.** #1808 (H06): rebase #1808 on this pull request. #1187 (pin bump): it touches this
  `Suggested.lean` among about 30 files; it is not a roadmap revision, and the pin is whatever main
  carries when this merges.
- **Citations.** No id comes only from an open revision any more: the one at `fd94f55` was removed
  (H05). The five "Lean names found nowhere" leads of `citations.md` are all declarations of this
  `Suggested.lean`, confirmed by `#check`. No notion was moved down from a later roadmap.
- **Pinned libraries.** Checked at the pinned versions:
  - Tau Ceti `henselianLocalRing` (`StrictHenselization/Henselian.lean`, line 45) holds for any
    ring and field;
  - `toTarget_surjective` (`StrictHenselization/Etale.lean`, line 138) has exactly the hypotheses
    of `StrictHenselization.isHenselization`;
  - `TauCeti.Algebra.IndEtale.flat` (`Etale/IndEtale.lean`, line 94) is the flatness used in the
    DVR proof route and is now pinned by `#check` and named in the supplier contracts (README line
    424);
  - Mathlib has no strictly-henselian or henselisation-recognition predicate.
- **Sources.** Stacks 04GF, 04GG, 08HQ, 08HR, 08HT, 04GP and 04GQ were read in the algebra chapter
  text, and 06DI and 0AP3 in the More on Algebra text, all fetched through the sources service from
  the Stacks project. No text was missing and `needs-references.toml` was not written.

## Adversarial pass (statements added or changed in Layer 4D)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `IsStrictlyHenselianLocalRing` | `𝔽̄_p`; `𝔽_2`; `ℤ_p`; `ℤ_(p)^{sh}`; `𝔽̄_p[t]_(t)`, `p` odd | `𝔽̄_p` yes. `𝔽_2` no (`𝔽_4/𝔽_2` separable). `ℤ_p` henselian, but `𝔽_{p²}/𝔽_p` is separable, so no. `ℤ_(p)^{sh}` yes. `𝔽̄_p[t]_(t)`: `X² − 1 − t` has the simple root `1` mod `t` and `1 + t` is not a square in `𝔽̄_p(t)`, so it is not henselian | definition determined; dropping henselian would accept the last ring | none (Checks present) |
| `IsStrictlyHenselianLocalRing.tfae` | `S = 𝔽_2`; `S = 𝔽̄_2`; `S = ℤ_p`; `S = 𝔽̄_p[t]_(t)` | `𝔽_2`: `T = 𝔽_4`, `𝔮 = 0`, no retraction, all three false. `𝔽̄_2`: `T = 𝔽̄_2ⁿ`, retraction = unique projection, all three true. `ℤ_p`: `T = W(𝔽_{p²})`, `κ(𝔮) = 𝔽_{p²}`, no retraction, all false. `𝔽̄_p[t]_(t)`: `T = (S[X]/(X²−1−t))_X`, `𝔮 = (t, X−1)`, no retraction, all false | consistent in both directions | none |
| `of_isSepClosed`, field not an instance | scratch `inferInstance` both ways | pair ⊢ class succeeds; class ⊢ `IsSepClosed` fails | as designed (Mathlib precedent) | README and docstring wording (H01, H10) |
| `isStrictlyHenselianLocalRing_algebra` | `R = 𝔽_p`, `Ω = 𝔽̄_p`; `Ω = κ` (excluded by `IsSepClosure`) | `R^{sh} = 𝔽̄_p`, strictly henselian. With `Ω = κ = 𝔽_p` the colimit is `ℤ_(p)^h`-like with residue field `𝔽_p`, not strictly henselian, so the hypothesis is needed | true | none |
| `IsHenselization` | `ℤ_(p)^h → 𝔽_p`; `ℤ_p → 𝔽_p`; `R^{sh} → Ω ⊂ Ω(x)`; `R = 0` | `ℤ_(p)^h` satisfies it (pin: henselian, `indEtale`, residue bijective). `ℤ_p` fails `indEtale`: ind-étale elements are algebraic over `ℚ`, `ℤ_p` is uncountable. `Ω(x)` fails surjectivity. `R = 0`: no `Algebra 0 L`, so vacuous | each field excludes a model | none (Checks present) |
| `StrictHenselization.isHenselization` | `Ω = κ`; `Ω = κ^sep`; `Ω` inseparable over `κ = 𝔽_p(t)` | First two: henselian (pin, any ring), surjective (pin, separable), ind-étale via `of_isColimit`. Inseparable `Ω = 𝔽_p(t^{1/p})`: the residue field of the colimit is the separable part, so `toTarget` is not onto; `Algebra.IsSeparable` is needed | true | instance → theorem + `attribute [instance]` |
| `existsUnique_comp_eq` (new) | `R = A = L = k`, `B = k[[t]]`; `A = ℤ_(p)^h`, `B = ℤ_p`; `A = B = ℤ_(p)^{sh}`, `L = 𝔽̄_p`; `χ : ℤ_(p)^h → 𝔽_p ↪ 𝔽̄_p` | `k → k[[t]]` unique (`algebraMap`). `ℤ_(p)^h → ℤ_p` unique, image countable, not onto. `Aut_R(R^{sh}) ≅ Gal(𝔽̄_p/𝔽_p) ≅ Ẑ`, and only `id` is compatible. Non-surjective `χ`: no `f`, since `toTarget` is onto `𝔽̄_p` and `χ` lands in `𝔽_p` | true; `hχ` necessary | added, three Checks |
| `bijective_of_comp_eq` | `k, k, k`; `ℤ_(p)^h` and `ℤ_p` | `id` bijective. With `B = ℤ_p` (not a henselisation) the unique map is not surjective, so `[IsHenselization χ]` is needed | true | docstring cites 08HR + 08HT |
| `isDomain_algebra` | `R = k`; `R = ℤ_(p)`; node `y² = x²(1+x)` | `k^{sh} = Ω`, a domain. `ℤ_(p)^{sh}` is a domain. Node: `(y − xs)(y + xs) = 0` with both factors nonzero in `Ω[[x,y]]/((y−xs)(y+xs))`, so normality is needed | true | instance → theorem; negative-control Check |
| `isDiscreteValuationRing_algebra` | `ℤ_(p)`; `𝔽_p[t]_(t)`; field `k` | DVRs with uniformizers `p` and `t`, residue field `Ω`. `k^{sh} = Ω` is a field, not a DVR (`not_a_field'`), so normal alone is not enough | true | none |
| `irreducible_algebraMap` (new) | `ϖ = p, −p` in `ℤ_(p)`; `ϖ = p²`; `ϖ = 0`; ramified `ℤ_(p)[√p]` | `p` generates `𝔪 R^{sh} = p R^{sh}` and is nonzero (faithfully flat), so it is irreducible. `p²` and `0` are not irreducible (hypothesis fails). In `ℤ_(p)[√p]`, `p = (√p)²` is reducible, so the Check excludes a ramified model | true | added, Check |
| Downstream bullet, SchemeAndStackFoundations | main README lines 108–111, 418, 886; §0.12 on main | §0.12 is the henselisation of a pair; no strict local rings on main | citation of #1656-only content | reworded (H05) |
