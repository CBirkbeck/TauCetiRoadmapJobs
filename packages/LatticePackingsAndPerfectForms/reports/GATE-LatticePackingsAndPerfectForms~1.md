# GATE-LatticePackingsAndPerfectForms~1: answers to human review

## H01 (mycaule) — applied

The overlap is real and confined to §4.11. `LeanPool/SpherePacking/PackingBound.lean` (lines 4918–4925 and 5362–5364) proves the Cohn–Elkies bound `density ≤ vol B(0,1/2) · f(0)/f̂(0)` for every packing of `ℝᵈ` with separation `1`, for `d > 0` and real Schwartz `f` with real `f̂ ≥ 0` and `f ≤ 0` outside the unit ball. Its lattice case gives 4.11's `centerDensity_le_cohnElkies` after rescaling. `Conclusion.lean` (`PackingBounds.FullMain.exact_limit`, line 2030) proves that the `d`-th root of the linear-programming optimum tends to `√(e/(2π))`; that is non-lattice packing material, which Scope excludes. The README did not cite the folder. It now does, in three places:

- `TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md` lines 178–190 (*Not owned here*):
  - old: "`math-inc/Sphere-Packing-Lean` is the migration source named in 4.11".
  - new: both formalizations are named as provenance for 4.11, not suppliers. The bullet states what LeanPool's folder proves and how the lattice case gives `centerDensity_le_cohnElkies`.
- Line 1406 (§4.11): "The external sphere-packing formalization is provenance" → "The external sphere-packing formalizations named under *Not owned here* are provenance".
- Line 2153 (References): a new entry for LeanPool *lean-pool* at commit `f8b9b72`, folder `LeanPool/SpherePacking`. It records Apache-2.0, Lean v4.35.0, and the upstream `openai/ten-proofs` named in LeanPool's NOTICE line 304.

## Build

`lake build TauCetiRoadmap.LatticePackingsAndPerfectForms.Suggested`: `Build completed successfully (18504 jobs)`. The only warnings are `declaration uses 'sorry'`. `Suggested.lean` is unchanged.

## Gate

```
gate LatticePackingsAndPerfectForms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL
  depcheck: NOT IN ORDER: LatticePackingsAndPerfectForms (insert it after its last supplier)
```

Dependency check (`gate --depcheck … --movable --pr 1723`):

```
NOT IN ORDER: LatticePackingsAndPerfectForms (insert it after its last supplier)
depcheck: 248 roadmaps, 2377 edges, 1 problem(s)
```

- The output has no UPWARD and no CYCLE line.
- The roadmap is not yet in `ORDER.txt`. For a roadmap at the design stage that is not a defect: the intake inserts it after its last supplier.
- The depcheck on the README at `5efad72` gives the same line, so the edit adds no supplier edge.

