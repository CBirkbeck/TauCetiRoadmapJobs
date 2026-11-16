# FIX-RT-HodgeClassesForJacquetLanglands~2

Red-team round 2, passes a and b, on `packages/HodgeClassesForJacquetLanglands/`. Eleven findings,
merged into eight sections where the two passes overlap. I checked all eleven on the mathematics and
none is disputed. Files edited: `README.md` and `design/plan.json` (its `gaps` list only).
`Suggested.lean`, `metadata.toml` and `sources.toml` are unchanged.

## RT-HodgeClassesForJacquetLanglands~2a/F01, RT-HodgeClassesForJacquetLanglands~2b/F01 (P2) — applied differently

§0.2 had no hypothesis covering `d = 0`. It now has a paragraph headed *The definite case*. A
definite pair is `(G, 1)` with `G(ℝ)/Z(ℝ)` compact and the fibre condition. The paragraph gives the
finite set `Sh_K`, its constant `ℚ`-model, the central neat stabilizers, `H⁰` as
`IsAlgebraicModularForm`, the trivial Galois action, the level maps, the trace, the Hecke operators,
duality and Matsushima. §§0.1, 0.5, 5.1 and 10.8, the Scope section, the AFORG contract, the
`*Needs:*` lines and the Dependencies lines all refer to it.

*Evidence.* ShimuraVarieties §P.1 (at its open head) requires `SV3: h is nontrivial on each ℚ-simple
adjoint factor`, so `(B^×, 1)` for `B` ramified at `{∞, 2}` is excluded. ShimuraVarieties §8.6 treats
tori only.

*Why "differently".* Pass a says that restriction, trace and Hecke operators "are those of its §7.4".
That is not exact. AFORG §7.4 defines them on the level carrier and compares that carrier with
`IsAlgebraicModularForm` by `algebraicModularForm_iff_levelCovariant`. Its trace `Σ_{K₂/K₁}` is
`[K₂ ∩ Z(ℚ) : K₁ ∩ Z(ℚ)]` times the covering trace of §0.3. The paragraph therefore states the
covering trace directly: the sum over the fibre, which has `[K₂ : K₁(K₂ ∩ Z(ℚ))]` points.

I also added a Check on the witness: at level `Ô^×` the stabilizer `O^×` has image `A₄`, which fixes
nothing in `Sym² ⊗ Nrd^{−1}`, so the forms space is `0`, while a neat level gives `3·#Sh_K`.

## RT-HodgeClassesForJacquetLanglands~2a/F02, RT-HodgeClassesForJacquetLanglands~2b/F04 (P3) — applied

In the de Rham Check of §0.2, `G(ℚ)⁺\G(𝔸_f)/K` → `G(ℚ)₊∖G(𝔸_f)/K`, where `G(ℚ)₊` is the
stabilizer of `X⁺` (Mil17, Lemma 5.13, p. 57). The Check now also computes the witness:
`𝔽₉^×/⟨ε⟩` has one point, while the totally positive units `ε^{2ℤ}` would give `𝔽₉^×/⟨ε²⟩`, two
points. No other occurrence of `G(ℚ)⁺` remains (grep).

## RT-HodgeClassesForJacquetLanglands~2a/F03 (P3) — applied

"normalized induced family `I_v(s)` of Levi character `|Nrd(a)|^{s+5/2}`" → "the functions with
`F(pg) = |Nrd(a)|^{s+5/2}F(g)`, that is the normalized induction of `|Nrd(a)|^s`, since
`δ_P(a)^{1/2} = |Nrd(a)|^{5/2}`". This is changed in all three places: the gap contract, the plan
`needs` and §6.3, which said "Siegel character". §6.3 also gains a Check for the modulus,
`δ_P = |Nrd|⁵`.

*Evidence.* IP23 line 2693 has exponent `s+5/2` and no modulus factor. The unipotent radical has
dimension `(66 − 36)/2 = 15`, which is `⋀²` of a six-dimensional space, and the Levi acts on it
with determinant `det⁵`.

