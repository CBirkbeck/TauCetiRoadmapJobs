# Port report: InertAnticyclotomicCMMainConjecture

- **Branch:** `roadmap/inert-anticyclotomic-cm-main-conjecture`, created from `51d880d`.
- **Head commit:** `920db3ff377c349fd2563b46e64ed163086c74ff` (`InertAnticyclotomicCMMainConjecture: roadmap (README, Suggested.lean, metadata)`).
- **Files:** `TauCetiRoadmap/InertAnticyclotomicCMMainConjecture/README.md`, `TauCetiRoadmap/InertAnticyclotomicCMMainConjecture/Suggested.lean`, `TauCetiRoadmap/InertAnticyclotomicCMMainConjecture/metadata.toml` (`topic = "math.NT"`, the same form as the folders on main). Nothing outside the folder changed.

## Build

`lake build TauCetiRoadmap.InertAnticyclotomicCMMainConjecture.Suggested`:

    ✔ [18238/18239] Built TauCetiRoadmap.InertAnticyclotomicCMMainConjecture.Suggested (2.2s)
    Build completed successfully (18239 jobs).

**Warnings: 0.** The file has no declarations, so there is no `sorry` warning either. The first build, run on the package file as it was, gave one non-`sorry` warning: "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module` to the start of this file". It is printed twice, once for the build step and once for the `irArts` step. I fixed it by adding a `module` line before `import Mathlib`, as 81 of the 227 `Suggested.lean` files on main do (among them the last merged roadmap, AlgebraicModuliForArithmeticGeometryPartII). After that the build was clean.

## Gate

    gate InertAnticyclotomicCMMainConjecture: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

This is the run after the commit. The run before the commit failed only on `dirty=3`, the three uncommitted files.

## Dependency direction

`gate --depcheck … --movable`, complete output:

    depcheck: 246 roadmaps, 2304 edges, 0 problem(s)

There is no UPWARD, CYCLE or `moved:` line.

`roadmaps resolve` on the new README lists no cross-roadmap citation and no Lean name that is found nowhere. It says it did not check Lean names outside TauCetiRoadmap ("no pinned Lake packages on this host"), so I checked those myself; see the next section.

## Draft pull request body

This pull request adds the roadmap InertAnticyclotomicCMMainConjecture. It takes Rubin's integral signed decomposition of anticyclotomic local units at a prime p ≥ 5 inert in an imaginary quadratic field K (which AnticyclotomicLocalUnits proves) and turns it into the global Iwasawa theory of CM elliptic curves at that prime. The input is a Gross Q-curve E over the Hilbert class field H, with p ∤ h_K and coefficients in the integers R of a finite extension of K_p. From it the roadmap:
- transports the signed formal-point Kummer images to the anticyclotomic ℤ_p-tower;
- cuts out the strict, signed, ordinary and relaxed Selmer groups on Tau Ceti's Selmer kernel `TauCeti.ContCohomology.SelmerStructure`, together with their compact and discrete limits;
- defines Rubin's integral anticyclotomic p-adic L-function as the coordinate of the primitive elliptic-unit class in a signed basis;
- through global duality, the all-auxiliary elliptic-unit module and Rubin's two-variable theorem at a non-split prime, proves the two end theorems of Burungale–Kobayashi–Ota.

The first end theorem is the integral main conjecture char(X_(−ε)) = (L_p) over Λ_R = R⟦Γ⁻⟧ (their Theorem 6.1). It keeps the μ-part at the vertical prime (ϖ_R), which an equality after inverting p would lose, and it allows E to be defined only over H. The second, for E defined over K, bounds the χ-parts of the Mordell–Weil and Selmer ranks over the anticyclotomic layers by ord_χ L_p, with one extra dimension in the opposite parity (their Theorem 6.2). Along the way the roadmap proves signed local and global control at finite level, in the form of Agboola–Howard. We want it because it is the main conjecture and the rank result at supersingular primes that the cyclotomic and split-prime theories do not reach. It is also the owner that ModularIwasawaMainConjecturesPartII and CMRankZeroConverse point to for the inert anticyclotomic statements. `Suggested.lean` states nothing. None of the headline theorems can be stated at the pins, because the Lubin–Tate signed points, the signed Selmer conditions, Gross Q-curves with their p-adic avatars, and Rubin's p-adic L-function have no pinned carrier. Its docstring says what each headline lacks.

