# Review of SpringerResolutionAndCharacteristicCycles (pull request #1828 at f8ea4db)

**Verdict:** accepted

This is an incremental re-review of the 18 lines of `README.md` that changed since 5d1cb30 (the Tau Ceti contract paragraph, §10.1, §12.1 and the *Needs*/Dependencies lines of Layers 10 and 12). Both findings of the previous report are repaired, the repairs introduce no new defect, and the gate passes. No finding remains.

## Previous findings

- R01 — repaired: the contract now reads "a Cartan subalgebra acting triangularizably on it … It assumes no algebraic closure", which is the theorem's signature at Tau Ceti 2fd255d9 (`FiniteDimensional.lean:71–73`: `[IsTriangularizable K H L]`, no `IsAlgClosed`). §10.1 takes its modules from ReductiveGroups §10B; §12.1 applies the criterion to [g,g] with t∩[g,g] and adds the string argument; the `existsUnique` theorem (which does keep `[IsAlgClosed K]`, `Existence.lean:95`) is removed from every *Needs* and Dependencies line.
- R02 — repaired: `FiniteDimensional.lean:122`, `Existence.lean:234`, `Integrable.lean:114,150` are the `theorem` lines at Tau Ceti 2fd255d9; the Mathlib locators `ZariskisMainTheorem.lean:373` and `Length.lean:31,169` are the declaration lines at Mathlib 1b1ccf4b.

## Verified sound

**Which pin the locators follow.** The pull request's own `lake-manifest.json` (unchanged since the merge base) pins Tau Ceti 358314d4 and Mathlib f6090c70, while main pins 2fd255d9 and 1b1ccf4b. The commit message says "main-pin locators", and the README is now consistent with main's pins throughout: all eight `file:line` locators in the contracts were opened at both revisions.

| Locator in README | at main's pin (2fd255d9 / 1b1ccf4b) | at the branch pin (358314d4 / f6090c70) |
|---|---|---|
| `AlgebraicCycle/Basic.lean:44` | `abbrev AlgebraicCycle` | same |
| `ZariskisMainTheorem.lean:373` | `lemma IsFinite.of_isProper_of_locallyQuasiFinite` | blank (lemma at 372) |
| `Length.lean:31,169` | `def Module.length`, `lemma Module.length_eq_add_of_exact` | 30, 168 |
| `Verma.lean:195` | `def VermaModule` | same |
| `FinitelyPresentedSheaf/Basic.lean:48` | `abbrev FinitelyPresentedSheaf` | same |
| `Integrable.lean:114,150` | the two `theorem` lines | 118, 154 |
| `FiniteDimensional.lean:122` | `theorem finiteDimensional_iff_isDominantIntegral_of_isHighestWeightVector` | proof line (theorem at 126) |
| `Existence.lean:234` | `theorem existsUnique_isDominantIntegral_highestWeight_of_finiteDimensional_irreducible` | proof line (theorem at 240) |

At 2fd255d9 the variable block of `FiniteDimensional.lean` (lines 71–75) is `[Field K] [CharZero K] … [IsKilling K L] [FiniteDimensional K L] {H} [H.IsCartanSubalgebra] [IsTriangularizable K H L] … [LieModule.IsIrreducible K L M]`, with no `IsAlgClosed`; at 358314d4 (lines 75–79) it carries `[IsAlgClosed K]` and no `IsTriangularizable`. The README describes the 2fd255d9 form. `Existence.lean` keeps `[IsAlgClosed K]` at both revisions (line 95 and line 101), as the README now says. A stale branch manifest behind main's pin bump, with the README written against main's pins, is the situation other pull requests settled as main's pins; it is recorded here, not raised. The merged tree carries main's manifest, so the citations are exact where they will be read. `Suggested.lean` declares nothing and elaborates at either pin.

**Definitions behind the cited theorems (Tau Ceti 2fd255d9).** `IsHighestWeightVector b lam v` (`HighestWeight/Basic.lean:122`) is `v ≠ 0`, `⁅x, v⁆ = lam x • v` for `x ∈ H`, and `⁅x, v⁆ = 0` for `x` in the positive nilradical of the base `b`. `IsDominantIntegral b lam` (`Basic.lean:286`) is `lam(coroot i) ∈ ℕ` for every `i` in the support of `b`. Mathlib's `IsTriangularizable` (`Weights/Basic.lean:701` at 1b1ccf4b) asks that the generalized eigenspaces of each `x ∈ H` span; the root-space decomposition of a split semisimple Lie algebra gives it for a splitting Cartan, which is the README's "acts triangularizably because T is split". `IsKilling.rootSystem H` itself takes `[IsTriangularizable K H L]` (`Weights/RootSystem.lean:46`), so the base `b` in the theorem's statement already presupposes it.

