# Review of DGFloer (pull request #1798 at 8019db8)

**Verdict:** needs changes

This is an incremental re-review of the 64 lines of `TauCetiRoadmap/DGFloer/README.md` that changed since 7d8ad27, in 9.3, 9.4, 10.2 and 10.3. `Suggested.lean` is unchanged. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DGFloer'` is empty, and the gate passes.

Three findings follow, one of them blocking:

- **R01 (P2).** This is the previous R01, not repaired. Layer 1 items 2–4 are still handed to AlgebraicTopology stages that only open revisions define. The pull request still states no order with those revisions. Main's AlgebraicTopology and the open #1652 still hand the same objects back to this roadmap.
- **R02 (P3).** This is the previous R03, not repaired. The order with the conflicting open revision #963 is still unstated.
- **R03 (P3).** This is new, introduced by the repair of the previous R02. The new `S³` Check in 9.3 writes the good truncation of `⊕ ℤ[k]` against the README's own shift convention, so it names the truncation from above.

The previous R02 (Theorem K's bounded-below hypothesis) is repaired, by a route that differs from the one the previous review proposed. Theorem K is now extended to every DG local system by good truncation and a directed colimit. That argument is correct; it is checked below.

## R01 (P2) — Layer 1 items 2–4 are handed to AlgebraicTopology stages that only open revisions define, with no stated order (previous R01, not repaired)

**Location.**
- `TauCetiRoadmap/DGFloer/README.md:159–175`: "The ordinary targets of Layer 1 items 2–4 are AlgebraicTopology's, and a citation of one of them resolves there". The note maps them to Stages 4.8, 5.0, 5.5, 8.8c and 8.8d.
- 9.3's *Needs:* line, `:3786–3788`, which cites "AlgebraicTopology Stage 4.8".
- The pull-request description:
  - Its merge-order paragraph still ends "#987 (AnalyticStableMaps) → **this pull request**".
  - Its body still says "Layer 1 items 1–6 are unchanged".

**Claim.** The README consumes, and no longer owns, the following:
- CW approximation (Stage 4.8);
- the filtered-complex convergence theorems (Stage 5.0);
- the fibration exact sequence and the Serre spectral sequences (Stage 5.5);
- `K(A, n)` (Stage 8.8c);
- Hurewicz modulo a Serre class (Stage 8.8d).

**Witness.**
- **Main, AlgebraicTopology README (3090489).**
  - `:915` reads "Consume DGFloer Layer 1 item 2's homotopy LES and …".
  - `:102` reads "DGFloer Layer 1 item 4 owns the single functorial …".
- **The open #1652 (kim-em, 971f80a).**
  - `:1975` reads "*Needs:* … DGFloer Layer 1 items 2–3".
  - `:1981` reads "Consume DGFloer Layer 1 item 2's homotopy LES and its Serre spectral …".
- **The revisions that define these stages.** Only #1797 (2654a44), #1807 (7871afe), #1808 (d56e187) and #1854 (7abe607) do. For example, #1807 has Stage 4 item 8 at `:1268` and "Own the homological Serre spectral sequence" at `:1537`.
- **The description.** Its body names #1807, but only for Stage 8.3, and "#1807 and #1808" only for the loop check. The merge-order paragraph names neither.

**Repair.**
1. In the merge-order paragraph, place the AlgebraicTopology revision that carries Stages 4.8, 5.0, 5.5, 8.8c and 8.8d before this pull request. That is #1807, which the description already names, or whichever of the four is to merge first.
2. Replace "Layer 1 items 1–6 are unchanged" with "Layer 1 items 2–4 consume AlgebraicTopology Stages 4.8, 5.0, 5.5, 8.8c and 8.8d as <that revision> defines them".
3. Add: "#1652 (AlgebraicTopology) consumes DGFloer Layer 1 items 2–4 and is rebased on <that revision> before it merges."

**Test.** At each point of the stated order, the homological Serre spectral sequence has exactly one owner, and no README on main cites it back to the other.

## R02 (P3) — The order with the conflicting open revision #963 is not stated (previous R03, not repaired)

**Location.** The pull-request description. Neither its body nor its merge-order paragraph mentions #963.

**Witness.**
- `scratch/overlaps.md` reports: "#963 and #1798 conflict in `TauCetiRoadmap/DGFloer/README.md`, `TauCetiRoadmap/DGFloer/Suggested.lean`".
- At #963's head (62109eb, unchanged), `README.md:555` reads "Own `arbitraryCWSerreSpectralSequence` for every path-connected CW base", and `:222` reads "AlgebraicTopology Stage 5.5 and GeneralizedCohomology consume these targets".
- This head (`:166–169`) hands the same targets to AlgebraicTopology Stage 5.5.

**Repair.** Add one sentence to the description: "#963 (DGFloer) changes the same Layer 1 targets in the opposite direction and is rebased on this pull request, dropping its Layer 1 item 2 ownership, before it merges." If the intended order is the reverse, state that instead.

## R03 (P3) — The new `S³` Check names the truncation from above, under the README's shift convention

**Location.** `TauCetiRoadmap/DGFloer/README.md:3814` (9.3, third Check): "the truncations `τ_{≥m}𝓕 = ⊕_{k ≥ m} ℤ[k]` exhibit this as the colimit of the extension".

**Claim.** The good truncation of `𝓕 = ⊕_{k ∈ ℤ} ℤ[k]` is `⊕_{k ≥ m} ℤ[k]`.

**Witness.**
- 9.1 fixes the shift convention at `:3706–3707`: "`η_gr = η₀[n]`, supported in degree `−n` … `C[n]_j = C_{j+n}`". Under it, `ℤ[k]` sits in degree `−k`.
- So `⊕_{k ≥ m} ℤ[k]` sits in degrees `≤ −m`. For `m = 0` that is degrees `0, −1, −2, …`.
- That is the truncation from above, which the next Check (`:3816`) rules out in general. Its homology is bounded above, so 9.3's bounded-below Theorem K does not apply to it.

**Repair.** Write "`τ_{≥m}𝓕 = ⊕_{k ≤ −m} ℤ[k]`, that is, `ℤ` in each degree `≥ m`".

**Tested on the refuting instance.** For `m = 0`, `⊕_{k ≤ 0} ℤ[k]` is `ℤ` in degrees `0, 1, 2, …`:
- it is `τ_{≥0}𝓕`, a sub-DG module, because the action is through the augmentation;
- its homology is bounded below;
- the union over `m → −∞` is `𝓕`;
- in degree `n`, Theorem K's two sides for it are `⊕_{p ≤ n−m} H_p(𝓛S³; ℤ)`, which increase to `⊕_{p ≥ 0} H_p(𝓛S³; ℤ)`.

## Previous findings

- R01 — not repaired: the merge-order paragraph still ends "#987 (AnalyticStableMaps) → **this pull request**", and the body still says "Layer 1 items 1–6 are unchanged"; README `:160` still says "targets of Layer 1 items 2–4 are AlgebraicTopology's".
- R02 — repaired: `:3771–3772` "Then extend the isomorphism to every DG local system `𝓕` on `𝓛Q`, with no hypothesis on `H_*(𝓕)`", via good truncations; 9.4 (`:3832`), 10.2 (`:3897`) and 10.3 (`:3932`) now rest on it. The repair introduced R03.
- R03 — not repaired: the description still says nothing about #963, whose head (62109eb) is unchanged and still owns `arbitraryCWSerreSpectralSequence` (`README.md:555`).

## Verified sound

### Gate, dependency check, elaboration and signatures (this head)

```text
gate DGFloer: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 235 roadmaps, 2261 edges, 0 problem(s)
```

- **Dependency check.** No UPWARD, CYCLE or `moved:` line. The worker's gate on this head also passed the targeted build (`build=0`).
- **Elaboration.** `lake env lean TauCetiRoadmap/DGFloer/Suggested.lean` gives 7 `sorry` warnings, at lines 83, 109, 142, 165, 195, 218 and 244, and nothing else.
- **Signatures.** A scratch copy with `#check @name` for all 7 declarations elaborated with no error, and each type is as in `scratch/signatures.md`.
  - 5.10 and both A theorems keep `[CompactSpace Q] [ConnectedSpace Q]` and `d ≠ 0` (respectively `IsUnit d`).
  - 5.15 and C keep `IsEmpty (TauCeti.HomologicalOrientation Q E …)`.
  - The torus criterion keeps `[LieGroup I₀ ∞ G] [CompactSpace G] [ConnectedSpace G]`.
  - Nothing changed.
- **Carried from the previous report.** `Suggested.lean` is unchanged, so the headline list, the padding probe and the library-name resolution carry over. The headline list is 5.4, 8.6, 9.3, 10.1–10.2, 10.5 and 11.3; the padding probe found all 7 fail, so none is padding. The Theorem K entry of the docstring (`Suggested.lean:53–54`) names only the missing carriers, which agrees with the extended statement.

### The extension of Theorem K (9.3, `:3771–3788`)

- **Sub-DG module.** Cubical chains on Moore loops sit in degrees `≥ 0`.
  - For `z ∈ Z_k(𝓕)` and `c` of degree 0: `d(z·c) = dz·c ± z·dc = 0`, since `dc ∈ C_{−1} = 0`.
  - A chain of degree `> 0` sends degree `k` into degrees `> k`.
  - `d(𝓕_{k+1}) ⊆ Z_k`.
  - So `τ_{≥k}𝓕` is a sub-DG module, with `H_k(τ_{≥k}𝓕) = Z_k/d𝓕_{k+1} = H_k(𝓕)`.
- **The colimit.**
  - Every complex in the route is natural in `𝓕` for fixed auxiliary data and commutes with directed unions:
    - the source's DG Floer complex is `𝓕 ⊗ ⟨Per(H)⟩` (`bdho-cotangent` lines 1823–1831);
    - `Ψ̃ʳ(α⊗x) = Σ α·b_{x,y} ⊗ y` (lines 3745–3748);
    - `Ψ̃ = colim_H Ψ̃^{r(H)}` (line 3757).
  - The exactness of directed colimits that the route uses is at the Mathlib pin: `AB5 (ModuleCat R)` at `Mathlib/Algebra/Category/ModuleCat/AB.lean:30`, and the complex-level instance at `Mathlib/Algebra/Homology/GrothendieckAbelian.lean:51`.
- **Where the hypothesis was used.** The source's only use of bounded below is convergence (lines 3763–3767; Theorem 3.49(ii), lines 2956–2979). The extension needs it only for each `τ_{≥k}𝓕`, which satisfies it.
- **Kernel identifications.** 10.2 and 10.3 use only `i_{Q*}α = 0 ⇒ i_{(D*Q)*}π_!α = 0`, and that is exactly the injectivity of `Ψ̃` the README names (source lines 4118–4137 and 4436–4437).

### Locators read in the changed passages and what they cite

All are in `bdho-cotangent`:

| Lines | What they say |
|---|---|
| 688–689 | Theorem K, with `H_*(F)` bounded below |
| 694–695 | the spectral-sequence description |
| 3755–3767 | the proof of Theorem K |
| 3772–3786 | Corollary 4.17, for every `F` |
| 3787 | `G = Π^*(F ⊗ η)` |
| 3795–3796 | `η^{⊗2}` and `i_Q^*η ⊗ |Q|` are trivial |
| 893–899 | the definition of a DG local system, a right `C_*(ΩX)`-module per component |
| 1823–1831 | Definition 3.12 |
| 2956–2979 | Theorem 3.49 |
| 4107–4137 | Proposition 5.9 and its proof |
| 4429–4437 | Proposition 6.7 and its proof |

Every changed locator says what the README attributes to it. Of the seeded sample, 9.3 and 9.4 fall in the changed text and were read in full. 8.3 and 8.7 are cited by the new route and were checked at Definition 3.12 and Theorem 3.49. The other sampled targets are untouched and were passed by the previous review.

### Adversarial table

Rows marked (r23) are carried from the previous report for untouched statements, with that report's values. The other rows are new and were computed this round.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 9.3 `τ_{≥k}𝓕` is a sub-DG module | `𝓕 = C_*(ΩS³)`, `k = 0`; `c` of degree 0 or 2 | `d(z·c) = 0` (since `dc = 0`); a degree-2 `c` sends `Z_0` into degree `2 > 0` | holds |
| 9.3 homology of `τ_{≥k}` | general `𝓕` | `H_j(τ) = H_j(𝓕)` for `j ≥ k`, and `0` for `j < k`; the union over `k → −∞` is `𝓕` | holds |
| 9.3 Theorem K for every `𝓕` | `Q = pt`, any `𝓕` | `C_*(Ω pt) = ℤ`, so both sides are `H_*(𝓕)` | holds |
| 9.3 `S³` Check, both sides | `𝓕 = ⊕_k ℤ[k]` through the augmentation | `𝓛S³ ≃ ΩS³ × S³` gives `H_p = ℤ` for `p = 0, 2, 3, 4, …` (`p = 2`: `H₂Ω`; `p = 3`: `H₃S³`; `p = 5`: `H₂Ω ⊗ H₃S³`) and `H₁ = 0`; degree `n` on both sides is `⊕_{p≥0} H_p` | holds |
| 9.3 `S³` Check, truncation | `C[n]_j = C_{j+n}` (9.1), `m = 0` | `⊕_{k≥0} ℤ[k]` sits in degrees `0, −1, −2, …`, homology bounded above; `τ_{≥0}𝓕 = ⊕_{k≤0} ℤ[k]` | wrong family (R03) |
| 9.3 truncation from above | `C_*(ΩS³)`, `k ∈ {0, 1}` | `1 ∈ 𝓕_{≤k}` and `1·c = c` of degree `2 > k` | holds |
| 9.4 transfer for every `𝓕` | `G = Π^*(𝓕⊗η₀)` | `η₀^{⊗2}` and `i_Q^*η₀ ⊗ |Q| ≃ |Q|²` are trivial (source 3795–3796); `Ψ̃` is an isomorphism by 9.3 | holds |
| 10.2 Proposition 6.7 route | the diagram `Ψ̃ ∘ i_{(D*Q)*} ∘ π_! = i_{Q*}`; `T^r` | `i_{Q*}α = 0 ⇒ Ψ̃(i_{(D*Q)*}π_!α) = 0 ⇒ i_{(D*Q)*}π_!α = 0` by injectivity; for `T^r`, `Ω²T^r ≃ *` gives no class | holds |
| 10.3 for every `𝓕` | `S³`, `𝓕 = ⊕ℤ[k]`; graph of `λα` | `ev₀ ∘ i_Q = id`, so `ker i_{Q*} = 0` and the criterion is silent; with `𝓕 = C_*(Ω𝓛₀S³)`, `ker i_{Q*} ⊇ H₁(Ω²S³) = ℤ` and `ker π_{U!} = 0` | holds |
| Mod-2 vanishing (Lean, 1.4) (r23) | point; `M(ℤ/3,2)`; `K(ℚ,2)`; `S³` | `2·2 ≡ 1 mod 3`; `ℚ` is uniquely 2-divisible; `H₃(S³;𝔽₂) ≠ 0` excludes `S³` | holds |
| 1.4 one-step lemma (r23) | `M(ℤ/3,2)`, `n = 2`; `S²`, `n = 3` | `H̃_*(K(ℤ/3,1);𝔽₂) = 0`; `0 → ℤ → 0` is not exact | holds |
| 1.4 Serre-class Checks (r23) | `ℤ/4`; `ℤ ⊂ ℚ` | `ℤ/4` is an extension of `ℤ/2` by `ℤ/2`; `ℚ⊗ℤ/2 = 0` but `ℤ⊗ℤ/2 = ℤ/2` | hold |
| 1.4 surjection `H₁(ℤ) → H₁(ℤ/2)` (r23) | coefficient sequence | `×2` on free `H₀` is injective | holds |
| 1.1 `S¹∨S¹` (r23) | commutator | `σ_a+σ_b−σ_a−σ_b = 0` | holds |
| 1.2 consumed Serre Checks (r23) | double cover; Hopf | swap gives `H₀ = ℤ`, `H₁ = ℤ`; `d²: E²_{2,0} ≅ E²_{0,1}` | hold |
| 1.3 regrading (r23) | homological and cohomological | `(p−r, q+r−1) ↦ (a+r+1, b−r)` in both | holds |
| 2.3 (r23) | `Map_*(S²,S²)`, `Ω²Tⁿ`, `Ω²S³` | `π₀ = ℤ`; contractible; `H₁ = ℤ` | hold |
| 5.2 (r23) | height on `S¹` | `d = 1 − t` on `ℤ[t^{±1}]`: `ker = 0`, `coker = ℤ` | holds |
| 5.5 (r23) | Hopf; `ℝP²` | `i_![S³] = [S¹]`; `H₂(ℝP²;ℤ) = 0` | holds |
| 5.6 (r23) | `S¹`, `r = 1` | `𝓛¹S¹` = constants; generic `δ` needed | holds |
| 6.2 (r23) | `D²ⁿ` | `d(½(q dp − p dq)) = dq∧dp`; flow `e^{t/2}z` | holds |
| 6.4 / 6.5 (r23) | `S*Q`; annulus; `B²(2)` | `eᵗ` scaling; capacity `∞`; `c_HZ = 4π` | hold |
| 7.5 (r23) | `H = a|z|²` | orbits at `a ∈ πℤ` | holds |
| 7.1 CZ (r23) | `ε(q²+p²)/2` | `CZ = +1 = n − ind` | holds |
| 8.2 (r23) | index difference 2 | `(−1)^{|x|−|z|} = −1` | holds |
| 8.7 (r23) | `⊕_k ℤ[k]` | (A) and (B) fail; Künneth gives `0` | holds |
| 9.4 Checks (r23) | `ℝP²` | `SH^{=0}_2 = H₂(ℝP²;o) = ℤ` against `H₂(ℝP²;ℤ) = 0` | holds |
| 10.1 Theorem L (r23) | `D²ⁿ` | `i_{W*}[W,∂W] = 0`, `j_{U!}[W,∂W] ≠ 0` | holds |
| 10.4 (r23) | `S²`; `S³`, `d = 2`; `ℤ/4` | `π₀Ω²S² = ℤ`; `ℤ` is not `2^m`-torsion; `ℤ/4` is `2²`-torsion | holds |
| 5.10 (Lean) (r23) | `π₃ = ℤ/3`, `d = ±2`; `T³` | `a^{(−2)^m} ≠ 1 ⇔ a^{2^m} ≠ 1`; every disjunct is false on `T³` | holds |
| A (Lean) (r23) | `S²`, `d = ±1, 3`; `T²⊔T²` | not aspherical; `π₂ = ℤ` is not torsion; excluded by `ConnectedSpace` | holds |
| 5.15 / C (Lean) (r23) | `ℝP²`; `K`; `π₂ = ℤ/3` | doubling on `ℤ` is not onto; `π_{≥2}(K) = 0`; 5.15 accepts `ℤ/3`, C does not | holds |
| Torus criterion (Lean) (r23) | `T^r`; `SO(3)`; `r = 0` | `π₃(SO(3)) = ℤ`; trivial group | holds |
| 11.1 / 11.2 (r23) | `U(n)`; `𝔰𝔲(2)`; `SU(3)` | `B(iI,iI) = 0`; `−2`; `−3` | hold |

### Cross-roadmap citations resolved this round

- **Main, AlgebraicTopology (3090489).** `:102` and `:915` are unchanged (R01).
- **#1652 (971f80a).** `:1975` and `:1981` (R01).
- **#1797 (2654a44), #1807 (7871afe), #1808 (d56e187) and #1854 (7abe607).** Each defines Stage 4 item 8 (for example #1808 `:1026`, #1854 `:1129`), Stage 5.0 and Stages 8.8c/8.8d, and owns the Serre spectral sequence (#1808 `:1241`, #1854 `:1342`).
- **#963 (62109eb).** `:222` and `:555` (R02).
- **DGFloerPartII (#1799, f27b94b).** It consumes DGFloer Layer 10 items 2–3 (`:1239–1244`, `:1739`, `:1893`). The extension only widens what it receives, and no id it cites moved.
- **Ownership.** No other roadmap owns a truncation or colimit form of Theorem K.

## Not verifiable

- Nothing new in the changed passages: every locator they cite is in the `bdho-cotangent` extraction.
- For untouched text, the previous report's list stands. It covers:
  - Serre 1951 and 1953, and Weibel 5.5.1/5.5.10, which have no legal copy in the cache;
  - Hofer–Zehnder, Struwe, Palais, Bröcker–tom Dieck, Massey and Whitehead, all uncertified;
  - the 6.0 and 7.C references, which are not in the manifest.

## Source issues

- **Gap** in bdho-cotangent at Corollary 4.17, p. 87 (line 3772), used by Propositions 5.9 and 6.7: the source says the corollary's diagram, with `Ψ̃` an isomorphism, holds for every DG local system, citing Theorem K; it should either require `H_*(F)` bounded below, as Theorem K (p. 16, line 689) does, or add a truncation-and-colimit extension; affects a stated result.
- **Error** in bdho-cotangent at Theorem 5.15, proof, p. 99 (lines 4322–4323): the source says the abelian groups `G` with `G ⊗ ℤ/2 = 0` form a Serre class; it should not, since `ℚ` lies in it while its subgroup `ℤ` does not; affects the proof.
