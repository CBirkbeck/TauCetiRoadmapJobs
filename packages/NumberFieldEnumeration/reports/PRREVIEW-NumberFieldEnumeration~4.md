# Review of NumberFieldEnumeration (pull request #1718 at a72fb99)

**Verdict:** needs changes

## R01 (P3) — Distinguish root multiplicity from the number of roots

**Location:** `TauCetiRoadmap/NumberFieldEnumeration/README.md:622`: “Separability identifies real-root multiplicity with the number of real embeddings”.
**Claim:** The previous R01 remains: separability makes each root's multiplicity one, not the number of real embeddings.
**Witness:** For `X²−X−1`, both roots have multiplicity `1`, while `ℚ(√5)` has `2` real embeddings; the multiplicity-weighted root count is `1+1=2`.
**Repair:** Replace the sentence with: “Separability makes every real root simple, so the root count with multiplicity equals the number of distinct real roots, which equals the number of real embeddings.” This gives `2=2` in the witness.

## R02 (P3) — Remove choice from the canonical datum's definition

**Location:** `TauCetiRoadmap/NumberFieldEnumeration/Suggested.lean:78`: `h.choose`.
**Claim:** The mandatory `statement-hygiene` gate rejects the choice-defined datum `polredabs`.
**Witness:** Both the supplied gate and the rerun flag line 78: the existential minimum witness is eliminated by `h.choose` in a definition.
**Repair:** Take the canonical datum explicitly as `p : {P : ℤ[X] // P ∈ definingPolys K ∧ ∀ Q ∈ definingPolys K, polredabsKey P ≤ polredabsKey Q}`, expose its polynomial projection, and adapt consumers; retain existence and uniqueness as targets. For `K=ℚ`, this property selects `X` and excludes `X−1` because their norms are `0<1`.

## R03 (P3) — Bind irreducibility as an instance in the composite equality

**Location:** `TauCetiRoadmap/NumberFieldEnumeration/Suggested.lean:283`: `haveI : Fact (Irreducible (P.map (Int.castRingHom ℚ))) := ⟨h⟩`.
**Claim:** The mandatory `statement-hygiene` gate rejects the local instance declaration inside this theorem's signature.
**Witness:** The gate flags line 283. Replacing the preceding existential and this line by the `Fact` binder below elaborates at the pins.
**Repair:** Replace both lines with `∃ (_ : Fact (Irreducible (P.map (Int.castRingHom ℚ)))),` and retain the remaining conclusion. For `P=X²+1`, the binder supplies the same quotient field `ℚ(i)` and discriminant `−4`.

## R04 (P3) — Bind irreducibility as an instance in the prefix equality

**Location:** `TauCetiRoadmap/NumberFieldEnumeration/Suggested.lean:311`: `haveI : Fact (Irreducible (Q.map (Int.castRingHom ℚ))) := ⟨h⟩`.
**Claim:** The mandatory `statement-hygiene` gate rejects the local instance declaration inside this theorem's signature.
**Witness:** The gate flags line 311. Replacing the preceding existential and this line by the `Fact` binder below elaborates at the pins.
**Repair:** Replace both lines with `∃ (_ : Fact (Irreducible (Q.map (Int.castRingHom ℚ)))),` and retain the discriminant condition. For `Q=X²+1`, the quotient still has absolute field discriminant `4` and zero real roots.

## Previous findings

- R01 — not repaired: `README.md:622` still says “Separability identifies real-root multiplicity with the number of real embeddings”; carried as this report's R01.

## Verified sound

| Statement | Instance | Left-side values | Right-side values | Result; change |
|---|---|---|---|---|
| `definingPolys`, changed declaration; §1.2 | `K=ℚ`, integral primitive elements `0,1`; polynomial `X²` | Minimal polynomials `X`, `X−1`; both degree `1` | `X,X−1 ∈ definingPolys ℚ`; `X² ∉ definingPolys ℚ` | `noncomputable` changes no membership or binder |
| `polredabs`, R02 | `K=ℚ`, `P=X`, competitor `X−1` | Keys `(0,1,[0,0])`, `(1,1,[1,−1])` | Minimum key `(0,1,[0,0])`; canonical polynomial `X` | Universal property selects the same datum |
| Root-count explanation, R01 | `X²−X−1`, roots `(1±√5)/2` | Individual multiplicities `1,1`; total `2` | Real embeddings `2` | Individual multiplicity `1≠2`; repaired total `2=2` |
| `hunter_relativeImage_eq_canonicalPolys`, R03 | `n=4,D=256`; `K=ℚ(ζ₈)`, `F=ℚ(i)`, `P=X²+1`; Gaussian residues `0,1,i,1+i` | `X⁴+1 ∈ canonicalPolys 4 256`; degree `4`, discriminant `256`, root norm `4` | Relative degree `2`; `4²=16≤256`; `X²−i` has relative norm `4≤2+8/√3` | Both memberships true; `Fact` preserves the subfield model |
| `prefix_characterization`, R04 | `d=2,r=0,D=4`, `K=ℚ(i)`, `Q=X²+1` | Label coordinates `(2,0,4)`; representative `X²+1` | Real roots `0`; quotient discriminant `−4`; absolute value `4` | Both sets `{X²+1}`; binder repair preserves equality |

The untouched statement rows stand as in the previous review of `98f9ddf`.

- Changed scope: 1 declaration modifier, 0 mathematical statement changes, 0 new source locators; seeded §1.2 checked against the native minimal-polynomial definition.
- Pins opened: Mathlib `f6090c70`, `Mathlib/FieldTheory/Minpoly/Basic.lean:41`, `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean:444`; Tau Ceti `358314d4`, `TauCeti/NumberTheory/NumberField/Index/Basic.lean:68`.
- Supplier citations: 9 section contracts resolved across NumberFieldArithmetic §§3.1, 3.3, 4.1–4.2, 8.1; EffectiveBounds Layer 2; GeometryOfNumbersAndQuadraticArithmetic §§0.2.1, 0.2.2, 0.3.1; 0 upward edges or cycles.
- PR text: title, prose and `roadmap-summary` match the addition of 2 layers, 6 milestones and 33 declarations; 0 removed sections/declarations, 0 outside-folder changes, 0 discrepancies.
- Gate: supplied gate fails exactly 3 statement-hygiene checks; rerun reproduces them and reports `NOT IN ORDER: NumberFieldEnumeration (insert it after its last supplier)`, explicitly exempt under this brief.
- Candidate-order dependency output: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`.
- Lean: targeted build and direct elaboration exit 0; direct elaboration has exactly 18 `sorry` warnings. All 33 `#check @name` signatures inspected; no lost hypotheses or changed signatures.
- Repair probes: both `Fact` existential replacements elaborate with only the same 18 `sorry` warnings; worktree remains clean.

Overlap check: read EffectiveBoundsPartII, NumberFieldArithmetic, PolynomialGaloisGroups and EffectiveBounds; primitive elements, discriminant identities and intrinsic prefixes belong to NumberFieldArithmetic, effective Hermite counts to EffectiveBounds, compact-model counts to EffectiveBoundsPartII, and polynomial Galois classification to PolynomialGaloisGroups. Canonical polynomial selection remains here; the indexed ownership search found no second owner.

Source independence: changed passages only—one Lean modifier, no changed source-derived prose, locators, layers or reused material; 0 external-source passages compared. Locator shares and source arrangement were not reopened.

## Not verifiable

- The previous review's unavailable background texts (`hlp1952`, `hermite1850`, `cohen1993`, `pohst1982`) were not reopened; no changed mathematical claim requires them.

## Source issues

- none

## For the human reviewers

- none