## Dependencies that are still pull requests

- AnticyclotomicLocalUnits
- NonordinaryCMSpecialValues
- ComplexMultiplicationAndExplicitReciprocity
- SelmerIwasawaCohomology
- ArithmeticGaloisDuality
- EulerSystemsAndKolyvaginSystems
- LubinTateFormalModulesAndQuasiCanonicalLifts

All seven add new roadmap folders, and all come before this roadmap in the merge order. Their positions are 373, 371, 179, 93, 68, 113 and 370; this roadmap is at 374.

The suppliers on main are IntegralIwasawaTheory, PadicMeasuresIwasawaAlgebras, EllipticCurves and ClassFieldTheory.

The Scope also names NoncommutativeAndEquivariantIwasawa §4.3, only to mark a boundary (its statements are for a split prime). It is not a supplier.

No id cited here is defined only by an open revision.

## What moved from the Lean to the README

Nothing moved. The package's `Suggested.lean` was already in the required form: `import Mathlib`, one module docstring and an empty namespace, with no declarations, no `sorry`, no `set_option` and no `TauCeti.*` import.

I checked that this is right. The headlines are §4.6 (BKO21 Theorem 6.1) and §6.4 (BKO21 Theorem 6.2); the docstring also lists §§4.2 and 4.4. None of them can be stated at the pins:
- The pinned Tau Ceti has no Lubin–Tate module and no anticyclotomic tower; I grepped for both and found neither.
- The pins do have Hecke characters (`HeckeCharacter`), the Selmer kernel, the characteristic ideal and the `m`-Selmer groups, which is what the docstring says.
- Every headline needs the signed Selmer conditions, Rubin's L_p or both, so a few simple definitions cannot make it statable.

The one change to the file is the `module` header, made for the build warning described above. The docstring's claims about the pins were rechecked, and every name it mentions exists at the pin.

**`#check` record.** `Suggested.lean` declares nothing, so there are no binders to compare. Instead I put `#check @name` for every Mathlib name the README cites, and for every Tau Ceti name whose module is compiled in this worktree, into one scratch file and elaborated it once with `lake env lean`. That is 24 names, among them every newly cited one except `TauCeti.Iwasawa.completedCoordinateEquiv`. All elaborated with no error. The elaborated types match the README contracts:
- `PowerSeries.exists_isWeierstrassFactorization` needs `IsAdicComplete (maximalIdeal A) A` and a nonzero reduction;
- `Polynomial.IsDistinguishedAt.algEquivQuotient` needs `IsDistinguishedAt I` and `IsAdicComplete I A`;
- `TauCeti.IsCompactModule.completedGroupAlgebraModule` needs `CompactSpace R` and `CompactSpace Γ`, which the contract's remark on compactness of R covers.

The remaining Tau Ceti names are in modules that are not compiled in this worktree, and the brief does not allow building them. They are `charIdeal`, `charDivisor` and their lemmas, `LinearEquiv.charIdeal_eq_comap`, `completedCoordinateEquiv`, `SelmerStructure` and its API, `ContCohomology.H1`, and `WeierstrassCurve.selmerStructure`, `selmerGroup`, `kummerSelmerMap` and `kummerSelmerMap_injective`. I checked each at the pinned source (Tau Ceti `2fd255d997`, Mathlib `1b1ccf4b0`): the declaration line, the enclosing namespace, and, for the characteristic-ideal lemmas and `completedCoordinateEquiv`, the hypotheses.

## Supplier replacements and duplication removals

