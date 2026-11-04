# Review of DeligneWeightsAndPurityPartII (pull request #1760 at 6d3fa37)

**Verdict:** needs changes

Incremental re-review of the 6 lines changed since 5cc7ce5: the carrier clause of the `gap:projective-space-fan-realization` contract (README :97) and the two new citations of ShimuraCompactifications §0.16 in the §4.7 *Needs:* line (:960) and the Layer 4 dependencies (:968). Everything the diff leaves untouched carries the verdicts of the two previous reports.

## R01 (P2) — Register `gap:projective-space-fan-realization` in the plan's gap list

**Location:** `TauCetiRoadmap/DeligneWeightsAndPurityPartII/README.md:97`, “What AnalyticToricGeometryPartII must provide (gap:projective-space-fan-realization), extending §§0.5, 1.1–1.2”; consumed at :947 and :960.

**Claim and defect:** The README states the arbitrary-field projective-space realization as a supplier contract, and at this head names its carrier correctly. A contract counts as declared only when `packages/DeligneWeightsAndPurityPartII/design/plan.json` carries the same slug in its top-level `gaps`, since that list is what the intake announces on the supplier's job. The plan still lists exactly the four ClassicalAdicEtaleCohomology slugs; the diff since the previous review changed only README :97, :960 and :968, and the last commit touching the plan is the package submission. AnalyticToricGeometryPartII is therefore never told that §4.7 needs the identification of the standard simplex fan schemes with `ℙⁿ_k` and their products, O(1,…,1) and its very ampleness. No open supplier states it: AnalyticToricGeometryPartII §1.2 is the complete-fan analytification comparison without projectivity, ShimuraCompactifications §0.16 builds the fan scheme over every ring with `ℙ¹` only as a Check, and the pinned Tau Ceti fan scheme is complex.

**Witness:** `packages/DeligneWeightsAndPurityPartII/design/plan.json`, `gaps`: four entries (`huber-compact-support-nearby-cycles`, `analytic-comparison-automorphisms`, `adapted-plurinodal-alteration`, `huber-smooth-relative-duality`); README gap slugs: five. Re-raised from the previous report's R01, unchanged.

**Exact repair:** Add to the plan's top-level `gaps` the entry with `slug` `projective-space-fan-realization`, `supplier` `AnalyticToricGeometryPartII`, `section` `0.5, 1.1–1.2`, and a one-sentence `needs`: for every field k and n ≥ 0 the standard simplex fan scheme over k is `ℙⁿ_k` by the standard charts, finite products of these fans realize products of projective spaces (empty product `Spec k`), compatibly with field extension, and the invariant divisor bundles give O(1) and the very ample O(1,…,1). Nothing else in `plan.json` changes; the README contract at :97 already matches this sentence.

**Repair check:** Slug agreement goes from 4 of 5 to 5 of 5. On the instance that refuted the original: for k = ℚ₂ and n = 1, the charts k[T] and k[T⁻¹] of `X_(Σ₁,k)` glue over k[T,T⁻¹] to `ℙ¹_k`, O(1) has degree 1, and O(1,1) on `ℙ¹×ℙ¹` gives the Segre quadric z₀₀z₁₁ = z₀₁z₁₀ in `ℙ³`; the registered contract delivers projectivity for exactly these fans.

## R02 (P3) — ShimuraCompactifications is cited as a supplier without a supplier subsection

**Location:** `TauCetiRoadmap/DeligneWeightsAndPurityPartII/README.md:960`, “ShimuraCompactifications §0.16; AnalyticToricGeometryPartII §§0.5, 1.1–1.2, gap:projective-space-fan-realization”; also :968.

**Claim and defect:** The two new citations make ShimuraCompactifications a direct supplier of §4.7 and of Layer 4. The README's `## Exact supplier contracts` has no `### From TauCetiRoadmap.ShimuraCompactifications` subsection and `## Scope and ownership` does not name it; the only description of what is consumed is the clause inside the AnalyticToricGeometryPartII subsection at :97. A reader following the *Needs:* line to the contracts finds no entry for this supplier.

