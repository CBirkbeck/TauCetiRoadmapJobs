# Review of SmallRamificationAndAbelianVarietyBaseCasesPartII (pull request #1835 at 2e903b7)

**Verdict:** needs changes

Unqualified README and Suggested.lean locations below mean `TauCetiRoadmap/SmallRamificationAndAbelianVarietyBaseCasesPartII/README.md` and `TauCetiRoadmap/SmallRamificationAndAbelianVarietyBaseCasesPartII/Suggested.lean`. Supplier line numbers refer to each supplier's README at the head named in the brief (SmallRamificationAndAbelianVarietyBaseCases at #970, FiniteFlatGroupsAndIntegralPadicHodgeTheory at #879, PadicHodgeTheory at #1062, and so on); main-branch suppliers at main ffac513.

## R01 (P2) — The refined approximate-embedding contract asks for more than any cited source proves

**Location.** README line 73: "For every finite Galois L/K … and every real c>0, Pₘ(L/K) for all real m>c implies Fontaine's shifted upper break u(L/K)≤c"; the same sentence is the `needs` of gap `pm-remove-inverse-e` in `design/plan.json`. Consumed at README line 314 (§1.7 route, c=1+r/(p−1)) and line 324.

**Claim.** For arbitrary real c>0, Pₘ for all m>c forces u≤c, i.e. the exact threshold of the Pₘ property is u.

**Witness.** Fontaine93 lines 400–407 (§3.8, printed p. 11): from Pₘ for all m>1+r/(p−1), [Fo1] Prop. 1.5 gives only u−1/e≤1+r/(p−1); the sharp u≤1+r/(p−1) needs "l'argument de la fin du n° 1.8". That argument is the integrality step restated in FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.6.4(c) (its README lines 8455–8460): with n=e_{L/K} and p∣n, n(p−1)u and n(p−1)c are multiples of p within p−1 of each other. It needs (p−1)c∈ℤ. For general real c it yields only u≤c+1/n: with c=2.9, n=4, p=2 the two cited inputs give u≤3.15 and u≤3, not u≤2.9. §R07.6.3 states only (i) m>u⇒Pₘ and (ii) Pₘ⇒m>u−1/e; neither it, §R07.6.4 nor Fontaine93 states inf{m : Pₘ}=u for arbitrary L/K, and the README cites nothing else. The contract is therefore not precise: it asks the supplier for an unsourced strengthening that §1.7 does not need.

**Repair.** Restate the contract at README line 73 and in the plan's gap `needs` as: "For prime p, perfect characteristic-p k, K=Frac W(k), every finite Galois L/K and every real c≥1 with (p−1)c∈ℤ: Pₘ(L/K) for all real m>c implies u(L/K)≤c. Route: §R07.6.3(ii) gives u≤c+1/e_{L/K}; an unramified L/K has u=0 and a tame ramified one has u=1≤c; when p∣e_{L/K}, e_{L/K}·u=Σ_{j<i_G}|G_j| and e_{L/K}(p−1)c are multiples of p within p−1 of each other." Leave §1.7 (line 314) as is: its c=1+r/(p−1) has (p−1)c=p−1+r∈ℤ and c>1. Tested: the refuting instance c=2.9 no longer satisfies the hypothesis; on the roadmap's instances p=3, r=1, c=3/2 has (p−1)c=3 and the tame quadratic kernel field has u=1≤3/2; the identity e·u=Σ|G_j| gives 2·3=2+2+2 for ℚ₂(√2) and 6·2=6+3+3 for ℚ₃(ζ₉).

## R02 (P3) — The eight gap contracts carry no `gap:<slug>` marker in the README

**Location.** README lines 59, 65, 67, 69, 71, 73, 85, 97: "What PadicHodgeTheory must provide (the Witt proper smooth comparison contract): …" and the seven analogues; the README contains no occurrence of `gap:`.

**Claim.** Each declared gap is stated where the intake reads it, with the same slug in `plan.json` and in the README.

**Witness.** `design/plan.json` declares the slugs `witt-proper-smooth-comparison`, `fl-acris-truncation`, `fl-weight-zero-unramified`, `fl-rank-one-inertia`, `fl-oriented-mod-p-splitting`, `pm-remove-inverse-e`, `finite-torsion-kernel-dictionary`, `completed-unramified-inertia`; the README names the contracts by descriptive phrases only. The form on main is `What <Supplier> must provide (gap:<slug>): <needs>` (ReductiveGroups README, three contracts) and in the open consumer (EnriquesSurfacesAndIntegralNonexistence README line 99, `gap:fontaine-low-degree-hodge`, and its Needs line 1127).

