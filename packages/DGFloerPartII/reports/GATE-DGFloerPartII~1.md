# GATE-DGFloerPartII~1 — answers to the review of 76ed25e

The review was written against head 76ed25e; the pull request now stands at 9c233de (on top of
0432579, which already carried most of the repairs). Each point below is checked against
`TauCetiRoadmap/DGFloerPartII/README.md` and `TauCetiRoadmap/DGFloerPartII/Suggested.lean` as
they are now.

## H01 (CBirkbeck) — answered

Confirmed and unrepairable inside this folder. On main (a0ad405e) `TauCetiRoadmap/DGFloer/README.md`
still states Layer 11 items 1–6 (lines 1568–1640: abundance, fibered families, covering by
diffeomorphisms with Lemma 6.35 and both proofs of Proposition 6.34, homogeneous spaces,
projective spaces, Theorem G), Layer 5 item 7 (line 1044, the projective based-loop energy), Layer
1 items 7–8 (lines 825–832) and the Theorem B/5.14 endpoint in Layer 10 item 5 (line 1558); at
the head of the base's open revision (fbfbe3e8) Layer 11 is reduced to 11.1–11.3 (the finite
cover `T × K → G`, higher homotopy across the cover, the torus criterion) and its Scope says
DGFloerPartII consumes it and supplies nothing to it. The deletion half of the move can only
land in the base; this folder cannot carry it, so the merge order must take the base's revision
before this pull request. Every citation this README makes into the base resolves under both
numberings (Layer 1 items 1–6, Layer 2, Layer 3 item 4, Layer 4 item 5, Layer 5 items 4–6,
Layer 6 items 3–5, Layer 10 items 2–5, and the finite cover and torus criterion, which sit in
Layer 11 item 3 on main at line 1614 and in 11.1–11.3 at the revision head), so no citation
edit is needed once the order is settled.

## H02 (CBirkbeck) — applied

Applied at 0432579 and verified now: the README has no `blob/<sha>` link (gate `blob=0`); the
on-main suppliers are linked by relative path (lines 3, 221, 224, 226, 231, 235, 238, 242, 247,
all nine paths exist under `TauCetiRoadmap/`), and TangentialBordism B5/B6.3 and HomotopySpheres
3A–5 are cited by name and section only. Crowley–Schick–Steimle is linked to arXiv alone (line
1091). The former "same revised version" sentence is replaced by "Numbers follow
arXiv:2404.07953v3" (line 1060), which is the version the sources service fetched
(`bdho-floer`, text header "From https://arxiv.org/pdf/2404.07953v3", dated May 14, 2026).

## H03 (CBirkbeck) — applied

Applied at 0432579: the expression is one code span,
`` `C_*(Ω_p B) ⊗_{C_*(Ω_p B)} P_B` `` (line 566), and the gate reports `tex=0`.

## H04 (CBirkbeck) — applied

Applied at 0432579: the README now has `## Scope and ownership` (32), `## Conventions` (98),
`## Exact supplier contracts` (125, one subsection per supplier), `## How to read the build`
(251), subsections 1.1–1.5, 2.1–2.6, 3.1–3.4 and 4.1–4.6 each with a `*Needs:*` line and a
`**Checks.**` list of at least three bullets (3.4 had two; a third, the sign of the magnetic
translation, is added at line 732), every layer closed by `### Examples` and `### Dependencies`,
then `## Downstream consumers` (1035) and `## References` (1080). The gate reports
`target-ids=0`, and the dependency check now reads this roadmap's edges: `depcheck: 237 roadmaps,
2104 edges` (2068 before), with no UPWARD or CYCLE line.

## H05 (CBirkbeck) — applied

Applied at 0432579: `Suggested.lean` begins `module` / `public import Mathlib` and declares
inside `@[expose] public section`. The targeted build now emits only the eight
`declaration uses sorry` warnings and no module-system notice.

## H06 (CBirkbeck) — applied

Applied at 0432579: `UnitTangent`, `rotationFamily` and its four lemmas are gone; the file keeps
`SO`, the seven low-rank values and `isOfFinOrder_pi_SO` (lines 33–67), and the README keeps the
rotation family, its periodicity, its image and its degree as targets and Checks of 1.4
(lines 397–452).

## H07 (CBirkbeck) — applied

Applied at 0432579 (no Tau Ceti import, `open scoped Topology` only, acceptance-test docstring
with the not-statable list) and completed now: the docstring is reflowed so that no line begins
with the word `theorem` (line 8 ends "the roadmap's", line 9 begins "headline theorems"). A
scratch `#check @name` of all nine declarations against the rebuilt module elaborates exactly the
types the README states (for example `isOfFinOrder_pi_SO : ∀ (k : ℕ), Odd (k + 3) → ∀ (x : π_ (k + 2) (SO (k + 3)) 1), IsOfFinOrder x`); the file has no section variables, so no binder can drop.

