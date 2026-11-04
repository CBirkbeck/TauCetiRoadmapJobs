# GATE-BanachSpaceTheory~1 — answers to review of b0a72f0 (head dbabdf7, repairs committed on top)

The review was posted against b0a72f0. The two commits after it (1e753ad, dbabdf7) already carry the
repairs it asks for. This round checked them against the source and the pins, and added one repair to
the AP⇒MAP block (H03).

## H01 (roed-math) — applied
`TauCetiRoadmap/BanachSpaceTheory/README.md` B4.1 (now lines 494–505): `n_(j+1)≥m_(j+1)²(4n_j)^(2j+1)` → `n_(j+1)≥m_(j+1)²(4n_j)^(2^(j+1))`. The base sequences are now pinned as `M_j=2^(2^j)`, `N_j=2^(2^(j²+1))`, `j≥1`, or a strictly increasing subsequence of them, with `m₁≥4` and `n₁≥16` stated. The continuum-family paragraph reuses them. Checked against ArgyrosHaydon2011 (arXiv 0903.3921v2), Assumption 2.3 at line 138 and the example sequence at line 142. The base sequence is exactly tight for the `2^(j+1)` exponent at j=1: `N₂=2^32` and `M₂²(4N₁)^4=2^8·2^24=2^32`. In general, log₂ of the right side for indices k>i≥j is at most `2^(k+1)+2^(i+2)+2^(i²+i+2) ≤ 2^(k²+1)` for k≥2, so every strictly increasing subsequence inherits condition (3). Also `2^k ≥ 2^(i+1)` gives `M_k≥M_i²`. Index 0 is correctly excluded because `M₀=2<4`.

## H02 (roed-math) — applied
B5, the `(L∞(μ))*` paragraph: the native `AddContent` carrier is now the subtype with `ν s = 0` for every nonmeasurable `s`, bounded variation and annihilation of measurable μ-null sets, and extensionality is proved on measurable sets. At the pin, `MeasureTheory.AddContent` (Mathlib/MeasureTheory/Measure/AddContent.lean:75–99) stores `toFun : Set α → G`, its axioms concern only the family `C`, and `AddContent.ext` compares all sets. So the reviewer's two-point example (mass on one singleton, algebra {∅, univ}) is a nonzero native content that vanishes on every measurable set. The normalization excludes it.

## H03 (roed-math) — applied differently
B4.0 already named Θ_X, `Θ_X(f⊗x)(y⊗g)=f(y)g(x)`, the metric criterion and the integral/nuclear route (Daws §2.3, Thms 2.3.14, 2.3.23), with `ν(T)≤ν(T′′)≤ν(T′)≤ν(T)`. Checked: for `T=f(·)x`, Θ_X(u) curried is `g↦g(x)f=T′g`.

One defect remained. The general-X direction MAP ⇒ `‖Θ_X u‖=‖u‖π` needs the unit ball of L(X) to norm `X*⊗πX`. The dual of `X*⊗πX` is L(X,X**), so for general X this is local reflexivity, which this roadmap develops in B7. Line 344: "Prove the metric criterion … including both directions using compact-open separation" → the directions are now split. Isometry ⇒ MAP is compact-open separation plus `|⟨u,id⟩|≤‖u‖π`. MAP ⇒ isometry is immediate for reflexive X via `J_X` and is proved in B7 for general X. A new B7 sentence after "finite representability of `E**` in `E`" states that norming result and the general-X direction. The reflexive theorem uses only isometry ⇒ MAP.

## H04 (roed-math) — applied
B4.1 (now lines 508–512): finite block support and range now refer explicitly to the BD basis/FDD. The text says an ambient bounded function on Γ can have infinite pointwise support. Local support is defined only after restriction to a finite Γ_q, and its relation with the FDD projections is a target.

## Notes
- The review's "Dependency and interface audit" and "Mathematical checks" sections make no requests, so they are not numbered as points.
- Adversarial pass on the changed statements:

