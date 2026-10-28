# Human review response: HabiroRings

## H01 (CBirkbeck) — disputed

HabiroCohomologyFoundations, SolidAnalyticRings and HabiroNumberFields are already explicitly listed as direct suppliers in the live description at head 74e3c94, and all three occur before HabiroRings in its merge-order block; the read-back therefore does not support the reported omissions or the associated claim that these are classified only as consumers. The supplied `merge-order/ORDER.txt` likewise places them at positions 209, 149 and 216 respectively, before HabiroRings at 217; the README retains the first two contracts and now binds HabiroNumberFields precisely at `TauCetiRoadmap/HabiroRings/README.md:19` and line 80.

## H02 (CBirkbeck) — answered

The description still ends with an obsolete “Blocked on a missing supplier” paragraph saying SolidAnalyticRings exists nowhere, contradicting its own supplier list and merge-order block. The worker should delete that paragraph; editing pull-request text is outside this job’s authorized files, so no description change is claimed here.

## H03 (CBirkbeck) — applied

The completed-Frobenius base-naturality gap and the fixed-base-only description are replaced by QWittVectors §§6.1–6.3 at `TauCetiRoadmap/HabiroRings/README.md:102`, with the same binding in §1.1 and §4.1. The imported statement includes nonflat Λ-base maps, completed linearization squares, identities, composition and iteration; its new Check computes 2 on both Frobenius paths and 6 on both linearization paths, consistent with uniqueness of the lift in Q line 647.

## H04 (CBirkbeck) — applied

The prime-generator ideal gap is replaced by its actual owner QWittVectors §3.2a at `TauCetiRoadmap/HabiroRings/README.md:104`, retaining HabiroCyclotomicCompletions §4.1 as the integral intersection/comaximality input. The restriction m>1 and the separate m=1 ideal (0) remain: W line 320’s positive-index wording needs this boundary correction, since Φ₁=q−1 is nonzero.

## H05 (CBirkbeck) — applied

The number-field ring gap becomes an import of HabiroNumberFields §§2.1–2.4 at `TauCetiRoadmap/HabiroRings/README.md:82`, propagated to §5.9 and Layer 5’s dependencies. Full coefficient algebras, Taylor maps and completed Frobenius are retained, and the ring comparison requires discriminant inversion without the line layer’s 6∣Δ restriction, as in G line 255 and G line 273.

## H06 (CBirkbeck) — applied

The global-line gap becomes HabiroNumberFields §§3.8–3.11 at `TauCetiRoadmap/HabiroRings/README.md:84` and §6.2, including the actual linear equalizer, effective descent, finite projectivity of rank one and coherent tensor/inverse maps. Every consumer retains Δ>0 divisible by 6 and disc(F), and the supplier’s descent and tensor-bijectivity requirements; multiplicative compatibility in G line 2217 alone is not promoted into effective descent.

## H07 (CBirkbeck) — applied

The separate integral-linear-jet gap is replaced by HabiroNumberFields §3.14 and §3.11 at `TauCetiRoadmap/HabiroRings/README.md:1174`, with the finite-sum argument at line 1176: Σ fᵢgᵢ=1 gives e(Σ gᵢ(1)⊗fᵢ)=1, and H/(q−1)≃R also lifts those finitely many coefficients to a global section. This uses gcd(1,Δ)=1, the canonically trivial order-one root line, tensor-compatible integral evaluation and an inverse pairing, rather than a pure tensor or global basis; the new Checks compute 35−34=1, 3−2=1 and the zero-evaluator failure 0≠1, in agreement with G line 443 and G line 471.

## H08 (CBirkbeck) — applied

Arithmetic-line naturality is bound to HabiroNumberFields §3.16 at `TauCetiRoadmap/HabiroRings/README.md:88` and §6.7, replacing every stale gap and unnamed certificate in its consumers. The tensor is over the Habiro ring, with common positive Δ divisible by 6 and both discriminants, and retains effective base-change descent, the Chern/regulator naturality inputs, evaluation, tensor, identity and composition compatibility.

## H09 (CBirkbeck) — answered

HabiroCyclotomicCompletions’ scope still assigns general derived completion to HabiroRings §2.4, and its consumer table still describes HabiroCohomologyFoundations Layer 1 as consuming ordinary completion and Taylor maps; these supplier-side statements need correction to HabiroCohomologyFoundations §0.1 for reflection/completed tensor and Layer 0 consuming HC §§4.1 and 5.2. The correct allocation is retained at `TauCetiRoadmap/HabiroRings/README.md:16` and §§2.1/2.4; the neighbouring README is outside the authorized edit scope and remains unchanged.

## H10 (CBirkbeck) — applied differently

The compatible-root family, existence witness and coherence are explicitly reused from HabiroNumberFields §2.1 at `TauCetiRoadmap/HabiroRings/README.md:936`, and their duplicate API construction bullets are deleted; the full twisted relative coefficient algebras and relative Taylor maps remain here. This uses the already earlier supplier instead of extending HabiroCyclotomicCompletions §3.3: ζ₆=−ζ₃ gives ζ₃−ζ₆=2ζ₃ with positive 2-adic valuation, while the conventional independently chosen roots give −1, matching Q line 734.

---

### Ownership, citations and scope

