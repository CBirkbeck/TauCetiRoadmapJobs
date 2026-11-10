# Review of EllipticModularityEffectiveComparisons (pull request #1810 at c90f56d)

**Verdict:** rejected

This is a full review of the folder at c90f56d. The previous review read the same head, so nothing in the folder changed. The gate passes on a hand run, the dependency check reports 0 problems, and `Suggested.lean` elaborates with exactly 17 `sorry` warnings and nothing else. All 15 seeded sample targets agree with their sources, and every computed row of the adversarial pass holds.

The one finding is R01, carried over from the previous report. The overlap with EllipticCurveModularityPartII has grown since that report, because the sibling has moved from 504db2f to 9d8c599. No edit inside this folder can repair it, so the verdict stays `rejected`.

## R01 (P1) — Re-plans EllipticCurveModularityPartII, an open roadmap earlier in the merge order

Re-raised: H01 (GATE-EllipticModularityEffectiveComparisons~14).

**Location.** `TauCetiRoadmap/EllipticModularityEffectiveComparisons/README.md`, Layers 0–5 (lines 134–1703), and `Suggested.lean` lines 53–302. README line 1707 concedes the overlap: "cites EllipticCurveModularityPartII, which plans the same results under its own layer numbering, as their supplier."

**Claim.** Every layer here, and 13 of the 17 Lean headlines, has a counterpart in EllipticCurveModularityPartII. That roadmap is open at 9d8c599 and was re-read this round. Its latest commit widened the overlap.

- **Identical carriers.** Six of this folder's declarations now exist there with the same names and bodies; they differ only in docstrings (checked with `diff`):
  - `localTerms`, `martinValue` and `newDimension` (lines 53–79 here, 71–97 there);
  - `GeometricTorsion`, `torsionModule` and `torsionRepresentation` (lines 153–183 here, 132–155 there).
  - Two more differ only in name: `GeometricallyNonCM` and `CyclicIsogenyDegree` here are `NonCM` and `HasCyclicIsogeny` there (lines 233 and 241).
- **Theorem pairs** (here → there, line there):
  - `martin_dimension_formula` → `dimension_comparison` (101)
  - `martin_sharp_bound` → `martin_bound` (106)
  - `newform_integral_of_small_primes` → `rationality_of_small_prime_coefficients` (195)
  - `integral_ideal_sturm` → `integral_sturm_congruence` (221)
  - `prime_cyclic_isogeny_degrees` → `prime_isogeny_degrees` (248)
  - `non_cm_prime_isogeny_degrees` → `noncm_prime_isogeny_degrees` (254)
  - `rational_cyclic_isogeny_degrees` → `cyclic_isogeny_degrees` (260)
  - `full_two_uniform_irreducibility` → `full_two_irreducible` (274)
  - `rational_two_uniform_irreducibility` → `rational_two_irreducible` (281)
  - `isogeny_j_tables_11_17_37` → `rational_isogeny_j_tables` (307)
  - `proper_image_nonsplit` → `nonsplit_of_not_surjective` (326)
  - `cyclic_isogeny_integral_j` → `lemos_integral_j` (334)
  - `lemos_uniform_surjectivity` → `lemos_surjectivity` (343)
- **The other four headlines** are README targets there:
  - `kraus_prime_power_congruence` and `four_divisible_isogeny_realization`: its §§4.2–4.6;
  - `exceptional_prime_isogeny_j`: its §5.0a;
  - `split_normalizer_exclusion`: its §6.0f.
- **Kraus thresholds.** The sibling now defines `sharpF`, `sharpG` and `sharpH`, which are krausF, krausG and krausH of §§2.1–2.3 here.
- **Two declared gaps ask other suppliers for what the sibling owns.**
  - `gap:modular-rank-zero` asks EulerSystemsAndKolyvaginSystems for the theorem the sibling's §6.0e ("Unconditional rank zero for modular abelian factors", its README line 778) owns.
  - `gap:quantitative-abelian-periods` asks ArakelovGeometryAndAbelianHeights for the Gaudron–Rémond period estimates that the sibling's scope paragraph (README line 13) assigns to its §6.0f.
