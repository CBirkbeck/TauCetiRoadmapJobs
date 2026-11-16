# PORT-IgusaVarietiesAndTorsionConcentrationPartII

## Result

- Branch: `roadmap/igusa-varieties-and-torsion-concentration-part-ii`, created from `51d880d`.
- Head commit: `b96db01e7d7782a979f94f2758909cd5e0562cb5`, message `IgusaVarietiesAndTorsionConcentrationPartII: roadmap (README, Suggested.lean, metadata)`.
- Files: `TauCetiRoadmap/IgusaVarietiesAndTorsionConcentrationPartII/{README.md,Suggested.lean,metadata.toml}`. Nothing outside the folder changed. The top-level roadmap list is untouched.
- Build, `lake build TauCetiRoadmap.IgusaVarietiesAndTorsionConcentrationPartII.Suggested`: `Build completed successfully (18239 jobs).` There are 2 warnings, both `declaration uses 'sorry'`, at `Suggested.lean:83:8` and `:98:8` (the two headline theorems). The first build also gave a third, lake-level warning ("imports `Mathlib` … consider adding `module` to the start of this file"). The file now starts with `module`, as 71 `Suggested.lean` files on main do, and that warning is gone.
- Gate: `gate IgusaVarietiesAndTorsionConcentrationPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check (the brief's `gate --depcheck … --movable` command), complete output:

```text
depcheck: 250 roadmaps, 2381 edges, 0 problem(s)
```

  There is no UPWARD, CYCLE or `moved:` line.
- `roadmaps resolve` on the ported README found no cross-roadmap citation and no Lean name that occurs nowhere. The tool could not check names outside TauCetiRoadmap on this host ("no pinned Lake packages"), so I checked every backticked Mathlib and Tau Ceti name myself at the pinned checkouts (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`); see "Supplier replacements".

## Draft pull request body

Prove Caraiani–Scholze's theorem on the generic part of the cohomology of compact unitary Shimura varieties, as the second part of the Igusa-variety roadmap. The roadmap builds compact unitary PEL data of type (A) in both cases of the paper: Kottwitz's simple Shimura varieties attached to a central division algebra, and hermitian spaces quasi-split at every finite place. These include the wholly definite data of rank at least two, whose moduli problems are finite and which are not Shimura data. On these data it builds smooth proper integral models, the local datum at an auxiliary prime split in the imaginary quadratic field, the abstract spherical Hecke algebra with its Hecke polynomials, the dual ideal and Hecke-equivariant Poincaré duality, and strong decomposed genericity with the existence of auxiliary primes. The trace-formula layers show that generic Igusa cohomology lives on the `μ`-ordinary Newton stratum, in both cases. The quasi-split datum uses the stable Igusa trace identity and its spectral expansion. Kottwitz's varieties use vanishing of the proper endoscopic terms and Matsushima's formula. The last layer combines this with the parent's Hodge–Tate geometry to give Galois representations for torsion Hecke eigensystems, concentration of the generic part in the middle degree, Theorem 1.1, and its integral and twisted-coefficient forms. `Suggested.lean` states the two auxiliary-prime existence theorems, which are the headline statements expressible against the pinned Mathlib. It records why the Shimura-variety, Igusa and trace-formula headlines are not.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Dependencies still in pull requests

The README cites these roadmaps, which are open pull requests. All of them are earlier than this roadmap in the merge order, and each cited section, target or heading was read at its head through `roadmaps show`:

AlgebraicModularFormsAndSerreWeights, ArithmeticGaloisRepresentations, AutomorphicGaloisRepresentationsPartII, AutomorphicLFunctionsAndLocalFactors, AutomorphicSpectralTheory, BunGAndNewtonStrata, ClassicalAdicEtaleCohomology, DiamondEtaleCohomology, EndoscopicTransferAndUnitaryTraceComparison, EtaleDualityAndPerverseSheaves, IgusaVarietiesAndTorsionConcentration, PELModuli, PerfectoidShimuraVarieties, ShimuraCompactifications.

