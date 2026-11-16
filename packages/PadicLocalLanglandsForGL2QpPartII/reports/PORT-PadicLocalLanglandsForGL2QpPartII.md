# PORT-PadicLocalLanglandsForGL2QpPartII

- Branch: `roadmap/padic-local-langlands-for-gl2-qp-part-ii`, created from main at `5ff4294`.
- Head commit: `04fba00`, "PadicLocalLanglandsForGL2QpPartII: roadmap (README, Suggested.lean, metadata)".
- Files: `TauCetiRoadmap/PadicLocalLanglandsForGL2QpPartII/README.md`, `TauCetiRoadmap/PadicLocalLanglandsForGL2QpPartII/Suggested.lean` and `TauCetiRoadmap/PadicLocalLanglandsForGL2QpPartII/metadata.toml`. Nothing outside the folder changed.

## Build

`lake build TauCetiRoadmap.PadicLocalLanglandsForGL2QpPartII.Suggested`:

    ✔ [18238/18239] Built TauCetiRoadmap.PadicLocalLanglandsForGL2QpPartII.Suggested (2.7s)
    Build completed successfully (18239 jobs).

There are 0 warnings. The file declares nothing, so there is no `sorry` warning either.

The package's file, as copied, produced one warning: "imports `Mathlib` from package `mathlib`, which is designed for use with the module system". The file now starts with `module` followed by `public import Mathlib`, which is the form 61 of the `Suggested.lean` files on main use. The gate's import check accepts `public import`, and the gate passes.

## Gate

    gate PadicLocalLanglandsForGL2QpPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

Dependency check (`gate --depcheck … --movable`), full output:

    depcheck: 258 roadmaps, 2463 edges, 0 problem(s)

The exit status is 0, with no UPWARD, CYCLE or `moved:` line.

`roadmaps resolve` on the ported README reports no cross-roadmap citation found nowhere and no Lean name found nowhere.

## Draft pull request body

This pull request adds the roadmap PadicLocalLanglandsForGL2QpPartII, the second part of PadicLocalLanglandsForGL2Qp. It starts where the base roadmap's §6.9 stops, at the Breuil–Strauch comparison through the Drinfeld tower, which the base proves for a supercuspidal π with trivial central character and conditionally on global data. This roadmap discharges those global hypotheses (Shimura-curve uniformisation, a nonzero equivariant map, the two-dimensional de Rham multiplicity). It extends the comparison to every supercuspidal type on which p acts trivially, and identifies its de Rham isomorphism with the Hyodo–Kato one at every level. It refines the comparison by the P-finite Kirillov model, the common embedded analytic dual and the homographic covariance of the coordinate operator, and proves Colmez's weight change. It then computes, at a fixed level of the p-central Drinfeld tower, the Galois and Banach multiplicities of p-adic étale cohomology. The multiplicity of V_(M,ℒ) is Π(V_(M,ℒ))*⊗JL(M), and it vanishes in dimension at least three. It also factors the arithmetic completed cohomology over blocks and full Weil–Deligne type rings for p > 3 (Colmez–Dospinescu–Nizioł). Finally it derives the weighted, Iwasawa, infinitely-primitivable, first-cover and derived consequences of Dospinescu–Le Bras. The README records 25 corrections to its sources. `Suggested.lean` states nothing, because none of the headline theorems is statable at the pins: Mathlib and Tau Ceti have no Drinfeld tower, rigid analytic or étale cohomology of rigid spaces, Robba rings, or locally analytic or Banach representations. Its docstring names, for each headline, the carriers it lacks.

## Roadmaps this one depends on that are still pull requests

All of these are earlier in the merge order than this roadmap, which is at line 414:

- EndoscopicTransferAndUnitaryTraceComparison
- ProetaleCohomologyOfPAdicCurvesAndTowers
- ScholzeFunctorAndModpCohomologyOfTheLubinTateTower
- LocallyAnalyticRepresentationsOfLocalGroups
- LocallyAnalyticDistributionsPartII
- PadicHodgeTheory
- PadicDifferentialEquationsAndRigidCohomology
- GL2AutomorphicRepresentationsAndTransfer
- CompletedCohomologyAndLocalGlobalCompatibility
- HilbertModularVarietiesAndShimuraCurves
- LocalGaloisDeformationRings
- TropicalAndBerkovichArithmetic

