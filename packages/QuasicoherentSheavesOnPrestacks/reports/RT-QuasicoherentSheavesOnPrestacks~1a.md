<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18060#issuecomment-6908788711 -->
Red team round 1 pass a (claude) of bfb5a71

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) 8.5 attributes `QCoh(BΓ × Spec k) = Fun(BΓ, Mod_k)` to 3.3 and its *Needs* line omits 2.3 and 7.1

   Location: `packages/QuasicoherentSheavesOnPrestacks/README.md:881`, "regarded in the heart of `QCoh(BΓ × Spec k) = Fun(BΓ, Mod_k)` (3.3)", and `README.md:894`, "*Needs:* 2.2; 3.3; 6.3; 8.2; …".

   Claim: the identification of `QCoh` of the constant prestack is 3.3's, and 8.5 needs only 2.2, 3.3, 6.3 and 8.2 of this roadmap.

   Witness: the identification is the colimit-to-limit property of 2.3 applied to `BΓ` (`README.md:382`, Check of 2.3; `README.md:430`); 8.6 cites the same identity as "(2.3)" (`README.md:903`, `:915`). 3.3 only repeats it in a Check for the stack of torsors (`README.md:502`). The statement's `BG` for `G = ℤ/p` is 7.1's `[S/G]` (`README.md:723`), and 7.1 is not on the line.

   Repair. At `README.md:881` replace "(3.3)" by "(2.3)". Replace the start of the *Needs* line at `README.md:894` by:

   `*Needs:* 2.2; 2.3 (QCoh(BΓ × Spec k) ≃ Fun(BΓ, Mod_k)); 3.3 (the same QCoh on BG, 3.3(a)); 6.3; 7.1 (BG); 8.2; EnhancedDerivedSheaves …` (the rest unchanged).

   Tested on the refuting instance: for `Γ = ℤ/2`, `k = 𝔽₂`, 2.3 gives `Fun(B(ℤ/2), Mod_𝔽₂)`, 7.1 gives `BG = L(BΓ × Spec 𝔽₂)`, and 3.3(a) gives the same `QCoh`; the layer order is unchanged (Layer 8 already depends on Layers 1–7).

2. **F02** (P3) 8.5 restates HNR Theorem 1.1 without its hypotheses and for a category the roadmap excludes

   Location: `README.md:877`, "Compact generation itself does not fail here. It fails for poorly stabilized stacks, those with a point of positive characteristic whose stabilizer has a reduced identity component that is not semi-abelian".

   Claim: compact generation (of `QCoh`, the subject of the sentence) fails for every poorly stabilized stack.

   Witness: HNR line 45–47 (Theorem 1.1, p. 1) assumes the stack quasi-compact and quasi-separated and concludes for the lisse-étale `D_qc(X)`; HNR line 436–439 (p. 9) takes a geometric point. The Scope section (`README.md:49`) excludes that `D_qc` and its compact-generation theorems, and no target here proves the statement for `QCoh`.

   Repair: replace the two sentences from "Compact generation itself does not fail here." to "…whose stabilizer has trivial identity component." by:

   "Compact generation itself does not fail here (last Check). The known failures are of another kind: for a quasi-compact, quasi-separated algebraic stack that is poorly stabilized, meaning that it has a geometric point of positive characteristic whose stabilizer has a reduced identity component that is not semi-abelian, the lisse-étale `D_qc` is not compactly generated; `BG_a` in characteristic p is an example (HNR Theorem 1.1, pp. 1–2, and §4, p. 9). That statement concerns `D_qc`, which this roadmap does not treat (Scope), and is recorded for orientation only. `B(ℤ/p)` is not poorly stabilized, its stabilizer having trivial identity component."

   Tested: for `B(ℤ/p)` over `𝔽_p` the stabilizer `ℤ/p` has trivial identity component, a torus of rank 0, so it is not poor, consistent with the last Check of 8.5 (`k[Γ]` is a compact generator).