Commit: `cbcf644` "LatticePackingsAndPerfectForms: review repairs (cite LeanPool SpherePacking as provenance for the lattice Cohn–Elkies bound)". Not pushed.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Hypotheses of the LeanPool bound, as restated in the README | `PackingBound.lean` lines 4918–4925 (variable block), 5362–5364 (statement), 2704 (periodic sup = unrestricted sup) | `hd : 0 < d`; `f : 𝓢(EuclideanSpace ℝ (Fin d), ℂ)`, `f ≠ 0`, `Im f = 0`, `Im f̂ = 0`, `‖x‖ ≥ 1 → Re f x ≤ 0`, `Re f̂ ≥ 0`; conclusion `SpherePackingConstant d ≤ f(0)/f̂(0) · vol B(0,1/2)` | matches | The README adds `f̂(0) > 0`, a special case of LeanPool's statement (it implies `f ≠ 0`). It avoids the `x/0` reading: LeanPool returns `⊤` when `f̂(0) = 0`. |
| Degenerate `d = 0`, `f̂(0) = 0` | as above | `d = 0` excluded by `0 < d`; `f̂(0) = 0` excluded by `f̂(0) > 0` | no 0/0 left | none |
| The lattice case gives `centerDensity_le_cohnElkies` | `g(x) = f(r x)`; lattice `ℤⁿ` in `FormSpace A`, scaled to minimal distance `1` | `g(0) = f(0)`, `ĝ(0) = r⁻ⁿ f̂(0)`, so `density A ≤ Vₙ 2⁻ⁿ rⁿ f(0)/f̂(0)`. With `density = Vₙ · centerDensity` (README 1.4, Lean line 204), `centerDensity A ≤ (r/2)ⁿ f(0)/f̂(0)`, which is the conclusion at Lean lines 422–430. | matches | none |
| The same, on 4.11's witness | `Λ₂₄`, `n = 24`, `r = 2`, `f(0) = f̂(0) = 1` | bound `(2/2)²⁴ = 1`; `centerDensity Λ₂₄ = (√4/2)²⁴/√1 = 1` | equality, as 4.11's Check says | none |
| The same, in rank 1 | `[1]`, `r = 1` | `centerDensity [1] = (1/2)/1 = 1/2`; the bound is `(1/2) f(0)/f̂(0)`, and `f(0)/f̂(0) ≥ 1` because density `≤ 1` | consistent | none |
| `d`-th root of the infimum tends to `√(e/(2π))` | `Conclusion.lean` lines 413–425 (`fullQuotient`, `fullLinearProgram = Vₙ/2ᵈ · inf f(0)/f̂(0)`), 2030 (`exact_limit`) | `√(e/(2π)) = √0.432628 = 0.657745`; base-2 exponent `−½ log₂(2π/e) = −0.604400`, which matches the folder's certificate interval at lines 2130–2132 | matches | The wording changed from "optimum of this linear program" to "infimum of this bound over such `f` … as `d → ∞`" (the infimum need not be attained). |
| §4.11 provenance sentence | lines 1406–1408 against 178–190 | both name the same two formalizations | consistent | plural |
| References entry | `lean-toolchain` at `f8b9b72`; file headers; NOTICE | `leanprover/lean4:v4.35.0`; "Released under Apache 2.0"; NOTICE line 304 `LeanPool/SpherePacking https://github.com/openai/ten-proofs` | matches | none |

## Other checks

- **Ownership.**
  - `roadmaps grep -i 'cohn.?elkies'` finds the Cohn–Elkies bound only in this roadmap, on main and at every open head.
  - ThetaSeries on main (line 1136) maps the sphere-packing project's Poisson summation to its Layer 1, which 4.11 already consumes.
  - The pinned Mathlib and Tau Ceti have no sphere-packing density and no Cohn–Elkies declaration. The only Mathlib hit is a comment in `EisensteinSeries/E2/MDifferentiable.lean`.
  - So 4.11 stays the owner of the lattice bound. Non-lattice packings remain excluded and have no owner among the roadmaps.
- **Other LeanPool folders.**
  - `LeanPool/LeanModularForms/SpherePacking` (three files) contains the dimension-8 magic function and the holomorphy and cusp decay of `E₂`. It has no target here, because `γ₈ = 2` comes from 4.10.
  - `LeanPool/BannaiBannaiStanton` bounds distance sets, not designs.
  - Neither is cited.
- **Not verified.**
  - The LeanPool folder was read, not built. A grep finds no `sorry`, `admit` or `axiom` in its nine files.
  - The README describes what it proves, without endorsing the asymptotic result, which its files attribute to a manuscript.
- **Signatures.** `Suggested.lean` is unchanged, so the elaborated types in `signatures.md` still describe this head. The one flagged lead is a false positive: `polynomialsOfDegreeLE` binds its own `E` with `[NormedAddCommGroup E] [InnerProductSpace ℝ E]`, and its body (a span of powers `⟪a, ·⟫^k`) needs neither finite dimension nor a measurable structure. `IsSphericalDesign` keeps all five binders.
- **Sources.** The new citation is a code repository at a fixed commit, as is the existing `math-inc/Sphere-Packing-Lean` citation. It is not a mathematical source text, and this job may edit only `README.md` and `Suggested.lean`, so no manifest entry was added and no text is missing (`needs-references.toml` not written).
- **Citation resolver.** `roadmaps resolve` reports no new unresolved name from the added text.
- **Untrusted text.** The review comment contains no instruction beyond the claim it makes.