**Witness:** `grep -n ShimuraCompactifications README.md` returns :97, :960, :968 only; the headings at :37–:109 list fourteen suppliers, none of them ShimuraCompactifications.

**Exact repair:** Either add a three-line `### From TauCetiRoadmap.ShimuraCompactifications` subsection before :93 saying that §0.16 supplies the fan scheme `X_(Σ,R)` (`TauCeti.Toric.finiteFanScheme`) over every commutative ring with its charts, torus action and coherent coefficient change, consumed only through the toric contract and §4.7; or drop the direct citations at :960 and :968 and keep ShimuraCompactifications inside the AnalyticToricGeometryPartII contract, which already imports it. No mathematics changes either way.

## Previous findings

- R01 — not repaired: `packages/DeligneWeightsAndPurityPartII/design/plan.json` `gaps` still has the four ClassicalAdicEtaleCohomology slugs and no `projective-space-fan-realization`; written again as R01 above.
- R02 — repaired: “Use the fan scheme X_(Σ,k) of ShimuraCompactifications §0.16 (`TauCeti.Toric.finiteFanScheme`, constructed over every commutative ring), as AnalyticToricGeometryPartII §1.1 uses it, with the line bundles of §0.5”. Both claims hold at the suppliers' heads (below). The repair added the two direct citations noted as R02 above.

## Verified sound

