# Review of FiniteEquivalenceRelations (pull request #1929 at 027ef49)

**Verdict:** needs changes

## R01 (P3) — 3.2 lost its attribution and has no locator

**Location:** `TauCetiRoadmap/FiniteEquivalenceRelations/README.md` line 459: “Prove `eq_differenceIdeal_of_sq_eq_bot`: for `k` a field and `A = k ⊕ V`”.

**Claim:** The change deleted “this roadmap's own” from this sentence. The target now has no locator and no statement that no source states it. It is the only target in the README in that position.

**Witness:** At 22fb4a2 the line read “Prove also `eq_differenceIdeal_of_sq_eq_bot`, this roadmap's own: for `k` a field”. At 027ef49, 3.2 (lines 457–489) cites no source.

**Repair:** “Prove `eq_differenceIdeal_of_sq_eq_bot`, this roadmap's own (no published source states it): for `k` a field and `A = k ⊕ V`”.

## R02 (P3) — The question that closes the Summary has no status after the deletion

**Location:** `README.md` lines 23–25: “The question whether every closed equivalence relation on a finite scheme over a field is effective is Grothendieck's (FGA III, §2, 1961).”

**Claim:** The deleted 3.2 target was the README's only answer to this question. The Summary still ends on it, but no target, Check or Research-context sentence now says that it is unsettled here. Nothing in the README now shows that 2.1 needs its flatness hypothesis.

**Witness:** fga3 lines 156–164 (p. 212-05): the question is open even over a field. Every equivalence ideal on a finite-dimensional `A` in the README is effective (the Checks of 1.3, 2.1 and 3.2). 3.1 and `R*` (4.3) live on `𝔸²`.

**Repair:** Replace lines 23–25 by: “Whether every closed equivalence relation on a finite scheme over a field is effective, that is whether the effectivity in 2.1 holds without flatness, is Grothendieck's question (FGA III, §2, p. 212-05). No target here settles it: Raicu's relation lives on `𝔸²`, which is not finite over `k`, and by 3.2 a non-effective relation on a finite local scheme with residue field `k` needs `m² ≠ 0`.”

## R03 (P3) — The Checks of 1.3 no longer test the side where the criterion fails

**Location:** `README.md` lines 364–367: the two remaining Checks of 1.3 (`I = ⊥` on `k × k`; `I = (x² - y²)` on `k[t]/(t⁴)`).

**Claim:** The change deleted the only Check in which the criterion fails. Both remaining Checks are effective with `I = differenceIdeal I`, so they would also pass the wrong statement “every ideal is effective”.

**Witness:** `isEffectiveEquivalenceRelation_iff` takes any `I`. For `I = (xy)` on `k[t]/(t²)` (0.1): `I = k·xy`, `A^R = k`, and `differenceIdeal I = ⊥ ≠ I`. The pair is not an equivalence relation (0.3), so it is not effective.

**Repair:** Add the Check: “- `I = (xy)` on `A = k[t]/(t²)`, the graph union of 0.1: `I = k · xy`, `A^R = k` and `differenceIdeal I = ⊥ ≠ I`, and the pair is not an equivalence relation (0.3), so both sides of the criterion fail; a criterion that called every ideal inside `ker μ` effective would accept it.”

## R04 (P3) — The Conventions still cite the deleted `Z`

**Location:** `README.md` lines 110–111: “Raicu's ideal and the ideal of `Z` are homogeneous, so `I`, `A^R` and `J(B)` are graded”.

**Claim:** `Z = V(f₁², f₂², f₃²)` was defined only in the deleted text. The only `Z` left is the `Z = Spec (A ⧸ 𝔞)` of 0.2, for an arbitrary `𝔞`, and its ideal is not homogeneous in general.

**Witness:** The third Check of 0.2 (lines 251–253) takes `𝔞 = (t - 1)`, which is not homogeneous. No other definition of `Z` occurs in the README at 027ef49.

