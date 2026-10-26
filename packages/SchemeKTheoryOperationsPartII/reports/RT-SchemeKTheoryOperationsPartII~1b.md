<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1694#issuecomment-6407824920 -->
Red team round 1 pass b (claude) of 639903e

Verdict: needs_changes

1. **F01** (P2) AdicSpacesPartIII F0.6 is cited for a locally-free/finite-projective comparison it does not state

   **Location.** README.md:51 (AdicSpacesPartIII contract): "F0.6 … supplies association of finite modules, exactness, tensor and finite-projective comparisons." Consumed at README.md:322 (§1.3, "Γ identifies C^b_{Spf(A/J)}(Spf A) with the bounded complexes of finite projective A-modules") and README.md:381 (§1.5 (i)).

   **Claim.** The supplier provides that a coherent module M^Δ on Spf A is locally free of finite rank exactly when M is a finite projective A-module.

   **Witness.** AdicSpacesPartIII README lines 2833–2850, *affine-coherent-equivalence* (i)–(iv): exactness of M ↦ M^Δ, tensor and Hom compatibility, the inverse-system description and the equivalence with finite modules. Neither "locally free" nor "projective" occurs anywhere in F0.6 (lines 2729–3272) except in the unrelated projective-space statements of *projective-bundles-ample-serre*. Without this comparison the two presentations compared in §1.5 (i)–(ii) have different generators.

   **Repair.** In §1.5, before (i), add the target: "(0) For a finite A-module M, M^Δ is a locally free O_{Spf A}-module of finite rank if and only if M is projective. If M^Δ is locally free then, at the point x of a maximal ideal 𝔪, M ⊗_A 𝒪_{X,x} is free and A_𝔪 → 𝒪_{X,x} is a faithfully flat local map of noetherian local rings (§0.1), so M_𝔪 is free; hence M is projective. Conversely, if M_𝔪 is free then M_f is free for some f ∉ 𝔪 (finite presentation), so M ⊗ A_{f} is free on D(f)." Add Mathlib `Module.Projective` and `Module.Free` to the *Needs* line of §1.5, and replace "tensor and finite-projective comparisons" at README.md:51 by "and tensor comparisons; the locally-free/projective comparison is §1.5 (0)". Tested on A = ℤ_p: M = ℤ_p (free, M^Δ = 𝒪) and M = 𝔽_p (not projective; the stalk 𝔽_p is not free over ℤ_p, so 𝔽_p^Δ is not locally free).

2. **F02** (P3) §1.8's scheme comparison needs the regular supported dévissage, which is §2.1 or a supplier section not in *Needs*

   **Location.** README.md:452 (§1.8): "On a regular noetherian scheme it is the parent's K-module pairing on G₀ (SchemeKTheoryOperations §6.1)"; README.md:474 (Check 4).

   **Claim.** The Tor pairing K′₀(Y) × K′₀(Z) → K′₀(Y ∩ Z) is the pairing of SchemeKTheoryOperations §6.1.

   **Witness.** SchemeKTheoryOperations §6.1 (head of its pull request) exposes `gSupportPairing : K(X on Y) ∧ G(X on Z) → G(X on Y ∩ Z)`, a K × G pairing; the pairing here is G × G → G. Identifying them needs K₀^Y(X) ≅ K′₀(Y), which is §2.1 (a later target) or the regular supported Cartan equivalence of SchemeKTheoryOperations §3.5 ("For regular Noetherian X, 𝕂(X on Z) ≃ G(Z)"); §1.8 *Needs* lists neither.

   **Repair.** Replace the sentence at README.md:452 by "On a regular noetherian scheme, under the supported Cartan equivalence 𝕂₀(X on Y) ≅ G₀(Y) of SchemeKTheoryOperations §3.5, it is the degree-zero K × G pairing `gSupportPairing` of §6.1." Add "SchemeKTheoryOperations §3.5" to the *Needs* line of §1.8 and reword Check 4 accordingly. Instance: X = Spec ℤ_p, Y = Z = V(p): the Tor pairing gives [𝔽_p] − [𝔽_p] = 0; under Cartan [𝔽_p] ↔ [K(p)], and K(p) ⊗^L 𝔽_p = 𝔽_p ⊕ 𝔽_p[1] has class 0. Both sides agree.

