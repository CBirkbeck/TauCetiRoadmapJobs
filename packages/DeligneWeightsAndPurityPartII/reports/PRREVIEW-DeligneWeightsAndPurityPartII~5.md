# Review of DeligneWeightsAndPurityPartII (pull request #1760 at f44c08c)

**Verdict:** needs changes

Incremental re-review of the 10 lines changed since 01f26c4 (README :49, :626, :953, :960, :975), and of the pull request's title and description against this head. Two P3 findings.

## R01 (P3) — §4.7's projectivity conclusion still names no notion

**Location:** `TauCetiRoadmap/DeligneWeightsAndPurityPartII/README.md:953`, “Hence these complete regular fans give projective smooth split toric varieties over k”; :103, “§4.6 obtains projectivity for these fans from it”.

**Claim:** Second half of the previous R03, not applied. §4.6's hypothesis “projective” and §4.7's conclusion “projective … over k” name no predicate, so nothing says that the Segre closed immersion establishes the notion §4.6 and §4.1 (SchemeAndStackFoundations §4.19) use.

**Witness:** The repair's name `IsProjectiveOverSpec` now occurs nowhere (roadmap service: no match on main or any open head). `TauCetiRoadmap/SchemeAndStackFoundations/README.md:7778` on main: projectivity over an affine base is a closed immersion over Spec R into Proj (Sym_R M), M finite.

**Repair:** After “is a closed immersion (`AlgebraicGeometry.IsClosedImmersion`)” add: “so `X_{∏Σ_(nᵢ),k}` is projective over k in the sense of SchemeAndStackFoundations §4.19 (a closed immersion over Spec k into Proj of the symmetric algebra of a finite k-module, here k^(N+1), whose Proj is ℙ^N_k); this is the projectivity hypothesis of §4.6.” Tested: n = 0 gives Proj Sym_k(k) = Proj k[x₀] = Spec k; (1,1) gives ℙ¹ × ℙ¹ ⊆ Proj Sym_k(k⁴) = ℙ³. Name the predicate in prose only: this pull request's Tau Ceti pin has no `IsProjectiveOver`.

## R02 (P3) — The description says the Lean states definitions and theorems; it declares nothing

**Location:** Pull request description, “the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti; every target is in the README.”

**Claim:** The head's `Suggested.lean` has no declaration, so the sentence describes a file that does not exist at this head, and the description nowhere says that no headline is statable at the pins.

**Witness:** `TauCetiRoadmap/DeligneWeightsAndPurityPartII/Suggested.lean:9–10`: “None of them is statable at the pins, so the file declares nothing”; the file ends with an empty namespace (:56–:58). Worker's change summary: Lean declarations 0 added.

**Repair:** Replace the sentence by: “`Suggested.lean` declares nothing: no headline theorem is statable against the pinned Mathlib and Tau Ceti, and its module docstring names, headline by headline, the carriers each lacks; every target is in the README.”

## Previous findings

- R01 — repaired: :960 now reads “the restriction of O(1,…,1) to a fibre of the projection onto the product of the other factors, a copy of ℙ^(nᵢ)_k, is O(1)”.
- R02 — repaired: :49 cites `TauCeti.Toric.Fan.prod` and `TauCeti.Toric.Fan.algebraicProdIso` as “the product-fan isomorphism over ℂ only”; :953 says the every-ring identification “restricts to the pinned `TauCeti.Toric.Fan.algebraicProdIso`”.
- R03 — partly repaired: :953 “the standard complete fan … defined here as in the “Acceptance checks” of AnalyticToricGeometry” and :975 cite Layer 0 for fans and products only; the projectivity notion is still unnamed (R01 above).

## Verified sound

