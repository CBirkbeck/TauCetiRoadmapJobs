# FIX-RT-QuasicoherentSheavesOnPrestacks~2

Repairs of red-team round 2 (passes a and b) on `packages/QuasicoherentSheavesOnPrestacks/`. Files changed: `README.md`, `sources.toml`. `Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged (no finding touches the Lean statement, and no new supplier gap is needed).

## RT-QuasicoherentSheavesOnPrestacks~2a/F01 (P2) — applied

Old: 3.1 took the (hyper)sheafification on `T^op` from EnhancedDerivedSheaves E2.7 in every context. New: the sheafification comes from InfinityTopoi §§8.2.1, 8.3.1 (HTT Definition 6.2.2.6, Proposition 6.2.2.7, PDF p. 597), and hypersheafification from HypercompletenessAndCoherence §1.2.1. E2.7 is kept only for `CRing^op` (the classical context, and 2.5's `L_fppf`). There is a new 3.1 Check showing `AnRing^op` is not ordinary.

Evidence. EnhancedDerivedSheaves on main, E2.7: `spaceSheaves` is stated "for a small site", and that roadmap's sites are Mathlib sites (`CategoryTheory.GrothendieckTopology` in its Mathlib contract). In `AnRing`, `Map(ℤ[x], 𝔽_p ⊗ᴸ_ℤ 𝔽_p)` is the underlying space of `𝔽_p ⊗ᴸ_ℤ 𝔽_p`, with `π₁ = 𝔽_p`, so `AnRing^op` is not the nerve of a category. The open head of InfinityTopoi (InfinityCategoryTheory family) states §8.2.1 (sheaves as S-local presheaves) and §8.3.1 (a topological localization, hence an ∞-topos) for any small ∞-category with a topology. The HTT locators were read at HTT line 27072–27079 (page marker 597).

Same pattern repaired elsewhere:
- `L` left exact (3.1 API) now cites §8.3.1.
- *Needs* of 3.1 now carry InfinityTopoi §§8.2.1, 8.3.1, and its E2.7 entry is limited to the classical context. In the *Needs* of 3.2, 3.3 and 3.4, the E2.7 entry is replaced by 3.1 (hypercomplete fpqc sheaves) and HypercompletenessAndCoherence §1.2.1.
- The Scope list, the InfinityTopoi contract bullet, the E2.6–E2.7 contract bullet, Layer 3 Dependencies and the HTT locator in `sources.toml` are updated.

2.5's `L_fppf` on the ordinary `CRing^op` keeps E2.7. I kept the convention that `L` names both the sheafification and the hypersheafification, because 6.2, 7.1 and 7.4 use `L` for the latter.

## RT-QuasicoherentSheavesOnPrestacks~2a/F02 (P2) — applied

Old: 8.4 read two fibres off SchemeAndStackFoundations §1.16 and named no invertible object for 8.3(b). New: 7.4 gains two API facts with routes and Checks:
- `[X/G]^♮ ×_{(BG)^♮} Spec R ≃ (contractedProduct G_R P X_R)^♮`;
- `(BH)^♮ ≃ [(G/H)/G]^♮` over `(BG)^♮`, with linearized modules giving invertible objects.

8.4 uses both, with the family `{O(1)}`.

Evidence. SchemeAndStackFoundations README on main: §1.16 states `contractedProduct`, `contractedProduct_trivial`, `contractedProduct_baseChange`, `contractedProduct_isAlgebraicSpace` and `pushforwardTorsor`. §1.21 states `actionQuotient.torsorEquiv` and `quotientStack.isCartesian`. Neither states a fibre of `[X/G] → BG` or of `BH → BG`. BZFN line 1204–1208 (proof of Corollary 3.22, p. 24) uses both fibres without proof, and this is the locator given.

Change from the proposed repair: change of group assumes that `G/H` is represented by a k-scheme, so that `[(G/H)/G]` is a 7.4 quotient. In 8.4 this holds by gap:chevalley-quasiprojective-quotient.

Ownership: `roadmaps grep` over main and the open heads (reduction of structure group, `BH → BG`, `[(G/H)/G]`, fibres of `[X/G] → BG`) finds no algebro-geometric owner. AlgebraicModuliForArithmeticGeometry (main) mentions `BH → BG` only for finite constant groups, in Checks about gerbes. So this roadmap is the first consumer and owns the two facts.

Pattern: the contract bullets for §1.16 and §1.21, the *Needs* of 7.4 and 8.4, and Layer 7 Dependencies are updated. The 8.4 Check with `P = Spec ℚ(i)` is unchanged and agrees with the new fibre statement.

## RT-QuasicoherentSheavesOnPrestacks~2a/F03 (P3) — applied

Old: 8.1's route took "compact ⇒ perfect" from Stacks 09M1. New route, from suppliers:
- `O` is compact (5.4(a)), so dualizable objects are compact;
- `perfect_generator` gives a perfect generator P;
- `Ind(C₀) ≃ QCoh(h_X)` (3.4(b), `adjointFunctorTheorem`), so the compact objects are `C₀ ⊆ Perf` (`indCompactComparison`).

09M1 stays as a locator; the `⨿_ℕ Spec ℤ` Check names the failing step.

Evidence. SchemeAndStackFoundations §2.18 on main states `perfect_generator` (Stacks 36.15) and no statement that compact objects are perfect. 09M1 occurs in no supplier.

Recomputed:
- `Spec A`: P = A, and `C₀` is the perfect modules (1.4).
- `ℙ¹_k`: P = `O ⊕ O(−1)`.
- `⨿_ℕ Spec ℤ`: `q_*` is the product, `q_*(⊕_i O_i) = ∏ ℤ ≠ ⊕ ℤ`, so the first step fails, as the Check says.

## RT-QuasicoherentSheavesOnPrestacks~2a/F04, RT-QuasicoherentSheavesOnPrestacks~2b/F01 (P3) — applied differently

Old: 6.2(b) required an fpqc sheaf, yet was applied to the fppf sheaves `Y^♮` and `[X/G]^♮`. New (pass b's form):
- 6.2(b) holds for every prestack with affine diagonal and a faithfully flat `p : Spec A → X`;
- the `Y^♮` sentence states its hypotheses;
- 7.4(b) cites 6.2(a), and 7.4(d) 6.2(b);
- a profinite Galois Check is added to 7.4.

Why not pass a's 6.2(c). Its "transfer" clause is correct, but it adds a statement (`L X` geometric) that no route needs. The route of 6.2(b) never uses the sheaf condition:
- 3.3(c) holds for every prestack;
- the hypothesis of (a) is on the hypersheafification;
- connectivity is fpqc-local (6.1).

8.4's by-hand reduction for `BGL_n` is correct and stays.

Witness verified:
- G is the profinite constant group of `Gal(ℚ̄/ℚ)`, and `ℚ̄ ⊗_ℚ ℚ̄ ≅ ℚ̄ ⊗_ℚ O(G)`.
- A nonzero finitely generated ℚ-algebra has a residue field finite over ℚ (Zariski's lemma), which receives no map from ℚ̄. So `Spec ℚ̄` is trivial over no fppf cover, and its descent datum along `ℚ → ℚ̄` is not effective in `(BG)^♮`.
- GR-I line 7883–7888 (Lemma 2.4.5) asks for a right complete t-structure compatible with filtered colimits. Both now come from 6.2(b).

## RT-QuasicoherentSheavesOnPrestacks~2b/F02 (P3) — applied

Old: 2.3 listed presentability among the imports from PrismaticCohomologyPartII §4.0. New: presentability is not imported. §4.0 asserts it only in a larger universe, while 2.3 states u-presentability for u-small colimits of affines in every context.

Evidence. PrismaticCohomologyPartII at its open head, §4.0, first paragraph: "presentability is in a larger universe …". None of `limitOfColimit`, `isEquiv_iff_eval` or `homotopyCategory_spec` states presentability. The Conventions witness shows that `D∞(ℤ)` is u-presentable but not presentable in the universe u+1.

Same pattern repaired elsewhere: Scope's PrismaticCohomologyPartII bullet ("the classical cases of 2.2–2.3 … are these imports") and Scope's Layer 2 bullet now except presentability.

## RT-QuasicoherentSheavesOnPrestacks~2b/F03 (P3) — applied differently

Old: 8.6 identified the homotopy category through HA Remark 7.1.1.16, about module spectra. New route:
- `D∞(Rep k Γ)` (E1.3) maps to `Fun(BΓ, D∞(k))` by the localization universal property (E0.3);
- `barrBeckLurie` makes this an equivalence;
- its homotopy category is `DerivedCategory (Rep k Γ)`.

The HA remark stays as a remark; a new Check covers `S₃` over `𝔽₃`.

Evidence. HA line 46277–46283: Remark 7.1.1.16 concerns `LMod_R` in spectra for a discrete R. The Scope section of this README says that no supplier compares `Mod_A(D(ℤ))` with module spectra. EnhancedDerivedSheaves on main, E5:spectra-comparison: `moduleSpectra_equiv_derived` is stated for commutative R, and `𝔽₃[S₃]` is not commutative. E1.3 on main states `enhancedDerived` "for a Grothendieck abelian category A", with homotopy category `DerivedCategory A`.

Differences from the proposed repair:
1. `Rep.equivalenceModuleMonoidAlgebra` is kept rather than dropped. The route needs `Rep k Γ` to be Grothendieck abelian, which I take from `CategoryTheory.IsGrothendieckAbelian.of_equivalence` (Mathlib/CategoryTheory/Abelian/GrothendieckCategory/Basic.lean:81) and the `ModuleCat` instance (Mathlib/Algebra/Category/ModuleCat/AB.lean:53). Both were checked with `#check`.
2. The comparison functor comes from the localization universal property (E0.3), not from `derivedFamily`, since no family over a base is being localized here.

