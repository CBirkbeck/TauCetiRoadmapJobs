# Review of HilbertModularVarietiesAndShimuraCurvesPartII (pull request #1745 at b5ace90)

**Verdict:** accepted

Full review of `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurvesPartII/README.md` and `Suggested.lean` at b5ace90. No P1 or P2 finding. The worker's gate passes at this head (every scanner 0, build OK); the dependency check reports no UPWARD or CYCLE line; the fifteen seeded targets were read against the cached texts at their line locators; the adversarial pass is recorded below with computed values. Two P3 notes are the author's to take or leave.

## R01 (P3) — gap:tame-types re-asks for what its own supplier section already plans

Location: `README.md` line 70 (“supply the tame inertial correspondence τ↦σ(τ) with its Diamond-box constituents …”), also §0.2 *Needs* (line 221).

Claim: the gap's `needs` sentence is minimal.

Witness: the supplier's design `packages/LocalGaloisDeformationRingsPartII/design/README.md` already states `T.0/tame-type` (the characteristic-zero type τ(s,μ+η)) and `T.0/type-jordan-holder` (JH(σ̄(τ)) through the MP.3 weight lattice, 1-deep), and itself requests the compact type σ(τ) from LocalGaloisDeformationRings R08.3. Only the irreducible-cosocle lattices σ_J°(τ), their capped-interval subquotients (EGS15 §5.1, Definition 10.1.4) and the image statement of BHHMS23 Remark 8.2.5 are new asks.

Repair: in the README's contract sentence (line 70) and the §0.2 route, cite `T.0/tame-type` and `T.0/type-jordan-holder` for τ↦σ(τ) and its constituents, and keep the gap text to the lattices, the capped-interval subquotients and the non-Steinberg image clause. The plan's `gaps` list keeps its slug; its wording is fixed after the design, so the trimmed contract lives in the README statement.

## R02 (P3) — duplicated entries in *Needs* and Dependencies lines

Location: `README.md` line 358 (Layer 0 Dependencies lists HilbertModularVarietiesAndShimuraCurves §R18.3.1, §R18.3.3 and §R18.4.21 twice), line 327 (§0.6 *Needs* lists “DeformationAndDerivedPatchingAlgebra §5.6, 8.4–8.5” and then “§8.4” again), line 495 (§1.4 repeats DDPA §8.4 and §5.6), lines 591, 665, 682, 698, 1058, 1074 (“CompletedCohomologyPartII §F.1” twice in one line).

Claim: each *Needs* line lists what the statement and route need, item by item.

Witness: the duplicates above (a reader cannot tell whether the second mention is a different section).

Repair: delete the repeated items; no mathematical change.

## Verified sound

**Gate and build.** `gate.md` at b5ace90: every scanner 0, `build=0`, OK. `lake env lean` on `Suggested.lean` (module-form header, `import Mathlib`, one docstring, empty namespace) exits 0 with no output. No declaration exists, so the `#check` comparison of elaborated signatures with README statements is vacuous; I state that explicitly. The outside-folder diff against `origin/main` is empty.

**Dependency check** (run on the README with `--movable`):

```
depcheck: 204 roadmaps, 1629 edges, 0 problem(s)
```

The roadmap sits at position 331 of the merge order, immediately after LocalGaloisDeformationRingsPartII (330); every supplier cited is earlier (NoncommutativeAndEquivariantIwasawa 25, FiniteFlatGroups 45, DeformationAndDerivedPatchingAlgebra 58, LocalGaloisDeformationRings 71, GlobalGaloisDeformations 72, GL2AutomorphicRepresentationsAndTransfer 85, HilbertModularVarietiesAndShimuraCurves 144, AutomorphicGaloisRepresentations 149, CompletedCohomologyPartII 161, ModpRepresentationsOfGL2OverLocalFields 249, PotentialAutomorphyInfrastructurePartII 259) or on main (PadicMeasuresIwasawaAlgebras; Chebotarev under `Completed/`).