## RT-HodgeClassesForJacquetLanglands~2a/F04, RT-HodgeClassesForJacquetLanglands~2b/F03 (P3) — applied

(a) §6.3 now begins by fixing `X` (from §1.6), `G`, `H_N^+` and `τ`, and its `*Needs:*` line gains
§1.6. §6.4 now begins "In the setting of §6.3, assume that the lift `Π = θ(τ)` … is nonzero and
cuspidal".

(b) The definition of `f_i^ε` and `f^ε` moved from §7.10 to §7.1, under the heading *The sign
vectors*. §§7.4, 7.5 and 7.10 and the Checks of §§7.5 and 7.10 now cite §7.1. §0.1 was added to the
`*Needs:*` of §7.1, and §7.1 to the `*Needs:*` of §7.4.

## RT-HodgeClassesForJacquetLanglands~2a/F05 (P3) — applied differently

- §6.1: `κ ∈ F^×` and a trace-zero `i ∈ E^×` are now named.
- §6.3: `R(W_v)` is now defined as the span of `g ↦ ω_v(g)φ(0)` for the pair `(U(X□_v), U(W_v))`,
  with `X□ = X ⊕ X⁻` and `W = B`.
- §7.3: `G(𝔸)^+ = {g : ν(g) ∈ N(𝔸_E^×)}` is now defined.
- §8.6: `Λ`, `ρ_G`, `λ_Z`, `t_α` and `τ` are now defined, and the first Check is recomputed.
- §8.4: `V_k`, `𝕍_{k,ℓ}`, `Ṽ_ρ` and `[Π′^S]` are now defined. §9.2's `*Needs:*` gains §8.4.

*Why "differently".* The suggested wording for §8.5 is wrong on two points. It calls `[Π^S]` "the
`[I]`-part", but `[I] ⊗ ℂ` is the sum over all conjugates `Π^γ`, so `[Π^S]` is only one eigenspace.
It also places `Ṽ_ρ` on the unitary variety, but §8.4's `Ṽ_ρ` lives on the quaternionic exterior
variety. The definitions therefore went into §8.4, which §§8.5, 8.8 and 9.2 all follow.

## RT-HodgeClassesForJacquetLanglands~2a/F06 (P3) — applied differently

The §6.2 Check "for `B₁ = B₂` … the classical `GO(4)` Shimizu lift" now reads: `[B] = 2[B₁] = 0`, so
`B ≃ M₂(F)`, which lies outside the layer's standing hypothesis. The statement there is the
classical lift to `GSO(B₁, Nrd)`, covered by gap:quaternionic-shimizu-lift, and the division case
begins at `B₁ ≄ B₂`.

*Why "differently".* MetaplecticAutomorphicForms §3.38 (at its open head) is the local,
nonarchimedean GL₂–GSO₄ correspondence. It is therefore cited as "locally", not as the global
Shimizu lift.

## RT-HodgeClassesForJacquetLanglands~2a/F07 (P3) — applied

"a finite extension of coefficients splitting the torus" → "… that splits the torus and contains
every embedding of the local field `K′` of definition of the special point". The characters are then
stated to agree with `∏_τ τ^{−h_τ}` on an open subgroup.

*Evidence.* PadicHodgeTheory §3.6 (at its open head) opens with "`E` containing all embeddings of
`K`".

## RT-HodgeClassesForJacquetLanglands~2b/F02 (P2) — applied differently

gap:quaternion-ramification-classification is deleted from the README contract, from `design/plan.json`
and from §10.2's `*Needs:*` and the Layer 10 Dependencies. §10.2's route now derives the criterion
from:

- EndoscopicTransferAndUnitaryTraceComparison §8.3 (`[E:K]·ind(A⊗E) | deg A`), which has a new
  contract subsection;
- ClassFieldTheory Layer 10 `brLocalization_injective`;
- ClassFieldTheory Layer 5 `invMap_brRes`, and Layer 10 `infiniteInvMap` and
  `infiniteInvMap_eq_zero_of_isComplex`.