3. **F03** (P3) Inverse images of closed formal subschemes and flat formal morphisms are used but owned nowhere

   **Location.** README.md:51: "F0.4 supplies adic, finite-type and proper morphisms, inverse images and coherent-ideal closed formal subschemes"; the construction `g^{-1}Y := V(g^*𝒥·O_{X′})` is used at README.md:322 (§1.3), §1.4, §1.7, §3.4 and §4.7; "pullback along flat morphisms" at README.md:275 (§1.1) and "flat pullback" in §1.6.

   **Claim.** AdicSpacesPartIII F0.4 supplies the inverse image of a closed formal subscheme, and flatness of a morphism of formal schemes is a supplied notion.

   **Witness.** F0.4 (AdicSpacesPartIII README lines 2075–2450) has exactly the targets *adic-morphism-of-formal-schemes*, *proper-formal-morphism* and *closed-formal-subscheme*; "inverse image" or "preimage" of a closed formal subscheme occurs nowhere in F0.1–F0.9, and *formal-fibre-product* (line 1938) does not identify the fibre product with a closed immersion as a closed formal subscheme with a named ideal. No supplier section defines a flat morphism of formal schemes.

   **Repair.** In §0.6, after the definition of formal support, add: "For a morphism g : X′ → X of locally noetherian formal schemes and Y = V(𝒥), the inverse image is g^{-1}Y := V(g^*𝒥·O_{X′}); its ideal is coherent as the image of the coherent g^*𝒥 (AdicSpacesPartIII F0.8, `FormalScheme.cohPullback`) in the coherent ring O_{X′}. On Spf A′ → Spf A it is Spf(A′/JA′), and (g∘h)^{-1}Y = h^{-1}(g^{-1}Y). A morphism of formal schemes is flat when every stalk map is flat; the underived pullback of coherent modules along it is exact." Delete "inverse images and" at README.md:51. Checks: g : Spf ℤ_p⟦t⟧ → Spf ℤ_p, Y = V(p): g^{-1}Y = Spf 𝔽_p⟦t⟧; i : Spec 𝔽_p → Spf ℤ_p: i^{-1}V(p) = Spec 𝔽_p (full support), as in §1.3's Check.

4. **F04** (P3) §4.5 uses χ(X, F ⊗^L G) outside the hypotheses under which §4.3 defines it

   **Location.** README.md:778 (§4.5): "X a regular locally noetherian formal scheme over Spf A"; README.md:730 (§4.3): "X a regular locally noetherian formal scheme of finite dimension with a noetherian exhaustion".

   **Claim.** χ(X, F ⊗^L G) is defined for the data of §4.5.

   **Witness.** §4.3 defines the pairing only for X of finite dimension with a noetherian exhaustion; §4.5 drops both and *Needs* §4.3 for the definition. The proof route of §4.5 says the finitely many local Tor bounds suffice, but the statement does not say so.

   **Repair.** After "G any coherent 𝒪_X-module" at README.md:778 add: "Here χ(X, F ⊗^L G) := Σ_j (−1)^j deg_{W_F}[Torⱼ(F, G)] (dévissage classes), a finite sum because Torⱼ vanishes for j > max over the finitely many x ∈ W_F of dim 𝒪_{X,x}; when X satisfies the hypotheses of §4.3 this is that section's pairing." Instance: X = ⊔_{n≥1} Spf ℤ_p⟦t_1, …, t_n⟧ (regular, locally noetherian, infinite dimension, no uniform Tor bound), F = 𝔽_p at the closed point of the n = 2 component, G = 𝒪_X: the sum stops at j = 2 and χ = 1 = length · 1 · rank.