3. **F03** (P3) 2.5 applies a pinned lemma with two hypotheses that are not instances for `fppfPrecoverage` at the pin, and names only three of its four hypotheses

   Location: `README.md:410`, "(`CategoryTheory.Precoverage.mem_toGrothendieck_iff_of_isStableUnderComposition`, that precoverage being stable under composition and base change and containing the isomorphisms)".

   Claim: the lemma applies to `AlgebraicGeometry.Scheme.fppfPrecoverage` on these three grounds.

   Witness: Mathlib/CategoryTheory/Sites/PrecoverageToGrothendieck.lean:166–167 asks `[IsStableUnderComposition J] [IsStableUnderBaseChange J] [J.HasPullbacks] [HasIsos J]`. Mathlib/AlgebraicGeometry/Sites/Fpqc.lean:41–43 defines `fppfPrecoverage` as a `def` deriving only the first two (`fpqcPrecoverage`, line 61–64, also derives `HasIsos`).

   Repair: replace the parenthesis by:

   "(`CategoryTheory.Precoverage.mem_toGrothendieck_iff_of_isStableUnderComposition`. Its four hypotheses hold. Stability under composition and under base change are the two instances derived with `fppfPrecoverage`. It has pullbacks and contains the isomorphisms because it is `Scheme.precoverage` of the property "flat and locally of finite presentation", for which Mathlib/AlgebraicGeometry/Sites/MorphismProperty.lean:104 and :107 give both; these two are not instances for `fppfPrecoverage` at the pin and are obtained by unfolding its definition)".

   The contract bullet at `README.md:98` already lists all four hypotheses and needs no change. Tested on the instance: an isomorphism of schemes is flat, locally of finite presentation and surjective, and the family of base changes of a covering family exists in schemes; so the mathematical claim stands and only the pin statement changes.

Three findings, all P3. `packages/QuasicoherentSheavesOnPrestacks/README.md` (941 lines) and `packages/QuasicoherentSheavesOnPrestacks/Suggested.lean` (87 lines) were read in full. No Lean was run (the pass is read-only): the elaborated signature was taken from the worker's `signatures.md`, and every statement about a pinned declaration below comes from reading the pinned source.