The repair is commit `bde6585ac94abe68a5fbe7264ba71f8f9d473403`, changing only `TauCetiRoadmap/HabiroRings/README.md`; `TauCetiRoadmap/HabiroRings/Suggested.lean` is unchanged. No push or GitHub write was made. The only outstanding requested writes are the description paragraph in H02 and the neighbouring supplier correction in H09.

Ownership was searched by object across main, the open-roadmap inventory, the supplied sibling checkouts and the board packages. The root datum and arithmetic global lines belong to HabiroNumberFields; the completed Frobenius and prime-generator consequence belong to QWittVectors; the enhanced reflection belongs to HabiroCohomologyFoundations; general solid profile comparison belongs to SolidAnalyticRings. The finite-sum first-fibre argument remains here because it is the consequence for the κ-transported relative line using this roadmap’s H/(q−1)≃R, rather than a second arithmetic line construction. No declaration was added or given a supplier’s fully qualified name, and no ownership was moved to a later supplier.

All supplier section/declaration references were resolved against main d225eaf or the available open heads. In particular, DerivedModuleAlgebra §§1.2–1.5 owns the five `DerivedDeRham` completion names, DerivedDeRhamCohomology §1.12 owns its algebraization name, and the remaining original unresolved-name leads are local declarations in Suggested.lean. EnhancedDerivedSheaves E0.7, E2:towers, E3.2, E5:abstract.2–3, E5:presentability.2 and E5:spectra-comparison, BordismFormalGroups F6.5, GeneralizedCohomology G2.1–G2.7, SchemeAndStackFoundations §0.23a, VStackSheavesAndLisseCategories VS2.1, ArithmeticStatisticsPartIV §3.2 and QSeriesPartitionsAndMockModularForms §3.1 retain their cited contracts. HabiroCohomologyFoundationsPartII and HabiroNahmSeries remain consumers, not suppliers.

The local pins were confirmed as Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The refreshed citation resolver lists no missing cross-roadmap citations; its own output says pinned-library names were not checked, so those were checked directly at these pins. Relevant native definitions and declarations are:

| Pinned file and line | Exact interface and limitation |
| --- | --- |
| `Mathlib/RingTheory/AdicCompletion/Basic.lean:56` | `class IsAdicComplete : Prop extends IsHausdorff I M, IsPrecomplete I M`; separatedness is included, finite generation of I is not. |
| `Mathlib/RingTheory/Smooth/AdicCompletion.lean:94` | `Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete`; ordinary lifting out of E, not the assembled map theorem out of its completion. |
| `Mathlib/RingTheory/Unramified/Basic.lean:161` | `Algebra.FormallyUnramified.ext_of_iInf`; uniqueness requires the displayed ideal-power intersection to vanish. |
| `Mathlib/RingTheory/PicardGroup.lean:77` | `Module.Invertible` has field `bijective : Function.Bijective (contractLeft R M)`; a global basis is not data of the definition. |
| `Mathlib/RingTheory/PicardGroup.lean:276` | `Module.Invertible.bijective_of_surjective`; the source and target have the required invertibility instances in the fibre argument. |
| `Mathlib/RingTheory/PowerSeries/Basic.lean:139` | `constantCoeff : R⟦X⟧ →+* R`; this sends X to 0, rather than evaluating at 1. |
| `Mathlib/RingTheory/PowerSeries/Basic.lean:521` and `Mathlib/RingTheory/PowerSeries/Inverse.lean:109` | `X_dvd_iff` and `isUnit_iff_constantCoeff` give the quotient and Jacobson-radical route for arbitrary commutative R. |
| `Mathlib/NumberTheory/NumberField/Discriminant/Different.lean:191` | `not_dvd_discr_iff_isUnramifiedIn` requires a prime integer; localized étale assembly and the radical-support variant are the retained headline. |
| `TauCeti/RingTheory/Cyclotomic/Lift.lean:225` and line 385 | `conjugateResiduesRingHom` and `conjugateResidues_lift` retain primality and primitive-root hypotheses; the former also carries nonzero order. |

No new work was cited and no new source key was introduced. The existing source manifest and all twelve supplied legal cached texts were available; no missing-text request is needed. Locators used in checking the interfaces include Q line 647 (completed linearization), Q line 734 (root convention), Q line 750 (Taylor equalizer), Q line 3545 (completion), W line 320 (prime-generator ideal), G line 255 (ring hypotheses), G line 443 (tensor equivalence), G line 471 (integral constants), G line 2213 (multiplicativity proof), Stacks04D1 line 18048, Stacks0ALI line 1299 and line 12293, H line 811, B line 615, Hab line 665, Bosco line 3459 and line 3488, T line 3832, MW line 1748, and HA line 7363, line 13535, line 46530 and line 46752. The source’s printed multiplicativity proof is distinguished from HabiroNumberFields’ additional effective-descent targets.

### Elaborated signatures

A single scratch fragment containing `#check @name` for every declaration was elaborated through the authorized targeted build, then removed and the final module rebuilt. All 15 supplied declaration types, plus the local scalar instance, were compared with the README; no hypothesis was lost and no signature changed.