The following suppliers are on main: PadicLocalLanglandsForGL2Qp, PhiGammaModulesAndIwasawaCohomology, LocallyAnalyticDistributions and SmoothRepresentationsOfLocalGroups. No cited id is defined only by an open revision.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` declares nothing; it has one module docstring and an empty namespace, which is the correct form when no headline is statable. I kept that decision and checked it again:

- The Galois-socle theorem, the Banach multiplicities, the factorisation, the p-central realisation, the discharge of the global hypotheses, the irreducibility of Π(π,0) and the weight change all lack their carriers at the pins. So do the weighted realisation and BGG row, the Iwasawa description, the infinitely primitivable functions and the derived realisation.
- I searched the pinned Tau Ceti by object. Its "Drinfeld" hits are level structures on elliptic curves, and its `kirillovForm` is the coadjoint-orbit form. It has no half-plane, no Robba ring and no p-adic Kirillov model.
- §4.3 (extension of a partial operator with prescribed spectrum) and §6.3 (rigidity over principal ideal domains) are statable but are route lemmas, not headlines. The docstring now says this.

Docstring edits:
- The Mathlib period rings are now named by their real declarations, `BDeRhamPlus` and `BDeRham`, which at the pin are "of a perfectoid ring of integers", not "of a perfectoid field".
- The phrase "once that category exists" is replaced by a timeless one.

Mechanical signature check: there is no declaration, so `#check @name` has nothing to run on and no elaborated type to compare.

## Supplier replacements and duplication removals

The duplication sweep was by object, using `roadmaps grep` over main and all 452 open roadmap pull requests at their heads, plus the twelve open suppliers read in full where needed. It found the following.

1. **Analytic Steinberg representation.**
   - What the package had: §4.2 *defined* St^an = C^an(ℙ¹(ℚ_p), L)/L.
   - Who owns it: PadicLocalLanglandsForGL2Qp §4.8 on main constructs the locally analytic principal series Ban(η₁,η₂), their special subrepresentations and the quotients St^an(δ₁,δ₂). LocallyAnalyticRepresentationsOfLocalGroups §5.1 constructs (Ind_B^G 1)^an. Its Checks identify that induction with C^an(ℙ¹(ℚ_p)) and its constants as the unique closed one-dimensional subrepresentation.
   - Change: §4.2 now says it *writes* St^an for St^an(χ,1) of the base §4.8, the quotient of that induction by its constants. Both owners are added to the contracts, to §4.2's *Needs* and to the Layer 4 Dependencies. The restatement is gone, and the Scope records the deferral.
2. **Smooth Kirillov realisation of a supercuspidal.**
   - Who owns it: GL2AutomorphicRepresentationsAndTransfer R16.2.8 owns the smooth Kirillov realisation of a supercuspidal π (trivial central character, over L) on compactly supported locally constant Γ-equivariant L_∞-valued functions. This is the DLB17 Remark 7.10 variant.
   - Overlap: §1.7's description π ≅ LP_c(ℚ_p^×, N⁺_dif/D⁺_dif)^Γ is that realisation, read on the P-finite Kirillov model.
   - Change: a sentence in §1.7 makes the identification and says the realisation is not constructed again. It is computed: N⁺/D⁺ = L_∞⊗(M_dR/ℒ) is killed by t, so u(b) acts by ε(bx), which is R16.2.8's ψ(xu)f(xa) at d = 1, ω = 1, ψ = ε. R16.2.8 is added to the contract, to §1.7's *Needs* and to Layer 1, and the Scope records the deferral.
3. **DLB17 Lemme 5.10 (weakly null sequences are null).**
   - Who owns it: LocallyAnalyticRepresentationsOfLocalGroups §0.8 owns and proves it.
   - Change: §3.1(a)'s Frobenius-reciprocity route cited Lemme 5.10 bare; it now cites §0.8 for the spherically complete field L. §0.8 is added to the contract, to §3.1's *Needs* and to Layer 3.
