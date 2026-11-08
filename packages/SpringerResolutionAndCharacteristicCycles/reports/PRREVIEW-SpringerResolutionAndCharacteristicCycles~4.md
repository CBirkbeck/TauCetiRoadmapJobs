# Review of SpringerResolutionAndCharacteristicCycles (pull request #1828 at 5d1cb30)

**Verdict:** needs changes

This is an incremental re-review of the 18 lines that changed in `README.md` since 943f769. Both findings of the previous report are repaired. The README no longer cites a LieHighestWeight layer that an open revision drops, and the GroupSchemesOverABase id now resolves. The repair of the LieHighestWeight citation introduced two new defects, both in the new Tau Ceti contract sentence:

- It states the hypotheses of the two newly cited pinned theorems wrongly. Both assume an algebraically closed field, and the README says the criterion "needs no algebraic closure" (P2).
- It gives line locators that point inside the preceding proofs (P3).

The hypothesis list in the previous report's own repair text also left out `IsAlgClosed`, and the README followed it. That omission is corrected here.

## R01 (P2) — the two newly cited Tau Ceti theorems assume `[IsAlgClosed K]`; the README says the criterion needs no algebraic closure and uses it over an arbitrary characteristic-zero field

**Location.** `TauCetiRoadmap/SpringerResolutionAndCharacteristicCycles/README.md`:

- Line 54 (Tau Ceti contract): "The first: over a characteristic-zero field, for a finite-dimensional Lie algebra with nondegenerate Killing form, a Cartan subalgebra acting triangularizably on it and a chosen base, …". Later in the same line: "§10.1 uses the finite-dimensionality of the simple module at a dominant integral weight, which needs no algebraic closure".
- Line 1327 (§12.1): "By the pinned finite-dimensionality criterion …, L_w is finite-dimensional exactly when λ_w is dominant integral".
- The *Needs* and Dependencies lines 1164, 1241, 1350 and 1373.

**Claim.** The contract describes the first theorem with the hypotheses of the Integrable.lean pair: any characteristic-zero field and a triangularizable Cartan. §§10.1 and 12.1 then consume it over the field k of the Conventions (line 23, "Let k be a field"; §10.1 and §12.1 open with "char(k)=0"), which need not be algebraically closed. At the pin, both theorems take `[IsAlgClosed K]` from their section `variable` block. Neither takes a triangularizability binder; it is derived from algebraic closure through `LieModule.instIsTriangularizableOfIsAlgClosed`. So the contract states a theorem the library does not prove at the generality claimed, and the step from k̄ back to k is not stated anywhere in the README. The supplier roadmap works over algebraically closed K as well (RepresentationTheory/LieHighestWeight on main, Standing conventions, line 77).

**Witness.** Elaborating `#check @TauCeti.finiteDimensional_iff_isDominantIntegral_of_isHighestWeightVector` against the pin prints the binders `[Field K] [CharZero K] [IsAlgClosed K] … [H.IsCartanSubalgebra]`, with no `IsTriangularizable`. The same holds for `existsUnique_…`. The source is the variable blocks in `TauCeti/Algebra/Lie/HighestWeight/FiniteDimensional.lean:75` and `Existence.lean:101`. At K = ℚ the theorems do not apply, because x²+1 has no rational root.

**Repair.**

- (a) In line 54, state the first theorem as "over an algebraically closed field of characteristic zero, for a finite-dimensional Lie algebra with nondegenerate Killing form, a Cartan subalgebra and a chosen base, …", and delete "which needs no algebraic closure".
- (b) §10.1 needs finite-dimensional rational G-modules at dominant λ∈X*(T) over k. ReductiveGroups §10B, already on that *Needs* line, supplies them: on main, line 1759 onward, ∇(λ) is finite-dimensional for λ∈X⁺, the simple modules are classified, and base change holds over any field for split G. Remove the two names from the line 1164 *Needs* and from the line 1241 Dependencies, and say in line 54 that §10.1 takes these modules from §10B.
- (c) In §12.1, replace the new sentence with an argument that holds over k. If w≠w₀, some simple α has ⟨λ_w,α∨⟩<0, and the string computation already in §12.1 gives f_α^k v≠0 for every k, at the pairwise distinct weights λ_w−kα. So L_w is infinite-dimensional, while L_{w₀}=L(0)=k. Remove the two names from lines 1350 and 1373.

Alternatively, keep the citations and add as a target the descent L_k(λ)⊗_k k̄ ≅ L_{k̄}(λ) for split g (the maximal submodule of M(λ) is the radical of the contravariant form on each weight space, which commutes with field extension).

**Test on the refuting instance** (k=ℚ, sl₂):

- λ_e=−α: e f^{k+1}v=(k+1)(−2−k)f^k v≠0 for all k, so L_e is infinite-dimensional over ℚ.
- λ_s=0: L_s=ℚ, which is finite-dimensional.
- For SL₂ over ℚ, ReductiveGroups §10B gives ∇(ω)=ℚ², which is finite-dimensional.

None of these steps uses `IsAlgClosed`.