**Cross-roadmap citations resolved (every one, at the head or design named).**
- HilbertModularVarietiesAndShimuraCurves at #1005: §§R18.1.1, R18.1.3, R18.1.4, R18.3.1, R18.3.3, R18.3.6, R18.3.8, R18.3.9, R18.3.14, R18.3.15, R18.4.1, R18.4.2, R18.4.5, R18.4.6, R18.4.8, R18.4.10, R18.4.14–R18.4.16, R18.4.21, R18.4.24, R18.4.25, R18.4.27, R18.4.29 all exist (README lines 1573–4031 of the shown file). R18.3.8 is stated for every totally real field with no parity clause, as the Part II claims; `definiteIhara_injective` is named there. R18.3.15 evaluates `T_v ↦ tr`, `S_v ↦ q_v⁻¹det` at arithmetic Frobenius; R18.4.27 gives `X²−T_vX+q_vS_v` at geometric Frobenius with `det ρ_T = ψε⁻¹`: both match the Part II's adapter (checked numerically below).
- CompletedCohomologyPartII at #1035: §§F.1, 1.1–1.3, 2.4, 3.1–3.2, 3.7, 5.5, 8.3–8.4, 8.8, 8.10, 8.12–8.15 exist; F.1 and 3.1–3.2 are the Pontryagin/Schikhof duality pair with the torsion-free lattice clause, 5.5 is the Iwasawa interface re-exporting NEI §§F.1, 0.10–0.11, 8.8/8.10/8.13–8.15 are the finite derived Hecke images, their inverse limit and residual localisation, as the Part II says.
- NoncommutativeAndEquivariantIwasawa at #1307: §§0.1–0.4, F.1, 0.10, 0.11 exist (grade, coefficient shift, two-sided Auslander condition, global dimension d+1 without p-torsion).
- DeformationAndDerivedPatchingAlgebra at #1034: §§1.6, 1.10–1.12, 3.1–3.4, 3.11–3.12, 5.6, 6.1–6.2, 7.2–7.3, 8.1–8.5 exist; the label R03.3 of the gap is the plan-level name for its Layer 3 (also used by LocalGaloisDeformationRingsPartII's design).
- GlobalGaloisDeformations at #920: §§3.3–3.7, 5.1, 5.7, 5.8 exist; §5.8 gives the Gee-convention count `|T|−1−[F:ℚ]+r`, which with `|T|=|S|` and `r=q` is the `q−[F:ℚ]+|S|−1` of §1.1.
- LocalGaloisDeformationRings at #923: §§1.1, 1.4, 1.10, 1.24, 3.1, 3.4, 3.9, 3.10 exist.
- SmoothRepresentationsOfLocalGroups at #1688 SR.0.1–SR.0.4; FiniteFlatGroupsAndIntegralPadicHodgeTheory at #879 R07.1.26, R07.5.15; AutomorphicGaloisRepresentations at #1007 §§4.2–4.4 (Ramanujan–Petersson, Hecke/Langlands normalisation, compatibility retaining monodromy); GL2AutomorphicRepresentationsAndTransfer at #931 R17.3.1, R17.3.10 (allows d=1, no degree condition); GL2ModularityLifting at #1071 §8.1; PadicMeasuresIwasawaAlgebras on main §§1.1–1.7, 5.2; Chebotarev (Completed) Layer 10 “Dirichlet-density Chebotarev”.
- Board designs (not yet in pull requests, read at `packages/<Name>/design/README.md`): ModpRepresentationsOfGL2OverLocalFields labels MP.3/weight-coordinates, tame-weight-set, diamond-socle, MP.4/gk-dimension, dimension-comparisons, MP.5/finite-weight-hulls, projective-adjoint, first-order-weight-hulls, MP.6/diamond-box, adjoint-tensor, socle-enlargement, MP.7/connected-characters, diamond-connected, local-gk-bound, MP.8/projective-lattice, lattice-coinvariants, projective-truncation, MP.9/relative-projectivity all exist; MP.8/projective-lattice does supply the partial fibre products `L_j` and `L_{f−1}≅R` (its interface item `projectiveLattice.partial`), and MP.7/local-gk-bound has exactly the three hypotheses §5.1 verifies. LocalGaloisDeformationRingsPartII: T.0 “Tame inertial types”, “Weights of a tame type”, T.4/weight-shape-bijection, T.6/single-presentation, single-components, special-fibres, T.7/weight-union, multiple-presentation, exact-q-ideals, p-membership exist; T.6 is stated for semisimple ρ̄ with no fixed determinant, which is why the single-type gap asks for the nonsplit and fixed-determinant forms. PotentialAutomorphyInfrastructurePartII: PL.1/potentially-barsotti-tate-diagonalizable, PL.5/ordinary-lifts-prescribed-local, PL.5/pd-automorphy-lifting exist. LocallyAnalyticDistributionsPartII ND.6 exists (mentioned only in Scope).