4. **The compactly supported P-finite space of the base §4.9.**
   - On main, base §4.9 defines Q_c^{P−fini} by diag(ℤ_p^×,1)-finiteness and the infinite-slope condition only.
   - §1.3 here, following DLB17 Définition 7.4, also requires that a power of some u(pⁿ)−1 kill the vector. So §1.3's space is the subspace of the base's space cut out by that condition.
   - The package's sentence "It specialises to the base roadmap §4.9's … space" is replaced by that exact relation in §1.3, the Scope and the supplier contract. The density statements compare correctly: density of the smaller space is the stronger claim.

The sweep found no other overlap. The other objects searched were:
- the multiplicity diagram, which stays with ProetaleCohomologyOfPAdicCurvesAndTowers §7.5 and is read here at fixed level;
- Teitelbaum's model, infinitely primitivable functions, the boundary sheaf, CDN20 Lemme 2.18, CDN23 Lemme 5.12, the fixed-level arithmetic completion, Π(π,0), E_π, the Morita-type isomorphism Ω¹(Ω) ≅ (St^an)′, type rings and Hochschild–Serre on p^ℤ;
- ClassicalAdicEtaleCohomology §4.6, which cites CDN23 only for semistable formal schemes.

Ownership I claim for this roadmap, because no owner exists on main or at any open head:
- the G-bounded vectors of a group action on a locally convex space (§4.8). ProetaleCohomologyOfPAdicCurvesAndTowers §7.3 uses the notion without defining it;
- the partial-operator lemma (§4.3);
- the rigidity over principal ideal domains (§6.3).

No declaration of `Suggested.lean` exists, so no fully qualified name can collide.

## Fixes from the upstream-reviewer reading

1. **§3.3 *Needs* listed gap:fixed-radius-divisibility although its route replaces that step.**
   - The route says the §1.7 vanishing "replaces, in the injectivity step, the fixed-radius divisibility". That vanishing holds for every central character, ζ = 1 included.
   - Removed the gap from §3.3's *Needs* and from §7.5's *Needs* ("through §3.3").
   - §3.1's sentence "the comparisons of the base become unconditional" now says that they hold without the global hypotheses. It also says that the base's injectivity step (infinite t-divisibility, checked in base §6.9 on main) rests on the gap, which §3.3 does not use.
   - The gap stays attached to that consequence: in §3.1's *Needs* and in the Layer 3 Dependencies.
2. **Layer 7 used the base §6.9's comparisons, and with them the gap, although §3.3 at n = 2r gives them at ζ = 1.**
   - The Layer 7 preamble now takes E_π ≅ O(Σ_r)^ρ from §3.3(i). For trivial central character this is the base's function-dual comparison.
   - §7.2 and §7.6 read the base §6.9(iii) identification as §3.3(ii) through §0.4(c). §3.3 states that recovery and proves the uniqueness up to L^× that makes the two agree.
   - §7.6's coadmissibility of O(Σ_r)^ρ now cites the anti-equivalence of base §0.1, which is the actual reason.
   - Added §3.3 to the *Needs* of §§7.1, 7.4 and 7.7 and §0.4 to §7.2's.
   - Layer 7 Dependencies drop gap:fixed-radius-divisibility. They gain gap:cuspidal-projectivity-coefficients "through §3.3", which §§7.3 and 7.5 already needed through §3.3 but the package did not list.
3. **§4.9 Check had the wrong sign.**
   - It said "translation by u(b) adds the constant b". Under the inverse-pullback convention, u(b) sends z to z − b.
   - Corrected, and the sentence now says why the translates are unbounded: |z − b| = |b| on the vertex affinoid for |b| > 1.
4. **§7.5 defined "infinitely primitivable" with no API.**
   - Added three API bullets:
     - stability under Ǧ and under the upper Borel B, computed as (d/dz)∘g = (δ/α)·g∘(d/dz) for g = (α β; 0 δ), with non-stability under G as in §1.7's Checks;
     - compatibility with Ǧ-type projectors;
     - H⁰_dR(Σ_r)·(infinitely primitivable functions of Ω) is contained in the space, z^j/j! being a j-th primitive of 1.