5. **F05** (P3) Finiteness of proper coherent cohomology is cited to SchemeAndStackFoundations §2.6, which itself records JacobianChallenge Layer C as its supplier

   **Location.** README.md:59 (SchemeAndStackFoundations contract): "finiteness of coherent cohomology on schemes proper over a noetherian ring"; README.md:691 (§4.1 *Needs*): "SchemeAndStackFoundations §2.6 (finite coherent cohomology of proper schemes, bound over an affine base)".

   **Claim.** SchemeAndStackFoundations §2.6 owns the finiteness theorem.

   **Witness.** SchemeAndStackFoundations README line 3452: the finite-module statement is "supplied by JacobianChallenge `Cohomology/Proper.lean`", and line 5464 repeats the supplier direction. JacobianChallenge README lines 143–153 (Layer C) state and own it: H^q(X, F) is a finite A-module for X proper over noetherian A, with coherent R^q f_*.

   **Repair.** At README.md:59 replace the quoted clause by "affine acyclicity, `serre_affineness_criterion` and the affine-base bound `QCoh.higherDirectImage_vanishing`; finiteness of H^q(X, F) for X proper over a noetherian ring is JacobianChallenge Layer C (`Cohomology/Proper.lean`), coherence of R^q f_* its `Cohomology/Pushforward.lean`". At README.md:691 replace the SchemeAndStackFoundations §2.6 item by "SchemeAndStackFoundations §2.6 (affine-base bound); JacobianChallenge Layer C (finite A-modules H^q(X, F) for X proper over noetherian A)". Add the JacobianChallenge line to the Layer 4 Dependencies. JacobianChallenge is on main.

6. **F06** (P3) Duplicated Checks

   **Location.** The Checks blocks at README.md:114 (§0.2), 147 (§0.3), 192 (§0.5), 222 (§0.6), 252 (§0.7), 292 (§1.1), 368 (§1.4), 440 (§1.7), 469 (§1.8), 524 (§2.2), 586 (§2.5), 716 (§4.2), 747 (§4.3).

   **Claim.** Each Check is a distinct test.

   **Witness.** In each listed block the later bullets restate earlier ones with the same instance and value: §0.2 bullets 7–10 repeat 1, 2, 5, 6; §0.3 bullets 6–7 repeat 2–3; §0.5 bullets 5–7 repeat 1, 4, 3; §0.6 bullets 5–6 repeat 2, 1; §0.7 bullets 6–8 repeat 1–2, 4, 5; §1.1 bullets 6–9 repeat 1, 2, 3, 5; §1.4 bullets 6–8 repeat 1, 2, 4; §1.7 bullets 5–6 repeat 1–2 and bullet 7 repeats 3 apart from its interchange-sign clause (merge that clause into bullet 3); §1.8 bullet 5 repeats 1–2 and bullet 7 repeats 3 and 2; §2.2 bullets 6–7 repeat 1–2; §2.5 bullets 5–6 repeat 2, 1; §4.2 bullets 6–8 repeat 1–3; §4.3 bullets 6–9 repeat 1, 2, 4, 1 and bullet 10 repeats 5.

   **Repair.** Delete the later copies named above (keep the first occurrence of each instance). Every listed section keeps at least three distinct Checks: §0.2 keeps 6, §0.3 5, §0.5 4, §0.6 5, §0.7 5, §1.1 5, §1.4 5, §1.7 4, §1.8 5, §2.2 6, §2.5 5, §4.2 6, §4.3 5.

7. **F07** (P3) Two line locators point past the cited statement

   **Location.** README.md:234 (§0.7) and the EGA-I reference bullet: "EGA-I lines 8098–8114 and 8190–8207" for (10.10.2) and (10.10.8); README.md:608 (§3.1): "Lemma B.1 and footnote 11, p. 974; ZHANG21 lines 4607–4626".

   **Claim.** The line windows contain the cited statements.

   **Witness.** EGA-I line 8186 begins Proposition (10.10.8) and its proof ends at line 8192; lines 8193–8207 are Corollaire (10.10.9) and Proposition (10.11.1). ZHANG21 footnote 11 (the cokernel remark) is at lines 4643–4644, outside 4607–4626.

   **Repair.** Replace "8190–8207" by "8186–8192" at README.md:234 and in the EGA-I reference bullet ("§10.10 pp. 201–203 (line 8098)" may stay); replace "ZHANG21 lines 4607–4626" at README.md:608 by "ZHANG21 lines 4607–4626 and 4643–4644".

