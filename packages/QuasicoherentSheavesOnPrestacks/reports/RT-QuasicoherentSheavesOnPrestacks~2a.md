<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18060#issuecomment-6909820112 -->
Red team round 2 pass a (claude) of 74646e9

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) sheaves and sheafification on `AnRing^op` and `(CAlg^cn)^op` are taken from a supplier statement about ordinary sites

   Location: `packages/QuasicoherentSheavesOnPrestacks/README.md:445`, "the (hyper)sheafification `L : PreStk_T → Shv_fpqc` as the left adjoint of the inclusion, given by the accessible localization of EnhancedDerivedSheaves E2.7 in the universe u+1"; `README.md:453`, "`L` is left exact and preserves colimits"; the *Needs* lines `README.md:468`, `:493`, `:507`, `:522`.

   Claim: EnhancedDerivedSheaves E2.7 (`spaceSheaves`, `hypercompleteSpaceSheaves`) gives the ∞-topos of fpqc sheaves on `T^op`, a left exact `L` and the hypercompletion, in each of the three contexts.

   Witness: EnhancedDerivedSheaves README on main, line 2377: `spaceSheaves` is "for a small site", a Mathlib site (`CategoryTheory.GrothendieckTopology`, line 88), with E2.6's `Hypercover` in a topos (line 2295). `AnRing^op` is no ordinary category: `Map(ℤ[x], 𝔽_p ⊗ᴸ_ℤ 𝔽_p)` has `π₁ = 𝔽_p`. The statement at this generality is InfinityTopoi §8.2.1 and §8.3.1 (HTT line 27072, 27077), which the README never cites.

   Repair.

   - `README.md:445`: replace "given by the accessible localization of EnhancedDerivedSheaves E2.7 in the universe u+1, in which the ∞-category of test rings is (u+1)-small" by: "given by InfinityTopoi §8.2.1 and §8.3.1 (HTT Definition 6.2.2.6 and Proposition 6.2.2.7, PDF p. 597), applied in the universe u+1 to the (u+1)-small ∞-category `T^op` with the topology of the next paragraph: the sheaves are the prestacks local for the monomorphisms of covering sieves, and the inclusion has a left exact accessible left adjoint, so that fpqc sheaves form an ∞-topos. The hypersheafification is L followed by the hypercompletion (HypercompletenessAndCoherence §1.2.1). In the classical context `CRing^op` is the nerve of an ordinary category and these are EnhancedDerivedSheaves E2.7's `spaceSheaves` and `hypercompleteSpaceSheaves`, both being the objects local for the same monomorphisms."
   - `README.md:453`: "`L` is left exact and preserves colimits (InfinityTopoi §8.3.1)".
   - `README.md:177`, at the head of the bullet "InfinityTopoi, sheaves on a small ∞-category C with a Grothendieck topology": "§8.2.1: a presheaf is a sheaf when it is local for the monomorphisms into representables that correspond to covering sieves (HTT Definition 6.2.2.6). §8.3.1: sheaves form a left exact accessible localization of presheaves, hence an ∞-topos (HTT Proposition 6.2.2.7). 3.1 takes its sheafification from these two." Add "§§8.2.1, 8.3.1" to the InfinityTopoi line of Scope (`README.md:43`).
   - *Needs* of 3.1 (`README.md:468`): add "InfinityTopoi §8.2.1 (HTT Definition 6.2.2.6), §8.3.1 (HTT Proposition 6.2.2.7)" and write "EnhancedDerivedSheaves E2.7 (`spaceSheaves`, `hypercompleteSpaceSheaves`, the classical context)". In the *Needs* of 3.2, 3.3 and 3.4 (`README.md:493`, `:507`, `:522`) replace "EnhancedDerivedSheaves E2.7 (`hypercompleteSpaceSheaves` …)" by "3.1 (hypercomplete fpqc sheaves; HypercompletenessAndCoherence §1.2.1)". Add "§§8.2.1, 8.3.1" to Layer 3's Dependencies (`README.md:531`) and "Definition 6.2.2.6; Proposition 6.2.2.7" to the HTT locator of `sources.toml`.

   Tested on the refuting instance: for `T = AnRing`, `T^op` is a (u+1)-small ∞-category with pullbacks, HypercompletenessAndCoherence §9.3.2 gives its topology in the sense of InfinityTopoi §8.1.1, and §§8.2.1, 8.3.1 are stated for exactly that (no ordinary-category hypothesis). 2.5's `L_fppf` on the ordinary `CRing^op` keeps E2.7 unchanged. The depcheck is unaffected: InfinityTopoi is already a supplier.