**Repair:** “Raicu's ideal is homogeneous (generators of degrees `2, 2, 3, 5`), so `I`, `A^R` and `J(B)` are graded and compared degree by degree.”

## R05 (P3) — `ZMod` is a stale supplier

**Location:** `README.md` line 147 (From Mathlib: “`IsCancelAdd`, `IsAddTorsionFree`, `ZMod`.”) and line 518 (Layer 3 Dependencies: “Mathlib `MvPolynomial`, `ZMod`, `AddMonoidAlgebra`.”).

**Claim:** `ZMod` was used only by the deleted obstruction over `𝔽₃` (the former 3.3). No remaining target, *Needs:* line or Lean statement uses it.

**Witness:** At 027ef49, `ZMod` occurs only at README lines 147 and 518 and nowhere in `Suggested.lean`. The *Needs:* lines of 3.1–3.3 (lines 443–444, 472–473, 500–501) do not list it.

**Repair:** Delete “, `ZMod`” at line 147. Line 518 becomes “Layers 0 and 1; Mathlib `MvPolynomial`, `AddMonoidAlgebra`.”

## R06 (P3) — The description leaves out Layer 4

**Location:** The pull request description, first paragraph, which ends “…and Raicu's theorem that affine toric equivalence relations are effective.”

**Claim:** The description covers Layers 0–3 only. Layer 4 (4.1–4.4, descent of modules along pure maps) and its sources are not mentioned. Layer 4 accounts for eight of the twenty sorried theorems in `Suggested.lean`.

**Witness:** The module docstring of `Suggested.lean` (lines 38–47) lists README 4.1–4.4. Their eight theorems carry the `sorry` warnings at lines 327, 332, 342, 351, 363, 371, 387 and 401. Summary lines 16–23 state them.

**Repair:** After “…are effective.”, add: “Layer 4: along any map of commutative rings `A → B`, morphisms of descent data descend exactly under the Amitsur equalizer condition; that condition for every module, full faithfulness of descent and comonadicity of extension of scalars are each equivalent to purity of `A → B` (Joyal–Tierney; Mesablishvili 2000); the quotient map `A^R → A` satisfies `Algebra.IsEffective` for every `I` and is comonadic in the flat case; and `Spec B → Spec A` is a universal effective epimorphism of affine schemes iff `A → B` is pure.” Add “Mesablishvili, TAC 7 (2000); Stacks Tags 08WE, 08XA, 0EUA” to the Sources line.

## Previous findings