## H08 (CBirkbeck) — applied

The clauses the review quoted were already gone at 0432579; the same pattern survived in
fourteen other places and is now rewritten as statements of what is built: "Out of scope, so
nobody mistakes them for targets" → "Out of scope." (89); "not a premise of …" → "the … targets
do not depend on this comparison" (373–374); the "no Stiefel-quotient, unstable Bott or
Pontryagin–Thom premise" clause of 1.4 deleted (414); "not the generic owner" → "where
HomotopySpheres 4B.2–4B.5 compute the same examples, compare …" (486–487); "is not the
higher-generator construction" → "since `H_(2d+1)(CPᵈ) = 0` and `H_(4d+3)(HPᵈ) = 0`, these maps
are not transgressions from the base" (598–599); "not relabelled as `g` … three separate targets"
→ "twice the generator `g`" (622); "smoothing floor … this target's construction" → "the
smoothing uses Mathlib's …; the finite-chart embedding is constructed here" (688–689); "No
integral every-class realization is asserted" → "only the multiple `Nα` of 3.1 is realized"
(709–710); "No Lie theory is rebuilt here" deleted (862); "not stable periodicity alone" → "from
the unstable finite-rank data below" (865); "direct … proof, with no … premise, … two separate
targets" → "Both proofs are targets" (893); the untwisted-shriek sentence now states the
computed fact (936–938); "provenance, not specification" → "records where each numbered statement
… lands" (1058).

## H09 (CBirkbeck) — applied

