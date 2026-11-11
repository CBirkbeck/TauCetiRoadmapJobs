# FIX-PKG-VirtualFundamentalClasses~6

Repair of review `REV-PKG-VirtualFundamentalClasses~5`, which has three findings. All three are correct on the mathematics. F02 and F03 are applied as proposed. F01 is applied with one change to the proposed text: the claim that the stack of stable maps qualifies needs a characteristic hypothesis.

Edited files:
- `packages/VirtualFundamentalClasses/README.md`: Summary, Scope, Exact supplier contracts (From Mathlib; SchemeAndStackFoundations §§1.20, 2.18, 5.5), §11.1 (text and Checks), Layer 11 Examples, Downstream consumers.
- `packages/VirtualFundamentalClasses/Suggested.lean`: module docstring, items 4 and 5.
- `packages/VirtualFundamentalClasses/sources.toml`: one `cited_for` entry added to `behrend-manin1996`.

Unchanged: `metadata.toml` and `design/plan.json`. No supplier gap is needed.

## F01 (P2) — applied differently

§11.1, old → new: "every open substack of `Mor_𝔅(𝒞, X)`, when that stack is DM" → "every open substack `M` that is a separated DM stack over `k` (Convention 1)". `Mor_𝔅(𝒞, X)` is defined, both conditions proved, three Checks added. Unlike the proposal, stable maps qualify only when DM (characteristic 0, or bounded by the characteristic).

Evidence that the finding is right:
- `𝔅` the line with doubled origin, `𝒞 = ℙ¹ × 𝔅`, `X = Spec k`. Then `Mor = 𝔅` is a quasi-separated scheme of finite type, so a DM stack. Its open substack `M = 𝔅` is not separated, but §11.1 requires `M` separated.
- Over the stack of prestable curves, `(ℙ¹, constant map)` has automorphism group `PGL_2`, so `Mor` is not DM. The old hypothesis therefore excluded the main example.

Why the proposed sentence "the stack of stable maps is such an `M` (behrend1997 Proposition 4)" was not copied: Convention 1 allows any field `k`. behrend-manin1996 Theorem 3.14 (line 1018) proves that the stack is DM only when `(V, τ)` is bounded by the characteristic (lines 1014–1017).

Counterexample when `d = p`:
- The map `x ↦ x^p`, composed with a line in `ℙ^r`, is fixed by the translations `x ↦ x + a` with `a^p = 0`, because `(x + a)^p = x^p`.
- So its automorphism group contains `α_p`. That group is not unramified, so the stack is not DM.

The new text says "whenever it is a DM stack (characteristic 0, or degree < p)", and the `α_p` instance is added as a Check.

Same pattern, also repaired:
- 11.1 Check 2: "an open subscheme of `Mor(C, X)`" → "a quasi-compact open subscheme". The whole `Mor` is not of finite type; Check 4 below gives the witness.
- Layer 11 Examples: both bullets now carry the same qualifiers.
- Downstream consumers: "the proper DM stack `M̄_{g,n}(X, β)`" now carries the characteristic bound.

Added Checks:
1. The doubled-origin base: `M = 𝔅` is excluded. `M = 𝔸¹` is included; `M → 𝔅` is an open immersion, hence étale, which agrees with Check 1 of 11.1.
2. `Mor(ℙ¹, ℙ¹) = ⊔_d Mor_d` is not quasi-compact. Each `Mor_d ⊂ ℙ^{2d+1}` qualifies, of dimension `2d + 1`, which matches the 11.4 Check `(r + 1)d + r` at `r = 1`.
3. Over the prestable curves of genus 0, `Mor` is not DM (stabiliser `PGL_2`). The stable-map locus qualifies for `p > d`, and fails for `d = p` (the `α_p` instance).

## F02 (P3) — applied

The six names and §2.18 are added to Exact supplier contracts. No layer text changed.
- From Mathlib: new bullet for `topologicalKrullDim` (`Mathlib/Topology/KrullDimension.lean`).
- SchemeAndStackFoundations §1.20: added `setoid_criterion`.
- New §2.18 bullet: `DQCoh` and `DQCoh.affineEquiv`.
- §5.5: added `deformationToNormalCone`, `specialization` and `commutes_with_c1`.

Evidence, all resolved on current main (fd02c5b, through `roadmaps grep`):
- `TauCetiRoadmap/SchemeAndStackFoundations/README.md:2953` (`setoid_criterion`, §1.20 at `:2949`).
- `:4120` (`DQCoh.affineEquiv`, §2.18 at `:4104`).
- `:7123` (`deformationToNormalCone`), `:7144` (`specialization`), `:7157` and `:7181` (`commutes_with_c1`), all in §5.5 at `:7109`.
- `topologicalKrullDim` is at `Mathlib/Topology/KrullDimension.lean:37` at the Mathlib pin `1b1ccf4b`.

Same pattern: I scanned every backticked identifier outside the contracts against the contract text, matching whole words. Only these six names were missing; the other hits are mathematical notation such as `can_g`, `X_fl` and `D_QCoh`. I also compared every SchemeAndStackFoundations section cited in the layers with the contract bullets: only §2.18 was missing.

## F03 (P3) — applied

`Suggested.lean`:
- Item 4: "from a Deligne–Mumford stack to…" → "from a Deligne–Mumford stack `M` with affine diagonal (README, Convention 8) to…".
- Item 5: "For `φ : E → …`" → "For `M → 𝔐` as in 4 and `φ : E → …`".

Same pattern in the README:
- The Summary (Layers 7–10 sentence) now says "Deligne–Mumford stack with affine diagonal".
- The Scope bullet for Layer 8 now says "from a DM stack with affine diagonal".