| Declaration in `TauCetiRoadmap.HabiroRings` | Retained type/README comparison |
| --- | --- |
| `EtaleDeformation.exists_lift` | Arbitrary B, I and étale B/I-algebra D; no finite-generation or nilpotence binder, as §0.2 states. |
| `CompletedEtaleLift.mapUnique` | Étale E/B, I.FG, completeness of C for the mapped ideal and the actual reduced map g all retained; §0.5 agrees. |
| `LaurentLocalization.Coeff` | Native `LaurentPolynomial ℤ`, as §2.2. |
| `LaurentLocalization.factor` | ℕ→Coeff, exponent i+1, as §2.2. |
| `LaurentLocalization.denominators` | Submonoid of Coeff, as §2.2. |
| `LaurentLocalization.factorial` | ℕ→denominators, with P₀=1, as §2.2. |
| `LaurentLocalization.augmentation` | Coeff-linear map from ℕ→₀Coeff to the localization, as §2.2. |
| `LaurentLocalization.differential` | Coeff-linear endomorphism of ℕ→₀Coeff, as §2.2. |
| `LaurentLocalization.free_resolution` | Injectivity, image=kernel and augmentation surjectivity, as §2.2. |
| `OrdinaryDerivedComparison.laurent_regular` | Arbitrary commutative R and R-module M; m>0 retained; no torsion-free hypothesis, as §2.4. |
| `CyclotomicIndex.primeChain` | Total function of three naturals to Finset ℕ, as §3.2. |
| `CyclotomicIndex.vertices` | ℕ→Finset(Finset ℕ), as §3.2. |
| `CyclotomicIndex.height_one` | m>0, three membership hypotheses and two inclusions retained, as §3.3. |
| `etale_localization_away_of_prime_dvd` | NumberField F, Δ≠0, every discriminant prime dividing Δ and an actual away-localization retained, as §5.8. |
| `completedLineCoeffAlgebra` | `{R} [CommRing R] → Algebra (PowerSeries R) R`, the constant-coefficient instance of §6.5. |
| `completedRegulatorTriviality` | Arbitrary commutative R, invertible P over R[[X]] and a specified trivial quotient retained; no local/Noetherian hypothesis, as §6.5. |

The remaining headline statements still lack their relative/enhanced/spectral/indexed-line carriers at the pins, as the module docstring records. The first-fibre proof added to the README does not introduce an artificial Lean carrier or a weaker headline substitute.

### Adversarial mathematics pass

