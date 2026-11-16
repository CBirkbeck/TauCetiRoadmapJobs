# FIX-PKG-RealSurfacePeriodIndex~13

One review (REV-PKG-RealSurfacePeriodIndex~12), one finding. Settled on the mathematics and applied. `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged. Only `packages/RealSurfacePeriodIndex/README.md` changed.

## F01 (P3) — applied

**Verification.** The finding is correct. SchemeAndStackFoundations §2.22 on main (its README line 5597) states `brauer_regular_injectivity` only for **affine** X that is regular, integral and Noetherian, and only for the Azumaya Brauer group. §1.1 used it for every open U of a smooth integral X, with Br = H²_ét(·, 𝔾_m), and such a U need not be affine (ℙ²_ℝ, for example). HeightsRationalPointsAndObstructions §2.16b (merge order line 142, which is before this roadmap at line 229, and §1.1 already cites it) is stated for any smooth integral X in characteristic 0 and any dense open U. It gives exactness at Br X of 0 → Br X → Br U (API `restrict_injective`) and the generic injection. Applied to the smooth integral U itself, this gives Br(U) ↪ Br(k(X)).

**Change.**

- §1.1 standing line: "Br(U) ↪ Br(k(X)) for open U (injectivity for regular integral schemes)" → "… for every nonempty open U, affine or not: U is again smooth and integral with k(U) = k(X), and the generic injection of HeightsRationalPointsAndObstructions §2.16b (`smoothBrauer_residueExact`, …) applies to it".
- Removed the `brauer_regular_injectivity` item from the §1.1 *Needs:* line and from the Layer 1 Dependencies. No other Layer 1 section cites it.
- Added the review's repair test (U = ℙ²_ℝ) to the §1.1 Checks.

**Pattern.**

- Every occurrence of `brauer_regular_injectivity` was searched for. §0.9 (`O_{C,x}`, a regular local ring, so affine), its *Needs:* line, the Layer 0 Dependencies and the SchemeAndStackFoundations contract line all stay: the use there is affine.
- The HeightsRationalPointsAndObstructions contract line now names the generic injection and says it assumes no affineness.
- Every use of the injection Br(X) ⊂ Br(k(X)) was searched for. §§2.8, 7.6 and the Layer 9 standing line use it as notation that §1.1 now supplies. §5.2 already cites `smoothBrauer_residueExact`. §1.6 does not use it.
- §9.3 step 2 used the injection silently: it computed 4α = 0 in Br(ℝ(S)) and needed it in Br(S). It now applies the corestriction of HeightsRationalPointsAndObstructions §2.19a (`finiteFlatBrauerCorestriction` with `pullback_comp`), which §9.3 already cites, to the finite locally free morphism S_ℂ → S of rank 2. This gives 4α = cor(2·res α) = 0 in Br(S) directly, so §9.3 no longer depends on the injection. Its *Needs:* line is unchanged.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1: Br(U) ↪ Br(k(X)) for nonempty open U | U = ℙ²_ℝ (not affine); U = 𝔾_m,ℝ (affine); U = X = Spec k; U = ∅ | Br(ℙ²_ℝ) = Br(ℝ) = ℤ/2 maps ℍ to ℍ ⊗ ℝ(x, y). This is a division algebra because (−1, −1) splits over K iff −1 = a² + b² in K, and ℝ(x, y) is real, so the map is injective. (−1, t) ∈ Br(𝔾_m) has residue −1 ∉ ℝˣ² at t = 0, so its image is nonzero, and it evaluates to ℍ at t = −1. Spec k: the identity. ∅: not integral, k(∅) is undefined, so "nonempty" is needed | sound | new standing line and new Check |
| §1.1 supplier: HeightsRationalPointsAndObstructions §2.16b | its hypotheses against §1.1's | smooth integral X over k of characteristic 0 and dense U on both sides; the generic injection is stated there; no affine hypothesis | sound | citation replaced |
| §0.9 (kept): Br(`O_{C,x}`) → Br(F) injective by `brauer_regular_injectivity` | C = 𝔸¹_ℝ, x = 0 | `O_{C,x}` = ℝ[t]_(t): affine, regular, integral, Noetherian, so the hypothesis holds. (−1, t) has residue −1 ≠ 1 in ℝˣ/ℝˣ², so it is not in the image | sound | none |
| Contract line for §2.16b | against the text of §2.16b at the head of HeightsRationalPointsAndObstructions | "exact at Br X, Br U" for dense U; "finite-presentation limits give generic injection" | sound | wording added |
| §9.3 step 2: cor(res α) = 2α in Br(S) for S_ℂ → S | S = Spec ℝ; S = ℙ¹_ℝ; S real Enriques | Spec ℝ: Br(ℝ) = ℤ/2, res lands in Br(ℂ) = 0, and 2α = 0 ✓. ℙ¹_ℝ: Br = ℤ/2, Br(ℙ¹_ℂ) = 0, and 2α = 0 ✓. Enriques: Br(S_ℂ) = ℤ/2 (step 1), 2·res α = 0, so 4α = cor(0) = 0, which is consistent with the period-4 classes of §9.4. Direction: `pullback_comp` is cor ∘ f* = d (its Check "cor(f*α) = dα rather than α"), with d = 2 | sound | route via scheme-level corestriction |
| §1.1 new Check | recomputed above | Br(ℙ²_ℝ) = Br(ℝ) because Pic(ℙ²_ℂ) = ℤ, Br(ℙ²_ℂ) = 0, H¹(G, ℤ) = 0 and there is a rational point | sound | — |

No other theorem, definition or Lean statement changed. Every Check and worked example that uses §1.1's injection (§§2.8, 7.6, 9.3, 9.9) is left with the same values: only the supplier of the injection changed.

## Checks

- **Elaboration.** `lake env lean packages/RealSurfacePeriodIndex/Suggested.lean`, run from the content checkout, exited 0. The output is eight `declaration uses sorry` warnings (lines 82, 91, 103, 114, 125, 135, 145, 158) and nothing else. The file itself was not edited.
- **Signatures.** All nine declarations were put through `#check @name` in one scratch copy, elaborated once (exit 0), and each type compared with its README statement:
  - `HasZeroTotalSignature`: `[Invertible 2]`, `[FiniteDimensional K V]`.
  - The four index theorems: `[Algebra.EssFiniteType …]`, `Algebra.trdeg … = 2`, with `¬IsSemireal K` and the real-closed-field quantifier where the README has them.
  - `not_anisotropic_of_hasZeroTotalSignature`: `4 < finrank`.
  - `exists_anisotropic_hasZeroTotalSignature`: `[Algebra.EssFiniteType ℝ K]`.
  - The two isotropy theorems (`not_anisotropic_of_not_isSemireal` and `exists_common_zero_of_not_isSemireal`): `trdeg` 2 or 1, `¬IsSemireal K`, `5 ≤ finrank`.

  No binder was lost and nothing changed.
- **Dependency check.** Whole output:

      depcheck: 259 roadmaps, 2475 edges, 0 problem(s)

  There is no UPWARD, CYCLE or moved line.
- **Citation resolver** (`roadmaps resolve` on the README): no cross-roadmap citation and no Lean name found nowhere.

## Gate failures

None were listed for this round.

## Ownership

No new construction was introduced. The fact now cited (the generic injection for smooth varieties in characteristic 0) belongs to HeightsRationalPointsAndObstructions §2.16b, which is earlier in the merge order. This roadmap states nothing new about it.

## For the maintainer

- No name that other roadmaps cite changed. No section, layer or target id moved.
- SchemeAndStackFoundations §2.22 is now cited only for affine or local uses (§0.9 `brauer_regular_injectivity`, `brauer_henselian_local`) and for the general Azumaya API (`mk_*`, `brauer_field`, `brauer_kummer_sequence`).
- The review's "For the human reviewers" section asked for no change. Nothing was changed because of it.