The README also cites these roadmaps on main: SchemeAndStackFoundations, IntegralHeckeAndGaloisDeterminants, SmoothRepresentationsOfLocalGroups, ArithmeticLocallySymmetricSpaces and ComplexComparisonPartII. The Tau Ceti file path `TauCeti/NumberTheory/ArithmeticDirichletSeries/DirichletDensity/Negligible.lean` contains the name of the completed roadmap ArithmeticDirichletSeries (on main). A name scan reads that as a citation, which is harmless because that roadmap is on main.

No id this README cites is dropped or renumbered by an open pull request (`scratch/overlaps.md`: none). No cited id is defined only by an open revision.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already satisfied the acceptance-test form. It has two definitions with real bodies on native carriers (`IsStrongGenericAt`, `IsCompletelySplitStrongGenericPrime`), needed to state the two headline theorems of §8.8. It has no sorry'd data, no padding, no examples and no `set_option`, and its module docstring names every non-statable headline and the missing carrier. I checked that no other headline is statable at the pins. Mathlib and Tau Ceti have no étale cohomology of schemes, no Shimura or PEL moduli, no Kottwitz set `B(G)` and no Igusa varieties; Tau Ceti's `Shimura` hits are docstring mentions only.

Changes to `Suggested.lean`, all without a change of statement:

- added the `module` header (see "Result");
- moved the `/-! ## Layer 8: … -/` section comment above the two definitions, which are §8.7 targets of Layer 8;
- wrote the inertia group as `Q.inertia (L ≃ₐ[F] L)` (Mathlib `Ideal.inertia`, the name the README cites) instead of the definitionally equal `Q.toAddSubgroup.inertia (L ≃ₐ[F] L)`;
- docstring of `infinite_setOf_isStrongGenericAt_degree_one`: the route said "Chebotarev's theorem in `Gal(L(ζ_ℓ)/F)`". `L` may ramify at `v₀`: `r` kills inertia at `v₀`, but `L` need not be the field `r` cuts out. Then `v₀` has no Frobenius class there. Instance: `F = ℚ`, `L = ℚ(i)`, `k = 𝔽_3`, `n = 1`, `r` trivial and `v₀ = (2)`. Then `IsStrongGenericAt r v₀` holds, and `2` ramifies in `ℚ(i, ζ_3)`. The docstring now says `L_r(ζ_ℓ)`, for `L_r` the field cut out by `r`, as README §8.8 does. Both theorem docstrings now name the Tau Ceti Chebotarev inputs.

Signature check: I put `#check @name` for all four declarations into one scratch copy of the file and elaborated it once with `lake env lean`. Each elaborated type keeps `[Field F] [NumberField F] [Field L] [NumberField L] [Algebra F L] [IsGalois F L] [Field k] [Finite k] {n : ℕ}` and `r`. Both theorems keep their existential hypothesis. Each type agrees with README §§8.7–8.8 and with `scratch/signatures.md`. The only change is that `#print` now shows `Ideal.inertia Gal(L/F) Q` in place of `Q.toAddSubgroup.inertia`, which is the same term.

## Supplier replacements and duplication removals

Supplier replacement:

- Chebotarev's theorem in §8.8. The package proved both existence theorems from "Chebotarev (ArithmeticGaloisRepresentations §5.9)" and listed ArithmeticGaloisRepresentations §§5.1, 5.9 in the §8.8 *Needs:* line. Pinned Tau Ceti proves the finite form that §8.8 uses, and I read each declaration at the pin:
  - `NumberField.Chebotarev.frobeniusPrimeSet` and `NumberField.Chebotarev.mem_frobeniusPrimeSet_mk_iff_exists_isArithFrobAt` (`TauCeti/NumberTheory/Chebotarev/FrobeniusPrimeSet.lean`, lines 93 and 177);
  - `NumberField.Chebotarev.hasDirichletDensity_frobeniusPrimeSet` and `NumberField.Chebotarev.infinite_frobeniusPrimeSet` (`TauCeti/NumberTheory/Chebotarev/Density/Chebotarev.lean`, lines 51 and 74);
  - `TauCeti.hasDirichletDensity_inter_compl_higherDegreePrimes_iff` and `NumberField.Set.HasDirichletDensity.infinite` (`TauCeti/NumberTheory/ArithmeticDirichletSeries/DirichletDensity/Negligible.lean`, lines 254 and 101);
  - Mathlib `NumberField.Set.HasDirichletDensity` (`Mathlib/NumberTheory/NumberField/DirichletDensity.lean`, line 81).

  Each is stated for a finite Galois extension of number fields `L/K` with `[IsGalois K L]`, which is the setting of §8.8. The README now cites them in a new "From Tau Ceti" contract bullet, in the §8.8 route and *Needs:* line, in the Layer 8 Dependencies, and in Scope and ownership. ArithmeticGaloisRepresentations §5.1 is no longer cited anywhere and was dropped from its contract bullet. ArithmeticGaloisRepresentations §§1.8, 5.9 stay for the profinite uniqueness arguments of §§8.5, 9.4, 10.5, 11.5 and 11.6, which concern `ℓ`-adic representations with infinite image. Brauer–Nesbitt is not at the pins. PotentialAutomorphyInfrastructure §5.13 cites the same Tau Ceti theorem for its degree-one places, so the citation matches house practice.

Other library names checked at the pins: `NumberField.IsCMField` (CMField.lean:70), `NumberField.maximalRealSubfield` (TotallyRealComplex.lean:126), `HeckeRing` (HeckeRing/Defs.lean:189), `IsArithFrobAt` (RingTheory/Frobenius.lean:184), `Ideal.inertia` (RingTheory/Ideal/Defs.lean:154), `Ideal.primesOver` and `Ideal.LiesOver` (RingTheory/Ideal/Over.lean:379, :128). In Tau Ceti: `HeckeCosetModule.instRingHeckeRing` (HeckeRing/Associativity.lean:484), and `HeckeAntiInvolution.ofAmbient` and `HeckeAntiInvolution.onHeckeCoset` (HeckeRing/Commutativity.lean:135, :165). All exist as cited.

Duplication sweep, by object, against main and every open roadmap pull request (`roadmaps grep` over all 462 heads, plus `roadmaps show` for the suppliers):

- Strong decomposed genericity and auxiliary-prime existence. AutomorphicGaloisRepresentationsPartII AG2.7 owns the local strong predicate («Strong local decomposed genericity») and the weak global existence theorem `infinitelyManyDecomposedGenericPrimes` for `FiniteModelDecomposedGenericPrime`, which excludes only the ratio `q_v`. The parent IgusaVarietiesAndTorsionConcentration cites AG2.7 for these. No roadmap states the strong global form (§8.8(a)) or the degree-one statement (§8.8(b)). Searches for "infinitely many … generic", "degree-one place" and "Remark 6.3.2/6.3.3" found only AG2.7 and PotentialAutomorphyInfrastructure §5.13. The latter gives places with scalar residual Frobenius, a different statement. The package's Scope paragraph already records the AG2.7 relationship, and it stays.
- Compact unitary data and Shin's Igusa computation. This is new in the port. AutomorphicGaloisRepresentationsPartII AG2.1a «The compact unitary PEL instance» and AG2.1b «Shin’s stable and endoscopic Igusa computation» state Shin's datum and Shin's Theorem 6.1 for it: odd `n ≥ 3`, signature `(1, n−1)` at one embedding and `(0, n)` at the others, quasi-split at every finite place. That datum is one Case 2 datum of §8.1. §§8.1 and 8.2 cover both cases. §§9.1 and 9.3 cover every Case 2 datum of every rank and signature, and assert only the shape of the expansion, not Shin's coefficients. This is a kept variant, now named in one clause in Scope and ownership. Nothing was deleted.
- Base change for the division-algebra unitary groups (the gap assigned to AG2.2). TorsionCohomologyInfrastructure §3b.2 «unitarySimilitudeBaseChange» builds Shin's base change only for the quasi-split `U(n,n)` similitude group with `B = F`. EndoscopicTransferAndUnitaryTraceComparison §13.4 «Pure cohomological unitary transfer» covers standard hermitian spaces, also with `B = F`. Neither covers a central division algebra, so the gap stands as the package states it. Neither is cited in the README.
- Stable Igusa trace identity, Newton reduction, `B(G)` products, dual Hecke ideals, Igusa duality and integral coefficients. These were checked against EndoscopicTransferAndUnitaryTraceComparison §§8.21, 8.22, 14.2–14.5, BunGAndNewtonStrata §§1.25–1.32, and the parent's §§0.4, 5.1, 5.2, 5.4 and 7.6. Each is either cited, or kept as the compact, rank-`n` form, with the difference stated in Scope and ownership.
- Kottwitz's simple Shimura varieties and the Caraiani–Scholze compact theorem. Other roadmaps cite the compact paper only for supplier inputs: EndoscopicTransferAndUnitaryTraceComparison §6.23 (cited here as a special case), the parent's compact fibre theorem (§3.17), and PerfectoidShimuraVarieties. No other roadmap states Theorem 1.1, Theorem 6.3.1, Theorem 5.5.7 or Corollary 5.6.3.
- Ownership: no construction here is owned elsewhere. The open pull requests checked include the 244 listed in the brief, and every supplier was read at its head through `roadmaps show`. No declaration of `Suggested.lean` reuses a fully qualified name of another roadmap.