**Supplier replacements.** The package cited PadicMeasuresIwasawaAlgebras for two things that the pins already have. Both are now cited at the pin:
- **Weierstrass division and preparation, and the freeness of Λ_R/(ω) for distinguished ω** (formerly PadicMeasuresIwasawaAlgebras §4.3). These are now Mathlib's `PowerSeries.exists_isWeierstrassDivision`, `PowerSeries.exists_isWeierstrassFactorization` and `Polynomial.IsDistinguishedAt.algEquivQuotient` (Mathlib/RingTheory/PowerSeries/WeierstrassPreparation.lean), with `AdjoinRoot.powerBasis'` (Mathlib/RingTheory/AdjoinRoot.lean). The cyclotomic product formula is now also cited as `Polynomial.prod_cyclotomic_eq_X_pow_sub_one`. PadicMeasuresIwasawaAlgebras §4.3 itself says it is "built on Mathlib `PowerSeries.exists_isWeierstrassFactorization`". The places changed are the Scope, the Mathlib contract (with the hypotheses and the derived factorisation f = ϖ_R^μ·P·u), the PadicMeasuresIwasawaAlgebras contract, the routes and *Needs:* lines of §§0.5, 5.1, 5.2 and 5.4, and the Layer 0 and Layer 5 Dependencies.
- **The Iwasawa coordinate Λ_R ≃ R⟦T⟧** (formerly PadicMeasuresIwasawaAlgebras §4.5). This is now Tau Ceti's `TauCeti.Iwasawa.completedCoordinateEquiv` (TauCeti/RingTheory/Iwasawa/CompletedCoordinate.lean): for a noetherian local O complete for its maximal ideal with p ∈ 𝔪_O, an O-algebra isomorphism O⟦T⟧ ≃ O⟦ℤ_p⟧ with T ↦ γ − 1. The places changed are the Conventions, the Scope and the Tau Ceti contract. The contract adds the composition with ℤ_p ≃ Γ⁻ and the change of generator T ↦ (1+T)^u − 1.

PadicMeasuresIwasawaAlgebras is still a supplier for §1.7 (coefficient extension) and §4.6 (base change and restriction of scalars of characteristic ideals), and it still receives the two gaps the package already asked of it.

**Duplication removals: none.** I swept by object, at the pins, on main and at the open heads, for the following:
- signed anticyclotomic Selmer groups;
- Rubin's anticyclotomic p-adic L-function;
- inert-prime main conjectures and the BKO and Agboola–Howard theorems;
- the signed control elements ω_n^±;
- the all-auxiliary elliptic-unit module;
- Gross Q-curves;
- Billot's specialisation theorem.

No other roadmap owns a target of this one:
- ModularIwasawaMainConjectures has Kobayashi's signed objects on the cyclotomic tower of E/ℚ (its §4.5). That is a different tower with different Selmer groups.
- NoncommutativeAndEquivariantIwasawa §4.3 is the split ordinary case.
- EulerSystemsAndKolyvaginSystems has the Euler-system machinery, which is cited here and not restated.
- ModularIwasawaMainConjecturesPartII and CMRankZeroConverse name this roadmap as the owner of these statements and restate none of it.
- `roadmaps overlaps` reports no other pull request changing this roadmap, no dropped id and no second copy.

Ownership against the open roadmap pull requests was checked with `roadmaps grep`, `roadmaps show`, the overlap file and the closest-vocabulary list.

## Fixes made on the upstream-reviewer reading

- **Layer 0, Examples.** The package said "Ψ_1 is the degree-5 subfield of the first two-level Lubin–Tate tower fixed by the tame group of order 24". That does not determine the field. The Δ-fixed subfield Θ_1 of Φ(F[π²]) has Galois group (1+πO)/(1+π²O) ≃ O/πO ≃ (ℤ/5)². That group has p+1 = 6 subgroups of index 5, so Θ_1 contains six cyclic subfields of degree 5 over Φ. The text now says that Ψ_1 is the subfield of Φ(F[π²]), of degree 24·25 over Φ, fixed by Δ and by Γ⁺, and notes that degree alone does not pick it out.
- Nothing else needed changing. The rest of the README was read in full. Every locator, convention and Check I recomputed agrees with its section; the table below gives the values. Eight review rounds and two red-team rounds had already been settled on the package, and I re-raise none of their decisions.

## Adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions: p splits completely in H, H_𝔭=Φ | K=ℚ(√−23), p=5 | (5)=pO_K is principal, so its Artin symbol in Gal(H/K) is trivial; 5 splits completely in the cubic H/K | holds | — |
| Conventions: f≠(1) | f=(1) | φ((−1))=φ((1))=1, but type (1,0) forces −1 | holds | — |
| Conventions: units inject mod gpⁿ | u=−1, i, ζ_3, ζ_6 | N(u−1)=4, 2, 3, 1, each <p²=25 | holds | — |
| Conventions: μ of Λ_R/(π) is e | R=O; R=O[√π] | e=1; (π)=(√π)², so e=2 | holds | — |
| Conventions: c(χ) and sign table | p=5: trivial, order 5, order 25 | c=0, 2, 3; signs +, +, −. Order parity would give +, −, + | holds; the wrong model is excluded by the §0.3 Check | — |
| §0.1 inert datum | K=ℚ(√−23) | reduced forms (1,1,6), (2,±1,3), so h=3; −23≡2 mod 5, and the squares mod 5 are {0,1,4}; Frobenius (X+5)², trace −10, against a_p=0 | holds | — |
| §0.2 towers | n=0, n=1 | K_0=K, Ψ_0=Φ; [Ψ_1:Φ]=5 against [Φ(F[π]):Φ]=24; cγc⁻¹γ=1 against γ²≠1 | holds | — |
| §0.3 conductor dictionary | order p² | factors through K_2 and K_3, not K_1 | holds | — |
| §0.4 dual lattice | R=O; R=O[√π] | inverse different O; different (2√π)=(√π), and (√π)⁻¹R/R has 25 elements; Tr_(O/ℤ_p)(1)=2 | holds | — |
| §0.5 signed decomposition | a=p; a=T; u=1+√π, p=5 | a(χ⁻¹)=p≠0; T has a single zero (trivial character); δ(uv_+)=(1+√π)δ(v_+), δ_1=(6/5)(1+√π)δ(v_+) | holds | route now cites the Mathlib Weierstrass factorisation |
| Mathlib contract: f=ϖ^μ·P·u | f=ϖ_R; f=T; f=unit | μ=1, P=1, no zeros; P=T, zero at 0; P=1 | holds | added |
| Tau Ceti contract: change of generator | u=1; u=−1 | T↦T; T↦(1+T)⁻¹−1, the involution of §4.3 | holds | added |
| §1.1 Kummer conditions | n=0, R=O | A_0⁺=0 (λ injective, 1∈Ξ⁺); Q⊗π⁻¹≠0; [π]Q⊗π⁻¹=Q⊗1=0 while λ([π]Q)=πλ(Q)≠0; a base point of log a at level 1 traces to pa | holds | — |
| §1.2 independence | p=5, n=2; π; conjugate embedding | γy=uy forces u=ζ_5∉ℤ_25; ker[π] has 25 elements; cubes in μ_24 form μ_8, a⁴ has order 6∉μ_8, so its cube root has order 18∤24 | holds | — |
| §1.3 rational vanishing | q=4 | \|α\|=2≠1, \|q/α\|=2≠1; the integral H¹ is nonzero iff α≡q mod 𝔪_R | holds (rational statement only) | — |
| §1.4 Selmer groups | n=0 | A_0⁺=0 and A_0⁻=F(Φ), so Sel_+=Sel_str and Sel_−=Sel | holds | — |
| §1.5 duals | L=Φ(ζ_5), [L:ℚ_5]=8 | Tr(ζ_5)=−2: f(x)=0, f(γ⁻¹x)=(8+2)/25=2/5; the wrong action gives specialisation 𝔽_25 instead of M^∨; D_k^∨ has 25 and 625 elements | holds | — |
| §2.1 primitive class | auxiliary λ | \|φ̄(λ)\|=√Nλ≠Nλ, so the Euler factor is nonzero and that class is not ξ | holds | — |
| §2.2 special values | χ=1, p=5; c(χ)=2 | 1−(−p)/p²=1+1/p=6/5; the local factor at p is 1 | holds | — |
| §2.3 sign | ε=+, orders p², p; ε=−, χ=1 | W=(−1)³=−1 gives δ_χ(ξ)=0; W=+1; L(φ̄,1)=0 by the functional equation | holds | — |
| §2.4 coordinate | v, πv, 0; a=T, u=1+T; e=2 | 1, π, 0; T/(1+T)∈(T); (ϖ_R)⊋(π) | holds | — |
| §2.5 interpolation | χ of order 5; ε=−, ξ=πv_− | ζ against ζ⁴≠ζ; L_p(1)=π≠0 although δ(ξ)=0 | holds | — |
| §3.1 global module | K=ℚ(i), p=7, f=(2+2i), α=−1+2i; basis πt_0 | α−1=i(2+2i), N(α)=5; twisted factor 1−ᾱ/5=(6+2i)/5≠0, untwisted 0; πt_0 gives the ideal (πL_p) | holds | — |
| §3.2 descent | K=ℚ(√−23), p=5 | #G=3 and 72, both prime to 5 | holds | — |
| §3.3 local units | H¹(Φ,T′); a=(−1+2i); a=O_K | R-rank 2; d_a(1)=6−2i, of norm 40; \|αζ\|=√5≠5; d_(O_K)=0 | holds for a≠O_K | — |
| §3.4 ranks | p=5, 7; ranks of S_str, S_rel, ℋ; Λ_(2)⊕Λ_(2)/(γ⁺−1); primes (1+i) and (3) at p=7 | κ̄^p has order 24 and 48; rank X_rel=2−1+0=1, and 2 if the image were 0; specialisation of rank 2; 2⁶≡15 and 9⁶≡36 mod 49, so neither is a root of unity in ℤ_7 | holds | — |
| §3.5 strict comparison | Λ_R/(π); p=5 | char=(ϖ_R)^e, μ=e; tame degree 24 is prime to 5 | holds | — |
| §4.1 duality sequences | n=0, s=+; model ℋ^ε=Λ, S_ε=(T), S_str=0 | first sequence: two identities; second: local term of rank 2; model cokernel Λ/(T) | holds | — |
| §4.2 opposite torsion | model | rank X_(−ε): 1−1+x−0=0, so x=0 | holds | — |
| §4.3 relaxed torsion | Λ/(T), Λ/(T²); (T−a); p=5 layer K_1; ℚ(i), α=−1+2i | char (T), (T²); a′=(1+a)⁻¹−1≠a for a∉{0,−2}; τγτ⁻¹=γ⁴, so Gal(K_1/ℚ) is dihedral of order 10; the character of W^τ at Frob_(α) is ᾱ=5/α=−1−2i≠α | holds | — |
| §4.4 characteristic formula | model C=(T²); C=πS_ε | (T)(T)=(T²)=char Λ/(T²), whereas S_ε in place of loc(C) gives (T); extra factor (π)=(ϖ_R)^e | holds | — |
| §4.5 localised lattice | α≡2 mod p at p=5, 7, 11; α≡1 mod p; degree d | α(ᾱ−1)≡2, a unit in each case; 0 for α≡1; (f^d) | holds | — |
| §4.6 main conjecture | d=2, L_p=T; ε=+ | (T²), not (T); the torsion module is X_− | holds | — |
| §5.1 control elements | n=0; p=5, n=2 | ω_0⁺=1, ω_0⁻=γ−1; degrees 20+5=25; (X−1)Φ_5(X)Φ_25(X)=(X⁵−1)Φ_5(X⁵)=X²⁵−1; Φ_25(1)=5; Res(Φ_25,Φ_5)=Φ_5(1)⁴=5⁴; Φ_25(1+T)≡T²⁰ mod 5 | holds | route now cites `Polynomial.prod_cyclotomic_eq_X_pow_sub_one` |
| §5.2 local control | n=1, s=+; p=5, n=2; dual 𝔪=(ϖ_R,T) | ω_1⁺=1 (monic of degree 0, quotient 0); coranks 20 and 5; 𝔪/T𝔪≅R⊕R/ϖ through (f(0), f′(0) mod ϖ) | holds | route now cites `Polynomial.IsDistinguishedAt.algEquivQuotient` and `AdjoinRoot.powerBasis'` |
| §5.3 Selmer control | n=0, s=+, − | both sides 0; coinvariants against Sel(K,W) | holds | — |
| §5.4 decomposition | χ=1, ε=+; Λ_R/(ω_2⁺,ω_2⁻) | the minus condition retains χ=1; the ring contains 5⁴, lies inside (5,T), and is nonzero | holds | *Needs:* re-sourced |
| §5.5 dimension ≤ length | A/𝔪^k; κ²; Λ_R/(g²); R=O[ζ_p], f=T−(ζ−1) | 1≤k; 2=2; 1≤2; f vanishes at ρ and not at ρ⁻¹ | holds; ρ and ρ⁻¹ are kept apart for general R | — |
| §5.6 strict inequality | X_str=Λ/(g²); χ=1 | dim 1 ≤ ord 2; the trivial character equals its inverse | holds | — |
| §6.1 divisor containment | (fg)⊆(f), g=T; orders | the reverse inclusion fails; 1≤3 | holds | — |
| §6.2 CM local correction | n=0, χ=1; ℚ_p count | dim E(Φ)⊗Φ=1; 2pⁿ over ℚ_p would count both embeddings | holds | — |
| §6.3 matching parity | χ=1, ε=+ | dim Sel(K,V_pE) ≤ ord_1 L_p | holds | — |
| §6.4 rank bounds | ε=±, χ=1; K=ℚ(√−23) | +0 when ε=+, +1 when ε=−; h=3, so no curve over K and §6.4 is vacuous there while §4.6 applies | holds | — |
| Layer 0 Examples: Ψ_1 | Gal(Θ_1/Φ)≃O/πO | (ℤ/5)² has 6 subgroups of index 5 | "the degree-5 subfield" did not determine the field | **fixed** |
| Context (variables/includes) | `Suggested.lean` | no declarations, so no binders | vacuous | — |