§10.2 also gains a Check that tests the criterion in both directions.

*Why "differently".* The review suggested `inv_restrict`, which is a field of Tau Ceti's
`ClassFormation`. The statement about local Brauer invariants is `invMap_brRes` (ClassFieldTheory
Layer 5). Reading algebra classes as cohomology classes also needs `TauCeti.brauerCohomologyEquiv`
and `TauCeti.brauerCohomologyEquiv_baseChange`, which I checked at the pin and added to the Tau Ceti
contract and to the `*Needs:*` of §§0.4 and 10.2.

## Checks run

- **Elaboration.** `lake env lean packages/HodgeClassesForJacquetLanglands/Suggested.lean`, run from
  the content checkout: exit 0. The only messages are three `declaration uses 'sorry'` warnings, at
  lines 70, 81 and 95. The file is unchanged this round.
- **Signatures.** I put `#check @name` for all four declarations in one scratch copy and elaborated
  it once. Every elaborated type is identical to the worker's listing, and each agrees with README
  §§1.3, 1.4 and 1.7: there is no `variable` block and every binder is in its own signature. Nothing
  changed.
- **Dependency check:**

  ```
  depcheck: 242 roadmaps, 2281 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line. The new suppliers come earlier in the merge order:
  EndoscopicTransferAndUnitaryTraceComparison is at line 149 and AutomorphicFormsOnReductiveGroups
  at line 61; this roadmap is at line 290.
- **Citations.** `roadmaps resolve` on the edited README finds no cross-roadmap citation or
  TauCetiRoadmap Lean name that is missing everywhere. I checked the Tau Ceti names at the pin by
  hand:
  - `TauCeti.brauerCohomologyEquiv` is at `TauCeti/Algebra/CrossedProduct/Comparison.lean:274`, in
    `namespace TauCeti`;
  - `TauCeti.brauerCohomologyEquiv_baseChange` is at
    `TauCeti/Algebra/CrossedProduct/BaseChange/Naturality.lean:51`.
- **Gaps.** `design/plan.json` now lists 8 slugs, and the README's "Exact supplier contracts" lists
  the same 8. Nothing outside the plan's `gaps` list changed; I compared the rest by a JSON diff.
- **Gate failures.** None were listed for this round.

## Adversarial pass (statements added or changed)

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| Definite pair fails SV3 (§0.2) | `F = ℚ`, `Ram(B) = {∞,2}` | `G^ad(ℝ) = SO(3)`, `h` trivial on it | not a Shimura datum, as stated |
| Neat stabilizer is central (§0.2) | maximal level `Ô^×`, `k = 4`; a neat `K` | `O^×` of order 24 with image `A₄`; `(B⁰)^{A₄} = 0` (the centralizers of `i` and `j` meet in 0); neat: `ℚ^× ∩ K = 1`, so `H⁰ = V^{#Sh}` | neatness is needed; the Check was added |
| Definite case on a torus | `Res_{ℚ(√2)/ℚ}𝔾_m`, `K(3)`, `ρ = N` | `Γ = ⟨−ε⁴⟩`, `N(−ε⁴) = 1`, `H⁰ = V` of dimension 1; ShimuraVarieties §8.6 with `μ = 0` gives the split `ℚ`-scheme | agrees with the torus Check of §0.2 |
| Covering trace (§0.2) | `K(9) ⊂ K(3)` | fibre has `9/3 = 3` points; `Σ_{K₂/K₁}` has 9 terms, which is `3 ×` the fibre sum | matches the degree 3 of §0.3 |
| Degenerate group | `G = 1` | `Sh_K` is one point and `H⁰ = V`; `G^ad = 1` is excluded from "fails SV3" | consistent |
| Duality, `D = 0` | stalk `V`, dual `V^∨` | the sum over a finite set of perfect pairings is perfect | as stated |
| Component set (§0.2) | `Res_{ℚ(√2)/ℚ}𝔾_m`, `K(3)` | `ε` has order 8 and `ε²` order 4 in `𝔽₉^×`; the counts are 1 and 2 | `G(ℚ)₊` is correct |
| Character criterion (§0.2) | `𝔾_m`, `K′ = ℚ_ℓ(√ℓ)` | `E = ℚ_ℓ` splits `𝔾_m` but has no embedding of `K′`; `E = K′` gives `ψ = ∏_τ τ`, `h_τ = −1` | the hypothesis is needed |
| `δ_P` and `I_v(s)` (§6.3, gap) | `s = 3/2`; the wrong reading | `dim U = 15`, `det ⋀²g = det⁵`; exponents `4 → 1`; the wrong reading gives `13/2` | Check added |
| §6.1 form | `⟨y,x⟩*` | `(y*κix)* = x*(−κi)y = −⟨x,y⟩` | skew-Hermitian, with `κ ≠ 0` |
| `G(𝔸)^+` (§7.3) | index | `[G(𝔸) : G(F)G(𝔸)^+] = [𝔸^× : F^×N(𝔸_E^×)] = 2` (IP23 line 3047) | consistent with the Conventions |
| Sign vectors (§7.1) | `F` real quadratic, `d = 1`, `k_v = 2` at the compact place | `2² = 4` vectors; weights `±0` at the compact place, so the two vectors there agree up to scalar | §7.10 Check unchanged |
| §8.6 notation | `w⁻¹ = (23)`; `w = 1`; `k_v = 2` | `½(k−2, −k, k, −k+2)`; `α^{2k−4−2(k−1)} = α^{−2}`; `k′ = 0`; at `k_v = 2`, `Λ = 0`, `λ_Z = 1`, `k′ = 1`, type `(1,1)` | agrees with IP23 lines 4061–4075 and §8.7 |
| `[Π′^S]` (§8.4) | `Π` with a rational eigencharacter | `[I] ⊗ ℂ = [Π]`, one conjugate | consistent with the §8.4 Check |
| §6.2 Check, `B₁ = B₂` | Brauer class | `2[B₁] = 0`, `GU(B₁ ⊗_E B₁)° = GSO(B₁, Nrd)` | outside the layer, as now stated |
| §10.2 criterion | `(−1,−1)_ℚ` with `ℚ(√2)` and `ℚ(i)`; `M₂(ℚ)` | `inv_∞ = 1·½ ≠ 0`, and a pure quaternion squared is `≠ 2`; `2·½ = 0` at `∞` and at `2`; all invariants `0` | holds in both directions |
| §10.2, an `E` ramified at a ramified `v` | `[E_w : F_v] = 2` | `2·½ = 0` | embedding allowed, as stated |

## Ownership, supplier edges, and notes for the maintainer

- **Owners of the definite case.** I searched for owners with the `roadmaps grep` tool, on main and
  at the open heads. Algebraic modular forms are AutomorphicFormsOnReductiveGroups §§7.4–7.6; several
  roadmaps cite them there. No roadmap states compatible realizations for definite pairs. They are
  part of §0.2, which this roadmap already owns.
- **Ownership against the open pull requests.** I checked it through the `roadmaps` tool for the
  objects involved, not by opening all 236 listed checkouts.
- **New supplier edges.** These sections are now cited and are earlier in the merge order:
  - AutomorphicFormsOnReductiveGroups §§7.4, 7.6;
  - EndoscopicTransferAndUnitaryTraceComparison §8.3;
  - ClassFieldTheory Layer 5 (`invMap_brRes`) and Layer 10 (`infiniteInvMap`,
    `infiniteInvMap_eq_zero_of_isComplex`).
- **Gap removed.** ClassFieldTheory is no longer asked for gap:quaternion-ramification-classification.
- **No renamed ids.** No section, layer or Lean name of this roadmap changed or moved, and no notion
  moved down from a later roadmap.
- **Sources.** No new source was needed and `needs-references.toml` was not written.
- **Suspicious text.** None was found in the reviews or in the sibling texts I read.
