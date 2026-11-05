# FIX-RT-CstConjectureForDaggerVarieties~2

Repair of red-team round 2, passes a and b. Files changed: `packages/CstConjectureForDaggerVarieties/README.md`, `Suggested.lean` (docstring only), `design/plan.json` (top-level `gaps` only). The gap count goes from 22 to 24.

## RT-CstConjectureForDaggerVarieties~2a/F01 (P1) — applied

Confirmed. Take X=P¹_C and i=r=0. The truncated left side has H²=0, but tF⁰RΓ_dR has H²=tB_dR⁺≠0. CN25 line 2231 makes the same omission. Old: `τ_≤i F^(r+1)RΓ_dR=tFʳRΓ_dR`, i≤r. New, in the README `dagger-analytic-complexes` contract and the plan gap: for 0≤i≤r, multiplication by t induces `τ_≤iFʳRΓ_dR≃τ_≤iF^(r+1)RΓ_dR`, with a note that the source truncates only one side. §1.4 uses only the degree-i cohomology, so it is unchanged.

## RT-CstConjectureForDaggerVarieties~2a/F02, RT-CstConjectureForDaggerVarieties~2b/F04 (P2) — applied

Confirmed. VectorBundlesAndIsocrystals, under VB3 "Curvature, the tilted coherent heart and HN invariants", already has the target "Artinian property of BC" (anchor `artinian-bc`), which stabilises descending chains of BC subobjects. Old gap: chain stationarity plus R¹lim. New: the README cites the existing target. The gap `bc-countable-inverse-limits` now asks only for R¹lim vanishing for countable towers of finite BC objects, in the VS realization and the left heart, derived from that target. Its plan section now names that subsection.

## RT-CstConjectureForDaggerVarieties~2a/F03 (P3) — applied

Confirmed. Over C no canonical C→B_dR⁺ exists (README §0.1, §1.1). The §2.9 Check now takes the closed dagger disc D₀ over K, uses the scalar-extension model `RΓ_dR(D₀/K)⊗̂_K B_dR⁺` (K⊆B_dR⁺ canonically), and sets E₀=O(D₀)⊗̂_K B_dR⁺. The retraction is evaluation at T=0: 1⊗b↦b and T⊗b↦0. I used K rather than the reviewer's Q_p to match §1.1. Both choices are correct.

## RT-CstConjectureForDaggerVarieties~2a/F04, RT-CstConjectureForDaggerVarieties~2b/F02 (P2) — applied

Confirmed. Take φ(e)=p⁻¹e and L=B_dR⁺e. The Newton slope is −1, the bundle is O(1) and H¹=0, so the pair is acyclic. The §0.4 Check now says the pair is acyclic exactly when every Newton slope is ≤0, and that the bound [0,r] then forces slope 0 and L′=L. It adds the negative controls φ=p⁻¹ (O(1), acyclic) and φ=p (O(−1), not acyclic). No other Check makes this claim; §0.5 and §0.6 already state the slope bound.

## RT-CstConjectureForDaggerVarieties~2a/F05 (P1) — applied

Confirmed. §1.5 states no limit theorem. The contracts kill R¹lim of the towers `X_n` and `Fbar_n`, but on discs `Fbar_n^(1,1)`=0 while O(S_n)/C≠0.

New target in §4.5, with its own locator (CN25 lines 2664–2671), proof route and three Checks: R¹lim_n(Ωʲ⁻¹(S_n)/ker d)=0 in LH(C_Q_p), and hence R¹lim_n Hʲ_proét(S_n,Q_p(j))=0. The proof route:

- AdicSpacesPartIV F1.8 gives Theorem B on the Stein space Ŝ.
- AdicSpacesPartIII R3.4 ("Cohomology of a countable open exhaustion") gives algebraic lim¹=0 for the Banach tower.
- Since S_n ⊂† S_(n+1), the dagger and Banach towers interleave.
- LocallyAnalyticDistributions §0.2 gives Fréchet open mapping, so the difference map is strict.
- R²lim=0 handles the quotient by ker d.
- The §1.5 row and the existing R¹lim `X_n^(j,j)`=0 finish the proof.

I used Theorem B rather than the reviewer's dense-restriction lemma. Density would need a quasi-Stein exhaustion, which "Stein covering" (F1.7) does not grant. "Strictly increasing" is now defined as S_n ⊂† S_(n+1). The §4.5 `Needs` line, the Layer 4 dependencies and a new "From TauCetiRoadmap.AdicSpacesPartIII" contract are updated. AdicSpacesPartIII and AdicSpacesPartIV are on main.