**§12.1 over an arbitrary characteristic-zero k.** The criterion is applied to L=[g,g] (nondegenerate Killing form in characteristic zero), H=t∩[g,g] (a splitting Cartan of the derived algebra when T is split), the base of the positive roots of u, and M=L_w restricted to [g,g]. L_w is irreducible over [g,g]: the centre of g acts by the scalar λ_w on the highest-weight vector and commutes with U(n⁻), hence by that scalar on all of L_w=U(n⁻)v, so every [g,g]-submodule is a g-submodule (this is the sentence "the centre acting by scalars so that L_w stays irreducible over the derived algebra" in §12.1). The restriction of λ_w∈X*(T) to t∩[g,g] takes integer values on coroots, so dominant integral means every pairing ≥ 0.

**ReductiveGroups §10A/§10B on main (eaf17b1, lines 1733 and 1759).** §10B puts `∇(λ)=Ind_(B⁻)^G k_λ` for split connected reductive G over a field, proves finite dimensionality and highest weight λ for λ∈X⁺, the classification of finite-dimensional rational simples by X⁺, arbitrary-field base change for split objects, and that characteristic-zero complete reducibility makes Δ=∇=L. §10A differentiates a rational action and constructs the integration comparison with the T-weights. This is exactly what the new §10.1 sentence and the new contract sentence attribute to it. ReductiveGroups is cited on main; the open revisions #1332, #1676 and #1808 are not dependencies.

**Seeded sample where it meets the changed passages.**

- §10.1: ElliottBB line 174 (Theorem 1: Φ_λ surjective, kernel U·ker χ_λ), line 227 (Definition 3, D-affinity), lines 270–282 (Theorem 3 and its route through finite-dimensional G-modules V and their equivariant filtrations), line 44 (ElliottBB works over an algebraically closed field; the README's descent to k is the Conventions' "pass to an algebraic closure and descend", unchanged). BHS19 lines 885–893: KL multiplicities and O(0) of trivial infinitesimal character.
- §12.1: BHS19 lines 1011–1016 (B acts algebraically on L(ww₀·0); P_w the largest parabolic containing B whose Levi makes ww₀·0 dominant; P_w=G iff w=w₀), Lemma 2.4.8 at lines 1025–1030, printed p. 324.

**Gate, dependency check, build.**

- The gate scanners, rerun on f8ea4db: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate at this head adds `build=0`.
- `depcheck: 242 roadmaps, 2452 edges, 0 problem(s)` with `--movable`: no UPWARD or CYCLE line; the roadmap is line 259 of the merge order.
- `lake env lean` on `Suggested.lean` (62 lines, no declarations, unchanged) exited 0 with no output in 10 s at the branch pin (shared packages directory at f6090c70 with a complete olean set). Nothing to `#check`, nothing for the one-tactic probe.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- `roadmaps overlaps`: no other open pull request changes this roadmap, no cited id is dropped by an open pull request, none is defined only by an open revision. `roadmaps resolve`: no unresolved citation or Lean name.
- The seven `gap:` slugs each appear once in the README; the board's `design/plan.json` lists the four gaps `lie-invariants`, `associated-bundle-descent`, `local-geometric-comparisons`, `derived-bimodule-sheaves`, unchanged since the previous round (settled there).

**Adversarial table.** The first eight rows are this round's, for the changed statements; the rest are carried from the previous report for statements the diff leaves untouched.