Evidence: the doubled plane is a smooth, quasi-separated scheme of finite type. Its diagonal pulls `U₁ × U₂` back to `𝔸² ∖ 0`, which is not affine. Items 6–8 assume `M` separated, and separated DM implies finite, hence affine, diagonal (Convention 8).

## Checks

- **Elaboration:** `lake env lean packages/VirtualFundamentalClasses/Suggested.lean`, run from the content checkout: exit 0, no output. There is no `TauCeti.*` import, so nothing needed building.
- **Binder inventory (`#check @name`):** `Suggested.lean` declares nothing, so the inventory is empty and no binder changed. Only the docstring changed.
- **Dependency direction** (the brief's command):

  ```text
  depcheck: 231 roadmaps, 2074 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line.
- **Static gate** on a scratch copy (README, `Suggested.lean`, `metadata.toml`): every count is 0 except `git=1`, which only reflects that the copy is not a git repository.
- **`roadmaps resolve` on the README:** no unresolved cross-roadmap citation or Lean name.
- **`sources check sources.toml`:** 0 problems.
- **Sources:** behrend1997 lines 99, 129–141 and 628–634; behrend-manin1996 lines 1009–1022; behrend-fantechi1997 lines 1583–1614 and 1645–1651. All were read in the cached texts. No fetch was needed, and `needs-references.toml` was not written.
- **Gate failures:** the brief listed none.

## Adversarial pass (changed and added statements)

| Statement | Instances tried | Values on each side | Result / change |
|---|---|---|---|
| 11.1 old: open substacks of a DM `Mor` qualify | doubled-origin `𝔅`, `𝒞 = ℙ¹ × 𝔅`, `X = Spec k` | `Mor ≅ 𝔅` (one map to a point), DM; `M = 𝔅` not separated | false; replaced |
| same | `𝔅 = Spec k`, `C = X = ℙ¹`, `M = Mor` | `⊔_{d≥0} Mor_d`, `dim Mor_d = 2d + 1` (d = 0: `ℙ¹`, dim 1); not quasi-compact | false (Convention 1 needs finite type); Check added |
| 11.1 new: separated DM open `M ⊆ Mor` qualifies | `M = 𝔸¹ ⊂` doubled origin | separated; `M → 𝔅` open immersion; Check 1 says étale iff relative space | agrees |
| same, DM type of `M → 𝔅` | `Δ_M = (M ×_𝔅 M → M × M) ∘ Δ_{M/𝔅}` | `Δ_M` unramified ⇒ `Ω_{Δ_{M/𝔅}}` is a quotient of `Ω_{Δ_M} = 0`, and it is locally of finite type | unramified; holds for every DM `M` |
| same, bijection | `T ⊂ T̄`, same underlying space | a `T̄`-point of `Mor` restricting into open `M` lies in `M` | bijection = definition of `Mor` |
| prestable base | `𝔅 = 𝔐_{0,0}` (dim `3·0 − 3 + 0 = −3`, behrend1997 Prop. 2: `#S − #E − 3χ = 0 − 0 − 3`), `X = ℙ^r` | `Aut(ℙ¹, const) = PGL_2`, dim 3 | `Mor` not DM; old hypothesis excluded the main example |
| stable maps DM (proposed repair) | char `p`, `d = p`, `x ↦ [x^p : 1 : 0 …]` | `(x + a)^p = x^p + a^p = x^p` for `a^p = 0` ⇒ `α_p ⊂ Aut` | not DM; hypothesis "char 0 or `d < p`" added (behrend-manin1996 lines 1014–1018) |
| same | char `p`, `d < p` | bounded by the characteristic (`β(O(1)) = d < p`) | DM, proper: included |
| 11.1 Check 2 | `Mor(C, X)`, `X` quasi-projective | separated (valuative criterion: `C_K` schematically dense in `C_R`, `X` separated); whole `Mor` not of finite type | "quasi-compact open subscheme" |
| 11.4 Checks (recomputed against new 11.1) | `Mor_d(ℙ¹, ℙ^r)`; `Aut(C)` for elliptic `C` | finite type, dim `(r+1)d + r`; finitely many translates of `C` | still covered |
| 11.6 Check (recomputed) | `X = Spec k ⊔ ℙ¹`, constant maps `M = Spec k ⊔ ℙ¹` | quasi-compact, separated, open and closed in `Mor` | still covered |
| Docstring item 4 | doubled plane (smooth, quasi-separated, finite type) | `Δ^{-1}(U₁ × U₂) = 𝔸² ∖ 0`, not affine | excluded now; matches Convention 8 |
| Docstring items 6–8 | separated DM `M` | diagonal finite ⇒ affine | already within Convention 8 |
| Summary, Scope (pattern) | same doubled plane | as above | "with affine diagonal" added |

## Ownership and overlaps

- No target was added. `Mor_𝔅(𝒞, X)` is defined in 11.1 only as a stack in groupoids over `𝔅`, to state the criterion; its algebraicity is neither stated nor used, because `M` being a separated DM stack is a hypothesis.
- AlgebraicModuliForArithmeticGeometry (open, earlier in the order) states the representability of Hom schemes with quasi-projective targets. Nothing here needs it, so it is not cited.
- The overlap file lists no pull request changing this roadmap and no dropped id. No heading, section number or Lean name changed.
- The VirtualFundamentalClass and AlgebraicGromovWittenTheory ownership question stays with a human, as in earlier rounds.

## For the maintainer

- No Lean name changed. No cross-roadmap citation changed except the added contract entries.
- A roadmap on stable maps that consumes 11.1–11.6 in positive characteristic must work with classes bounded by the characteristic (behrend-manin1996 Theorem 3.14), or prove that its stack is DM some other way.
- No suspicious instruction was found in the review text.