**Repair.** In each of the eight sentences replace the parenthesis by the slug, e.g. line 59 "What PadicHodgeTheory must provide (gap:witt-proper-smooth-comparison): …", line 65 "(gap:fl-acris-truncation)", line 67 "(gap:fl-weight-zero-unramified)", line 69 "(gap:fl-rank-one-inertia)", line 71 "(gap:fl-oriented-mod-p-splitting)", line 73 "(gap:pm-remove-inverse-e)", line 85 "(gap:finite-torsion-kernel-dictionary)", line 97 "(gap:completed-unramified-inertia)"; in the Needs lines that consume them (lines 163, 269, 287, 324, 379, 425, 443, 463, 481, and the dependency lines 350, 525) append the slug after the prose name, e.g. "the killed-p A_cris truncation contract (gap:fl-acris-truncation)". No statement changes.

## Verified sound

**Gate and build.** The worker's gate at 2e903b7 passes every check (build=0, depcheck=0, outside-folder=0). `git diff --stat origin/main...HEAD` outside the folder is empty. `lake env lean` on Suggested.lean: two `declaration uses 'sorry'` warnings (lines 64, 78), nothing else. Dependency check: `depcheck: 241 roadmaps, 2362 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line; the roadmap sits at ORDER line 308, after every supplier it names (PadicPeriodRings 18, CrystallineCohomology 20, ArithmeticGaloisRepresentations 42, FiniteFlatGroupsAndIntegralPadicHodgeTheory 46, DeligneWeightsAndPurity 78, SmallRamificationAndAbelianVarietyBaseCases 110, PadicHodgeTheory 113, K3SurfacesAndSymplecticBoundedness 299); SchemeAndStackFoundations, EtaleCohomologyFoundations and EllipticCurves are on main, LocalFieldsRamification under `Completed/`. EnriquesSurfacesAndIntegralNonexistence (ORDER 307) is cited only as a consumer.

**Signatures.** A scratch file with `#check @` on all four declarations elaborated. `hasWittGoodReductionAt` keeps `[Fact p.Prime]` and quantifies a ring map `ℚ →+* FractionRing (WittVector p (AlgebraicClosure (ZMod p)))`, a scheme `Y`, `g : Y ⟶ Spec W` with `Smooth g ∧ IsProper g`, and an isomorphism of the two pullbacks over `Spec K` compatible with both second projections; `hasEverywhereWittGoodReduction` is the ∀p-closure; `lowDegreeHodgeVanishing` keeps `[Smooth f] [IsProper f]`, the everywhere hypothesis, `i ≠ j`, `i + j ≤ 3` and concludes `Subsingleton` of the Zariski cohomology (TauCeti `Scheme.Modules.Cohomology`, `Cohomology/Basic.lean:61`, defined as `Sheaf.H` on the small Zariski site) of the `i`-th sheaf exterior power of `relativeDifferentials ℚ X`; `geometricK3_hasBadWittPrime` keeps `[Smooth f] [IsProper f]` and the five conditions on the pullback to `AlgebraicClosure ℚ`. No section `variable` block exists, so no hypothesis can be dropped silently. Generality equals the README's (§§0.1, 3.2, 4.2).