All file references are to `packages/SchemeKTheoryOperationsPartII/README.md` unless another file is named. Supplier line numbers refer to the supplier's README on main (AdicSpacesPartIII, SchemeAndStackFoundations, JacobianChallenge) or at the head of its new-roadmap pull request as printed by `roadmaps show` (SchemeKTheoryOperations, GeneralAlgebraicKTheory).

## Verified sound

**Dependency direction.** Exact output of the check:

```text
depcheck: 56 roadmaps, 644 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Internal *Needs* references were checked mechanically: every §a.b cited in a *Needs* line precedes the citing section (the only apparent exceptions are supplier section numbers such as SchemeAndStackFoundations §0.17 or SchemeKTheoryOperations §6.12).

**Suggested.lean.** 0 declarations (module docstring and an empty namespace); imports exactly `Mathlib`; no `set_option`, `lemma`, `#eval`, placeholder or sorry'd data. The not-statable claim was checked at the pins: neither Mathlib nor Tau Ceti contains a formal scheme, formal spectrum or `Spf` carrier (grep over both trees returns nothing), and no Cohen–Macaulay predicate exists in the pinned Mathlib. The 13 headlines listed in the docstring all have a formal-scheme carrier in their statement. The affine local-algebra shadows (the stalk form of §3.2, the module form of §4.5) are special cases on different carriers; the acceptance rules forbid substituting them, so the empty file is correct. The signature comparison by `#check @name` is vacuous (no declaration). No fully qualified name collides with another roadmap's Suggested.lean.