**Declared gaps.** The five slugs in `design/plan.json` (`tame-types`, `single-type-rings`, `breuil-mezard-pbt` on LocalGaloisDeformationRingsPartII; `power-series-cancellation` on DeformationAndDerivedPatchingAlgebra R03.3; `quaternionic-component-realization` on PotentialAutomorphyInfrastructurePartII PL.5) match the README's five contract sentences word for word, each with a named supplier and an explicit hypothesis list. No earlier roadmap provides them: `roadmaps grep` finds Breuil–Mézard only over ℚ_p (PadicLocalLanglandsForGL2Qp §5.10, GL2ModularityLifting LL1, CompletedCohomologyAndLocalGlobalCompatibility via Tung) or for ℓ≠p (LocalGaloisDeformationRings §2.27); the weight part of Serre's conjecture only over ℚ (GL2ModularityLifting importing SerreWeightAndLevelOptimisation); Hamann's theorem nowhere (the HeckeStacksAndLocalShtukas hits are the author Linus Hamann); the BDJ recipe nowhere else. R01 is the one minimality remark.

**Ownership against open work.** Gelfand–Kirillov dimension of mod p cohomology (BHHMS23 Theorems 1.1, 1.9, 1.10), the big patched module and its faithful flatness, the inert-prime R=T and the noncommutative miracle flatness are claimed by no other roadmap on main or in the 439 open pull requests (grep for BHHMS, Gelfand–Kirillov, miracle flatness; the latter's other hits are DDPA §3.3's commutative version, which the parent R18.4.30 specialises). The Part II's Scope says where the parent stops and imports MP.3–MP.9 and CompletedCohomologyPartII rather than re-planning them.

**Pinned declarations opened (file and line at the pins).** Mathlib: `OrzechProperty.bijective_of_surjective_endomorphism` RingTheory/OrzechProperty.lean:104; `CommRing.orzechProperty` RingTheory/FiniteType.lean:625; `LinearMap.eqLocus_eq_ker_sub` Algebra/Module/Submodule/EqLocus.lean:102; `Submodule.spanFinrank` Algebra/Module/SpanRank.lean:66 (a `.toNat`, as the README warns); `Module.FaithfullyFlat` RingTheory/Flat/FaithfullyFlat/Basic.lean:63; `Module.annihilator` RingTheory/Ideal/Maps.lean:868; `Module.support` RingTheory/Support.lean; `IsRegularLocalRing` RingTheory/RegularLocalRing/Defs.lean:51; `WittVector` RingTheory/WittVector/Defs.lean:52; `Matrix.GeneralLinearGroup` LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:42; `CategoryTheory.Abelian.Ext` Algebra/Homology/DerivedCategory/Ext/Basic.lean:118. Tau Ceti: `completedGroupAlgebra` Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145; `TauCeti.MonoidAlgebra.dualLinearEquiv` Algebra/MonoidAlgebra/Dual.lean:265 (inside `section FiniteGroup`, a `(MonoidAlgebra R G)ᵐᵒᵖ`-linear equivalence with the coefficient-at-one formula, as the Conventions Check on `g·g⁻¹` records); `Module.Injective.of_finite_projective` Algebra/Module/Injective/SelfInjective.lean:101 with hypothesis `Module.Injective R R`, as the README states. The pin has no uniform pro-p predicate, no grade or canonical dimension and no Shimura-curve cohomology, so the docstring's list of non-statable headlines is accurate.