## R02 (P3) — the line locators `FiniteDimensional.lean:122` and `Existence.lean:234` point inside the preceding proofs

**Location.** `README.md` line 54: "in TauCeti/Algebra/Lie/HighestWeight/FiniteDimensional.lean:122" and "in TauCeti/Algebra/Lie/HighestWeight/Existence.lean:234".

**Claim.** Every other locator in this contract points at the declaration line: `Integrable.lean:118,154`, `Verma.lean:195` and `FinitelyPresentedSheaf/Basic.lean:48` each print `theorem`, `def` or `abbrev` at the pin. The two new ones do not.

**Witness.** At Tau Ceti 358314d4:

- line 122 of FiniteDimensional.lean is `hv hgen (chi : H → K))`, the last line of the proof of `finiteDimensional_of_isHighestWeightVector_of_isDominantIntegral`, and the `theorem` keyword is at line 126;
- line 234 of Existence.lean is `exact hw.unique_of_isIrreducible hv`, inside a `private theorem`, and the `theorem` keyword is at line 240.

**Repair.** Write `FiniteDimensional.lean:126` and `Existence.lean:240`. Re-running `sed -n` at those two lines at the pin prints the two `theorem` lines.

## Previous findings

- R01 — repaired: "RepresentationTheory/LieHighestWeight Layers 3, 7 and 9 own enveloping algebras, semisimple Verma and simple modules, central characters and reductive decomposition; the classification … is the pair of pinned Tau Ceti theorems" (line 11). No "LieHighestWeight Layer 4" remains. The repair introduced R01 and R02 of this report.
- R02 — repaired: "GroupSchemesOverABase §7.6 constructs the multiplicative Grothendieck–Springer space G̃⊂G×Bor(G); the additive simultaneous resolution g̃⊂F×g of Layer 2 is a different object and is owned here" (line 10).

## Verified sound

**Gate, dependency check, build.**

- The gate, rerun on 5d1cb30, printed `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate at this head also reports `build=0`.
- The dependency check with `--movable` printed `depcheck: 239 roadmaps, 2427 edges, 0 problem(s)`: no UPWARD or CYCLE line. The roadmap is line 258 of the merge order.
- `lake env lean` on `Suggested.lean` exited 0 with no output in 8.3 s. The file is unchanged (62 lines) and declares nothing, so there is nothing to compare by `#check` and nothing for the one-tactic padding probe.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds README.md, Suggested.lean and metadata.toml.

**Pinned declarations checked by elaboration.** The four Tau Ceti theorems the contract names were checked with `#check @…` in one scratch file. To do so, the missing modules were built first with `lake build TauCeti.Algebra.Lie.HighestWeight.FiniteDimensional TauCeti.Algebra.Lie.HighestWeight.Integrable`.

- `finiteDimensional_iff_isDominantIntegral_of_isHighestWeightVector` and `existsUnique_isDominantIntegral_highestWeight_of_finiteDimensional_irreducible` carry `[IsAlgClosed K]`, which is R01.
- The second theorem also carries `[FiniteDimensional K M]` and `[LieModule.IsIrreducible K L M]`, and concludes `∃! lam, IsDominantIntegral b lam ∧ ∃ v, IsHighestWeightVector b lam v`. That is the contract's description of it ("over an algebraically closed such field, … unique dominant integral highest weight").
- `exists_pow_toEnd_eq_zero_of_mem_rootSpace_neg` and `locallyFiniteSubmodule_eq_top_of_isSl2Triple` carry `[IsTriangularizable K H L]` and no `IsAlgClosed`. They take a hypothesis `lam (coroot i) = n` with `n : ℕ` for `i ∈ b.support`, as the unchanged contract text says.

**Cross-roadmap ids touched by the diff, resolved this round.**

- GroupSchemesOverABase at its open head 6b17dff: "### 7.6 The Grothendieck–Springer space", where `G̃ ⊆ G × Bor(G)` is the closed subscheme of pairs (g,B) with g∈B. Its Downstream consumers section names this roadmap's Scope line, "consumes nothing from it". GroupSchemesOverABase is cited in Scope only.
- RepresentationTheory/LieHighestWeight Layers 3, 7 and 9:

  | Copy | Layer 3 | Layer 7 | Layer 9 |
  |---|---|---|---|
  | main eaf17b1 | line 405 | line 931 | line 1432 |
  | open revision beea1d2 (which drops Layer 4) | line 707 | line 1490 | line 2371 |
  | open revision 51ebd8a | line 406 | line 932 | line 1433 |

  The contents match the Scope and contract wording: enveloping algebra, Verma modules and `L(λ)`; centre of `U(L)` and Harish-Chandra; reductive Lie algebras.
- `roadmaps overlaps` reports no id this README cites that an open pull request drops, no id only an open revision defines, and no other open pull request changing this roadmap. `roadmaps resolve` reports no unresolved citation or Lean name.
- ReductiveGroups §§10A–10B on main (lines 1733 and 1759) were read for the R01 repair.

**Seeded sample, where it meets the changed passages (§10.1, §12.1).**