## Fixes made while reading as an upstream reviewer

1. §8.8(a) route. "Each of them satisfies the predicate" was false for the prime `ℓ = 2`. Since `ℚ(ζ_2) = ℚ`, the prime `2` can be unramified in `L̃` with the Frobenius class of `p₀`, and then it fails the predicate (`ℓ ∈ v`). Instance: `F = ℚ`, `L = ℚ`, `k = 𝔽_2`, `n = 1`, `r` trivial. Every prime is in the trivial fibre, `2` included, and `IsCompletelySplitStrongGenericPrime r 2` is false. Now reads "each of them other than `ℓ`".
2. §8.8(b) route. "Every such `v` satisfies the predicate" was false at primes above `ℓ` that are unramified in `L_r(ζ_ℓ)`. Instance: `F = ℚ(ζ_3)`, `ℓ = 3`, `r` trivial, `L_r = F = F(ζ_3)`. The prime `(1 − ζ_3)` lies in the trivial fibre and contains `3`. Now reads "not above `ℓ`". The route also now says why `v₀` has a Frobenius class in `Gal(L_r(ζ_ℓ)/F)`: `r` kills its inertia and `v₀ ∤ ℓ`.
3. The `Suggested.lean` docstring route of (b) (`L` → `L_r`), as described above.

Neither Lean statement changed. Both theorems hold as stated: the excluded primes are finitely many and the sets stay infinite (table below).

## Review decisions kept