**Counts.** Declarations read: 0 of 0. README targets read: 31 of 31 (every line of the README). Locators verified against the cached texts: 34 (ZHANG21 six windows at lines 4511–4603, 4545–4560, 4563–4575, 4576–4603, 4607–4626, 4629–4680; LIZHANG22 lines 336–372, 965–983, 1811–1814, 2942–2951; EGA-I lines 2849–2892, 7294–7299, 8098–8114, 8138–8178, 8186–8192; EGA-III1 lines 4444–4507; STACKS tags 00KW, 0BBZ, 00L6, 00M0, 00M3, 05GI, 02JN, 00NA, 00NP, 00O7, 0AFS in algebra, 062F, 07NV, 07NX, 07NY in more-algebra, 02KH in coherent, 0AYR, 0AYX in varieties, each at the line the README gives). All support the claims they are cited for except the two window slips of R07. Checks recomputed: 47 (table below). Sibling and supplier citations resolved: 46 (SchemeKTheoryOperations §§1.5, 1.6, 2.1, 2.2, 2.3, 2.4, 2.5, 3.1, 3.4, 3.5, 4.4, 4.5, 6.1, 6.12 at #1229; GeneralAlgebraicKTheory §4.8 at #1212; GrothendieckEulerForms Standing conventions, Layers 2–3; AdicSpacesPartIII F0.1 *completed-localization*, F0.2 *spf-morphism-correspondence*, F0.4 *proper-formal-morphism*, *closed-formal-subscheme*, F0.6 *associated-formal-module*, *affine-coherent-equivalence*, *coherent-as-inverse-system*, *formal-direct-image-comparison*, F0.8 *coherent-formal-module-properties*; AdicSpacesPartII R0.1a, R0.1b; SchemeAndStackFoundations §§0.7, 0.16, 0.17, 0.18, 2.2, 2.6, 3.3, 4.7, 4.13, 5.7; DerivedModuleAlgebra §0.K.1; EnhancedDerivedSheaves §§0.3, 0.4, E1.4, E1.5, E1.6; JacobianChallenge Layer C). Pinned declarations found at the stated files: 10 Tau Ceti (`ExactK0`, `AbelianK0`, `AbelianK0.of`, `finiteModulesExactStructure`, `finiteProjectiveModulesExactStructure`, `cartanMap`, `cartanEquiv`, `cartanMap_bijective`, `ExactStructure.IsResolving.resolutionEquiv`, `SheafOfModules.tensorProduct`) and 15 Mathlib (`ringKrullDim`, `Ideal.height`, `IsRegularLocalRing`, `IsRegularRing`, `RingTheory.Sequence.IsRegular`, `IsAdicComplete`, `AdicCompletion`, `Ideal.jacobson`, `Module.support`, `Module.length`, `Submodule.annihilator`, `Module.Flat`, `Module.Projective`, `HomologicalComplex`, `CategoryTheory.Tor`). `cartanEquiv` carries the finite-resolution hypothesis exactly as the README says; `IsRegularRing` is regularity of every localisation at a prime, so §0.3's "Spf A regular iff A regular" is correct via Stacks 0AFS as its proof route says.

**Declared gap.** `gap:proper-formal-coherent-direct-images` has the same slug, supplier (AdicSpacesPartIII, F0.6) and `needs` sentence in `design/plan.json` and README.md:55. It is precise (hypotheses: adic proper finite type, locally noetherian, coherent F, target ideal of definition) and minimal: it asks exactly for EGA-III1 (3.4.2)–(3.4.3) (lines 4471–4494), and the affine acyclicity the earlier version requested is now derived from *formal-direct-image-comparison* at the identity of Spec B (lines 3206–3225 of the supplier: for affine Y the composite H^n(X̂, F̂) ≅ H^n(X, F)^∧ is stated), with the witness B = k⟦t⟧, M = B/(t²) recomputed: H⁰ = M of length 2, H¹ = 0.

**Ownership.** `roadmaps grep` over main and all 367 open roadmap pull requests for "formally supported", "Grothendieck group … formal scheme", "Spf … K₀", "Gillet" and "Euler–Poincaré" returns no second owner of supported formal K₀, the formal Tor pairing, the Euler degree or the formal proper pushforward (hits are Arakelov, étale-cohomology and topology roadmaps on unrelated objects). None of the sibling checkouts named in the brief contains these objects. GrossZagierAndArithmeticHeightsPartII (design stage, later in the merge order) cites this roadmap at layer level ("FK.0–FK.4"), consistent with its Downstream consumers paragraph. No pull-request numbers or process narrative occur in the README or the docstring.

**Adversarial pass (values computed).** Dimension conventions use `dim 𝒪_{X,x}`; lengths are over the DVR A.

| Statement | Instances tried | Values computed on each side | Result / change |
| --- | --- | --- | --- |
| §0.1 three local rings, isomorphisms mod Iⁿ, same completion | A = ℤ_p⟦t⟧, x closed; A = ℤ_p⟨t⟩, 𝔭 = (p); A = k[t], I = 0 | all three rings equal ℤ_p⟦t⟧; A_(p) DVR, maximal ideals (p, f) height 2; stalk = k[t]_(t), completed localisation (I = 0) = k[t]_(t), 𝔪-adic completion k⟦t⟧. m′ = mR′ follows from R/I ≅ R′/IR′, so R/mⁿ ≅ R′/m′ⁿ | holds |
| §0.2 dim, codim, monotonicity | Spf ℤ_p⟦t⟧: V(t), V(t−p), V(p,t), V(t(t−p)); 𝔸¹_k generic point; ∅ | 2 − 1 = 1, 1, 2 − 0 = 2, 2 − 1 = 1; stalk dim 0 vs neighbourhood dim 1; ⊥ and ⊤; Z ⊆ Z′ gives dim 𝒪_Z ≤ dim 𝒪_{Z′} pointwise, so codim Z′ ≤ codim Z | holds |
| §0.3 regular / CM | k⟦x,y⟧/(xy); k⟦x,y,z,w⟧/((x,y)∩(z,w)); zero ring | 𝔪 needs 2 generators, dim 1; dim 2, depth 1; Spf 0 = ∅, vacuous | holds |
| §0.4 codim = min height on CM; d − dim Z | Spf ℤ_p⟦t⟧ with V(t), V(p,t); Spf k⟦x,y,z⟧/(xz,yz) with L = V(x,y) | 1 = 1, 2 = 2; non-CM: height 0 but 2 − 1 = 1 | holds; non-example confirmed |
| §0.5 regular immersion, Cartier, local constancy | V(t²), V(t−p) in Spf ℤ_p⟦t⟧; closed point of node; identity; ∅ | t² nonzerodivisor; ≅ Spf ℤ_p; depth 1 < 2 generators; empty sequence, codim 0; vacuous | holds |
| §0.6 formal support | 𝒪 on Spf ℤ_p with Y = V(p); J = 0; J = A; (A/Jⁿ)^Δ, n = 0 | 𝒪 not p-power torsion though |Supp| = |Y|; everything; only 0; zero module. Jᵃ, Kᵇ kill factors ⇒ (J+K)^{a+b−1} kills tensor | holds |
| §0.7 Tor sheaves | Spf ℤ_p⟦t⟧ pairs (t),(t−p) and (t),(t); Spf ℤ_p residue fields; k[ε]/ε² | Tor₁ = 0, Tor₀ = 𝔽_p; Tor₁ = 𝒪/(t); Tor₁^{ℤ_p}(𝔽_p,𝔽_p) = 𝔽_p vs Tor₁^{𝔽_p} = 0; Torⱼ = k for all j, no finite sum | holds |
| §1.1 K′₀ | Spf ℤ_p; node; Spf k; ∅; thickening system ℤ/p^{n+1} | ℤ by rank, [𝔽_p] = 0; ℤ², [R] = (1,1), [k] = 0 (0 → k⟦y⟧ →y k⟦y⟧ → k → 0); ℤ; 0; length generator ↦ 0 | holds |
| §1.2 dévissage | k[ε]/ε²; V(pⁿ) ⊂ Spf ℤ_p; Y = ∅ | [𝒪] = 2[k]; [ℤ/pⁿ] = n[𝔽_p]; 0 | holds |
| §1.3 strict supported complexes | [𝒪 →p 𝒪], [𝒪 →0 𝒪] on Spf ℤ_p; pullback to Spec 𝔽_p; Koszul of non-regular list | homology 𝔽_p (supported) vs 𝒪 ⊕ 𝒪[1] (not); [𝔽_p →0 𝔽_p] with full support; Koszul homology killed by the ideal | holds; pullback argument via contractibility at primes off V(J) checked |
| §1.4 K₀^Y | K₀^∅; Spf A local; [𝒪 →p 𝒪]; [𝒪 →id 𝒪] | 0; ℤ by rank; nonzero, h = 1; (1,1) without quasi-isomorphisms, 0 with | holds |
| §1.5 affine transport | A = ℤ_p⟦t⟧, J = (p,t); J = A; field, J = 0; k⟦t⟧, J = (t) | ℤ generated by K(p,t); 0 = 0; ℤ = ℤ; class 1 with support, 0 in full support. (iv): min height = §0.4 codim for regular A | holds; locally-free/projective input unowned (R01) |
| §1.6 homology map | node full support; shift; Koszul of regular sequence; Y = ∅ | r ↦ (r,r), (1,0) unreached; 1 ↦ −1; [𝒪/(f)]; 0 | holds |
| §1.7 cup product | K(t) ∪ K(t−p), K(t) ∪ K(t) on Spf ℤ_p⟦t⟧; unit; zero; degree-one swap | h = [𝔽_p] = 1; h = [𝒪/(t)] − [𝒪/(t)] = 0 while tensor of homologies has class 1; a; 0; sign −1 | holds |
| §1.8 Tor pairing | V(t)·V(t−p), V(t)·V(t) on Spf ℤ_p⟦t⟧; unit; rank 2 free with k; Künneth for h(a ∪ b) | 1; 1 − 1 = 0; b; 2[k]; Σ(−1)^{p+q+r}[Tor_p(H_q E, H_r F)] = h(E)·h(F) with finitely many terms | holds; scheme identification imprecise (R02) |
| §2.1 regular dévissage | Spf ℤ_p⟦t⟧, Y = V(p,t); node; Y = ∅; field | ℤ generated by K(p,t); ℤ → ℤ² not surjective; 0 → 0; 1 ↦ 1 | holds |
| §2.2 filtrations | Spf ℤ_p⟦t⟧, Y = V(p,t): F², F³; Y = V(t): F¹, F², Gr¹; Spec k; topological codimension | F² = ⊤, F³ = ⊥ (codim ≤ 2 for nonempty Z); F² = image of ℤ/pⁿ classes = 0, so Gr¹ ≅ ℤ with [K(t)] ↦ 1; F⁰ = ℤ, F¹ = 0, F₀ = ℤ, F₋₁ = 0; every class in F⁰ only | holds |
| §2.3 F^{d−i} ↔ F_i | Spf ℤ_p⟦t⟧ (d = 2), Y = V(t), i = 1, 0; Spec k, i = −1; i = d + 1 | F¹ ↔ K′₀(Spf ℤ_p) = ℤ, F² ↔ F₀ = 0 ([𝔽_p] = 0); 0 = 0; F⁻¹ full ↔ F_{d+1} full | holds |
| §2.4 rational multiplicativity | Spf ℤ_p⟦t,u⟧: K(t) ∪ K(tu), K(t) ∪ K(u); field | K(t,tu) ≅ K(t) ⊗ K(0) = K(t) ⊕ K(t)[1], class 0 ∈ F²; K(t,u) with support V(t,u) of codim 2; ℚ·ℚ ⊆ ℚ, higher terms 0 | holds (transport of SchemeKTheoryOperations §6.12 to Spec A) |
| §2.5 exhaustion | ⊔_ℕ Spf ℤ_p by finite unions and reordered; one-member; support in one component | ∏ ℤ both ways, canonically; recovers noetherian groups; ℤ not ∏ ℤ | holds |
| §3.1 closed union | node X = V(x) ∪ V(y); disjoint; X₁ = X₂ = X; Tor₁(E, 𝒪_{X_k}) at primes off V(J₁+J₂) | cokernels ℤ² ≅ ℤ ⊕ ℤ with overlap map 0; additivity; all cokernels 0; J₁J₂ ⊆ J₁ ∩ J₂ = 0 kills one factor, so Tor₁ = 0 there | holds |
| §3.2 expected-dimension Tor vanishing | V(t), V(t−p); Serre's example; self-intersection | Tor₁ = 0; 𝒪_{Z₁∩Z₂} = k⟦x,y⟧/(x²,xy,y²) length 3, χ = 2 so Tor₁ ≠ 0 (Z₂ not CM); codim 1 ≠ 2, Tor₁ = 𝒪/(t) | holds; pure-dimension hypothesis of the source is indeed unused |
| §3.3 vanishing on Y modulo Y ∩ Y′ | Y′ = ∅; V(s,t), V(s,t−p) in Spf ℤ_p⟦s,t⟧; (xy, xz) in k⟦x,y,z⟧ | reduces to §3.2; same point, overlap Spec 𝔽_p; height 1 with 2 generators, not regular. Prime-level argument: minimal primes Q of I_Y B have ht ≥ m by the CM formula and ≤ m by Krull, so f̄ is B_P-regular for P ⊇ I_Y, P ⊉ I_{Y′} | holds |
| §3.4 Cartier pullback | D → X itself; identity; V(p) → Spf ℤ_p⟦t⟧ | H₁ = 𝒪_D(−D), h = [𝒪_D] − [𝒪_D(−D)]; H₁ = 0; t nonzerodivisor in 𝔽_p⟦t⟧, class [k] | holds |
| §4.1 factorisation and properness | P¹_{𝔽_p}; Spec ℤ/p³; 𝔸¹_k; Spf ℤ_p | n = 1; n = 3; H⁰ = k[t] infinite length; not a scheme. I·𝒪_W nilpotent so π is adic; properness insensitive to the thickening W₀ → W | holds |
| §4.2 Euler degree | Spec A/ϖⁿ; P¹_k with 𝒪(m), m = −2, 0; Spec k′; ∅ | n; m + 1 (−1, 1); f; 0 | holds |
| §4.3 derived Euler pairing | ⟨V(t), V(t−pⁿ)⟩, n = 0, 1, 2; ⟨V(p,t), V(t)⟩; Y = Z = V(t); F = A/ϖ² on Spf A | 0, 1, 2 (ℤ_p/pⁿ, Tor₁ = 0); Tor₀ = Tor₁ = 𝔽_p, 1 − 1 = 0; W = Spf ℤ_p not a scheme, undefined; dévissage degree 2 | holds |
| §4.4 base change | A′ = A[ϖ^{1/2}], W = Spec k; k′ of degree f; unramified completion | length_{A′}(k ⊗ A′) = e = 2; f and 1; e = 1. length_A M = f·length_{A′} M by composition series | holds |
| §4.5 length × rank | ⟨V(p,t), V(t)⟩, ⟨V(p,t), X⟩; F = k(x), G = 𝒪^r, r = 0,1,2, [k(x):k] = 2 | 1·1·0 = 0, 1·1·1 = 1; 0, 2, 4. Σ(−1)^j dim Tor_j(k, G_x) = alternating rank of a finite free resolution = rank | holds; definition scope (R04) |
| §4.6 Cartier pairing | C ⊄ D transverse in r points; zero section of 𝒪(a) with a = −1, 0, 1; node X with D = V(p), F = 𝔽_p | r; a (𝒪_X(D)|_C ≅ 𝒪(a), χ(𝒪_C) − χ(𝒪(−a)) = a); 1 − 1 = 0 without regularity | holds |
| §4.7 pushforward, projection, degree scaling | identity; Spf ℤ_p⟦s⟧ → Spf ℤ_p⟦t⟧, t ↦ s²; Spf k⟦t⟧ → Spec k; Čech bound | id; 𝔽_p⟦s⟧/(s²) of length 2 = 2·1; k⟦t⟧ not finite, map not adic; N affine opens give R^q = 0 for q ≥ N | holds |

## Not verifiable

- The published JAMS pagination of LIZHANG22 was not consulted; the README states that all locators use arXiv v3 numbering, which is what the cache holds.
- Gillet–Soulé 1987 is referred to only through ZHANG21 and SchemeKTheoryOperations; it is not in this roadmap's manifest and was not opened.
- No Lean was run (forbidden by the brief); the file declares nothing, so the elaborated-signature comparison is vacuous.
- The invertibility of the projection transformation in §4.7 relies on EnhancedDerivedSheaves §0.4's explicitly conditional statement ("an equivalence only after its geometric hypotheses have been proved"); the roadmap takes on that proof, which is the correct division, but its feasibility was not checked beyond the proof route.
- GrossZagierAndArithmeticHeightsPartII is at the design stage and cites this roadmap only by layer ("FK.0–FK.4"); its per-target requirements were not matched.

## Source issues

- **Error** in LIZHANG22 at §1.8, arXiv v3 printed page 9 (line 370): the source defines a proper formal morphism by properness of the induced map on reduced schemes and asserts the alternating higher-direct-image homomorphism on K′₀; it should require EGA III (3.4.1) properness (adic, finite type, proper reduction), since for Spf k⟦t⟧ → Spec k the reduced map is proper but π_*𝒪 = k⟦t⟧ is not coherent; affects a stated result (the direct-image homomorphism as defined), not the paper's applications, whose morphisms are adic of finite type.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "639903ee1079ee74562718857c659edaf8989582", "job": "RT-SchemeKTheoryOperationsPartII~1b", "model": "fable", "worker": "chris-k"} -->