- **Consumers bind to the sibling.** EllipticCurveModularityPartII is cited by 16 open roadmaps other than itself and this folder; ErdosProgressionPowers alone cites it 18 times. Others include EllipticCurvePeriodsAndModularParametrizations, AdelicImagesAndModularCurves, FaltingsFinitenessAndIsogenyTheoremsPartII, RankOneConverse and KatoEulerSystems. This folder is named only in three consumer lists:
  - ModularSymbolsPadicLFunctions, README line 2695;
  - FaltingsFinitenessAndIsogenyTheorems, README line 2928;
  - ImaginaryQuadraticClassNumber, README line 205.

**Witness.** Sibling README line 7: "this Part II owns the six comparison layers below". Merge order: sibling on line 275, this folder on line 285. Sibling `Suggested.lean` lines 71–97 and 132–155 are identical to lines 53–79 and 153–183 here.

**Why the settled reason fails.** GATE~14 answers H01 with "The finding is not disputed" and names closing one of the two pull requests as the human decision. That concedes the finding and gives no reason why it is wrong. What another roadmap plans is imported, never planned again, and the owner of an object two open roadmaps both claim is the one earlier in the merge order. The finding stands until a human decides.

**Repair.** None inside this folder. A human chooses one of these two options:

1. **Close #1810.** First move into the sibling the content that exists only here:
   - the §5.1 point counts of `Y₀(r)(ℚ)` and the j-values −96³, −960³, −5280³, −640320³;
   - the finer decompositions of Martin's bound (§§0.3–0.15), of Mazur's theorem (§§4.1–4.6), of Kenku's levels (§§4.8–4.16) and of the split-Cartan chain (§§5.3b–5.7, including the generalized-Jacobian route of §5.4a);
   - the witness bound of §5.25a.

   Then drop this folder's name from the three consumer lists above.
2. **Close the sibling and keep this folder.**
   - Re-point the sibling's 16 citing roadmaps to the counterparts listed at README line 1707.
   - Give owners here to what only the sibling has: its §1.8 majorants, its §6.0e rank-zero theorem (which then replaces `gap:modular-rank-zero`), the §6.0f minimal period subvariety and period estimates, `norm_bound`, the deletion-level realizations, and `FullRationalTwo`/`RationalTwo`.
   - Rebase onto main's Tau Ceti pin and state the removed-prime bound, as GATE~14 prepared it (see the remark on the pins below).

**Tested on the instance.**
- The two prime-degree lists are the same `Finset` {2,3,5,7,11,13,17,19,37,43,67,163} under identical hypotheses.
- The two non-CM lists are both {2,3,5,7,11,13,17,37}.
- The two j-table statements have the same seven right-hand values.
- `diff` of the carrier bodies shows no change outside docstrings.

## Previous findings

- R01 (previous report) is not repaired. README line 1707 still says EllipticCurveModularityPartII "plans the same results under its own layer numbering". The sibling has since moved to 9d8c599, which adds identical `localTerms`/`martinValue`/`newDimension` and defines `sharpF`/`sharpG`/`sharpH`. Raised again above.

## Verified sound

**Gate, dependency check, Lean.**

- Hand run of the gate at c90f56d; every check is 0, and the worker's `gate.md` agrees and adds `build=0`:

      gate EllipticModularityEffectiveComparisons: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

- Dependency check (`--movable`, board order, content checkout). It prints no UPWARD, CYCLE or `moved:` line:

      depcheck: 235 roadmaps, 2266 edges, 0 problem(s)

- `lake env lean` on `Suggested.lean` prints 17 "declaration uses `sorry`" warnings and nothing else. They are at lines 83, 88, 97, 108, 122, 139, 186, 192, 198, 205, 243, 252, 259, 267, 277, 286 and 298.
- **`#check @` pass, run this round.** I elaborated a scratch file importing the built module, with `#check @name` for all 27 declarations.
  - Every elaborated type carries its own binders: `[NeZero N]`, `[Fact (Nat.Prime ell)]`, `[P.IsPrime]`, `1 ≤ m`, `[(W.baseChange ℚ).IsElliptic]`, `GeometricallyNonCM E`.
  - Each type matches its README statement in generality. Nothing changed.
  - Two printed forms were checked: `-↑γ ^ 3` and `-2 ^ 15` parse as −(γ³) and −(2¹⁵).
