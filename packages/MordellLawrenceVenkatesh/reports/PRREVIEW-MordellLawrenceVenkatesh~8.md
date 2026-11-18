# Review of MordellLawrenceVenkatesh (pull request #1231 at 32a0090)

**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the 24 lines changed since `3e917e8` found no finding. The four small corrections of the previous review are all repaired, the repairs introduce nothing wrong (the new comparison of §0.14 with the pinned matrix transvection was recomputed against the library), and the pull request's title and description now agree with the head. Three format notes of the previous review still stand, none blocking; two points remain for the human reviewers.

## N01 — The heading of Layer LV.7, and the title of §7.9, are still word for word the title of LV20 §6

"Rational points on the base of an abelian-by-finite family" (lines 1759 and 1869) is the heading of LV20's Section 6 (LV20 line 25). Wording only; a title such as "Finiteness of rational points with few short Frobenius orbits" would name the mathematics.

## N02 — Five targets still have no `*Needs:*` line

§§0.22, 0.23, 9.10, 10.3 and 10.4 end at the locator. A line each (for §0.22, Mathlib `Submodule.goursat`; for §§9.10 and 10.4, integer gcd and extension of a primitive vector to a basis) would say what they use.

## N03 — A Check in §7.9 could record why the genus hypothesis of LV20 Proposition 5.3 is not needed

For genus 0 or 1 the geometric fundamental group is abelian, so full monodromy fails and §7.9 is vacuous; saying so saves a reader the comparison with LV20 line 1178.

## Previous findings

The previous review (of `3e917e8`) had no finding (no R item). Its small corrections, at this head:

- C01 — repaired: the title is "The Lawrence–Venkatesh method for families over curves and the Kodaira–Parshin family"; the prose culminates in §7.9 and §10.10 and reports one `declaration uses sorry`.
- C02 — repaired: §§3.4 and 3.5 now end "(Own linear-algebra derivation; used for the charts of 3.6.)" and "(… used for the chart cover in 3.6 and 3.7.)"; §3.6 cites 3.4 and §3.7 cites 3.5.
- C03 — repaired: §0.14 names `TauCeti.GLSymplecticFin.symplecticTransvection` as its coordinate form, and "From Tau Ceti" lists the declaration with its six lemmas and file; all found at the pin.
- C04 — repaired: (a) "the map `ψ` of 8.14 (LV20 (5.5))"; (b) "SchemeAndStackFoundations Layer 0" in both places; (c) "`p ∈ ∂T° = ∂S°_{g−1}`" and "the third loop `w₃ ∈ W` chosen by 10.4"; (d) "Its proof above".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §0.14, new sentence: coordinate form is the pinned `symplecticTransvection v r` | `m = 1`, `JFin = [[0,−1],[1,0]]`, `v = e₁`; `v = 0`; `cv`; conjugation by `g` | README: `x + r·ω(e₁,x)e₁ = x − r·x₂e₁`; pin (line 128): `x + (c·(v ⬝ᵥ J x))•v`, same. `T_0 = 1` (line 153). `c²r` = `a ^ 2 * c` (177). `ω(v,g⁻¹x) = ω(gv,x)` (211) | Holds; bullets 2–5 match lines 128, 147–170, 177, 211 | none |
| §0.14 against its own Check on `(k², det)` | `ω(e,f) = 1` | `det` has Gram `−JFin` in `(e,f)`, `JFin` in `(f,e)`; `T_e^r = [[1,r],[0,1]]` both ways after reordering; the new sentence is conditional on Gram `JFin` | Consistent | none |
| "From Tau Ceti", new bullet | the six lemma names, the ring, the carrier | all six at lines 128, 138, 159, 170, 177, 211; `[CommRing R]`, `Fin (m + m) → R` (line 68); `toLin'` form is `LinearMap.transvection (c • toBilin' J v) v` | Holds | none |
| §§3.4, 3.5 (locator replaced) | `d = 1`; `L = span(f₁,e₂)` in `k⁴` | graphs of `S` with `ω(x,Sy) = ω(y,Sx)`: all `1×1` matrices; `K = span(e₂)`, `I = {1}`, `L ∩ span(e₁,f₂) = 0` | Holds; no source claimed any more | none |
| §8.6 Check → §8.14 (sample) | `q = 3`, `g = 2` | `ψ` to `(ℤ/2)⁴`; image the 15 generating tuples, fibres `3² = 9`, total `135 = q^{2g−2}J₄(2)`. LV20 (5.5) at LV20 line 1254, image and Lemma 2.11 at lines 1256–1262 | Holds; pointer resolves | none |
| §10.5 sketch and Check (notation) | `∂T°`, `w₃` | §9.11 glues `S°_{g−1}` and `T°` along one circle, so `∂T° = ∂S°_{g−1}`; 10.4 gives a primitive `w` with `|ℓ₁(w)|, |ℓ₂(w)| > B`, `W` has one loop per primitive class | Consistent | none |