5. **§2.1 redefined a base name.**
   - It said "Π(π,0) := (E_π)′_b", although Π(π,0) is the base §6.9's name for Π^an/π.
   - It now says (E_π)′_b is isomorphic to the base's Π(π,0) and is identified with it below.
6. **Timeless wording.**
   - E1 and E7 said "already".
   - Downstream consumers said "No roadmap cites this one as a supplier".
   - Downstream consumers now records what the base (Scope), ProetaleCohomologyOfPAdicCurvesAndTowers (Downstream consumers) and TriangulineVarietyAndItsLocalModel (Scope) say about this roadmap. The last names §1.2 as the owner of the rank-two nontrianguline connection statements and uses nothing.
7. **Shape.**
   - Exact supplier contracts now have one subsection per supplier, as on main: From Mathlib, From Tau Ceti, and one "From TauCetiRoadmap.<X>" per roadmap.
   - The combined "PadicHodgeTheory and PadicDifferentialEquationsAndRigidCohomology" block and the "global and smooth suppliers" block are split.
   - Each gap stays under its supplier.
   - The Mathlib contract now names §6.3 alongside §4.3.

## Checks of citations and pins

- **Supplier section headings.** Every cited section resolves:
  - on main: PadicLocalLanglandsForGL2Qp (32 cited sections, including §§4.1k, 4.2a, 4.8, 4.9, 4.11, 5.8, 5.12, 6.9), PhiGammaModulesAndIwasawaCohomology §§2.4, 5.4, 5.6a, 5.7, LocallyAnalyticDistributions §§0.0, 0.2, 0.3 and SmoothRepresentationsOfLocalGroups SR.0, SR.2, SR.3a.1;
  - at their open heads, the twelve open suppliers, by heading.
- **Base contents on main.** The base merged to main after the package was last reviewed, so I read the cited contents on main: §§2.5, 4.1k, 4.2a, 4.8, 4.9, 4.11, 5.8 (the all-prime universal family paragraph and its Checks, p = 2 included), 5.12 and 6.9. They say what the README attributes to them, except the §4.9 definition (fix 4 of the sweep above).
- **Open suppliers.** I read GL2AutomorphicRepresentationsAndTransfer R16.1.8, R16.2.8 and R16.2.10, CompletedCohomologyAndLocalGlobalCompatibility §§2.7, 4.9 and 6.4, ScholzeFunctorAndModpCohomologyOfTheLubinTateTower §5.4 and Scope, ProetaleCohomologyOfPAdicCurvesAndTowers Scope and §§7.1–7.5, and LocallyAnalyticRepresentationsOfLocalGroups §§0.8 and 5.1 at their heads. The contracts match.
- **Mathlib at the pin `1b1ccf4b08`.** These were opened in the pinned sources:
  - `Bornology.IsVonNBounded` (Mathlib/Analysis/LocallyConvex/Bounded.lean:61, over a seminormed ring, with no Hausdorff or convexity assumption);
  - `NormedSpace.image_isVonNBounded_iff` (same file :495, nontrivially normed field, seminormed group);
  - `WithSeminorms.isVonNBounded_iff_seminorm_bounded` and `WithSeminorms.image_isVonNBounded_iff_seminorm_bounded` (Mathlib/Analysis/LocallyConvex/WithSeminorms.lean:659, :679, with the bound depending on i);
  - `WithSeminorms.banach_steinhaus` (Mathlib/Analysis/LocallyConvex/Barrelled.lean:164, barrelled source);
  - `DerivedCategory` (Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87, assuming `HasDerivedCategory`);
  - `Representation` (Mathlib/RepresentationTheory/Basic.lean:48);
  - `BDeRhamPlus` and `BDeRham` (Mathlib/RingTheory/Perfectoid/BDeRham.lean:75, :88).
