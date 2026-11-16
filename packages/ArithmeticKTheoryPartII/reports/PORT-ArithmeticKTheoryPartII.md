# PORT-ArithmeticKTheoryPartII

- **Branch:** `roadmap/arithmetic-k-theory-part-ii`, created from `51d880d` (clean tree checked first).
- **Head commit:** `ab2c76b0` "ArithmeticKTheoryPartII: roadmap (README, Suggested.lean, metadata)". It adds only `TauCetiRoadmap/ArithmeticKTheoryPartII/{README.md,Suggested.lean,metadata.toml}` (3 files, 1253 insertions).
- **Build:** `lake build TauCetiRoadmap.ArithmeticKTheoryPartII.Suggested` ends with `Build completed successfully (20140 jobs).` It gives **4 warnings**, all `declaration uses 'sorry'`, at lines 61, 104, 135 and 158.
  - The package file built with a fifth warning, "imports `Mathlib` … consider adding `module`". Adding `module` as the first line, as the recent ports on main do, removed it.
- **Gate:** `gate ArithmeticKTheoryPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- **Dependency check** (`gate --depcheck … --movable`): `depcheck: 244 roadmaps, 2287 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- **Citation resolver** (`roadmaps resolve` on the ported README): no cross-roadmap citation is found nowhere, and no Lean name is found nowhere.

## Draft pull request body

This roadmap builds the arithmetic Galois action on the symplectic K-theory of the integers and identifies it completely, following Feng–Galatius–Venkatesh. The action comes from the moduli of principally polarized abelian varieties. It is computed on Bott classes of CM abelian varieties through Shimura–Taniyama reciprocity. The even groups KSp₄ₖ₋₂(ℤ;ℤ/q), KSp₄ₖ₋₂(ℤ;ℤ_p) and their Bott-inverted versions are then the universal extensions of the odd cyclotomic twist μ_q^(⊗(2k−1)) or ℤ_p(2k−1) by a module with trivial action. This holds for finite and p-adic coefficients, for the locally split version over Spec ℤ[1/p], and for every integer k. Three consequences follow: the action is trivial in degree 4k−1; characteristic numbers of Hodge bundles of principally polarized abelian families are divisible by p whenever p divides the matching Bernoulli number; and there is an integral Hurewicz comparison with the integral indecomposables of BSp∞(ℤ)⁺.

The roadmap is the part of arithmetic K-theory that ArithmeticKTheory leaves out by name: that roadmap stops at the arithmetic of the K-groups of S-integers (finite generation, descent edges and tables), and this roadmap imports those tables rather than restating them. Along the way it develops reusable pieces that Tau Ceti lacks. These are the relative group homology of a pair and its universal split extensions; integral indecomposables of finite-type H-spaces; integral homology stability for Sp_(2g)(ℤ), in the Mirzaii–van der Kallen range; and, over odd prime-power cyclotomic fields, realization of split primes with prescribed signs, perfect skew-Hermitian CM lines, and the criterion for a unique conjugation-fixed prime above p in the p-Hilbert class field.

`Suggested.lean` states four headline theorems against the pinned Mathlib and Tau Ceti:
- the split-prime theorem;
- the CM ideal-product theorem;
- the finite-level conjugation-fixed-prime criterion;
- integral homology stability of `Matrix.symplecticGroup (Fin g) ℤ` along Tau Ceti's `TauCeti.symplecticBlockSucc`.

Its module docstring names the headlines that need higher K-theory or the symplectic K-spectrum and are not statable at the pins.

## Dependencies still in pull requests

Suppliers cited in the README that are not on main. Each is earlier than this roadmap in the merge order, and the depcheck shows no upward edge:

- ArithmeticKTheory
- GeneralAlgebraicKTheory
- SchemeKTheoryOperations
- GeneralAlgebraicKTheoryPartII
- GeometryOfNumbersAndQuadraticArithmetic
- HermitianKTheoryOfPoincareCategories
- ComplexMultiplicationAndExplicitReciprocity
- PELModuli
- EtaleHomotopyTypes
- ArithmeticGaloisDuality
- KTheoryFiniteLocalFields

BorelRegulators (also still a pull request) is named once, in "Scope and ownership", as a roadmap that supplies nothing here. It is not a supplier.