The rows for untouched statements stand as in the previous review, of `3e917e8`.

- Source locators checked against the text: 1 (LV20 (5.5), LV20 lines 1254–1262); the two LV20 locators the change removes were the subject of the previous C02.
- Library declarations opened at the pin: 8 (`symplecticTransvection` line 98 and six lemmas in `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Symplectic/Transvection.lean`; `JFin`, `Symplectic/Basic.lean` line 245).
- Cross-roadmap citations resolved for the changed text and the description: SchemeAndStackFoundations Layer 0 (main, line 674, Nagata rings §0.20), DiophantineApproximationAndTranscendence §2.4 (main, line 991), HeightsRationalPointsAndObstructions §6.4, MetaplecticAutomorphicForms §0.9a and FaltingsFinitenessAndIsogenyTheorems §R28.5.1 (open heads).
- Dependency check: `depcheck: 200 roadmaps, 2206 edges, 0 problem(s)`; no UPWARD or CYCLE line. Automatic checks: all passed.
- Elaboration of `TauCetiRoadmap/MordellLawrenceVenkatesh/Suggested.lean`: one `declaration uses sorry` (59:8), nothing else; the file is unchanged since `3e917e8`, so the signature comparison and the one-tactic probe of the previous review stand.
- Pull request text against the head: title, summary block and four prose paragraphs read; every section number named (§§0.3–0.4, 5.2, 7.9, 10.10, Layer LV.5, GeometricTopology Layer 1.7.2) exists and says what the text says; the folder has the three files named; the pull request adds the roadmap and changes nothing outside the folder.
- Five supplier names the tools could not find are names the supplier READMEs define, as in the previous review.

Overlap check: read GaloisSectionsPadicPeriodMaps, MappingClassGroupsAndCanonicalRepresentations, MordellLawrenceVenkateshPartII (scopes as in the previous review; the change touches no ownership); nothing shared. The pinned `symplecticTransvection` is Tau Ceti's and is now cited, not restated: §0.14 keeps the coordinate-free form over a field.

Source independence: changed passages only; 6 passages compared with 1 source (LV20), none shared (the changed text is pointers, library names and the roadmap's own notation). Largest share LV20, about 188 of 241 locators; no layer was added, removed or reordered, so the comparison of contents with LV20 stands: independent.

Research link: Layers LV.2–LV.4 and LV.7 are the period-map method and Proposition 5.3 of Lawrence–Venkatesh (2020); LV.8–LV.10 their Theorem 8.1. GaloisSectionsPadicPeriodMaps and MordellLawrenceVenkateshPartII (Lawrence–Sawin's hypersurface results) cite these sections. Rests on the README and LV20 §§1, 5.

## Not verifiable

- GX13 (§§5.2–5.4, 5.7): only a 28-page excerpt is readable; untouched by this change.
- BO78, Corollary 7.4 (§2.11) and Fal83, §6 (§1.1): no legal readable text; cited by locator alone, untouched by this change.
- The description's remark that Lake also prints a notice about importing Mathlib without being a `module` was not reproduced: the direct elaboration prints the `sorry` warning only.

## Source issues

- none

## For the human reviewers

- Licence: the text of FM12 used for page numbers is a 509-page copy in the sources cache whose recorded origin is a third party's university page, not the authors' or the publisher's; an author-page copy (402 pages, other pagination) is also cached.
- Not tested: GX13 is cited for the classification and triangulation of surfaces (§§5.2–5.4, 5.7); only its preface could be read, so wording and locators were not compared with it.
