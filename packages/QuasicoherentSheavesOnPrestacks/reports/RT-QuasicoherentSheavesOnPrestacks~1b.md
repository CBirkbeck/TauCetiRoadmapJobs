<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18060#issuecomment-6908739035 -->
Red team round 1 pass b (claude) of bfb5a71

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) Complete reducibility for `GL_n` is cited to a roadmap layer, but it is a pinned Tau Ceti theorem

   **Location.** `packages/QuasicoherentSheavesOnPrestacks/README.md:188`: "Layer 6: over a field of characteristic zero a smooth connected affine group is reductive exactly when it is linearly reductive; in particular finite-dimensional representations of `GL_n` are completely reducible." Used at README:861 and in the *Needs* line README:873 and Dependencies README:925.

   **Claim.** The input of 8.4 "every representation of `GL_n` in characteristic zero is a sum of irreducible finite-dimensional ones" is supplied by ReductiveGroups Layer 6.

   **Witness.** Pinned Tau Ceti: `TauCeti.Comodule.isCompletelyReducible_of_reductive` (TauCeti/Algebra/AlgebraicGroup/Reductive/CompleteReducibility.lean:108, arbitrary comodules, `[CharZero k]`) and `TauCeti.GeneralLinear.reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra` (TauCeti/Algebra/AlgebraicGroup/GeneralLinear/Reductive/Basic.lean:94). ReductiveGroups itself lists both as pinned inputs (its README lines 293–296, 746).

   **Repair.** Under `### From Tau Ceti` add:

   > - `TauCeti.GeneralLinear.reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra` (TauCeti/Algebra/AlgebraicGroup/GeneralLinear/Reductive/Basic.lean:94), `GL_n` over a field is reductive, and `TauCeti.Comodule.isCompletelyReducible_of_reductive` (TauCeti/Algebra/AlgebraicGroup/Reductive/CompleteReducibility.lean:108): over a field of characteristic zero every comodule, finite-dimensional or not, over the coordinate Hopf algebra of a reductive group of finite type is completely reducible. 8.4 uses them for `GL_n`: every object of the heart of `QCoh(BGL_n)` is a sum of simple finite-dimensional comodules.

   Replace the Layer 6 bullet of `### From TauCetiRoadmap.ReductiveGroups` by: "Layer 6 states the structure theory around these two pinned theorems; 8.4 consumes the pinned theorems themselves." In 8.4's route replace "(ReductiveGroups Layer 6)" by "(Tau Ceti `TauCeti.Comodule.isCompletelyReducible_of_reductive` with `TauCeti.GeneralLinear.reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra`)", and make the same replacement in 8.4's *Needs* line and in Layer 8's Dependencies. Tested on the refuting instance: for `GL_1 = G_m` over ℚ the pinned theorem gives that every `ℚ[t, t⁻¹]`-comodule is a sum of characters, which is what 8.2's Check on `BG_m` uses. Check the two signatures with `#check` when the repair worker edits (the universe of `H` is that of `k` in the pinned statement, as in the README's 8.4, where G and k are in one universe).

2. **F02** (P3) Supplier contracts and *Needs* lines omit declarations that the routes consume

   **Location.** README:125 (EnhancedDerivedSheaves E5:presentability.1–4 bullet), README:135 (SchemeAndStackFoundations §1.18 bullet), README:138 (§2.18 bullet), README:708 (*Needs* of 6.4).

   **Claim.** "Exact supplier contracts" lists what the roadmap takes from each supplier.

   **Witness.** Used but absent from the contract bullets: `continuousDerivedInvariants` (README:881, 894); `Stack.isStack_stackification`, `Stack.stackification_isom_sheafify`, `Stack.stackification_locally_essSurj`, `StackInGroupoids.ofSheaf` (README:415–416, 426, 777); `isPseudoCoherentComplex_affine_iff` (README:700, also absent from 6.4's *Needs*). All five exist on main in the cited sections.

   **Repair.**

   - README:125, end of the bullet: "…, `CoherentActionData`, `homotopyFixedPoints` (for a finite group, the limit of the action `BG → Cat∞`) and `continuousDerivedInvariants` (the derived invariants of a discrete module agree with group cohomology; 8.5 uses it for a finite discrete group)."
   - README:135: "§1.18: `StackInGroupoids` (…), `StackInGroupoids.ofSheaf` (the stack of an fppf sheaf), its Yoneda equivalence `Hom(h_T, X) ≃ X(T)`, `isFiberedInGroupoids`, `Stack.stackification` with `Stack.isStack_stackification`, `Stack.stackification_isom_sheafify` (its isomorphism presheaves are the sheafifications of those of the input) and `Stack.stackification_locally_essSurj` (every object is locally in the image of the unit), and `twoFiberProduct`. 2.5 turns these into classical prestacks."
   - README:138: after `PseudoCoherence.IsPseudoCoherentComplex` add "with `isPseudoCoherentComplex_affine_iff` (on `Spec A` it is representability by a bounded-above complex of finite projective modules)".
   - README:708: "SchemeAndStackFoundations §2.18 (`PseudoCoherence.IsPseudoCoherentComplex`, `isPseudoCoherentComplex_affine_iff`)".

3. **F03** (P3) 7.4(d): "quasi-compact" is not defined for `[X/G]`

   **Location.** README:775: "(d) if `[X/G]` is quasi-compact with affine diagonal, for instance X affine, the t-exact functor `D⁺(QCoh([X/G])^♥) → QCoh([X/G])^+` … is an equivalence".

   **Claim.** The hypothesis is a property of `[X/G]`.

   **Witness.** The README defines affine diagonal (4.1) and geometric (6.2) for prestacks, never quasi-compactness; here G is only flat affine over a ring k, so `[X/G]` need not be an algebraic stack. The route (README:777) uses exactly "an affine flat atlas `f : Spec A → [X/G]`".

   **Repair.** Replace the hypothesis of (d) by what the route uses:

   > (d) if `[X/G]^♮` has affine diagonal and X is quasi-compact, for instance X affine, so that a finite affine open cover `Spec A = ⨿ U_i → X → [X/G]^♮` is a flat affine map along which every point lifts after an fppf cover, the t-exact functor …

   Tested: for `X = Spec k` the cover is the atlas `Spec k → BG` used by 8.4; for `X = ℙ¹_k` with `G = G_m` the two charts give `Spec(k[t] × k[t⁻¹])`, affine over `[ℙ¹/G_m]` because the diagonal is affine (X separated, G affine), and flat. Make the same change where 8.4 quotes the hypothesis (README:861, "which applies because `[Spec k/GL_n]` is quasi-compact, with the atlas `Spec k`" → "which applies with the atlas `Spec k`").

4. **F04** (P3) Zariski, étale and fppf covers are used in the animated and `E∞` contexts without a definition

   **Location.** README:443: "Zariski, étale and fppf covers (finite families of open immersions, étale maps or flat maps of finite presentation, jointly faithfully flat) are fpqc covers." README:494: "(d) consequently `QCoh` satisfies descent for fppf, étale and Zariski covers".

   **Claim.** Stated "in each context" (README:494), that is also for `AnRing` and `CAlg^cn`.

   **Witness.** "Open immersion", "étale" and "finite presentation" are defined nowhere in the README for maps of `AnRing` or `CAlg^cn`; 2.5 defines fppf covers only for ordinary rings, and no supplier section is cited for the derived notions.

   **Repair.** In 3.1 replace the sentence by:

   > A map `A → B` of test rings is a Zariski localization, étale, or flat of finite presentation when it is flat (Conventions) and `π₀A → π₀B` is a localization `π₀A → (π₀A)[1/f]`, étale, or of finite presentation (Mathlib `RingHom.FinitePresentation`); for discrete test rings these are the ordinary notions. Zariski, étale and fppf covers are the finite families of such maps that are jointly faithfully flat; they are fpqc covers by definition.

   Tested: `{ℤ → ℤ[1/2], ℤ → ℤ[1/3]}` is a Zariski cover and an fpqc cover; `ℤ → ℤ[1/p] × ℤ_p` is an fpqc cover and not an fppf one (2.5's Check); `𝔽_p → 𝔽_p ⊗ᴸ_ℤ 𝔽_p` is none of them (not flat).

Four findings, all P3. No statement of the README or of `Suggested.lean` was found false; no supplier citation, pinned declaration or source locator that I could check was found wrong. Nothing in the last repair report (`reports/FIX-PKG-QuasicoherentSheavesOnPrestacks~2.md`) is marked `not actionable in this package`, so nothing is re-raised.

## Verified sound

Counts: 1 Lean declaration read (whole file, 87 lines); README read in full (941 lines), 34 targets in 8 layers; 120 source locators verified against the cached texts (listed below); 46 pinned `file:line` citations opened at the pins, all correct; 142 Checks and 17 Examples read, 27 rows of them and of the conventions recomputed in the table below; sibling citations checked by name or section: 75 of EnhancedDerivedSheaves, 34 of SchemeAndStackFoundations, 5 of DerivedModuleAlgebra, 2 of StableHomotopyKTheory, 3 layers of ReductiveGroups, 17 of PrismaticCohomologyPartII, 2 sections each of LanglandsParameterStacks and HabiroCohomologyFoundations, 39 labelled statements of the InfinityCategoryTheory family.

**Lean versus README.** The elaborated type in the job's signature table was compared with README 8.6 (I ran no Lean: the pass is read-only, and nothing in the file changed): binders `k : Type u`, `Field k`, `Γ : Type u`, `Group Γ`, `Finite Γ`, `p`, `CharP k p`, `p ∣ Nat.card Γ`, `HasDerivedCategory.{w} (Rep k Γ)`; conclusion the negation of the body of StableHomotopyKTheory's `IsCompactForCoproducts` (its `Suggested.lean` on main, line 250, same body with `T = DerivedCategory (Rep k Γ)`, `v = w`). No binder lost, no `set_option`, single `import Mathlib`, no sorry'd data, `theorem` not `lemma`. No declaration of another roadmap has this fully qualified name (`roadmaps grep` on `not_preservesCoproducts`: no match).

**Headlines and padding.** Headlines: 3.2 (flat hyperdescent), 2.4 and 3.3 (change of test rings, invariance under hypersheafification), 4.2, 5.3, 6.2–6.3, 7.2–7.4, 8.1, 8.2–8.4, 8.5/8.6. Only 8.6 is statable at the pins; the module docstring names each of the others with the missing carrier. The one declaration is not padding: its proof needs Shapiro's lemma, the cyclic computation and a coproduct in `DerivedCategory (Rep k Γ)`; no library near-match states it.

**Adversarial table.**

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| `not_preservesCoproducts_trivial` (Lean, 8.6) | Γ = ℤ/2, k = 𝔽₂; Γ = S₃, k = 𝔽₃; Γ = 1; p = 0, 1; w ≠ u; a coproduct that does not exist | `Hⁱ(C_p; k) = k` all i (norm = p = 0, `g − 1 = 0`); `Hom(k, ⊕ V[i]) = ∏ k ≠ ⊕ k`; Γ = 1: `p ∣ 1` forces p = 1, no field; p = 0: `0 ∣ |Γ|` false; J = `ULift ℕ` exists in every `Type w`, and `⊕_ℕ V[i]` exists (termwise, AB4), so preservation is not vacuous | true as typed |
| 8.6 API: `⊕ Hom(K, X_i) → Hom(K, ∐ X_i)` injective | additive category, projections `∐ X_i → X_j` | j-th component recovered | holds |
| 8.5 `S₃` Check | `H¹, H²(S₃; 𝔽₃)`; `Coind_{C₃}^{S₃} 𝔽₃` | `C₂` acts by −1 on `H¹, H²(C₃)`: invariants 0; dimension `[S₃ : C₃] = 2`; `Hⁱ = 𝔽₃` all i | holds |
| 8.4 twist Check | conjugation ∘ `diag(1, −1)` on `ℚ(i)²` | invariants `ℚe₁ ⊕ ℚ·ie₂` | holds |
| 8.3 Check, `A = k[ε]/(ε²)` | characteristic 2 and ≠ 2 | `Ω¹_{A/k} = A dε/(2ε dε)`: `k·dε`, resp. `A·dε`; both nonzero | holds |
| 8.3 ample-family Check | line with doubled origin, `L_{±1}` | sections `(1, t)`, `(t, 1)` with non-vanishing loci the two charts | holds |
| 8.2 Check, `⨿_ℕ Spec ℤ` | scheme versus coproduct of prestacks | `Hom(O, ⊕ O_i) = ∏ ℤ ≠ ⊕ ℤ`; fibre of the diagonal over (0, 1) empty at the zero ring | holds |
| 8.4 `K(ℤ, 2)` Check | `Fun(K(ℤ,2), Mod_ℚ)` | heart = ℚ-vector spaces, `π₀ Map(O, O[2]) = H²(ℂP^∞; ℚ) = ℚ` | holds |
| 7.1 Check, `O(G) = ℤ × 𝔽_ℓ` | group law `e + e′ − 2ee′` on idempotents with `ℓe = 0` | closed, unit 0, self-inverse; `𝔽_ℓ` not flat | holds |
| 7.1 Check, constant ℤ/2 | value at `ℤ × ℤ` | prestack coproduct: 2 points; affine `Spec(ℤ × ℤ)`: 4 | holds |
| 3.2 index Check | `ℤ → ℤ[1/2] × ℤ[1/3]` | fibre `ℤ[1/6][−1]`; `Ext²(ℤ[1/6], ℤ) = 0`; `Hom(ℤ[1/n], ℤ) = 0`, so no retraction | exponent 2, holds |
| 3.2 affine-line Check | `ℤ → 𝔽_p × ℤ[1/p]` | `B ⊗ B = B`, cofaces equal, equalizer ∋ (1, 0) | holds |
| 3.1 local-lifting Check | `Spec 𝔽_p ⊔ Spec ℤ[1/p] → Spec ℤ` | each member of a cover is flat, so nonzero `R_i` are `ℤ[1/p]`-algebras; `𝔽_p ⊗ ∏ R_i = 0` | holds |
| 3.1 flat hypercover, Čech nerve | n = 0, 1 | `L_0 = A → B` faithfully flat; `L_1 = B ⊗_A B → B ⊗_A B` identity | holds |
| 3.4 `ℙ¹` Check | `(a, b) ↦ a − t⁻²b` | image `k[t] + t⁻²k[t⁻¹]`, cokernel `k·t⁻¹` | holds |
| 3.4 doubled-origin Check | affine opens containing `𝔸² ∖ 0` | exactly U, U′ (the others are not affine) | holds |
| 2.5 fppf Checks | `ℤ → ℤ[1/p] × ℤ_p`; `{ℤ[1/n]}_{n ≥ 2}` | `ℤ_p` uncountable; subfamily n = 2, 3 covers; pinned `fppfPrecoverage` has no finiteness condition (Fpqc.lean:41) | holds |
| 2.4 Check, `ι^*Spec(𝔽_p ⊗ᴸ 𝔽_p)` | adjunction `π₀ ⊣ ι` | `Hom(𝔽_p, R)`, so `Spec 𝔽_p` | holds |
| 2.2/2.3 Check, `Bℤ/2 × Spec 𝔽₂` | `π₀ Map(O, O[1])` and its evaluations | `H¹(ℤ/2; 𝔽₂) = 𝔽₂`; `π₋₁A = 0` | holds |
| 1.1 Check, θ not an equivalence | free `E∞` object on `ℤ[0]`, weight 2 | `π₁(ℤ_{hΣ₂}) = H₁(Σ₂; ℤ) = ℤ/2` | holds |
| 1.4 Checks | `k` over `k[ε]/(ε²)`; `ℤ/p` over ℤ | `Tor_i = k` all i; dual `ℤ/p[−1]` not connective | holds |
| 1.5 Check | `(ℤ, ℚ)`, `(ℤ, ℤ[1])`, `(ℤ, ℤ²)` | not dualizable; invertible; evaluation rank 4 → 1 | holds |
| Conventions, universes | K not u-small | `π₀ Map(C, ℚ/ℤ) = ∏_K ℚ/ℤ` not u-small | holds |
| Conventions, `+` versus bounded below | `∏ ℤ[−i]`, `⊕ ℤ[i]` | first 0-truncated, `π_{−i} = ℤ`; second connective, unbounded above | holds |
| 7.3 Check | `σ(x) = 2x` on `ℚ[x^{±1}]` | `id(x·1) = x ≠ 2x` | holds |
| 6.4 against SAG 9.1.5.1 | `F = ⊕ ℤ[−i]` (not bounded below) | `π₀ Map(F, G) = ∏ π_{−i}G` does not commute with filtered colimits, so the criterion excludes it | consistent |
| 7.4(d) | `G = ℤ/p` over `𝔽_p`; `G_a` over `𝔽_p` | `Extⁱ = 𝔽_p` on both sides; unbounded comparison not asserted (SAG Warning 10.4.6.9) | holds |

**Suppliers.** On main: every backticked supplier name and section id of EnhancedDerivedSheaves (75), SchemeAndStackFoundations (34), DerivedModuleAlgebra (5) and StableHomotopyKTheory §5.17 exists, in the cited sections where I opened them (E2.6–E2.8, E5:presentability.2–3, E5:animation.3–4, §§1.18, 1.21, 1.22, 2.18); `homotopyFixedPoints` is stated there for a finite group, as README 7.3 says. At open heads: PrismaticCohomologyPartII §4.0 (`QCohPrestack` and its 16 API names, flat affine pushforward, Čech descent), LanglandsParameterStacks §§1.7–1.8, HabiroCohomologyFoundations §§1.27–1.28, and all 39 labelled statements of the InfinityCategoryTheory family (one pull request by another author adding the Part folders) exist with the cited content. Three of those (InfinityTopoi §§8.4.1, 9.1.1, 9.2.3) are consumed as named steps of the supplier's proof route, not as its headline statement; each step is written out there with its own HTT locator, §9.2.3's "for any Grothendieck topology", and HTT Lemma 6.2.4.5 (HTT line 27932) is stated at that generality. Both declared gaps have the same slug in `design/plan.json` and in the README; the pin has the quotient `GL_n/G` only for reductive G (TauCeti/Algebra/AlgebraicGroup/Fppf/Quotient/Homogeneous/GeneralLinear.lean:56, affine case), so the Chevalley gap asks for nothing already provided.

**Ownership.** `roadmaps grep` for perfect stacks, flat hyperdescent, hypercomplete fpqc sheaves and `QCoh(h_X)`: no other owner on main or at an open head; the three partial owners (PrismaticCohomologyPartII §4.0, LanglandsParameterStacks §§1.7–1.8, HabiroCohomologyFoundations §§1.27–1.28) are imported and the extensions say where they agree. The overlap list has no pull request changing this roadmap and no dropped id.

**Dependency check.** Output of the gate command of the brief:

```
depcheck: 251 roadmaps, 2385 edges, 0 problem(s)
```

**Policy.** The pull request changes only `packages/QuasicoherentSheavesOnPrestacks/`. No process words, pull-request numbers, `lemma`, `set_option` or algorithm in the README or the Lean file; every target carries a locator; every definition has at least three Checks.

**Locators verified** (source line of the statement; page from the page markers): SAG 6.2.2.1 (17835), 6.2.1.12 (17758), 6.2.3.1 (17889), 6.2.3.4 (17905), 6.2.4.1 (17929), 6.2.5.2 (17974), 6.2.5.3 (17990), 6.2.5.7 (18011), 6.2.5.8–6.2.5.9 (18017), 6.2.6.1–6.2.6.3 (18068–18088), 6.3.4.1 (18368), 2.2.3.3 (7269), 2.1.2.3 (6951), 2.2.6.2 (7461), 2.8.4.2 (9916), 2.9.1.1 (10004), 2.9.1.5 (10022), 2.9.5.5 (10219), 1.3.1.7 (4184), 9.1.3.1–9.1.3.2 (26667–26690), 9.1.5.1 (26798), 9.6.1.1 (29408), 10.4.6.8–10.4.6.9 (33959–33965), A.3.2.1 (64259), A.3.3.1 (64326), A.5.7.1–A.5.7.2 (65837–65851), D.6.1.1 (79377), D.6.1.3–D.6.1.4 (79395–79403), D.6.2.3 (79462), D.6.3.1, D.6.3.3–D.6.3.4 (79502–79526); HA 1.3.3.2, 1.4.4.1, 1.4.4.11, 3.2.4.7, 4.5.3.1–4.5.3.2, 4.6.1.11–4.6.1.12, 4.7.4.18, 4.7.5.2–4.7.5.3, 4.8.4.6, 4.8.5.21, 5.2.2.36, 7.1.1.13, 7.1.1.16, 7.1.3.18, 7.2.1.19, 7.2.2.12–7.2.2.13, 7.2.4.2, 7.2.4.4, 7.2.4.11, 7.2.4.17 (pages as cited); HTT 2.1.1.3, 2.4.1.5, 3.1.2.1, 5.1.5.6, 5.2.8.16, 5.5.4.20, 5.5.6.28, 6.1.0.6, 6.1.2.7, 6.1.3.10, 6.1.3.19, 6.2.2.16, 6.2.3.4, 6.2.3.13, 6.2.3.18, 6.2.4.5, 6.5.2.8–6.5.2.9, 6.5.3.11–6.5.3.12, 7.2.1.14 (PDF pages as cited); GR-I Chapter I.3: 1.3.4, 1.3.5, 1.3.7, 1.3.8, 1.3.11, 1.4.4, 1.5.4, 2.2.2, 2.4.3, 2.4.5, 3.6.4, 3.6.5 (printed pp. 146–163 as cited); BZFN 3.1, 3.2, 3.9, 3.20–3.24, §3.1.2; HNR Theorem 1.1, §4 definition (HNR line 437, p. 9), Theorem C.1 (p. 16); HR-perf Introduction (HR-perf line 29, p. 1); SGA1 VIII 7.8 (SGA1 line 6972, printed p. 174); Stacks 0A0J, 08D3, 06Z0, 08DZ, 08E8, 09IS, 0BQR, 09M1, 08EU, 08IB.

**Wording and arrangement.** Nine passages were put beside their sources: 8.2's definition (BZFN line 834, 7 shared words, a definition), 3.1's flat hypercover (SAG line 79403), the fpqc cover convention (SAG line 79377), 6.2(a) (SAG line 18017), 6.4's criterion (SAG line 26798, 4 shared words), 8.5's first sentence (HR-perf line 29, 5 shared words), 8.5's poorly stabilized clause (HNR line 437), the SGA1 sentence of the twist gap (SGA1 line 6972, a condensed statement in another language), and the docstring of `not_preservesCoproducts_trivial`. None reproduces a sentence or follows one clause by clause. Contents: SAG has 69 of the 213 source mentions that carry or share a locator (HTT 56, HA 39, GR-I 17, Stacks 15, BZFN 10, HNR 3, HR-perf 3, SGA1 1). Its order is Chapter 2 (modules, 2.8–2.9), 6.2.2–6.2.6, 6.3, 9.1, Appendices A and D; the roadmap's is modules (HA Chapter 7 with SAG 2.9), prestacks (6.2.2–6.2.3), descent (D.6, A.3, A.5), affine pushforward (6.3.4), schemes (6.2.4), t-structure and finiteness (6.2.5–6.2.6, 9.1), quotients (GR-I, HNR), perfect stacks (BZFN): no run of layers maps in order onto a run of SAG sections (Layer 3 ↔ App. D, Layer 4 ↔ 6.3, Layer 5 ↔ 6.2.4, Layer 6 ↔ 6.2.5–6.2.6 and 9.1), and the order is forced by the *Needs* lines (3.2 before 3.3, 3.4 before 5.3, 4.1 before 6.2, 6.2 before 7.1). Against GR-I Chapter I.3 (§1.1–1.5, §2, §3): Layer 6 ↔ §1.5 and §3.6, Layer 4 ↔ §2.2, Layer 7 ↔ §2.4: not monotone either. No table, figure or list of examples is taken over from a source.

Source independence: 9 passages compared with 5 sources, none shared; largest share SAG, 69 of 213 locators; contents compared with SAG (and with GR-I Chapter I.3): independent.

## Not verifiable

- Stacks tags outside the cached chapter (0FXR, 0FXS, 0FXT, 02JR in *Morphisms of Schemes*; 023Q, 0245 in *Descent*; 06WG, 06WT in *Sheaves on Algebraic Stacks*): the cache holds only *Derived Categories of Schemes*. The tags agree with SchemeAndStackFoundations' own citations of 06WG, 06WT and 0245 on main; the statements attributed to them are the standard ones.
- Elaboration of `Suggested.lean`: not run in this pass (read-only); I relied on the job's elaborated signature and on the repair report's statement that the file elaborates with one `sorry` warning.
- Ownership against the open pull requests whose files are not checked out (217 of 462): checked only through `roadmaps grep` and `roadmaps show`, which read their heads.
- That the supplier's pinned `homotopyFixedPoints` and `continuousDerivedInvariants` will have the shape 8.5 assumes (cohomology of `V^{hΓ}` is Mathlib's `groupCohomology` for a finite discrete Γ): the supplier states agreement with continuous cochain cohomology for discrete modules of a profinite group; the finite case is the special case, but its comparison with Mathlib's `groupCohomology` is not spelled out there.

## Source issues

- none

## For the human reviewers

- **Not tested.** Eight Stacks tags (0FXR, 0FXS, 0FXT, 02JR, 023Q, 0245, 06WG, 06WT) lie in chapters not in the sources cache; their statements were not read (`sources.toml`, entry `Stacks`, `version_note`).
- **Scope.** GR-I works over a field of characteristic zero (README References); the roadmap cites it for statements it proves over ℤ, each with a SAG or HA locator beside it. Whether that double citation is wanted is yours to decide.
- **Scope.** The only Lean statement (8.6) is a theorem about Mathlib's `DerivedCategory (Rep k Γ)`; it names none of the roadmap's ∞-categorical objects, which are not at the pins (`Suggested.lean`, module docstring).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "bfb5a71c5a848350502551ae029c0a8c065b721c", "job": "RT-QuasicoherentSheavesOnPrestacks~1b", "model": "fable", "worker": "chris-x82"} -->