2. **F02** (P2) 8.4 reads two fibres off a supplier that does not state them, and applies 8.3(b) to `BG → BGL_n` without naming its invertible object

   Location: `README.md:865`, "Its base change along a point `Spec R → BGL_n`, a `GL_n`-torsor P, is the twist `P ×^{GL_n} (GL_n/G)`" and "the base change of `[X/G]` along it is the contracted product `P ×^G X` (SchemeAndStackFoundations §1.16 `contractedProduct`, …)"; `README.md:137`, "8.4 reads the base change of `[X/G] → BG` along the point defined by a torsor P as `contractedProduct G P X`".

   Claim: both identifications of fibres are available, and 8.3(b) applies to `(BG)^♮ → (BGL_n)^♮`.

   Witness: SchemeAndStackFoundations README on main, lines 3380–3386 (§1.16: `contractedProduct`, `_trivial`, `_baseChange`, `_isAlgebraicSpace`, `pushforwardTorsor`) and 3757–3760 (§1.21: `actionQuotient.torsorEquiv`); neither states `[X/G] ×_{BG} T ≅ P ×^G X` or the fibre of `BG → BGL_n`. No target here does. 8.3(b) (`README.md:841`) asks for invertible objects of `QCoh(Y)`; for `Y = (BG)^♮` the route names none.

   Repair. Add to 7.4, after its proof route, and add "§1.16 (`contractedProduct`, `contractedProduct_trivial`, `contractedProduct_baseChange`, `pushforwardTorsor`)" and "`actionQuotient.torsorEquiv`" to its *Needs* line and to the contract bullets `README.md:137`, `:139`:

   > The API consists of the following facts.
   >
   > - Fibres over the classifying stack. For a G-torsor P over `Spec R`, a point of `(BG)^♮`, there is an equivalence `[X/G]^♮ ×_{(BG)^♮} Spec R ≃ (contractedProduct G P X_R)^♮`, the fppf sheaf `(P × X)/G` of SchemeAndStackFoundations §1.16. Proof route: by `actionQuotient.torsorEquiv` and 2.5 (2-fibre products), a point of the left side over `T → Spec R` is a `G_T`-torsor Q with an equivariant map `Q → X` and an isomorphism `Q ≅ P_T`, and such triples have no nontrivial automorphisms; they are the equivariant maps `P_T → X`. These and the sections of `(P × X)/G` over T are fppf sheaves in T that agree where P is trivial (`contractedProduct_trivial`, `contractedProduct_baseChange`).
   > - Change of group. Let `φ : H → G` be a closed immersion of flat affine group schemes over k with fppf quotient sheaf `G/H`. The map `(BH)^♮ → (BG)^♮`, `Q ↦ pushforwardTorsor φ Q`, is equivalent over `(BG)^♮` to `[(G/H)/G]^♮ → (BG)^♮`, a reduction of a G-torsor P to H being a section of `contractedProduct G P (G/H)`. So its fibre over P is `(contractedProduct G P (G/H))^♮` by the previous fact, and a G-linearized invertible module on `G/H` is an invertible object of `QCoh((BH)^♮)` (7.4(b), 6.3) whose restriction to each fibre is the descended module.

   In 8.4 (`README.md:865`) replace "gives `BG → BGL_n`, flat with fibre `GL_n/G`" by "gives `BG → BGL_n`, which by 7.4 (change of group) is `[(GL_n/G)/GL_n] → BGL_n`, flat with fibre `GL_n/G`"; after "with the twisted `O(1)` ample on it" add "and `O(1)`, being `GL_n`-linearized, is an invertible object of `QCoh((BG)^♮)` restricting to it (7.4, change of group)"; replace "(SchemeAndStackFoundations §1.16 `contractedProduct`, a 2-fibre product of stacks read as a fibre product of prestacks by 2.5)" by "(7.4, fibres over the classifying stack)". In `README.md:137` replace "8.4 reads the base change … as `contractedProduct G P X`" by "7.4 proves that the base change of `[X/G] → BG` along the point defined by a torsor P is `contractedProduct G P X`".

   Tested: for `G = ℤ/2` over ℚ, `X = G` with translation and `P = Spec ℚ(i)`, the T-points of the fibre are the equivariant maps `P_T → G`, that is the trivializations of `P_T`, so the fibre is `P = Spec ℚ(i)`, the value of the Check at `README.md:874`. For `H = 1`, change of group gives `Spec k → BG` with fibre `P ×^G G = P`, as 7.1 computes.