- none: the previous review, of 22fb4a2, raised no findings.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `eq_differenceIdeal_of_sq_eq_bot` (3.2, wording changed) | `𝔽₂[x, y] ⧸ m²`, by brute force; `k × k`; `A = 0` | 2825 subspaces of `ker μ` (dim 6); 5 equivalence ideals, of dims `0, 4, 4, 4, 6`; `A^R` of dims `1, 2, 2, 2, 3`; all `I = J(A^R)`. `k × k`: `V² = 0` forces `V = 0`, so `hA` fails. `A = 0`: both sides `⊥` | true; the Check count 5 holds |
| Summary question; flatness in 2.1 (R02) | equivalence ideals on finite-dimensional `A` in the README | 1.3, 2.1, 3.2 Checks: all effective; `(xy)` of 0.1 is not an equivalence ideal; 3.1 and `R*` on `𝔸²` (`dim A = ∞`) | no witness that flatness is needed: R02 |
| `isEffectiveEquivalenceRelation_iff` (1.3, Check deleted) | `k × k`, `⊥`; `k[t]/(t⁴)`, `(x² − y²)`; `k[t]/(t²)`, `(xy)` | `0 = 0`; `dim A ⊗_C A = 8`, `finrank I = 8 = finrank J`; `I = k·xy`, `A^R = k`, `J = ⊥ ≠ I`, not an equivalence relation, so not effective | true in both directions; R03 |
| `isEffectiveEquivalenceRelation_of_flat` (2.1, Check deleted) | `k × k`, `⊥`; `ker μ` | `(A ⊗ A) ⧸ ⊥ = k⁴`, free of rank `2` over `A`, `A^R = k`; rank `1`, `A^R = A` | true; no negative control left (R02) |
| Conventions, gradings (R04) | Raicu's generators; `Z` of 0.2 | degrees `2, 2, 3, 5`, homogeneous; `𝔞 = (t − 1)` is not homogeneous | R04 |
| `raicuIdeal`, `differenceIdeal_raicuIdeal_ne` (3.1, cited by the changed Summary and Examples) | `𝔽₂, 𝔽₃, 𝔽₅, 𝔽₇, 𝔽₃₂₀₀₃`, degrees `1–5` | `dim I_d = 0, 2, 9, 23, 44`; invariant forms `0, 2, 1, 3, 2`; `dim J(B)_d = 0, 2, 9, 23, 43` | true; agrees with the Checks of 1.1 and 3.1 |
| `IsToric`, `eq_differenceIdeal_of_isToric` (3.3, renumbered, Check reworded) | `σ = ℕ`: `x − y`, `x² − y²`; Raicu's `g₂`, `σ = ℕ²` | `(x − y) ⊗ χ¹`, `(x² − y²) ⊗ χ²` lie in `I · (…)`; `g₂ ↦ (x₁x₂ − y₁y₂) ⊗ χ^(1,1) − (x₂² − y₂²) ⊗ χ^(0,2)`, `x₁x₂ − y₁y₂ ∉ I₂ = span{g₁, g₂}` | true; Raicu's relation is not toric |

The rows for the untouched statements (0.1–0.3, 1.1, 1.2, 4.1–4.4, Conventions witnesses) stand as in the previous review, of 22fb4a2.

- Gate rerun on this head (`gate … --base origin/main`): every count `0`, `OK`. The worker's gate, which includes the targeted build, is `OK`.
- Dependency check (the brief's command): `depcheck: 230 roadmaps, 2063 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `Suggested.lean`: exit 0, with 20 warnings, all “declaration uses `sorry`” (22 at 22fb4a2, minus the two deleted theorems). There are 42 declarations; the remaining ones are byte-identical to 22fb4a2, and `signatures.md` shows 0 lost binders. The elaborated types of the 3.2, 3.3, 1.3 and 2.1 theorems agree with the README.
- Nothing outside the folder changed (`diff --stat origin/main...HEAD` outside the folder is empty). `diff --stat 22fb4a2 HEAD` touches only `README.md` and `Suggested.lean` (15 insertions, 124 deletions).
- Source locators of the changed passages checked against the text (5): raicu2010 lines 32–34 (§1, Definition), 170 (Theorem 3.1, p. 5) and 237 (Theorem 4.1, p. 6); kollar2012 line 1180 (Theorem 51, p. 22); fga3 lines 156–175 (p. 212-05, both questions). The other seeded targets (0.1–2.1, 3.1, 4.1–4.4) lie in untouched text, already verified. 3.2 has no locator (R01).
- Library declarations opened at the pin: Mathlib `CategoryTheory/EquivalenceRelation.lean` lines 98, 258 and 268 (`EffectiveEquivalenceRelation` extends `EquivalenceRelation`).
- Citations: `roadmaps grep FiniteEquivalenceRelations` finds one citing roadmap, AlgebraicModuliForArithmeticGeometry, which cites §4.2 (unchanged). Neither the renumbering 3.4 → 3.3 nor the deletions break a citation. `overlaps.md` lists no dropped id and no other pull request changing the folder. The change introduces no new object, so ownership stands.

## Not verifiable

- As before: Olivier 1970, Joyal–Tierney 1984, Mesablishvili 2004a and 2004b, Venken 1971 and Philippe 1973 are paywalled or not online. They are cited only for history and in Research context.
- The Buffalo lecture of 11 July 1973 appears only in the description. No source for it was found among the README's references.

## Source issues

- none