## Checks run

- **Elaboration.** `lake env lean` on `packages/QuasicoherentSheavesOnPrestacks/Suggested.lean`, from the content checkout. The only output is `Suggested.lean:79:8: warning: declaration uses 'sorry'`. The file is unchanged.
- **`#check @name`.** In a scratch copy of the file, `#check @TauCetiRoadmap.QuasicoherentSheavesOnPrestacks.not_preservesCoproducts_trivial` elaborates to:
  - binders `(k : Type u) [Field k] (Γ : Type u) [Group Γ] [Finite Γ] (p : ℕ) [CharP k p]`;
  - hypothesis `p ∣ Nat.card Γ`;
  - `[HasDerivedCategory.{w} (Rep k Γ)]`;
  - conclusion `¬ ∀ J : Type w, PreservesColimitsOfShape (Discrete J) (preadditiveCoyoneda.obj (op ((singleFunctor _ 0).obj (Rep.trivial k Γ k))))`.

  This is binder for binder README 8.6, so nothing changed. `#check` also confirmed the two Mathlib names newly cited in the README: `IsGrothendieckAbelian.of_equivalence` and `Rep.equivalenceModuleMonoidAlgebra`.
- **Dependency check.** Full output:

```
depcheck: 253 roadmaps, 2400 edges, 0 problem(s)
```

  No UPWARD, CYCLE or `moved:` line.