3. **F03** (P3) 8.1 takes "compact implies perfect" and "perfect implies compact" from a citation, not from a supplier

   Location: `README.md:807`, "the homotopy-category generator detects zero objects, and perfect objects are compact. Conversely compact objects of `DQCoh X` are perfect (Stacks 09M1)."

   Claim: both halves are inputs available to the route.

   Witness: SchemeAndStackFoundations §2.18 `perfect_generator` (README on main, line 5059–5061) gives one perfect generator and compact generation by perfect complexes, from Stacks 36.15.1–36.15.3; "09M1" and "36.17.1" occur nowhere in SchemeAndStackFoundations or EnhancedDerivedSheaves on main, nor at the pins. A citation is not a supplier.

   Repair: replace the two sentences by:

   "The unit is compact: `Map(O, −)` is `Ω^∞` of the total direct image along the qcqs map `X → Spec ℤ`, which preserves small colimits (5.4(a)). So every dualizable object F is compact, `Map(F, −) ≃ Map(O, F^∨ ⊗ −)`, and perfect objects are dualizable (6.3). By `perfect_generator` one perfect object P generates. Let `C₀` be the smallest stable subcategory closed under retracts containing P; `Ind(C₀) → QCoh(h_X)` is fully faithful, its objects being compact, and essentially surjective, P generating, so the compact objects are those of `C₀` (`indCompactComparison`), which are perfect, perfect objects forming a stable subcategory closed under retracts (Stacks 09M1 states the result)."

   Add "5.4" and "`indCompactComparison`" to the *Needs* line `README.md:815`. Tested: for `X = Spec A`, `P = A` and `C₀` is the perfect modules (1.4); for `ℙ¹_k`, `P = O ⊕ O(−1)` and `C₀ = Perf`; for `⨿_ℕ Spec ℤ` the map to `Spec ℤ` is not quasi-compact and the unit is not compact, as the Check at `README.md:813` says.

4. **F04** (P3) 6.2(b) is applied to `Y^♮`, which the roadmap shows to be an fppf sheaf only

   Location: `README.md:670`, "For `X = Y^♮` with Y a stack of SchemeAndStackFoundations §1.18 with flat affine atlas and affine diagonal, the heart is §1.22's `Stacks.QCoh(Y)`"; `README.md:778`, "(b) the t-structure of 6.2, computed levelwise".

   Claim: `Y^♮` is in the scope of 6.2(b).

   Witness: 6.2(b) asks for "a hypercomplete fpqc sheaf with affine diagonal" (`README.md:670`); `Y^♮` is an fppf sheaf (2.5, `README.md:418`) and no target proves fpqc descent for it. 8.4 (`README.md:865`) itself passes to "the fpqc hypersheafification of `(BGL_n)^♮`" and argues that "the t-structures agree".

   Repair: add to the statement of 6.2, after (b):

   "(c) Transfer. Let X be a prestack with affine diagonal and `q : Spec A → X` a flat affine map along which every point of X lifts after an fpqc cover. Then the hypersheafification `L X` is geometric with atlas `L q`: L is left exact and fixes affines (3.2), every point of `L X` and of `L X × L X` lifts to X, respectively `X × X`, after an fpqc cover (3.1), and affineness and flatness are fpqc-local on the target (4.1, 6.1). Under `QCoh(L X) ≃ QCoh(X)` (3.3(a)) the connective parts correspond, both being the pointwise connective objects (6.1), so the t-structure of (a) on `QCoh(X)` has every property of (b), with q for p."

   Then write "For `X = Y^♮` with Y a stack … with flat affine atlas and affine diagonal, (c) applies and the heart is §1.22's `Stacks.QCoh(Y)`", write "(b) the t-structure of 6.2(a)" at `README.md:778`, and in 8.4 replace the sentence from "the fpqc hypersheafification of `(BGL_n)^♮` is that quotient" to "(6.1)" by "(6.2(c))". Tested: for `Y = BGL_n` over a field, `(BGL_n)^♮` has affine diagonal (7.4(a)) and atlas `Spec k`, and (c) returns the geometric `[Spec k/GL_n]` of 7.1, the argument 8.4 now makes by hand; for the plane with doubled origin the diagonal is not affine and (c) does not apply, as the Check at `README.md:680` requires.

Four new findings (S01 and S02 at P2, S03 and S04 at P3). All seven round-1 findings are repaired at this head and no repair introduced an error. `packages/QuasicoherentSheavesOnPrestacks/README.md` (945 lines) and `packages/QuasicoherentSheavesOnPrestacks/Suggested.lean` (87 lines) were read in full. No statement of the README or of the Lean file was found false. The last repair report marks nothing `not actionable in this package`, so nothing is re-raised.

