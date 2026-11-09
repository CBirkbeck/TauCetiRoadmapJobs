# Review of EtaleDualityAndPerverseSheavesPartII (pull request #1743 at c8b9b83)

**Verdict:** needs changes

The head is the one the previous review read: 0 lines changed in the folder. This is a full review of the folder, not only the carried finding. There are two findings. R01 is the carried two-owner finding, and its repair is in PurityForFlatCohomology. R02 is new: a P3 supplier attribution in §8.3.

## R01 (P2) — Local Lefschetz and local duality on regular local rings still have two owners

This is R01 of the previous review, carried forward. No repair report marks it as not actionable.

**Location:**
- `TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/README.md:23`: "PurityForFlatCohomology takes the local Lefschetz theorem from §7.3 for the hypersurface step of its bound of the étale depth by the virtual dimension, and owns none of these statements."
- `README.md:1644`: "PurityForFlatCohomology §1.6 consumes local Lefschetz (§7.3)".

**Claim:** this roadmap is the only owner of §7.1 (affine Lefschetz on principal punctured opens), §6.11 (the normalised dualizing complex), §6.12 (local duality) and §7.3 (local Lefschetz).

**Witness:** PurityForFlatCohomology (#1840) has moved from fb0e7fb7 to d3f15fd9, and the duplication is still there:
- In `TauCetiRoadmap/PurityForFlatCohomology/README.md`, §1.4 (`:1107`) states (a) = our §7.1, (b) = our §6.11 and (c) = our §6.12.
- §1.5 (`:1160`) states our §7.3.
- `:206–207` and `:3471–3472` name this roadmap as the importer of §§1.4–1.5.
- The *Needs* of §1.6 (`:1201`) cites its own §1.5.

**Repair** (in PurityForFlatCohomology; nothing in this folder changes):
- Delete §§1.4–1.5 and the importer bullets at `:206–207` and `:3471–3472`.
- Cite EtaleDualityAndPerverseSheavesPartII §§7.1, 6.11, 6.12 and 7.3 in their place.
- At `:1195`, replace "(§1.5:" by "(EtaleDualityAndPerverseSheavesPartII §7.3:".
- At `:1201`, replace "§§0.2, 1.1, 1.5" by "§§0.2, 1.1; EtaleDualityAndPerverseSheavesPartII §7.3".

PurityForFlatCohomology §1.4(a) is a special case of this roadmap's §5.7, and its route has no proof of Gabber's theorem of its own. So the owner should be this roadmap, not PurityForFlatCohomology.

**Test, rerun at d3f15fd9:** I made the `:1201` edit on a scratch copy of that README.
- With `--movable`, the dependency check prints `moved: PurityForFlatCohomology moved in the merge order from #220 to #388, right after its last supplier EtaleDualityAndPerverseSheavesPartII`, then `depcheck: 235 roadmaps, 2267 edges, 0 problem(s)`. A `moved:` line is not a defect.
- Without `--movable`, it prints `UPWARD: PurityForFlatCohomology (#220) -> EtaleDualityAndPerverseSheavesPartII (#388) at README lines [1201]`.

## R02 (P3) — §8.3 cites ArcTopologyAndDescent §8.9 for an idempotent comparison it does not state

**Location:** `README.md:1568`: "Replace A by its ϖ-adic completion; idempotents of U do not change (the idempotent and completion comparison of ArcTopologyAndDescent §8.9)."

**Claim:** ArcTopologyAndDescent §8.9 supplies the invariance of Idem(U) under ϖ-adic completion.

**Witness:** ArcTopologyAndDescent (#1755 at dfd2dd1c), §8.9 at `README.md:1151–1161`. It compares RΓ(U, F) with RΓ(U ×_A Â, F) for torsion abelian F, and support complexes. It contains no idempotent clause: "idempot" does not occur in the section.

**Repair:** replace the parenthesis at `:1568` by:

> (idempotents of Γ(U, O_U) are the locally constant functions U → {0, 1}, that is H⁰_ét(U, ℤ/2) with its pointwise ring structure; ArcTopologyAndDescent §8.9 in degree 0 with F = ℤ/2 identifies them for U and U ×_A Â, compatibly with products and hence with orthogonality)

The *Needs* line of §8.3 already lists §§8.6–8.9.

**Test:** take A = 𝒪_C × 𝒪_C and U = Spec A.
- H⁰(U, ℤ/2) = (ℤ/2)² matches the four idempotents 0, 1, (1,0) and (0,1).
- (1,0)·(0,1) = 0 matches the disjoint supports.
- A is already ϖ-complete, so the comparison is the identity, as it must be.

## Previous findings

- **R01 (previous review): not repaired.** `README.md:23` and `:1644` are unchanged; `scratch/changes.md` reports 0 changed lines. At its new head d3f15fd9, PurityForFlatCohomology still states §1.4 (`:1107`) and §1.5 (`:1160`), still names this roadmap its importer (`:206–207`, `:3471–3472`), and still cites its own §1.5 at `:1201`. Raised again as R01.

## Verified sound

### Gate, dependency check, build, signatures and padding (run on this head)

- **Gate:** `tauceti-roadmap gate … --base origin/main` prints `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` and exits 0. The worker's `gate.md` adds `build=0`.
- **Outside the folder:** `git diff --stat origin/main...HEAD` lists no paths.
- **Dependency check** (`--movable`), output in full: `depcheck: 235 roadmaps, 2265 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Build:** `lake env lean` on `Suggested.lean` exits 0 in 19.5 s. The only warnings are eight "declaration uses `sorry`", at lines 77, 100, 193, 237, 274, 294, 309 and 332.
- **Signatures:** `scratch/signatures.md` reports 11 declarations and 0 dropped binders. I compared each of the 8 theorem types with its README statement (§§1.1, 1.2, 1.4, 1.6, 1.7, 5.7, 5.8, 5.9).
  - Hypotheses and generality agree.
  - The ∃-bound `Algebra` structures of §§1.1–1.2 are the only instances available: the pins have no global `Algebra (MvPowerSeries σ k) A`.
- **Padding probe:** I replaced each `sorry` in a scratch copy by `first | rfl | infer_instance | decide | trivial | simp | exact Classical.ofNonempty | aesop`. All 8 theorems fail, with unsolved goals or `aesop` making no progress. No padding.
- **Headlines:** the 8 statable headlines are stated. The docstring names the rest and what each lacks.
  - Local Lefschetz really is not statable: the pinned `Mathlib/AlgebraicGeometry/Sites/` has the small étale site, its points (`EtalePoint.lean`) and `Sheaf.H`, but no pullback or pushforward of étale sheaves along a morphism of schemes, hence no restriction map.

### Library declarations opened at the pins

I put `#check` on 45 names in one scratch file; it elaborates with no error. The ones the statements and routes rest on:

**Tau Ceti:**
- `TauCeti.Excellence.IsGRing`, `RingTheory/RegularLocalRing/GRing.lean:57`. Its fields are `isNoetherianRing` and `regularAlgebraMap_adicCompletion` at every prime, as `README.md:68` says.
- `cohomologicalDimensionAt`, `…/CohomologicalDimension/Basic.lean:146`.
- `cohomologicalDimensionAt_le_of_isClosed`, `ClosedSubgroup.lean:80`. Needs compact and totally disconnected G.
- `cohomologicalDimensionAt_eq_of_isOpen_of_ne_top`, `OpenSubgroup.lean:111`.
- `cohomologicalDimensionAt_congr`, `ContinuousMulEquiv.lean:78`. G and H in one universe.
- `exists_isProPSylow`, `Sylow/Existence.lean:102`.
- `IsProPSylow.cohomologicalDimensionAt_eq`, `Sylow/CohomologicalDimension.lean:95`.
- `IsProP.cohomologicalDimensionAt_le_iff_subsingleton_cohomFp`, `ProP/CohomologicalDimension.lean:133`.
- `absoluteGaloisGroupRestrictEquiv` and `fixingSubgroup_fixedField`, `AbsoluteGaloisGroup/Basic.lean:340` and `:227`.
- `absoluteGaloisGroupEquivFixingSubgroup`, `Extension.lean:188`. Takes σ : L →ₐ[K] SeparableClosure K.
- `galoisSubgroup`, `FiniteExtension.lean:143`.
- `AdicCompletion.ringKrullDim_eq`, `RingTheory/AdicCompletion/LocalRing.lean:52`.
- `Module.Baer.zmod_self`, `Algebra/Module/ZMod/Injective.lean:50`. Needs `[NeZero n]`.

**Mathlib:**
- `Algebra.IsEtaleAt`, `RingTheory/Etale/Locus.lean:35`: formal étaleness of the localization, as `README.md:60` says.
- `Module.IsTorsionFree`, `Algebra/Module/Torsion/Free.lean:48`: every regular scalar acts regularly.
- `IsFormallyReal`, `Algebra/Ring/IsFormallyReal.lean:105`.
- `FixedPoints.finrank_eq_card`, `FieldTheory/Fixed.lean:346`. Needs `FaithfulSMul`.
- `CategoryTheory.Sheaf.H`, `CategoryTheory/Sites/SheafCohomology/Basic.lean:57`.
- `AlgebraicGeometry.Scheme.smallEtaleTopology`, `AlgebraicGeometry/Sites/Etale.lean:50`.
- Also elaborated: `IsSepClosed.lift`, `separableClosure.isSeparable`, `separableClosure.isPurelyInseparable` (needs `Algebra.IsAlgebraic`), `instSubsingletonAlgHomOfIsPurelyInseparable` (needs reduced L), `IsAlgClosure.equiv`, `InfiniteGalois.fixingSubgroup_isClosed`, `ringKrullDim_quotient_span_singleton_succ_eq_ringKrullDim`, `Ideal.height_le_one_of_isPrincipal_of_mem_minimalPrimes`, `AdicCompletion.maximalIdeal_eq_map`, `AdicCompletion.residueField_map_bijective`, `IsAdicComplete.henselianRing`, `Coverage.toGrothendieck`, `Scheme.zariskiTopology`, `IsRegularLocalRing`, `PreTilt`.

**Near-matches:** none of the leads in `scratch/library-matches.md` proves a headline. They are Weierstrass division, Noether normalisation, `exists_etale_of_isEtaleAt`, Krull-dimension lemmas and the like.

### Seeded source sample (all 15 verified at the locator)

Pages are printed pages: the arXiv ILO14 has offset 6 from its PDF page.

| Target | Locator checked | Hypotheses and statement against README |
| --- | --- | --- |
| §0.1 alt/S | ILO14 lines 1158, 1198, 1221, 1247, 1253; pp. 23–25 | Def 1.1.2, 1.1.8, 1.2.2, 1.2.5 and Prop 1.2.6 match; S noetherian. |
| §0.2 ℓ′-alterations | ILO14 lines 1294, 1374–1389; pp. 26–28 | 2.1.1, 2.3.1–2.3.4 match. 2.3.4 itself allows a locally noetherian S′. |
| §0.6 reduction to henselian | ILO14 lines 1614–1641; p. 33 | 4.3.1–4.3.3 match. The source's resp. clause reads "excellent of finite dimension ≤ d"; the README's quasi-excellent version is what the proof (line 1641, henselisation excellent) gives. |
| §0.8 h-topology | ILO-final-XII lines 229–240 (p. 241); ILO-final-XIII lines 105–108 (p. 263); ILO14 line 1394 (p. 28) | Generated by proper surjections and Zariski covers; II-3.2.1 alteration covers are h-covers. |
| §1.1 Cohen–Gabber | ILO14 line 2276; p. 50 | Reduced, equidimensional, equal char p, finite, torsion-free, generically étale, iso on residue fields: match. |
| §1.6 partial algebraization | ILO14 lines 2884–2892 (pp. 64–65), 2981 | Reduced, equal characteristic, not a field, finite ideal family; V 3.1.4 gives the regular base. |
| §2.2 weak uniformization | ILO14 line 3577; p. 81 | VII 1.1: regular connected members, snc preimage. |
| §2.4 h-hypercover | ILO-final-XIII lines 99–108 (p. 263); ILO14 line 10474; ILO-final-IX line 27 (p. 161); ILO-final-II line 301 (pp. 28–29) | Regular terms, snc-complement-or-empty in every degree; affine refinement XV 3.1.2. |
| §3.2 tube base change | ILO14 lines 8381–8391; pp. 178–179 | XI 2.4 and Lemme 2.5: coherent topoi and morphisms, any ring Λ, D⁺. |
| §4.2 finiteness | ILO14 line 9260; p. 195 | XIII 1.1.1–1.1.2: identical hypotheses. |
| §5.5 trait step | ILO14 lines 10337, 10552–10560 (pp. 219, 224); 10484–10486 | XV 3.3.2 applies [Ill03 2.4] to an affine U in a strict localization essentially of finite type over S. |
| §6.6 potential dualizing | ILO14 line 13878; p. 287 | XVII 5.1.1: excellent ℤ[1/n], dimension function, unique up to unique iso, τ≤0 statement, Perv^(−2δ). |
| §6.10 duality theorem | ILO14 lines 12208–12235 (p. 257); line 417 (p. 6); G04 lines 441–464 (pp. 10–11) | XVII 0.8, 0.9 and G04 Lemma 8.1 match. Two source slips recorded below. |
| §7.2 extension by zero | CS24 lines 1361–1380; p. 33 | (3.2.3.1) for regular local R, f ∈ 𝔪, ℓ invertible. |
| §8.3 idempotents | CS24 lines 827–851; pp. 21–22 | Thm 2.2.7 hypotheses (ϖ^p ∣ p, henselian, bounded torsion, perfectoid completion) and proof, first part. |

The README flags no locator as unverified.

### Adversarial table

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| §0.1 alt/S | S = 𝔸²_k, X = Bl₀; S = Spec k, T = 𝔸¹_k; origin of 𝔸¹ | X ×_S X has the diagonal closure and E × E, both of dim 2; md keeps 1. T^md = T, but k(t)/k is infinite, so T is not in alt/S. The origin is not maximally dominant. | holds; md is not generic finiteness |
| §0.2 alt_ℓ′ | Spec ℤ[i] → Spec ℤ at ℓ = 3 and ℓ = 2 | Degree 2 ∈ 3′, so covering. 2 ∉ 2′; every alt_2′ family has an odd-degree generic point, never containing ℚ(i). | holds |
| §0.6 uniformization reduction | Spec k[x,y]/(xy), Z = node; Spec(k × k), Z = ∅; X = ∅ | 2 members (branches), 1-point preimages; 2 members minimum; 0 members | holds |
| §0.8 h-topology | Bl₀𝔸² → 𝔸²; 𝔾_m ⊂ 𝔸¹; point inclusions into Spec ∏_ℕ 𝔽₂; x ↦ x² on 𝔾_m | Fibre dims 1 vs 0: h-cover, not fppf. Misses the origin: not a cover. No finite jointly surjective subfamily: not a cover. Finite surjective of degree 2: cover. | holds |
| §1.1 / `cohenGabber_equalCharacteristic` | cusp y² = x³ at p = 2, 3; 𝔽_p(s)⟦x⟧ over k⟦x^p⟧; d = 0 | p = 2: t ↦ y, ∂ₓ = x² ≠ 0, separable degree 3. p = 3: t ↦ x, ∂_y = 2y ≠ 0, degree 2. k⟦x^p⟧: purely inseparable of degree p, not étale. d = 0: A = k, degree 1. | holds; the residue equation is equivalent to the source's residue-field isomorphism after composing with φ⁻¹ on coefficients |
| §1.2 / `cohenGabber_equivariant` | μ₂ on k⟦x⟧; S₃ on k⟦x₁,x₂,x₃⟧; x ↦ x/(1+x) in char 2; G = 1 on k⟦x,y,z⟧/(xy,xz) | t = x², degree 2. Symmetric functions, degree 6. 2 = 0, so `horder` fails. t₁ ↦ x + y, t₂ ↦ z: A/(t) ≅ k⟦x⟧/(x²), finite and injective, generic fibre k⟦y,z⟧ étale. | holds; injectivity follows from the dimension count |
| §1.4 / `cohenGabber_mixedCharacteristic` | identity on ℤ_p⟦x⟧; V = W[π]/(π^ℓ − p) with H = μ_ℓ, A = W⟦x⟧ ⊂ B = V⟦x⟧; t ↦ x^p | Degree 1. [Frac B : Frac A] = ℓ, but B^H = A and the invariant degree is 1. p x^(p−1) ∈ 𝔪 at the generic point of the p-fibre, so `etaleAtPFibre` fails. | holds; the condition is equivalent to p-dense étaleness: the étale locus is open, finite images are closed, and (p) has the single minimal prime (π) |
| §1.6 / `partialAlgebraization_equalCharacteristic` | k⟦x,y⟧/(xy) with (x), (y); A a field | B = k: dim 0 = 1 − 1, regular. A field is excluded by `hpos` and by the source's "not a field". | holds |
| §1.7 / `partialAlgebraization_mixedCharacteristic` | ℤ_p⟦x⟧ with (x − p); p = 3, ℓ = 2, C₂ acting on π | B = ℤ_p: 1 + 1 = 2, regular, char 0, residue 𝔽_p. A′ = W⟦x⟧ over C = W[x], 𝔫 = (3, x). b₀² = 3 forces 2v₃(b₀) = 1, so there is no V-structure. | holds |
| §2.2 weak uniformization | cone xy = z², including char 2 | Blow-up charts regular. The conic's partials (y, x, 2z) vanish only at 0 in char 2, so it is smooth. | holds |
| §2.4 h-hypercover | constant Bl₀𝔸²_ℂ; Spec k → Spec k[ε] | T ×_X T ⊇ E × E (dim 2) and the diagonal misses pairs of distinct points, so this is not a scheme h-hypercover; the Čech nerve is. The reduction is a finite surjective h-cover. | holds |
| §3.2 tube base change | X = Y = S a strict trait, g = id | Left side F. Stalk at s of the right side: RΓ(S_(s), F) = F_s̄. | equal |
| §4.2 finiteness | snc boundary, r = 0, 1, 2; ℤ/p in char p | Ranks (1), (1,1), (1,2,1); N = r + 1. H¹(𝔸¹_k̄, ℤ/p) contains the classes t^m, p ∤ m, so it is infinite. | holds; n invertible is needed |
| §5.5 trait step | strict trait with U = η; Spec k; strict localization of 𝔸¹_S | H¹ = ℤ/n(−1) and H² = 0 at d = 1. d = 0 vanishes for q > 0. m-th roots of 1 + x for every invertible m give an infinite algebraic extension of K(x). | holds; not `EssFiniteType` |
| §5.7 / `affineLefschetz_strictlyLocal` | strict trait, U = η, n = 2; d = 0; punctured k⟦x,y⟧; non-noetherian V with value group ℤ + ℤ√2; n = 1 | H¹ = ℤ/2 at q = d is not claimed; H^{≥2} = 0. d = 0 vanishes. H³ = ℤ/ℓ(−2) is excluded by affineness. H² = ℤ/ℓ at d = 1 is excluded because `IsGRing` contains `isNoetherianRing`. ZMod 1 = 0. | holds; each hypothesis is used |
| §5.8 / `cohomologicalDimension_le_of_strictlyLocal` | k⟦t⟧; punctured k⟦x,y⟧; Spec k | H¹ ≠ 0 at 1 < 2 and H^{≥2} = 0. H³ ≠ 0 at 3 < 4. cd 0 > −1, so `hd` is needed. | holds, sharp |
| §5.9 / `cohomologicalDimension_fractionRing_eq` | ℤ_p with ℓ ≠ p; W(k̄)⟦x⟧; (ℝ[x,y]/(x²+y²))^h at ℓ = 2 and 3; ℝ⟦t⟧ at ℓ = 2; 𝔽_p⟦t⟧ at ℓ = p; d = 0 | 2 = 1 + 1. 2 = 2 + 0. 1 vs ∞, excluded by `hreal`; 1 = 1 + 0. ∞ = 1 + ∞ (excluded, but true). ≤ 1 vs 2, excluded by `IsUnit`. c = 0 + c. | holds |
| §6.6 potential dualizing complex | regular X with δ = −codim, n = 5; strict trait with δ(s) = 0 | Automorphisms of Λ_X in D: (ℤ/5)ˣ, 4 of them. Pinned: 1. One isomorphism to Λ(1)[2]. | holds |
| §6.10 duality theorem | strict trait, Λ = ℤ/6, K ⊗ (𝔽₂ ⊕ 𝔽₃[1]) | n₂ = (−2, 0) and n₃ = (−3, −1); ⌊−n/2⌋ = (1, 0) for both factors; no common shift | holds |
| §6.11 normalised complex (R01) | d = 0, 1, 2; n = 6, d = 1 | Λ; Λ(1)[2]; Λ(2)[4], with closed support Λ in degree 0. μ₆[2] = μ₂[2] ⊕ μ₃[2]. | holds |
| §6.12 local duality (R01) | strict trait, F = Λ, K = Λ(1)[2] | H²_x(Λ) = Hom(Λ(1), Λ) = Λ(−1), as Kummer gives | holds |
| §7.1 punctured opens (R01) | d = 1 with f a uniformizer; f = 0 | H^{>1}(η) = 0. The open is empty. | holds |
| §7.2 extension by zero (R01) | R = k⟦x,y⟧, f = x | Exact sequence with H^{<4}_𝔪(R) = 0: H^i_𝔪(j_!) = 0, 0, 0, ℤ/ℓ(−1) for i = 0…3. Duality side: H^q(R[1/x]) = ℤ/ℓ, ℤ/ℓ(−1), 0, so only i = 3, 4 survive. | agree; zero for i < 2 |
| §7.3 local Lefschetz (R01) | k⟦x,y⟧ with f = x, i = 0, 1, 2; a DVR at i = 0; f = 0 | 0 → 0, 0 → 0; at i = d, 0 → ℤ/ℓ(−1) is not surjective. DVR: 0 → ℤ/ℓ is injective. f = 0: the identity. | holds; range sharp |
| §8.3 idempotents (R02) | 𝒪_C × 𝒪_C | 4 idempotents on each side. Sending both primitive idempotents to (1,0) keeps idempotency but breaks (1,0)(0,1) = 0. H⁰(ℤ/2) = (ℤ/2)². | holds; only the attribution changes |

### Cross-roadmap citations resolved

About 95 section ids across 14 suppliers, each at the copy named:

- **On main (3090489):**
  - SchemeAndStackFoundations §§0.7, 0.9, 0.12–0.16, 0.20–0.22, 2.11, 2.12, 2.15, 2.16, 4.16–4.20, with `spreading_out_models` (`:865`), `etale_galois_comparison` (`:3872`), `etale_cohomology_limits` (`:3877`) and `excellent_examples` (`:1421`, which includes complete noetherian local rings).
  - EtaleCohomologyFoundations §§F.0.1–F.0.3, 0.7, 0.9, 0.10, F.1, F.2.1–F.2.4, F.3, F.5, F.6, F.8.
  - EnhancedDerivedSheaves §§0.1–0.4, E2, E2.6, E2.8.
  - AdicEtaleGeometry §§A1.14–A1.15.
- **At their open heads:**
  - ArcTopologyAndDescent §§1.3, 3.6, 8.6–8.9, 11.1, 11.2, 11.5, 12.6. §11.2 does contain the quasi-compact-open splitting.
  - LefschetzPencilsAndVanishingCycles §§0.2–0.5, 0.10, 6.2.
  - AdicCoefficientsAndComparisonsPartII §§PA.0.2–PA.0.8, PA.0.11, PA.1.2–PA.1.4, PA.4.1–PA.4.8, PA.5.1–PA.5.4.
  - ClassicalAdicEtaleCohomology §§5.3–5.4. §5.3 states the pro-p quotient invariance for any closed normal pro-p subgroup.
  - NoncommutativeAndEquivariantIwasawa §0.11, with `cd_p_eq_of_isOpen_of_noPTorsion` for an arbitrary prime.
  - AlgebraicModuliForArithmeticGeometry §§6.0–6.1.
  - DeformationAndDerivedPatchingAlgebra §1.10.
  - EtaleDualityAndPerverseSheaves §§0.1, 0.2, 1.1, 2.2, 2.4, 2.11.
  - PerfectoidQuotients §§0.4–0.6.

**The leads in `scratch/citations.md`:**
- PerfectoidQuotientsPartII is a board package at merge-order #219, earlier than this roadmap's #388. Its `README.md` has Q5.1 (`:343`), Q5.2 (`:382`), Q5.3 (`:417`, the sharp quotient modulo ϖ^p and ϖ♭-completeness), Q6.2 (`:604`) and Q6.3–Q6.7 (`:633–734`).
- The six Lean names resolve in EtaleCohomologyFoundations on main, in its README and its `Suggested.lean`:
  - `VanishingCycles.etaleExceptionalInverseImage` (`:1181`), `etaleTateTwists` (`:233`) and `smoothPurity` (`:1202`).
  - `ClassicalAlgebraic.lciCycleClass` (`:1135`), `supportLocalization` (`:443`) and `smoothBoundaryPurity` (`:1147`).

### Declared gaps

The five slugs in the README equal the five in `design/plan.json`, with the same suppliers and sections. Each `needs` sentence is single and carries its hypotheses. None is already provided:

- **SchemeAndStackFoundations §0.14:** has smooth lifting and the finite-étale equivalence modulo I, but not Elkik's finite-algebra algebraization.
- **SchemeAndStackFoundations §0.21:** has no henselization permanence and no henselian universal catenarity.
- **EtaleCohomologyFoundations §F.3:** its generic statements are over a field or an excellent trait only (`:744–750`).
- **LefschetzPencilsAndVanishingCycles §6.2:** has the perverse t-structure, nearby-cycle t-exactness and Gabber's vanishing-cycle perversity, but not the affine support bound.
- **DeformationAndDerivedPatchingAlgebra §1.10:** has strict Cohen rings, but no coefficient field attached to a p-basis lift.

### Ownership

I ran `roadmaps grep` over main and all 458 open heads for Cohen–Gabber, partial algebraization, affine Lefschetz, potential dualizing complexes, local uniformization, oriented products and descent, tube base change, the h-topology and dimension functions. The only second owner is PurityForFlatCohomology (R01). The other hits are different objects:

- DeformationAndDerivedPatchingAlgebraPartII's dimension function is the coherent one of Stacks 0A7Z.
- AdicCoefficientsAndComparisonsPartII §PA.6.11 is de Jong 1996, Thm 7.3, over an algebraically closed field. §2.1 here is DJ97, Thm 2.4, over an excellent base.
- ClassicalAdicEtaleCohomology §5.4 owns DJ97, Cor. 5.10, which §2.1 cites.
- SchemeAndStackFoundations §0.7 is dimension theory over a field.
- EtaleDualityAndPerverseSheaves (Part I) stops at finite-type schemes.

`scratch/overlaps.md` lists no pull request changing this roadmap and no dropped or revision-only id. The overlap check reproduces that.

## Not verifiable

- **Ill03, Epp73 and Ser65** are settled as uncertified, and I did not read them.
  - Their uses are checked through the texts that recall them: ILO14 lines 10337 and 10552 for the trait affine Lefschetz contract; ILO14 line 2524 and K10 for §1.3; SGA4 line 1233 and NoncommutativeAndEquivariantIwasawa §0.11 for Serre's theorem.
- **The published Exposé XVII** is not in the cache, so I could not check whether the f^! misprint below survives in print.

## Source issues

- **Error** in ILO14 at Exposé 0, Corollaire 8, p. 5 (ILO14 line 400): the source says cd_ℓ(K) = d + cd_ℓ(k) for every integral henselian quasi-excellent local scheme; it should exclude ℓ = 2 with k formally real, where only ≤ holds (henselised ℝ[x,y]/(x²+y²): 1 ≠ ∞); affects a stated result.
- **Misprint** in ILO14 at Exposé XVII, Théorème 0.9, second bullet, p. 257 (ILO14 line 12233): the source says f^!K is dualizing for f flat with geometrically regular fibres; it should be f^*K, as in Proposition 4.1.1 (line 13520), since f need not be of finite type; affects nothing.
- **Error** in G04 at §8, p. 10 (G04 lines 446–451): the source says Ri_x^!K ≅ A[−n(x)] for a single integer, for A = ℤ/n with any n > 1; for composite n each prime-power factor can have its own shift (n = 6, K = 𝔽₂ ⊕ 𝔽₃[1]); affects nothing.
