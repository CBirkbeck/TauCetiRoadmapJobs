# Review of SmoothRepresentationsOfLocalGroupsPartII (pull request #1815 at 9739abb)

**Verdict:** needs changes

## R01 (P3) — Dangling reference to the retired σ-finite duality contract

**Location:** TauCetiRoadmap/SmoothRepresentationsOfLocalGroupsPartII/README.md:512 (§1.5, proof route) — “on such H the Haar measure is σ-finite and the duality contract applies.”

**Claim:** The README no longer states any duality contract: this head replaced “The σ-finite duality contract” by a citation of an existing theorem, so the phrase has no referent.

**Witness:** README.md:107 now reads “Consume BanachSpaceTheory B5, `exists_lpInftyDualEquiv`”; a search for “duality contract” finds line 512 only; §1.5’s own *Needs:* line (522) already cites the declaration.

**Repair:** Replace the clause by “on such H the Haar measure is σ-finite and BanachSpaceTheory B5, `exists_lpInftyDualEquiv`, applies.”

## Previous findings

- R01 — repaired: README:1234 “0 ≤ ν_k ≤ ⋯ ≤ ν₁ < ½”, with the PGL₄ Check at 1242 citing CH26 (6.15), p. 20.
- R02 — repaired: README:1276 “the largest occurring positive-coroot level r (equivalently, 1 ≤ r ≤ h − 1)”, with the A₁ Check at 1286.
- R03 — repaired: README:1364 “ψ₀ is a character of k trivial on 𝔭 and nontrivial on O (conductor 𝔭)”; README:1374 negative control “ψ₁ of conductor O”, with the ℚ₃ values.
- R04 — repaired: Suggested.lean:128 declares `extremePoints_closure_convexHull_subset_closure` under Layer SRU.1 with the seven binders and the compactness hypothesis; README:457 names it.
- R05 — partly repaired: README:13, 107, 490, 502, 522 cite BanachSpaceTheory B5, `exists_lpInftyDualEquiv`, and the contract paragraph is gone; README:512 still says “the duality contract applies” (R01 above).
- R06 — repaired: README:15, 139, 1557, 1569 cite Springer §§6.2–6.5; README:151, 1523, 1525, 1529 cite Excursion §0.0, §3.3, §§4.1–4.3; no “Layer S”, “SC3” or “SC4” remains.
- R07 — repaired: README:1682 “gives (3/2 + ν, −3/2 + ν, 3/2, ½). Changing the second coordinate's sign is a Weyl action”; README:1684 “After this Weyl action”; no “misprint” remains.
- R08 — repaired: GS23 p. 32 at README:817, 853; p. 33 at 829, 971, 1003; CH26 pp. 28–29 at 1666 and p. 29 at 1678.
- R09 — repaired: the description says “seven simple definitions and eight headline theorem signatures” and names LieHighestWeightPartII, Springer §§6.2–6.5, Excursion §§0.0, 3.3, 4.1–4.3 and BanachSpaceTheory B5.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 5.11 type-A region and Check | PGL₄, (¼,⅛,−⅛,−¼) and (⅛,¼,−¼,−⅛); PGL₃ (a,0,−a) | Simple pairings (⅛,¼,⅛), highest ½; reversed vector (−⅛,½,−⅛); PGL₃ pairings (a,a), highest 2a<1 | Dominant; agrees with CH26 (6.15) | — |
| 5.14 maximal level and Check | A₁; A₂ | A₁: levels {1}, pairing <1 on U₀^g=[0,1), r₀=1, h−1=1; A₂: levels {1,2}, highest pairing <1 in A₀, r₀=2=h−1 | Maximum exists | — |
| 5.20 nonsplit datum and Check | k=ℚ₃, ψ₁ with kernel ℤ₃, ψ₀(x)=ψ₁(x/3), x=½ with Tr(x)=1 | ψ₀(3ℤ₃)=1, ψ₀(1)=exp(2πi/3); ψ₀∘Tr(x)=exp(2πi/3), ψ₁∘Tr(x)=1 | Positive and negative controls in the right order | — |
| 1.2 `extremePoints_closure_convexHull_subset_closure` | F=∅; F={0,½,1}; ℓ² basis without compactness | ∅⊆∅; ext[0,1]={0,1}⊆F; basis averages norm 1/√n→0, dist(0,F)=1 | True with compactness; hypothesis needed | — |
| 1.4/1.5 σ-finite duality citation | Counting measure on ℤ, f=δ₀, g≡1 | μ(ℤ)=∞, σ-finite; e g f = ∫ f·g = 1; ‖g‖∞=1 | Supplier signature (`Lp 𝕜 ∞ μ ≃ₗᵢ StrongDual 𝕜 (Lp 𝕜 1 μ)`, `[SigmaFinite μ]`) matches README:107 | R01 wording |
| 7.2 supplier identifiers | Excursion head §0.0(b), §3.3, §§4.1–4.3; Springer head §§6.2–6.5 | §0.0(b) states r_M(Ψ_G(a))=Ψ_M(res_M(a)) in normalized induction; §6.2 Springer resolution, §6.4 reduced Steinberg variety, §6.5 components | Citations resolve | — |
| 7.11 CiF4 B₃ representative | ν=½ | Printed (2,−1,3/2,½) and flipped (2,1,3/2,½): norm² 15/2 both; reflection in (1,−1,−1,−1): pairing −1, image (5/2,½,1,0); at ν=0 direction (1,1,0,0)·(3/2,−3/2,3/2,½)=0 | Weyl action, not a correction | — |
| 3.4, 3.5, 3.7, 4.4, 4.6, 7.10, 7.11 locators | GS23 and CH26 page markers | GS23 p. 32 starts line 1329, proof of 11.2 at 1331; p. 33 at 1379; CH26 Theorem 8.5 at 1359 (p. 28), p. 29 from 1372 | Pages agree | — |
| PR description | Lean declarations at head | 7 definitions + 8 theorems = 15; description says seven, eight, fifteen | Agrees | — |