- The outside-folder diff is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.

**Headline theorems and padding.**

- **Stated (17).**
  - Martin's formula and sharp bound.
  - Kraus Lemma 1, Appendix II Propositions 1–2, and the §3.3 two-isogeny repair.
  - Mazur's prime-degree list and the Mazur–Kenku composite list.
  - Both uniform irreducibility bounds.
  - The four CM j-values and the non-CM prime list.
  - The split-normalizer exclusion, proper-image containment and Lemos's integral j.
  - The 11/17/37 j-tables and Lemos's theorem.
- **Not statable, each named in the docstring (lines 27–38), absence checked at the pinned Tau Ceti 358314d:**
  - The removed-prime bound §1.6. `TauCeti/AlgebraicGeometry/EllipticCurve/` has no `TateAlgorithm` directory and no conductor.
  - Kraus's realizations §§3.6 and 3.17. There is no residual Artin conductor and no Serre weight.
  - The split-Cartan rational-point theorem and the `Y₀(r)(ℚ)` point counts. There are no modular curves `X₀(N)`.
  - The mixed winding quotient. There are no modular Jacobians or integral Hecke quotients.
  - The quantitative isogeny bound §5.3a. There is no stable Faltings height.
- **Padding: none.** Decided by reading at the pin. Every theorem is a published deep result (Martin, Kraus, Mazur, Kenku, Bilu–Parent–Rebolledo, Lemos), none restates a definition or computes a small value, and the r10 one-tactic probe on this byte-identical file closed none. Each of the 10 definitions is used by a headline.

**Seeded sample: all 15 targets read at their locators.**

- §0.1: martin-2003 lines 77–88 (Definitions 1A–1D, p.2). The rows match the Lean table. Theorem 1 at k=2 (line 70) gives c₂(2)=−1/4, c₃(2)=−1/3, δ(1)=1, i.e. `martinValue`.
- §0.6: martin-2003 Lemma 17, line 766 (p.14). |M|≤1 is used in Corollary 18's proof, line 775.
- §0.13: martin-2003 Lemma 22, lines 823–835 (pp.15–16). Line 833 gives N/12−(N/1548−1); 2/3+14/43=128/129.
- §1.6: bennett-siksek-2020, equation (3) line 169 (p.358), Theorem 3 line 184 and Lemmas 2.1(ii)–2.2 lines 193–207 (p.359).
- §3.13: kraus-1997 lines 374–434. Assertion (Ł) is on p.1146 (page 8 begins at line 384), and the multiplicative branch is at line 412.
- §3.15: kraus-1997 lines 437–439 assert, without proof, that the quotient by the only rational two-point has full two-torsion. The README supplies the square-class step. Its quadratic-compositum and halving argument (α((0,0))=b ∉ ℚ×²) is correct.
- §4.0: mazur-1978 lines 35 and 57 (pp.129–130); banwait-najman-padurariu Theorem 1.1, line 72.
- §4.14: banwait-najman-padurariu lines 56–59 (p.2), Kenku's five cusp-only levels including 169.
- §4.15: the same lines. Table 1.1 (lines 63–71) gives ν=2, 4, 4, 1 at 14, 15, 21, 27 and lists no other composite positive-genus level.
- §4.19: EllipticCurves Layers 1–2 on main (README lines 423 and 647). The argument checks: φ∘φ̂=[2] forces φ̂(E′[2])=T, so the kernel φ̂⁻¹(T′) contains E′[2] only when T′=T.
- §5.3: serre-1981, Lemmas 18–18′, lines 2525–2566 (archive pp.197–198). Serre excludes A₄/A₅ by PSL₂-containment; the README route uses element order ≥(p−1)/4>5. Both are valid for p>37.
- §5.6: bilu-parent-rebolledo Corollary 5.7 (lines 847–859), the sieve (lines 864–882) and Proposition 5.9 (lines 971–974, p.979). Bad=∅ and VeryBad=∅ for p<10¹⁴ is exactly the §5.5 hypothesis for every 11<p≤1.4·10⁷, p≠13.
- §5.13: lemos-2017 Theorem 3.4, lines 355–374 (p.10).
- §5.17: lemos-2017 Theorem 1.4, lines 107–110 (p.3), and the §3 conclusion, lines 375–388.
- §5.19: lemos-2017 table, lines 231–241 (p.6).
- The mixed curve `X0(r*p^2)/w_(p^2)` of the Conventions agrees with Lemos's fibre product X₀(r)×X⁺₀(p²) (lines 298–300). Under the identification X₀(p²)≅X_sp(p), w_(p²) is the swap of the two lines.