**Seeded sample (theorem number, page, hypotheses, statement) — all confirmed.**
- 0.1: BHHMS23 §8.1 items (i)–(iv) and standing assumptions, lines 4316–4393 (pp. 86–88): p>5 with p>23 for the main theorem, F unramified at S_p, D split at S_p and at ≤1 real place, (F,D)≠(ℚ,GL₂), r̄|G_{F(ζ_p)} absolutely irreducible, r̄_w generic at S_p, formal smoothness at (S_D∪S_r)∖S_p, ψ the Teichmüller lift of ω det r̄, the two inertial shapes with 12≤r_i≤p−15 (13≤r₀≤p−14 in the irreducible shape), the three w₁ conditions, S and U exactly as restated. EGS15 Definition 2.1.1 line 441; w₁ via DDT Lemma 4.11 at EGS15 lines 1686–1696.
- 0.2: BDJ10 §3.1 line 834 (irreducible recipe), §3.2 lines 1260–1263 (L_α rule) and 1318–1324 (the two exceptional modifications: cyclotomic with b⃗=(ℓ,…,ℓ) and J=S; trivial with J≠S adds L_ur), as restated. EGS15 Definition 2.1.7 and Theorem 2.1.8 lines 527–534; Propositions 3.5.1, 3.5.2 lines 687, 767; Proposition 10.1.11 line 3324; BHHMS23 line 5066 for the uniqueness of τ₀ when r̄_v is semisimple.
- 0.3: BHHMS23 Remark 8.1.3(i)–(iii) lines 4439–4461 (ψ⁻¹ action correcting EGS15, the BDJ maximal ideal `T_w−S_w tr`, `Norm(w)−S_w det`, the quotient curve with unchanged r̄-part), definite S(V,𝔽) and operators at lines 4502–4513; EGS15 §6.2 line 1702.
- 0.6: GK14 Theorem A lines 105–115, Theorem B/Corollary 5.5.4 lines 1605–1611 (p>2, modular, irreducible on G_{F(ζ_p)}, A₅ excluded at p=5, compatible with D), Definitions 5.5.2–5.5.3 lines 1600–1604, Corollary 5.4.5 lines 1573–1580, Lemma 5.2.5 lines 1253–1258, §5.2.6 starred rings lines 1278–1294, Lemma 5.3.6 line 1400, Lemma 5.4.3 line 1475; BHHMS23 (61) line 4356.
- 1.1: BHHMS23 (62)–(63) lines 4406–4438: τ_w weight-isolating, R∞=R^loc⟦X₁..X_{q−[F:ℚ]+|S|−1}⟧, the three factor shapes, the duality `R^{(0,−1),τ_w,ψ_w} ≅ R^{(1,0),τ_w^∨,ψ_w^{−1}}`, and `R∞ ≅ W(𝔽)⟦X₁..X_{4|S|+q−1+2f}⟧`; Lemma 8.1.2 line 4405 with HAM75 Theorem 4 line 101 (p. 155); S∞ with 4|S|+q−1 variables line 5221.
- 2.2: BHHMS23 Lemma 8.2.1 lines 4566–4571 (A any commutative ring, r≥1, hypotheses (i)–(iii)), STACKS 05G8 line 1544.
- 2.5: GN22 §A.20 line 2171 (equality only for M finite over both), Lemma A.28 line 2230 (arbitrary B-module), Corollary A.29 line 2235.
- 2.6: GN22 Proposition A.30 lines 2242–2245 (K uniform, M finitely generated Cohen–Macaulay, flat over O⟦x⟧ iff `j_A(M)=j_Ω(M/(ϖ,x)M)`); purity step lines 2266–2272 and the ideal-separated flatness criterion lines 2285–2289, as the route restates.
- 3.1: BHHMS23 Lemma 8.2.2 lines 4591–4600 (smooth, finite length; maximal CM over the scheme-theoretic support; extension-closure via Ext(𝔽,−)).
- 4.5: BHHMS23 Theorem 8.3.4 lines 4921–4926.
- 4.8: BHHMS23 Theorem 8.3.9 lines 5070–5078 and proof lines 5080–5144; see Source issues for the support ring.
- 4.9: BHHMS23 Corollary 8.3.10, Theorem 8.3.11, Remark 8.3.12 lines 5145–5159.
- 5.2: BHHMS23 Theorem 8.4.2 lines 5246–5253 (D̃_σ as the largest subrepresentation of (Inj σ)[𝔪²] with σ once and no other weight of W; projectivity over S∞⟦K⟧_Z with the centre acting by ψ|I).
- 5.3: BHHMS23 Theorem 8.4.3 lines 5283–5291 (Cor A.29 then Cor A.30 with 2f on both sides).
- 5.6: BHHMS23 §8.5 lines 5409–5436 (p inert, ψ⁻¹-isotypic parts, T̂ as an inverse limit of localised finite-level algebras, Ĥ¹ with the `⊗_T T_{r̄}` localisation, R^ψ with ψ=ε det); GN22 Proposition 4.3.1 line 1408.