Applied at 0432579 and checked against the source: `bdho-floer` lines 5124–5139 define
`f : T¹_pSⁿ × S¹ → SO(n+1)`, take `A = f_*([S^(n−1)] × [S¹])` and compute the degree of
`ev_p ∘ f`. The README's Conventions give the matrix `R(p, u; θ) = I + (cos θ − 1)(p pᵀ + u uᵀ) +
sin θ (u pᵀ − p uᵀ)` with `R p = cos θ·p + sin θ·u` and `R u = −sin θ·p + cos θ·u`
(verified: `(p pᵀ + u uᵀ)p = p`, `(u pᵀ − p uᵀ)p = u`); 1.4 defines `f(u, θ) = R(p, u; θ)` into
`SO(n+1)`, states `ev_p ∘ f(u, θ) = cos θ·p + sin θ·u` and the degree `1 + (−1)^(n−1)` of the
composite; 4.3's second proof takes `A = f_*([S^(n−1)] × [S¹]) ∈ H_n(SO(n+1))`. The `n = 1` Check
computes the degree as `(+1)(+1) + (−1)(−1) = 2` with the boundary orientation of `S⁰`.

## Build

    lake build TauCetiRoadmap.DGFloerPartII.Suggested
    Build completed successfully (8954 jobs); 8 warnings, all `declaration uses sorry`
    (Suggested.lean lines 37, 40, 43, 47, 51, 55, 59, 66); no other warning or error.

## Gate

    gate DGFloerPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL
      depcheck: NOT IN ORDER: DGFloerPartII (insert it after its last supplier)

The only failure is `NOT IN ORDER`: the merge-order file has no line for DGFloerPartII (it listed
it at position 67 when the review was written); the brief says a roadmap not yet in the order is
placed after its last supplier at intake, so this is not a defect. Dependency check with
`--movable`:

    NOT IN ORDER: DGFloerPartII (insert it after its last supplier)
    depcheck: 237 roadmaps, 2104 edges, 1 problem(s)

No UPWARD or CYCLE line. Suppliers in the order: SmoothBundlesConnections 8, TangentialBordism
10, HomotopySpheres 66; every other supplier is on main.

## Citations and pins

All cross-roadmap citations resolved now: HomotopySpheres at 52ebd6f8 (3A.1 line 663, 3A.2 678,
3B.3 859, 4A.1 1204, 4B.2–4B.5 1351–1379, 4B.8 1435, 5.0 1529, 5.1.3 1671); TangentialBordism at
b345f48b (B5.1–B5.7 lines 960–1379, B6.3 = 10.1 line 2276); on main GeneralizedCohomology G4 (936,
items 0–5 giving G4.0b, G4.3–4.5) and G5 (1373), G2.10 (405); ComplexKahlerGeometry K7 (1405);
SmoothBundlesConnections B1.4 (421), B2.2 (605), B2.5 (802), B6.2 (1668), B6.3 (1716);
RiemannianGeometry R1 (179), R2 (300), R3 (347, `basedLoopCWType` 507); MorseTheory M5 (611);
GeometricTopology Layer 1 (177), Layer 3 (357, `Diff(M)` and `O(n+1) → Diff(Sⁿ)` 388);
AlgebraicTopology Stages 2 (326), 4 item 4 (`reducedSuspensionSphereHomeomorph`,
`compactReducedSuspensionCarrierComparison` 544–580), 6 (946), 8 items 1–7 (1602 ff.);
DifferentialGeometry Layer 10 (877); LieGroups Layer 2 (275). At the pins: `TauCeti.IsAspherical`
(EilenbergMacLane/Basic.lean 59), `HomotopyGroup.pathLoopSpaceMulEquiv` (LoopSpace.lean 361),
`LocalCoefficientSystem` (LocalCoefficient.lean 43); Mathlib `HomotopyGroup.Pi` (HomotopyGroup.lean
458, notation 461), `Matrix.specialOrthogonalGroup` (UnitaryGroup.lean 313), `IsOfFinOrder`
(OrderOfElement.lean 64), `exists_contMDiffMap_zero_one_of_isClosed` (PartitionOfUnity.lean 492),
`ContinuousMap.compactOpen` (CompactOpen.lean). Ownership against the open pull requests listed in
the brief was checked for the Layer 4 objects only through the DGFloer revision head; no other
open roadmap states Lemma 6.35, Theorem B or the abundance package.

## Sources

`bdho-floer` (arXiv 2404.07953v3) and `crowley-schick-steimle` (arXiv 2012.13634v1) read through
the sources service. Statements checked at their locators: Theorem B (line 243), Theorem 5.14
(4267–4272), Definition 6.11 (4517–4523), Theorem 6.12 (4525), Proposition 6.23 (4849–4856),
Definitions 6.26 and 6.32 (4919, 5051), Propositions 6.29 and 6.33 (4935, 5059–5062), Lemma 6.35
and its proof (5073–5094: the printed `π₈(SO(9)) = ℤ₄` at 5076, the splitting for `n ≥ 16` at
5078–5079, the odd `n ≥ 17` summary at 5093), both proofs of Proposition 6.34 (5095–5139),
Proposition 6.36 (5141–5158), Theorem I (430–445), Proposition 6.39 (5247–5262), Theorem 7.1 and
its standing hypotheses (5355–5372); `crowley-schick-steimle` 221–223 (the stabilisation
`π₈SO₉ → π₈SO = ℤ/2` split with kernel `ℤ/2`). The roadmap folder has no `sources.toml` and the
brief does not allow editing one here; no text was missing, so `needs-references.toml` was not
written.

## Adversarial pass on the statements changed or added

| Statement | Instances | Values | Result | Change |
| --- | --- | --- | --- | --- |
| 3.4 new Check: `Ψ'^*_σ λ_can = λ_can − π^*σ` for `Ψ'_σ(q,p) = (q, p − σ_q)`, `λ_can = p dq` | `Q = ℝ`, `σ = a(q) dq` | `Ψ'^*(p dq) = (p − a(q)) dq = λ_can − π^*σ`; `d` gives `ω_can − π^*dσ` | holds; translation by `+σ` on `ω_can + π^*dσ` gives `ω_can + 2π^*dσ` | Check added (line 732) |
| 3.4 new Check: `π ∘ Ψ'_σ = π` | any `U`, `σ = 0` and `σ = dh` | `H_n(Ψ'_σ(U)) → H_n(Q)` equals `H_n(U) → H_n(Q)` after `(Ψ'_σ)_*`; `σ = 0` is the identity | holds | none |
| 2.5 rewording: `H_(2d+1)(CPᵈ) = 0`, `H_(4d+3)(HPᵈ) = 0` | `d = 1`: `H₃(CP¹) = 0`, `H₇(HP¹) = 0`; `d = 2`: `H₅(CP²) = 0`, `H₁₁(HP²) = 0` | odd degrees of `CPᵈ` and degrees not `≡ 0 (mod 4)` of `HPᵈ` vanish | holds | wording only |
| 2.6 rewording: `β_*(σ_p)_*[Σ_p] = ±2g` with `g` the generator | `d = 1`: `±2x²` in `H₂(ΩS²) = ℤ·x²` | twice a generator, consistent with the Remark 6.19 single-component class `±x²` (Check unchanged) | holds | wording only |
| 4.4 rewording: without the twist the shriek of `[G]` counts components of `H` with signs `χ(h)` | `G = SO(3)`, `H = O(2)`, `M = ℝP²` | reflection component `χ = −1`, rotation component `χ = +1`; twisted cycle `[O(2)]` on both components | consistent with the `ℝP²` Check | wording only |
| 4.3 rewording: Lemma 6.35 from the unstable finite-rank data | `n = 3, 5, 7, 9`: `0, ℤ/2, 0, (ℤ/2)²`; `n = 17`: `ℤ/2 ⊕ ℤ/2`; `n = 19`: `0 ⊕ ℤ/2` | all torsion; splitting false below `n = 16` (`n = 7`: `0 ⊕ ℤ/2 ≠ 0`) as the Check says | holds | wording only |
| 1.4 (H09) degree of `ev_p ∘ f` | `n = 1`: two circles, orientations `+1`, `−1` on `S⁰`; `n = 2`: `H₂(SO(3)) = 0`; `n = 3`: `H₃(SO(4)) = ℤ²` | `2`, `0`, `2`; involution `(u, θ) ↦ (−u, 2π − θ)` has degree `(−1)^n · (−1) = (−1)^(n−1)`; local degree at a preimage is `(−1)^(n−1)` under the boundary orientations, so the total is `(−1)^(n−1)(1 + (−1)^(n−1)) = 1 + (−1)^(n−1)` | holds | none |
| Conventions matrix `R(p, u; θ)` | `p = e₀`, `u = e₁`, `θ = π/2` | `R e₀ = e₁`, `R e₁ = −e₀`, `R e₂ = e₂`; `det = 1`; `R(θ + 2π) = R(θ)`, `R(0) = I` | holds | none |

The commit on the pull-request branch is 9c233de, "DGFloerPartII: review repairs (timeless
wording sweep, magnetic-sign Check, docstring reflow)"; not pushed.