**Library declarations opened at the pins (file:line).**

- **Tau Ceti:**
  - `HeckeRing.GL2.Newform` `ModularForms/Newforms/Newform.lean:104`, with `χ` at 87, `isNew` at 106 and `isNorm` at 108;
  - `cuspFormCharSpace` `DiamondOperators.lean:279` and `modFormCharSpace` `:315`;
  - `TauCeti.cuspFormsNew` `Newforms/Basic.lean:202`;
  - `cuspFormCharSpaceOneEquiv` `TrivialNebentypus.lean:220`;
  - `eq_of_sturm_bound` `SturmBound.lean:102`;
  - `TauCeti.Isogeny` `Isogeny/Basic.lean:139` (a coordinate pullback mapping ∞ to ∞; `id` at 161);
  - `degree` `Isogeny/Degree.lean:94`, `ker` `Isogeny/Kernel.lean:75` and `map` `Isogeny/BaseChange/Basic.lean:212`;
  - `torsionGaloisAction` `Affine/Point/Galois.lean:64`.
- **Mathlib:**
  - `Ideal.absNorm_mem` `RingTheory/Ideal/Norm/AbsNorm.lean:329` and `absNorm_dvd_norm_of_mem` `:396`;
  - `card_algHom_le_finrank` `LinearAlgebra/FreeModule/Finite/Matrix.lean:91`;
  - `Algebra.norm_eq_prod_embeddings` `RingTheory/Norm/Transitivity.lean:261` and `isIntegral_norm` `:211`;
  - `Algebra.norm_ne_zero_iff` `RingTheory/Norm/Basic.lean:110`;
  - `Algebra.coe_norm_int` `NumberTheory/NumberField/Norm.lean:38`;
  - `NumberField.exists_ideal_in_class_of_norm_le` `ClassNumber.lean:77`;
  - `WeierstrassCurve.ofJ_j` `ModelsWithJ.lean:183`;
  - `AddSubgroup.torsionBy.zmodModule` and `toZModLinearMap` `Algebra/Module/ZMod.lean:25,81`;
  - `ArithmeticFunction.moebius_apply_prime_pow` and `moebius_mul_coe_zeta` `Moebius.lean:112,156`, `sigma_zero_apply` `Misc.lean:178`;
  - `Nat.totient_eq_mul_prod_factors` `Totient.lean:313` and `prod_factorization_pow_eq_self` `Factorization/Defs.lean:96`;
  - `Representation.IsIrreducible` `RepresentationTheory/Irreducible.lean:29`.

  Every file locator in the Mathlib supplier contract is correct.

**Cross-roadmap citations resolved this round.**

- **On main:**
  - EllipticCurves Layers 1–8 (lines 423–1374).
  - ImaginaryQuadraticClassNumber H1.1–H1.4, H3.2, H3.5 and H3.6.
  - ClassFieldTheory Layer 13, line 1799, with `narrowHilbertClassField` and `gal_rayClassField_equiv_rayClassGroup`.
  - Chebotarev (completed) Layer 10, line 410.
  - ModularForms was renumbered on main by #1706. Its table "Citations of the earlier layer labels" (README lines 331–348) maps Layer 4 to Tau Ceti's bad-prime classification and §4.1, and Layer 8G to §8.2; current Layer 6 (§6.1) and Layer 10/10C still hold the cited topics. So every ModularForms citation here resolves.