Also opened: BHHMS23 (64)–(68) lines 4462–4549, Prop 8.2.3 proof lines 4613–4640, Cor 8.2.4 lines 4662–4690, Rk 8.2.5 line 4706, Prop 8.2.6 and proof lines 4716–4748, Lemmas 8.3.1, 8.3.2, 8.3.5, 8.3.6 (lines 4753, 4814, 4978, 4987), Prop 8.3.3 line 4843, Prop 8.3.7 proof lines 5034–5053, Thm 8.4.1 proof lines 5173–5243 ((80)–(81)), Cor 8.4.4 lines 5292–5299, Cor 8.4.6 lines 5311–5329 and (83) line 5345, Cor 8.5.1 lines 5447–5459, Prop 4.3.3 lines 1918–1945 with a₂ at line 2098, Prop 2.4.2 line 716, Lemma 6.4.3 line 3673, Theorem 6.4.7 lines 3818–3823; EGS15 Definition 6.1.3 lines 1584–1606, Lemma 6.1.4 line 1625, Theorem 7.2.1 lines 2197–2226, §10.1 lines 3212–3290 (Lemmas 10.1.6 and 10.1.8 with their ideal descriptions, Example 10.1.3(3) line 3236); GN22 Definition A.2 line 1955, Proposition A.4 line 1985, Lemma A.7 line 2014, Lemma A.8 line 2031, Proposition A.13 line 2087, Lemma A.15 line 2104, Lemma A.16 line 2122; DL21 Theorem 6.2 line 3111 and the patched modules at lines 3164–3167, 3200–3228; LE19 Lemma 4.5 line 779; LMS22 Lemma 4.5 line 631; CEGGPS16 Proposition 2.13 proof line 1369, Lemma 4.17 line 2533; BRE14 Lemme 9.2 line 2754.

**Adversarial table (statement, instances, values on each side, result).**

