# FIX-PKG-KloostermanSheavesAndBesselIsocrystals~5

Review settled: `REV-PKG-KloostermanSheavesAndBesselIsocrystals~4` (one finding, P3).

## F01 (P3) — applied

The claim is correct. A mechanical count over the `### k.n` blocks gave 63 of 65 with `*Needs:*`; the two without were §0.1 and §1.1. Both now have one, and the count is 65 of 65.

- §0.1 now ends with: *Needs:* Mathlib `AddChar`, `AddChar.compAddMonoidHom`, `Algebra.trace`, `FiniteField.algebraMap_trace_eq_sum_pow`, `IsDiscreteValuationRing`, `IsAdicComplete`, `IsFractionRing`; PadicDifferentialEquationsAndRigidCohomology §RD.6.2, §RD.6.3, §RD.6.46, §RD.6.48.
- §1.1 now ends with: *Needs:* §§0.1, 0.3; GlobalShtukasAndFunctionFieldLanglands §0.1, §§1.1–1.3, §1.4; gap:relative-level-geometry; SpringerResolutionAndCharacteristicCycles Layer 9 (§§9.1–9.2, 9.4, 9.6–9.7); gap:arithmetic-d-module-operations.

**How this differs from the suggested repair, and why.** The suggestion did not list everything the two statements use.
- §0.1 also uses §RD.6.3 (Tate twists: "`(1)` has `q^d`-Frobenius `q^{−d}`") and §RD.6.2 (`F_y = F_x^{[κ(y):κ(x)]}`, which is the "`d/d′`-th power" bullet). It also uses `IsAdicComplete` and `IsFractionRing`, because `R` is complete and `K` is its fraction field. §RD.6.47 (the Kummer object) is not used in §0.1, so the line cites §RD.6.46 and §RD.6.48 rather than the range §§RD.6.46–RD.6.48.
- §1.1 builds categories on Hecke stacks and on bounded pieces of the Beilinson–Drinfeld Grassmannian, so the line also cites GlobalShtukasAndFunctionFieldLanglands §1.1 (Grassmannians), §1.2 (Schubert bounds) and §1.3 (Hecke stacks).

**Supporting edits, so that the new lines agree with the rest of the roadmap.**
- Layer 0 `### Dependencies` now contains everything §0.1 needs: it adds `AddChar.compAddMonoidHom`, `FiniteField.algebraMap_trace_eq_sum_pow`, `IsDiscreteValuationRing`, `IsAdicComplete`, `IsFractionRing` and §§RD.6.2, RD.6.3. Layer 1 `### Dependencies` already contained everything §1.1 needs.
- Supplier contracts:
  - From Mathlib: "the coefficient ring of Layer 10" → "the coefficient ring `R` of §0.1 and of Layer 10".
  - The RD.6 bullet now lists §RD.6.2.
  - The SpringerResolutionAndCharacteristicCycles bullet now lists §9.2, Kashiwara's equivalence.
- gap:relative-level-geometry is extended, in `design/plan.json` (`needs`, `section`) and in its README contract line. Old request: §§0.1, 1.1–1.2. New request: §§0.1, 0.3, 1.1–1.3, adding full level structures and bounded Hecke stacks over `ℙ¹_S`.

Why the last two were needed: the adversarial pass on the §1.1 line found two inputs that no supplier provided.
- (a) SpringerResolutionAndCharacteristicCycles §§9.1 and 9.4 are stated only for smooth `Y`. The bounded pieces are singular. For example, the `GL₂` Schubert variety `Gr_{≤(2,0)}` is a quadric cone of dimension 2 whose vertex `tL₀` has a 3-dimensional tangent space. Defining `D`-modules on such a piece needs §9.2, through a closed embedding into a smooth variety.
- (b) The old gap covered `Bun_𝒢` and the Grassmannian over `R` and `K`, but not the Hecke stacks over `K`. §1.1 and §1.5 (`Hk_W` on `Bun_G(0,2) × X` over `K`) use those Hecke stacks. GlobalShtukasAndFunctionFieldLanglands builds the bounded Hecke stack in §1.3 from §0.3 and §1.2, so it owns the relative version as well. No other roadmap on main, at an open head or in the board packages states Hecke stacks over a mixed-characteristic base. (HeckeStacksAndLocalShtukasPartII treats local Hecke stacks, not stacks over `ℙ¹_S`.)