- **At open heads:**
  - WeightsInEtaleCohomology §6.1 (line 695) with `newform_ramanujan`, for every embedding σ.
  - SerreWeightAndLevelOptimisation §§2.8, 4.8, 6.1–6.3.
  - NeronModelsAndSemistableAbelianVarieties §§5.2, 5.3h, 5.4, 6.4d.
  - EisensteinIdealAndRationalTorsion §§2.3, 6.3, 6.4, 7.9, 8.9.
  - ModularCurvesPartII §§3.8, 4.1–4.2, 4.8, 5.2, 5.5, 9.1, 9.5–9.8, 10.1–10.3, 13.1–13.3, 14.15, 16.2–16.6, 17.3. §9.7 states both directions and the j∉{0,1728} converse used in §§5.1 and 5.25.
  - AnabelianGeometryAndNonabelianChabauty §1.7. "Generalized Jacobian of a reduced boundary" is a subheading of §1.7 (line 4004, under 3988), with `J_D`, `1→T_D→J_D→J_C→1` and the pointed Abel map.
  - HeightsRationalPointsAndObstructions §§1.4–1.7, 1.13–1.19, including 1.15b.
  - ArakelovGeometryAndAbelianHeights §§1.12, 4.4, 5.9.
- **Supplier positions.** Every named supplier precedes line 285 of the merge order. ErdosProgressionPowers (line 53) is named only as a consumer. `citations.md` lists nothing found nowhere. `overlaps.md` lists no pull request changing this roadmap, no dropped id and no revision-only id.

**Declared gaps.**

- Seven `What … must provide (gap:…)` contracts appear at README lines 60, 62, 80, 82, 92, 118 and 124. Each names a supplier (none is `none`) and states its hypotheses.
- Two of them, `gap:modular-rank-zero` and `gap:quantitative-abelian-periods`, overlap what the sibling owns. That is part of R01.

**Ownership.** `roadmaps grep` finds these carriers (`localTerms`, `GeometricTorsion`, `torsionRepresentation`, the non-CM, cyclic-isogeny and nonsplit predicates) only here and in EllipticCurveModularityPartII. The fully qualified names differ (separate namespaces); the duplication is R01.

**Remarks, not findings.**

- `Suggested.lean`'s docstring says the removed-prime bound is not statable for want of a conductor. That is true at this branch's Tau Ceti pin (358314d) and false at main's (2fd255d), where `WeierstrassCurve.algorithmicConductor` exists and the sibling states `removed_prime_bound`. After a rebase it becomes a statable absent headline, which belongs to option 2 of R01.
- `design/plan.json` still lists `all-embedding-frobenius`, which the README neither declares nor needs. Its §§1.4 and 3.4 use WeightsInEtaleCohomology's all-embedding `newform_ramanujan` instead.
- The pull-request description says "fourteen headline theorems" and "nine simple definitions". The file has 17 theorems and 10 definitions (9 `def`/`abbrev` and 1 `instance`).

