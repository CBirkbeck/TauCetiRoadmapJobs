# Review of ClassicalAdicEtaleCohomologyPartII (pull request #1549 at c1ef9e9)

**Verdict:** needs changes

This is a full review of the roadmap folder at head c1ef9e9. The folder has not changed since the previous review read the same head (0 changed lines), so the one blocking finding of that review stands unrepaired and is raised again below as R01. Every passage of the README and the Lean file was reviewed again; the sampled sources were reopened at their locators; the adversarial table and the supplier resolution were recomputed rather than carried over.

## R01 (P1) — Five AdicSpacesPartV contracts are stated in the README but not declared where the intake reads them

**Location:** `TauCetiRoadmap/ClassicalAdicEtaleCohomologyPartII/README.md:74`, `:82`, `:90`, `:98`, `:106` ("What AdicSpacesPartV must provide (gap:rigid-zariski-geometry) …", "(gap:rigid-normalization-extension)", "(gap:rigid-smooth-loci)", "(gap:weakly-shilov-points)", "(gap:rigid-resolution)"); `packages/ClassicalAdicEtaleCohomologyPartII/design/plan.json`, top-level `gaps`.

**Claim:** Layer 7 consumes rigid Zariski geometry, normalization and bounded extension, smooth loci, weakly Shilov points and rigid resolution from AdicSpacesPartV through five exact contracts with RZ.0, RZ.1, RZ.2, RZ.4 and RZ.5 destinations (§7.1, §7.2, §7.3, §7.4 and §7.5 `*Needs:*` lines, README lines 1196, 1212, 1228, 1248, 1267).

**Witness:** The README carries 18 distinct `gap:` slugs; the plan's `gaps` list carries 13. The set difference is exactly `rigid-zariski-geometry`, `rigid-normalization-extension`, `rigid-smooth-loci`, `weakly-shilov-points`, `rigid-resolution`. AdicSpacesPartV exists neither on main nor at any open roadmap pull-request head (roadmap service and merge order checked: it is line 207 of the merge order as a board design only, immediately before this roadmap at line 208), so the five RZ citations resolve to nothing as supplier sections and are valid only as declared gaps. A contract counts as declared only when the plan's `gaps` has the same slug; these five do not, so §§7.1–7.5 rest on prerequisites that no roadmap, library pin or declared gap owns. The two AdicSpacesPartV slugs that are registered also disagree between the two places: the plan records `finite-branched-covers` at RZ.1 and `proper-generic-smoothness` at "RZ.2 and RZ.4", while the README (lines 118–122) places them at RZ.5 and RZ.4.

**Exact repair:** Add the five entries to the plan's top-level `gaps`, each with `supplier` AdicSpacesPartV, the `section` the README names (RZ.0 for rigid-zariski-geometry; RZ.1 for rigid-normalization-extension; RZ.2 for rigid-smooth-loci; RZ.4 for weakly-shilov-points; RZ.5 for rigid-resolution) and a `needs` sentence equal in content to the README contract (keep rigid-resolution's nonproper, every-characteristic-zero-K and nonreduced-matching-object clauses). Update the two existing entries' `section` fields to RZ.5 and RZ.4 so that both places agree. Change nothing else in `plan.json`; no README edit is needed for this finding. Test: the set of README `gap:` slugs minus the plan's `gaps[*].slug` must be empty, and the `section` of every AdicSpacesPartV entry must equal the destination the README gives it.

## R02 (P3) — The root-duality statement type-checks only through unfolding of the `ModuleCat` carrier

**Location:** `TauCetiRoadmap/ClassicalAdicEtaleCohomologyPartII/Suggested.lean:70`–`:82` ("τ (monomialClass p n e) = …", "adj x y = τ (Mul.mul (α := monomialRootAlgebra p n) x y)").

**Claim:** `τ` has domain `monomialRootModule p n m`, a `ModuleCat` object, and is applied to `monomialClass p n e : monomialRootAlgebra p n`.

**Witness:** The file elaborates under the defaults (the only warning is the `sorry`), but a probe copy whose `sorry` is replaced by `simp` fails with "the target expression is not type-correct under the `implicit` transparency level": the application `τ (monomialClass p n e)` depends on unfolding `(ModuleCat.restrictScalars …).obj (ModuleCat.of …)` to its carrier. Every tactic proof of this theorem will hit the same mismatch on its first step.

**Exact repair (optional):** Replace the `ModuleCat` carrier by a type synonym with the Frobenius-restricted module structure, for instance `def RootStage (p n m : ℕ) := monomialRootAlgebra p n` with `instance : Module (monomialRootAlgebra p n) (RootStage p n m) := Module.compHom _ (iterateFrobenius (monomialRootAlgebra p n) p m)` and an explicit `RootStage.of : monomialRootAlgebra p n → RootStage p n m`; state `τ : RootStage p n m →ₗ[monomialRootAlgebra p n] monomialRootAlgebra p n` and apply it to `RootStage.of (monomialClass p n e)`, and state the Ext clause on `ModuleCat.of _ (RootStage p n m)`. The README §3.7 wording ("restricted along the m-fold Frobenius", scalar action `a^(p^m)*x`) stays unchanged. Tested: the same `#check` signatures are obtained with the synonym, and the transparency note disappears from the `simp` probe.

