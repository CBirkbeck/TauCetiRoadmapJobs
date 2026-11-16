# FIX-RT-ModularFormsPartII~1: repair of red-team round 1 (passes a and b)

Eleven findings in two reviews; two pairs overlap (a/F03 with b/F04, a/F05 with b/F05). Nine sections below; every finding is settled. Edited: `packages/ModularFormsPartII/README.md`, `packages/ModularFormsPartII/Suggested.lean`, `packages/ModularFormsPartII/design/plan.json` (top-level `gaps`, `needs` of one existing slug only). No change to `sources.toml` or `metadata.toml`.

## RT-ModularFormsPartII~1a/F01 (P2) — applied

Confirmed. §4.3 is statable, consumed by Layer 5, and needs ModularCurvesPartII §§15.5, 15.10, which `nonabelian_ihara` does not. Added `ihara_generation` (CDT25 line 2024, (4.4.9); A = diag(p, 1) at CDT25 line 1589). The section comment is renamed to the README title, and the docstring lists it. README §4.3 now opens with the name, the hypotheses, and why `A⁻¹GA ∩ SL₂(ℤ)` = CDT's `A⁻¹GA ∩ Γ₀(p)`. A boundary Example was added.

## RT-ModularFormsPartII~1a/F02 (P3) — applied

Confirmed: as typed, `hneg` was redundant, and dropping it gives the strict theorem that NoncongruenceModularForms §3.3 (main) owns. Main assigns the *signed* form (W1.8) here. Old: `−I ∈ G`, conjugates in G ⇒ `Γ(N) ≤ G`. New: conjugates in `G ⊔ zpowers(−1)` ⇒ `Γ(N) ≤ G ⊔ zpowers(−1)`, with no hypothesis left over. README §1.8 and its proof sketch now work on `±G` and name §3.3 there as the strict form. "Scope and ownership" now has a NoncongruenceModularForms paragraph, and "Downstream consumers" names it.

## RT-ModularFormsPartII~1a/F03, RT-ModularFormsPartII~1b/F04 (P3) — applied

Confirmed: ModularForms on main has retired these labels (its table of earlier labels). Changes:

- The η transformation is now cited as ModularForms §0.2 (ε, `ε²⁴ = 1`).
- Character spaces, parity, old/new subspaces and the newform basis are now cited from pinned Tau Ceti: `TauCeti.char_neg_one_of_modFormCharSpace_ne_bot`, `TauCeti.cuspFormsOld`, `TauCeti.isCompl_cuspFormsOld_cuspFormsNew`, `HeckeRing.GL2.Newform.basis`. ModularForms itself takes these from Tau Ceti.
- §8.1 parity now comes from Conventions.

Same edits made in scope, the contract, §§6.2, 6.7, 7.3, 7.5, 8.1, 8.6 and the Layer 6–8 Dependencies.

## RT-ModularFormsPartII~1a/F04 (P3) — applied

Confirmed: QSeries §5.2 at its open head defines `ν_eta` as ModularForms §0.2's ε and adds only the metaplectic cocycle, which nothing here uses. All uses now point to ModularForms §0.2:

- §§6.2, 6.7, 7.10 and the Layer 6–7 Dependencies;
- the scope sentence and the QSeries contract sentence are deleted;
- the Layer 7 example uses `ρ = ε⁴`, recomputed: `ε(−I)⁴ = (−i)⁴ = 1`, `ε(T)⁴ = exp(πi/3)`.

## RT-ModularFormsPartII~1a/F05, RT-ModularFormsPartII~1b/F05 (P3) — applied

Confirmed at the ModularCurvesPartII head: §5.13 is "The fixed-pairing compactified curve". I added a §5.13 contract (`X(N, ζ)_R`, smooth and proper over `ℤ[1/N, ζ_N]`, which is `X(N)_K` of §9.1 for `K ⊇ ℚ(μ_N)`) and added it to the scope bullet. The §9.1 API claims that the fibres are geometrically connected, so §4.10 there (geometric connectedness of `Y(N, ζ)`, N ≥ 3) also gets a contract and is added to the §9.1 Needs line and the Layer 9 Dependencies.

## RT-ModularFormsPartII~1b/F01 (P2) — applied

Confirmed: §6.4 is the rational form, consumed by NoncongruenceModularForms (main) as W6.4, and statable with carriers already in the file. Added `rational_unbounded_denominators`; I chose this name over the suggested `boundedDenominators_congruence` so it parallels `algebraicInteger_unbounded_denominators`. The docstring lists it. README §6.4 now opens with the name and the exact hypotheses. Its proof sketch now names the pinned Laurent lemmas used, and three Checks were added (`Δ⁻¹/11`, `f = 0`, the `ℤ[1/2]` non-example).

## RT-ModularFormsPartII~1b/F02 (P2) — applied

Confirmed. Dwork–Gerotto–Sullivan, as cited in CDT25 lines 3807–3813, define "globally nilpotent" with an exceptional set of primes of Dirichlet density zero. Katz uses it for all but finitely many primes. In Katz's sense, "Galochkin ⇒ globally nilpotent" is not a known theorem. Both the README sentence and `gaps[2].needs` (same slug) are now the single composite: Galochkin ⇒ regular singular with rational exponents ⇒ quasi-unipotent monodromy. §7.9's statement and proof sketch now say "regular singular with rational exponents".

## RT-ModularFormsPartII~1b/F03 (P3) — applied differently