- **Citation resolver** on the edited README: no cross-roadmap citation and no Lean name found nowhere.
- **Gate failures listed in the brief:** none.

## Adversarial pass on the new and changed statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 3.1 sheafification (InfinityTopoi §§8.2.1, 8.3.1) | `CRing`; `AnRing` at `B = 𝔽_p ⊗ᴸ 𝔽_p`; zero ring | `Map(ℤ[x], B)` has `π₁ = 𝔽_p`, while `Hom_{hT}(ℤ[x], B) = π₀B = 𝔽_p` is discrete; the empty sieve covers 0, so the sheaf value at 0 is a point | holds; E2.7 applies to `CRing` only | added the Check |
| 6.2(b) without the sheaf condition | `(BG)^♮` for profinite Galois G; constant `B(ℤ/2)`; sieve Y of `{ℤ[1/2], ℤ[1/3]}`; `Spec A` with p = id | Čech nerve `Spec O(G)^{⊗n}` with flat transitions, heart = `O(G)`-comodules; `B(ℤ/2)`: diagonal fibre at `ℤ × ℤ` has 2 points, not 4, so the hypothesis fails; Y: `Y(ℤ[1/2] × ℤ[1/3]) = ∅`, so no faithfully flat p exists; `Mod_A` | holds wherever the hypotheses hold | stated |
| 7.4(b) via 6.2(a) | X a k-scheme, G flat affine | hypersheafification of `[X/G]^♮` = colimit over Δ^op of colimits over u-small posets of affine opens (route of 3.4(a)) | holds | stated in the route |
| 7.4(d) inputs | `G = ℤ/p` over `𝔽_p`, X a point; doubled plane | f flat affine with fppf lifts gives 6.2(b): right complete and filtered colimits; doubled plane: diagonal not affine, (d) not asserted | holds | route amended |
| Fibres over the classifying stack | P trivial; `X = Spec k`; `X = ℤ/2` (translation) with `P = Spec ℚ(i)`; R = 0; `X = ∅` | `X_R`; `Spec R`; fibre P with no ℚ-point, against 2 points for the untwisted `X_R`; `Spec 0 = h_∅` on both sides; ∅ | holds | new API fact, 3 Checks |
| Change of group | H = 1; H = G; `μ_n ⊂ G_m` over ℤ; Borel `B ⊂ GL₂` | fibre P (as 7.1's `[G/G] ≃ L S`); identity; `G_m/μ_n ≅ G_m`, `u = t^n`, s acts by `s^n`, and the character t restricts to the tautological character of `μ_n`, the trivial linearization to O; `P ×^{GL₂} ℙ¹ = ℙ(E)` | holds; `G/H` must be a scheme for 7.4 to apply | hypothesis added |
| 8.4 use | `G ⊂ GL_n` closed, P the frame bundle of E | twist Zariski-locally `GL_n/G × U_i`, flat and quasi-projective over R; `O(1)` invertible via 7.4(b) and 6.3 | holds | rewritten |
| 8.1 route | `Spec A`; `ℙ¹_k`; ∅; `⨿_ℕ Spec ℤ` | `C₀ = Perf(A)`; `P = O ⊕ O(−1)`; `QCoh = 0`, P = 0; `q_*(⊕O_i) = ∏ℤ ≠ ⊕ℤ` | holds; non-quasi-compact case excluded | Check amended |
| 8.6 homotopy category | Γ = 1; Γ = ℤ; `S₃` over `𝔽₃` | `D∞(k)` on both sides; monad `k[t^{±1}] ⊗ −` with no finiteness used; monad `𝔽₃[S₃] ⊗ −`, `Hⁱ(S₃; Coind 𝔽₃) = 𝔽₃` on both sides | holds | Check added |
| 2.3 presentability | `Spec ℤ`; `⨿_K Spec ℤ` with K not u-small | `D∞(ℤ)` u-presentable but not (u+1)-presentable; `∏_K D∞(ℤ)` has no K-fold coproduct of ℤ | holds; not §4.0's statement | attribution removed |

## For the maintainer

- **No renamed ids or names.** No id, section number or Lean name that other roadmaps cite changed. The new 7.4 API facts are prose, with no Lean names.
- **InfinityTopoi was already a supplier.** It (in the InfinityCategoryTheory family, an open pull request adding new roadmap folders) is now also cited for §§8.2.1 and 8.3.1, checked at its head. The family is not in the merge-order file, and the dependency check reports no problem for it.
- **Same pattern, left unchanged.** Two other routes take steps from Stacks with the argument named rather than from a supplier: 8.3(b)'s generation step, from the proof of Stacks 0BQR applied to ample families, and 5.2's derived-limit step, from Stacks 08D3 and 0A0J. I left both alone: neither review raised them, and they describe a method for a statement proved here rather than citing its conclusion. If a reviewer counts them as unsupplied inputs, the natural repair is a supplier gap against SchemeAndStackFoundations §2.18.
- **Ownership against open pull requests** was checked with `roadmaps grep` and `roadmaps show` at their heads (InfinityTopoi, PrismaticCohomologyPartII), and on main for SchemeAndStackFoundations, EnhancedDerivedSheaves and AlgebraicModuliForArithmeticGeometry.
- **Extra Stacks reading.** I fetched the Stacks chapters *Examples of Stacks* and *Algebraic Stacks* through the sources service while looking for a locator for the fibre statements. Neither states them, so they are not cited and not recorded in `sources.toml`.
- **No suspicious instructions** were found in the review texts.