## Unresolved, for the worker and the human reviewers

1. **Two supplier gaps have a second planner later in the merge order.** `gap:elliptic-unit-euler-system` and `gap:inert-two-variable-main-conjecture` ask NonordinaryCMSpecialValues (merge order 371) for:
   - the prime-to-p norm relations of the standard elliptic units;
   - Rubin's Theorem 4.1(ii) at a non-split prime.

   ModularIwasawaMainConjecturesPartII (merge order 404, after this roadmap) says in its Scope that it owns exactly these: "the elliptic units `a ζ_m` of every modulus with their Euler-system norm relation" (its §2.2), and Rubin's Theorem 4.1 with the inert and ramified primes in its §4.8(ii). This roadmap cannot consume a later roadmap, so it keeps the requests on NonordinaryCMSpecialValues, as the accepted package does. For a single owner, either NonordinaryCMSpecialValues adopts the gaps and ModularIwasawaMainConjecturesPartII cites it, or the merge order is changed so that the latter comes earlier. That is the maintainers' decision. The final package review also flagged this for human reviewers.
2. **Six supplier gaps remain open requests**, written in the "What X must provide (gap:…)" form used on main:
   - `gap:wiles-reciprocity-every-local-unit` (AnticyclotomicLocalUnits);
   - `gap:elliptic-unit-euler-system` and `gap:inert-two-variable-main-conjecture` (NonordinaryCMSpecialValues);
   - `gap:leopoldt-abelian-over-imaginary-quadratic` (IntegralIwasawaTheory, on main);
   - `gap:restriction-of-scalars-finite-extension` and `gap:character-prime-multiplicity` (PadicMeasuresIwasawaAlgebras, on main).
3. **Licence notes carried from the final package review**, for the human reviewers: the cached BKO21 text carries a JSTOR download stamp, and the cached AHI06 text names the journal's open archive as its origin, while `sources.toml` records the author page. BRU67 is waived and was not read; it is cited only for the Ax–Brumer theorem requested from IntegralIwasawaTheory.
4. **Some Tau Ceti names were checked by source, not by elaboration.** Some pinned Tau Ceti modules are not compiled in this worktree, and the brief permits no build of them. So the `#check` elaboration covered Mathlib and the compiled Tau Ceti modules, and the rest were checked at source, as described above.
5. **Suspicious text:** none. No text in the reviews, reports, supplier roadmaps or sources asked for anything outside this job.


Pull request: #2435 (roadmap/inert-anticyclotomic-cm-main-conjecture at 920db3f)