## RT-CstConjectureForDaggerVarieties~2a/F06 (P2) — applied differently

Confirmed that the gap stated no criterion. New `positive-crystalline-hom` statement: for r≥0 and M with slopes in [0,r], every λ∈M∨⊗t⁻ʳB_cris⁺ that pairs the C-points X_crisʳ(M)(C) into B_cris⁺ lies in M∨⊗B_cris⁺, compatibly with extension to F̂ⁿʳ and with Frobenius.

This is a pure period-ring statement on C-points, so it fits the supplier PadicHodgeTheory. Its hypothesis is weaker than the reviewer's sympathetic-algebra version, so the new statement implies the reviewer's.

The source's route through Frobenius iterates is not used. PadicHodgeTheory §0.4 proves only φ(B′_cris)⊆B_cris⁺⊆B′_cris (FO Thm 6.25), not equality, so the equality at CN25 line 2865 is not imported; §5.5 now says this. §5.5 also gains the proof step (sandwich, then evaluation on C-points, then the criterion) and the λ=t⁻¹, r=1 Check.

## RT-CstConjectureForDaggerVarieties~2a/F07 (P2) — applied

Confirmed. Each gap bundled two independent obligations.

- `dagger-strictness-kunneth-over-c` is split into `dagger-strictness-over-c` (F1.9; consumed by §1.5 and Layer 1) and `dagger-kunneth-over-c` (F1.11; consumed by §3.2 and Layer 3).
- `bounded-arithmetic-filtration` is split into:
  - `acyclic-arithmetic-period-hom`: CN25 Thm 5.8 and Cor. 5.9–5.10, lines 1730–1770, including the bounded twist. Consumed by §§5.1, 5.3 and Layer 5.
  - `bounded-arithmetic-subfiltration`: CN25 Lemma 5.4. Consumed by §0.4 and Layer 0.

README contracts, `Needs` lines and plan gaps were updated together.

## RT-CstConjectureForDaggerVarieties~2b/F01 (P2) — applied

Confirmed. Take X=D†⨿D (closed dagger disc ⨿ open disc). X is small. At i=r=1, A¹¹=O(D†)/C⊕O(D)/C. If the sum were Fréchet, its compact-type summand would be Fréchet. If it were LB, its non-normable Fréchet summand would be LB, hence Banach by Baire. So the Pair is not reasonable. CN25 line 2361 proves only "a Pair".

Changes:

- Conventions: the qBC middle piece is any torsion Pair. Uniqueness is stated only for a reasonable middle Pair (CN25 Prop. 4.26). A Pair contributes height 0.
- §2.3: the filtration is the one constructed from the diagram. It is reasonable for quasi-compact X (CN25 Prop. 7.15 for r≥dim X, moved to every r≥i by the t-isomorphism A^{r,i}≅A^{r+1,i}, since Bⁱ is t-torsion free). A negative-control Check for D†⨿D is added.
- §5.4 and `qbc-pairs`: dense presentations of every Pair (CN25 line 2834).
- `Suggested.lean` docstring: "reasonable period Pairs" becomes "torsion period Pairs" for §2.3.

I did not adopt the reviewer's unsupported claim about finite Stein coverings.

## RT-CstConjectureForDaggerVarieties~2b/F03 (P3) — applied

Confirmed. (∏_N Z_p)[1/p] is the space of bounded-denominator sequences, and (p⁻ⁿ)_n∈∏Q_p lies outside it. The §4.4 Check now gives H⁰_ét(P¹×T,Q_p)=(∏Z_p)[1/p] on both sides of the formula and contrasts it with the pro-étale group ∏Q_p. The §4.7 Check, which is pro-étale, already gives ∏Q_p correctly.

## Checks run

- `lake env lean packages/CstConjectureForDaggerVarieties/Suggested.lean` from the content checkout: exit 0, no output. The file has no declarations, so the per-declaration `#check @name` comparison has zero cases. Only the docstring changed.
- Worker warning (Mathlib is designed for the module system; consider adding `module`): repaired by adding the `module` header line before `import Mathlib` in `Suggested.lean`; nothing else changed. Re-elaborated with `lake env lean` from the content checkout: exit 0, no output, the warning is gone. The file declares nothing, so no `public`/`@[expose]` annotations are needed.
- Dependency check output:

```
depcheck: 201 roadmaps, 1418 edges, 0 problem(s)
```

  No UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the README: no unresolved roadmap citations or Lean names.
- The slugs of the README "What … must provide (gap:…)" lines and the plan `gaps` list agree one to one (24 each), and the `needs` texts are identical (checked by script).

## Adversarial pass on new or changed statements

| Statement | Instances | Computed values | Result |
|---|---|---|---|
| t-shift on τ_≤i (dagger-analytic-complexes) | P¹, i=r=0; general model F^r terms t^max(r−j,0)Ω^j | H⁰: B_dR⁺→tB_dR⁺ iso, H²=0 both sides. Complexes tF^r and F^(r+1) agree in degrees ≤r; in degree r+1, tΩ^(r+1)⊆Ω^(r+1) is injective, so H^j agree for j≤r | true; the old form is false (H²=tB_dR⁺ vs 0) |
| §0.4 Check, L=M⊗B_dR⁺ | φ=p⁻¹, 1, p | bundles O(1), O, O(−1); acyclic T, T, F; Newton slopes −1, 0, 1 | "≤0" iff acyclic; with the [0,r] bound only slope 0 survives |
| §2.3 reasonableness | D†; D; D†⨿D; point; quasi-compact r<dim X | compact type; Fréchet; neither; A=0; A^(r,i)≅A^(r+1,i) via t because B t-torsion free | quasi-compact claim holds via Prop 7.15 and the twist |
| §2.9 disc splitting | D₀/K, q=0; point | 1⊗b↦b, T⊗b↦0, kernel = zero constant term ≅ Q₀; point E=H, Q=0 | retraction exists |
| §4.4 étale Check | T=⨿_N pt, Y=P¹ | both sides (∏Z_p)[1/p]; (p⁻ⁿ) ∉ it, ∈ ∏Q_p | étale ≠ pro-étale value |
| §4.5 Stein-factor theorem | j=0; disc exhaustion, j=1; ⊕_(k≥n)Q_p | X^(0,0)=Q_p constant, R¹lim 0; O(S_n)/C, the section (b_n)↦(−Σ_(k<n)b_k) solves the constant case, polynomial density gives a surjection on ∏O(Ŝ_n); R¹lim ⊕ tower ∋ (1,1,…) ≠ 0 | holds under Theorem B; the generic tower fails, so the hypothesis matters |
| positive-crystalline-hom criterion | trivial line r=0; r=1, λ=t⁻¹ | r=0: X=Q_p, tautology; r=1: λ(t)=1 but λ(x)=x/t∉B_dR⁺ for θ(x)=1, so the hypothesis fails, consistent with t⁻¹∉B_cris⁺ | consistent; the iterate route is not used (B′_cris≠B_cris⁺ per PadicHodgeTheory §0.4) |
| acyclic-arithmetic-period-hom | point; Q_p(−1) | Fⁿʳ, K; Fⁿʳt⁻¹ with φ=p⁻¹, jump −1 = (Fil^(1−j))⊥ with j=−1 | matches §5.3 Checks |
| bounded-arithmetic-subfiltration | trivial line, jump 1, r=1 | Fil¹=M_K, deg 1>0; Fil₁¹=0 gives weakly admissible, bounds kept | holds (CN25 L5.4) |
| Künneth split gap | annuli (1,1)⊗(1,1) | (1,2,1) | unchanged content |

## Notes for the maintainer

- Gap slugs renamed or split. Removed: `dagger-strictness-kunneth-over-c` and `bounded-arithmetic-filtration`. New: `dagger-strictness-over-c`, `dagger-kunneth-over-c`, `acyclic-arithmetic-period-hom` and `bounded-arithmetic-subfiltration`. Suppliers AdicSpacesPartIV and PadicHodgeTheory each receive two contracts where they had one.
- New supplier: AdicSpacesPartIII R3.4 (on main).
- `positive-crystalline-hom` now names a precise criterion and states that CN25's iterate equality (line 2865) is not used. This conflicts with PadicHodgeTheory §0.4, which proves only the inclusions.
- No Lean names changed. Ownership against open pull requests was checked through `roadmaps grep` and the supplier reads above; no other roadmap owns the Stein-factor limit statement.
- No suspicious instructions were found in the reviews.
