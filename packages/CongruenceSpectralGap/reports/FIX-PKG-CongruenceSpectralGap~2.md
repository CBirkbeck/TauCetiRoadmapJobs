# FIX-PKG-CongruenceSpectralGap~2

Repair of the review `REV-PKG-CongruenceSpectralGap` (seven findings: F01–F04 at P2, F05–F07 at P3). Files changed: `packages/CongruenceSpectralGap/README.md`, `Suggested.lean`, `sources.toml` (new entry `bms02`), `design/plan.json` (top-level `gaps` only).

## F01 (P2) — applied

Docstring: "the congruence spectral gap" → "the Rayleigh-infimum form λ′₁". Added the headline `congruence_eigenvalue_bound` (the reviewer's tested statement) under Layer 5. README §5.3 now states it, with a route through §§0.1–0.4 and Checks for the constant, E(z,3/2) and y^s. §0.2 gains the maximal-domain fact, proved by Gaffney's argument on Γ(3N)\ℍ (bms02 Corollary 2.10).

## F02 (P2) — applied differently

The finding is correct: this roadmap owns ΔΓ. The gap now asks AutomorphicSpectralTheory only for the adelic level-K(N) decomposition, which §0.6 transports to ΔΓ. The suggested "trivial central character" is wrong: at N=5, nebentypus forms in L²(Γ(5)\ℍ) have the quadratic central character, and at N=8 the identity component grows beyond Γ(8)\ℍ. The gap therefore uses L²([GL₂]¹).

## F03 (P2) — applied differently

Restated as one object: §4.5 `maassClassicalEquiv` extended to K(N) through §3.1 `classicalEquiv`, as an isometry of the whole K(N)·SO(2)-invariant L² space onto ⊕ over (ℤ/N)ˣ of L²(Γ(N)\ℍ). A cusp-form-only map would not transport §0.6's residual and continuous parts. Cusp forms are matched on the identity component. §4.5 is added to the contracts and the §§0.6 and 1.1 Needs.

## F04 (P2) — applied

gap:complex-gamma-strip-estimates is deleted. Added Mathlib `Complex.Gamma_ne_zero` and `Complex.differentiable_one_div_Gamma` (`Gamma/Beta.lean:426, 521`) and a ZerosOfLFunctions contract: Layer 1, items 2–5, and Layer 3, items 1–3 (item 4 is family-specific). gap:finite-rs-polynomial-strips is narrowed to the `rsDatum (π⊗χ) π∨` record meeting the hypotheses of Layer 3, item 3. The Needs of §§2.2, 3.3 and 3.4 are updated.

## F05 (P3) — applied

Old: "the empty-product fibre would force a different identity". New: rank 0 is excluded because the bound fails, although the identity persists. At q=7, r=1 both sides equal 2 (3(1+0)−1=2), while (q−1)·0·q^(−1/2)+1=1<2. No other occurrence.

## F06 (P3) — applied

§3.1: the vacuous F₁(0,x)=0 is replaced by the dilation Check F₁(φ_c,x)=F₁(φ,x/c); a dy tail gains a factor c. §3.2: the φ=0 Check is replaced by G(w)=w, giving βF₁(φ∘inv,x)−φ(1/x) (G(β+s) gives +φ(1/x)), and a 1/s Check: F₂(1/5)=1 versus φ(5)=0. Three discriminating Checks each.

## F07 (P3) — applied

(a) Repointed to "AL.3, Hecke, eigensystem and Rankin–Selberg data" (`rsDatum`, `IsNicePinned`) in the contract, the §§2.1 and 3.4 Needs and the plan section. (b) SA-E01–SA-E13 plus UO-A01–UO-A03, in all six places. (c) "PDE Lane A, item 1", in four places. (d) The slug prefixes are fixed.

## Checks

- **Elaboration.** `lake env lean packages/CongruenceSpectralGap/Suggested.lean`, run from the content checkout: exit 0. There are three warnings, all `declaration uses sorry` (lines 44, 55, 71), and no errors. No `TauCeti.*` import is used.
- **`#check @` comparison.** I put `#check @` for all four declarations into one scratch copy and elaborated it once.
  - `hyperKloosterman`, `hyperKloosterman_bound` and `gauss_power_even_average_bound` are unchanged and match their README statements.
  - `congruence_eigenvalue_bound` elaborates as ∀ Γ, `IsCongruenceSubgroup Γ` → ∀ u, `ContDiffOn ℝ 2 u {z | 0 < z.im}` → invariance → bounded → nonconstant → ∀ lam : ℝ, (∀ z : ℍ, −↑z.im ^ 2 * Laplacian.laplacian u ↑z = ↑lam * u ↑z) → 21/100 ≤ lam.
  - With `pp.explicit` I confirmed that `γ • z` uses `UpperHalfPlane.SLAction` and that Δ is `InnerProductSpace.instLaplacian`. The README states these same hypotheses.
  - There are no section variables, so no binder can be lost.
- **Padding probe on the new theorem.** `simp`, `norm_num`, `positivity`, `linarith`, `aesop` and `exact le_of_eq rfl` all fail.
- **Dependency check.** It shows no UPWARD or CYCLE line:

      depcheck: 45 roadmaps, 456 edges, 0 problem(s)

- **Citations.** `roadmaps resolve`: no cross-roadmap citation or Lean name is found nowhere. `sources check`: 0 problems.
- **Sources.** `bms02` (Braverman–Milatovic–Shubin, arXiv:math/0201231v3, open repository, certified) is added. The locators were read in the text: §2.1 p.4 (bms02 line 151), Assumption B p.5 (line 196), Corollary 2.10 p.7 (line 245). Strichartz 1983 resolved only to a paywalled page, so it was not used. No `needs-references.toml` was written.

## Adversarial pass (new or changed statements)

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| `congruence_eigenvalue_bound` | Γ=SL₂(ℤ), u≡1 | equation forces λ=0; 0<0.21; only hnc fails | hnc needed | Check |
| same | E(z,3/2) at level one | −y²ΔE=(3/2)(−1/2)E=−(3/4)E; grows like y^(3/2) | hbdd needed | Check |
| same | level-one cusp form, λ≈91.14 | bounded; 91.14≥0.21 | consistent | none |
| same, sign | y^s | Δy^s=s(s−1)y^(s−2); −y²Δ gives s(1−s); s=1/2 gives 1/4 | sign pinned | Check |
| same, λ=0 branch | bounded harmonic invariant u | ΔΓu=0 gives a.e. constant, then constant by continuity | excluded by hnc | route |
| §0.2 maximal domain | 1; bump; E(z,1/2+it) | Δ1=0 ∈ L²; bump in domain; ∫y·y⁻²dy diverges, so E ∉ L² | pass | API |
| Γ(3N) torsion-free | N=1 (Γ(3)), N=2 (Γ(6)) | trace −1 with γ=I+3A forces 3tr A+9det A=0, contradicting tr A=−1; −I≢I mod 3 | pass | route |
| gap all-level | N=1, 2, 5 | 1 component, 1 cusp; 1 component, 3 cusps; 4 components, 4 τ∘det | pass | gap text |
| gap all-level (rejected form) | trivial central character, N=5 and N=8 | loses nebentypus forms; identity stabilizer meets {γ≡3I mod 8} | rejected | F02 |
| gap classical comparison | N=1; Γ₀(2)⊇Γ(2) | PGL₂(ℤ̂) at level one; Γ₀(2)/Γ(2) fixes ∞ and swaps 0,1, giving 2 cusps | pass | gap text |
| §0.6 channels | SL₂(ℤ) ⊇ Γ(2) | S₃ transitive on 3 cusps, giving 1 channel | pass | route |
| gap finite-rs | m=2, q=3; q=5 | q=3 has no even nonprincipal χ; |root number|=f^(1/2)f^(−1/2)·5²/25=1 | pass | gap text |
| ZerosOfLFunctions G growth | μ=±1/5, d=4 | log-exponents −2σ and 2σ−2 differ by 2−4σ=d(1/2−σ); exponentials cancel | pass | contract |
| Laplacian on ℂ | x²+y² | Δ=4 with basis 1, i | pass | contract |
| §3.1 dilation | supp [1,2], c=2 | F₁(φ₂,1)=F₁(φ,1/2)=1; dy tail ×2 | pass | Check |
| §3.2 G(w)=w | supp [3,4]; x=0.3, 2, 1/5 | ∓2φ(10/3)≠0; 0 and 0; β and β | pass | Check |
| §3.2 1/s | x=1/5 | F₂=1 versus φ(5)=0 | pass | Check |
| §4.3 k=0 | q=7, r=1 | identity 2=2; bound 1<2 | Check corrected | F05 |

## For the maintainer

- **New Lean name.** `TauCetiRoadmap.CongruenceSpectralGap.congruence_eigenvalue_bound`. No existing names changed.
- **Changed requests to other roadmaps.** gap:complex-gamma-strip-estimates no longer exists. gap:all-level-spectral-realization (AutomorphicSpectralTheory, §§4.3–4.4, 4.8, 4.14a), gap:principal-level-classical-constituents (AutomorphicFormsOnReductiveGroups, §§3.1, 4.5) and gap:finite-rs-polynomial-strips (AutomorphicLFunctionsAndLocalFactors, "Hecke, eigensystem and Rankin–Selberg data") have new texts.
- **New supplier.** ZerosOfLFunctions is now a supplier. It is an open new-roadmap pull request by another author, not in the merge order; AnalyticNumberTheoryPartI already cites it, and depcheck accepts it.
- **Ownership.** The arbitrary-congruence operator, including its maximal domain, stays here (§0.2). I searched for Gaffney's theorem and for essential self-adjointness of a manifold Laplacian on main and at the open heads: the only owner is AutomorphicSpectralTheory §1.16a, for Γ₀(N). Ownership against open pull requests was checked only through `roadmaps grep` and by reading the supplier heads (AutomorphicSpectralTheory, AutomorphicFormsOnReductiveGroups, AutomorphicLFunctionsAndLocalFactors, ZerosOfLFunctions, ArithmeticLocallySymmetricSpaces, UnboundedOperators, AnalyticNumberTheoryPartI).
- **Not settled.** Whether ZerosOfLFunctions' record class covers the twisted self-pair is now exactly what gap:finite-rs-polynomial-strips asks AutomorphicLFunctionsAndLocalFactors to supply.
- **No suspicious instructions** were found in the review text.
