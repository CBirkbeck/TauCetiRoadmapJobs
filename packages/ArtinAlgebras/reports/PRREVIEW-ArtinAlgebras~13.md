# Review of ArtinAlgebras (pull request #2190 at 172ba68)
Folder: `TauCetiRoadmap/RepresentationTheory/ArtinAlgebras/`
**Verdict:** needs changes

## R01 (P3) — §4.3 says QuiverRepresentations consumes only the first existence theorem

**Location:** README.md:1015–1017: “Over a field the existence theorems are Tau Ceti's `ModuleCat.exists_isAlmostSplit_arTranslate` and `ModuleCat.exists_isAlmostSplit_of_not_injective`, their case `R = k`, of which QuiverRepresentations 6E consumes the first.”

**Claim:** This is false on main. QuiverRepresentations 6E (its §6.3) consumes both pinned existence theorems, including the dual. The clause came in with the repair of the previous R03.

**Witness:** `RepresentationTheory/QuiverRepresentations/README.md` on main: line 870 maps “6E” to §6.3. §6.3, lines 945–948, cites `ModuleCat.exists_isAlmostSplit_arTranslate` and, for the dual, `ModuleCat.exists_isAlmostSplit_of_not_injective` with `ModuleCat.exists_isAlmostSplit_X₁_eq_iff`.

**Repair:** At README.md:1017, replace “of which QuiverRepresentations 6E consumes the first.” with “both of which QuiverRepresentations 6E consumes.”

## Previous findings

Ids refer to `packages/ArtinAlgebras/reports/PRREVIEW-ArtinAlgebras~12.md`.

- R01 — repaired: the comparison bullet is gone. The §7.4 *Needs:* line now ends “Mathlib `CategoryTheory.IsSeparator`, `CategoryTheory.IsCoseparator`, `CategoryTheory.Retract`.” (README.md:1392–1394). The double centralizer is 7.1's own target (README.md:1222–1223).
- R02 — repaired: “Here `add G` is the class of retracts of the finite biproducts `Gⁿ`, and `Suggested.lean` states `add G = C` in this unfolded form.” The redefinition target and the `TauCeti.additiveClosure` docstring sentence are deleted.
- R03 — repaired: “From Tau Ceti” (README.md:273–274) and the §4.3 *Needs:* line list `ModuleCat.exists_isAlmostSplit_of_not_injective`. The repaired §4.3 sentence adds a false clause about QuiverRepresentations, reported above as R01.
- R04 — repaired: “…and `Quotient`; 2.3's duality for Artin algebras; Tau Ceti `TauCeti.IsRepresentationFinite` (6.1).” (README.md:1516–1517.)
- R05 — repaired: both declarations are deleted. Docstring: “Dominant dimension (Layer 7): `HasProjectiveInjectiveCoresolution`, the number `dominantDimension` in `ℕ∞`, and the left-right symmetry `dominantDimension_mulOpposite`.” The README bullet keeps the statement in prose.
- R06 — repaired: “…the *flat-dominant dimension* ([Xi, §1]).” (README.md:1298). “Following Xi, the flat version is the *flat-dominant dimension*.” (Suggested.lean:323–324). Neither file now contains `flatDominantDimension`.
- R07 — repaired: “Part 2 (the next five commits)”. The Checks sentence now names §0.5 and §7.4. The description adds “…are renamed `two_le_dominantDimension_end` and `exists_algEquiv_end_of_two_le_dominantDimension`, and `HasProjectiveInjectiveCopresentation` is removed.”

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 0.5 `IsAdditiveGenerator` (docstring, prose) with `isAdditiveGenerator_iff_forall_indecomposable` | `mod ℤ/9`: G=`ℤ/3⊕ℤ/9`, G=`ℤ/9`; `ModuleCat k`, G=`k`; X=0 | `(ℤ/3)ᵃ⊕(ℤ/9)ᵇ` retract of `G^(a+b)`: true/true; `ℤ/3` not a summand of free `(ℤ/9)ⁿ`: false/false; `k^ℕ` not in `add k`: false; n=0 | the unfolding is `add G = C` | none |
| 7.3 `dominantDimension` (docstring) | `k[x]`; `ℤ/4`; `k×k`; `T₂(k)` | `k[x]`: only f.g. proj-inj is 0, so 0; flat version `0→k[x]→k(x)→k(x)/k[x]` gives 1; `ℤ/4`, `k×k` self-injective: ⊤; `T₂(k)`: `E⁰=P₂⊕P₂`, `E¹=S₂`: 1 | docstring claims hold | none |
| 7.3 prose bullet `dom.dim Γ ≥ 2` ⟺ copresentation (Lean form deleted) | n=2 unfolding; `T₂(k)`; `k[ε]/ε²`; zero ring | n=2: objects `0,Γ,I⁰,I¹`, exact at Γ and I⁰; `T₂(k)`: cokernel ⊇ `S₂`, which embeds in no `P₂ᵐ` (socle `S₁ᵐ`): fails, 1<2; `0→B→B→0`: holds; `0→0→0→0`: holds | bullet and §7.3 Checks agree | none |
| 4.3 `exists_isAlmostSplit_of_not_injective`, field case `ModuleCat.exists_isAlmostSplit_of_not_injective` | `k[ε]/ε²`, N=`k`; A=`k`; `ℤ/4`, N=`ℤ/2` | `0→k→B→k→0` from both, terms f.g.; every `k`-module injective: both vacuous; `ℤ/4` outside the field case: `0→ℤ/2→ℤ/4→ℤ/2→0` | the field case is `R = k`; consumer clause false | R01 |
| 7.4 `isSeparator_iff_exists_retract` (comparison removed) | over `ℤ/4`: M=`ℤ/2`, M=`ℤ/2⊕ℤ/4` | `ℤ/2`: projection `ℤ/4→ℤ/2` and 0 agree on every `ℤ/2→ℤ/4`; `ℤ/4∉add ℤ/2`: false/false; `ℤ/2⊕ℤ/4`: n=1, true/true | holds; *Needs:* complete without Tau Ceti | none |
| 7.5 `exists_equiv_quotient_moritaSetoid` against its *Needs:* | constants of the statement; A=`k[ε]/ε²` | `AlgCat`, `IsMoritaEquivalent`, `Quotient`, `TauCeti.IsRepresentationFinite`, `globalDimension`, `dominantDimension`, `IsAdditiveGenerator` all listed; A ↦ `End(B⊕k)`, dimension 5 | *Needs:* complete | none |