The review (`REV-PKG-…~9`) was accepted with no finding open. `FIX-PKG-…~10` and `FIX-RT-…~2` are applied in the package, and the port keeps them. The three `gap:` contracts are kept as the package designed them; main has the same convention in AlgebraicModuliForArithmeticGeometryPartII. So are the Part II layer numbering 8–11 (the gate's `layer-ids` check passes) and the kept variants listed in Scope and ownership.

## Adversarial mathematics pass

Each row gives the statement, the instances tried, the values computed and the outcome. Statements marked "package Check" were recomputed here, not copied.

| Statement | Instances | Values computed | Result; change |
|---|---|---|---|
| Lean `IsStrongGenericAt` (§8.7) | `n = 0`; `n = 1`; `n = 2`, `q_v = 7`, `ℓ = 11`, eigenvalues `{1,2}`, `{3,3}`, `{1,7}`; `k = 𝔽_2`; `v ∋ ℓ`; `v = ⊥` | `n = 0`: charpoly `1 = ∏ ∅`, so only `v ∤ ℓ` and unramifiedness remain. `n = 1`: no pairs. `{1,2}`: ratios `2, 6`, holds. `{3,3}`: ratio `1`, fails. `{1,7}`: ratio `7 = q_v`, fails. `𝔽_2`: `q_v ≡ 1`, so the condition is distinctness. `v ∋ ℓ`: second conjunct fails. `⊥`: not maximal in `𝓞 F` | holds; inertia now written `Q.inertia` |
| Lean `IsCompletelySplitStrongGenericPrime` | `F = ℚ`; `F = ℚ(i)`, `p = 5`, `p = 3`, `p = 2`; `p = ℓ` | `ℚ`: `ncard = 1 = [ℚ:ℚ]` for every `p`. `ℚ(i)`: `5` has 2 primes (`= 2`, split), `3` has 1 (inert), `2` has 1 (ramified). `p = ℓ`: every `v ∣ p` contains `ℓ`, so it fails | holds; none |
| Lean (a) `infinite_setOf_isCompletelySplitStrongGenericPrime` | `n = 0`; `F = ℚ`, `k = 𝔽_2`, `r` trivial; no witness, `n = 2`, `r = 1_2` | `n = 0`: the set is primes split in `F` other than `ℓ`, infinite. `𝔽_2`: fibre = all primes, the set = odd primes, infinite. `r = 1_2`: ratio `1` everywhere, set empty, so the hypothesis `h` is needed | true; route corrected (fix 1) |
| Lean (b) `infinite_setOf_isStrongGenericAt_degree_one` | `n = 0`; `F = ℚ(ζ_3)`, `ℓ = 3`; `v₀` with `Nv₀ = p²`; `F = ℚ`, `L = ℚ(i)`, `v₀ = (2)` | `n = 0`: the set is degree-one primes not over `3`, infinite. `(1 − ζ_3)` is in the fibre but excluded, so finitely many are lost. Degree-two `v₀`: `q_v ≡ q_{v₀} (mod ℓ)` along the class, while `Nv` is prime. `(2)` ramifies in `L(ζ_3)` but not in `L_r = ℚ` | true; route and docstring corrected (fixes 2–3) |
| Conventions: `d = Σ_Φ p_τq_τ = ⟨2ρ, μ⟩` | `n = 3`, `(1,2)`; `Φ` vs `Φc` | `2ρ = (2,0,−2)`, `⟨2ρ,(1,0,0)⟩ = 2 = 1·2`. Signature `(2,1)` also gives `2` | holds; none |
| Conventions: `μ`-ordinary iff `d_b = d` | split `GL_2` `(1,1)`; §8.3 two-embedding factor | `⟨(1,−1),(0,−1)⟩ = 1 = d`. Averaged `((−½,−1),(−½,−1))` pairs to `½+½ = 1` | holds; none |
| Conventions: reduced pair `(𝔪_G, K_∞)`, `e = [K_max:K_∞]` | `n = 1`, `ℚ(i)`; `GU(1,1)`; `GU(1,2)` | `ep(1) = 1` with the reduced pair, `1 − 1 = 0` with the full pair. `GU(1,1)`: `e = 2`, `ep(1) = χ(ℙ¹) = 2`. `GU(1,2)`: no `ν < 0`, so `e = 1` | holds; none |
| Conventions: Hecke polynomial with geometric Frobenius, `ε̄(Frob_geo) = q_v⁻¹` | `n = 1, 2`; `q_v = 7`, `ℓ = 11` | `P = X − T_1`. `P = X² − T_1X + 7T_2`. `ε̄(Frob_geo) = 7⁻¹ = 8`, `ε̄^{−1}(Frob_geo) = 7`. Arithmetic gives `{8,4}`, not `{7,9}` | holds; none |
| Conventions: integral localization | four-point `ℤ[T]/(T⁴−1)`, `ℓ = 5`, `𝔪 = (5, T−2)`; `ℚ(i)`, `𝔪_2` | The Conventions localization is the `i`-line `≅ ℤ_5`. On the `−i`-line `T+2` acts by `2 − i`, of valuation `≥ 1` and nonzero, so the ordinary localization is `ℤ_5 ⊕ ℚ_5`. `𝔪_2 ∌ 3` inverts `3`, giving `ℚ_3` | holds; none |
| Conventions: direction of `ι_p` | `F = ℚ(i)`, `p = 5`, `i ↦ 2` or `3` | `2 − 2 = 0` gives `(2 − i)`. `2 + 3 = 5` gives `(2 + i)` | holds; none |
| §8.1 compact unitary datum, SV3 criterion | `n = 1`; `n = 2` `(1,1)`; `n = 2` `(2,0)/(0,2)` quaternion over `ℚ(i)` ramified at `5, ∞`; Case 2 `n = 3` `(1,2)` everywhere | `n = 1`: SV3 holds vacuously, `d = 0`. `(1,1)`: `d = 1`, `z/z̄ ≠ 1`, SV3 holds. Wholly definite: `d = 0`, SV3 fails. `5 = (2+i)(2−i)` keeps local index 2, so `B` is division. The isotropic example is excluded by anisotropy | holds; none |
| §8.1 dimension over `Φ` vs over all embeddings | `[F⁺:ℚ] = 2`, `n = 3`, `(1,2)`, `(0,3)` | over `Φ`: `2 + 0 = 2`. Over all four embeddings: `2+2+0+0 = 4` | holds; none |
| §8.2 smooth proper models, hyperspecial = self-dual stabilizer at `p` split in `𝒦` | `n = 1`, `ℚ(i)`, `p = 5`; Shimura curve | `G(ℚ_5) = ℚ_5^× × ℚ_5^×`, hyperspecial `ℤ_5^× × ℤ_5^×` stabilizes `L ⊕ L^⊥`. Proper smooth curve, no cusps (anisotropic) | holds; none |
| §8.3 split-prime decomposition, `p^{c_i}` translation | `S_i = {τ,τ′}`, `(1,1)` and `(2,0)`; HT signature; `p` completely split | Bound `diag(t²,t)`. `κ = −3` vs `−1`, translation adds `val det p = 2`. HT: exactly one nontrivial `S_i`. Split: all `S_i` singletons | holds; none |
| §8.4 `𝕋^S`, `T_{i,v}`, `P_v` | `n = 1, 2`; degree character, `q_v = 5` | Constant term `(−1)^n q^{n(n−1)/2}T_n`: `−T_1`, then `qT_2`. `deg P = X² − 6X + 5 = (X−1)(X−5)` | holds; none |
| §8.5(1) `ι(T_i) = T_n⁻¹T_{n−i}` | `i = 0, n`; `n = 1`; degree character | `ι(T_0) = 1`, `ι(T_n) = T_n⁻¹`, `ι(T_1) = T_1⁻¹`. `deg(T_2⁻¹T_1) = q+1 = deg T_1`, consistent with `deg∘ι = deg` | holds; none |
| §8.5(2) dual roots `q^{n−1}λ⁻¹` | `n = 2`, `q = 7`, `ℓ = 11`, `{1,2}` and `{3,6}`; `q ∈ 𝔪` | Exponent `i(i−1)/2 + n(n−1)/2 − (n−i)(n−i−1)/2 = i(n−1)`. `T_1 ≡ 3`, `T_2 ≡ 5`, dual `X² − 5X + 8`, roots `{7,9}`. `{3,6} ↦ {6,3}`. `𝔪_5`: roots `{0,1}`, rule undefined | holds; none |
| §8.5(3)–(4) `ρ_{𝔪^∨} ≅ ρ^∨ ⊗ ε̄^{1−n}`, genericity invariance | `n = 2`, `q = 7`, `ℓ = 11` | `λ⁻¹·(q⁻¹)^{1−n} = qλ⁻¹`: `{7,9}`. Ratio sets `{2,6}` on both sides | holds; none |
| §8.5 transport through `ῑ` | `n = 1`, `𝔽_9`, `a² = −1` | `χ∘ι = Frob∘χ`, root `a⁻¹ = a³ = −a ≠ a` | holds; none |
| §8.6 Poincaré duality, transpose `ι(t)` | `d = 0`; `d = 1` curve | `d = 0`: `Σ f(x)g(x)`, with `T` adjoint to `ι(T)`. `d = 1`: `H²_𝔪 ≅ (H⁰_{𝔪^∨})^∨(−1)` | holds; none |
| §8.7 API: twist invariance under `r ↦ r^∨ ⊗ χ` | `{1,2,4}` under `λ ↦ cλ⁻¹` | Ordered ratios `{2,6,4,3}` map to their inverses, the same set | holds; none |
| §8.7 auxiliary pair depends on `u` | package example, `p ≡ 7 (11)`, `χ(Frob_{𝔭_1}) = 2` | Through `u`: `{1,2,4}`, ratios avoid `{1,7}`. Through `u^c`: `{1,1,1}`, ratio `1`. Order 10 avoids the Grunwald–Wang exception | holds; none |
| §8.8(b) consequence: `p` split in `𝒦`, `S_i = {τ₀}` | degree-one `v` over `p ∉ S` | `F_v = ℚ_p`, so `𝒦 ↪ ℚ_p`. `p` is unramified in `𝒦` (ramified primes lie in `S`), so `p` is split. Exactly one embedding induces `v` | holds; none |
| §8.9 dimension zero | wholly definite `n = 2`, `p` inert in `F⁺`; `n = 1` | Newton point `((−½,−½),(−½,−½))`, pairing `0`. Over `F_{𝔭_1}` it is the class of `p⁻¹`, integral slope, so `J = GL_2` is quasi-split. `H⁰ = 𝔽_ℓ^N` | holds; none |
| §9.1 stable Igusa trace identity and local matching | `φ_p = 0`; `n⃗ = (1,1)`; `𝒦 = ℚ(√−3)`, `v = 3`, `F⁺ = ℚ(√6)` | Both sides `0`. `ε = ½`. `(−1,−3)_3 = (−1/3) = −1`, so `−1 ∉ N(𝒦_3^×)`. `−3/6 = −½ ≡ 1 (3)` is a square, so `3 ∈ Spl_{F/F⁺}` and this is a genuine Case 2 instance | holds; none |
| §9.2 Newton reduction kills generic principal series | `GL_2`, basic class, `J = D^×` | `LJ(Ind) = 0`, `LJ(St) = 1_D`, `LJ(1) = −1_D` | holds; none |
| §9.3 spectral expansion | `φ_p = 0`; two terms with coefficients `±1` | All terms `0`; they cancel, so (2) asserts nothing | holds; none |
| §9.4 `r`-part, Satake scaling | `n = 2`, `q = 7`, trivial `Π_v` | `S(T_1) = √7(√7 + 1/√7) = 8`, `S(T_2) = 1`, `X² − 8X + 7`, eigenvalues `7, 1` | holds; none |
| §9.5 non-ordinary class has non-quasi-split factor | `GL_2` `(1,1)` | Ordinary `J = GL_1²`, basic `J = D^×`. Converse `J ≅ GL_{p_τ} × GL_{q_τ}` | holds; none |
| §9.6 genericity forces ordinarity | `r_𝔭 = 1 ⊕ ε`; unramified `ψ_1, ψ_2` with ratio `≠ |·|^{±1}` | `1 ⊕ ε` violates (ii), and `ψ × ψ|·|` is reducible. In the second case the induction is irreducible and generic | holds; none |
| §10.1 proper endoscopic terms vanish | quaternion `D_v`, `n = 2`, `(1,1)` | Reduced charpolys in `D_v`: irreducible quadratic (`me = 2`) or `(X−a)²`. `(X−a)(X−b)` with `a ≠ b` is impossible | holds; none |
| §10.2 stable Lefschetz identity | `n = 1`; elliptic tori | Torus: `Red` is identity up to the trivial modulus twist. `|λ|² = ν > 0` on elliptic elements, so `χ = 1` there | holds; none |
| §10.3 Matsushima, `q(G)`, `ep` | HT; `n = 1`; Shimura curve | `ep(1) = ∏ binom(n,p_τ) = n, 1, 2`. `q(G) = ½·2(n−1) = n−1 = d` | holds; none |
| §10.4 Galois reps for the division-algebra group (gap) | `n = 1`; `n = 2`, `q = 7` | Class field theory. `∏(X − 7^{1/2}x_j) = (X−7)(X−1)` | holds as a gap target; none |
| §10.5–10.6 `r`-part, ordinarity | cancelling pair; definite `G_ℝ` | Opposite coefficients give `r`-part `0`. Definite: `B(G,μ⁻¹)` is a point, statement empty | holds; none |
| §11.1 contraction | `M = 𝔽_ℓ²` with characters differing only at `p` | `M_{𝔪′} = M = M_{𝔪_1} ⊕ M_{𝔪_2}` | holds; the hypothesis `ℓ ∉ S′∖S` is unused (P3, not changed) |
| §11.2(a) weakened least-degree statement | hyperspecial `K_p`, `ℓ ∣ p − 1` | `Hom(ℤ_p^×, 𝔽_ℓ) ≠ 0`, so `H^{>0}_cts(K_p, −) ≠ 0` and the edge map need not be injective | holds; none |
| §11.2(c) Siegel lattice in `V ⊕ V` | `e = (1,t)`, `f = (1,−t)/2`, `t̄t = −1`; `q = 2 ∉ S`; Iwahori `n = 2`; `n = 1` control | `H(e,e) = 1 + t̄t = 0`, `H(f,f) = 0`, `H(e,f) = ½ + ½ = 1`, `det = −t` a unit, valid at `q = 2`. `(u_1−1)(u_2−1) = qE_11`, and `qE_22` on the dual. `⟨1,i⟩ = 1`, `⟨1,1⟩ = ⟨i,i⟩ = 0` | holds; none |
| §11.2(c) inert-place witness | `gM₀ = O·qe₀ ⊕ O·f₀` | `(gM₀)^∨ = q⁻¹gM₀`, and `q^k gM₀` is self-dual only for `k = −½` | holds; none |
| §11.3 reduction through `π_HT` | split `GL_2`, `μ = (1,0)` | The `μ`-ordinary locus is `ℙ¹(ℚ_p)` | holds; none |
| §11.4 freeness from mod-`ℓ` concentration | `C = [ℤ_ℓ →ℓ ℤ_ℓ]` | `C ⊗ 𝔽_ℓ` has cohomology in two degrees, so concentration excludes torsion | holds; none |
| §11.6–11.7 middle degree, Theorem 1.1 | worked example: `p` split in `F⁺` vs inert | `(e,f,g) = (1,1,4)` vs `(1,2,2)`. In the inert case the auxiliary condition is at one prime with `q = p²` | holds; none |
| §11.8 integral and twisted coefficients | `V = 𝔽_ℓ`, `K′ = K` | Reduces to §11.6 | holds; none |

Checks on context, generality and vacuity:

- Context. Each Lean declaration carries all its binders in its own signature, and there is no `variable` block. Confirmed by `#check`.
- Generality. The README's "number field `F`, finite Galois `L/F`, finite `k`" equals the Lean signature. The Lean admits `n = 0` and `ℓ = 2`, and both theorems remain true there (rows above).
- Vacuity. Both theorems tie their data together through the existential hypothesis. Without it, (a) is false for `r = 1_2`, whose set is empty.

## Unresolved

- None blocking.
- P3, not changed: §11.1 carries the hypothesis `ℓ ∉ S′ ∖ S`, which neither its statement nor its proof uses. `𝕋^{S′}` already omits `ℓ`. I left it, because the brief makes an unused hypothesis a note rather than a finding.
- No text read during the job asked for any action outside the brief. Nothing suspicious to quote.


Pull request: #2439 (roadmap/igusa-varieties-and-torsion-concentration-part-ii at b96db01)