- §12.1: BHS19 lines 1011–1016, printed p. 323. B acts algebraically on L(ww₀·0); P_w is the largest parabolic containing B whose Levi makes ww₀·0 dominant. Lines 1014–1015 say P_w=G exactly when w=w₀, which is the source of the new sentence's "only for w=w₀". Lemma 2.4.8 is at lines 1025–1030, printed p. 324.
- §10.1: ElliottBB:
  - Theorem 1 at line 174: Φ_λ is surjective and its kernel is U·ker χ_λ.
  - Definition 3 at line 227: D-affinity, meaning generation by global sections and vanishing of Hⁱ for i>0.
  - Theorem 3 at line 270 and the route at lines 275–280: tensoring with finite-dimensional G-modules V and their B-filtrations. This confirms that §10.1's route consumes G-modules (ReductiveGroups §§10A–10B), not the pinned Lie-algebra criterion.
  - ElliottBB works over an algebraically closed field (line 44). The README's descent to arbitrary characteristic-zero k is the Conventions' "pass to an algebraic closure and descend", unchanged since the previous report.
- §10.1, BHS19 line 891: O(0) has trivial infinitesimal character.

**Settled item of earlier rounds.** The four gap entries in `design/plan.json` on the board are unchanged: `lie-invariants`, `associated-bundle-descent`, `local-geometric-comparisons` and `derived-bimodule-sheaves`. The README's seven slugs were each found once. This is the state the previous report recorded as settled; it is not re-raised.

**Adversarial table.** The first ten rows are this round's, for the changed statements. The rest are carried from the previous report for statements the diff leaves untouched.

| Statement | Instances | Values each side | Result | Row from |
|---|---|---|---|---|
| Contract, first pinned theorem (line 54) | `#check` at the pin; K=ℚ, sl₂ | binders `[IsAlgClosed K] [H.IsCartanSubalgebra]`, no `IsTriangularizable`; README "over a characteristic-zero field … triangularizably"; `IsAlgClosed ℚ` false (x²+1) | defect, R01 | this round |
| Contract, "needs no algebraic closure" | §10.1 over ℚ, SL₂, ω | pinned theorem not instantiable at K=ℚ; ReductiveGroups §10B `∇(ω)=ℚ²`, dim 2 | defect, R01 | this round |
| Contract, second pinned theorem | `#check` | `[IsAlgClosed K] [FiniteDimensional K M] [IsIrreducible]` ⟹ `∃!` dominant integral highest weight; README says the same | sound | this round |
| Contract, Integrable pair (reread) | `#check` | `[IsTriangularizable K H L]`, `lam(coroot i)=n`, `n:ℕ`; README "splitting Cartan", "λ(α∨)=n∈ℕ" | sound | this round |
| Contract locators | lines 122/126, 234/240; siblings | 122 proof line, 126 `theorem`; 234 proof line, 240 `theorem`; Integrable 118/154, Verma 195, Basic 48 all declaration lines | defect, R02 | this round |
| §12.1 "−wρ−ρ dominant only for w₀" | SL₂; SL₃ all six w; torus | SL₂ −2, 0; SL₃ (⟨λ,α₁∨⟩,⟨λ,α₂∨⟩): e (−2,−2), s₁ (0,−3), s₂ (−3,0), s₁s₂ (1,−2), s₂s₁ (−2,1), w₀ (0,0); torus W={e}=w₀, λ=0 | sound | this round |
| §12.1 string, infinite dimension | sl₂, λ=−2, k=0,1 | `efv=hv=−2v=1·(−2)v`; `ef²v=hfv+f(efv)=−4fv−2fv=−6fv=2·(−3)fv` | sound over any char-0 k | this round |
| Scope line 10, GroupSchemesOverABase §7.6 | SL₂ | its §7.6 Check: regular semisimple x lies in 2=\|W\| Borels; here `q⁻¹(diag(1,−1))` is 2 flags in `g̃ ⊂ F×g`: multiplicative versus additive | sound | this round |
| Scope line 11, contract line 144 | three copies of LieHighestWeight | Layers 3/7/9 at 405/931/1432, 707/1490/2371, 406/932/1433 | sound | this round |
| §10.1 *Needs* without the pinned pair | PGL₂ 2ω; SL₂ ω | §10B: `∇(2ω)` dim 3, `∇(ω)` dim 2, as §10.1's Checks | sound | this round |
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

**Ownership.** The diff adds no object. It moves one citation from a roadmap layer to pinned declarations and corrects one id. The ownership search of the previous report stands, and the vocabulary neighbours are unchanged: #1809, #1224, #1829, #1332 and #1808.

## Not verifiable

- G86 and KT84 are settled as uncertified and cited by locator in §11.1. Hum08 §8.4 and KL80 are paywalled and cited by bibliographic data in §11.3. None of these is touched by the diff.

## Source issues

- **Error** in BHS19 at Lemma 2.4.8 and Remark 2.4.9, printed p. 324: the source says the simple characteristic cycle is invariant when P_w translates the first flag on the left; it should say the cycle is saturated along the fibres of F → G/P_w on the first flag (for SL₂, w = e, a unipotent of B moves (ke₂, ke₂, 0) off Z_e); affects a stated result.