**Headlines.** README headlines: §§1.7–1.8 (higher-weight ramification bound), §§2.7–2.8 (exhaustive filtrations), §3.1 (zero-or-Tate low-degree cohomology), §3.2 `lowDegreeHodgeVanishing`, §4.2 `geometricK3_hasBadWittPrime`. The two statable ones are stated; the others are named in the module docstring with the missing carrier, and at the Tau Ceti pin no file mentions Fontaine–Laffaille modules, A_cris, or étale cohomology with Galois action (grep of `TauCeti/`), so they are indeed not statable. The five expanded K3 conditions are byte-for-byte the body of `IsK3` at K3SurfacesAndSymplecticBoundedness Suggested.lean lines 93–98 (rev of #1375): `SmoothOfRelativeDimension 2 f ∧ IsProper f ∧ GeometricallyIntegral f ∧ Nonempty (⋀² Ω ≅ unit) ∧ Subsingleton (H¹ unit)`.

**Padding probe.** Copies of both theorems closed with `simp`, `infer_instance`, `rfl`, `trivial` (8 probes): all 8 fail (`simp` made no progress; instance synthesis fails; `rfl`/`trivial` leave the goal). The two definitions have real bodies on native carriers and exist only to make the headlines statable. No padding.

**Sources, seeded sample.** Fontaine93 is an OCR scan, PDF page = printed page + 1 (line 85 opens printed p. 3). Checked at the text: 0.1 and 3.3 — Theorem 1 line 93 and Remark (a) lines 97–103 (models over W(F̄ₚ) with generic fibre X⊗Frac W(F̄ₚ), weaker than a ℤ-model); 1.1 — §3.2 lines 294–299 (b_E strict >r/(p−1), Filⁱ by v₀≥i/p, φᵢ=x̂ᵖ/(−p)ⁱ) and line 304 (Filⁱ=0 above r); 1.3 — Lemma 2 line 328 and the sub-lemma line 333 (n>re/(p−1)); 1.4 — §3.1 line 285, Lemma 1 line 312, §3.5 line 341; 1.5 — Lemma 3 lines 363–368 (#J(E)≤pᵈ, equality iff a K-embedding L→E); 1.6 — §3.7 lines 369–373 (Pₘ, Lemma 4 for m>1+r/(p−1)); 1.7 — Theorem 2 lines 23–30 and §3.8 lines 400–407 (strict v(𝔇)=u−i<u); 2.2 — §2.1 lines 141–146 and §2.2 lines 175–177 (V₄=0, Vᵢ in order 3,2,1,0, V₀=V); 2.3 — Lemma 1 lines 184–197; 2.4 — Lemma 2 lines 198–212 (7^{1.5}<18.52, unique 7-Sylow, F′ tame, 6n″≤10); 2.5 — Lemma 3 lines 220–239 (exception i=0, j=3; 7^{53/42}<11.66); 2.7 — Proposition 1′ line 183 and §2.7 lines 274–283. Schroeer23 line 658 (Proposition 5.5, printed p. 15) and lines 683–697 (printed p. 16: h^{2,0}≠0 contradicts Fontaine's theorem over W(F₂^sep)). LMFDB32a3 lines 91–95, 262, 277, 510–517: Δ=64=2⁶, j=1728, Kodaira III, additive, ord₂(Δ)=6. Every locator in the README's 24 target blocks points at the stated theorem and page.

**Adversarial table** (values computed on each side).

| Statement | Instances | Values | Result |
| --- | --- | --- | --- |
| §0.1 both predicates | ℙⁿ (n=0,1), ∅, Spec ℚ | both pullbacks ℙⁿ_K / ∅ / Spec K, both projections equal: true | sound |
| §0.1 | y²=x³−x | v₃(64)=0: ℤ₃-model, local-at-3 true; v₂(Δ)=6, additive, T₃ inertia ≠1: Witt-at-2 false; everywhere false | sound, matches LMFDB |
| §0.1 | Spec F, F≠ℚ number field, p ramified in F | F⊗K≇Kⁿ, no finite étale W(F̄ₚ)-algebra: false; degree-0 conclusion vacuous | consistent |
| §0.1 | p=0,1 | excluded by `Fact p.Prime` | sound |
| §0.2 | ℙ¹, q=2 | F_geom on H²: 2; dual 1/2; (C(i)⊗H²)^G dim 1 iff i=1 ↔ H¹(Ω¹) | sign conventions agree with PadicHodgeTheory §8.1 ("weight −a has multiplicity dim Hⁱ⁻ᵃΩᵃ") |
| §1.1 | E=ℚₚ | b=pℤₚ, A=𝔽ₚ, Fil¹=image of pℤₚ=0 | sound |
| §1.1 sign | p=3,r=1,π²=−3 | φ₁[π]=[π³/(−3)]=[π]; +3 gives [−π]; 2π∉b since v=1/2 | sound |
| §1.1 length | K̄, values 1/n, n≥3 | each ≤1/2, unique minimum in a combination: infinite k-dimension | sound |
| §1.2 column convention | weights (0,1), rows (1,1),(0,1) | (1,θ): 1=1, θ³+3θ+3=0, v(θ)=1/3; transposed needs 1=1+θ | sound |
| §1.2 lifts | λ̂=(1+π)²=−2+2π | v(λ̂−1)=v(2π)=1/2 not >1/2; image 1−π; φ₀[1+π]=[−8]=1≠1+π | negative control sound |
| §1.2 generation | M=𝔽₃, φ=0 | J has 3 elements, x³=0 has 1 | hypothesis needed, sound |
| §1.3 | e=2 | n>1 ⇒ n=2; π−(−π)=2π, v=1/2 | strict cutoff needed, sound |
| §1.4 | 0, unit, weight one at p=3 | 0↔0, 3↔3, 3↔3 | sound |
| §1.5 | d=0; weight one | 1=3⁰ with L=K⊆E; E=ℚ₃: 1<3 and L⊄E; E=L: 3=3 | both directions sound |
| §1.6 | p=3,r=1 | threshold 3/2; x²+3 mod 9 ∈ {1,3,4,7} | sound |
| §1.6 unramified step | k=𝔽₃(t)^perf | X²−t: derivative 2α≠0; t not a square (odd exponents) | sound |
| §1.7 | p=7,r=3; tame quadratic | 3/2; u=1, ι=1/2, v(𝔇)=1/2<3/2 | sound |
| §1.7 route input | c=2.9, e_{L/K}=4 | 1.5(ii): u≤3.15; integrality: u≤3 | **R01** |
| §1.8 | ℤ/9(1) | e=6, d=9, v=3/2 = bound | excluded, sound |
| §2.1 | ℤ/49 trivial; 𝔽₇(4) | 3⁴=81≡4 ∉ {1,3,2,6} | sound |
| §2.2 | C₇⋊C₆ | ρ(t)ρ(w)ρ(t)⁻¹=((1,6),(0,1))=ρ(w)⁶; invariants 0; order 3,2,1,0: (1,1,1,2); reverse: (0,0,0,1) | sound |
| §2.2 | ℤ/25, χ=ρ=6 | 6ᵏ=1,6,11,16; (6−16)u=0 ⇔ 5∣u: 5 elements | sound |
| §2.2 | S₃ on ℚ³ | step₀(0)=ℚ(1,1,1); (12)e₁=e₂ | sound |
| §2.3 | χ≡8 mod 49 | 8⁶≡43, a=6, matrix order 7 | sound |
| §2.4 | n′=7n″ | 6·7·6=252≤287<294 | sound |
| §2.4 | tame F′, tame F | 7^{35/36}=6.6317, 7^{142/143}=6.9054 (<6.93, base row (b) line 631); 7^{193/194}=6.9301>6.93 | sound |
| §2.4 | tame scalars | 3ᵏ mod 7 = 1,3,2,6; 3 has order 6 mod 7 | sound |
| §2.5 | a=1,2,3 | 41+6a=47,53,59; 7^{47/42}=8.8248, 7^{53/42}=11.6529 (<12, base line 587: degree≥36 ⇒ rd>12), 7^{59/42}=15.3873 (>12) | exception exactly (0,3), sound |
| §2.5 unramified | degree 42 | exponent 35, 7^{5/6}=5.0611<5.72, base row (f) degree≤8 | sound |
| §2.5 conjugation | θ₀(t)=3 | 3,2 versus 5,4 | sound |
| §2.6 | ℤ/49(1); 𝔽₇(1)⊕𝔽₇(2) | g₁U=U (49); 7·7=49 | sound |
| §2.7 | ℤ/49(i) | 3ᵃ−3ᵇ units; ord₄₉(3)=42 | sound |
| §2.7, §2.8 | nonsplit χ³-by-1; ℚ₇(1)⊕ℚ₇(2) | (0,1,1,1,2); (0,0,1,2,2) | sound |
| §3.1 | ℙ¹, q=2 | m=2i ⇒ i=1; 2^{−1/2}, 2^{−3/2} ∉ {1,1/2,1/4,1/8} | sound |
| §3.2 | ℙ², ℙ¹, ∅, Spec ℚ, two points | 8 off-diagonal pairs zero; h¹¹=1 excluded by i≠j; (0,0) diagonal | sound |
| §4.1, §4.2 | K3, abelian surface, ∅ | h²⁰=1 vs 0; h¹(O)=2; ∅ fails integrality | sound |
| §4.3 | ℙⁿ | i>n ⇒ Ωⁱ=0; n=2: h²²=1 at total degree 4 | sound |
| Conventions | χ₇(F_geom)=q⁻¹; tate_piece | DWP line 2321 example: ℚ_ℓ(1) scalar q⁻¹, weight −2; `tate_piece (−1)` nonzero at index 1 | agree |

**Library declarations opened at the pins** (file:line). Mathlib: `NumberField.finrank_eq_one_of_unramified` `NumberTheory/NumberField/ExistsRamified.lean:50`; `Algebra.unramified_iff_forall` `RingTheory/Unramified/Locus.lean:137`; `IsAdicComplete.henselianRing` `RingTheory/Henselian.lean:170`; `StandardEtalePresentation` `RingTheory/Etale/StandardEtale.lean:261`; `Ideal.sum_ramification_inertia_eq_finrank` `RingTheory/RamificationInertia/Basic.lean:72` (finite flat over a domain, as the README says); `isStableUnderBaseChange` for `IsProper` `AlgebraicGeometry/Morphisms/Proper.lean:71` and for `Smooth` `Morphisms/Smooth.lean:112`; `Representation` `RepresentationTheory/Basic.lean:48`; `invariants`/`mem_invariants` `RepresentationTheory/Invariants.lean:73,80`; `Submodule.comap` `Algebra/Module/Submodule/Map.lean:171`; `Module.finrank` `LinearAlgebra/Dimension/Finrank.lean:61`; `rootDiscr`/`rootDiscr_rat` `NumberTheory/NumberField/Discriminant/Basic.lean:77,83`; `WittVector.isDiscreteValuationRing` `DiscreteValuationRing.lean:148`, `isAdicCompleteIdealSpanP` `Complete.lean:116`, `p_nonzero` `Identities.lean:88`; `FractionRing` `Localization/FractionRing.lean:729`; `Scheme.Over` `AlgebraicGeometry/Over.lean:36`. Tau Ceti: `SheafOfModules.exteriorPower` `Algebra/Category/ModuleCat/Sheaf/ExteriorPower/Basic.lean:60`; `Scheme.relativeDifferentials` `AlgebraicGeometry/Modules/Differentials/Basic.lean`; `Scheme.Modules.Cohomology` `AlgebraicGeometry/Cohomology/Basic.lean:61`; `cohomologyBaseModule` `Cohomology/Module/Base.lean:45`; `Representation.invariants_ne_bot_of_isPGroup` `RepresentationTheory/Unipotent/PowerOrder.lean:158` (section variables `[Field k] [ExpChar k p] [FiniteDimensional k V] [Nontrivial V]`, as the README states); `TauCeti.Hodge.tate_piece` `Geometry/Hodge/Tate/Basic.lean:111`. The `WittVector` structure itself is in `RingTheory/WittVector/Defs.lean:52`, not `Basic.lean` as README line 35 says; `Basic.lean` carries its ring structure, so the citation is usable and not a finding.

**Cross-roadmap citations resolved** (every one, at the named head). SmallRamificationAndAbelianVarietyBaseCases #970: §1.1 line 280, §1.7 line 519 with "degree at least 36 implies root discriminant greater than 12" at line 587, §1.9 table lines 631/633/635 rows (b) rd<6.93⇒n≤10, (d) rd<19.02⇒n≤287, (f) rd≤5.72⇒n≤8. FiniteFlatGroupsAndIntegralPadicHodgeTheory #879: R07.3.4 (4845), 3.5 (4893), 3.6 (4921), 3.7 (4963, contravariant U_S), 3.8 (4988), 3.9 (5021, weight dictionary HT(χ)=+1), 3.10–3.12 (5048–5114, subquotient closure on [0,p−2]), 3.13–3.17 (5142–5282, lattice correspondence T/pⁿT=U_S(M/pⁿM)), R07.6.2 (8342: u, i, v(𝒟)=u−i, G^(u)=G^{u−1}, on PadicPeriodRings §0.3), R07.6.3 (8389: Pₘ, (i) and (ii)), R07.6.4 (8423), R07.6.5 (8477). PadicPeriodRings #940 §0.3 line 74 (arbitrary perfect residue field). PadicHodgeTheory #1062: §0.1 (121), §0.4 (199), §3.2 (666), §3.3 (683), §3.4 (706), §3.5 (733, completed-unramified detection), §8.1 (1379, finite K/ℚₚ only, so the Witt gap is needed and not already provided). ArithmeticGaloisRepresentations #856: §1.1 (707), §1.2 (805), §1.3 (920), §1.6 (1049), §1.9 (1172), §2.2 (1685, unramifiedness equals that of the finite kernel field). DeligneWeightsAndPurity #929: §0.8 (711), §0.9 (721), §7.15 (2309, proper smooth, not projective). CrystallineCohomology #857 §CR.3.5 (3209) contains at lines 3438–3441 "H^q(ℙⁿ_A,Ω^p)=0 unless 0≤p=q≤n, H^p(ℙⁿ_A,Ω^p) free of rank one … which is part of this target". K3SurfacesAndSymplecticBoundedness (rev of #1375): §1.1 (273), §1.2 (302), §1.3 (316), §1.4 (334), §2.4 (457, h²⁰=1). EnriquesSurfacesAndIntegralNonexistence (rev of #1488): §§3.3–3.11 (949–1099), §3.13 (1119). SchemeAndStackFoundations main: §0.9 (848), §0.11 (938), §0.12 (969, `exists_etale_lift` line 1002), §0.14 (1068, `henselian_pair_permanence` 1075 incl. integral extensions and radical-equivalent ideals, `henselian_finiteEtale_equivalence` 1080), §2.6 (3437), §2.20 (4275), §4.8–4.10 (5383–5487). EtaleCohomologyFoundations main: F.2.1 (504), F.2.2 (522), F.3a (776), F.4.0 (850, stable lattices), F.4.1–F.4.6 (959–1089). EllipticCurves main Layer 4 line 793 with the cited title. LocalFieldsRamification (Completed): Layer 2 (576), Layer 3 (724) with θ₀ and the action formula at lines 845–856 and d=e−1 iff tame at 1054.

**Declared gaps.** All eight slugs are in `design/plan.json` with a named supplier and section; the README states each with the same `needs` sentence (lines 59–97). Checked precise and minimal: `witt-proper-smooth-comparison` (PadicHodgeTheory §8.1 is for finite K only); `fl-acris-truncation` (R07.3.6/3.7/3.15 give S and U_S but no explicit A_cris/p presentation); `fl-weight-zero-unramified`, `fl-rank-one-inertia`, `fl-oriented-mod-p-splitting` (R07.3.9 is stated only for simple objects over algebraically closed k); `finite-torsion-kernel-dictionary` (AGR §2.2 gives unramifiedness of the kernel field, not the containment criterion or compositum); `completed-unramified-inertia` (LFR Layer 2 defines the uncompleted K^{ur} only). `pm-remove-inverse-e` is R01.

**Ownership.** `roadmaps grep` for `hasWittGoodReduction`, `lowDegreeHodgeVanishing`, "i+j≤3", "Witt good reduction" and the Fontaine title finds only this roadmap and the Enriques consumer's gap statement; no main roadmap, board package or readable open pull request states the Witt-model predicate or Fontaine's Hodge vanishing. The Lean declares no name of another roadmap.

**Shape.** Five definitions (§§0.1, 1.1, 1.2, 2.1, 2.2) each with an API list and 3–7 Checks; every target has a locator; every layer ends with Examples and Dependencies; no LaTeX, no process words, no pull-request numbers, no `lemma`, no `set_option`; the three source entries are certified in the manifest.

## Not verifiable

- Fontaine 1985 ("Il n'y a pas de variétés abéliennes sur ℤ", Invent. Math. 81), Propositions 1.5 and 1.8, which Fontaine93 §3.8 invokes and R01 turns on: not in the manifest and not fetched; I relied on Fontaine93 lines 400–407 and the supplier's restatement at FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.6.3–R07.6.4.
- PadicHodgeTheoryPartII, which EnriquesSurfacesAndIntegralNonexistence line 99 names as the supplier of its own `gap:fontaine-low-degree-hodge`: it is a merge-order line (179) with no README on main, in the board packages index, or in any open pull request (`roadmaps show` finds none), so whether it would state the same obstruction could not be checked. This roadmap's claim at README line 15 is only that the Enriques contract's content is §§3.3/4.2 here.
- Ownership against open pull requests without files given in the brief was checked only through `roadmaps grep` over their heads.

## Source issues

- **Gap** in Fontaine93 at §3.4, printed p. 9 (line 322): the source chooses lifts of the Frobenius-matrix entries "in O_E" with no congruence condition; the map from exact solutions to Hom_MF(M, A_E) is well defined only for lifts congruent to the Teichmüller lift modulo b_E; it should say lifts along O_E→A_E; affects the proof (Lemma 2), and README §1.2 already imposes the condition with the (1+π)² negative control.
