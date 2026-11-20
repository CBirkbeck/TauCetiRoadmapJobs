# Review of NoncommutativeFlatness (pull request #2618 at 3f0df5e)

**Verdict:** accepted

**Summary.** Accepted: no finding remains. This is an incremental re-review of the 46 lines changed since `7fd388d`; the one earlier finding is repaired (`BalancedTensorProduct.homRightModule` now assumes `[IsScalarTower R A N]`, under which its remaining proof obligation is true), and the three earlier small corrections are repaired as well. There is one small correction (the description does not name the supplier the README now lists) and two format notes, none blocking; four points are left for the human reviewers.

## C01 — The description does not name SpectralSequencesAndConvergencePartII §4.1, which the README now lists as a supplier

The description's paragraph on suppliers reads "All suppliers are already on `main` (no open PR dependencies): pinned Tau Ceti (…), `RepresentationTheory/ArtinAlgebras` §0.2 (…) and §0.3 (…), and ArtinAlgebras §1.1's `IsFinitelyPresentedFunctor`". At this head "From other roadmaps" (README lines 314–315) also lists SpectralSequencesAndConvergencePartII §4.1 for `nonempty_tor_iso_tor'`, so a reader of the description does not learn of that supplier. The first clause stays true, since that roadmap is on main. Adding "and SpectralSequencesAndConvergencePartII §4.1 (`nonempty_tor_iso_tor'`, whose `ModuleCat R` case 1.6 restates)" to the list makes it complete.

## N01 — `letI` in two theorem statements

`isMoritaEquivalent_tfae` (`Suggested.lean` lines 1144–1150) and `BalancedTor.outerSMulCommClass` (lines 1273–1274) still bring module structures into scope with `letI` inside the statement; a named instance argument reads and applies more easily.

## N02 — "current Tau Ceti `main`" and "not yet at this roadmap's pin" date the Scope paragraph

README lines 103–105 (and "on Tau Ceti `main`", line 1398) describe the state of the library on the day of writing; a reader a year on cannot tell what "current" and "not yet" refer to. "(`IsFinitelyPresentedFunctor` in ArtinAlgebras' `Suggested.lean`)" alone is true and timeless; the remark about the pin would fit the pull request's description, which already carries it.

## Previous findings

- R01 — repaired: "`(N : Type v) [AddCommGroup N] [Module A N] [Module R N] [IsScalarTower R A N]`" on `homRightModule`; `homRight` supplies it by `IsScalarTower.of_algebraMap_smul fun _ _ ↦ rfl`. The file elaborates.
- C01 — repaired: `categoryAlgebraSingleObjRingEquiv_apply` is now proved, "`… := rfl`", so it is no longer a `sorry` target.
- C02 — repaired: the docstring reads "restated as that supplier's statement and not a target of this roadmap", and "From other roadmaps" lists SpectralSequencesAndConvergencePartII §4.1.
- C03 — repaired: "predicate is `IsFinitelyPresentedFunctor` in ArtinAlgebras' `Suggested.lean` (implemented on current Tau Ceti `main` as … not yet at this roadmap's pin)"; true at the pin; the wording is N02.
- N01 — not repaired: `letI` remains in the two statements (N01 above).
- N02 — repaired: "the projective-stable category of the abelian category `Mod C`, written `underline{Mod C}`".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 0.7 `homRightModule`, obligation `a • (r • x) = r • (a • x)` | with `[IsScalarTower R A N]`; without it; earlier counterexample `R = ℂ`, `A = M₂(ℂ)`, `r ↦ diag(r, r̄)` | with: `a(r x) = (a·r1)x = (r1·a)x = r(a x)`, `smul_comm` elaborates; without: `SMulCommClass A R N` not found; counterexample has `i • e₂ = −i e₂ ≠ (i·1) e₂`, excluded | true at stated generality | none |
| 0.7 `homRight` | `Module.compHom N (algebraMap R A)` | `r • x := algebraMap r • x`, so `(r • a) • x = r • (a • x)` by `rfl` after `of_algebraMap_smul` | instance supplied, elaborates | none |
| 1.6 `nonempty_torIsoTor'` | supplier on main, §4.1 "Balancing Tor"; `R = ℤ`, `ℤ/m`, `ℤ/n` | supplier declares `nonempty_tor_iso_tor'` (its `Suggested.lean` line 284, README line 1600); `Tor₁ = ℤ/gcd(m,n)` both orders | citation resolves; symmetric | none |
| 1.7 `categoryAlgebraSingleObjRingEquiv_apply` | `rfl` in the file | elaborates with no error and no warning; `unop((a*b)(∗,∗)) = unop a · unop b` as before | proved | none |
| 1.4 embedding of `underline{mod C}` | factorization `X ⟶ P ⟶ Y`, `Q ↠ Y` from `proj C` | `P` projective lifts `P ⟶ Y` to `P ⟶ Q`; `X ⟶ Y` factors through `Q` | sentence true; no abelian claim on the stable category | none |
| Scope, finitely presented functors | pinned Tau Ceti (`2fd255d9`); ArtinAlgebras on main | no `CategoryTheory/FinitelyPresentedFunctor`, no such declaration at the pin; ArtinAlgebras `Suggested.lean` line 142 defines `IsFinitelyPresentedFunctor` | sentence true at the pin | N02 |