Suppliers on main: StableHomotopyKTheory, GeneralizedCohomology, SymplecticGeometry, TopologicalKTheory, CharacteristicClasses, BordismFormalGroups, ClassFieldTheory, Chebotarev (completed), EtaleCohomologyFoundations, IntegralIwasawaTheory, AlgebraicTopology, and two that main gained since the package was reviewed:
- **AbelianSchemesAndArithmeticModuli:** A5.4(1) is the alternating elementary-divisor theorem over ℤ; A5.5 the polarized Hodge equivalence; A5.8 the Siegel family. All match.
- **ArithmeticLocallySymmetricSpaces:** ALS.0.8, ALS.1.5, ALS.1.6, ALS.2.3 and ALS.2.4 are present with the cited content.

## Lean and README changes

### What moved from the Lean to the README

Nothing. The package file held two theorems and two real-bodied definitions for §§2.3–2.4, plus the definition `pHilbertClassField` and the Vandiver-criterion theorem for §7.7. It had no padding, sorry'd data or mirrored Checks, so every declaration was kept unchanged.

### What was added to the Lean

`groupHomology_map_symplecticBlockSucc_stable` (README §8.4) is integral homology stability for Sp_(2g)(ℤ). For every abelian group L with trivial action, the map induced on `groupHomology` by `TauCeti.symplecticBlockSucc g ℤ` and the identity of L is surjective for g ≥ 2i+5 and bijective for g ≥ 2i+6.

- **Why it is added.** The package's docstring called this "a supporting target … rather than an acceptance headline". The round-8 review accepted that on the ground that its only source, Charney, was uncertified. Both grounds have changed:
  - mirzaiiVanDerKallen2002 is now certified, and its Theorem 4.1 (mirzaiiVanDerKallen2002 lines 293–296) states exactly this range at usr(ℤ)=2.
  - Tau Ceti at the pin already has the block inclusion `TauCeti.symplecticBlockSucc : symplecticGroup (Fin n) R →* symplecticGroup (Fin (n + 1)) R` in `TauCeti/LinearAlgebra/SymplecticGroup/BlockSucc.lean`.

  So it is a deep result the roadmap owns, statable with no new definition. A statable headline missing from the file is a defect.
- **Generality.** The README target was "isomorphism for g > 2i+5 with ℤ coefficients". It now has the source's full form: surjective from g ≥ 2i+5 and bijective from g ≥ 2i+6, for every abelian group L. Lean and README agree. Finite generation of the stable group stays a README target, since ArithmeticLocallySymmetricSpaces supplies it.
- **Docstring.** The module docstring now:
  - has the README title, "Arithmetic K-theory of number fields and S-integers, Part II: target signatures";
  - lists what is stated;
  - drops the "supporting target" sentence.
- **Imports.** `import Mathlib`, `TauCeti.LinearAlgebra.SymplecticGroup.BlockSucc` and `TauCeti.NumberTheory.ClassFieldTheory.ClassFields.RayClassField`. Both modules exist at the pinned Tau Ceti `2fd255d`.

### Elaborated signatures

I appended `#check @name` for all seven declarations to a copy of `Suggested.lean` and elaborated it once. I did the same for the 40 pinned Mathlib and Tau Ceti names the README cites; the copy was then restored. Results:

- **Lost binders: none.**
  - `exists_split_prime_with_signs` and `exists_cm_lines_with_ideal_product` keep `hp`, `hodd`, `hn`, the `IsCyclotomicExtension {p ^ n} ℚ K` and `IsCMField K` instances, and `ε`, or `Φ`, `hΦ`, `hL`.
  - `pHilbertClassField` keeps `K : Type`.
  - The Vandiver theorem keeps `σ`, `hσ`, `hK`.
  - The new theorem has `L`, `[AddCommGroup L]`, `i`, `g` and both bounds; `B` elaborates as `Rep.trivial ℤ (symplecticGroup (Fin (g+1)) ℤ) L`.

  Each type equals its README statement.
- **Library names.** Every Mathlib name resolved. Of the Tau Ceti names:
  - `symplecticBlockSucc`, `artinHomAway` and the five class-field names resolved directly.
  - The eight names in modules this file does not import were confirmed in source at the pin with their namespaces: `TauCeti.SymplecticForm.exists_compatible`, the five `TopCat.*` homology names, `TauCeti.HomologicalOrientation.fundamentalClass` and `CategoryTheory.ShortComplex.ShortExact.map_simplicialChains`.

### Supplier replacements and duplication removals