| Statement | Instances | Values | Result |
|---|---|---|---|
| §0.1 box forces p≥29 | 12≤p−15; p=23, 27, 29 | p−15 = 8, 12, 14; 8<12 excludes 23; 27 not prime | holds; Check 2 correct |
| §0.1 Check 1 boxes at p=29, f=1 | shapes (a),(b) | (a) 12≤r₀≤14 → {12,13,14}; (b) 13≤r₀≤15 → {13,14,15} | holds |
| §0.2 reducible recipe, f=1 | p=5, ρ\|I=ω²⊕1 (s=1) | t≡0: s+1=2 → Sym¹; t≡2, s+1≡2 mod 4 → det²Sym¹; p−3−s=1 | 2 weights, matches Check 1 |
| §0.2 boundary s=p−3 | p=5, ρ\|I=ω³⊕1 | exponents mod 4: t=0,s=2 → Sym²; t=3,s∈{0,4} → det³, det³Sym⁴ | 3 weights, matches Check 6; two-weight formula fails only at the boundary |
| §0.2 irreducible recipe | p=5, s=1 | Sym¹ (dim 2), det¹Sym³ (dim 4) | matches Check 2 |
| §0.2 dual input for GK14 Hodge type | p=29, ρ=ω⊕1, ω(g)=2 | det of a Hodge-type-0 lift reduces to ω⁻¹: 2⁻¹=15 ≠ det ρ(g)=2; ρ^∨ has ε⁻¹⊕1 | the dual is forced; Check 11 correct |
| §0.3 / Conventions Hecke polynomial | q=5, geometric eigenvalues 2,3 in 𝔽₂₉ | r̄⊗ω arithmetic eigenvalues 5·15=17, 5·10=21; T=38≡9; S=6·(17·21≡9)=54≡25; S⁻¹=7; S⁻¹T=63≡5; qS⁻¹=35≡6; X²−5X+6=(X−2)(X−3) | BDJ ideal = parent's ideal for r̄⊗ω; arithmetic without inversion would give roots 15,10 |
| §0.3 Check 4 wrong input | r̄^∨⊗ω⁻¹, same data | geometric eigenvalues 5·15=17, 5·10=21; arithmetic 17⁻¹=12, 21⁻¹=18; T=30≡1; S=6·(216≡13)=78≡20 | (1,20)≠(9,25): the wrong Galois input fails, as the Check says |
| §5.6 R→T̂ map | same data | S⁻¹T=5=2+3, qS⁻¹=6=2·3 | geometric trace/determinant consistent with §0.3 |
| R18.4.27 adapter: dual then ⊗ε⁻¹ | eigenvalues α,β, poly X²−TX+qS | new eigenvalues q/α, q/β: sum qT/(qS)=S⁻¹T, product q²/(qS)=qS⁻¹ | displayed transformation correct |
| §0.4 C₃ duality pairing | basis (1,g,g²) | coefficient-at-1 of xy: matrix ((1,0,0),(0,0,1),(0,1,0)), det −1 | unit, matches Check 3 |
| §0.4 projective vs free | G=C₂ over 𝔽₂₉; G=S₃; G=C₂₉ | trivial summand dim 1 vs free dims 2k; 1 vs 6; regular module dim 29 | Checks 1–2 correct |
| §0.5 Check 2 dual inertia | p=29, f=1, ω has order 28 | ω¹⁵⊕1 dual = ω⁻¹⁵⊕1 = ω¹³⊕1 → {Sym¹², det¹³Sym¹⁴}; ω¹³⊕1 dual = ω¹⁵⊕1 → {Sym¹⁴, det¹⁵Sym¹²} | both lists correct |
| §0.2 Check 7 type dimensions | p=29 | 13+15=28=q−1 (cuspidal); principal series q+1=30; scalar 1 | τ₀ is cuspidal and unique; correct |
| §0.7 Gram determinant | q=2, ratio 3 (3⁻¹=10) and ratio 2 in 𝔽₂₉ | (2−3)(2−10)=(−1)(−8)=8≠0; (2−2)=0 | unit exactly when the ratio avoids q^{±1}; q⁻¹=15 |
| §0.7 Check 4 tame quadratic χ | q=3 | χ(inertia generator)=−1≡28≠1 in 𝔽₂₉ | excluded from the r̄-part; correct |
| §1.1 variable counts | f=1,\|S\|=2,q=1; f=2,\|S\|=1,q=2 | 4·2+1−1+2=10 vs S∞ 8 (dims 11, 9); 9=(3+6)+(0+2−2) vs S∞ 5 (dims 10, 6) | difference 2f in both; Checks 1–2 correct |
| §1.1 Check 3 type rings | two-weight vs one-weight, f=1 | O⟦x,y,z₁,z₂,z₃⟧/(xy−p): dim 5, special fibre dim 4, cotangent 5; O⟦t₁..t₄⟧: 5, 4, 4 | EGS15 7.2.1(2) shape; Check correct |
| §1.2 type-quotient dimension | general; f=1,\|S\|=2,q=1 | 1+(3+f)+4(\|S\|−1)+q−f = 4\|S\|+q; 1+4+4+0=9=dim S∞ | holds |
| §1.2 twisted determinant weights | ω(g)=2, p=29 | ε³ψ⁻¹ vs εψ⁻¹ residually differ by 2²=4; r̄^∨(1) has determinant ×4 | consistent only in the twisted residual problem; Check 5 correct |
| §1.3 central character | p=29, ω(g)=2, det r̄_v^∨(g)=1 | required (ω⁻¹det)(g)=15; EGS15's (ω det)(g)=2 | BHHMS23 line 4410 agrees with the README |
| §2.2 freeness criterion | A=𝔽₂[ε]/ε², N=(ε), r=1 | Ann N=(ε), Ann(M/N)=(ε), Ann M=0, (ε)≅𝔽₂=A/(ε); M=A free rank 1; M=𝔽₂² needs 2 generators | hypotheses (i)–(iii) sharp; proof needs no Noetherian hypothesis (Orzech) |
| §2.2 | A=ℤ/4, M=A, N=2A | Ann(M/N)/Ann M = 2A ≅ ℤ/2 = A/Ann N; 1 generator | holds |
| §2.3 fibre products | A=k⟦x,y⟧/(xy), M₁=A/(x), M₂=A/(y), M=k; A=k⟦t⟧, M₁=M₂=A, M=k | (x)+(y)=(x,y)=Ann k, pullback ≅ A, Ann=(x)∩(y)=0; 0+0≠(t), pullback ≅ A² rank 2 | (ii)⇔(i) in both directions |
| §2.1 grades | K=ℤ_p, Λ=O⟦T⟧ | Λ: j=0, δ=2; Λ/ϖ: j=1, δ=1; O=Λ/(T): j=1, δ=1=depth; Λ⊕Λ/ϖ: Ext⁰,Ext¹≠0 | CM equivalences as stated |
| §2.4 (1) | A=O⟦T,x⟧, M=A/(x); M=A | j_A=1, j_{A/x}=0, δ both 2 (x kills M); M=A x-torsion free: δ 3→2, j 0→0 | both clauses of Lemma A.15 |
| §2.4 coefficient uniformiser | O=ℤ₃[π]/(π²−3) | O/(π)=𝔽₃; O/(3)=𝔽₃[π]/π² nonreduced | ϖ=π, not p; Check correct |
| §2.5 depth inequality | A=O⟦T⟧, B=O⟦T,y⟧, M=B; M=B/(y) | depth_A B=2 (Ext²_A(k,B)=k⊗B≠0), depth_B B=3; both 2 for B/(y)≅A | strict inequality possible when M not finite over A |
| §2.6 miracle flatness | A=O⟦T,x⟧, M=A/(T); M=A/(ϖ) | j_A=1, j_Ω(k)=1 over Ω=k⟦T⟧, flat over O⟦x⟧; j_A=1, j_Ω(Ω)=0, ϖ kills M | both directions of the iff |
| §3.3 Check 2 | p=29, twist by det²⁸, z=30 | 30⁵⁶=(1+29)⁵⁶ ≡ 1+56·29 = 1+1624 ≡ 784 mod 841 ≠ 1=ψ⁻¹(30) | outside the coefficient category; correct |
| §4.1 ranks | f=1, f=2 | rank L_j=(1+3(j+1))dim P: d, 4d; d, 4d, 7d; (3f+1)d at the endpoint | matches MP.8 `rational_rank` |
| §4.1 Checks 7–8 lattice model | R=O⁴→T=O³, R′=Oe₁+pO³ | Y=T′/pT dim 1, T′/pT′ dim 3; N=L×_Y T′ rank 4 with ker(N→L)=pT; L×_{R′/pR}R′ rank 5 | exact sequence 0→T→N→L→0 reproduced |
| §4.8 p-membership numbers | p=29, r_j=12, positive sign, d*₂₁=1 | a₂≡r_j+2=14; 2/a₂=1/7, 7⁻¹=25 (7·25=175=6·29+1); chart unit (12·15)/(14·13)=180/182 ≡ 6·8⁻¹=6·11=66≡8 | unit factor and chart unit as the Check states |
| §4.8 support profiles | f=2, j=1 | profiles ((1,0),(1,0)), ((2,−1),(1,0)), ((1,0),(2,−1)); rank (1+3+3)d=7d; double adjoint would add 9d | the printed BHHMS support (2² profiles) overstates; see Source issues |
| §5.1 grades | f=1; f=2 | 2≥3−dim π and ≤1 → 1; 4≥6−dim π and ≤2 → 2 | equality forced |
| §5.3 / §5.4 | Frac(O) over O; compact torsion 𝔽 | Frac(O)⊗k=0 (flat, not faithfully flat); Hom_O(𝔽,E)=0 while Hom_O(𝔽,E/O)=𝔽 | faithful flatness and torsion-freeness are both needed |
| Conventions Hom differential | C⁻¹=C⁰=O, d=p | d(f)=−(−1)⁰f∘p: basis 1 ↦ −p; cokernel O/p either way | sign pinned, as the Check says |
| §1.6 Check 5 multiplicities | r=2, indefinite | π in Ĉ with multiplicity 2, in H¹_{r̄}=r̄⊗π with 4; C vs Ĥ¹-dual would equate 2=4 | the Ĉ^{⊕2} reading is forced (DL21 lines 3164–3167) |