Rows for untouched statements stand as in the previous review, of `01e8ddf`.

- Source locators checked against the text: 9 (CH26 lines 977–983, 1359, 1372; GS23 lines 1319, 1329–1331, 1357–1379); seeded sample falls in changed passages at 3.4 and 4.6 (page locators only), both confirmed.
- Library declarations opened at the pin: Mathlib/Analysis/Convex/KreinMilman.lean:96 and Extreme.lean:293; neither pinned library states Milman's converse.
- Cross-roadmap citations resolved: BanachSpaceTheory on main (Suggested.lean:184, README.md:1050); SpringerResolutionAndCharacteristicCycles head README.md:655, 679, 694, 716; ExcursionOperatorsAndSpectralActionPartII head README.md:164, 539, 561–597.
- Conductor convention read across README:957, 963, 1360, 1364, 1372, 1374: “conductor 𝔞” means trivial on 𝔞 and on no larger ideal throughout.
- One-tactic probe of the new theorem on a scratch copy: `simp`, `exact?` and `aesop` all fail; `#check` signature has all seven instance binders and the compactness hypothesis, as README:457 states. No padding.
- Gate: every scanner and the targeted build pass. `lake env lean` on `Suggested.lean`: eight `sorry` warnings, nothing else. No path changed outside the folder.
- Dependency check: `depcheck: 222 roadmaps, 1971 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- The retired gap is absent from the README contracts; the fourteen remaining contracts are unchanged.

Overlap check: read SmoothRepresentationsOfLocalGroups, GlobalShtukasAndFunctionFieldLanglandsPartII, ExceptionalThetaCorrespondencesForG2, QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups, AutomorphicLFunctionsAndLocalFactorsPartII, ReductiveGroupsPartII and CompactGroups in the previous review; the change moves no ownership except σ-finite L¹/L∞ duality, now cited from its owner BanachSpaceTheory B5. Nothing else shared.

Source independence: changed passages only; 6 passages compared with 3 sources (CH26, GS23, CiF4), none shared beyond the formula (6.15); largest share BHV, unchanged; no layer added, removed or reordered, so contents were not compared again.

## Not verifiable

- BM89, KL87, HM07, CS18 and Rodier73: settled uncertified citations; primary texts not in the legal cache.
- BM94, KS71, Mi73, Rodier81, Steinberg68, Borel79 and Ber74: settled waived citations; no new request made.

## Source issues

- none

## For the human reviewers

- Luo26 is a July 2026 arXiv preprint; README.md:1364 uses its nonsplit generic/sign comparison beyond its stated characteristic-zero setting. The roadmap owns an all-characteristic proof, including the SU₃ finite-root calculation.