- No restatement of a supplier was found, and nothing was deleted.
- `cyclotomicH2Descent` (ArithmeticKTheory §6.11) was in backticks, but it is a target name in ArithmeticKTheory's README, not a Lean declaration anywhere. The backticks were removed, matching how `borelInvariantFormComparison` is written.
- New supplier citations: `TauCeti.symplecticBlockSucc` (From Tau Ceti), and `groupHomology.map`, `Rep.trivial` and `Matrix.symplecticGroup` (From Mathlib, with file paths and what each says). They are also added to the §8.4 *Needs* line, the Layer 8 Dependencies and the "already in the library" sentence of Scope and ownership.

### Ownership and duplication sweep

I searched by object with `roadmaps grep` over main and all 456 open heads. Ownership against open pull requests **was checked**.

- **Galois action on KSp(ℤ).** Owned nowhere else. ArithmeticKTheory and EtaleHomotopyTypes only cite FGV, and ArithmeticKTheory's scope (its README line 94) names "Arithmetic K-theory Part II" as outside it.
- **Integral homology stability of Sp_(2g)(ℤ).** No other owner.
  - HomologicalStabilityOfGeneralLinearGroups (open, another author) covers GL_n only.
  - K3BlochGroups covers GL_n over rings with many units.
  - This roadmap owns it, as its Scope says.