**Degenerate and junk cases.** f=0 is excluded by f=[F_v:ℚ_p]≥1 (Conventions); S=∅ impossible since S⊇S_p; |S|=1 only with S={v} (§1.1 Check 5, q=f gives no extra variable); r=0 excluded in §§2.2–2.3 (zero module has every rank); the zero functor satisfies §1.3's axioms and fails minimality, as the Check records; zero modules have grade ∞ and dimension −∞ by the Conventions, and the CM condition excludes zero; p=2 is excluded globally (p>23) and the general algebra of Layer 2 is stated for every complete DVR O over ℤ_p including p=2 (Check in §2.4 with O=ℤ₂). Non-normal V_w at w∈S_p∖{v}: BHHMS23 Corollary 8.4.6 assumes only V_w⊆1+pM₂; the README's §0.5 states the filtration for normal V_w and §5.5 reaches the general case through the normal core and the tower representation, with the explicit non-normal example 1+pE₁₂ conjugated by 1+pE₂₁ computed correctly modulo p³.

**Conventions.** Geometric Frobenius, ε(Frob_w)=q_w⁻¹, HT(ε)=+1, ω₁=ω, W(ρ)=D_EGS(ρ^∨), ψ⁻¹ on the adelic centre, π with central character ψ⁻¹ and M∞ with ψ, W(r̄_v^∨) throughout: each is pinned by a computed Check and recomputed in §§0.3, 0.5, 1.2, 1.3, 5.6 above; BHHMS23 lines 4362, 4410, 4444, 4529 confirm them.