- **Tau Ceti at the pin `2fd255d997`.** It has no Drinfeld half-plane, rigid space, Robba ring, p-adic Kirillov model, or locally analytic or Banach representation. This was checked by grep of the pinned sources.
- **Locators.** Source locators (line numbers of the cached copies) were not reopened in this port: I fetched no source and made no locator edit. Every locator I touched is unchanged text.

## Adversarial mathematics pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions, levels | n = 0, 1; r = 1 | 1+O_D ∋ 1+(−1) = 0, so K_D(0) = O_D^× is needed; ϖ_D² = pu gives 1+pO_D = 1+ϖ_D²O_D = K_D(2) ≠ K_D(1) | holds | none |
| Conventions, Σ₀ over ℚ_p | K = ℚ_p, ℚ_p², ramified quadratic | G_K acts on H⁰ = L² through Gal(ℚ_p²/ℚ_p) iff the residue degree is odd; invariants of dimension 1, 2, 1 | holds | none |
| Conventions, Lie action on O(Ω) | diag(e^s,1), diag(1,e^s), u(s), (1 0; s 1) | g⁻¹z = e^{−s}z, e^s z, z − s, z/(1 − sz); derivatives −zf′, zf′, −f′, z²f′ | holds | none |
| Conventions, Hodge–Tate and twist | ℚ_p(1) | t⁻¹e₁ ∈ Fil⁻¹∖Fil⁰; φ(t⁻¹) = p⁻¹t⁻¹, so D_pst(ℚ_p(1))[1] has φ = 1 | holds | none |
| Conventions, dual central character | z acting by χ(z) | (zℓ)(v) = ℓ(z⁻¹v) = χ(z)⁻¹ℓ(v) | holds | none |
| §0.1 | p = 2, 3; χ(p) = 1+p | \|𝔽_(p²)^×\| = 3, 8; p acts on JL(π₀)⊗χ∘Nrd by χ(Nrd p) = (1+p)² ≠ 1 | holds | none |
| §0.2 decomposition and level reading | irreducibles of Ǧ/(p^ℤK_D(n)); a_h on ∏_(h∈ℤ) L | dimension 1: χ∘Nrd = JL(Sp⊗χ) with χ(p)² = 1; dimension ≥ 2: JL of a supercuspidal. f_0 = f_1 = 0, f_(h+2) = f_h + a_h gives coker(T−1) = 0, with \|f_h\| ≤ sup\|a_h\| | holds | none |
| §0.3 | rank-one witness; Hodge–Tate types | ℚ_p t = ker(θ) on (B⁺_cris)^(φ=p); C⊗V ≅ C ⊕ C(1) | holds | none |
| §0.4(a)–(c) | ℒ = Le₁; twist μ(p) = −1; M in place of M[−1] | e₁ ↦ (w ↦ e₁∧w) kills e₁, giving ℒ^⊥ = Le₂*; μ²(p) = 1; central character η² with η(p)² ∈ {p², p⁻²} ≠ 1 | holds | none |
| §1.1 | jumps (−1,0), (0,1), (−k,0) | tN⁺ + L_n[[t]]ℒ; N⁺ + t⁻¹L_n[[t]]ℒ ⊄ N⁺; t^kN⁺ + L_n[[t]]ℒ | holds | none |
| §1.2 | (∇−h)(t^h x); trianguline e | ∇t = t gives t^h∇x = t^(h+1)∂x; ∇e = κ(δ)e is killed by X − κ(δ) | holds | none |
| §1.3 | trivial representation; φ with b = p⁻¹; base §4.9 | (Σ_(i<pⁿ) u(i))^k v = p^(nk)v ≠ 0; (1 − ζ_p)φ(1) ≠ 0; Σ_(i<p²) ε(ix) = p·Σ_(i<p) ζ_p^(iu) = 0 for u ≢ 0. The base space has no unipotent condition, so the package's "specialises to" was inexact | holds | comparison sentence (§1.3, Scope, contract) |
| §1.4 | p = 2; class of t⁻ʲe | ζ_2 = −1 is fixed by every σ_a, so m ≥ 2; t^(j−1)·t⁻ʲe = t⁻¹e ≠ 0 | holds | none |
| §1.5 | weights (0,1), (1,2); Sen polynomial X² − c | [u⁺,u⁻] = P(∇+1) − P(∇) = 2∇+1−k = a⁺ − a⁻; Casimir 2u⁻u⁺ + h + h²/2 = (k² − 4ab − 1)/2, giving 0, 0 and (4c−1)/2 | holds | none |
| §1.6 | V = L; f = t⁻¹, g = t | the orthogonal is tL_∞[[t]]; res(t⁻¹·t·t⁻¹dt) = 1, so negative powers are excluded | holds | none |
| §1.7 duality, density and Checks | u(p^N) on t⁻²e; annulus valuations in (0,1); (u(pⁿ)−1)² v = 0 | (e^(tp^N) − 1)t⁻²e ≡ p^N t⁻¹e mod D⁺, nonzero; no ℚ_p-point has valuation in (0,1); 1/z has residue 1; u(pⁿx)v is linear in x | holds | none |
| §1.7 against R16.2.8 | P-action on N⁺/D⁺ | t kills the coefficients, so (u(b)φ)(x) = ε(bx)φ(x); R16.2.8 has (π(b)f)(x) = ω(d)ψ(xu/d)f(xa/d), which at d = 1, ω = 1, ψ = ε is ε(xu)f(xa) | agree | new sentence and citation |
| §2.1 | section supported on pℤ_p | Weyl transform supported on w(pℤ_p) = ℙ¹∖ℤ_p | holds | naming of Π(π,0) |
| §2.2 | general g; w; u(b); aI₂ | g⁻¹z = (dz−b)/(a−cz); cw+d at w = g⁻¹z equals det g/(a−cz), so gu⁺g⁻¹ = (det g)⁻¹(a−cz)²u⁺; w: −∂²u⁺ = z²f′; u(b): ∂ − b; aI₂: a⁻²a² = 1 | holds | none |
| §2.3 | derivative step; trianguline V | (1+T)^(p^N) − 1 = p^N t + p^(2N)t²/2 + ⋯; t² is injective on a free Robba module | holds | none |
| §2.4 | central characters; k = 1, 2 | Π(M,k): x^kω; Π(M,−k)⊗x^k: x^kω; ω = x⁻¹ for trivial ζ; det Δ_(2,ℒ)(p) = p² p⁻¹ = p, not a unit; δ_2(p)² = p⁻¹ | holds | none |
| §3.1 Lie action and duals | O(k); O(2)⊗det; O′ | a⁺ = −zf′ − kf = (u⁺∂+1−k)f; u⁻ = z²f′ + kzf. On (Ω¹)′, with ∂u⁺ − u⁺∂ = 1: a⁺ = ∂u⁺, a⁻ = −u⁺∂ − 1 = −∂u⁺, u⁻ = −u⁺∂² − 2∂ = −∂²u⁺. On O′: a⁺ = ∂u⁺ − 1 | holds | none |
| §3.1 Checks | u(p⁻¹); f = (1,−1); ρ = 1⊕1 | (p 1; 0 p) has elementary divisors 1, p²; diag(p,1)f = −f; Hom(1⊕1, 1) = L² | holds | none |
| §3.1 consequence for the base | base §6.9 on main | its injectivity uses "infinite t-divisibility", which is the step E9 corrects | holds | rephrased; gap attached |
| §3.3 | A = diag(1,2); three lines; p = 7, ω | L(e₁+e₂) ↦ L(e₁+2e₂); fixing Le₁, Le₂, L(e₁+e₂) forces α = β; squares of characters of μ₆ have order dividing 3, ω\|μ₆ has order 2 | holds | *Needs* drops the replaced gap |
| §4.1 | n = 0; slope 0 | Ǧ/O_D^× ≅ ℤ is abelian; (B⁺_cris)^(φ=1) = ℚ_p ≠ 0 | holds | none |
| §4.2 | u(pⁿ), μ = δ₀ − δ_∞; centre | g_nμ − μ = δ_(pⁿ) − δ₀ of norm 1; δ(a²) on G and on Ǧ | holds | St^an cited, not defined |
| §4.3 | d = 2; d = 3 with S = Le₁⊕Le₃, Ae₁ = e₂, Ae₃ = e₁; S = 0, S = E | trace λ₁+λ₂, det λ₁λ₂; the all-positive column gives −λ₁λ₂. For d = 3 the only invariant T is 0 and the chain e₃ → e₁ → e₂ gives a companion basis. S = E always has T = E | holds | none |
| §4.4 | V = L, L(1) | H_C(L) = F⊗L; H_C(L(1)) = (C(−1)⊗L)^(G_F) = 0 | holds | none |
| §4.5 | E with ge₂ = e₂ + logχ(g)e₁ | H⁰ = Le₁, since logχ is no coboundary in C; c(g) = l_g e₂ + l_g²e₁/2 satisfies c(gh) = c(g) + g c(h) | holds | none |
| §4.6 | [F:ℚ_p] = 2 | weights (0,0), (1,1) have sum 2 | holds | none |
| §4.7 | e ↦ ae | e* ↦ a⁻¹e*, product unchanged | holds | none |
| §4.8 | n·x = pⁿx on ℚ_p; seminorms i·p_i | \|pⁿx\| = p⁻ⁿ\|x\| → ∞ as n → −∞; the bounds depend on i | holds | none |
| §4.9 | z on Ω; a_h = 1 | u(b)z = z − b, so sup\|z − b\| on the vertex affinoid is \|b\| → ∞; f_h ∈ ℤ with \|f_h\| ≤ 1 | holds | sign of the Check corrected |
| §4.10 | ℓ = f ↦ f′(0) on St^an; F_m | ℓ(z·1_(ℤ_p)) = 1; diag(pᵐ,1)ℓ = pᵐℓ; sup\|F_m\| ≤ p⁻ᵐ while \|ℓ(F_m)\| = pᵐ | holds | none |
| §4.11 | V_ℒ ⊕ V_ℒ′ | length 2 | holds | none |
| §§4.12–4.14 | Π_(M,ℒ); twist χ(p) = 1+p; centre | dimensions dim JL(M) and 2·dim JL(M); ζ⁻¹ on Π* against ζ on JL(M); the twist gives 0 | holds | none |
| §5.1 | p = 5, μ_j | the indicator of 5^jℤ_5^× pairs to 1 with μ_j and 0 with μ_l; u(5^j)(δ₀ − δ_∞) − (δ₀ − δ_∞) = μ_j | holds | none |
| §5.2 | ϖ² = p | O_L/p = O_L/ϖ² has length 2 | holds | none |
| §5.3 / §5.5 | m = O_L | O_L-dual O_L; Pontryagin dual L/O_L = ϖ(L/O_L), not finitely generated | holds | none |
| §5.4 | diag(5,1), μ = δ₀ − δ_∞ | gμ = μ, g(μ,0) = (0,μ), g(μ,μ) = (μ,μ) | holds | none |
| §5.6 | n = 0, n′ = 1; special M | order p²−1 = 3, 8; δ_M = δ⁻² | holds | none |
| §6.1 | Π(ρ_x(ε)) against Π(ρ_x); indexing by M | ratio of central characters ε²; \|η(p)²\| = p^(∓2) | holds | none |
| §6.2 | p = 7, χ of order 3 | dual scalar η(a²)⁻¹ζ₃ against η(a²)⁻¹ζ₃² | holds | none |
| §6.3 | DVR, χ(p) = 1+p; p = 2, Ind ω₂ | det ratio (1+p)² ≠ 1; χ₀(2) = −1 ≡ 1; ω₂ ≠ ω₂² gives absolute irreducibility | holds | none |
| §6.4 | L[T]/(T²) | (T) kills every fibre, T·1 ≠ 0 | holds | none |
| §6.5 / §6.6 | R = L; A = L⟨T⟩ | Ř = L; Ǎ = ℓ^∞ with surjective left shift and kernel L·ev₀, so Ǎ/TǍ = 0 | holds | none |
| §7.1 | cocycle; aI₂ | a′(a−cz) − c′(dz−b) = (aa′+bc′) − (ca′+dc′)z; a⁻ᵏ | holds | *Needs* + §3.3 |
| §7.2 | k = 0, 1; a = p | middle term a^(−k−2)a^(2k+2) = a^k; preimage a^(−k)a^(2k) = a^k; O(s)[M] has a⁻ˢζ(a)⁻¹ | holds | §3.3(ii) route; *Needs* + §0.4 |
| §7.3 | p = 2, 3 | ϖ_K^(p²−1) = −p gives y′^(p²−1) + (z−z^p)^(p−1) = 0; ζ^(p−1) = −1 lies in μ_(2(p−1)) ⊂ ℚ_p²; genus p(p−1)/2 = 1, 3 | holds | none |
| §7.4 | V trivial; p = 2 | dim H¹_e = 0, dim H¹_f = 1; Γ_1 = Γ | holds | *Needs* + §3.3 |
| §7.5 | (1,−1) over ℚ_p²; g ∈ B; w | primitives (z^j/j!, −z^j/j!); (d/dz)∘g = (δ/α)g∘(d/dz); w·z = 1/z is not primitivable | holds | API added; *Needs* drops gap |
| §7.6 | two lines ℒ₁ ≠ ℒ₂ | P₁ + P₂ = Ω¹ and P₁ ∩ P₂ = dO, so Ω¹ = coker(x ↦ (x,−x)) | holds | §3.3 route |
| §7.7 | ρ ≅ ρ^∨ | π^∨ ≅ π⊗ω_π⁻¹ = π and JL commutes with contragredients | holds | *Needs* + §3.3 |
| Contract, LocallyAnalyticDistributionsPartII (HYP) | p odd; p = 2 | ω = 1 with 1+1 > 3/2; ω = 2 with 2+2 > 2 | holds | none |
| Contract, `NormedSpace.image_isVonNBounded_iff` | variable block | NontriviallyNormedField, SeminormedAddCommGroup, NormedSpace | as stated | none |