Confirmed at the pin: `TauCeti/NumberTheory/ModularForms/QExpansion/FunctionField.lean` lines 102, 137, 209, 215. Added a Tau Ceti contract entry, and §§5.1 and 5.4 now name `TauCeti.RiemannSurface.MeromorphicFunction` of the compactified quotient as the function field. The proposed equality `M₂N = laurentQExpansion D (coeffSubfield D ℚ)` is split by where its inputs live:

- §3.1 gets the inclusion ⊆, which is elementary.
- §5.1 gets the equality, because ⊇ needs §5.1's `ℂM₂m = ℂ(X(2m))` and `ℂM₂m ∩ ℚ((t)) = M₂m`. Putting it in §3.1 would make Layer 3 depend on Layer 5.

## RT-ModularFormsPartII~1b/F06 (P3) — applied

Confirmed: no step uses AlgebraicModularFormsAndSerreWeights §1.5 or GeometryOfNumbersAndQuadraticArithmetic §4.3. Deleted every occurrence of both (scope, contracts, §6.6 and §8.3 Needs, Layer 6 and 8 Dependencies).

The §8.3 sketch now names the theta step:

- Legendre's `E₀ = (1 − 16x)(K₀ + 2xK₀′)`, checked through `x³` (−4, −12, −80);
- §2.6 and §2.1;
- `θ_q x = xθ₄⁴`, proved by the Sturm bound (`ModularForm.sturm_bound_finiteIndex_SL2Z`, bound `2·6/12 = 1`).

Both sides of the last identity are `1 − 8q + 24q²`, and they agree through `q⁴` (−768).

## Adversarial pass (statements added or changed)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `wohlfahrt_Gamma_le` (signed) | N = 0; N = 1; `H′`, N = 2; `η²` kernel, N = 6 | `Γ(0) = ⊥`; conjugates of T in `±G` force `±G = SL₂(ℤ) = Γ(1)`; `gT²g⁻¹ = [[−1,2],[−2,3]] ∉ H′`, negative ∈ H′, `Γ(2) ≤ ±H′ = Γ(2)` true, `Γ(2) ≤ H′` false; `χ(T)⁶ = −1 ∈ ±1` | true; unsigned conclusion correctly excluded |
| `ihara_generation` | `G = ±Γ(N)`; N = 3, p = 2; `−I` | third set = `±Γ(N) ∩ Γ₀(p)`; `A[[1,3],[0,1]]A⁻¹ = [[1,6],[0,1]]`, `A[[1,0],[3,1]]A⁻¹ = [[1,0],[3/2,1]]`; `A(−I)A⁻¹ = −I ∈ G` | ⊆ shown directly; ⊇ is CDT (4.4.9) via §4.2 on D |
| `rational_unbounded_denominators` | `Δ⁻¹/11`; f = 0; `Σ Qⁿ/2ⁿ` | D = 11 gives `1, 24, 324`, Γ′ = SL₂(ℤ); D = 1; no D exists | true; hypothesis is one denominator |
| gap udc-bombieri-andre-katz | density-one vs cofinite | DGS94 definition (density-zero exceptions) vs Katz (finitely many) | composite statement is a theorem |
| §8.3 `θ_q x = xθ₄⁴` | through q⁴ | `θ_q x = q − 16q² + 132q³ − 768q⁴`; `xθ₄⁴` the same, with `θ₄⁴ = 1 − 8q + 24q² − 32q³ + 24q⁴` | true |
| §8.3 Legendre form | through x³ | `(1 − 16x)(1 + 12x + 180x² + 2800x³) = 1 − 4x − 12x² − 80x³ = E₀` | true |
| ModularForms §0.2 uses | ε², ε⁴, ε⁸ | `ε(T)² = e^(πi/6)`, `ε(S)² = −i`, `ε(−I)² = −1` (matches §1.3's `η²` character); `ε(T)⁴ = e^(πi/3)`; `ε(T)⁸ = e^(2πi/3)` | consistent |
| §3.1/§5.1 `coeffSubfield` | N = 1 | the image is the functions on X(2) with rational expansion, `ℚ(λ) = M₂` (§2.4) | consistent |

## Checks

- `lake env lean packages/ModularFormsPartII/Suggested.lean` (from the content checkout): exit 0, exactly 15 warnings, all "declaration uses `sorry`" (13 before, plus the two new theorems), no other output.
- `#check @name` for all 24 declarations, run once in a scratch copy: every elaborated type matches its README statement. The file has no `variable`, so no binder can be lost. The changed type is `wohlfahrt_Gamma_le`, now with `G ⊔ Subgroup.zpowers (-1)` and no `hneg`. The new types are `ihara_generation` and `rational_unbounded_denominators`.
- Every Tau Ceti name newly cited in the README passed `#check` at the pin.
- Dependency check: `depcheck: 239 roadmaps, 2254 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- `roadmaps resolve` on the README: no cross-roadmap citation or roadmap Lean name found nowhere.

## For the maintainer

- Changed name others may cite: `wohlfahrt_Gamma_le` (signed form). NoncongruenceModularForms (main) consumes it as W1.8 "signed Wohlfahrt" for full inverse images, which contain `−I`, so its use is unaffected.
- New names: `ihara_generation`, `rational_unbounded_denominators`. No roadmap declares either, and no other roadmap owns (4.4.9); ModularCurvesPartII Layer 15 was checked.
- Ownership was checked against the open heads of QSeriesPartitionsAndMockModularForms, ModularCurvesPartII and SpecialFunctionsTheta, read with `roadmaps show`.
- No new source was cited and nothing is requested. One arXiv paper was read only to check the DGS94 definition and is not cited.
- I quote no passage from any reviewed text as suspicious.