**Suggested.lean.** Form: `module`, `import Mathlib`, one module docstring naming the roadmap, stating that it states headline theorems against the pins and listing the non-statable ones with the missing carrier; namespace; no declaration, no `set_option`, no sorry'd data. Headline list (README §§4.8, 4.9, 5.1–5.5, 5.7, with §§0.6, 1.4, 1.6, 2.5–2.6, 3.2–3.4 as the deep intermediate results): none is statable at the pins, since the pins carry neither quaternionic Shimura-curve cohomology, Serre weights of GL₂(k) with the BDJ set, tame types, patched modules, uniform pro-p groups nor grade/canonical dimension (checked by grep of the pinned Tau Ceti). §§2.2–2.3 are elementary commutative-algebra lemmas, not headlines, and are rightly left in the README. No padding to probe.

## Not verifiable

- EGS15 §6.3 (6.1) at line 1799, §6.4 at line 1802 and §6.2 p. 35 at line 1753, EGS15 Lemma 4.1.1 at line 784, BHHMS23 §1.3.2 (5)–(6) at line 288: cited for §§1.4, 1.5, 4.4, 4.9; the surrounding statements were confirmed (Definition 6.1.3, Lemma 6.1.4, (68)), the exact lines were not opened. Nothing in the sample depends on them.
- GN22 Lemmas A.21–A.27 (§A.20) and Lemmas A.17–A.19: only Lemma A.28, Corollary A.29, Proposition A.30, Lemmas A.15–A.16 and §A.14's setup were read; the dependence chain is as the README's route describes.
- GK14 Lemma 5.4.3(4) and Proposition 5.4.4 (multiplicity comparison): Lemma 5.4.3(1)–(2) and Corollary 5.4.5 were read; items (3)–(4) were not.
- LocalGaloisDeformationRings R08.3's compact type σ(τ) (requested by LocalGaloisDeformationRingsPartII's design): not located in the #923 head; it bears only on R01's minimality remark.

## Source issues

- **Error** in BHHMS23 at Theorem 8.3.9 and Corollary 8.3.10, printed pp. 101 and 103: the source says `M∞(L_j)` is free over `R∞/∩p_{λ,τ}` with λ running over all profiles with entries in {(1,0),(2,−1)} up to index j; it should be the profiles with at most one (2,−1) entry, which is what its own annihilator computation (p. 103, after (79)) and Theorem 1.8 use; affects a stated result (the named support ring; the rank and fibre statements survive).
- **Misprint** in BHHMS23 at proof of Proposition 8.3.7, printed p. 100: the source says `dim Hom_K(σ_v, π) = f` by Proposition 8.2.3; it should be `= r`; affects nothing.
- **Misprint** in BHHMS23 at proof of Theorem 8.3.9, printed p. 102: the source says the bijection ι is indexed by types with `σ_v ⊗ (N_{k/𝔽_p}∘det)` in `JH(σ(τ))`; it should be `det⁻¹`, as in the reindexing two lines earlier and the defining index set; affects nothing.
- **Gap** in BHHMS23 at proof of Proposition 8.3.7, printed p. 101: the source says `π^{K₁} = D₀(r̄_v^∨)^{⊕r}` by the proof of Proposition 8.2.6; that proof gives only an embedding `π^{K₁} ↪ D₀^{⊕r}` (p. 94); it should add the reverse embedding (socle embedding plus Breuil's Lemme 9.2 extension, as README §3.4 does); affects the proof.
- **Error** in BHHMS23 at the display after (84), printed p. 108: the source says `M∞ ⊗_{S∞} W(𝔽)` is the W(𝔽)-dual of `Ĥ¹(V^v)^{ψ⁻¹}_{r̄}` in the indefinite case; it should be the dual of the completed Galois multiplicity module (the patched objects of DL21 §6.2 are duals of `Hom_{T[G_F]}(ρ, H¹)`), with `Ĥ¹ ≅ Ĉ^{⊕2}` after a basis choice; affects the proof of Corollary 8.5.1 (its conclusions survive since faithful flatness passes to `C^{⊕2}`).