## The adversarial pass

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions, universes | K not u-small; `Mod_ℤ` | `π₀ Map(⊕_K ℤ, ℚ/ℤ) = ∏_K ℚ/ℤ`, not u-small, so no such coproduct in `D∞(ℤ)`; `∏_K D∞(ℤ)` is a (u+1)-small limit | holds | none |
| Conventions, indexing | `𝔽_p ⊗ᴸ_ℤ 𝔽_p`; `∏_{i≥0} ℤ[−i]`; `⊕ ℤ[i]` | `π₀ = π₁ = 𝔽_p`; `π_{−i} = ℤ`, 0-truncated, not bounded below; connective, in no `≤n` | holds | none |
| Conventions, flatness and covers | `ℤ → ℤ[x]`, `ℤ → ℚ`, `ℤ → 𝔽_p`, `𝔽_p → 𝔽_p ⊗ᴸ 𝔽_p`; empty family; zero ring | free; `ℚ ⊗ 𝔽_p = 0`; `Tor₁ = 𝔽_p`; `π₁` 0 versus `𝔽_p`; `A → 0` faithfully flat iff `A = 0` | holds | none |
| Conventions, Beck–Chevalley | `Spec 𝔽_p → Spec ℤ ← Spec 𝔽_p`, `F = 𝔽_p` | classical: source `𝔽_p ⊗ᴸ 𝔽_p` (`π₁ = 𝔽_p`), target `𝔽_p`; animated: both `𝔽_p ⊗ᴸ 𝔽_p` | direction `g^* f_* → f′_* g′^*` pinned | none |
| 1.1 | `𝔽_p ⊗_ℤ 𝔽_p` in the three contexts; `ℤ × ℤ`; free object on `ℤ[0]`; zero ring | `π₁ = 𝔽_p` derived, 0 classical; product `π₀ = ℤ²`, coproduct `ℤ`; `H₁(BΣ₂; ℤ) = ℤ/2` in `Sym²`; 0 final | holds | none |
| 1.2 | `ℤ → 𝔽_p` twice, `N = 𝔽_p`; `R → R[t]`, `M = R[1]`; `A × B`; 0 | both sides `𝔽_p ⊗ᴸ 𝔽_p`; ordinary pushout gives `𝔽_p` on the right; `R[t][1]` both sides; idempotents split; `Mod_0 = 0` | holds | none |
| 1.3 | `𝔽_p ⊗ᴸ 𝔽_p`; `ℤ → ℤ[1/p] × ℤ_p`; `ℤ → ℚ`; `ℤ → 𝔽_p` | heart `ModuleCat 𝔽_p`; every prime lies under one; `ℚ ⊗ ℤ/p = 0`; `𝔽_p ↦` non-discrete | holds | none |
| 1.4 | `ℤ ⊕ ℤ[3]`; `ℚ`; `k` over `k[ε]/(ε²)`; `k` over `k[x₁, …]`; `ℤ/p`; almost-compact test `F = ⊕_{i≥0} ℤ[−i]` | dual `ℤ ⊕ ℤ[−3]`; not compact; `Tor_i = k` all i; maximal ideal not finitely generated; dual `ℤ/p[−1]`; `π₀ Map(F, N) = ∏ π_{−i}N` not finitary | holds | none |
| 1.5 adjointable limits | empty diagram; `K = Δ¹` with the ordinary square of `ℤ → 𝔽_p` | terminal; mate `𝔽_p ⊗ᴸ_ℤ N → N` not an equivalence, so the projection square fails | hypothesis needed, as stated | none |
| 1.5 dualizable, invertible | `(ℤ, ℚ)`, `(ℤ, ℤ[1])`, `(ℤ, ℤ²)` in `D∞(ℤ)²` | not dualizable; invertible; evaluation rank 4 → 1 | holds | none |
| 1.5 descent criterion | identity augmentation; `ℤ → 𝔽_p` | comonadic trivially; not conservative (`ℚ ↦ 0`) | holds; HA 4.7.5.3 dualized | none |
| 2.1 | `Spec 0`, `∅`, `Spec ℤ`; fibre product of `𝔽_p` over ℤ | `Spec 0(0) = pt`, `∅(0) = ∅`; final; `𝔽_p` versus `𝔽_p ⊗ᴸ 𝔽_p` | holds | none |
| 2.2 | `∅`; `Spec A ⊔ Spec B`; `B(ℤ/2) × Spec 𝔽₂` | zero category; `Mod_A × Mod_B`; `π₀ Map(O, O[1]) = H¹(ℤ/2; 𝔽₂) = 𝔽₂`, each evaluation in `π₋₁A = 0` | holds | none |
| 2.3 | same class; `ℤ/p ⊗ ℤ/p`; `Ext¹_ℤ(ℤ/p, ℤ/p)` | nonzero map with zero evaluations, not an equivalence; `π₁ = ℤ/p`; `ℤ/p` | iff for equivalences holds, not for vanishing, as stated | none |
| 2.4 | `Y = Spec(𝔽_p ⊗ᴸ 𝔽_p)`; `ι_!` of the classical fibre product | `ι^*Y = Spec 𝔽_p`, `QCoh` differs; `ι_!` gives `Spec 𝔽_p`, images give `Spec(𝔽_p ⊗ᴸ 𝔽_p)` | holds | none |
| 2.5 | `B(ℤ/2)` at ℝ and `ℝ × ℝ`; `ℤ → ℤ[1/p] × ℤ_p`; `{ℤ[1/n]}_{n≥2}` | two components, `π₁ = ℤ/2`, `(ℤ/2)²`; `ℤ_p` uncountable so not finitely presented; refined by `n = 2, 3`, not by `n = 2` | holds | R03 |
| 3.1 | empty family; `Spec 𝔽_p ⊔ Spec ℤ[1/p] → Spec ℤ`; constant `𝔽_p` cosemisimplicial ring | covers 0 only; lifts force `𝔽_p ⊗ ∏R_i = 0`, not a cover; `L₁` is `𝔽_p` in `CRing`, `𝔽_p ⊗ᴸ 𝔽_p` in `AnRing` | holds | none |
| 3.2 | identity; `(f, g) = A`; `ℤ → 𝔽_p`; `ℤ → ℤ[1/2] × ℤ[1/3]`; `ℤ → 𝔽_p × ℤ[1/p]` on `𝔸¹` | `Mod_A`; fibre product; `ℚ ↦ 0`; fibre `ℤ[1/6][−1]`, `Ext²(ℤ[1/6], ℤ) = 0`, index 2; equalizer contains `(1, 0)` | holds; steps (2)–(5) checked: truncated values are (n+1)-categories, Ω commutes with flat transitions only | none |
| 3.3 | `∅ → Spec 0`; `Spec 𝔽_p → Spec ℤ`; constant `BΓ` versus torsors | both `QCoh` zero; totalization kills ℚ; `Γ(R)` constant on a finite Zariski cover | holds | none |
| 3.4 | `ℙ¹`; `⨿_ℕ Spec ℤ`; empty scheme; plane with doubled origin, `R = k[x, y, a, b]/(ax + by − 1)` | `H¹(O(−2)) = k·t⁻¹`; `∏_ℕ D∞(ℤ)`; `h_∅ = Spec 0`; fibre two points (U, U′ incomparable) | holds | none |
| 4.1 | `𝔸² ∖ 0 → 𝔸²`; `BG → Spec k`; sieve of `{ℤ[1/2], ℤ[1/3]}` | not affine; `π₁ = G(O(G)) ∋ id`; `Y(ℤ[1/2] × ℤ[1/3]) = ∅` although an affine gives a point | sheaf hypothesis needed, as stated | none |
| 4.2 | identity; `R → R[t]`; classical `Spec 𝔽_p → Spec ℤ` | identities; `R[t]` free of infinite rank; pointwise value `𝔽_p` versus `𝔽_p ⊗ᴸ 𝔽_p` | flatness needed in `CRing`, as stated | none |
| 5.1–5.3 | `ℤ/2` on `Spec ℤ`; `ℙ¹`; `⨿_ℕ ℙ¹`; `j_! O_U` on a DVR | cohomology in degrees 0, −1 after `⊗ᴸ`; `k` on both sides; product; not quasi-coherent | holds for every scheme | none |
| 5.4 | `ℙ¹_k → Spec k`; `ℙ¹_ℤ`, `g : Spec ℚ → Spec ℤ` | `k[−1]`; `ℚ[−1]` | holds | none |
| 6.1 | truncatedness; `⊕_ℕ O`; `BΓ × Spec k` | not base-change stable (`𝔽_p`); flat, not perfect; perfect iff underlying module is | holds; SAG 2.8.4.2 lists (1), (6), (9), (10), local freeness through 1.4 | none |
| 6.2 | `Spec(𝔽_p ⊗ᴸ 𝔽_p)`; `BG_m`; `B(ℤ/2) × Spec 𝔽₂`; plane with doubled origin | heart `ModuleCat 𝔽_p`; graded groups; `k[Γ]`-modules, `Ext¹ = 𝔽₂`; diagonal fibre `𝔸² ∖ 0`, quasi-affine, not affine | holds | none |
| 6.3 | `ℤ ⊕ ℤ[3]`, ℚ; `O[1]`; `O ⊕ O`; `ℤ/p` | perfect = dualizable; invertible; not invertible; not locally free | holds | none |
| 6.4 | `k` on `k[ε]/(ε²)`; `⊕_ℕ O`; affine case of the filtered-colimit criterion | almost perfect, not perfect; `π₀` not finitely generated; `τ_{≤n}`-compact objects of `D(ℤ)_{≤n}` are bounded below | holds; SAG 9.1.5.1 is for quasi-geometric stacks | none |
| 7.1 | trivial group on `∅`; `ℤ/2` constant; `O(G) = ℤ × 𝔽_ℓ`; `Spec 𝔽₂` as absolute group | `[∅/1] = Spec 0`; `Y(ℤ × ℤ)`: 2 points versus 4; idempotents with `ℓe = 0` closed under `e + e′ − 2ee′`, not flat; `Hom(𝔽₂, ℤ) = ∅` | holds | none |
| 7.2 | trivial group; translation; `G_m`; `ℤ/2` over `𝔽₂` | `QCoh(X)`; `QCoh(S)`; comodules over `ℤ[t^{±1}]`; `H¹ = 𝔽₂` | holds | none |
| 7.3 | trivial group; ℤ on `Spec C` trivially; `σ(x) = 2x` | `QCoh(X)`; `H¹(ℤ; C) = C`; identity not σ-semilinear (`x` versus `2x`) | holds; `homotopyFixedPoints` of the supplier is for finite groups, as the text says | none |
| 7.4 | trivial group; `G_m`; `ℤ/p` over `𝔽_p`; `G_a` over `𝔽_p` | 5.3; graded groups; `Ext^i = 𝔽_p`; `D(heart)` not left complete (SAG Warning 10.4.6.9) | holds; (d) limited to `+`, as SAG 10.4.6.8 requires a completion | none |
| 8.1 | `Spec A`; `ℙ¹`; `⨿_ℕ Spec ℤ` | generator O; `O ⊕ O(−1)`; `Hom(O, ⊕O_i) = ∏ℤ ≠ ⊕ℤ` | quasi-compactness needed, as stated | none |
| 8.2 | `Spec A`; `BG_m`; `⨿_ℕ Spec ℤ` as scheme and as prestack; `Spec 𝔽₂` | perfect; weight-n part preserves colimits; affine diagonal (`Spec(Re)`) versus fibre `∅`; `Map(O, 0 ⊕ 0)` a point versus two | holds | none |
| 8.3 | `A = k[ε]/(ε²)` diagonal; line with doubled origin | `Ω¹_{A/k} = k·dε` or `A·dε`, nonzero, so not flat; `{L₁, L₋₁}` ample family (loci U′ and U), no ample member | holds; route of (b) checked against Stacks 0BQR | none |
| 8.4 | `B(ℤ/p)` over ℚ; `K(ℤ, 2) × Spec ℚ`; `BG_m` with `M = O[1]`; `P = Spec ℚ(i)` twists | `Hⁱ = 0`; `H² = ℚ` with semisimple heart; `Map = K(ℚ, 1)`; `P ×^G G = Spec ℚ(i)`; invariants `ℚe₁ ⊕ ℚ·ie₂` | holds; `lim¹` step: `π₀RΓ(τ_{≤m}M)` constant | none |
| 8.5 | trivial Γ; `ℤ/p` over `𝔽_p`; `S₃` over `𝔽₃`; ℚ | compact; `Hⁱ = 𝔽_p`; `H¹ = H² = 0` trivial coefficients (C₂ acts by −1 on `H²(C₃)`), coinduced V of dimension 2 has `Hⁱ = 𝔽₃`; `Hⁱ = 0` | holds | R01, R02 |
| 8.6 and `not_preservesCoproducts_trivial` | `p = 0`; `p = 1`; `Γ = 1`; `Γ = ℤ/2`, `k = 𝔽₂`; `Γ = S₃`, `k = 𝔽₃` and `𝔽₂`; `Γ = ℤ` without `Finite`; `w < u`; `w > u` | `0 ∣ card Γ` impossible (`card ≥ 1`); `CharP k 1` impossible; `p ∤ 1`; `Hom(k, ⊕k[i]) = ∏𝔽₂ ≠ ⊕𝔽₂`; `Hⁱ(S₃; V) = 𝔽₃`, resp. `𝔽₂` with `C = ⟨(12)⟩`; `Nat.card ℤ = 0` and k perfect over `k[t^{±1}]`; `HasDerivedCategory.{w}` unsatisfiable (`End(k^{(I)})` not w-small); `J = ULift ℕ`, the coproduct is the complex with V in degrees ≤ 0, also the product | true as typed; README and Lean agree (`k`, `Γ` in one universe, `[Finite Γ]`, no `Fact p.Prime`) | none |