## Previous findings

- R01 (P1, register the new supplier contracts in the design plan) — not repaired: the folder is unchanged since that review and the plan still lists 13 gaps. Raised again above as R01 with the same repair.

## Verified sound

**Gate and direction.** The worker's gate at c1ef9e9 passes every scanner and the targeted build. The dependency check rerun from the brief's command printed

```text
depcheck: 204 roadmaps, 1654 edges, 0 problem(s)
```

with no UPWARD or CYCLE line. The diff outside the roadmap folder against origin/main is empty; the worktree is clean. Every supplier the README names is either on main (AdicSpacesPartII, AdicSpacesPartIII, PerfectoidSpaces, SchemeAndStackFoundations, DerivedModuleAlgebra, EnhancedDerivedSheaves, EtaleCohomologyFoundations, RigidAnalyticGeometry) or earlier in the merge order (DerivedDeRhamCohomology 19, AInfCohomology 54, PadicHodgeTheory 109, ArithmeticGaloisDuality 43, DiamondsAndVStacks 16, DiamondEtaleCohomology 74, ClassicalAdicEtaleCohomology 53, HodgeTateAndCanonicalSubgroups 167, AdicCoefficientsAndComparisons 92, ResolutionOfSingularitiesCharacteristicZero 15, AdicSpacesPartV 207; this roadmap 208).

**Lean.** A scratch copy of `Suggested.lean` with `#check @name` for all five declarations elaborated with `lake env lean`: the only warning is `declaration uses sorry` at line 70, and the five elaborated types agree with README §3.7 (p, n, m explicit; `Fact (Nat.Prime p)` carried on `monomialRootModule` and `monomial_root_duality`; the quotient, the `CharP` instance and `monomialClass` for every natural p). No section binder was lost. The one-tactic probe (`simp` in place of `sorry`) makes no progress, so the theorem is not padding; the probe's transparency note is R02. The file has one `import Mathlib`, no `set_option`, no sorried data, `theorem` only, and every Lean name appears in README §3.7.

**Pins opened.**

| Declaration | File and line at the pin | What it says / does not include |
|---|---|---|
| `LinearMap.IsPerfPair` | `Mathlib/LinearAlgebra/PerfectPairing/Basic.lean:39` | class on a bilinear map, both adjoints bijective; no finiteness or projectivity |
| `Representation.invariants` | `Mathlib/RepresentationTheory/Invariants.lean:73` | submodule of vectors fixed by every group element |
| `iterateFrobenius` | `Mathlib/Algebra/CharP/Lemmas.lean:327` | ring homomorphism x ↦ x^(p^n) |
| `ModuleCat.restrictScalars` | `Mathlib/Algebra/Category/ModuleCat/ChangeOfRings.lean:85` | scalar action through the ring map |
| `CategoryTheory.Abelian.Ext` | `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:118` | shifted Hom in the derived category |
| `AlgebraicGeometry.Scheme.smallEtaleTopology` | `Mathlib/AlgebraicGeometry/Sites/Etale.lean:50` | schemes only |
| `Representation.exists_common_fixed_vector_of_isPGroup`, `…invariants_ne_bot_of_isPGroup` | `TauCeti/RepresentationTheory/Unipotent/PowerOrder.lean:151`, `:158` | `[Nontrivial V]`, `IsPGroup p G`, finite-dimensional V over a field of exponential characteristic p; G not assumed finite |
| `TauCeti.AdicSpace` | `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean:243` | full subcategory of sheafy locally affinoid pre-adic spaces; no étale site or almost module category |