- **p-Hilbert class field.** No owner. CyclotomicClassGroupsAndStickelberger §7.2 on main writes "H_n/F_n" as notation only, with no carrier and no Lean name. ClassFieldTheory and IntegralIwasawaTheory define no p-part class field. `pHilbertClassField` stays here.
- **Other objects.** No owner was found for:
  - relative group homology and its split-extension category;
  - integral indecomposables of H-spaces (EllipticKTheory's "integral indecomposable quotient" is K₃^ind, a different object);
  - split primes with prescribed signs;
  - skew CM lines;
  - conjugation-fixed primes.
- **Name collisions.** No fully qualified name of `Suggested.lean` occurs in another roadmap.
- **Overlaps file.** No other pull request changes this roadmap, no cited id is dropped, and there is no second copy. The closest roadmaps by vocabulary are ArithmeticKTheory, KTheoryFiniteLocalFields, BorelRegulators, StableHomotopyKTheoryPartII, GeneralAlgebraicKTheoryPartII, StableHomotopyKTheory, CyclotomicClassGroupsAndStickelberger and TangentialBordism. Their scope and ownership sections own nothing claimed here. Where they meet this roadmap, they are cited as suppliers.

### Fixes made on the upstream-reviewer reading

1. **Ramification at the real place.** "ℚ(p) is maximal unramified outside p" (Conventions and §7.3) did not say whether the real place may ramify. The local theorem needs G = Gal(ℚ(p)/ℚ) to contain complex conjugation and to be π₁ᵉᵗ(Spec ℤ[1/p]) for the lisse-sheaf form of §7.4. Both places now say "unramified at every finite prime other than p; the real place may ramify". §7.3 adds why every H_q lies in ℚ(p).
2. **BorelRegulators.** Scope said its §2.1 "concerns the number-field SL regulator". At its head, §2.1 constructs the continuous Borel class on GL_b(ℂ), and the sentence now says so.
3. **§2.4 hypotheses.** §2.4 opened with the odd prime-power cyclotomic standing assumption, but its two definitions are for an arbitrary CM field and their Checks use ℚ(i). The misplaced assumption line was removed. The theorem paragraph already states "q odd … K_q", and the Lean headline carries the hypotheses.
4. **Summary.** As a Part II, it now says where ArithmeticKTheory stops. It also lists the statable headlines proved on the way.
5. **§8.4.** The target and Checks were rewritten for the full stability range. A negative-control Check was added: at i=1, the map from Sp₄(ℤ)ᵃᵇ=ℤ/2 to Sp₆(ℤ)ᵃᵇ=0 is not injective, so bijectivity fails below the bound.

A scan for process words (current, removed, round, optional, later, pending, review, upstream and the like) found none.

## Adversarial mathematics pass

A row covers one statement, convention, definition or Check family. The computed values are those I obtained in this pass.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Conventions: arithmetic Frobenius on μ₅ | Frobenius at 2, twist 3 | 2³=8≡3 mod 5; geometric 2⁻³=3³=27≡2 | Distinguishes conventions as stated | None |
| Conventions: (1/2)H scalar | q=5 | 2⁻¹≡3; 3·2=6≡1 | Agrees | None |
| Conventions: Hodge sign, Gaussian line | b(1,1)=i/2, Φ={id} | h(1,1)=−2i·(i/2)=1; b(1,i)=(i/2)(−i)=1/2, ω(1,i)=−Tr(1/2)=−1=−h(1,1); h(1,i)=−i, Im=−1=ω(1,i) | Native positive J is −J_H | None |
| Conventions: ℚ(p) | ramification at ∞ | K_q totally complex, so K_q ⊂ ℚ(p) only if ∞ may ramify; π₁ᵉᵗ(Spec ℤ[1/p]) allows it | Old wording ambiguous | Fixed (2 places) |
| Conventions: H₁(K(ℤ_p^δ,1);ℤ_p) | universal coefficients | H₁(;ℤ)⊗ℤ_p ⊕ Tor(ℤ,ℤ_p) = ℤ_p⊗_ℤℤ_p ≠ ℤ_p | As stated | None |
| Conventions: bott vs β_Top | ℂP¹ | ch₁(β_Top)=ch₁(O(−1))=−U (CharacteristicClasses C6.3); ch₁(bott)=+U; bott^m=(−1)^mβ_Top^m | Agrees | None |
| §0.1 Bott class | odd q, degree 2 | π₂ˢ(S)=ℤ/2 and π₁ˢ(S)=ℤ/2 vanish mod q; π₂(Σ∞₊Bℤ/q;ℤ/q)≅H₁(Bℤ/q)=ℤ/q; q=5, a=2 gives 2β | As stated; q=3 excluded from the ring claim | None |
| §0.2 Picard map | ℤ[√−5], L=(2,1+√−5) | L²=(4,2+2√−5,−4+2√−5)∋4,6, so 2; L²=(2); L⊕L≅R⊕L²≅R²; 2[L]−2↦0, [L]≠1 | Not injective, as stated | None |
| §0.2 arrows | ℤ, 2ℤ→3ℤ | 3/2∉ℤ×={±1} | Arrows need Frac(R)× | None |
| §0.3 positive summand | k≥1 | ψ⁻¹=(−1)^(2k)=+1 on H²(μ^(⊗2k)), (−1)^(2k−1)=−1 on H⁰(μ^(⊗(2k−1))); Br(O′_q)=0 (one place above p, no real place) | Image is the + part | None |
| §0.4 Check, degree one | q=5 | K₁(ℤ;ℤ/5)=ℤ/2/5 ⊕ K₀(ℤ)[5]=0; K₁(ℤ[1/5];ℤ/5)=ℤ[1/5]^×/5=ℤ/5 | Not an isomorphism | None |
| §0.4 Check, twist field | q=9, k=2 | a³≡1 mod 9 for a∈{1,4,7} (64, 343); fixed field of degree 6/3=2 | ℚ(μ₉^(⊗3))=K₃ | None |
| §0.5 odd twist | c central, acts by −1 | H₀(⟨c⟩;M)=M/2M=0, H₁=0 for odd q | H₁(G_q)≅H₁(G_q,⟨c⟩) | None |
| §1.1 S | odd rank; [[0,2],[−2,0]]; h | det of a 3×3 alternating matrix is 0; det=4, d₁=2; ((x,ξ),(x,ξ))↦ξ(x)−ξ(x)=0 | As stated | None |
| §1.1 c_B H | rank one | H(ℤ)=h↦ℤ²: c_B H[ℤ]=2[ℤ]; (1/2)·2=1 after inverting 2 | As stated | None |
| §1.1 ψ⁻¹ on ku | degrees 4k−2, 4k | bott^(2k−1)↦−, bott^(2k)↦+ | As stated | None |
| §1.1 polar retract | diag(2,1/2) | det P^(1−t)=2^(1−t)·2^(t−1)=1 | As stated | None |
| §1.2 period | q=5, 25 | m/2 multiple of φ(q): 4, 20; 2⁴=16≡1 mod 5, 16≢1 mod 25; 2 has order 20 mod 25 (2¹⁰≡−1) | Period grows with n | None |
| §1.2 telescope | p·id on S/p | null for odd p, telescope 0; v₁: π_*(KU∧T_p)=𝔽_p[bott^±1] | As stated | None |
| §2.1 Aut | ℚ(i); K_q, q odd | {u: uū=1}=μ₄={±1,±i}; norm-one units are roots of unity (Kronecker), μ(K_q)=μ_(2q) | As stated | None |
| §2.3 / `exists_split_prime_with_signs` | q=3 | K⁺=ℚ; (3+ζ₃)(3+ζ̄₃)=9−3+1=7; ±7 give both signs; 3∉(7); 2 inert (order of 2 mod 3 is 2) | True; P≠P̄ since 7 splits | None |
| §2.3 route | general q | narrow class of (t) is the image of sign(t); H⁺∩K=K⁺ since K/K⁺ is ramified at p and H⁺/K⁺ is not at finite places; Chebotarev for (c,1) | True for all odd q | None |
| `conjugateFractionalIdeal` | ℚ(i) | (2+i)↦(2−i), product (5); (1/2)↦(1/2); 0↦0, 1↦1 | Laws hold | None |
| `IsSkewCMLine` | ℚ(i), B=ℤ[i] | 𝔡=(2), 𝔡⁻¹=(1/2)=(i/2); δ=i/2 gives Im=±1/2, type {id}; δ=i gives index [(1/2)ℤ[i]:ℤ[i]]=4; 2B with δ=i/8: (i/8)·4=(i/2) | Perfection and type as stated | None |
| `exists_cm_lines_with_ideal_product` | general odd q | 1−ζ=w(w⁻¹−w) with w²=ζ, μ=w⁻¹−w purely imaginary; e=p^(n−1)(n(p−1)−1) odd, so μ^(−e) generates 𝔡⁻¹ and is purely imaginary; B₁=x, δ₁=δ₀/t; B₂=LL̄⁻¹x⁻¹, δ₂=δ₀t; δ₂B₂B̄₂=(δ₀); B₁B₂=LL̄⁻¹, a=1 | True | None |
| §2.4 Checks | q=5 | pairs {1,4},{2,3}, so 4 types; class group C₃: x·x⁻¹=1, ratio x² | Agree | None |
| §3.2 type character | q=5, i=1, 2 | {1,2}: 3; {4,2}: 6≡1; difference −2·4^1; i=2: 1+4=5≡0, 16+4=20≡0 | Unit difference only for odd i | None |
| §3.4 table | i mod 4 | i=4k: K^+ needs twist 2k+1, ψ⁻¹=−1, so 0; π_(4k)(ku)⁻=0. i=4k+1: H¹ twist 2k+1, minus, so 0. i=4k−2: H² twist 2k plus, ku minus ℤ_p. i=4k−1: H¹ twist 2k plus | 0, 0, K⊕ℤ_p, K | None |
| §3.4 degree 4k−2 | H⁰ term | H⁰(ℤ[1/p],μ_q^(⊗(2k−1)))=0 since c acts by −1 | K_(4k−2)(ℤ;ℤ/q)=H² | None |
| §3.5 Minkowski Check | q=5 | (4/π)²·(24/256)·√125 = 1.6211·0.09375·11.180 = 1.70 < 2 | Pic(O₅)=0 | None |
| §3.5 691 Check | k=6 | 4k−2=22=2m, m=11; B₁₂=−691/2730; 692≡1 mod 691 | Agrees | None |
| §3.6 Check | i=−2, −4 | ψ⁻¹ on bott^(−1) is −1, on bott^(−2) is +1 | KU factor at −2 only | None |
| §4.4 small p | g=1, 2, ≥3 | H₁(Sp_(2g)(ℤ))=ℤ/12, ℤ/2, 0; ⊗𝔽_p is 0 for p>3, ℤ/3 at p=3, g=1 | Moore smash needed at p=3 | None |
| §4.5 genus | q=5 | φ(5)/2=2; g=φ(5)=4=2+2 | Agrees | None |
| §5.1 Check | a of order 3, minus | a c a⁻¹ = a(c a⁻¹ c⁻¹)c = a²c ≠ c | Lifts cannot all commute with c | None |
| §5.2 cocycle | definition | α(g,g′m)+α(g′,m) = gs(g′m)−s(gg′m)+g′s(m)−s(g′m); with trivial action on T, g·α(g′,m)=α(g′,m), sum = gg′s(m)−s(gg′m) | Cocycle law holds | None |
| §5.2 H=G | initial/terminal | f=s is forced and G-linear; f=π is forced and π∘s=id | Both, as stated | None |
| §5.3 differentials | n=1, 3; C₃ on 𝔽₇ | d₁=gm−m; d₃ = [g\|h]⊗km−[g\|hk]⊗m+[gh\|k]⊗m−[h\|k]⊗m; FGV 2·1−1=1, native 4·1−1=3, after T₁ native 2−1=1 | Term-by-term agreement | None |
| §5.3 Checks | C₂ sign ℤ/5; S₃ | relative LES: 0→H₁(C₂,1)→M→H₀(C₂)=M/2M=0, so ℤ/5; a(sr,1)=1=1+0; a(1,1)=0=−1+1 | Agree | None |
| §5.4 Checks | ℤ/9, ℤ/3 sign; C₂ on ℤ/5 | c−1=−2 invertible mod 3; c²(m,t)=(m,t+m−m); c(m,2m)=(−m,3m)=s(−m) | Agree | None |
| §6.3 normalization | q=5 | c_B(3H(x))=3·2x=6x=x | (1/2)H as stated | None |
| §6.2 weight | χ(σ)=2, k=2 | 2³=8≡3 vs 2²=4 mod 5 | Weight 2k−1 | None |
| §7.1 Checks | C₂ sign ℤ_p; ℤ_p trivial | H₀(C₂)=ℤ_p/2=0, H₁=0, so relative H₁=ℤ_p; H₁(ℤ_p;ℤ_p)=ℤ_p, H₀(1)→H₀(Γ) iso | Agree | None |
| §7.2 Check | p=3, k=1 | K₂(ℤ)=ℤ/2, K₁(ℤ)[3]=0, so K₂(ℤ;ℤ₃)=0 | ℤ₃(1) | None |
| §7.3 | D_q, q=3 | Gal(K₃/ℚ)=C₂; H₁(C₂,C₂;−)=0 | Agree | None |
| §7.5 Check | q=5, k=0, 2 | twists −1≡3 mod 4; degrees −2, 6 differ by 8=m | Agree | None |
| §7.6 auxiliary prime | (p,k,ℓ)=(3,1,2), (5,1,2), (3,1,19) | v₃(2²−1)=1: ℤ/3; v₅(3)=0: 0; 19²−1=360=2³·3²·5: ℤ/9, and 19≡1 mod 9 is not a generator | Agree | None |
| §7.6 degree 4k−1 zero case | p=5, k=1 | K₃(ℤ)=ℤ/48, 5∤48 | Includes zero group | None |
| `pHilbertClassField` Checks | ℚ(ζ₃); ℚ(√−26) (Cl≅ℤ/6); ℚ(ζ₂₃) (h=3); p=0, 1 | degrees 1; 6/2=3 at p=3, 6/3=2 at p=2; whole field at 3, K at 23; p=0 closure ⊥, field H; p=1 closure ⊤, field K | Agree with definition | None |
| Vandiver theorem | q=3; q=37; plus torsor ℤ/3 | h(ℚ(ζ₃))=1: one prime, both sides true. h(ℚ(ζ₃₇))=37, h⁺=1: c=−1 on ℤ/37 fixes 1 of 37; 37∤1, both sides true. Plus torsor: involutive lift fixes 3, order-6 lift (1,c) fixes none | True; the involution hypothesis is needed | None |
| Vandiver route | general | σ(aP)=(σaσ⁻¹)σP; fixed set = A⁺-torsor; N∘ext=2 on Cl(K⁺), ext∘N=1+c, which is 2 on A⁺; \|A\| odd | ¬p∣h⁺ ⟺ A⁺=0 | None |
| §8.1 RP∞, p=2 | degrees 2j−1 | β₁ injective on H_(2j)(;𝔽₂); x_a x_b=C(2j,a)x_(2j); some C(2j,a) with 0<a<2j odd ⟺ 2j not a power of 2 | Q nonzero exactly in degrees 2^a−1 | None |
| §8.1 K(ℤ/p,1) | degree 3 | β₁(γ₂(y)) reduces to xy≠0; H₃(;ℤ_p)=ℤ/p; I²=0 in degree 3 | Q₃=0, I/I² keeps ℤ/p | None |
| §8.2 Check | K(ℤ/p²,1)×K(ℤ/p,1) | Tor(H₁,H₁)=Tor(ℤ/p²,ℤ/p)=ℤ/p; H₂=0 terms | d=min=1 | None |
| §8.3 range | p=3 | 2p−3=3; ΣH(ℤ/3): Q₁=ℤ/3 | Agrees | None |
| §8.4 / `groupHomology_map_symplecticBlockSucc_stable` | i=0; i=1, g=2→3; bounds at i=0, 2; g=0 | H₀=L→L identity for every g. ℤ/2→0 not injective at g=2<8, both 0 from g=3. Surjective from 5, 9; bijective from 6, 10 (MvdK 4.1 with usr=2: n≥2i+5, n≥2i+6). g=0: hypotheses false, vacuous | True as stated; the bound is needed for bijectivity | Target generalized to every L and surjectivity added; Check added |
| §8.4 usr(ℤ) | (S₂), (T₃) | ℤ has Krull dimension 1, so sr≤2; (7,5) is unimodular but 7+5t=±1 has no solution, so sr=2; transitivity on primitive vectors holds; MvdK Example 2.5 gives usr≤3, i.e. bijectivity from 2i+7 | usr(ℤ)=2 as the route claims | None |
| §8.4 block sum | Sp₂(ℤ) | [[1,1],[0,1]]·[[1,0],[1,1]]=[[2,1],[1,1]] ≠ [[1,1],[1,2]] | BSp∞(ℤ) not an H-space | None |
| §8.4 Hodge pairing | p=5, m=3, 4; p=3, m=1 | 6≤2p−3=7; 8=2p−2 outside; 2≤3; m!=6 a 5-unit | Agree | None |
| §8.5 Checks | χ=2 over ℚ₅; q=2 range | eigenvalues 1/2, 1/4; 4·2=8<9 at g=9, not at g=8; ArithmeticKTheory §3.4 range 4q<rk_ℚ=g | Agree | None |
| §8.6 | p=691, d=11; p=3, n=3; d=0 | B₁₂=−691/2730; v₃(6)=1; #X(ℂ)=1 for Spec ℚ, 2 for Spec ℚ(i) | Strict n_j<p needed; Bernoulli hypothesis needed | None |
| Lean context | all seven declarations | `#check @` shows every hypothesis in each signature; no section `variable` is used | No binder lost | None |

## Gaps (supplier contracts)

The README keeps the 13 declared gaps, each stated under its supplier's contract:

- `full-cyclotomic-h2-descent` (ArithmeticKTheory)
- `duality-transfer` (SchemeKTheoryOperations)
- `low-postnikov-finite-type` (StableHomotopyKTheory)
- `cm-arbitrary-automorphism` (ComplexMultiplicationAndExplicitReciprocity)
- `ppav-embedding-atlases` (PELModuli)
- `graded-moore-realization` (EtaleHomotopyTypes)
- `cyclotomic-p-class-fields` (ClassFieldTheory)
- `relative-homology-edges` and `compact-relative-cocycles` (ArithmeticGaloisDuality)
- `lisse-integral-extension` (EtaleCohomologyFoundations)
- `bernoulli-weight-nonvanishing` (IntegralIwasawaTheory)
- `sphere-unit-finite-field` (KTheoryFiniteLocalFields)
- `pontryagin-bockstein-cap` (AlgebraicTopology)

`review.json` lists 14 conditional gaps. The 14th, `topological-symplectic-hodge`, was deleted in the red-team repair: CharacteristicClasses C3.4, C6.2–C6.3 and GeneralizedCohomology G5.4–G5.5 on main supply it, and the README cites them. The board's gap list should drop it.

## Unresolved

- **Supplier gaps.** The 13 gaps above are requests to their suppliers. None was supplied at the heads and pins read.
- **charney1987.** Paywalled and uncertified; cited by locator only. The range it supports is the one checked in the certified mirzaiiVanDerKallen2002, Theorem 4.1 (mirzaiiVanDerKallen2002 lines 293–296).
- **FGV source text.** It is an author-page copy (`licence_class = "author-page"`), as the accepted review notes for the human reviewers. The published version (*Invent. Math.* 230) was not opened.
- **Rational stable cohomology of Sp_(2g)(ℤ) (§8.5).** I did not add a dimension count of H^q(Sp_(2g)(ℤ);ℚ) to the Lean. It would be a weakened substitute for the §8.5 headline, which is the identification with Hodge characters and their arithmetic weights. The docstring says what that headline lacks.
- **Suspicious text.** None found in the package, the reviews, the supplier READMEs or the source texts read.


Pull request: #2433 (roadmap/arithmetic-k-theory-part-ii at ab2c76b)