| Statement | Instances and computed values on both sides | Result/change |
|---|---|---|
| Fibre clause of the Segre bullet (:960) | (1,1,1): fibre of ℙ¹×ℙ¹×ℙ¹ → ℙ¹×ℙ¹ is ℙ¹, O(1,1,1) restricts to O(1), degree 1. (n₁,n₂): fibre ℙ^(n₁), O(1). One factor: fibre over Spec k is ℙⁿ, O(1). Empty family: no index | True; agrees with the Σ₁ × Σ₁ Check (degree 1 on either ruling) |
| Product-fan identification restricts over ℂ to the pinned isomorphism (:49, :953) | Pin: `Fan.prod : Fan (i.prodMap i')`; `algebraicProdIso : (Φ.prod Ψ).algebraicRealization ≅ pullback` of the two structure maps to Spec ℂ, an open immersion on each product-cone chart and surjective. R = ℂ chart: ℂ[P_σ ⊕ P_τ] = ℂ[P_σ] ⊗ ℂ[P_τ] | Same charts, same target; ℂ-only at the pin as :49 says; the every-ring statement stays §4.7's |
| Standard complete fan Σₙ and its attribution (:953, :975) | n = 1: rays e₁, −e₁, cones σ₀ = cone(e₁), σ₁ = cone(−e₁). n = 2: det(e₀,e₂) = −1. AnalyticToricGeometry: Layer 0 at :186 (fans, products), “Acceptance checks” at :504, standard complete fan at :521 | Regular and complete; both citations resolve where :953 and :975 now put them |
| Sliced nearby cycles, base-change compatibility, unipotence (:626) against ITO20 lines 189–250 | S = U a strictly henselian trait, η generic: `i^* Rj_* j^*` is the classical nearby cycle with Gal(κ(η̄)/κ(η)) acting. η = u: U(η̄) = U, j = id, functor i^*, trivial group, unipotent with the one-step filtration. q = id: base-change map the identity | Same objects, quantifiers and Galois action as ITO20 §2.1 and Definitions 2.1–2.2 (pp. 5–6); the rewording changes no hypothesis |
| §4.7 projectivity conclusion (:953), R01 | n = 0: Proj Sym_k(k) = Spec k = `X_{Σ₀,k}`. (1,1): N = 2·2 − 1 = 3, closed immersion into Proj Sym_k(k⁴) | Conclusion true; the notion is unnamed |

Rows for statements the diff does not touch stand as in the previous review, of 01f26c4.

- Gate at f44c08c (worker's run): every counter 0, build 0, OK. Dependency check rerun: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/DeligneWeightsAndPurityPartII/Suggested.lean` exits 0 with no output; the file declares nothing, so the `#check` comparison and the one-tactic probe have empty inventories. Nothing changed outside the folder.
- Library declarations opened at the pin: `TauCeti/Geometry/Toric/Algebraic/Fan/Product/Basic.lean:56` (`Fan.prod`), `TauCeti/Geometry/Toric/Algebraic/Fan/Product/Isomorphism.lean:91` and :105 (`algebraicProdIso`); both paths on :49 are exact.
- Source locators checked: ITO20 line 189 (§2.1, p. 5) and line 238 (Definition 2.2, p. 6), as cited at :626. Cross-roadmap citations resolved: ShimuraCompactifications §0.16 `finiteFanScheme_complex` (its README :758 at its open head); AnalyticToricGeometry Layer 0 and “Acceptance checks” on main; SchemeAndStackFoundations §4.19 on main.
- Seeded sample: none of the fifteen targets lies in a changed passage; they keep their earlier verification.
- Title and description read against the head: the summary block, the supplier prose and the validation line agree with the head (three files added, 60 headings, the gate counters); the one contradicted sentence is R02.
- Remark (untouched text, no change asked): :987 names WeightsInEtaleCohomology as a consumer; it stands earlier in the merge order and its README does not cite this roadmap.
- Declared gaps: the four ClassicalAdicEtaleCohomology contracts are untouched by the diff.

Overlap check: read AnalyticToricGeometryPartII, ClassicalAdicEtaleCohomology, EtaleCohomologyFoundations (and SchemeAndStackFoundations §4.19 for R01); the changed passages share the complex product-fan isomorphism with the pinned Tau Ceti, which owns it and is now cited; nothing else shared.

Source independence: changed passages only; 3 passages compared with 2 sources (ITO20 lines 189–250, SCH12 lines 2373 and 2386), none shared beyond the defined terms and formulas (longest common run 6 words, “compatible with any base change”); largest share ITO20, 94 of 187 source mentions; no layer added, removed or reordered, so the contents were not compared again.

## Not verifiable

- LUT93, HUB96, HUB98: settled as uncertified; no changed passage cites them.
- The description's account of earlier review rounds and of who ported the package: not checkable from the head.

## Source issues

- none

## For the human reviewers

- ITO20, the source with the largest share of locators, is cited as arXiv:2008.07794v1 (`TauCetiRoadmap/DeligneWeightsAndPurityPartII/README.md:994`); the README gives no journal reference for it.
