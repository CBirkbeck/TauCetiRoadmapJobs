# PORT-ArithmeticLocallySymmetricSpacesPartII

- **Branch:** `roadmap/arithmetic-locally-symmetric-spaces-part-ii`, from main `1a19c9f`.
- **Head commit:** `b6c4a2b5` — "ArithmeticLocallySymmetricSpacesPartII: roadmap (README, Suggested.lean, metadata)". It touches only `TauCetiRoadmap/ArithmeticLocallySymmetricSpacesPartII/{README.md,Suggested.lean,metadata.toml}` (3 files, 875 insertions).

## Checks

**Build** (`lake build TauCetiRoadmap.ArithmeticLocallySymmetricSpacesPartII.Suggested`):

```text
warning: TauCetiRoadmap/ArithmeticLocallySymmetricSpacesPartII/Suggested.lean:74:8: declaration uses `sorry`
warning: TauCetiRoadmap/ArithmeticLocallySymmetricSpacesPartII/Suggested.lean:93:8: declaration uses `sorry`
Build completed successfully (18272 jobs).
```

There are 2 warnings, both `declaration uses sorry`, one per headline theorem. The final commit only amended the README; `Suggested.lean` is byte-identical to the file that was built.

One intermediate build used a plain `import Mathlib` header. It produced a third warning ("imports `Mathlib` … designed for use with the module system; consider adding `module`"). The file therefore keeps the package's `module` / `public import Mathlib` / `@[expose] public section` header. That is the most common form on main (41 roadmaps use it, 14 use `module` with a private `import`). The gate accepts it (`imports=0 no-import-mathlib=0`).

**Gate:**

```text
gate ArithmeticLocallySymmetricSpacesPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The first gate run reported `tex=9`: nine brace subscripts (`B_{c+d}`, `∏_{i∈s}`, `dim_{ℚ_p}`, `b_{i−1}`, `𝒜_F^{bc}`, `ν_{F,n}`) in prose I had reworded. Each is now in a code span. It also reported `dirty=1` because nothing was committed yet.

**Dependency check** (`gate --depcheck … --movable`):

```text
depcheck: 245 roadmaps, 2241 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. This roadmap is merge-order line 204, and every supplier it names that is not on main sits above it.

**Citations** (`roadmaps resolve` on the new README): no cross-roadmap citation and no Lean name was found nowhere. The tool did not check library names, so I checked them at the pins myself (below).

## Draft pull request body

This roadmap adds the weight-aspect continuation of ArithmeticLocallySymmetricSpaces: fixed-level multiplicity bounds for SL₂ over a number field with a complex place, as cohomological weights grow. It proves Weibo Fu's sharp bound dim S_κ(K_f) ≤ C·Δ(κ)/min_v κ_v for cusp forms of weight κ at any fixed level. It also proves the ordinary-cohomology form of that bound for every congruence subgroup of SL₂(O_F) and every tuple of symmetric-power exponents at the complex embeddings. The local engine is Fu's homology theorem: for a finitely generated module of skew rank a over the rational Iwasawa algebra of a product of first-congruence subgroups of SL₂(ℤ_p), group homology with coefficients ⊠ Sym^{k_i} equals a·∏(k_i+1) up to a nonnegative multiaffine error with no full-product term, uniformly in every degree. It is reached through microlocalisation to the completed enveloping algebra and a growth bound for cyclic quotients by generic elements. The global bound then comes from completed-homology descent at one auxiliary split prime and a neat refinement of the level. For imaginary quadratic F the roadmap proves two-sided linear growth of H¹ and H² of every Bianchi congruence subgroup with coefficients Sym^n ⊗ conj Sym^n. The lower bound comes from the Finis–Grunewald–Tirao count of base-change classes, which is made rigorous here: the fixed-type multiplicity formula on Γ(N), the ramified finite types, the SL₂ base-change count and strict positivity of its linear term. The theorem is also proved in its cuspidal, interior and compact-support forms at neat level. `Suggested.lean` states the two ordinary-cohomology headlines with Mathlib's `groupCohomology` on a coefficient system built from Tau Ceti's symmetric powers. Its docstring records that the local theorem, the cusp-form bound and the support variants lack carriers at the pins.

## Dependencies that are still pull requests

These are named as suppliers and are still open roadmap pull requests:

- ArithmeticLocallySymmetricSpaces
- CompletedCohomologyPartII
- NoncommutativeAndEquivariantIwasawa
- LocallyAnalyticDistributionsPartII
- GL2AutomorphicRepresentationsAndTransfer
- AutomorphicFormsOnReductiveGroups
- ModularSymbolsPadicLFunctions
- BianchiModularForms

BianchiModularForms is a draft and is used only for the comparison in Scope and one Check in §5.2. Suppliers on main are AdelicAlgebraicGroups, Chebotarev (Completed), ModularForms and FreeGroupsAndLimitGroups. No citation depends on an id that only an open revision defines; the overlap listing for this roadmap reports no dropped or revision-only ids, and I found none.

## What moved from the Lean file to the README

Nothing. The package's `Suggested.lean` already met the Lean form: two real-body definitions on native carriers (`embeddingStdRep`, `weightRep`) and two headline theorems, with no padding, no sorry'd data and no `set_option`. The changes are:

- **Header:** kept as the package had it (see Checks).
- **Docstring wording:** "module structure on a topological module" became "on a compact module", matching `TauCeti.IsCompactModule.completedGroupAlgebraModule`.
- **`embeddingStdRep` docstring:** now cites README §3.1.
- **`weightRep` docstring:** now says the tuple t is arbitrary, as README §3.1 does.

No headline statable at the pins is missing. The §5.3 amalgam isomorphism and the Bianchi cusp-torus computation are intermediate targets, not headlines.

**Signature check.** I appended `#check @name` for all four declarations and for 28 cited Mathlib/Tau Ceti names to `Suggested.lean`, ran the one permitted build once, then removed the lines. Comparison with the README:

- **Definitions:** `embeddingStdRep` and `weightRep` keep `{F : Type} [Field F] [NumberField F]` and the subgroup/embedding data.
- **`finrank_groupCohomology_weightRep_le`:** keeps `¬IsTotallyReal F`, `𝔞 ≠ ⊥` and the kernel inclusion, with quantifier order `∃ C, ∀ t i, FiniteDimensional ∧ ∀ a, 1 ≤ a → (∀ σ, a ≤ t σ + 1) → …`. This matches README §4.2.
- **`bianchi_groupCohomology_linear_growth`:** keeps `[IsTotallyComplex F]`, `finrank ℚ F = 2`, `𝔞 ≠ ⊥` and the kernel inclusion, with `∃ c C, 0 < c ∧ ∃ n₀, ∀ n ≥ n₀, ∀ i ∈ {1,2}, …`. This matches README §5.8.
- **Outcome:** no binder was lost and no statement changed. All 28 library `#check`s elaborated. That includes `Basis.piTensorProduct`, which sits at the root namespace and returns a `Module.Basis`; the README cites it under that name.

## Supplier replacements and duplication removals

The duplication sweep was done by object against main and the 476 open roadmap pull-request heads, using `roadmaps grep` and `roadmaps show`. Every removal is recorded in README "Scope and ownership".

1. **Package §0.3, "The external tensor coefficient family" (W_k, its lattice, A-action, dimension and coefficient extension): deleted.** It restated LocallyAnalyticDistributionsPartII §3.9 (the Lie module of a representation with a stable lattice, including Sym^k(ℤ_p²) with its ℤ_p[[G₁]] structure) and §5.2 (W_k for products, its A-action, dimension ∏(k_i+1), irreducibility, self-duality and `A/Ann(W_k) ≅ End(W_k)`, for every finite K/ℚ_p).
   - W_k is now defined in Conventions by citation.
   - The LocallyAnalyticDistributionsPartII contract names §3.6, §3.9 and §5.2 with W_k⁰ and dimension D(k+1).
   - Every *Needs:* entry "§0.3" became "LocallyAnalyticDistributionsPartII §5.2" (and §3.9 in §0.3), and package §0.4 was renumbered §0.3.
   - Two of its Checks moved into the supplier-contract Checks (the p = 3 span of the image of G, and integral versus rational self-duality); the k = (1,2) dimension and k = 0 Checks moved to Conventions.
   - No other roadmap cites this roadmap, so the renumbering breaks nothing.