The rows for the untouched statements stand as in the previous review, of `7fd388d`.

- Source locators checked against the text: none new; the diff changes no locator (the [AB, §2.1, pp. 48–52] citation of 1.4 was only reflowed).
- Library and roadmap declarations opened: `IsScalarTower.of_algebraMap_smul` and `smul_comm` (by elaboration at the pin); ArtinAlgebras `Suggested.lean` line 142; SpectralSequencesAndConvergencePartII `Suggested.lean` line 284 and README line 1600.
- Cross-roadmap citations resolved on main: ArtinAlgebras §1.1; SpectralSequencesAndConvergencePartII §4.1 (heading at its README line 1594).
- Elaboration of `Suggested.lean` at the pins: no errors, 203 `sorry` warnings (204 before; the one now proved), nothing else. `Suggested.lean` has 2,253 lines, as the description says.
- Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`. SpectralSequencesAndConvergencePartII is on main and earlier in the merge order. No change outside the roadmap folder.
- Headline theorems: unchanged by the diff; all stated, none named as not statable.
- Seeded sample: of the sampled sections, only 1.4 and 1.6 fall in changed passages; both rows above.
- Overlap check: read ArtinAlgebras (main), QuiverRepresentations (main), LocallyPresentableCategories (open); `mod C` — owner ArtinAlgebras §1.1, cited; `Tor ≅ Tor'` — owner SpectralSequencesAndConvergencePartII §4.1, cited and now marked as its statement; otherwise as in the previous review; nothing else shared.

Source independence: changed passages only; 3 passages compared (Scope paragraph, 1.4 stable-category sentence, 1.6 docstring), all the author's prose with no source text beside them, none shared; largest share Mitchell, 17 of about 190 locators; contents not compared again (no layer added, removed or reordered; Mitchell's contents not readable).

Research link: The headline targets are Bass's Theorem P (Bass 1960) with its categorical form (Simson 1977, Harada 1973), Crawley-Boevey's representation theorem (1994) and Auslander's global-dimension theorems (1955); the README names flat-dominant dimension (Hoshino 1989, Xi 2021) as a user. Rests on the README and on Bass and Auslander read at their locators.

## Not verifiable

- That Tau Ceti's main branch has `TauCeti.IsFinitelyPresentedFunctor` in `TauCeti/CategoryTheory/FinitelyPresentedFunctor/Basic.lean` (README lines 103–105): only the pinned Tau Ceti was available, and it does not have it, as the README says.
- The sources listed as unread in the previous review remain unread; the diff changes no locator into them.

Automatic checks set aside as false positives: four names reported as undeclared are two Tau Ceti declarations that exist at the pin, a field of Tau Ceti's balanced tensor product, and the notation `Tor_0`; eight reports of TeX syntax are inside code spans that wrap over a line break; the subsection "Layer 4 checks" is read as a layer heading; the Prop-valued instances and the true `sorry` proof fields of definitions with real data are not `sorry` data.

## Source issues

- none

## For the human reviewers

- **Scope.** Clause 4″ of the categorical Theorem P (right simple subobjects and orthogonal idempotents, README lines 1310–1312) is, in the README's words, this roadmap's own extension of Bass's clause (7); no refereed source states it.
- **Scope.** `Module.End.exists_prod_eq_zero_of_isNilpotent` (4.3) is stated for multiplicatively closed nil sets; the README (lines 1252–1255) says its two sources state it for nil subrings and nil one-sided ideals.
- **Scope.** The README plans changes to existing Tau Ceti declarations "without shims" (`IsSuperfluous`, `globalDimension`, `IsSemiperfectRing`, and ArtinAlgebras §1.1's `IsFinitelyPresentedFunctor`; lines 101–125, 1396–1410).
- **Not tested.** Mitchell, *Rings with several objects*, has the largest share of locators (17); neither its text nor its contents page could be read, so wording and arrangement were not compared with it.