| statement | instances | values | result |
|---|---|---|---|
| AH (3) on base sequence | j=1; j=2 | 2^32 vs 2^8·2^24=2^32; 2^1025 vs 2^16·(2^34)^8=2^288 | holds (tight at j=1) |
| AH (3) on subsequences | k>i≥j, k≥2 | 2^(k+1)+2^(i+2)+2^(i²+i+2) ≤ 2^(k²+1) | holds |
| AH (1),(2) with index 0 | M₀=2 | 2<4 | fails, so `j≥1` is required as stated |
| AddContent normalization | two points, C={∅,univ} | native content ≠ 0, all measurable values 0 | excluded by the subtype |
| isometry ⇒ MAP | X=0; dim X=n | Θ: 0→0; (L(X),‖·‖)* = nuclear norm = π | holds |
| MAP ⇒ isometry (reflexive) | X reflexive | (X*⊗πX)*=L(X,X**)=L(X) via J_X | holds without B7 |
| ν chain | T=J⁻¹T′′J | ideal property and ν(T′)≤ν(T) | holds |

- Gate repairs (second commit of this round) changed one `Suggested.lean` declaration, see "Gate repairs" below. The signature check: the new theorem mentions `E`, so it carries `[NormedAddCommGroup E] [NormedSpace ℝ E]` from the section and needs nothing else (the dual of any real normed space; no completeness). It matches its README sentence in B4.C. No other declaration changed.
- Citation lead `ContinuousLinearMap.nuclearOperators`: it is absent at the pinned Mathlib. The gate repairs remove the name from the README, and the README now states the nuclear-operator definition directly.
- Ownership against open pull requests: no new construction owned elsewhere was introduced. Local reflexivity is already a B7 target here.
- Source fetched: ArgyrosHaydon2011 (arXiv 0903.3921v2). No text is missing, so `needs-references.toml` was not written.

## Gate repairs
- Commit-pinned links (README lines 34, 36, 291, 563, 566, 568, 821) → plain citations by roadmap and section: "BanachAlgebras A8", "SelfAdjointSpectralTheory Part B", "SelfAdjointSpectralTheory SA-B81–82". The cited text is unchanged.
- README line 813: `sup_{K⊆A compact}|μ(K)|=1` → "the supremum of |μ(K)| over compact K⊆A is 1".
- "Sources and API alignment": the five Mathlib PR links are removed. The designs they pointed to are stated directly instead: the injective norm is the least reasonable crossnorm, binary and finite-family projective tensors are compatible, and nuclear operators `E → F` are the range of the completion map from `F ⊗π E*`. This also drops the backticked `ContinuousLinearMap.nuclearOperators`, which is absent at the pin.
- `Suggested.lean` imports: `import TauCetiRoadmap.BanachSpaceTheory.LocalHaarSuggested` plus four `Mathlib.*` submodules → `import Mathlib` plus `import TauCeti.Analysis.Normed.Module.Complexification`. Nothing in `Suggested.lean` used the LocalHaar module. That module is still built by the library glob and was not edited.
- Sorry'd data: `def complexificationStrongDualEquiv := by sorry` and its `_apply` theorem → one theorem, `exists_complexificationStrongDualEquiv`. It states that there is a `ℂ`-linear continuous equivalence `Complexification (StrongDual ℝ E) ≃L[ℂ] StrongDual ℂ (Complexification E)` sending `⟨g,h⟩` to `x+iy ↦ g(x)−h(y)+i(h(x)+g(y))`. The formula fixes `e` pointwise, so the existential carries the same content as the def and its formula. The README B4.C sentence now names it.
  Adversarial check of that formula: φ(i(x+iy)) = φ(−y+ix) = −g(y)−h(x)+i(g(x)−h(y)), which equals i·φ(x+iy), so φ is complex-linear. For E=0 both sides are 0. For h=0, φ restricted to E is g.

## Build
`lake build TauCetiRoadmap.BanachSpaceTheory.Suggested`: Build completed successfully (8978 jobs). The only warnings are 7 `declaration uses sorry` in Suggested.lean.

## Gate
`gate BanachSpaceTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`

Depcheck: `depcheck: 148 roadmaps, 1006 edges, 0 problem(s)`. There are no UPWARD or CYCLE lines.