## Round-1 findings at this head

| Id | Status | Repaired passage (quoted) | Witness checked |
| --- | --- | --- | --- |
| 1a/F01 | repaired | `README.md:885` "(2.3), which is also `QCoh` of `BG = [Spec k/Γ]` (7.1), its fpqc hypersheafification, by 3.3(a)"; `README.md:898` "*Needs:* 2.2; 2.3 (…); 3.3 (3.3(a), …); 6.3; 7.1 (`BG = [S/G]`); 8.2" | Γ = ℤ/2, k = 𝔽₂: 2.3 gives `Fun(BΓ, Mod_k)`, 7.1 and 3.3(a) the same `QCoh` on `[Spec k/Γ]`; `H¹ = 𝔽₂` on both |
| 1a/F02 | repaired | `README.md:881` "a quasi-compact, quasi-separated algebraic stack is poorly stabilized when it has a geometric point of positive characteristic … for such a stack the lisse-étale `D_qc` is not compactly generated" | HNR line 45–47 (Theorem 1.1, p. 1: quasi-compact, quasi-separated, poorly stabilized; `Dqc`), HNR line 436–440 (p. 9: geometric point, `B_k G_a` named); HR-perf line 19–29 for the neighbouring clause |
| 1a/F03 | repaired (differently, correctly) | `README.md:412` "whose four hypotheses hold for that precoverage: … it has pullbacks, as every precoverage of schemes does … The last hypothesis is not found by instance search" | Mathlib/CategoryTheory/Sites/Precoverage.lean:186 (`instance (J : Precoverage C) [Limits.HasPullbacks C] : J.HasPullbacks`), :87 (`HasIsos`); Mathlib/AlgebraicGeometry/Sites/MorphismProperty.lean:89; Fpqc.lean:41–43 derives two instances only. The repair's rejection of the round-1 witness is right: `HasPullbacks` is an instance |
| 1b/F01 | repaired | `README.md:113` "`TauCeti.Comodule.isCompletelyReducible_of_reductive` (…CompleteReducibility.lean:108): over a field of characteristic zero, every comodule … is completely reducible" | Both pinned theorems read at the cited lines; `IsCompletelyReducible` (LinearlyReductive.lean:126) is "every subcomodule has a complement"; ReductiveGroups Layer 6 is cited nowhere any more (only Layer 1, at `README.md:113`, `:865`, `:877`, `:929`) |
| 1b/F02 | repaired | `README.md:128` "`homotopyFixedPoints` (…) and `continuousDerivedInvariants` (…)"; `README.md:138` "`Stack.isStack_stackification` …, `Stack.stackification_isom_sheafify` …, `Stack.stackification_locally_essSurj`"; `README.md:141`, `:711` `isPseudoCoherentComplex_affine_iff` | All six names exist on main: EnhancedDerivedSheaves README line 1720–1722; SchemeAndStackFoundations README lines 3543, 3559–3566, 5037 |
| 1b/F03 | repaired | `README.md:778` "(d) if X is quasi-compact and `[X/G]^♮` has affine diagonal (4.1), for instance if X is affine" | Route recomputed (table, rows 7.4); GR-I line 7883–7888 (Lemma 2.4.5, printed p. 156) has the hypotheses the route verifies |
| 1b/F04 | repaired (differently, correctly) | `README.md:445` "A map `A → B` of test rings is an open immersion, étale, or flat of finite presentation when it is flat (Conventions) and the ring map `π₀A → π₀B` is, respectively, …" | HA line 52701–52705 (Definition 7.5.0.4, p. 1374): étale = `π₀` étale and flat; new Check `README.md:464` recomputed (`π₁(B ⊗ B) = 𝔽_p²` against `π₁ B = 𝔽_p`) |

## Declarations and the adversarial pass

`Suggested.lean` has one declaration and no section variables.