**Adversarial pass (values computed this round unless marked).**

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1 `localTerms` | (2,2), (3,2), (2,3), (4,1), (0,0) | (1/4,0,−1,1,0), (5/9,1,1,−1,0), (3/8,0,1,0,0), zero vector, five ones; equal to martin-2003 lines 77–88 | sound | none |
| `martin_dimension_formula` | 1≤N≤3000, against Σ_(d∣N)(μ∗μ)(N/d)·dim S₂(Γ₀(d)) from the genus formula | 0 mismatches; N=1, 11, 13, 23, 30, 35, 64 → 0, 1, 0, 2, 1, 3, 1; full dimension at 30 is 3 | sound | none |
| `martin_sharp_bound` | 1≤N≤3000 | max 12g−(N+1)=0; the only composite equality is 35; every prime ≡11 mod 12 attains equality and no other prime does | sound | none |
| §0.6 Lemma 17 and \|M\|≤1 | 1≤N≤3000; N=1 | 0 violations of NS≤φ, \|A\|,\|B\|≤2^ω, 0≤V∞≤√N, \|M\|≤1; V∞(1)=1 | sound | none |
| §0.13 / §0.14 | 1548≤N≤30000; N<1548 (gcd(N,6)>1, prime >41) | min N−12g = 519 (N=1563); min 38 below 1548 | sound | none |
| §0.15 | 10 primes × exponents in {0,…,5} | 11250 tuples, 10125 levels, min N−12g = 18 (Martin line 846: N/12−3/2) | sound | none |
| §1.1 / §1.6 | p=2, 3; M₀=1 | p+1−2√p = 0.17, 0.54 > 0; (√2+1)^(2/6) = 1.34 < 3, so no irreducible ℓ≥3 has M₀=1 (S₂(1)=0) | sound | none |
| §1 Examples, norms | c=√2, c=100−70√2 in ℚ(√2) | Norm(3−√2)=7; embeddings 1.005 and 198.995; \|Norm\|=391 > 17+12√2 = 33.97 | sound | none |
| §§2.1–2.3 thresholds | N=1, 4, 11, 35 | I(44)=72, G(11)=13+4√3=19.93, F(11)=5.83, F(35)=(1+√8)⁶; G(4)=4 against 9 at I(16)=24 | sound | none |
| `newform_integral_of_small_primes` | N≤10; N=11; N=23 | S₂(Γ₀(N))=0 for N≤10; cutoff 2 and a₂=−2 at 11; cutoff 4 and a₂=(−1±√5)/2 at 23, so the hypothesis fails | sound | none |
| `integral_ideal_sturm` | k=0; level 4, J=4ℤ; J=0 | cutoff n≤0 tests a₀; cutoff 1 and a₁=σ₁(1)=1∉4ℤ; J=0 gives the characteristic-zero Sturm equality | sound | none |
| `kraus_prime_power_congruence` | N∈{1,2,4,8}; N=20 | vacuous hypotheses, but S₂^new=0 there; at N=20, M=20, I=36, cutoff 6: q=3 good, q=5 bad (25∤80), q=2 never in (ii) since 4∣4N | sound | none |
| §3.13 (sample) | q=3; N=11 | 4√3 = 6.93 ≤ (√3+1)² = 7.46; witness q≤I(44)/6=12 < G=19.93 | sound | none |
| §3.15 / `four_divisible_isogeny_realization` | (a,b) = (0,2), (3,1), (0,−1); y²=x³−x | (0,2): #E(𝔽₅)=2; (3,1): quotient x(x−1)(x−5); (0,−1): full 2-torsion; #E(𝔽₃)=4, #E(𝔽₅)=8 | sound | none |
| §4.0 carriers (sample) | n=2; [2]; y²=x³+2 | 4 geometric points; ker[2]=(ℤ/2)² not cyclic; {O,(0,±√2)} stable flex subgroup of order 3 | sound | none |
| `prime_cyclic_isogeny_degrees` via §§4.3–4.5 | q=3, 5 | A₁₂ sets {−1358, 658, 1458} and {−28334, −25774, 23506, 31250}; k=0 primes {2,3,5,7,13,19,37,97} ∩ {2,3,5,7,13,17,31,37,61,157,229} → {37}; k=1/3 primes {2,3,5,11,17}; equal to mazur-1978 lines 1009–1025 | sound | none |
| §4.8 minimal composite levels | Mazur line 95 | 17 levels {14,15,20,21,24,26,27,32,35,36,39,49,50,65,91,125,169}, equal to the README list | sound | none |
| §4.9 / §§4.14–4.15 (sample) | X₀(14), X₀(20), X₀(27) | 6−4=2, 6−6=0, 3−2=1 noncuspidal points (cusp counts 4, 6, 6 with 2 rational at 27); Table 1.1 ν agrees | sound | none |
| `rational_cyclic_isogeny_degrees` | n=0, 1, 20, 22 | an isogeny is a nonconstant pullback, so no degree 0; identity has degree 1; 20 and 22 are absent from the list | sound | none |
| §4.19 (sample) | E with full 2-torsion, T≠T′ | φ̂(E′[2])=T, so ker = φ̂⁻¹(T′) ⊉ E′[2]; cyclic of order 4 | sound | none |
| `rational_two_uniform_irreducibility` | ℓ=7, 11 | 2ℓ = 14 is in the list (cutoff 11 is needed); 22 is absent | sound | none |
| `full_two_uniform_irreducibility` | ℓ=3, 5 | on y²=x(x+5)(x+32), (4,36): slope 7, 2P=(4,−36), order 3, so E[3] is reducible; 4·5 = 20 is absent | sound | none |
| `exceptional_prime_isogeny_j` | y²+y=x³−38x+90 | c₄=1824, Δ=−6859=−19³, j=−884736=−96³ | sound | none |
| `non_cm_prime_isogeny_degrees` | the same curve (CM by ℚ(√−19)) | 19 ∉ {2,3,5,7,11,13,17,37}, so `hCM` is required | sound | none |
| §5.3 (sample) | p=41 | (41−1)/4 = 10 > 5 = max element order of A₅ | sound | none |
| §5.6 (sample) | p=17 | χ₋₃(17)=−1; R_(2,3)=Res(1,1)=1; χ₋₄(17)=+1, so −4 fails | sound | none |
| `split_normalizer_exclusion` | p=2, 11, 13 | 11<p fails; p≠13 excludes 13; at p=2 the pair stabilizer has order 2 against GL₂(𝔽₂) of order 6 | sound | none |
| `proper_image_nonsplit` / `NonsplitNormalizerImage` | p=11 | element of order 120: split orders divide 10, nonsemisimple orders divide 110, so it generates 𝔽₁₂₁ˣ; \|N_ns\|=240, \|N_sp\|=200, \|GL₂(𝔽₁₁)\|=13200 | sound | none |
| §5.19 / §5.22 / `cyclic_isogeny_integral_j` (sample) | r=2, 3, 5, 7, 13 | degrees 3, 4, 6, 8, 14; constant terms 4096, 729, 125, 49, 13; set sizes 25, 13, 8, 6, 4, all equal to lemos-2017 lines 253–260; t=8, −64 → 1728, t=−16 → 0, t=−1 (r=5) → 64 | sound | none |
| §5.13 / §5.17 (sample) | p=11, q≡±1 | first q are 23 and 43, ≥ 2p−1 = 21 > r, 3 | sound | none |
| `isogeny_j_tables_11_17_37` | five Check curves | c₄³/Δ = −24729001, −32768, −121, −9317, −162677523113838677; −17²·101³/2 = −297756989/2; −17·373³/2¹⁷ = −882216989/131072 | sound | none |
| §5.25 Check, rank of J₀(37) | y²+y=x³−x | #E(𝔽₂)=5, #E(𝔽₃)=7, torsion trivial, (0,0) of infinite order: rank ≥1 | sound (README right, source wrong) | none |
| `lemos_uniform_surjectivity` | n=1; y²=x³−x | identity excluded by 1<n; the CM curve has (0,0) (n=2) and nonsplit image at p≡3 mod 4, so `hCM` is needed | sound | none |
| §5.3a bound | d=1, 2; CM 10⁷+i | 10⁷·985² = 9702250000000; 2√10⁷(985+4 log 2) = 6247222 < 6895000; 4·10⁷·989² = 39124840000000 < 10¹⁴+1 | sound | none |
| §5.3c Runge | p=5, 17 | RHS 48.0329, 83.7895 | sound | none |
| Ownership against sibling (R01) | carrier bodies and theorem lists | `diff`: 0 changed lines outside docstrings; same Finsets and j-values | duplicate | R01 |

## Not verifiable

- kenku-1979, kenku-1980a, kenku-1980b, kenku-1981, kenku-1982 and kenku-169-corrigendum are settled as uncertified (paywalled). §§4.10–4.17 cite them by published locator only. Their statements were checked against banwait-najman-padurariu lines 56–71 and mazur-1978 lines 84–102 instead.

## Source issues

- **Misprint** in bennett-siksek-2020 at §2, definition (3), p.358: the source says ord_q(x) is the largest power of q dividing x; it should be the exponent of that largest power (the q-adic valuation), as Lemma 2.2 uses it; affects nothing.
- **Error** in lemos-2017 at §2, proof of Theorem 1.1, p.5: the source says the Jacobian of X₀(37) has rank 0; it should say J₀(37) has rank one, since its factor y²+y=x³−x has (0,0) of infinite order; affects the proof.
