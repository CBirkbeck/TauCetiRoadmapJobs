# GATE-StableReduction~1: answers to the review of head 72c8bf8

## H01 (roed-math) — answered
The relative-`Proj` amendment (README Layer 2, the bullet that now consumes AlgebraicVectorBundles L2A's `GradedObject`-based quasicoherent algebra) was found sound and is unchanged. The review's own checks agree with the README: affine charts go to Mathlib's `Proj`, finite generation is not claimed to give degree-one generation, and the general extension stays with SchemeAndStackFoundations §0.3.

## H02 (roed-math) — applied differently
The finding is right: the final Layer 7 bullet promised "the equivalence between semistable reduction of a curve and its Jacobian under additional residue-field hypotheses" as "a later theorem in this layer". Nothing in the roadmap defines semistable reduction of an abelian variety or a Néron model; J-D/J-E only give `Pic⁰` over the generic field and its torsion. The suggested fix of keeping the criterion and consuming NeronModelsAndSemistableAbelianVarieties §§1.7, 3.1, 3.8–3.9 would create a cycle. StableReduction is on main and supplies that roadmap's Layers 0–7: its "From `TauCetiRoadmap.StableReduction`" contract, and §3.10, which builds on the curve-existence theorem of Layer 7. That roadmap also says itself that "the later curve–Jacobian criterion … consumes this roadmap". So ownership moves down instead. Layer 7 (README lines 573–585) old: "… is a later theorem in this layer, not a premise smuggled into the main proof" → new: the main proof uses the Jacobian only through `ℓ`-torsion of `Pic⁰` (J-D/J-E). The Deligne–Mumford criterion (Deligne–Mumford Thm 2.4; Stacks Remark 55.18.2) is stated not to be a target here, because it needs:
- the abelian-variety semistability predicate;
- Néron models and the Picard/Néron identity-component comparison, for the forward direction;
- descent of a stable model over the fixed DVR, for the converse direction.

It belongs to the roadmap that owns Néron models, after its Picard–Néron comparison. The same pattern in Standing conventions, line 179, old: "… semistable reduction of the Jacobian may yield later corollaries, but are not hypotheses …" → new: "… are not hypotheses of the main theorem."

**Consequence for the open Néron-models roadmap**, which cannot be edited from here and needs a human or worker follow-up there. That roadmap still:
- lists "Layer 7: … the curve–Jacobian criterion with its residue-field hypotheses" in its StableReduction supplier contract and in its scope bullet;
- cites "the curve–Jacobian criterion of StableReduction Layer 7" in §6.14;
- lists "StableReduction Layer 7 (the curve–Jacobian criterion)" among its downstream consumers.

It should own the criterion as a target placed after §§3.1, 3.8–3.9 and before §6.14, with exact hypotheses (for example perfect or algebraically closed residue field, as in Deligne–Mumford Thm 2.4) and the converse descent step assigned. Then all four of those references should be dropped. The curve-existence theorem consumed by its §3.10 is unaffected.

## Additional repairs found while checking this point (not raised by the reviewer)
- The Stacks links were wrong: tag 0CDM is Section 55.18, not Theorem 55.18.1. Line 564 old `tag/0CDM` → new `tag/0CDN` (Theorem 55.18.1). The new remark citation links to `tag/0CEK` (Remark 55.18.2, which relates the degree bound to the Jacobian under a perfect-residue-field hypothesis and cites Deligne–Mumford).
- The gate failed at the unchanged head on pre-existing items, all repaired:
  - four `lemma` → `theorem` in `TauCetiRoadmap/StableReduction/Suggested.lean`, with statements unchanged;
  - the Knudsen reference title `M_{g,n}` → `M_g,n`, which the TeX check flagged;
  - the README name `IsProper.eq_valuativeCriterion` → `AlgebraicGeometry.IsProper.eq_valuativeCriterion`, pinned by one `#check` in Suggested.lean. It exists at the pinned Mathlib in `Mathlib/AlgebraicGeometry/ValuativeCriterion.lean` line 330, declared with `lemma`. The gate reported it missing even after the full name was used; the check pin cleared that.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Layer 7: main proof uses no abelian-variety reduction notion | genus 0, 1, ≥2 routes of Layer 7 | g=0: degree ≤2 extension, `C_{K'} ≅ ℙ¹`, Jacobian of dimension 0; g=1: minimal regular model, no Néron input; g≥2: Layers 5–6 use `Pic(C_{K'})[ℓ] ≅ (ℤ/ℓℤ)^{2g}` with ℓ > 768g, from J-E only | holds: no Layer 0–8 item uses `SemistableReduction` of an abelian variety | none |
| Criterion's direction of supply | StableReduction (main) → Néron roadmap's §3.10 and supplier table; Néron §§3.1, 3.9 → criterion | keeping it here gives the edges SR→Néron and Néron→SR, a 2-cycle; moving it down gives only SR→Néron | the cycle is broken only by moving it | criterion removed from Layer 7 |
| Converse direction over a fixed DVR | R with imperfect residue field, e.g. `𝔽_p(s)[[t]]` | Deligne–Mumford Thm 2.4 assumes an algebraically closed residue field; Stacks Remark 55.18.2 states perfect residue field; the finite-extension existence of Layer 7 gives nodal reduction over R′ ≠ R, not over R | the converse needs descent plus residue-field hypotheses; the README now names the descent step explicitly | stated in the new bullet |
| Standing convention "not hypotheses of the main theorem" | End goal 1 hypotheses | only `R` a DVR and `C/K` smooth projective geometrically connected of genus ≥ 2; no characteristic, perfectness or Jacobian hypothesis | consistent | "may yield later corollaries" removed |
| Stacks locators | tags 0CDM, 0CDN, 0CEK | 0CDM = §55.18; 0CDN = Thm 55.18.1 (the bound `B_g = (2g−2)(ℓ^{2g})!`); 0CEK = Rem 55.18.2 | old Theorem link pointed to the section | links fixed |

Signatures: the declaration types of Suggested.lean are unchanged; the edits were the `lemma` → `theorem` keyword and one `#check`. The provided `signatures.md` still applies, so no fresh `#check @name` scratch file was elaborated. The `#check` output in the build shows `IsProper.eq_valuativeCriterion : @IsProper = ValuativeCriterion ⊓ @QuasiCompact ⊓ @QuasiSeparated ⊓ @LocallyOfFiniteType`, matching the README's description.

Ownership: the criterion's owner is the open Néron-models roadmap (a new roadmap folder). That roadmap was read at its current head through the roadmaps index, and no other roadmap on main or at the open heads states the criterion (index search for "curve–Jacobian criterion" and Deligne–Mumford 2.4 phrasings). No suspicious instructions were found in the review text.

## Build and gate
- `lake build TauCetiRoadmap.StableReduction.Suggested`: Build completed successfully (8976 jobs).
- Gate: `gate StableReduction: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable`): `depcheck: 148 roadmaps, 1000 edges, 0 problem(s)`. No UPWARD or CYCLE line.
- Commits (not pushed): `00dad418`, `bd42ac28`.