**Pattern search.** The same check run over the whole README (every `### k.n` block, every gap slug against its contract line, every layer's Dependencies against the Needs lines of its targets) found no other gaps. All 11 gap slugs in `design/plan.json` have a `What <Supplier> must provide (gap:<slug>)` line.

## Adversarial pass on the added and changed statements

No mathematical statement, Check or Lean declaration changed. Each new dependency was checked against the section it cites, at the current head of that roadmap, by evaluating it on an instance.

| Statement | Instance | Values computed | Result; change |
| --- | --- | --- | --- |
| §0.1 ← §RD.6.46 (character attached to `π`) | `p = 2`; `p = 3` | `p = 2`: the only root is `π = −2`, `π^{p−1} = −2 = −p`, `ζ_π = −1`, `ψ(1) = −1`. `p = 3`: `π² = −3`, `ψ_π(1) ≡ 1 + π mod π²`. | Agrees with §0.1 (`π^{p−1} = −p`); none |
| §0.1 ← §RD.6.3 (Tate twist) | `q = 4`, `d = 2` | `(1)`: `q^{−d} = 1/16`. Half twist: `c_4 = c_2² = 2`, so `c_4^{−2} = 1/4`, and its square is `1/16`. | Agrees with the existing half-twist Check; none |
| §0.1 ← §RD.6.2 (residue extension) | rank-one Dwork object at `a = 1 ∈ 𝔽₂`, viewed over `𝔽₄` (`d = 2`, `d′ = 1`) | `F_y = F_x² = (−1)² = 1`, and `ψ(Tr_{𝔽₄/𝔽₂} 1) = ψ(0) = 1`. Reading it with one factor gives `−1`. | Supports the "`d/d′`-th power" bullet; none |
| §0.1 ← §RD.6.48 (direction) | `ε = −1` against `ε = +1`, at `p = 3` | `ε = −1` gives `∇ = d − π dx` with trace `ψ^{−ε} = ψ`, i.e. `E_{−π}` with trace `ψ ∘ Tr` as in Conventions. `ε = +1` gives `ψ(1)^{−1} = ζ² ≠ ζ`. | Direction agrees; none |
| §0.1 ← `FiniteField.algebraMap_trace_eq_sum_pow` (Mathlib `FieldTheory/Finite/Trace.lean`:49, namespace `FiniteField`) | `𝔽₄ = 𝔽₂(ω)` | `Tr ω = ω + ω² = 1` and `Tr 1 = 0`, so `ψ ∘ Tr` takes the values `1, 1, −1, −1` at `0, 1, ω, ω + 1`. | Tower compatibility as stated; none |
| §0.1 ← `IsDiscreteValuationRing`, `IsAdicComplete`, `IsFractionRing` (Mathlib `DiscreteValuationRing/Basic.lean`:56, `AdicCompletion/Basic.lean`:57, `Localization/FractionRing.lean`:52) | `ℤ₂ ⊂ ℚ₂`; the field `ℚ₂` | `ℤ₂` satisfies all three, and `IsAdicComplete` includes `IsHausdorff`. `ℚ₂` is not a DVR, since its maximal ideal is 0. Mixed characteristic is carried by the prose (and by `CharZero K` and `¬IsUnit 2` in the Layer 10 signature). | Carriers match the prose; none |
| §1.1 ← GlobalShtukasAndFunctionFieldLanglands §0.1 (smooth affine model, connected fibres) | `G = 𝔾_m`: `G(0,2)` at `∞` has `O`-points `1 + tO` | Special fibre `𝔾_a`: smooth, affine, connected, not parahoric. This is the model in that section's own `ℙ¹/𝔽₃` Check. | Hypotheses met; none |
| §1.1 ← GlobalShtukasAndFunctionFieldLanglands §1.4 (stacks locally of finite type) | `B𝔾_m` | `H^*(B𝔾_m) = ℚ_ℓ[c]`, which is unbounded. §1.1 asserts triangulated categories, not bounded ones. | No boundedness conflict; none |
| §1.1 ← SpringerResolutionAndCharacteristicCycles Layer 9 (smooth `Y`) | `GL₂`, `Gr_{≤(2,0)}` | Dimension `⟨2ρ, (2,0)⟩ = 2`. It is a quadric cone, and its vertex `tL₀` has a 3-dimensional tangent space, so it is not smooth. | §9.2 (Kashiwara) added to the line and to the contract |
| §1.1, §1.5 ← gap:relative-level-geometry | bounded Hecke stack over `K` | The old gap stopped at §1.2. The bounded Hecke stack `(Gr_bound ×_{X^I} Bun_{G,Σnᵢxᵢ})/G_{Σnᵢxᵢ}` needs §0.3 and §1.3 over `S`. Torus witness: coweights `+1` and `−1` compose to `0`. | Gap extended to §§0.1, 0.3, 1.1–1.3 |
| Layer 0 and Layer 1 Dependencies against the new Needs lines | set inclusion | §0.1: 7 Mathlib names and 4 RD sections, all in Layer 0. §1.1: the GlobalShtukasAndFunctionFieldLanglands sections `{0.1, 1.1–1.4} ⊂ {0.1, 1.1–1.9}`; both gaps and Springer Layer 9 are in Layer 1. | Agrees after the Layer 0 edit |

## Checks

- **Elaboration.** Ran `lake env lean packages/KloostermanSheavesAndBesselIsocrystals/Suggested.lean` from the content checkout. It exited 0 with exactly five `declaration uses 'sorry'` warnings, at lines 66, 133, 145, 156 and 169. `Suggested.lean` is unchanged; it imports only `Mathlib`, so no Tau Ceti module had to be built.
- **Signatures.** A scratch file ran `#check @name` on all 11 declarations: `dworkBlock`, `signed_dwork_congruence`, `kloostermanSum`, `orthogonalSum`, `quadraticCharIn`, `quadraticHypergeometricSum`, `traceChar` and the four finite-sum and ordinarity theorems. It elaborated with exit 0. Each elaborated type matches its README statement; no section binder is lost, and nothing changed.
- **Direction check.** The prescribed depcheck (`--movable --content`) printed:

  ```
  depcheck: 236 roadmaps, 2146 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or `moved:` line.
- **Package gate, on a scratch copy.** Every check was 0 except `git=1`. That failure is expected: the scratch copy is not a git repository.
- **Citation resolver.** The only lead is `KloostermanMomentsAndPotentialAutomorphy §2.6`, at README line 134. It is a false positive. That roadmap is a board package (`packages/KloostermanMomentsAndPotentialAutomorphy/README.md`, where `### 2.6 The Bessel connection dictionary` is at line 747), and it sits earlier in the merge order (line 310, against line 366 for this roadmap). The resolver reports no unresolved Lean names.
- **Supplier sections cited by the new lines,** checked at the current heads:
  - GlobalShtukasAndFunctionFieldLanglands §§0.1, 0.3, 1.1–1.4.
  - SpringerResolutionAndCharacteristicCycles §§9.1, 9.2, 9.4, 9.6, 9.7.
  - PadicDifferentialEquationsAndRigidCohomology §§RD.6.2, RD.6.3, RD.6.46, RD.6.48.

  All are present and say what is cited.

## Notes for the maintainer

- No Lean name changed and no section was renumbered, so other roadmaps that cite this one are unaffected.
- gap:relative-level-geometry now asks GlobalShtukasAndFunctionFieldLanglands for more: full level structures (§0.3) and bounded Hecke stacks (§1.3) over `ℙ¹_S`, in addition to `Bun_𝒢`, the Grassmannian and Schubert bounds. The roadmap already used these over `K` in §§1.1 and 1.5.
- No sources were fetched and no reference requests were made. The seven uncertified entries stay settled.
- Ownership: no new construction is stated here. The extended gap names the existing owner of the finite-field construction.