The rows for untouched statements stand as in the previous review, of `292f85b`.

- Source locators checked against the text: 1. [Kr, Thm. 4.2, p. 9], cited in the changed §0.5, is kr line 451 (page 9 marker at line 434).
- Library at the pins, 3 declarations opened: Tau Ceti `ModuleCat.exists_isAlmostSplit_arTranslate` (Sequence.lean:70), `ModuleCat.exists_isAlmostSplit_of_not_injective` (Sequence.lean:110) and `TauCeti.IsRepresentationFinite` (ModuleCat/RepresentationFinite.lean:48).
- Removed names: `Module.IsGenerator`, `additiveClosure`, `TauCeti.IsAdditiveGenerator`, `toModuleEnd_moduleEnd_bijective_of_isGenerator`, `flatDominantDimension`, `two_le_dominantDimension_iff` and `HasProjectiveInjectiveCopresentation` occur in neither file.
- Cross-roadmap citation resolved on main (7342e8f): QuiverRepresentations 6E → §6.3 (lines 870, 940–948), which gives R01.
- Gate: the worker's gate passes. A hand run gives every check 0 except `outside-folder` for `TauCetiRoadmap/RepresentationTheory/README.md`, the family index, which is this pull request's own file and is unchanged since `292f85b`.
- Elaboration: `lake env lean Suggested.lean` gives 26 `sorry` warnings and nothing else, as the description says. `#check @` of all 35 declarations elaborates with no errors, and the signatures of `IsAdditiveGenerator` and `dominantDimension` are unchanged.
- Dependency check: `depcheck: 206 roadmaps, 1897 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Overlap check: read RepresentationTheory (main and open heads #1047, #1220, #1775), QuiverRepresentations (main), GrothendieckEulerForms (main) and GeneralAlgebraicKTheory (open). Dominant dimension, additive and generator-cogenerators and the correspondences are ArtinAlgebras' alone. Almost-split existence over a field is Tau Ceti's, consumed by both. Nothing is shared.

## Not verifiable

- [ARS] (Cambridge book, no legal copy): Thm. V.1.15, next to the changed §4.3 sentence.
- [Mü] (Cambridge Core, not marked open access): Thm. 2, p. 401, in §7.4 next to the changed text.

## Source issues

- **Misprint** in Kr at Theorem 4.2, p. 9: the source says the conjunction “and” twice in a row in the conclusion; it should be said once; affects nothing.