## Unresolved

- **Supplier gaps.** The four gaps remain open requests against their suppliers, none provided at the heads I read:
  - gap:cuspidal-projectivity-coefficients (GL2AutomorphicRepresentationsAndTransfer R16.2.10);
  - gap:fixed-radius-divisibility (PadicLocalLanglandsForGL2Qp §6.9, on main);
  - gap:continuous-galois-tensor-comparison (PadicHodgeTheory §4.4);
  - gap:three-period-line-globalisation (CompletedCohomologyAndLocalGlobalCompatibility §6.4).
- **gap:fixed-radius-divisibility is now consumed only by §3.1's consequence for the base.** After the edits, no target of this roadmap consumes it except that consequence: that the base §6.9 comparisons hold without global hypotheses. I kept the gap because the base's Scope assigns that discharge to §3.1. Whether to keep it as a contract against a roadmap on main, or drop it and leave E9 as the record, is the maintainer's decision.
- **Human scope question from the last review.** It stands: the Galois-socle headline (§4.14) and §§3.3(iii), 4.7, 4.12–4.13 and 7.3 rest on gap:three-period-line-globalisation. No cited source states three such forms.
- **Base §4.8 at k = 0.** Base §4.8 treats the special parameter δ_s = x^k with k = 0, which gives St^an(χ,1), only as "the formal k = 0 special case" in its Checks. §4.2 therefore also cites LocallyAnalyticRepresentationsOfLocalGroups §5.1, whose Checks state the induction and its constants directly.
- **`module` header.** The `module` / `public import Mathlib` header is a deviation from the package's literal `import Mathlib`. It is the only way to get a build with no warning; it matches 61 files on main, and the gate accepts it.
- **Ownership against open pull requests** was checked with `roadmaps grep` over all 452 open roadmap pull requests at their heads, and by reading the twelve open suppliers.
- **Suspicious text.** None was met in any file, review or report read.


Pull request: #2455 (roadmap/padic-local-langlands-for-gl2-qp-part-ii at 04fba00)