## Verified sound

- **Declarations read: 1.** `not_preservesCoproducts_trivial`: elaborated type (worker's `signatures.md`) compared with README 8.6, binder by binder; no section variable exists, so none can be lost. One `import Mathlib`, no `set_option`, no sorry'd data, `theorem`, namespace and module docstring in the required form. Not padding: the proof needs Cauchy, Shapiro, the cyclic computation and a K-projective argument. It is kept as a headline and not treated as a stand-in because compactness in a stable ∞-category is a property of the homotopy category (HA line 5813–5816, Proposition 1.4.4.1(3)), so the statement is the non-compactness half of 8.5 on the same category; its route is independent of Layers 1–7, which the README says. Every headline listed as not statable was checked against the pins: no `QCoh`, `Mod_A`, animated rings, `DQCoh` or compact objects in the pinned Mathlib or Tau Ceti; the Tau Ceti quasicategory files are those the docstring names.
- **Targets read: 34** (1.1–8.6), each with its *Needs* line; no forward reference in a statement or *Needs* line; layer order consistent with "How to read the build".
- **Checks tested: 142 read, values recomputed for the 120 or so entering the table above**; every section has at least three; none found false or vacuous.
- **Pinned declarations: 45 of 45** (40 Mathlib, 5 Tau Ceti) exist at the cited file and line with the described statement.
- **Sibling citations checked: 9 roadmaps, about 150 names and sections.** On main: EnhancedDerivedSheaves (76 names and ids), SchemeAndStackFoundations (35 names, §§1.1, 1.13, 1.16, 1.18, 1.21, 1.22, 2.18 read), DerivedModuleAlgebra §§0.2, 1.E.0, ReductiveGroups Layers 1, 3, 6, StableHomotopyKTheory §5.17 (definition identical to the body written in the Lean statement). At open heads: PrismaticCohomologyPartII §4.0 (17 names), LanglandsParameterStacks §§1.7–1.8, HabiroCohomologyFoundations §§1.27–1.28, and 39 labelled statements of the InfinityCategoryTheory Parts. Three of the latter (InfinityTopoi §§8.4.1, 9.1.1, 9.2.3) are consumed as named bullets of the supplier's proof routes; each bullet exists at the head with the cited HTT lemma, and the local-lifting bullet states that it holds for any Grothendieck topology.
- **Ownership by object**: searched main and the open heads for the HA, SAG and BZFN results that Layers 1–8 state as their own (HA 4.5.3.1, 4.6.1.11, 4.7.4.18, 4.7.5.2–3, 7.1.1.13, 7.2.2.10–15, 7.2.4.x; SAG 6.2.x, 6.3.4.1, 9.1.3, 9.1.5, 2.9.1.5; "perfect stack"; "flat hyperdescent"). Owners found are the three imports the README names. Straightening §5.1.3 (open) gives the coherent diagram of adjoints (HA 4.7.4.18(3)), not the limit statement of 1.5, and coherent mates are EnhancedDerivedSheaves E3.4 on main. No second owner.
- **Gaps**: both slugs are in `design/plan.json` and in the README under the supplier's subsection with the same `needs`; each is one statement with its hypotheses; neither is stated in ReductiveGroups Layer 3 or SchemeAndStackFoundations §1.16 today; SGA1 line 6972 (Exposé VIII, Proposition 7.8, printed p. 174) supports the route of the second.
- **Locators verified: 133.** SAG 48, HA 28, HTT 14, GR-I 15 (printed = PDF − 37 confirmed), BZFN 9, HNR 3, HR-perf 1, SGA1 1, Stacks 14 tags.
- **Policy**: the pull request changes only the package folder; no pull-request number, process narrative, `lemma`, `set_option`, machine path or extraction-line locator in the README or the Lean file.
- **Dependency check**, full output: `depcheck: 251 roadmaps, 2385 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- **Wording**: the definitions of 1.3 (flatness), 1.4 (perfect, almost perfect, locally free), 6.1 (pointwise properties), 8.2 (perfect stacks, with BZFN Proposition 3.9), the statement of 3.3, the proof plan of 8.4 and the Lean docstring were set beside SAG, HA, BZFN and HR-perf. The longest shared run is 11 words in the statement of BZFN Proposition 3.9, a statement that can be written in one way; nothing else exceeds a definition's forced wording.
- **Arrangement**: against SAG's contents. Layer 2 ↔ §6.2.2 with part of §6.2.3; Layer 3 ↔ Appendix D.6 with §6.2.3; Layer 4 ↔ §6.3.4; Layer 5 ↔ §6.2.4; Layer 6 ↔ §§6.2.5–6.2.6 and 9.1; Layers 1, 7 and 8 rest on HA, GR-I, BZFN and the Stacks project. The order is not SAG's, and the scopes differ (three contexts of test rings, affine morphisms only, ordinary schemes).

Source independence: 8 passages compared with 4 sources, none shared; largest share SAG, 69 of about 236 locators; contents compared with SAG: independent.

## Not verifiable

- Stacks tags 0FXR, 0FXS, 0FXT and 02JR (*Morphisms of Schemes*): that chapter is not in the sources cache; the numbering 29.12.1–29.12.3 and 29.13.6 was not checked against the text.
- The `#check @name` comparison was not run: this pass may run no Lean. The signature used is the worker's elaboration of the head.
- R03's statement that instance synthesis finds no `HasIsos` or `HasPullbacks` for `fppfPrecoverage` comes from reading the pinned files, not from elaboration.
- Ownership against open pull requests was checked only through the board's index of open heads (`roadmaps grep`, `roadmaps show`); PrismaticCohomologyPartII, LanglandsParameterStacks and the InfinityCategoryTheory family are not among the listed checkouts and were read through that tool.

## Source issues

- **Misprint** in SAG at Remark 6.2.2.7, printed p. 491: the source says the quasi-coherent sheaves in question live on F, a letter that then denotes a sheaf; it should be on the functor X; affects nothing.
- **Misprint** in SAG at Remark 6.2.3.2, printed p. 492: the source says X′ is the fpqc sheafification of F; it should be the sheafification of X; affects nothing.
- **Misprint** in SAG at Warning 6.2.5.9, printed p. 496: the source says membership of F in QCoh(X) does not give coconnective values; it should be membership in the coconnective part of QCoh(X); affects nothing.
- **Misprint** in SAG at Warning 10.4.6.9, printed p. 930: the source names the classifying stack G and then writes the derived category of the heart of QCoh(X); it should use one letter for the stack; affects nothing.
- **Misprint** in HA at Theorem 7.2.2.15, printed p. 1240: the source says N is a left A-module over the connective ring R; it should be a left R-module; affects nothing.
- **Misprint** in HA at Proposition 7.2.1.19, printed p. 1236: the source says M and N are modules over A and takes Tor over the homotopy of A, the ring being R; it should be R throughout; affects nothing.

## For the human reviewers

- **Not tested.** Four Stacks tags of *Morphisms of Schemes* (0FXR, 0FXS, 0FXT, 02JR; `README.md:677`, `:837`, `:841`, `:853`) were not read: the chapter is absent from the sources cache.
- **Scope.** The only Lean declaration (`Suggested.lean:79`) is provable from pinned Mathlib alone; README 8.6 says its route uses none of the ∞-categorical layers. Whether such a statement serves as the acceptance test is yours to decide.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "bfb5a71c5a848350502551ae029c0a8c065b721c", "job": "RT-QuasicoherentSheavesOnPrestacks~1a", "model": "fable", "worker": "chris-x89"} -->