2. **Package source corrections E2, E3, E5, E8, E9 (to fu24 §§4–5): deleted.** They restate LocallyAnalyticDistributionsPartII, Source corrections, items 6, 5, 4, 1 and 3, which concern that roadmap's own targets. They are cited in Scope and in the References notes.
3. **The rest of the "Source corrections" section was folded into the text.** No roadmap on main has such a heading. E1, E4, E6, E7 and E10 now appear at their claims (§§5.2, 4.2/4.3, 0.3, 3.2, 5.3) and as a list "Where a target differs from its source" under References. Their Checks were moved to the targets they test (E4 to §4.3, E7 to §3.2); the others duplicated existing Checks.
4. **No library declaration duplicates a target.** All cited Mathlib/Tau Ceti names were verified at the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`):
   - Mathlib/Algebra/BigOperators/Group/Finset/Defs.lean:67, 378, 391, 735, 747: `Finset.prod`, `Finset.prod_empty`, `Finset.prod_const_one`, `Fintype.prod_equiv`, `Fintype.prod_empty`.
   - Piecewise.lean:247: `Finset.prod_update_of_mem`; Order/BigOperators/GroupWithZero/Finset.lean:160: `Finset.prod_pos`; Data/Finset/Powerset.lean:31: `Finset.powerset`; MvPolynomial/Basic.lean:80: `MvPolynomial`.
   - LinearAlgebra/Dimension/Constructions.lean:372, 375: `Module.finrank_tensorProduct`, `Module.finrank_baseChange`; PiTensorProduct/Basis.lean:36: `Basis.piTensorProduct` (newly cited, for dim `weightRep` = ∏(t_σ+1)).
   - GroupCohomology/Basic.lean:183: `groupCohomology`; Shapiro.lean:58: `groupCohomology.coindIso`.
   - SpecialLinearGroup.lean:225: `Matrix.SpecialLinearGroup.map`; GeneralLinearGroup/Defs.lean:369: `Matrix.SpecialLinearGroup.toGL`; PiTensorProduct/Basic.lean:530: `PiTensorProduct.mapMonoidHom`; Pi/Lemmas.lean:156: `MonoidHom.pi`; Rep/Basic.lean:62: `Rep.of`.
   - TotallyRealComplex.lean:48, 210: `NumberField.IsTotallyReal`, `NumberField.IsTotallyComplex`.
   - PushoutI.lean:60, 102: `Monoid.PushoutI`, `Monoid.PushoutI.lift`; Modular.lean:426, 795: `ModularGroup.exists_smul_mem_fd`, `ModularGroup.eq_smul_self_of_mem_fdo_mem_fdo`.
   - Ore localisation: OreSet.lean:52, Basic.lean:92, Ring.lean:211 (the `DivisionRing` instance assumes `[OreSet R⁰]`), InvariantBasisNumber.lean:250, Dimension/Localization.lean:299.
   - Tau Ceti: SymmetricPower.lean:57 `TauCeti.symPowerRep`; SymmetricPower/Basis.lean:162, 192 `Module.Basis.symmetricPower`, `SymmetricPower.finrank_eq`; Corestriction.lean:136, 165; PBW/Basic.lean:75; PBW/Basis.lean:96.
5. **Ownership against open work.**
   - Nothing on main or at any open head owns Fu's local theorem, Fu's global bound, the proper-face calculus, the Bianchi cusp-torus calculation, the FGT fixed-type formula, the ramified types or the base-change count. Only CompletedCohomologyPartII and ModularityAndLanglandsExtensions cite fu24/marshall12/fgt10, for other results.
   - LocallyAnalyticDistributionsPartII's Scope assigns Fu's generic growth estimate (Theorem 1.6/§3) to applications, so this roadmap owns it (§0.3).
   - The SL₂(ℤ) amalgam appears only as an example in FreeGroupsAndLimitGroups §4.8 (main) and CohomologyOfGroups, so this roadmap owns it (§5.3).
   - BianchiModularForms §§1.2–1.3 owns GL₂ Bianchi coefficient modules and the weight-two Eisenstein count. `weightRep` is kept as a variant with a one-clause difference, and the count is used only as a §5.2 Check.
   - No declaration of `Suggested.lean` shares a fully qualified name with a declaration in another roadmap. MSPLF has `vkRep`, GL2ART has `algWeight_equiv_symPowerRep`, LADPII has `exists_surjective_algHom_end_symPower`; all are different objects.

## Fixes a mathematician would flag (from the final reread)

1. **False Check (supplier contract, LocallyAnalyticDistributionsPartII).** The package said that for g = 1+pe "its image in Û is exp(pe) = 1+pe, since (pe)² = 0". In Û, e² ≠ 0 (it is a PBW monomial), so exp(pe) = Σ(pe)^n/n! ≠ 1+pe. The identity holds only after acting on Sym¹. The Check now says exactly that.
2. **Fu, Theorem 1.2 misprint, now stated (§4.2, References).** Fu takes r = r₁+2r₂ (fu24 line 29) but writes "min over 1 ≤ i ≤ r" for a weight tuple with r₁+r₂ entries (fu24 lines 33, 90). The roadmap's minimum is over places.
3. **Fu, Proposition 3.4 proof misprint, now stated (References).** fu24 line 508 has "f raising a weight and e lowering a weight", against Fu's own (6) at line 360, [h,e] = 2e.
4. **FGT §3.3 wording, now stated (References).** fgt10 line 974 says "any unitary representation"; a direct sum of copies of π_{2n+2,0} also has cohomology, so "irreducible" is needed. §4.1 also now says why the trivial representation cannot occur at a place with κ_v = 2: a cuspidal automorphic representation of SL₂ has no one-dimensional local component, by strong approximation.
5. **FGT Corollary 4.20 proof, now stated (§5.6, References).** fgt10 line 1421 proves only a "non-negative" coefficient; the roadmap's A_F > B_F gives the strict positivity the lower bound needs.
6. **Scope wording.** "NoncommutativeAndEquivariantIwasawa owns completed group rings" was wrong: the completed group algebra is Tau Ceti's. It now says that roadmap owns the Iwasawa-algebra theory built on it.
7. **Missing API and Checks added.**
   - §0.3, generic elements: a definition with Checks but no API. It now lists genericity, scaling, genericity of the image of every nonzero element of A, and uniformity of α.
   - §5.5 had its API only in prose; it is now a bullet list.
   - §1.1 had a bare "the dual is necessary" Check; it is now a computed character example.
   - Added Checks: §0.2 (B = 2+3x₀+5x₁: 28 ≤ 40); §2.6 (H₇ = 0 for m = 2); §2.7; §4.2 (𝔞 = 0 and 𝔞 = O_F); §5.1 (n = 1, 3 ranks).
8. **Process wording made timeless.** "unresolved large-radius central-quotient argument" and "the missing skew-rank … inputs have individual supplier gaps" were rephrased. "Owned here" and "Left to other roadmaps" bullets replace the package's run-on scope paragraphs, and the Lean-coverage paragraph moved out of Scope into the introduction.

## Adversarial mathematics pass

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Conventions: Casimir | highest-weight v, h=k, ev=0; k=0,1 | efv = hv = kv; Δv = ½k²−k+2k = ½k(k+2); values 0, 3/2. Reversed ½h²−h+2fe on Sym¹: ½−1 = −½ | holds; reversed order excluded | none |
| Conventions: dual action, untwisting | g=diag(a,a⁻¹); p=3, g=(1 3;0 1), h=(1 0;3 1) | (gφ)(e₁) = a⁻¹. gh = (10 3;3 1) ≠ hg = (1 3;3 10). g⁻¹(0,1) = (−3,1), whereas g(0,1) = (3,1) | inverse action pinned | none |
| Conventions: K = Γ·K(𝔞), Γ = SL₂(F) ∩ K | x = γk ∈ SL₂(F) | k = γ⁻¹x ∈ SL₂(F) ∩ K(𝔞) = Γ(𝔞) ⊆ Γ, so x ∈ Γ; K is a group since Γ normalises K(𝔞) | holds | none |
| Conventions: one component | F = ℚ(√−5), h_F = 2 | GL₂ double cosets ≅ Cl(F), 2 components; SL₂ count 1 by strong approximation | holds | none |
| Conventions: W_k dimension | k=(1,2); k=0 | 2·3 = 6 (not 5); dim 1 (not 0) | holds | Check moved from package §0.3 |
| §0.1 B_c | m=3, c_∅=2, c_{0,2}=3, x=(2,5,4); m=1; x=(2,4); I=∅; k=(0,0) | 2+3·2·4 = 26; constant; D = 8 vs sum 6; D(∅) = 1; D(1,1) = 1 vs ∏k_i = 0 | holds | t² vs (Σc)t witness added |
| §0.2 saving | B=2+3x₀+5x₁, x=(2,4), a=2; diagonal; x=(1,t); m=0 | 28 ≤ 10·8/2 = 40; Σc_s t^{\|s\|} ≤ (Σc)t^{m−1} for t ≥ 1; bound t (no saving); m=0 has no proper subset, B = 0 ≤ 0 | holds; m ≥ 1 as stated | Check added |
| §0.3 generic growth | m=1, k ≥ α; α=(3,3), k=(1,t); δ=Δ₁−Δ₂, k=(n,n); δ=0 | (2α(k+1)−α²)/(k+1) ≤ 2α; 2(t+1) ≤ 3(t+1) ≤ 6(t+1)+12; δ kills W_(n,n), mult (n+1)² > linear; δ=0 gives k+1, unbounded | holds; genericity and strips needed | API list added |
| §0.3 kernel–rank step | End(W)·T, T=δ_W | dim End(W)·T = dim W·rank T, so dim ker δ ≤ (∏(k+1)² − ∏(k−α+1)²)/∏(k+1) | holds | sentence added to the route |
| §0.3 / Fu Prop 3.4 | e·x^{n−j}y^j with [h,e]=2e | e raises: fu24 line 508 says f raises; (6) at line 360 has [h,e]=2e | source misprint | References note |
| §1.1 evaluation | M=A, W=W_(1,2); W one-dim with character a | 6 = 6; pairing with W* transforms by a·a⁻¹ = 1, with W by a² | holds | Check made computed |
| §1.2 cyclic | δ=1; δ=0; m=1 | 0; D(k+1), excluded; constant 2α | holds | none |
| §1.3 filtration | R=ℚ_p[X,Y], T=R/(X,Y), W=T | Hom dims 1 = 1; module dims 1 vs ∞ | surjection, not iso | witness made explicit |
| §1.4 torsion | T=0; T=W₀⊕W₀ | 0; Hom to W₀ = 2, to others 0 | holds | Check added |
| §2.1 free approximations | A²; A/Aδ; (X,Y) in ℚ_p[X,Y] | (a,ℓ,rank N,rank T) = (2,2,0,0), (0,1,1,0), (1,2,1,0) | ℓ ≠ a in general | tuple added |
| §2.2–2.5 | ℓ=2, a=1, D=6; A²→A projection | upper 12 = 2·6+0; lower 12−(6+U_N) = 6−U_N; (6+U_N)−12+(6+U_M) = U_N+U_M; H₁(A)=0 but H₀(kernel⊗W) = D | holds; shift starts at i=2 | witnesses added |
| §2.6 local theorem | m=1, M=A²; m=2, i=7; p=2 | H₀ = 2(k+1), error 0; 7 > 6 so H₇ = 0; −I ∈ kernel at p=2, (1−g)(1+g) = 0 | p odd is necessary | Check added |
| §2.7 | W_(1,2); W₀⊕W_(1,2); A | 1 ≤ 1 ≤ 6; 2 weights, 2 ≤ 7; A has cd 3m, infinite-dimensional | holds | Check added |
| gap:skew-rank | division ring; (X,Y); M₂(ℚ_p) | rank a on R^a; ideal rank 1, presentation kernel rank 1; E₁₁E₂₂ = 0 | domain needed | witness added |
| gap:canonical-dimension-zero | W_k; A; A/Aδ; W_k⁰ integral | j = 3m, cd 0; j = 0, cd 3m; Ext¹ = A/δA ≠ 0, j = 1, cd 3m−1 ≥ 2; integral (3m+1)−3m = 1 vs rational 0 | rational normalisation needed | none |
| LADPII contract: 1+pe | m=1 | log g = pe; exp(pe) = Σ(pe)^n/n! ≠ 1+pe in Û (e² ≠ 0); on Sym¹ = 1+pe | **package Check false** | corrected |
| LADPII contract: λ=1, p=3 | ½μ(μ+2)=1 | μ = −1±√3; 1+2λ = 3, v₃ = 1, not a square in ℚ₃ | not induced, still covered by §4.14 | none |
| §3.1 weights | (0,1) κ=6; (1,1) κ=(4,6); κ=(2,…,2) | t=(2,2), D=9 ≤ 36, min x = 3 = 6/2; t=(2,2,2), D=27 ≤ 144, min x = 3 ≥ 2; t=0, D=1, Δ = 2^{r₁}4^{r₂} = 2^d | holds | none |
| §3.1 `embeddingStdRep`, `weightRep` | F=ℚ(i), γ=(i 1;−1 0); t=(1,0); t=0 for d=1,2,3 | det = 1, traces i, −i; E₁ trace i·(−i) = 1, wrong model i² = −1; −I acts by (−1)^1 = −1, so H^i = 0; 1, 1·1, 1·1·1 | definitions determine the object | `Basis.piTensorProduct` cited for dimension |
| §3.2 auxiliary prime | F=ℚ(i), p=5, q=3; γ=(1 1;−3 −2); diag(p²,1)SL₂(ℤ_p)diag(p²,1)⁻¹ | 5 = (2+i)(2−i), 3 inert; det γ = 1, trace −1, γ³ = I, γ ≡ (1 1;0 1) mod 3; (1 p;0 1) needs p²b = p, b = 1/p ∉ ℤ_p | two characteristics needed; factor must be SL₂(O_v) | E7 Check moved here |
| §3.3 realization | t=(3,0); integral O --p→ O; [L:ℚ_p]=e | dim 4 both sides, −I by −1; field homology (0,0), mod p (1,1); 1 vs e | flat only | none |
| §3.4 descent | d=2, total degree 2 | local indices 0..6, E² terms (0,2),(1,1),(2,0) summed; dim K₀ = 6 | holds; no degeneration | witness added |
| §4.1 S_κ, m_ε | F=ℚ, Γ(3), κ=4; r₁=2; four-cusp curve; κ_v=2 at a real place | dim S₄(Γ(3)) = 3·(−1)+1·4 = 1, H¹_cusp = 2 = m₊+m₋; sign-pattern pairing (++)↔(−−) only; H¹ = 3, H¹_cusp = 0; trivial π_v forces π constant by strong approximation | holds | κ_v = 2 sentence added |
| §4.1 / FGT (3.9) | π = π_{2n+2,0}⊕π_{2n+2,0} | H¹ dimension 2 ≠ 0, so "any unitary" is too broad (fgt10 line 974) | source wording | References note |
| §4.2 Lean headline | F=ℚ, Γ=SL₂(ℤ), k=10,22; ℚ(i), t=(n,n), a=n+1 or 1; t=(n,0); t=0; 𝔞=0, 𝔞=O_F | dim H¹ = 2dim S_{k+2}+1 = 3, 5 (unbounded, so r₂>0 needed); C(n+1) vs C(n+1)²; C(n+1); dim H^i(Γ,ℂ) ≤ C; trivial kernel (arbitrary Γ) vs Γ = SL₂(O_F) | hypotheses all needed; ∃C before ∀t i a | 𝔞 Check added |
| §4.2 / Fu Thm 1.2 | fu24 lines 29, 33, 90 | r = r₁+2r₂, but k has r₁+r₂ entries | source misprint | stated in §4.2 and References |
| §4.3 parallel | (1,1), κ=4 | d=3, κ³/κ = κ², 4³/4 = 16 | exponent d−1 | E4 Check moved here |
| §5.1 cusp torus | n=0,1,2,3; z=(1,i) | chain dims (1,2,1),(4,8,4),(9,18,9),(16,32,16); ranks (0,0),(3,3),(8,8),(15,15); H = (1,2,1); det(1 1;i −i) = −2i | holds; unipotent monodromy needed | n=1,3 added |
| §5.2 support bridge | i=1,2, c cusps; n=0 | H−H_! ∈ [0,b_i], H_c−H_! ∈ [0,b_{i−1}], so difference ∈ [−2c,c] or [−c,2c], hence ≤ 3c; H_c³ = 1 at n=0, 0 for n>0 | safe bound | BianchiModularForms §1.2 agreement noted |
| §5.3 fixed types | N=1, k=12, 2; N=2, k=6, 8; N=3, k=4, σ=ω and ω⊕ω̄ | 11/12−1/2+1/4+1/3 = 1; 1/12−1/2−1/4−1/3+1 = 0; (0,1,0) total 1 = 6/2−2, (0,0,1) total 2; ω gives 3/12+1/4 = 1/2, ω⊕ω̄ gives 1 | ι-stability needed | none |
| §5.3 amalgam | W=ℂ, Sym², Sym¹⁰, ℂ²; amalgam over trivial group | 0; 3−1−1 = 1; S₄-fixed a odd (5), −S₃-fixed a ≡ 2 mod 3 (3), 11−5−3 = 3; ℂ² true 0 vs formula 2; abelianisation order 24 vs ℤ/12 | −I hypothesis and ⟨−I⟩ edge group needed | none |
| §5.4 types | (ℓ,ν) = (2,2),(2,3),(3,1),(7,1) | PS dims 6,12,4,8; SC dims 2,4,2,6; SC S₄ traces 0,0,2,−2; ℓ=3 parity −ω₃(−1) = +1 (ω₃(−1) = (−1/3) = −1 whenever 3 ramifies) | holds | none |
| §5.5 count | R(π) of size 2; ℚ(i) n=0,1; ℚ(√−3) n=0,1,2 | 4·1/4 = 1; ℒ(ℚ(i)) = ∅ (h=1), corrections 0, 1/2; (0,0,1/2) | holds | reason ℒ = ∅ added |
| §5.6 positivity | u = 1,2,3,5,7 | (disc, A, B) = (−4, 5/24, 1/8), (−8, 3/8, 1/8), (−3, 1/6, 0), (−20, 5/4, 1/4), (−7, 1/3, 0); A/B = 5/3, 3, 5 ≥ (5/3)3^{s−1} | strict; FGT proves only "non-negative" (fgt10 line 1421) | note added |
| §5.7 lower bounds | Γ = SL₂(O_F); E_n central sign; orientation control | index 1; (−1)^n(−1)^n = 1; Sym^n⊗conj Sym^m, n+m odd, gives 0; trivial Q-module invariants 1 vs sign twist 0 | holds | values added to Check |
| §5.8 Lean headline | ℚ(i), Γ = SL₂(ℤ[i]), n = 0, 99, 100 | H¹(·,ℂ) = 0 (finite abelianisation), so n₀ is needed; slopes 1/3·100, 1/12·101; upper bound from §4.2 with a = n+1 | two constants, no limit | none |

Context check: both theorems carry every hypothesis in their own signatures; the file has no `variable` block. `Fintype (F →+* ℂ)` for `∏ σ` is found by instance search.

## Unresolved

- **Two supplier gaps stay open.** gap:skew-rank (on NoncommutativeAndEquivariantIwasawa §F.1) and gap:canonical-dimension-zero (on §0.12) are kept as "What NoncommutativeAndEquivariantIwasawa must provide" contracts, as the accepted review decided and as FlagVarieties on main does. Neither is a target of that roadmap at its head (searched by object: "skew rank", "Goldie", "Ore rank", "classical division ring"). Until they are added there, Layers 1–2 rest on these contracts.
  - CompletedCohomologyPartII §5.5 also uses "rank over the Ore division ring" of O[[U]]-modules without defining it. It would consume the same contract.
- **The amalgam sequence may later become a citation.** CohomologyOfGroups (open, merge-order line 320, after this roadmap) plans the amalgam Mayer–Vietoris sequence in all degrees. This roadmap keeps its own degree-≤1 statement (§5.3) and does not mention CohomologyOfGroups. If that roadmap is moved above this one, the second API fact of §5.3 can become a citation.
- **Owned versus supplied-gap targets.** The review listed six conditional gaps. Four of them (flat-microlocalisation, algebraic-quotient-comparison, integral-central-faithfulness, generic-cyclic-growth) were already replaced in the package by LocallyAnalyticDistributionsPartII §§3.4/3.7, 3.10, 4.14 and by §0.3 here. I confirmed each of those sections at that roadmap's head.
- **Ownership against open pull requests was checked** for every open roadmap pull request, through `roadmaps grep` / `roadmaps show` over main and all 476 indexed heads.
- **Untrusted text.** Nothing in the reviews, the other roadmaps or the sources asked for an action outside this job.


Pull request: #2401 (roadmap/arithmetic-locally-symmetric-spaces-part-ii at b6c4a2b)