| Declaration | Context | README | Elaborated type compared |
| --- | --- | --- | --- |
| `not_preservesCoproducts_trivial` (`Suggested.lean:79`) | namespace `TauCetiRoadmap.QuasicoherentSheavesOnPrestacks`; `universe w u`; all binders in the signature | 8.6, `README.md:902` | `(k : Type u) [Field k] (Γ : Type u) [Group Γ] [Finite Γ] (p : ℕ) [CharP k p]`, `p ∣ Nat.card Γ`, `[HasDerivedCategory.{w} (Rep k Γ)]`, conclusion `¬ ∀ J : Type w, PreservesColimitsOfShape (Discrete J) (preadditiveCoyoneda.obj (op (…)))`: equal to 8.6 and to the body of `IsCompactForCoproducts` (StableHomotopyKTheory `Suggested.lean:250` on main) |

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `not_preservesCoproducts_trivial` | Γ = 1; p = 0; Γ = ℤ/2, k = 𝔽₂; Γ = S₃, k = 𝔽₃; Γ = ℤ without `Finite`; w < u | `p ∣ 1` forces p = 1, no field; `0 ∣ |Γ|` false; `Hom(k, ⊕ k[i]) = ∏ 𝔽₂ ≠ ⊕ 𝔽₂`; `Hⁱ(S₃; Coind 𝔽₃) = Hⁱ(C₃; 𝔽₃) = 𝔽₃`; `Nat.card ℤ = 0` and k perfect over `k[t^{±1}]`; instance unsatisfiable, statement vacuous | true as typed | none |
| Conventions (universes, indexing, flatness, covers, Beck–Chevalley) | K not u-small; `𝔽_p ⊗ᴸ 𝔽_p`; `∏ ℤ[−i]`; `ℤ → ℚ`; empty family; classical square of `ℤ → 𝔽_p` | `∏_K ℚ/ℤ` not u-small; `π₀ = π₁ = 𝔽_p`; 0-truncated, `π_{−i} = ℤ`; `ℚ ⊗ 𝔽_p = 0`; covers 0 only; source `𝔽_p ⊗ᴸ 𝔽_p`, target `𝔽_p` | holds | none |
| 1.1–1.2 | free `E∞` object on `ℤ[0]`; `ℤ × ℤ`; pushout of `ℤ → 𝔽_p` twice | `π₁(ℤ_{hΣ₂}) = ℤ/2`; product `ℤ²` against coproduct ℤ; both sides `𝔽_p ⊗ᴸ 𝔽_p`, ordinary pushout gives `𝔽_p` | holds | none |
| 1.3–1.4 | `ℤ → ℤ[1/p] × ℤ_p`; k over `k[ε]/(ε²)`; `ℤ/p` over ℤ; almost-compactness on unbounded-below truncated objects | every prime lies under one; `Tor_i = k` for all i; dual `ℤ/p[−1]`; compact objects of `Mod_{≤n}` are retracts of `τ_{≤n}` of perfect modules, so bounded below | holds | none |
| 1.5 | (ℤ, ℚ), (ℤ, ℤ[1]), (ℤ, ℤ²); identity augmentation; `ℤ → 𝔽_p` | not dualizable; invertible; rank 4 → 1; comonadic; `ℚ ↦ 0`, not conservative | holds; HA line 5813–5816 and Theorem 4.7.5.2 dualized | none |
| 2.1–2.4 | `Spec 0` against ∅; `Bℤ/2 × Spec 𝔽₂`; `ι_!` of `Spec 𝔽_p ×_ℤ Spec 𝔽_p` | point against empty at the zero ring; `H¹ = 𝔽₂` with every evaluation in `π₋₁A = 0`; `Spec 𝔽_p` against `Spec(𝔽_p ⊗ᴸ 𝔽_p)` | holds | none |
| 2.5 | `(Bℤ/2)^♮` at ℝ and ℝ × ℝ; `ℤ → ℤ[1/p] × ℤ_p`; `{ℤ[1/n]}`; isomorphism as a singleton cover | 2 components, `π₁ = ℤ/2`, `(ℤ/2)²`; `ℤ_p` uncountable; n = 2, 3 cover, n = 2 does not; surjective, flat, finitely presented | holds | none |
| 3.1 | `𝔽_p → 𝔽_p ⊗ᴸ 𝔽_p`; `Spec 𝔽_p ⊔ Spec ℤ[1/p] → Spec ℤ`; constant `𝔽_p` cosemisimplicial ring; `AnRing^op` as a site | `π₁(B ⊗ B) = 𝔽_p²` against `𝔽_p`; `𝔽_p ⊗ ∏ R_i = 0`; `L₁ = 𝔽_p` or `𝔽_p ⊗ᴸ 𝔽_p`; mapping space with `π₁ = 𝔽_p` | statements hold; supplier of L wrong | S01 |
| 3.2 | identity; `ℤ → 𝔽_p`; `ℤ → ℤ[1/2] × ℤ[1/3]`; codegeneracies of a Čech nerve | `Mod_A`; ℚ killed; fibre `ℤ[1/6][−1]`, `Ext²(ℤ[1/6], ℤ) = 0`, no retraction, index 2; multiplication `B ⊗ B → B` not flat, so transitions on `τ_{≤n} Mod^cn` are `τ_{≤n}` of extension, coface squares still adjointable | holds | none |
| 3.3–3.4 | `∅ → Spec 0`; `U = Spec 𝔽_p ⊔ Spec ℤ → Spec ℤ` (not flat, split); `ℙ¹`; doubled plane; infinite disjoint unions | both `QCoh` zero; split Čech nerve, (c) holds with no flatness; cokernel `k·t⁻¹`; fibre two points; a map from `Spec R` meets finitely many components, split by idempotents | holds | none |
| 4.1–4.2 | `BG → Spec k`; sieve of `{ℤ[1/2], ℤ[1/3]}`; classical `Spec 𝔽_p → Spec ℤ` | `π₁ = G(O(G)) ∋ id ≠ 1`; value at `ℤ[1/2] × ℤ[1/3]` empty; pointwise value `𝔽_p` against `𝔽_p ⊗ᴸ 𝔽_p` | holds | none |
| 5.1–5.4 | `ℤ/2` on `Spec ℤ`; `⨿_ℕ ℙ¹`; `ℙ¹_ℤ` with `Spec ℚ → Spec ℤ`; closed point twice | degrees 0, −1; product; `ℚ[−1]`; not Tor-independent | holds; hypotheses equal §2.18's (`totalDirectImage` for qcqs f, `torIndependent_baseChange`) | none |
| 6.1–6.4 | `⊕_ℕ O`; `BG_m`; doubled plane; `Y = BGL_n` as `Y^♮`; `F = ⊕ ℤ[−i]` in 6.4 | flat, not perfect; graded groups; diagonal fibre `𝔸² ∖ 0`; fppf sheaf, hypothesis of (b) asks fpqc; `∏ π_{−i}` not finitary | statements hold; scope of (b) | S04 |
| 7.1–7.3 | `[∅/1]`; constant ℤ/2 at `ℤ × ℤ`; `O(G) = ℤ × 𝔽_ℓ`; ℤ acting trivially; `σ(x) = 2x` | `Spec 0`; 2 points against 4; `e + e′ − 2ee′` closed, `𝔽_ℓ` not flat; `H¹(ℤ; C) = C`; `x ≠ 2x`; forgetful functor has left adjoint `⊕_γ γ^*`, so it is left t-exact and detects coconnectivity | holds | none |
| 7.4 | trivial group; `G = ℤ/p` over `𝔽_p`; `X = ℙ¹`, `G = G_m`; doubled plane; fibre over `P = Spec ℚ(i)` | 5.3; `Extⁱ = 𝔽_p` both sides; f from `Spec(k[t] × k[t⁻¹])`, affine and flat; f not affine, (d) not asserted; fibre `Spec ℚ(i)` | holds; fibre identification unowned | S02 |
| 8.1–8.2 | `Spec A`; `ℙ¹`; `⨿_ℕ Spec ℤ`; `Spec 𝔽₂` | `C₀ = Perf(A)`; `O ⊕ O(−1)`; `∏ ℤ ≠ ⊕ ℤ`, diagonal fibre `Spec(Re)`; `Map(O, 0 ⊕ 0)` a point against two | holds; route input cited, not supplied | S03 |
| 8.3 | `A = k[ε]/(ε²)` diagonal; doubled line with `L_{±1}`; base change of `p_U` along `A → A′` | `Ω¹_{A/k} = k·dε` or `A·dε`; sections (1, t), (t, 1) with loci the charts (Stacks tag 0FXT); `g_* g^* p_{U*} F ≃ g_* p_{U′*} g′^* F` by the two projection formulas, `g_*` conservative | holds; hypotheses equal BZFN line 1189–1191 | none |
| 8.4 | `B(ℤ/p)` over ℚ; `K(ℤ, 2) × Spec ℚ`; `M = O[1]` on `BG_m`; twist of `ℙ¹` by `Spec ℚ(i)`; `lim¹` step | `Hⁱ = 0`; `H² = ℚ` with semisimple heart; `K(ℚ, 1)`; invariants `ℚe₁ ⊕ ℚ·ie₂`; `π₀ RΓ(τ_{≤m} M)` constant for `m ≥ 0`, fibre in degree m | holds; two fibres and one invertible object unowned | S02 |
| 8.5–8.6 | Γ = 1; ℤ/p over `𝔽_p`; S₃ over 𝔽₃; ℚ; regular representation | compact; `∏ 𝔽_p ≠ ⊕ 𝔽_p`; `H¹ = H² = 0` trivial coefficients, coinduced `𝔽₃` in every degree; `Hⁱ = 0`; `π₀ Map(k[Γ], ⊕ O[i]) = k` | holds | none |
| gap:chevalley-quasiprojective-quotient | `H = 1`; `H = GL_n`; pin | `GL_n` quasi-affine in `ℙ(M_n ⊕ k)`; point; pin has only the affine quotient for reductive H (`…/Quotient/Homogeneous/GeneralLinear.lean:56`), no quasi-projective quotient | precise, minimal, same slug in `design/plan.json` | none |
| gap:twist-quasiprojective | P trivial; `P = Spec ℚ(i)`, `X = ℙ¹` | `X_R` with `L_R`; `ℙ(ℚe₁ ⊕ ℚ·ie₂)` | precise, minimal, same slug in `design/plan.json` | none |