The table records distinct statements, definitions and conventions; repeated appearances of the same interface share a row. All changes in this repair occur in the supplier bindings, their consumers and the first-fibre deduction. Polynomial values, root residues, CRT exponents and the finite index counts were recomputed; categorical entries record the corresponding explicit test objects and maps, rather than asserting that numerical tests prove an enhanced theorem.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Commutative unital coefficients | ℤ, zero ring; matrix-ring negative control | In ℤ, 2·3=3·2=6; in 0, 0=1; in M₂(𝔽₂), E₁₂E₂₁=E₁₁≠E₂₂=E₂₁E₁₂ | Noncommutative example excluded | None |
| Perfect coverage versus perfection | Toric ℤ[t], ψ²(t)=t² | t is outside im ψ²; ψ²(1+t)=1+t²≠(1+t)² in ℤ[t], difference 2t | Coverage does not mean surjective Adams maps | None |
| Torsion-free Adams convention | a=2 in ℤ; toric t | ψ²(2)−2²=−2; ψ³(2)−2³=−6; ψ²(t)−t²=0 | All differences divisible by the indicated prime | None |
| Twisted tensor and right A-action | R=A=ℤ[t], index 2 | (t⊗1)=(1⊗t²); a⊗b↦ψ²(a)b sends both to t² | Inverting ψ² is unnecessary | None |
| Positive cyclotomic indices | m=0,1,2 | f₀=0, Φ₀=1; f₁=q−1, Φ₁=q−1; Φ₂=q+1 | Zero index cannot enter localization | None |
| Factorial convention and supplier sign | n=0,1,2 | P₀=1; P₁=1−q=−f₁; P₂=1−q−q²+q³=f₁f₂ | Cofiber transport uses (−1)ⁿ | None |
| Derived-quotient convention | ℤ with q=1; 𝔽₂ with q=1 | cofib(0)=M⊕ΣM; ordinary quotient=M | Suspended copy retained | None |
| Witt ghost and truncation indexing | S={1,2}, coordinates (1,1) | gh₁=1; gh₂=1²+2·1=3; {1,2} has 2 coordinates, versus length-1 truncated vector having 1 | Indices agree | None |
| λ-operation sign | Integer 2 | λ²(2)=1; c₂(2)=(2−4)/2=−1 | λ²=−c₂ | None |
| Spherical versus Eilenberg–Mac Lane coefficients | Sphere at degree 1 | π₁𝕊=ℤ/2; π₁Hℤ=0 | Spherical higher homotopy retained | None |
| Solid null shift | e₁ and e₀ | (1−σ*)e₁=e₁−e₀; (1−σ*)(e₁+e₀)=e₁ | Shift and inverse fixed | None |
| Solid product comparison | Index sizes 2,3 and empty index | 2·3=6 sphere summands; 0·3=0 | Empty factors handled | None |
| Countable-limit interchange bound | F(n,k)=Hℤ for k<n | colim∏ has finite-support π₀; ∏colim contains (1,1,…) | ω₁-filteredness retained | None |
| Uniform realization bound | Constant Σᵇ𝕊; Σ⁻ⁿ𝕊 | Constant realization has π_b=ℤ; negative family has π_−n=ℤ for every n | No common lower bound in negative control | None |
| Number-field ring versus line restrictions | F=ℚ, Δ=1,6 | disc=1 divides both; 6∤1, 6∣6 | Ring import broader than line import | Exact supplier binding |
| Integral order-one root line | m=1, Δ=6; m=2,3 | gcd(1,6)=1 and y¹=1; gcd(2,6)=2, gcd(3,6)=3 | Evaluation lands in R at order one | Bind §3.14 |
| Inverse pairing without unit summands | F=ℚ, Δ=6, unit line | 35+(−34)=1; 35 has prime factors 5,7 and −34 has factor 17, all uninverted | Neither summand must be a unit | Added Check |
| Supported coefficient pullback | ℚ→ℚ(i), Δ=12, p=5 | 1↦(1,1); 3↦(3,3) in ℤ₅² | Both completion factors retained | Bind §3.16 |
| Completed Frobenius naturality | ℤ[t]→ℤ, t↦0, p=2, self-pairs | f(φ(t+2))=f(t²+2)=2=φ(f(t+2)); literal square gives 4≡0 mod 4, lift gives 2 | Nonflat map included | Replace fixed-base gap |
| Completed linearization square | Same pairs, (t+2)⊗(t+3) | f((t²+2)(t+3))=6=2·3 | Right scalar balancing preserved | Bind §6.1 |
| Naturality identities, composites, iterations | Identity; compose with ℤ→ℤ[1/3]; two Frobenius steps | Identity retains tensor; at p=2 both composites give 6; t⁴+2 maps to 2; at p=3 targets are 0 | All coherences use same pair maps | Added Check |
| Cyclotomic overlap and ghost naturality | p=2, d=1; τ₄(t+2) under t↦0 | Both maps fix q=1+h; ghost values 4 and 16 reduce to 0 mod 2; completed lift gives 4 before reduction | Frobenius fixes q, not q² | Bind §§6.2–6.3 |
| Prime-generator ideal | m=1,2,3,6,12 | At 1, (0)≠(q−1); at 2,3 generator=Φ_m; at 6, b−qa=Φ₆; at 12, (q⁴+q²+1)−q²(q²+1)=1 after dividing out Φ₁₂ | m>1 necessary | Bind QWittVectors §3.2a |
| Absolute versus relative self q-Witt | Toric ℤ[T], m=2 | At q=−1 absolute image contains T² but not T; relative self-ring contains T | Different objects | None |
| Completed Gaussian Frobenius | R=ℤ[i][1/2], p=3,5 | φ₃(i)=−i; φ₅(i)=i; at p=2 completion=0 | No good-prime restriction | None |
| Imported enhanced reflection | M=ℤ, q=1; M=R_r | L_Hℤ=ℤ; L_HR_r=0 while R_r≠0 | Reflection distinct from localization | Retain foundational owner |
| Imported tower orientation | n=2,3 and factorial indices | f₂∤f₃; 2∣3!; at N=1 sign −1, N=2 sign +1 | Divisibility arrows and factorial cofinality preserved | None |
| Imported cyclotomic detection | R_r; static ℤ at q=1 | R_r/Φ_d=0 for every d but R_r≠0; ℤ/(q−1) derived has π₁=ℤ | Completeness and one-way staticity conditions retained | None |
| Imported completed tensor | Unit, zero, q=1 module | L_HB⊗̂L_HB=L_HB; 0⊗̂M=0; ℤ⊗ᴸ_ℤ[q]ℤ has π₀=π₁=ℤ | Derived tensor retained | None |
| Imported finite cyclotomic descent | m=1; m=2 over ℚ, ℤ, 𝔽₂ | One chart at 1; ℚ charts split; (1,0) fails mod-2 overlap over ℤ; q−1=q+1 in 𝔽₂ | Splitting requires comaximality | None |
| Imported marked coefficient lift | R=A, R=A², R=0 | E₁=A[[h]]; split unit (1,0) maps to (1,0); zero lift=0 | Markings and all factors retained | None |
| §0.1 marked deformation | Unit, split algebra in char 2 | ε′(id⊗id)ε⁻¹=id with same marking; with swapped target (1,0)↦(0,1); (2x−1)²=1 mod x²−x even in char 2 | Marking is data | None |
| §0.1 reduced composition | Three split markings, swap twice | swap∘swap sends (1,0) to (1,0)=id(1,0) | Intermediate marking cancels | None |
| §0.1 localization deformation | a=0,1,2 over ℤ | ℤ[1/0]=0; ℤ[1/1]=ℤ; ℚ⊗ℤ[1/2]=ℚ of rank 1, but denominators 2⁻ⁿ unbounded | No module-finiteness hypothesis | None |
| §0.2 ordinary étale lift | I=0, I=B; B=ℤ, I=(2), D=𝔽₄ | At I=0, E=D; at I=B, reductions of B and 0 both 0; disc(x²+x+1)=−3 invertible in ℤ[1/3] and 1/3 mod 2=1 | Existence without uniqueness | None |
| §0.2 Jacobian inversion | Adjoined equation yΔ−1 | Block Jacobian determinant=det(J)·Δ=Δ²; yΔ=1 makes Δ a unit | Only invertibility, not a chosen determinant value, used | None |
| §0.3 locally nilpotent rigidity | ℤ/4,(2); infinite square-zero generators in char 2 | Split reduced swap lifts swap; x₁⋯x_N≠0 for every N but each finite generated ideal is nilpotent | Uniform nilpotence unnecessary | None |
| §0.3 arbitrary-ideal negative control | ℤ[t], I=(t) | 1−t not a unit in B but a unit in B[1/(1−t)]; both reduce to 1 | Rigidity restricted to locally nilpotent ideals | None |
| §0.4 completion and quotient comparison | I=0, I=B; split E | W=E, W=0 respectively; split W=B̂² and swap(1,0)=(0,1) | Correct extremes and marking transport | None |
| §0.4 nilpotent completion | B=ℤ/4, I=(2) | I²=0; tower stabilizes at ℤ/4; completion=ℤ/4 | No extra nonzero hypothesis | None |
| §0.4 completion before localization | E=ℤ[t,1/2] | Coefficients of Σ(t/2)ⁿ are 2⁻ⁿ; no fixed 2ᴺ clears coefficient n=N+1 | W=ℤ[1/2][[t]], not ℤ[[t]][1/2] | None |
| §0.5 completed marked maps | E=B; split E | Unit hom-set has one element; split identity/swap give distinct (1,0) images | Maps fixed by their reductions | None |
| §0.5 reduced isomorphism boundary | W=ℤ₂, C=𝔽₂; C=ℤ | ℤ₂→𝔽₂ reduces to id but kernel=2ℤ₂≠0; map ℤ₂→ℤ would require 3·x=1 in ℤ | Arbitrary complete target need not give equivalence; completeness necessary | None |
| §0.6 regular-principal universality | f=2 on ℤ, f=1, f=0 | W=ℤ₂; for f=1 complete target=0; cofib(0 on ℤ)=ℤ⊕Σℤ | Regularity and derived marking distinguish cases | None |
| §0.6 unbounded-to-static route | C/f=D static | C/f² is an extension of D by D; transition on π₀ is onto and lim¹=0; π₁(𝔽₂/ᴸ2)=𝔽₂≠0 excludes static 𝔽₂ | Derived, not ordinary, reduction is the hypothesis | None |
| §1.1 pairs and Λ-arrows | t↦t+1; t↦0; Gaussian conjugation | fψ²(t)=(t+1)² versus ψ²f(t)=t²+1, difference 2t; zero specialization gives 0=0; conj²(i)=i | Translation excluded, nonflat specialization included | Bind naturality theorem |
| §2.1 Laurent comparison | P₂; class q⁻¹ in Laurent/polynomial quotient | q(1+q−q²)−1=−P₂; q·[q⁻¹]=0; (q−1)(−[q⁻¹])=[q⁻¹] | q invertible after completion; cofiber killed | None |
| §2.1 scalar restriction | A=𝔽₂, M=𝔽₂ at q=1 | Quotient by q−1 gives 𝔽₂⊕Σ𝔽₂ before and after restriction | No torsion-free coefficient restriction | None |
| §2.1 localization kernel iff | M=R_r and M=ℤ at q=1 | First reflection 0 and f₁ invertible; second reflection ℤ and f₁=0 | Both directions separated | None |
| §2.1 full versus first-root completion | Reduce by q+1 | ℤ[[q−1]]/(q+1)=ℤ₂; H/(q+1)=ℤ | First Taylor completion cannot define H | None |
| LaurentLocalization.Coeff | q⁻¹ and q=2 specialization | q·q⁻¹=1; coefficient at −1 is 1; polynomial has coefficient 0 there | Native Laurent carrier | None |
| LaurentLocalization.factor | i=0,1,2 | 1−q, 1−q², 1−q³; q=2 gives −1,−3,−7 | Exponent starts at 1 | None |
| LaurentLocalization.denominators | Empty product, repeated factor, zero | Contains 1 and (1−q)²; (1−q)²(1+q)=P₂; excludes 0 | Multiplicative closure essential | None |
| LaurentLocalization.factorial | n=0,1,2,3 at q=2 | P values 1,−1,3,−21; augmentation inverses 1,−1,1/3,−1/21 | Recursion and sign fixed | None |
| LaurentLocalization.augmentation | e₀,e₁,e₂ and 0 | At q=2 values 1,−1,1/3,0; P_i·a(e_i)=1 | Zero map and factorial instead of inverse excluded | None |
| LaurentLocalization.differential | e₀,e₂,2e₁+3e₂ | d(e₀)=e₀−(1−q)e₁; at q=2 d(e₂)=e₂+7e₃; first occupied coefficient of d(2e₁+3e₂)=2 | Sign and direction fixed | None |
| LaurentLocalization.free_resolution | e₀,e₁,e₂ and repeated denominator | a(d(e₂))=1/3+7(−1/21)=0; e₀ maps to 1; 1/(1−q)²=(1+q)/P₂ | Kernel relation and denominator exhaustiveness consistent | None |
| §2.3 Hom/Ext criterion and indexing | M=0; M=R_r static; q=1 module | Zero Hom/Ext for zero; Hom(R_r,R_r) contains id; degree-one term appears as Ext¹(π_(n+1)) | Ext and homotopy shift retained | None |
| OrdinaryDerivedComparison.laurent_regular | R=M=𝔽₂, m=1,2; m=0 | (q−1)·1=q+1≠0; (q²−1)·1=q²+1≠0; m=0 sends 1 and 0 both to 0 | Positivity necessary, integer torsion allowed | None |
| §2.4 ordinary/derived polynomial completion | M=0,𝔽₂,ℤ | P₀ quotient=0; P₁,P₂ quotients have 1,3 copies of M; onto quotient tower has lim¹=0 | Staticity uses Laurent regularity | None |
| §2.4 arbitrary-module exclusion | M=𝔽₂, q=1 before polynomial extension | Derived quotient has π₀=π₁=𝔽₂; ordinary quotient has π₁=0 | No false arbitrary-module comparison | None |
| §2.5 completed scalar extension | Identity, A′=0, ℤ→ℤ[t] | Identity returns M; zero base gives 0; ΣP_n tⁿ has unbounded t-degree and is absent from H[t] | Flatness does not remove completion | None |
| §2.5 derived tensor of finite quotients | q²−1 and q³−1 over ℤ | π₀=ℤ; π₁=ℤ·(1+q), since (q−1)(1+q)=q²−1 | Tor₁ retained | None |
| §2.6 spherical localization | Quotient P₁; first transition | T⊗ℛ/(q−1)=0; P₂/P₁=1−q² | Localization multiplication and transition fixed | None |
| §2.7 spectral reflection/unit | M=0,T,Hℤ[q±1] | L_H0=0; L_HT=0 with π₀T=R_r≠0; L_HHℤ[q±1]=H(H) | Sphere and Hℤ comparisons distinct | None |
| §2.7 monoidal restriction | Sphere versus Hℤ | π₁𝕊=ℤ/2 versus π₁Hℤ=0; HR⊗_HRHR=HR | Strong comparison only HR-relative | None |
| §2.8 completed discrete embedding | A module killed by q−1; empty coproduct | Completion fixes discrete ℤ at q=1; empty coproduct=0 | Completed, not arbitrary discrete, image used | None |
| §2.9 solid arithmetic idempotence | n=1,2 finite quotient stages | Quotient ranks 1 and 3; balancing q₁=q₂ sends q₁−q₂ to 0 | Sphere-split, not ℛ-linear-split, tower | None |
| §2.10 block completion C_I | All empty; sole singleton block | Results 0 and S_H; two singleton blocks give S_H² | Empty and finite families allowed | None |
| §2.10 marked ideals J_r | r=0,1 | J₀=fib(S_H→0)=S_H; J₁→S_H is multiplication by P₁, whose q=1 value is 0 | Marked map not forgotten | None |
| §2.10 null-family formula | Singleton blocks (1)_n and (P_n)_n | Mod P₁ constant family has infinitely many 1s; weighted family has only n=0 surviving | Decay discriminates membership | None |
| §2.10 profile direction/block maps | f=n, g=max(n−1,0); identity and zero block maps | f≥g; at n=2 ideals map P₂H→P₁H; id(1)=1, zero(1)=0 | Reverse profile order and finite output retained | None |
| §2.11 factorial divisibility | a=b=1; a=0; q=1,−1 | P₂=P₁²(1+q); at −1, P₂=0 versus P₁²=4; at 1 quotient polynomial=2, or 0 in 𝔽₂ | Direction and specialization valid | None |
| §2.11 two-index profile comparison | h=max(m,n), h=m+n, h=0 | At (3,5), ⌊3/2⌋+⌊5/2⌋=3≤5; for sum profile equality 8=8; h=0 has infinite sublevel at 1 | General theorem imported | None |
| §2.11 no ω₁-filtered profile argument | f_k(n)=max(n−k,0) | For k=n, f_n(n)=0, forcing any common target to be constantly 0 | Common target not proper | None |
| §2.12 bounded-below tensor closure | Unit with Σᵇunit; zero; shifts Σ⁻ⁿ | Unit tensor gives Σᵇunit; zero tensor=0; negative shifts have unbounded negative nonzero homotopy | Both bounds retained | None |
| §3.1 cyclotomic intersections | {1,2}, {1,6}, {3,12} | Ideals (2,q−1), (1), (2,Φ₃); last quotient has 𝔽₂-dimension 2 | Integral ideal data, not only resultants | None |
| §3.1 nonreduced base radical | A=𝔽₂[ε]/ε², S={1,2} | I=(q−1), but √I=(ε,q−1) and ε≠0 in A | Radical on both sides retained | None |
| CyclotomicIndex.primeChain | (4,1,2),(1,3,2),(0,1,2),(4,0,2),(4,3,0) | {1,2,4},{3},{1},{0},{3} respectively | Total-function boundaries agree | None |
| CyclotomicIndex.vertices | m=0,1,2,3,4,6,12 | Counts 0,1,3,3,4,8,11; strict incidence edges 0,0,2,2,3,8,12 | Maximal chains only | None |
| §3.2 inherited subset order | Singleton vertices {1},{2}; m=4 | Neither singleton includes the other; {1,4} is not a reduced vertex but lies in {1,2,4} | Divisibility order excluded | None |
| CyclotomicIndex.height_one | Exhaustive triples in the listed m values | Strict two-step inclusion chains=0 for each m | Height statement matches definition | None |
| §3.4 unique chain for consecutive edges | m=12; pairs (3,6),(2,6) | Chains {3,6,12} at p=2 and {2,6} at p=3; wrong extension adds 18∤12 | Unique p-free part fixes chain | None |
| §3.5 finite monoidal descent | Identity cover, disjoint summands, empty cover | One-chart restriction=id; disjoint pair reconstructs (x₁,x₂); empty conservative cover forces zero category | Overlap and conservativity both retained | None |
| §3.5 overlap negative control | Two localizations with same chart but falsely zero assigned intersection | L_iL_i(1)=1 versus claimed L_empty(1)=0 | Mere conservativity cannot replace coherent overlaps | None |
| §3.6 mapping-space equalizer | m=1,2,6 | Prime-edge counts 0,1,4; at 1 mapping space=Map(E₁,F₁); at 6 four paths and no composable nonidentity pair | Homotopy rather than strict equalizer | None |
| §4.1 stage maps on pairs | Self pair; Gaussian conjugation; zero stage | H_(A/A,1)=A[[h]]; conjugation swaps e=(1−iq)/2 with 1−e; zero maps uniquely to zero | Full pair map, not only base map, used | Bind Frobenius naturality |
| §4.1 zero algebra direction | Stage 0 versus ℤ[[h]] | Unique map ℤ[[h]]→0; a unital map 0→ℤ[[h]] would require 0=1 | Terminal zero not initial | None |
| §5.1 ordinary inverse-limit ring | R=0, R=A=ℤ, m=1 | H_0=0; integral H/P₁=ℤ; h-completion=ℤ[[h]] | Ordinary ring of supplier object | None |
| §5.1 quotient regularity | Gaussian R, m=4; q=1 | R[q]/Φ₄≃R² of rank 2; H/(q−1)=R and q−1 maps to 0, hence is nonunit for R≠0 | Full quotient, not selected embedding | None |
| §5.2 compatible-root datum | m=1,2,3,4,5,6,10,12 | Exponents modulo 1 are 0,1/2,1/3,1/4,1/5,5/6,7/10,7/12; denominators equal m | One imported choice, primitive at every tested order | Reuse HabiroNumberFields §2.1 |
| §5.2 CRT transitions | (p,m)=(2,1),(2,3),(2,5),(2,6),(3,3),(3,4) | CRT exponents 0,4,6,10,3,9 modulo pm; e·angle(pm)−angle(m)=0 mod 1 in all six | Transition direction/coherence pinned | Imported datum |
| §5.2 root closeness | Same six pairs | v_p(ζ_pm−ζ_m)=1,1,1,1/2,1/6,1/2; traditional order-6/order-3 difference=1 | Positive valuation, not algebraic nilpotence | Imported law |
| §5.2 relative full coefficient algebra | m=1,4; R=0 or Gaussian | C₁=R; C₄=R² with e values (1,0); C_m(0)=0 | No embedding factor discarded | None |
| §5.2 can and relative Frobenius Taylor maps | p=2,m=1, q+1 and its square | φ(q+1)=X+2; φ((q+1)²)=X²+4X+4; can(X)=X | Re-expansion sign and coefficient extension fixed | Retain relative maps |
| §5.2 Taylor map versus value | 1−q³ at ζ₃ | Value=0; series=−3ζ₃²X−3ζ₃X²−X³≠0 | All coefficients retained | None |
| §5.2 change of roots | ζ₄=i→−i; abstract relabeling | Galois action exchanges e and 1−e, so (1,0)↦(0,1); abstract presentation generator relabeled | Independence does not mean trivial action | None |
| §5.3 full prime-adic/rational comparison | m=5, ℓ=11; m=1 | Φ₅ roots mod 11 are 3,4,5,9; four factors; Φ₁=q−1 has one factor | No finite-field irreducibility assertion | None |
| §5.4 Taylor equalizer | Polynomial 1; Gaussian constant i at p=3 | can(1)=φ(1)=1; can(i)=i≠−i=φ(i) | Constant insertion generally fails | Bind arithmetic ring |
| §5.5 untwisting sufficient condition | ℤ; toric self-pair | ψⁿ=id on ℤ; a⊗b↦ψⁿ(a)b sends t⊗1 to tⁿ for toric self-pair | Not a global Frobenius hypothesis on every étale R | None |
| §5.6 completed ring base change | Identity, zero base, flat toric extension | Identity stages=id; zero target=0; ΣP_n tⁿ has nonzero terms at unbounded degrees | Completion retained after flat change | None |
| §5.7 classical comparison | R=A=ℤ | At n=1,2 quotients ℤ and ℤ[q]/P₂; q maps to 1+X | Existing classical construction imported | None |
| §5.8 discriminant-support étaleness | ℚ,Δ=1; ℚ(i),Δ=2,1 | disc values 1,−4; 2∣2 although −4∤2; Δ=1 retains ramification at 2 | Radical variant and nonzero Δ retained | None |
| §5.8 inverted prime completion | R=ℤ[1/2], p=2 | R/2ⁿR=0 for all n, hence R̂₂=0; tensor R⊗ℤ₂=ℚ₂≠0 | Completion distinguished from tensor | None |
| §5.9 κ ring comparison | ℚ,Δ=1,2; Gaussian Δ=4 | First is integral H; Δ=2 permits nontrivial idempotents; Gaussian order 4 has 2 factors on both sides | No 6 restriction on ring comparison | Bind §§2.1–2.4 |
| §6.1 module scalar extension | Identity, free rank 0,1,2, quotient f₂ | Pullback ranks 0,1,2; identity(1)=1; over ℤ[1/2], q²−1 quotient=R×R | Completion and perfect-module exception compatible | None |
| §6.1 completion of coproduct | ⊕_n H versus ΣP_n e_n | Mod P_r only n<r survive; full element has infinitely many nonzero coordinates | Algebraic direct sum is too small | None |
| §6.2 transported indexed line | ξ=0, ξ+(−ξ); Δ=12 for ℚ(i) | M₀=H; pairing degree=0; 6∣12 and −4∣12 but 24∤12 | κ-transport distinct from native Picard character | Bind §§3.8–3.11 |
| §6.3 q−1 completion map | q,q²; inverted-prime component e₁ | q↦1+X, q²↦1+2X+X²; nonzero idempotent e₁↦0 for ℤ[1/2] | Normalization and noninjectivity pinned | None |
| §6.4 integral evaluator and balancing | r=2, f with f(1)=3; h=q | e(2⊗f)=6; e(r·v(q)⊗f)=e(r⊗qf)=3r | H→R, not R→H, scalar direction | Explicit supplier binding |
| §6.4 finite-sum preimage | f₁=f₂=1, g₁=3,g₂=−2 | Σf_i g_i=1; e(3⊗1−2⊗1)=1; individual images 3,−2≠1 | No single-pair assumption | Added deduction and Check |
| §6.4 zero evaluator negative control | Same inverse sum, e=0 | e(z)=0 while evaluation of paired unit=1 over ℤ | Tensor/unit compatibility excludes zero map | Added Check |
| §6.4 lifting coefficients to a global section | H=ℤ[q], v(q)=1 | (3+q−1)−2=q and v(q)=1; lifts 3,−2 instead give 1 with same value | Lifts exist but are noncanonical | Added deduction and Check |
| §6.4 bijective fibre equivalence | Unit evaluator and negative evaluator over ℤ | t(1⊗3)=3 or −3; inverse image of 1 is 1 or −1 respectively | Equivalence retains evaluation normalization | None |
| §6.4 reconstruction identity | e=id or −id, x=3 | e(x)t⁻¹(1)=3·1=3 or (−3)(−1)=3 | Both normalizations satisfy displayed identity | None |
| §6.4 unit rescaling and naturality | u=−1; ℤ→ℤ[i] | t′(3)=−3=u·t(3); coefficient embedding sends 3 to 3 on both evaluation paths | Normalization preserved under actual map | Bind §3.16 |
| completedLineCoeffAlgebra | X,2,1+X acting on 3 | Values 0,6,3 respectively; evaluation at 1 instead gives 3,6,6 | Constant-coefficient action retained | None |
| completedRegulatorTriviality | P=R[[X]], R=ℤ,ℤ×ℤ,0 | Lifts 1 and 1+X are units, inverse of latter=1−X+X²−…; zero case has 0=1 | No locality/Noetherianity needed | Signature unchanged |
| §6.5 basis noncanonicity | Bases 1 and 1+X over ℤ[[X]] | Both reduce to 1; ratio 1+X lies in 1+Xℤ[[X]] and is not 1 | No canonical completed basis asserted | None |
| §6.6 completed Picard vanishing | ξ=0; actual first-fibre generator | Unit class maps to 0; completed basis identifies B⊗_HM_ξ with B and therefore its class with 0 | No precompletion nonzero-class assertion | Replace integral-jet gap |
| §6.7 field scalar equivalence | Identity, ℚ→ℚ(i), successive embeddings | H⊗_HM≃M sends 1⊗m↦m; at p=5 coefficient 3↦(3,3); both composite maps send 1↦1 | Tensor taken over H, naturality imported | Bind §3.16 |
| §7.1 all-conjugates example | Four residues and stated lifts mod 11⁴ | Lifts 2786,7825,1963,2066 have residues 3,4,5,9 and Φ₅ values 0 mod 14641 | Four factors preserved | None |
| §7.2 components after prime inversion | p=2, root orders 1,2,4 | Valuations 0,1,2; component idempotents square to themselves; c(e₁)=c(e₂)=0 | No domain or total Taylor-injectivity claim | None |
| §7.3 cubic Frobenius obstruction | x³−2 mod 5 | (x−3)(x²+3x+4)=x³−2 mod 5; quadratic discriminant=3, squares={0,1,4} | Residue degrees 1 and 2, Frobenius order 2 | None |
| §7.4 finite-stage obstruction | ℤ; cubic at p=5; m=1 | φ on ℤ₅ sends 3↦3; cubic quadratic root a has a⁵≠a; at m=1 no prime divides m | Marked q-algebra obstruction requires p∣m | None |

### Build and gates

`lake build TauCetiRoadmap.HabiroRings.Suggested` exited 0, with the seven intended `sorry` warnings and no errors.

```text
Build completed successfully (8976 jobs).
```

Dependency-direction check, exit 0; no UPWARD or CYCLE line:

```text
depcheck: 33 roadmaps, 302 edges, 0 problem(s)
```

Final gate after committing the repair, exit 0:

```text
gate HabiroRings: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