**Cross-roadmap citations resolved** (on main or at the open head the roadmap service shows): AdicSpacesPartIII F0.6–F0.8 (README lines 2729–3525), R2.2–R2.8 (4356–7480), R3.1–R3.8 (9136–11858, R3.6 Kiehl proper mapping at 10472); SchemeAndStackFoundations 0.6 (678), 0.8–0.9, 0.21 (1394), 2.18–2.21 (3959–4390); PerfectoidSpaces P0.1 (879), P0.10 (1618), P0.13, P0.29, P3.11, P3.22, P5.9, P5.13.1–P5.13.4, P6.5, P6.7, P6.15–P6.16; AdicSpacesPartII R0, R0.19–R0.20 (7464, 8134), R1; DerivedModuleAlgebra 0.2, 0.4, 0.8, 0.10–0.14, 0.17, 1.T.1, 1.1–1.8, 1.E.1, S.1; EnhancedDerivedSheaves 0.1–0.4, E1.1–E1.5, E2:towers.1 (1294), E5:animation.3 (1978, `tot_filteredColimit_of_bounded`: with homotopical bound b=0 for D≥0 the stated window r ≥ b−k+1 at k=−i is exactly `Tot_{i+1}`, and its own Check is the Λ[2]-in-degree-two negative control the README repeats); EtaleCohomologyFoundations G.1–G.3, F.0.x, 0.5, F.3.0; RigidAnalyticGeometry 1.1–1.2; ClassicalAdicEtaleCohomology 1.1–1.5 (1.5's strict-localisation field pair `Spa(C_ξ,C_ξ⁺)` clause), 2.5 with target `sheaf-comparison-3-2-9`, 3.2 (maximal-point detection on taut rigid spaces), 8.2, 8.4, 9.1, 9.5 (nonempty fibres give an epimorphism), 9.7, 10.5, 11.1, 11.2 (`cd_ℓ(X) ≤ 2 dim.tr(X/S)` over a geometric point, for arbitrary ℓ-primary torsion including ℓ = p); PadicHodgeTheory 2.1, 2.4, 2.7 (primitive comparison, finite-level and integral perfectness, singular proper constant case), 7.2; AInfCohomology AI.0:integral.1, AI.1.1–AI.1.7, AI.3.1–AI.3.2, AI.4.1, AI.6.1–AI.6.2; HodgeTateAndCanonicalSubgroups 7.5, 7.6 (`proper_smooth_local_system`: 𝔽_p, ℤ/pⁿ, ℤ_p local systems, arbitrary rigid base change, geometric stalks); DiamondEtaleCohomology C0.1, C0.23 (bounded-below full faithfulness for any ring Λ), C1.7, C1.12, C2.10 (v-hyperdescent with cutoff compatibility); DiamondsAndVStacks D1.1, D1.6, D1.9, D1.11, D2.2 (`singleton_mem_vPrecoverage_iff_surjective`, quasicompact source and quasiseparated target); ArithmeticGaloisDuality D7.1–D7.3, R02.1.2, R02.2.3; AdicCoefficientsAndComparisons L2/fp-compactification-limit (`fpCompactificationLimit`) and L2/fp-strict-cofiltered (`fpStrictCofiltered`); ResolutionOfSingularitiesCharacteristicZero 7.5, 7.7, 7.8; DerivedDeRhamCohomology 1.22. The AdicSpacesPartV design on the board carries every RZ target label the README names (RZ.0/zariski-closed-subset, local-dimension, nowhere-dense-criteria, proper-image-zariski-closed; RZ.1/rigid-normalization, irreducible-components, riemann-extension; RZ.2/singular-locus, smooth-iff-regular; RZ.4/weakly-shilov-point, weakly-shilov-transcendence-criterion, weakly-shilov-avoid-nowhere-dense; RZ.5/rigid-resolution, resolution-consequences); that design lists generic smoothness and the Bhatt–Hansen §§2.2–2.5 material as non-goals, which is consistent with proper-generic-smoothness being a declared gap rather than a citation. The worker's resolver reports no unresolved citation or Lean name; I found none either.

**Ownership.** The roadmap service was searched by object. "Zariski-constructible" occurs outside this roadmap only in the parent (as the Huber-constructible contrast and as references), PrismaticCohomologyPartIII (a scheme remark), IgusaVarieties and AdmissiblePairs (reference entries); no other roadmap plans proper pushforward or base change for Zariski-constructible complexes. "Polystable", "Faltings trace" and "pseudo-finite" occur in no other roadmap README. Mod-p Poincaré duality is cited as a reference by the parent, AdicCoefficientsAndComparisons, AInfCohomology and PadicHodgeTheory but planned by none; the parent's §9.7 is prime-to-residue duality, and §5.4 here is the p-primary extension. The Lean name prefix `TauCetiRoadmap.ClassicalAdicEtaleCohomologyPartII` is unique. Ownership against open pull requests whose files the brief does not list was checked only through the roadmap service's index of 440 open pull requests.

**Shape.** Summary, Scope and ownership, Conventions (with Checks), Exact supplier contracts per supplier, How to read the build, Layers 0–5 and 7 each with Examples and Dependencies, Downstream consumers, Worked examples, References. Every definition has an API list and at least three Checks; every theorem has its hypotheses in the sentence and a locator; no LaTeX delimiters, no process words, no pull-request numbers, no `lemma`. Compared with EtaleCohomologyFoundations and EnhancedDerivedSheaves on main.

### Sources: the seeded sample

All eight cached texts were opened; H (Heuer) is settled as uncertified. Printed pages are the preprint pages of the cached extractions.

| Target | Locator opened | Finding |
|---|---|---|
| 1.4 Hartogs extension | Z Lemma 2.5.3 (line 976), Lemma 2.5.4 (line 987, p. 22–23), Theorem 2.5.5 (line 1032, p. 24) | 2.5.4 needs reduced special fibre, reflexive coherent F, dense U; 2.5.5 needs separated pure-d, smooth generic fibre, geometrically reduced special fibre; statement as written. The proof uses Lemma B.5 (refined algebraization) and Theorem 2.3.7 (reflexivity over O_K): the two gap contracts the README names. |
| 1.6 Generic canonical sheaf | Z Theorem 2.7.1 (line 1125), Lemma 2.7.3 (line 1142, p. 26), Lemma 2.7.5 (line 1174, p. 27) | §2.7 fixes K algebraically closed, any characteristic; 2.7.3 gives canonical s_𝔛 under smooth generic fibre and geometrically reduced special fibre; 2.7.5 is the rig-isomorphism compatibility. As written. |
| 2.5 Rational normalization | Z Remark 3.4.11, Theorem 3.4.12 with diagram (3.6) (line 1957, p. 42) | Φ = Sch ∘ j for reduced special fibre and smooth generic fibre, n ≥ 1; the inverse normalization j∘Φ⁻¹ = Sch⁻¹ is the README's. |
| 2.7 Pseudo-finite | Z Definition 3.6.1, Examples 3.6.2 (line 2168, p. 46) | rig-finite plus almost amplitude [0,d] of Rf_*Rν_*Ô⁺ᵃ; finite maps are examples by AC 6.13.6. README restricts to nice models (a narrowing it needs for the trace). |
| 3.2 Root towers | Z (4.2)–(4.5), Lemma 4.2.8 (line 2420, p. 51), Lemma 4.2.11 (line 2470) | R_m⁺ finitely presented over R⁺ and O_C-flat (no R⁺-flatness claimed); R_∞⁺ integral perfectoid; Γ_m ≅ μ_{pᵐ}ᵈ. As written. |
| 3.3 Character summands | Z (4.6), Lemma 4.2.15 (line 2560, p. 54), Definition 4.2.17, Lemma 4.2.19 | Decomposition and coset modules as written; Lemma 4.2.15's "isomorphisms" V_χ⊗V_χ′→V_{χ+χ′} is false for a nonunit parameter (see Source issues); the README states the normalized multiplication with its parameter factor instead. |
| 3.4 Character cohomology | Z Lemma 4.2.23 (line 2629, p. 55), Corollary 4.2.26 (line 2690) | Finitely presented, annihilated by ζ_{p^{m_k}}−1 (hence by ζ_p−1), no 𝔪-torsion; trivial character gives ⋀ⁱ(R⁺)ᵈ. As written. |
| 3.5 Décalage and top map | Z Corollary 4.2.29 (line 2774, p. 57–58), Theorem 4.2.30 (line 2800) | Locally free of rank binomial(d,i) after dividing by the [1−ζ_p]-torsion; top Faltings map an honest isomorphism onto ω(−d). As written. |
| 3.7 Root derived duality | Z Definition 4.3.1 (line 2827), Theorem 4.3.2 and proof (line 2834, p. 59) | tr_m on monomials exactly as in the Lean `if … then … else 0`; Step 1 gives RHom concentrated in degree 0, Step 2 bijectivity of α_m. Statement supports the Lean theorem. |
| 3.9 Almost cochain duality | Z Lemmas 4.3.10–4.3.12, Theorem 4.3.15 (line 3066, p. 63–64) | Perfect for opposite characters, almost perfect for the completed sum, with Definition 4.3.13's trace. As written. |
| 4.3 Good quotients | Z Definition 4.4.2 (line 3219, p. 67), Theorem 4.4.1 (line 3188) | quasi-projective special fibre, finite G, geometric quotient, generic G-torsor; 4.4.1 supplies reduced quasi-projective auxiliary models. README adds niceness of both models, as the descent lemma needs. |
| 5.7 Integral and rational traces | Z Definitions 5.5.3 and 5.5.5 (lines 3964, 3976, p. 82) and the paragraph at line 3972 | limit of finite traces; inversion of p; RΓ(X_C,ℚ_p) = RΓ(X_C,ℤ_p)[1/p] for qcqs X. As written. |
| 5.8 Integral derived duality | Z Theorem 5.5.4 (line 3968, p. 82) and the proof of 5.5.2 (lines 3920–3963) | perfect Galois-equivariant pairing over ℤ_p; the README's −2d shift is the correct form of the displayed unshifted target. |
| 7.3 Locality and generators | BH Theorem 3.5 (line 647, p. 15), Proposition 3.6 (line 653) and proof | étale locality in characteristic zero; generators f_*M for finite f on quasicompact X; the proof passes through a prime-to-ℓ cover with unipotent monodromy and Han's cover extension, as the README's route does. |
| 7.6 All-torsion base change | BH Theorem 3.15 and proof (line 864, p. 20) | f proper, F ∈ D^{(b)}_zc(X,ℤ/n), any n; proof splits p ∤ n (Huber) from n = pᵃ (Theorem 3.10, overconvergence, rank-one stalks, Lemma 3.25). As written. |

Also reopened for the pass: Z Lemma 4.4.11 (line 3288; finite cohomological dimension of Rt_* enters the bar-complex commutation), Lemma 4.4.3 (line 3227; nice models), Definition 4.1.1 and Theorem 4.1.2 (line 2311; nice models), Definition 3.5.1–3.5.5 (line 2091–2150), Theorem 4.4.24 (line 3587); AC Theorems 6.13.5–6.13.6 (line 7390); BH Definition 3.1 (line 594), Proposition 3.7 (line 672), Theorem 3.10 (line 764), Theorem 2.29 (line 567), Lemma 3.25 (line 1102); Han Definition 1.5, Theorems 1.6, 1.8, 1.10 (lines 130, 134, 196, 226), Theorem 2.6, Propositions 2.8–2.9 (lines 409, 417, 435).

### Adversarial pass

Λ is a nonzero finite coefficient ring unless stated. Each row records the values computed on the two sides.

| Statement | Instances tried | Values on one side | Values on the other side | Result; change |
|---|---|---|---|---|
| Conventions: shift and twist | ℙ¹_C; two points at p=2 | point class in H²(ℙ¹,Λ(1)) has trace 1; Λ[−2] has H²=Λ | Λ[2] has H⁻²=Λ; trace (1,1)↦0, (1,0)↦1 | agree; none |
| Conventions: O_C/p versus O_C/𝔪 | ε=p^{1/2}; ℚ_p(π), π²=p, p=2,3 | ε·1≠0 in O_C/p; π̄≠0, π̄²=0 in O_K/p | ε·1=0 in O_C/𝔪, (O_C/𝔪)ᵃ=0; π↦0 in 𝔽_p | agree; none |
| 0.2 non-Noetherian base | finite set in 𝔪_C, δ=min valuation | ideal elements have valuation ≥δ | p^{1/n} with 1/n<δ lies outside | 𝔪_C not finitely generated; none |
| 0.2 formal ℙ¹ comparison | O, O/p, O(−2) over Spf O_C | H⁰=O_C,0,0; H¹=0,0,O_C (class T⁻¹) | generic H⁰=C,0,0; associated sheaves (O_C)^Δ, (O_C/p)^Δ, (O_C)^Δ | agree; none |
| 0.3 almost upper shriek | f=id, n=0 and n=1, A=B=O_Cᵃ/p | Ext over O_C/p²: periodic resolution with differential p, Hom into O_C/p kills it: Extⁱ=O_C/p all i≥0 | H¹=O_Cᵃ/p on both sides; n=0 gives degree 0 only | agree; none |
| 0.4 square-zero model | Spf O_C[ε]/(ε²) | O⁺=O_C⊕Cε; O⁺/p=O_C/p⊕Cε/pCε=O_C/p; Ô⁺=O_C | model flat free of rank 2, tfp; amplitude [0,0]; generic fibre nonreduced | agree; none |
| 1.1 non-CM reduction | R = completion of ℤ_p[pT,T²,T³] | x=pT: x∉pR, x²=p·pT²∈pR, xT²=p·T³∈pR, xT³=p·(T²)²∈pR | x is a nonzero socle element of the 1-dimensional reduction: depth 0 | ω• has more than bottom cohomology; none |
| 1.1 equal characteristic | K=𝔽₂((t)), ϖ=t, formal line | ω=𝔽₂[[t]]⟨T⟩dT in degree −1; reductions mod t, t² | "mod 2" would be the unchanged ring at every level | agree; none |
| 1.4 Hartogs (seeded) | 𝔘=𝔛 smooth affine; Spf O_C with 𝔘=∅; uv=ϖ; t²=ϖ | pair (s,s); Glue_∅=j_{K,*}F_K=C≠O_C; special fibre two axes, dense open meets both | density required; nilpotent residue class t excludes the fourth model by hypothesis | agree; none |
| 1.5 formal trace | id; r copies; split degree p at d=0 | Tr=id; (1,0)↦1; Tr(1,…,1)=p | mod p: 0 | not normalized; none |
| 1.6 generic canonical sheaf (seeded) | point; one-torus; U=T⁻¹ | s(1)=1; s(dlog T)=generator; dlog U=−dlog T | same on the generic side | agree; none |
| 1.7 coherent trace | S=Tʳ, r≥1, r=p mixed characteristic | f*dlog S = r dlog T; Tr(dlog T)=dlog S | Tr(f*dlog S)=r dlog S, values 1 and p | agree; none |
| 1.7 ramified point Check | L=ℚ_p(π), π²=p | O_L/p=𝔽_p[π]/(π²) nonreduced | over C the point splits, model Spf(O_C×O_C) reduced | algebraically closed hypothesis needed; none |
| 2.1 torsion quotient | O_C⊕O_C/p²; p=2 degree-one square | quotient O_C; x²=−x² gives 2x²=0 | torsion-free quotient gives x²=0 | agree; none |
| 2.3 smooth inverse ranks | d=1 | ranks of R̃ⁿ: 1,1,0 | binomial(1,n) | agree; none |
| 2.5 normalization (seeded) | torus; S=Tʳ; split r-cover at d=0 | Φ=Sch∘j ⇒ jΦ⁻¹(Sch(dlog T))=dlog T; r dlog T; unit↦r | extra scalar would give a⁻¹dlog T; r=2 gives 2 and 0 mod 2 | agree; none |
| 2.6 mod-p trace target | smooth curve | ω•₀=Ω¹₀[1], target ω•₀(−1)[−2]=Ω¹₀(−1)[−1] | nonzero in degree 1 (not −1 or −3) | agree; none |
| 2.7 pseudo-finite (seeded) | id; admissible blow-up; positive-dimensional generic fibre | rig-finite true, true, false; amplitude [0,d] for the first two | definition requires both clauses | agree; none |
| 2.8 pro-étale trace | split p-cover mod p; degree 1; r then s | Tr(1,…,1)=0, Tr(e₁)=1; id; composite on a unit vector 1 | rs-cover gives 1 | agree; none |
| 2.9 compatibility | id; split two-cover | both composites (x,y)↦x+y | same | agree; none |
| 3.1 polystable charts | uv=ϖ nonunit; all units; uv=0 | d=1, residue uv=0 reduced; torus; ∂(uv)=(v,u)=0 at origin | third excluded by smooth generic fibre | agree; none |
| 3.2 root towers (seeded) | p=2 node, m=1; n_i=0; one-torus | R₁⁺/(u,v,𝔪)=k[x,y]/(x²,y²,xy) length 3; Γ=1; Γ=ℤ_p(1) | generic degree 2 ≠ 3: not R⁺-flat | agree; none |
| 3.3 character multiplication (seeded) | uv=ϖ, χ=[u], χ′=[v]; exponents (1,0)+(0,1); unit ϖ | u·v=ϖ·1, factor ϖ^{min(1,1)}=ϖ | V_χ⊗V_{χ′}→V₀ is multiplication by ϖ: an isomorphism only for a unit | README correct; Z Lemma 4.2.15 refuted (Source issues) |
| 3.4 character cohomology (seeded) | Γ=ℤ_p trivial; order pᵐ; Γ=1 | [O_C→⁰O_C]: H⁰=H¹=O_C; [O_C→(ζ_{pᵐ}−1)O_C]: H⁰=0, H¹=O_C/(ζ_{pᵐ}−1); degree 0 only | ζ_p−1=(ζ_{pᵐ}−1)(1+ζ_{pᵐ}+…) so ζ_p−1 annihilates too | agree; none |
| 3.5 décalage (seeded) | torus; differential ζ_p−1; line O_C | ranks 1,1; η kills H¹=O_C/(ζ_p−1); O_C/O_C[a]=O_C | O_C/a is torsion, a different object | agree; none |
| 3.6 projection trace | m>0 one-torus; n=0; m=0 | tr(1)=1, tr(T^{1/pᵐ})=0, tr(T)=T | algebra trace of 1 is pᵐ=0; n=0 both give 1 | agree; none |
| 3.7 root duality, degenerate (seeded, Lean headline) | n=0; m=0; p=0,1 | A=𝔽_p, τ=id, adj bijective, Ext>0 of 𝔽_p over 𝔽_p zero; m=0: p⁰=1 divides all, τ=id, adj r↦(s↦rs) | p=0: ZMod 0=ℤ; p=1: zero ring; both excluded by `Fact p.Prime` | agree; none |
| 3.7 root duality, p=2 node | n=1, m=1: A=𝔽₂[u,v]/(uv), A₁=A⊕A/(v)x⊕A/(u)y | adj(x)(x)=τ(u)=u, adj(x)(y)=τ(xy)=0; Hom(A/(v),A)=Ann(v)=(u) | resolution …→A→ᵘA→ᵛA→A/(v): H¹=ker u/im v=(v)/(v)=0, H²=(u)/(u)=0, periodic | bijective adjoint, Ext>0 zero; none |
| 3.7 root duality, p=3 and n=2 | p=3, m=1 block x,x²; p=2, n=2, m=1 | matrix [[τ(x²),τ(x³)],[τ(x³),τ(x⁴)]]=[[0,u],[u,0]]; seven summands with diagonal 1,U,V,W,UV,UW,VW and off-diagonal τ(xy)=τ(Uy)=τ(xyz)=0 | Ann(VW)=(U), Ann(W)=(UV) in 𝔽₂[U,V,W]/(UVW) | agree; none |
| 3.7 Lean scalar action | m=0,1; e with p^m ∤ e_i | r•x=r^{pᵐ}x, m=0 ordinary; τ(e)=0 | e_i/pᵐ with pᵐ>0, no junk division | agree; none |
| 3.8 oriented trace | Γ=ℤ_p trivial; swap; ζ_p action, p=2 | [R⁺→⁰R⁺], trace to degree 1; determinant −1 | H¹=O_C/(ζ_p−1)=O_C/2 ≠ O_C | trivial action required; none |
| 3.9 cochain duality (seeded) | d=0; Γ=ℤ_p trivial; χ=[u^{1/2}] at p=2 | b↦b; degrees 0,1 pair into R⁺[−1]; u^{1/2}·u^{1/2}=u integral, u^{1/2}·1 projects to 0 | −χ=χ for an order-two class | agree; none |
| 3.10 polystable duality | d=1 | integral target ω(−1)[−1] | mod-p target ω•₀(−1)[−2]=ω₀(−1)[−1] | agree; none |
| 4.1 pairing | Spf O_C; smooth d-model | multiplication on O_Cᵃ/p; degrees i and d−i | d=1: 0 with 1 | agree; none |
| 4.2 rig-isomorphism descent | id; blow-up | adjoint unchanged; generic degree 1, exceptional ℙ¹ | Rf_* used, no averaging | agree; none |
| 4.3 good quotients (seeded) | G=1; G×𝔛; fixed generic point | fibre cardinalities 1, |G|, <|G| | torsor condition true, true, false | agree; none |
| 4.4 invariants and orbits | C_p trivial on O_C/p; S₃ regular; G=ℤ regular; C₃ over 𝔽₂ | H¹=O_C/p (N=p=0, g−1=0); one invariant and one coinvariant line; invariants 0, coinvariants M; 3⁻¹=1 | Shapiro for finite G only | agree; none |
| 4.5 equivariant pushforward | G=1; C_p; S₃ | identities; H¹ retained; (gh)⁻¹=h⁻¹g⁻¹ | g in place of inversion reverses the law | agree; none |
| 4.6 wild descent | split C₂ torsor at p=2 | Tr(1,1)=0, Tr(e₁)=1; invariants diagonal | norm on a trivial module would be 0 | Shapiro, not norm; none |
| 4.7 local duality | point; uv=ϖ; t²=ϖ | identity; nice; not nice | theorem applies to the first two | agree; none |
| 5.1 global trace | Spa C; two points; curve | id; (a,b)↦a+b; H²(X,O⁺ᵃ/p)→O_Cᵃ/p(−1) via H¹(ω₀) | shift +2 puts the coefficient in degree −2 | agree; none |
| 5.2 global duality | ℙ¹; two points | ranks (1,0,1); diag(1,1), total unit trace 2 | complementary ranks; 2 may vanish mod p without degeneracy | agree; none |
| 5.3 almost detection | zero map on 𝔽_p; two points | kernel 𝔽_p⊗O_C/p=O_C/p, not almost zero | top trace 𝔽_p²→𝔽_p has kernel of dimension 1 | connectedness needed; none |
| 5.4 mod-p duality | ℙ¹ mixed characteristic; i=2d+1; ℙ¹ in characteristic p | H⁰=𝔽_p, H²(𝔽_p(1))=𝔽_p pair to 1; H^{2d+1}=H⁻¹=0 | Artin–Schreier gives H²(ℙ¹,𝔽_p)=0 while H⁰=𝔽_p | equal characteristic excluded; none |
| 5.5 local systems | rank 0; rank r at a point; C₂ Jordan block over 𝔽₂ | 0→0; I_r; fixed line e₁, trivial quotient | degree-2 trace 0, odd Sylow index needed | agree; none |
| 5.6 finite p-power | n=1; ℙ¹ with ℤ/p²; base change ring | mod-p pairing; degrees 0,2 pair to 1 in Λ_n[−2] | ℤ/pⁿ⊗^L_{ℤ_p}𝔽_p has H⁻¹=𝔽_p, over Λ_n it is 𝔽_p[0] | agree; none |
| 5.7 traces (seeded) | Spa C; ℙ¹; ℤ_p/p | identities; t(c₁(O(1)))=1 for ℤ_p and ℚ_p | localization of ℤ_p/p is 0 | agree; none |
| 5.8 integral duality (seeded) | ℙ¹; [ℤ_p→ᵖℤ_p] | degrees 0,2 paired into ℤ_p[−2]; H¹=ℤ_p/p | Hom(ℤ_p/p,ℤ_p)=0, Ext¹=ℤ_p/p | derived Hom necessary; none |
| 5.9 rational duality | ℙ¹; two points | matrix (1); diag(1,1) of rank 2 | product of total sums has rank 1 | agree; none |
| 7.1 Zariski-constructible | skyscraper at a classical point; points with Λ[j] | strata {x}, D∖{x}; {x} is no finite Boolean combination of qc opens | locally bounded, no global lower bound | agree; none |
| 7.2 algebraization | Z=Spec A; Spec K with (ℤ/n)ʳ | equivalence (BH 3.7(2)); (ℤ/n)ʳ in degree 0 | nonproper h handled by BH 3.7(1) | agree; none |
| 7.3 generators (seeded) | point; point in a disc; C₂ Jordan block over 𝔽₂ | one generator; i_*Λ; extension of two trivial lines | no duality input | agree; none |
| 7.4 proper pushforward | f=id; point in a disc; S_f for {a}→D and {a},{b} | unchanged; R⁰ skyscraper, Rⁱ=0; D∖{a}, D∖{a,b} | opens lie in the target | agree; none |
| 7.4 truncation bound | N⁰→N¹=id; N¹→N²=id; Λ[2] in degree 2; constant Λ on ℙ¹ | H⁰=0 (level 1 needed); H¹=0 (level 2 needed); Tot H⁰=Λ vs Tot₁=0; sheaf H²=0 vs H²(ℙ¹)=Λ(−1) | supplier window r≥b−k+1 with b=0, k=−i gives i+1 | agree; none |
| 7.5 field extension | point; ℙ¹; split nodal rational curve; Spa(C⟨ε⟩/(ε²)) | Λ→Λ; (1,0,1); Mayer–Vietoris: H⁰=Λ, H¹=coker(Λ⊕Λ→Λ², (a,b)↦(a−b,a−b))=Λ, H²=Λ(−1); reduction Spa C, cohomology (Λ,0,…) | same after C′/C | agree; none |
| 7.6 base change (seeded) | g=id; ℙ¹ with n=p²; n=1; empty source | identity; H⁰=Λ, H²=Λ(−1); 0→0; 0 | same | agree; none |
| 7.7 constant sheaf | Z point; two points; Z point with Y=ℙ¹ | R⁰=Λ, Λ²; R²g_*Λ pulled back is 0 | H²(Z×Y,Λ)=Λ(−1) is not asserted | consistent; H uncertified |
| Contract rigid-zariski-geometry | disc; K⟨ε⟩/(ε²); origin inclusion | V(1)=∅, V(0)=X, V(T)={0}, dim 0<1; V(ε)=X reduced to Spa K, dims 0=0; support of f_*O is {0} | nowhere dense: true, false; image {0} | agree; none |
| Contract rigid-normalization-extension | node; punctured disc; node minus origin | K⟨u⟩×K⟨v⟩, two preimages; T extends with value 0, 1/T unbounded; (0,1) bounded | branch values must agree at the origin on the node | normality needed; none |
| Contract rigid-smooth-loci | node; ε²=0; 𝔽_p((t)), L=K[u]/(uᵖ−t), p=2,3 | Jacobian (v,u) vanishes at the origin only; empty smooth locus; L regular of dimension 0 | Ω¹_{L/K}=L·du of dimension 1>0, not smooth | perfectness needed; none |
| Contract weakly-shilov-points | Gauss point; origin; Spa K | secondary residue field k(T), k, k; transcendence degrees 1,0,0 | local dimensions 1,1,0 | Gauss point weakly Shilov, origin not; none |
| Contract rigid-resolution | split node; Spa(C⟨ε⟩/(ε²)); disc over ℚ₂, ℚ₃, ℂ((t)) | two points over the node, isomorphism elsewhere; π: Spa C→X with ε↦0; identity | proper surjection in each case, the disc not proper over K | agree; none |
| Contract finite-branched-covers | identity versus disc ⊔ point over the origin; empty cover | equal restrictions; extra point is open in π⁻¹(Z) | nowhere density excludes it; empty Y not surjective | agree; none |
| Contract proper-generic-smoothness | {a}→D; two points; identity | nonsmooth locus all of the source, image {a} closed | S_f=D∖{a}, D∖{a,b}, D | agree; none |
| Contract general-nearby-coherence | AC Theorems 6.13.5–6.13.6 | (1) almost coherent amplitude [0,d], (2) affine associated-sheaf isomorphism, (3) étale base change | contract clauses match clause by clause | agree; none |
| Contract integral-toric-field-extension | BH Lemma 3.25 proof | A_∞°⊗̂O_{C′}→(A_∞⊗̂C′)° almost isomorphism, Koszul cochains | contract as written | agree; none |
| R01 slug registration | README versus plan | 18 slugs versus 13; difference the five named slugs; destinations RZ.1 vs RZ.5 and "RZ.2 and RZ.4" vs RZ.4 | — | fails; R01 |

## Not verifiable

- H, Heuer, *A p-adic Simpson correspondence for smooth proper rigid varieties*, Proposition 2.18, p. 279: settled as uncertified; §7.7 is cited by locator only and was not requested again.
- AdicSpacesPartV is a board design only; its RZ targets were read in the design README, not in a roadmap on main or an open head. The undeclared contracts are R01.

## Source issues

- **Error** in Z at Lemma 4.2.15, printed p. 54 (Z line 2563): the source says multiplication induces isomorphisms between every pair of weight lines V_χ⊗V_χ′→V_{χ+χ′}; it should be multiplication by the block-parameter factor, a unit only when the parameter is; affects a stated result.
- **Misprint** in Z at Theorems 5.5.4 and 5.5.6, printed pp. 82–83 (Z lines 3969 and 3980): the source says the derived pairing lands in the unshifted coefficient ring; it should be the coefficient ring shifted by −2d, as the top-degree trace requires; affects a stated result.
- **Misprint** in Z at Theorem 4.4.24, printed p. 74 (Z line 3587): the source says separated admissible with smooth generic fibre; it should add reduced special fibre (a nice model), as Theorem 4.1.2 and the descent lemmas require; affects a stated result.