## Verified sound

- **Declarations read: 1.** One `import Mathlib` after `module`, no `set_option`, no sorry'd data, `theorem`, module docstring in the required form naming every headline that is not statable and its missing carrier. The `#check @name` comparison was made against the worker's elaborated signature (`scratch/signatures.md`), not by running Lean; nothing changed. Not padding: no one-tactic proof and no library near-match (`scratch/library-matches.md`; the pins have no compact objects of a triangulated category).
- **Headlines.** 3.2, 2.4 with 3.3, 4.2, 5.3, 6.2–6.3, 7.2–7.4, 8.1, 8.2–8.4, 8.5 with 8.6. Only 8.6 is statable at the pins and it is stated; the docstring names the others.
- **Targets read: 34** (1.1–8.6), each with its *Needs* line; no forward reference in a statement; every definition has at least three Checks (144 Checks read, about 75 recomputed for the table).
- **Pinned declarations: 55 of 55** `file:line` citations opened at the pins (45 distinct paths with a line, 10 "same file" lines); the statements of the eight used by 8.4–8.6 were read (`coindIso`, `groupCohomologyIsoEven`, `groupCohomologyIsoOdd`, `isCompletelyReducible_of_reductive`, `IsCompletelyReducible`, `iUnion_finiteSubcomodules_eq_univ`, `exists_isClosedImmersion_generalLinear`, the `GL_n` reductivity theorem).
- **Sibling citations checked.** On main: SchemeAndStackFoundations (24 names; §§1.16, 1.21, 1.22, 2.18 read), EnhancedDerivedSheaves (35 names; E2.6, E2.7, E5:presentability.3 read), DerivedModuleAlgebra (4 names, §§0.2, 1.E.0), ReductiveGroups (Layers 1 and 3 by heading), StableHomotopyKTheory §5.17 (definition read). At open heads: PrismaticCohomologyPartII §4.0 (16 names), LanglandsParameterStacks §§1.7–1.8 (read), HabiroCohomologyFoundations §§1.27–1.28 (read), HypercompletenessAndCoherence §§4.2.1, 9.3.2, 9.4.1, 11.5.1–11.5.3 (read; hypotheses (a)–(e) as the README states them), InfinityTopoi §§7.3.1, 7.3.4, 7.4.1, 7.4.2, 7.5.1, 7.6.1, 8.2.1, 8.3.1, 8.4.1, 9.1.1, 9.2.3 (read; the three route steps the README consumes are written there with their HTT lemmas). The citation resolver's 12 leads are all supplier names that exist on main.
- **Ownership by object.** `roadmaps grep` over main and the open heads for perfect stacks, SAG D.6.3.1, SAG 9.1.x, BZFN, HA 4.6.1.11 and 7.2.4.x, compactness in `Rep k`: no second owner; the three partial owners are the imports the README names. AnalyticStacks §1.5 (later in the merge order) restates the heart of `D(BG)`; it is a consumer and no supplier here. No declaration of another roadmap has the Lean name.
- **Locators verified in this pass: 24**, against the text: HA Definition 7.5.0.4 (p. 1374), Proposition 1.4.4.1(3), Remark 7.1.1.16 (p. 1206); HNR Theorem 1.1 and §4; HR-perf Introduction; SAG Proposition 9.1.5.1 (p. 736); GR-I Proposition 2.4.3 and Lemma 2.4.5 (printed p. 156); BZFN Definitions 3.1–3.2, Proposition 3.9, Lemma 3.20, Propositions 3.21 and 3.24, Corollaries 3.22–3.23 (pp. 17, 20, 23–25); HTT Definition 6.2.2.6 and Proposition 6.2.2.7; Stacks 0BQR, and, read for the first time, 0FXR (Definition 29.12.1), 0FXS (Lemma 29.12.2), 0FXT (Remark 29.12.3) and 02JR (Lemma 29.13.6), all as cited. The other locators rest on the two round-1 passes (133 and 120 verified) and were not opened again.
- **Policy.** `git diff --stat origin/main...HEAD` shows only the package folder; in `design/plan.json` only the `detail` of one gap changed. No pull-request number, process narrative, `lemma`, `set_option`, machine path or algorithm in the README or the Lean file.
- **Dependency check**, full output: `depcheck: 249 roadmaps, 2379 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- **Wording.** Twelve passages set beside their sources: the route of 7.4(d) (GR-I line 7883–7894), the definition and criterion of 8.2 (BZFN line 834, 970–972), the routes of 8.3(a)–(b), 8.3(c)–(d) and 8.4 (BZFN line 1151–1154, 1192–1199, 1202–1222), the two clauses of 8.5 (HNR line 436–439; HR-perf line 26–29), the étale definition of 3.1 (HA line 52701–52705), the criterion of 6.4 (SAG line 26798–26802), the ample family of 8.3(b) and its Check, the API of 8.6 (HA line 5813–5816) and the Lean docstring. Longest shared run: six words in the statement of BZFN Proposition 3.9, which can be written one way.
- **Arrangement.** SAG has the largest share. Its order is §§6.2.2–6.2.6, 6.3.4, 9.1, Appendices A and D; the roadmap's is Layer 2 ↔ §§6.2.2–6.2.3, Layer 3 ↔ D.6 with A.3 and A.5, Layer 4 ↔ §6.3.4, Layer 5 ↔ §6.2.4, Layer 6 ↔ §§6.2.5–6.2.6 with 9.1, and Layers 1, 7, 8 on HA, GR-I and BZFN. No run of layers follows a run of SAG sections, and the order is forced by 3.2 → 3.3 → 3.4 → 5.3 and 4.1 → 6.2 → 7.1. No table, figure or list of examples is taken over.

Source independence: 12 passages compared with 7 sources, none shared; largest share SAG, 67 of about 208 locators; contents compared with SAG: independent.

## Not verifiable

- Stacks tags 023Q and 0245 (*Descent*) and 06WG and 06WT (*Sheaves on Algebraic Stacks*): these chapters are not in the sources cache; the tags agree with SchemeAndStackFoundations' own citations on main.
- Elaboration: no Lean was run (read-only pass). The signature is the worker's; the repair report's statement that `HasIsos` is not synthesized for `fppfPrecoverage` was checked against the pinned files only.
- That EnhancedDerivedSheaves' `continuousDerivedInvariants` yields, for a finite discrete Γ, Mathlib's `groupCohomology` of the limit over BΓ of an object of `Fun(BΓ, Mod_k)`: the README marks it "Assumed" (`README.md:128`); the supplier's third Check states the finite case for derived invariants without naming Mathlib's functor.
- S01's reading of "small site" in EnhancedDerivedSheaves E2.7 as an ordinary site rests on that roadmap's Mathlib contract and on E2.6; it has no sentence excluding ∞-categorical sites.
- Ownership against open pull requests was checked through `roadmaps grep` and `roadmaps show` at their heads; of the families read that way, only AnalyticStacks and HabiroCohomologyFoundations are among the listed checkouts.

## Source issues

- none

## For the human reviewers

- **Scope.** The only Lean declaration (`Suggested.lean:79`) is a statement about Mathlib's `DerivedCategory (Rep k Γ)`; README 8.6 says its route uses none of the ∞-categorical layers. Whether it serves as the acceptance test is yours to decide.
- **Scope.** GR-I works over a field of characteristic zero (README References); it is cited for statements proved here over ℤ, each beside a SAG or HA locator.
- **Not tested.** Stacks tags 023Q, 0245, 06WG and 06WT were not read (chapters *Descent* and *Sheaves on Algebraic Stacks* absent from the cache); `sources.toml` says they were read through the sources service.
- **Licence.** The Stacks chapter *Morphisms of Schemes* was fetched in this pass through the sources service (open repository); the manifest records only the chapter *Derived Categories of Schemes* as the file.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "74646e9cd750b353293c625510cfc5fc8e4d7b70", "job": "RT-QuasicoherentSheavesOnPrestacks~2a", "model": "fable", "worker": "chris-x52"} -->