| Statement | Instances | Values each side | Result | Row from |
|---|---|---|---|---|
| Contract, first pinned theorem: hypotheses | variable block at 2fd255d9 vs README | `[IsTriangularizable K H L]`, no `IsAlgClosed` (lines 71–73); README "acting triangularizably … assumes no algebraic closure" | sound at main's pin | this round |
| Contract, companion theorem: hypotheses | variable block at 2fd255d9 | `[IsAlgClosed K] [FiniteDimensional K M] [IsIrreducible]` (lines 95–99, 235); README "assumes an algebraically closed field … unique dominant integral highest weight" | sound | this round |
| Contract locators, 8 of them | both pins | all 8 are declaration lines at 2fd255d9/1b1ccf4b; 5 of 8 differ at 358314d4/f6090c70 (table above) | sound, main's pins | this round |
| §12.1 criterion applied over k=ℚ to [g,g] | sl₂, λ_e=−α; λ_s=0 | λ_e(α∨)=−2∉ℕ: not dominant integral, L_e infinite-dimensional; λ_s(α∨)=0∈ℕ: L_s=ℚ, dim 1 | sound | this round |
| §12.1 new string sentence | sl₂, λ=−2, k=0,1,2 | `ef v=(1)(−2)v`, `ef²v=(2)(−3)fv`, `ef³v=(3)(−4)f²v`; weights −2,−4,−6 distinct | sound | this round |
| §12.1 irreducibility over [g,g] | gl₂, L_w, z=I | z acts by λ_w(I) on v and commutes with f; on U(f)v by the same scalar; sl₂-submodules are gl₂-submodules | sound | this round |
| §10.1 modules from ReductiveGroups §10B | SL₂ ω over ℚ; PGL₂ 2ω | `∇(ω)=ℚ²`, dim 2; `∇(2ω)` dim 3, as the §10.1 Checks | sound | this round |
| §10.1 / Layer 10 and 12 *Needs* lines | the two names removed vs kept | `existsUnique…` absent from lines 1164, 1241, 1350, 1373; `finiteDimensional_iff…` kept at 1350, 1373 where §12.1 consumes it | sound | this round |
| §12.1 "−wρ−ρ dominant only for w₀" | SL₂; SL₃ all six w; torus | SL₂ −2, 0; SL₃ e (−2,−2), s₁ (0,−3), s₂ (−3,0), s₁s₂ (1,−2), s₂s₁ (−2,1), w₀ (0,0); torus W={e}, λ=0 | sound | previous report |
| Scope line 10, GroupSchemesOverABase §7.6 | SL₂ | multiplicative `G̃⊂G×Bor(G)` vs additive `g̃⊂F×g` | sound | previous report |
| Scope line 11, LieHighestWeight Layers 3/7/9 | three copies | lines 405/931/1432 on main | sound | previous report |
| Conventions: `L_B(ρ)` for SL₂ | `[g,x] ↦ x·g e₁` | tautological `O(−1)`; opposite relation `O(1)` | sound | previous report |
| Conventions: `κ₂ = w⁻¹κ₁` | GL₃, 3-cycle, `diag(1,2,4)` | `Ad(w⁻¹)z = diag(2,4,1)`, `Ad(w)z = diag(4,1,2)` | sound | previous report |
| Conventions: KL matrix | SL₂ | `((1,0),(1,1))` | sound | previous report |
| Conventions: `Li*δ[−1]` | `{0} → A¹` | `Tor₀ = 0`, `Tor₁ = kδ`, `H⁰ = k` | sound | previous report |
| §1.3–1.4 orbit dimension | SL₂ e, s; torus | 1, 2; 0 | sound | previous report |
| §1.5 intersection of subbundles | `k[ε]/ε²` | intersection `(ε)(1,0)`, not a summand | sound | previous report |
| §2.2–2.3 regularity, degrees | SL₂ `E₁₂`, 0, `diag(1,−1)` | centralizer dims 1, 3, 1; fibres 1 flag, `P¹`, 2 flags | sound | previous report |
| `gap:lie-invariants` | `GL_n`, p>n; `GL₂/𝔽₂(t)` | `x_s` polynomial in x; `√t·I ∉ 𝔤𝔩₂(𝔽₂(t))` | sound | previous report |
| `gap:regular-borel-torsor` | SL₂ | Borels 1, 2, `P¹` | sound | previous report |
| `gap:lie-isogeny-forms` | `GL₂`; `SL_n` | `κ(I,I) = 0`; kernel order < p | sound | previous report |
| `gap:root-wall-regularity` / §5.3 | GL₃, SL₂ | centralizer dims 3 = r, 5 > 3; 1 = r | sound | previous report |
| §3.4 bundle rank | SL₂ | fibre dims 2, 1; total 3 | sound | previous report |
| §3.7 lci count | SL₂ | 5 − 2 = 3 | sound | previous report |
| §4.1 fibre dimension | torus; SL₂ | 0; 2 | sound | previous report |
| §4.2 dualizing sheaf | SL₂ `X_s` | `O(−1,−1)`; wrong twist `O(1,1)` | sound | previous report |
| §4.2 product order, regular weights | A₁, p = 3 | `0, 2ρ` regular; `ρ, 4ρ` singular | sound | previous report |
| §4.3 flatness insufficient | `Spec ℤ_(p) ⊔ Spec ℚ[x,y]/(x²,xy)` | depth 0 < dim 1 | sound | previous report |
| §4.4 miracle flatness | `Spec k ⊔ A¹ → A¹` | `0 ≠ 1 + 0` | sound | previous report |
| §5.4 / §13.4 fixed space | `w⁻¹z = v⁻¹z` | `z ∈ ker(wv⁻¹ − 1)` | sound | previous report |
| §6.1 nilpotent fibre | PGL₂, GL₂ | cone `a² + bc = 0` | sound | previous report |
| §6.3 sign | diagonal conormal | `(−ψ, ψ)` | sound | previous report |
| §6.4–6.5 Steinberg components | SL₂ | `Z_e`, `Z_s` dim 2, meet in `P¹` | sound | previous report |
| §7.3–7.4 zero fibre, CM | SL₂; `k[x,t]/(x²−t)` | `[Z_e] + [Z_s]`; length 2 | sound | previous report |
| §8.2 ranks | A¹ | 1, 2, 3 | sound | previous report |
| §8.4 graded exactness | `D/Dx → D/Dx² → D/Dx` | 1, 2, 1 | sound | previous report |
| §8.6 additivity fails | `D ⊕ O` | `[A²]` vs `[A²] + [ξ=0]` | sound | previous report |
| §9.3–9.5 | `O`, `D`, `δ`, `δ⊕δ` | dims 1, 2, 1, 1; length 2 | sound | previous report |
| §9.9 non-connected H | `ℤ/2` on two points | equivariant simple, not `D`-simple | sound | previous report |
| §10.1 global operators | torus | `k` | sound | previous report |
| §10.4 / §11.1 labels | SL₂ | `CC(M_e) = [Z_e]`, `CC(M_s) = [Z_e] + [Z_s]` | sound | previous report |
| §11.1 top Borel–Moore | `T*P¹` | `H₄ = 0`, `H₄^BM = ℚ` | sound | previous report |
| §11.3 DR stalks, A₃ | SL₂; `s₂s₁s₃s₂` | χ = 1, −1, 0; `P = 1 + q` | sound | previous report |
| §11.4 integral inverse | SL₂ | `M⁻¹ = ((1,0),(−1,1))` | sound | previous report |
| §12.1 converse string | `⟨λ,α∨⟩ = −m` | `(k+1)(−m−k) ≠ 0` | sound | previous report |
| §12.1 SL₃ weight | `w = s₁` | pairings 0, −3 | sound | previous report |
| §12.2 first-flag translation | SL₂ `w = e` | `(k(e₁+e₂),ke₂,0) ∉ Z_e` | sound; refutes BHS19 Lemma 2.4.8 | previous report |
| §12.2 saturation form | `G×ᴮF ≅ F×F` | first flag moves in fibre of `π_w`; SL₃ dim 6 | sound | previous report |
| §12.2 smooth-pullback cycle | `A² → A¹`, `δ₀` | coefficient 1 | sound | previous report |
| §13.1–13.2 Cartan fibre product | SL₂ | `k[x,y]/(x²−y²)` | sound | previous report |
| §13.3 detection | `k[x]_(x) → k[x,y]_(x,y)` | `2 = 1 + 1` | sound | previous report |
| §13.4–13.5 tangent bound | SL₂; torus | `3 = D`; `r` | sound | previous report |
| §14.1–14.4 completion | node `y² = x²(1+x)` | `1 ↦ 1 + 1` | sound | previous report |
| Degenerate cases | trivial group, torus | point classes | sound | previous report |

**Ownership.** The diff adds no object: it moves §10.1's supply of finite-dimensional modules to ReductiveGroups §10B (an existing owner on main) and keeps the Lie-algebra classification with the pinned Tau Ceti theorems. The ownership search of the earlier reports stands; the vocabulary neighbours are unchanged (#1809, #1224, #1829, #1332, #1808).

## Not verifiable

- G86 and KT84 are settled as uncertified and cited by locator in §11.1. Hum08 §8.4 and KL80 are paywalled and cited by bibliographic data in §11.3. None of these is touched by the diff.

## Source issues

- **Error** in BHS19 at Lemma 2.4.8 and Remark 2.4.9, printed p. 324: the source says the simple characteristic cycle is invariant when P_w translates the first flag on the left; it should say the cycle is saturated along the fibres of F → G/P_w on the first flag (for SL₂, w = e, a unipotent of B moves (ke₂, ke₂, 0) off Z_e); affects a stated result.