**Changed passages.** README :97 (the contract's carrier clause), :960 (§4.7 *Needs:*) and :968 (Layer 4 dependencies) were read in full with §4.7 (:947–:958), the toric contract block (:93–:99) and the scope sentences at :5–:17 that cite them. `Suggested.lean` is unchanged (49 lines, one `import Mathlib`, one docstring, the namespace, no declarations).

**The repaired clause against the suppliers at their heads.** ShimuraCompactifications was read through the roadmap service at its open head (#1053): §0.16 “Toric schemes over arbitrary commutative rings” constructs `TauCeti.Toric.finiteFanScheme` for a finite rational fan Σ and any commutative ring R, as the charts `Spec R[P_σ]` glued along face localizations, with split torus action, stratum ideals, coherent base change, and agreement with `Fan.algebraicRealization` over ℂ; its Checks include the ℤ/4 chart and the zero cone. AnalyticToricGeometryPartII at its head (`rev/1647`): its ShimuraCompactifications contract says C0.16 supplies the finite-fan scheme over every commutative ring; §1.1 “Unit toric adic spaces” imports arbitrary-ring fan gluing from C0.9 and C0.16, and its *Needs:* line lists C0.16; §0.5 is “Integral toric line bundles”. The clause names the right roadmap, section, declaration, generality and consuming section. `finiteFanScheme` does not exist in the pinned Tau Ceti (the roadmap service's lead); it is a ShimuraCompactifications target, cited as such, not a claim about the pin.

**Supplier order.** `ORDER.txt`: ShimuraCompactifications line 146, AnalyticToricGeometryPartII line 147, DeligneWeightsAndPurityPartII line 346. Both new citations point upward in the file, downward in supply. Dependency check rerun for this head:

```text
depcheck: 204 roadmaps, 1651 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line (the edge count rose from 1642 by the new ShimuraCompactifications edges).

**Gate and elaboration.** The worker's gate at 6d3fa37 is all zeros and OK. `lake env lean` on `TauCetiRoadmap/DeligneWeightsAndPurityPartII/Suggested.lean` from the worktree exited 0 with no output in 19 s. The file declares nothing, so the `#check @name` comparison, the section-variable audit and the one-tactic padding probe have empty inventories. The diff outside the folder is empty.

**Sources at the cited lines.** SCH12 line 2381 (Definition/Proposition 8.4, invariant divisors, printed p. 304) and line 2395 (the adic space of a fan versus the analytification, p. 304) were re-read and still support the contract's locator. The seeded sample's fifteen targets (0.4, 0.5, 0.9, 1.2, 2.2, 2.3, 2.5, 3.1, 3.2, 3.4, 3.5, 3.6, 4.3, 4.5, 4.7) fall in the diff only at §4.7's *Needs:* line, whose mathematics is unchanged; they keep the r1 verification.

**Declared gaps.** The four ClassicalAdicEtaleCohomology gaps are unchanged and keep the previous report's verdict (precise, minimal, declared). The toric contract is precise and minimal; its registration is R01.

**Adversarial table.** The row for the changed clause carries computed values; the other rows carry the previous reports' rows by name with their values unchanged.

| Statement | Instances and computed values on both sides | Result/change |
|---|---|---|
| Contract carrier clause: `X_(Σ,k)` of ShimuraCompactifications §0.16 for Σ₁, k = ℚ₂ | P_σ₀ = σ₀^∨∩M = ℕ, P_σ₁ = ℕ·(−1): charts Spec k[T], Spec k[T⁻¹]; face localization at the zero cone k[T,T⁻¹]; glued scheme has two charts, one overlap: ℙ¹_k. Over ℂ §0.16 asserts equality with `Fan.algebraicRealization` (`TauCeti/Geometry/Toric/Algebraic/Fan/Scheme.lean:138`, the colimit of `MonoidAlgebra ℂ …` charts), so the complex example of AnalyticToricGeometry is the R = ℂ fibre | Carrier is the right object; R02 of the previous report repaired |
| Contract carrier clause: generality | §0.16 admits every commutative ring, nilpotents kept (ℤ/4 chart has ring (ℤ/4)[q]); the contract asks only for fields k and base change along field extensions, a special case | No overclaim; the contract asks less than the supplier gives |
| Contract carrier clause: consuming section | AnalyticToricGeometryPartII §1.1 *Needs:* lists C0.9 and C0.16; its route completes K°[P_σ] ϖ-adically; §0.5 is the integral line bundle section | “as §1.1 uses it, with the line bundles of §0.5” is accurate |
| New *Needs:* citations, direction | ORDER positions 146 (ShimuraCompactifications) and 147 (AnalyticToricGeometryPartII) versus 346 (this roadmap); depcheck 0 problems | Downward supply; shape note R02 |
| Toric contract, registration | README slugs 5, plan slugs 4 | Finding R01 (carried) |
| Toric contract, n = 1 charts, chart indexed by i, O(1), Segre, empty product, nonprojective control | Untouched by the diff | r2 rows of the same names, values unchanged |
| The four ClassicalAdicEtaleCohomology contracts and their §§3.4, 4.2 applications | Untouched by the diff | r2 rows “gap:huber-compact-support contract” through “§4.2 application”, values unchanged |
| §4.7 Fermat / cubic threefold Checks | Untouched by the diff | r2 row, values unchanged |
| Conventions, 0.1–0.10, 1.1–1.2, 2.1–2.5, 3.1–3.6, 4.1, 4.3–4.6 | Untouched by the diff | r1 rows by name, values unchanged |

**Ownership.** The fan scheme over an arbitrary ring has one owner, ShimuraCompactifications §0.16, which AnalyticToricGeometryPartII and now this roadmap cite rather than restate; the projective-space identification over an arbitrary field has no owner at the pins, on main, in the board packages, or in the sibling checkouts named in the brief, so the contract is the right shape. `Suggested.lean` declares no name, so there is no name collision to check.

## Not verifiable

- **LUT93**, **HUB96** and **HUB98**: settled as uncertified; nothing in the diff cites them. No new request is opened.
- The repair report that answered the previous review was not among the files given to this review; the previous findings were verified against the head's text and the board's `plan.json` instead.

## Source issues

- none
