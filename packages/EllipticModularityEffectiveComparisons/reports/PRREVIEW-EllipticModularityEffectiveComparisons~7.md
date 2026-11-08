# Review of EllipticModularityEffectiveComparisons (pull request #1810 at aa5fb55)

**Verdict:** rejected

This is a full review of head `aa5fb55`. The previous review read the same head, so the folder diff is empty. The latest repair report (GATE~6) answered the previous review's only finding (H01) without an edit. The gate passes and the dependency check shows 0 problems. Elaboration gives exactly 14 `sorry` warnings. The one blocking finding is the one raised before: this folder plans again what EllipticCurveModularityPartII already plans. That roadmap is still open and comes earlier in the merge order. The full review also found two P3 locator defects.

## R01 (P1) — Re-plans EllipticCurveModularityPartII, an open roadmap earlier in the merge order

Re-raised: H01 (GATE-EllipticModularityEffectiveComparisons~6; also GATE~5).

**Location.** `TauCetiRoadmap/EllipticModularityEffectiveComparisons/README.md`, Layers 0–5. Line 1696 concedes the overlap: "cites EllipticCurveModularityPartII, which plans the same results under its own layer numbering, as their supplier". The same overlap is in `Suggested.lean` lines 49–269.

**Claim.** Every layer and every Lean headline here has a counterpart in EllipticCurveModularityPartII:
- Martin's formula and sharp bound;
- the removed-prime bound;
- Kraus's thresholds, congruences and realizations;
- the Mazur–Kenku classifications and the two irreducibility bounds;
- the split and nonsplit Cartan results and Lemos's theorem;
- the `GeometricTorsion` carrier.

**Witness.** EllipticCurveModularityPartII is open at head 95f7c2f, earlier in the order (273 vs 283). Its README line 7 reads "this Part II owns the six comparison layers below". Its `martin_bound` (lines 96–98) and `GeometricTorsion` (174–175) match `Suggested.lean` lines 84–86 and 149–150.

**Why the settled reason fails.** GATE~6 says the duplication holds and that "the choice … stays with a human". That reason concedes the defect rather than answering it. The binding rule says that what another roadmap plans is imported, never planned again. When two roadmaps own one object, it is settled with one owner earlier in the merge order and a citation from the other. Here the earlier owner is the sibling. The facts have moved further against this folder since the last review:
- **Who cites whom.** All six consumers cite the sibling and none cites this folder (occurrences of each name at the current heads):

  | Consumer | Head | Sibling | This folder |
  | --- | --- | --- | --- |
  | ErdosProgressionPowers | aaab8ad (new since the last review) | 17 | 0 |
  | AdelicImagesAndModularCurves | 9037f3d | 1 | 0 |
  | EllipticCurvePeriodsAndModularParametrizations | 7a356fe | 6 | 0 |
  | FaltingsFinitenessAndIsogenyTheoremsPartII | f49680f | 10 | 0 |
  | KatoEulerSystems | 903763b | 5 | 0 |
  | RankOneConverse | 9b5c88a | 8 | 0 |

  ErdosProgressionPowers still contracts "From TauCetiRoadmap.EllipticCurveModularityPartII" for EC.0–EC.6 (its line 648, rows 655–661).
- **Merge order.** The board's order now lists the sibling at 273, this folder at 283 and ErdosProgressionPowers at 55. The sibling therefore stays the earlier owner.
- **Declared gaps.** The overlap reaches them too. `gap:modular-rank-zero` (README line 116) asks EulerSystemsAndKolyvaginSystems for finiteness of A_f(ℚ) when L(f,1)≠0, for every primitive weight-two trivial-character newform, CM included. The sibling's §6.0e "Unconditional rank zero for modular abelian factors" (its line 691) plans that statement verbatim under the same slug name.
  - On its own this would be a P2 "gap asks for what an earlier roadmap provides".
  - Its repair depends on the same human choice, so it is recorded here and not as a separate finding.

**Repair.** None inside this folder: importing each target from the sibling leaves no target here. A human chooses one of two options.
- **Close #1810.** The consumers and the merge order already point at EllipticCurveModularityPartII; nothing else changes.
- **Close #1491 and keep this folder.** Then:
  - Re-point the six consumers above to the counterparts listed at line 1696. These are §§0.16, 1.6, 2.1–2.3, 3.17, 4.21–4.22, 5.28 and 4.0 for EC.0–EC.6, and §§4.7, 5.1, 4.17, 5.25 and 5.3a for the others.
  - Give owners to three sibling items that have no counterpart here:
    - the §1.8 numerical majorants, consumed by ErdosProgressionPowers EC.2;
    - the §6.0f minimal period subvariety, consumed by FaltingsFinitenessAndIsogenyTheoremsPartII;
    - the §6.0e rank-zero theorem, consumed by KatoEulerSystems and RankOneConverse. For this one, keep `gap:modular-rank-zero` only if EulerSystemsAndKolyvaginSystems accepts it.
  - Place ErdosProgressionPowers after this folder in the merge order.

**Tested on the instance.** At the current heads the duplication test is the citation count in the table above: six consumers cite the sibling (17, 1, 6, 10, 5 and 8 lines) and none cites this folder. The sibling's README headings at 225 (§1.4), 523 (§5.0a), 565 (§5.1), 691 (§6.0e) and 1038 (§6.18) exist with the statements quoted above.

## R02 (P3) — §1.1's locator promises an "explicit nonvanishing step" that bennett-siksek-2020 does not contain

**Location.** `README.md` line 383: "(bennett-siksek-2020, Lemma 2.2 proof, p.359; explicit nonvanishing step, bennett-siksek-2020 line 198.)"

**Claim.** The cited passage is said to contain an explicit proof that α=p+1−s·c≠0.

**Witness.** bennett-siksek-2020 line 198 says only that p∤M₀ and invokes Lemma 2.1. Lines 199–203 go from λ∣(p+1∓c_p) to ℓ∣Norm and then to ℓ≤(√p+1)^(2[K:ℚ]). No line asserts that p+1∓c_p≠0. The step is used, not stated.

**Repair.** Replace the locator with "(bennett-siksek-2020, proof of Lemma 2.2, p.359, lines 198–203, where the nonvanishing is used without being stated)". §1.1 then becomes the roadmap's own repair of that step. Tested: lines 198–203 contain exactly the congruence, the norm divisibility and the bound, and the passage needs α≠0 to bound ℓ. At p=2 and c=2√2 (the boundary of the hypothesis), α=3−2√2≈0.17≠0.

## R03 (P3) — §4.18 cites a passage that states only the §4.21 conclusion, and both locators name a page-break line

**Location.** `README.md` line 1063 (§4.18): "(bennett-siksek-2020, §3, one rational two-point irreducibility use, p.363, bennett-siksek-2020 line 329.)". Line 1099 (§4.21) uses the same line 329.

**Claim.** The source is said to support §4.18: a rational 2-point together with reducible E[ℓ] gives a rational cyclic 2ℓ-isogeny.

**Witness.** bennett-siksek-2020 line 329 is the page-9 marker. Lines 334–335 say only that a rational point of order 2 and ℓ≥11 give irreducible E_i[ℓ] "from the work of Mazur". No 2ℓ-isogeny is constructed there.

**Repair.**
- §4.18: cite the construction the way §§4.19–4.20 already do, "(EllipticCurves Layer 1, the quotient by a finite Galois-stable subgroup; Layer 2, prime-to-degree torsion)".
- §4.21: change the locator to "(bennett-siksek-2020, proof of Lemma 3.5, p.363, lines 334–335)".

Tested: for ℓ=11, ⟨P⟩⊕L≅ℤ/2×ℤ/11≅ℤ/22 is cyclic and Galois-stable, which is §4.18's content. Lines 334–335 carry §4.21's conclusion for ℓ≥11.

## Previous findings

- **R01 (PRREVIEW~6) — not repaired.** The folder is byte-identical to the head that review read: the change set has 0 lines and `git diff --stat origin/main...HEAD` outside the folder is empty. GATE~6 answered H01 with "the duplication holds at the current heads, and no repair is possible inside this folder", and made no commit. Raised again above as R01.

## Verified sound

**Gate, dependency check, build and elaboration.**
- **Gate.** `gate … --base origin/main` exits 0 with:

      gate EllipticModularityEffectiveComparisons: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

  This matches the worker's gate, whose run also reports build=0.
- **Dependency check** (`--movable`, board order, content checkout):

      depcheck: 236 roadmaps, 2419 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `Suggested.lean` (Mathlib and Tau Ceti at the manifest pins) gives exactly 14 "declaration uses `sorry`" warnings, at lines 79, 84, 93, 104, 118, 135, 182, 188, 194, 201, 238, 246, 256 and 265, and nothing else. All seven `TauCeti.*` imports have object files at the pin.
- **Signatures.**
  - **`#check @name`.** I elaborated `#check @name` for all 24 declarations in one scratch copy. The file has no `variable`, `include` or `set_option`, and no binder was lost.
  - **Against the README.** Each type equals its README statement in generality: §§0.5, 0.16, 3.1, 3.7a, 3.10, 3.16, 4.0, 4.7, 4.17, 4.21–4.22, 5.0, 5.7, 5.8, 5.18 and 5.28. The worker's `signatures.md` agrees (24 declarations, 0 dropped binders).
- **One-tactic padding probe.** I replaced each of the 14 `sorry`s by `first | (rfl; done) | (decide; done) | (infer_instance; done) | (omega; done) | (trivial; done) | (simp; done) | (norm_num; done) | (aesop; done) | sorry`. All 14 fell through to `sorry`, so none closes in one tactic. The nine definitions are the ones the headlines need (`localTerms`, `martinValue` and `newDimension` for Martin; `GeometricTorsion`, `torsionModule`, `torsionRepresentation` and `CyclicIsogenyDegree` for Layer 4; `GeometricallyNonCM`, `SplitNormalizerImage` and `NonsplitNormalizerImage` for Layer 5). Each has a real body on pinned carriers.
- **Headlines.**
  - The README's headline theorems are §§0.16, 1.6, 3.6, 3.17, 4.7, 4.17, 4.21, 4.22, 5.7, 5.8 and 5.28, with the supporting deep results §§0.5, 3.1, 3.7a, 3.10, 3.16, 5.3a, 5.3b, 5.4–5.6, 5.13 and 5.18.
  - The statable ones are in `Suggested.lean`.
  - §1.6, §3.6, §3.17, §5.3a, the split-Cartan rational-point theorem, the exceptional-prime exhaustions and the mixed winding quotient are named in the module docstring (lines 24–34) with the missing carrier: elliptic conductor and Serre weight, modular curves and Jacobians, and the stable Faltings height. I found no stand-in for them.

**Library declarations opened at the pins.**
- **Tau Ceti:**
  - `TauCeti.ModularForm.eq_of_sturm_bound` (NumberTheory/ModularForms/SturmBound.lean);
  - `TauCeti.cuspFormsNew_inf_cuspFormCharSpace` (Newforms/Nebentypus.lean);
  - `TauCeti.cuspFormCharSpaceOneEquiv` (TrivialNebentypus.lean);
  - `TauCeti.cuspFormsNew` (Newforms/Basic.lean);
  - `WeierstrassCurve.torsionGaloisAction` (Affine/Point/Galois.lean);
  - `TauCeti.Isogeny` (Isogeny/Basic.lean:139, a coordinate pullback mapping ∞ to ∞);
  - `TauCeti.Isogeny.degree_pos` (Isogeny/Degree.lean:148), which excludes `CyclicIsogenyDegree E 0`;
  - `TauCeti.Isogeny.ker` (Isogeny/Kernel.lean:75) and `TauCeti.Isogeny.map` (BaseChange/Basic.lean:212).
- **Mathlib:**
  - `Nat.prod_factorization_pow_eq_self`, `ArithmeticFunction.moebius_apply_prime_pow`, `moebius_mul_coe_zeta` and `sigma_zero_apply`;
  - `Nat.totient_eq_mul_prod_factors`, `Algebra.norm_eq_prod_embeddings`, `Algebra.isIntegral_norm` and `Algebra.norm_ne_zero_iff`;
  - `Ideal.absNorm_mem`, `Ideal.absNorm_dvd_norm_of_mem` and `Algebra.coe_norm_int` (NumberField/Norm.lean:38);
  - `card_algHom_le_finrank`, `Representation.IsIrreducible`, `AddMonoidHom.toZModLinearMap`, `AddSubgroup.torsionBy.zmodModule` and `NumberField.exists_ideal_in_class_of_norm_le`.

  Each exists in the file the README names.
- **Duplication.** Neither library states Martin's newspace formula, a cyclic-isogeny predicate, a non-CM predicate or a Cartan-image predicate. I grepped Tau Ceti for `martin`, `NonCM`, `CyclicIsogeny` and `Representation (ZMod`: no hits.

**Cross-roadmap citations resolved** (the worker's `roadmaps resolve` found none missing). I spot-checked these headings at main or at the open head:
- On main:
  - Chebotarev Layer 10 (Completed, line 410);
  - ImaginaryQuadraticClassNumber H1.1–H1.4 (25–43), H3.2 (91), H3.5 (124) and H3.6 (142);
  - ClassFieldTheory Layer 13 (1799);
  - EllipticCurves Layers 1–7 (423–1262);
  - ModularForms Layer 10/10C (1024/1119). It owns only the full Γ₀ dimension formula, so the inversion in Layer 0 is not owned there.
- At open heads:
  - AnabelianGeometryAndNonabelianChabauty §1.7 (3988), whose "Generalized Jacobian of a reduced boundary" (4004) supplies `J_D`, the torus sequence, pointed-pair functoriality, base change and the Abel map exactly as the contract at README line 86 states. Its §2.0 is at 4479.
  - EisensteinIdealAndRationalTorsion §§2.3 (471), 6.3 (858), 6.4 (870), 7.9 (1029) and 8.9 (1315).
  - EulerSystemsAndKolyvaginSystems §§4.7 (2962) and 5.13 (3901).
  - ArakelovGeometryAndAbelianHeights §§1.12 (538), 4.4 (1221) and 5.9 (1640).
  - SerreWeightAndLevelOptimisation §§2.8 (484), 4.8 (1076) and 6.1–6.3 (1368–1418).

**Declared gaps.** The eight slugs in the README (under `## Exact supplier contracts`, each as "What <Supplier> must provide (gap:…)") equal the eight `gaps` of `design/plan.json`, with the same suppliers and sections. Each `needs` sentence names its hypotheses. `gap:modular-rank-zero` duplicates the sibling's §6.0e (folded into R01).

**Ownership against open work.**
- The overlap scan lists no open pull request that changes this roadmap and no dropped id in either direction.
- `roadmaps grep` for Martin's bound and Lemos over main and every open head finds only this folder, the sibling (R01) and the consumer ErdosProgressionPowers.

**Sampled locators** (all 15 seeded targets, read at the line):
- 1.1: bennett-siksek-2020 lines 198–203 (see R02).
- 3.7: kraus-1997 lines 1147–1154. Rows (i)–(vi) equal the six README pairs, at p.1160.
- 3.8: kraus-1997 lines 1113–1130, p.1159. g=Σ_odd σ₁(n)qⁿ has weight 2 and trivial character on Γ₀(4), with odd-prime factor 1/(1−(p+1)p^(−s)+p^(1−2s)).
- 3.13: kraus-1997 lines 386–434, p.1146. The bad branch gives a_l(E′)≡±(l+1) and then p≤(√l+1)²≤G. The good branch gives a_l(E)=a_l(E′) and then n_l(E)=n_l(E′).
- 4.2: mazur-1978 lines 979–991. Proposition 6.3 and Corollary 6.1 (p.153) give the k and 12k trace congruences, with b_p of order dividing 12.
- 4.5: mazur-1978 lines 1021–1026, p.154. 3⁴+3⁸ gives N∈{2,3,5,11,17}.
- 4.10 and 4.12: banwait-najman-padurariu lines 56–59 (p.2) name 39, 65, 91, 125 and 169 as Kenku's cusp-only levels. The Kenku papers are uncertified.
- 4.18: bennett-siksek-2020 lines 334–335 (see R03).
- 4.19: no source text; the locator is EllipticCurves Layer 1 (main, line 423). Checked by the computation in the table.
- 5.3a:
  - gaudron-remond lines 168–170 (Théorème 1.4, p.4) gives the bound 10⁷[k:ℚ]²(max(h_F(E₁),985)+4 log[k:ℚ])² for curves isogenous over k̄; the extraction drops the bar.
  - Lines 1539–1543 give Théorème 7.5: k′ of degree 1 or 2, A_ω≅E₁×E₂, and #(A_ω∩({0}²×E₂²))=Δ.
  - bilu-parent-rebolledo lines 649–651 (Proposition 4.3, p.971) give the cyclic, non-CM form.
- 5.10: lemos-2017 lines 331–343 (Lemma 3.2, p.9). The p-old part dies because N_ns B⁺ = N_ns B⁻ = GL₂(𝔽_p).
- 5.16: darmon-merel lines 770–776 (Lemma 8.3, author version p.24). The torsion comes from Drinfeld–Manin applied to (σ−1)((P)−(∞)) and finiteness of J_e(ℚ).
- 5.24: lemos-2017 lines 204–205 (p.5). The source asserts that surjectivity depends only on j and gives no proof; the README supplies one.
- 5.28: lemos-2017 lines 44–46 (Theorem 1.1, p.2). End_ℚ̄(E)=ℤ, a nontrivial cyclic ℚ-isogeny and p>37 give surjectivity. The Lean hypotheses match.

**Adversarial pass** (values computed in this review; I used exact rational arithmetic for Martin's table and point counts over 𝔽₁₃₆₉ for the supersingular check):

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `martin_dimension_formula` (§0.5) | N=1,2,11,23,30,35,37,64 | martinValue: 0,0,1,2,1,3,2,1. Newspace dimensions: 0,0,1,2,1,3,2,1. At 30 the full Γ₀ space has dimension 3 (the genus) | sound | none |
| `martin_sharp_bound` (§0.16) | every 1≤N≤4000 | no N with 12·martinValue(N)>N+1. The equality set is exactly {35} ∪ {primes ≡11 mod 12}: none missing, none extra | sound | none |
| §0.1 Checks | (2,2), (3,2), (2,3) | (1/4,0,−1,1,0), (5/9,1,1,−1,0), (3/8,0,1,0,0) from the README table and from the Lean `if` cascade | sound | none |
| §0.8 | p=2,3,5,7,11,13 | 12·martinValue = 0,0,0,0,12,0 against p+1 = 3,4,6,8,12,14 | sound | none |
| `newform_integral_of_small_primes` (§3.1) | N=11 (I=12, q≤2); N=23 (I=24, q≤4) | 11a has a₂=−2∈ℤ, so every coefficient is integral. Level 23 has a₂=(−1±√5)/2∉ℤ, so the hypothesis fails, matching K_f=ℚ(√5) | sound | none |
| `integral_ideal_sturm` (§3.7a) | N=4, k=2, the odd form g, J=4ℤ; N=1, k=0, f=1, J=0 | The cutoff 12n≤12 tests n≤1, and a₁=1∉4ℤ, so the hypothesis fails. Sturm's (μ−1)k/12=5/6 would test only a₀=0 and wrongly give g≡0 (kraus-1997 lines 1064–1071). At k=0 only n=0 is tested, and a₀=1∉0 | sound | none |
| `kraus_prime_power_congruence` (§3.10) | N=11, K=ℚ, P=2ℤ, m=2 | I(44)=72 gives q≤12. Good primes q∤22: {3,5,7}. Bad primes q∣22 with q²∤44: {11}; q=2 drops because 4∣44. These are the sets of kraus-1997 lines 1086–1092. For 11a, a₃−4=−5∉4ℤ (#E(𝔽₃)=5) | sound | none |
| §3.7 (sampled) | (2,0,3), (2,2,0), (3,1,−1), (3,2,0) | (1−3X+2X²,1), (1,1), (1,1−5X), (1,1−4X+3X²) = Kraus rows (i), (iii), (v), (vi). At a good p=2, a₂ₘ−a₂aₘ+2a_(m/2)=0 | sound | none |
| §3.8 (sampled) | p=3 Euler factor | 1/(1−4x+3x²) = 1+4x+13x²+…, with σ₁(3)=4 and σ₁(9)=13. g=η(4z)⁸/η(2z)⁴. S₂(Γ₀(4))=0, so g is not cuspidal | sound | none |
| §3.13 (sampled) | N=11, ℓ≥23 | G=13+4√3≈19.93 and the witnesses are q∈{3,5,7}. The good-reduction gap is ≤4√7≈10.58. The multiplicative gap is ≤(√7+1)²≈13.29, and it is nonzero because 2√7≈5.29<8 | sound | none |
| `four_divisible_isogeny_realization` (§3.16) | y²=x(x²+3x+1); y²=x(x²+2) | First curve: b=1 is a square, and the quotient y²=x(x−1)(x−5) has four rational 2-torsion points (degree 2). Second curve: #E(𝔽₅)=2, so the hypothesis fails at q=5 | sound | none |
| `GeometricTorsion`, `torsionRepresentation` (§4.0) | n=2 on y²=x³−x+1 and y²=x³−2x | Discriminant −23 gives image S₃, irreducible. For x³−2x the splitting field is ℚ(√2) and (0,0) is a rational stable line, so it is reducible | sound | none |
| `CyclicIsogenyDegree` (§4.0) | degree 0; [2] | `degree_pos` excludes 0. [2] has degree 4 and kernel (ℤ/2)², not cyclic | sound | none |
| `prime_cyclic_isogeny_degrees` (§4.7) | r=23, 29, 37 | X₀(23) and X₀(29) have only cusps (mazur-1978 lines 993–998); 37 has two j-values (lemos-2017 line 202) | sound | none |
| §4.2 (sampled) | k=0, q=3 | 1+3¹²=531442. The three differences are 2⁵·3²·19·97, 2⁶·3²·5²·37 and 2⁶·7²·13², as at mazur-1978 line 1012 | sound | none |
| §4.4 at q=5 | a=0,…,4 | A₁₂ = 31250, −28334, 23506, −25774, 23506. The primes of 1+5¹²−A₁₂ are {2,3,5,7,13,17,31,37,61,157,229}, as at mazur-1978 line 1019 | sound | none |
| §4.5 (sampled) | k=1/3, q=3 | 6642−658=2⁵·11·17, 6642+1358=2⁶·5³, 6642−1458=2⁶·3⁴, giving {2,3,5,11,17} | sound | none |
| §§4.10, 4.12 (sampled) | X₀(39), X₀(91) | μ=56 and 112; ν₃=2 and 4; ν∞=4 each; genus 3 and 7; four rational cusps each | sound | none |
| §4.18 (sampled) | ℓ=3, 11 | ⟨P⟩⊕L is ℤ/6 and ℤ/22, cyclic and Galois-stable. The source states only irreducibility | math sound | R03 |
| §4.19 (sampled) | y²=x(x−1)(x+1), T=⟨(0,0)⟩, T′=⟨(1,0)⟩ | φ̂(E′[2])=T≠T′, so the kernel of order 4 is cyclic. With T′=T the composite is [2], with kernel (ℤ/2)² | sound | none |
| `rational_two_uniform_irreducibility` (§4.21) | ℓ=7, 11 | 22 is not in the list {1..19,21,25,27,37,43,67,163}. 14 is in the list, so ℓ=7 needs the cutoff 11 | sound | none |
| `full_two_uniform_irreducibility` (§4.22) | ℓ=3, 5, 7 | 20 and 28 are absent. At ℓ=3, (4,36) on y²=x(x+5)(x+32): 4·9·36=36², slope 504/72=7, 2P=(4,−36)=−P, so P has order 3 | sound | none |
| §5.0 predicates | y²=x³−x; 11a1; p=2, 11 | (x,y)↦(−x,iy) has order 4. j(11a1)=−2¹²·31³/11⁵. At p=11: \|N_s\|=200 and \|N_ns\|=240, and 200∤240. At p=2 the order-3 subgroup of S₃ is normal and the pair stabilizer has order 2 | sound | none |
| `split_normalizer_exclusion` (§5.7) | p=11, 13, 17 | bilu-parent-rebolledo line 104: p>11, p≠13. The Lean hypotheses are `11 < p` and `p ≠ 13` | sound | none |
| `proper_image_nonsplit` (§5.8) | p=41 | (41−1)/4=10>5. lemos-2017 lines 223–226 have the same hypotheses | sound | none |
| `cyclic_isogeny_integral_j` (§5.18) | y²=x³−x, r=2, p=11 | It has a rational 2-isogeny; 11 is inert in ℤ[i], so the image is nonsplit; j=1728∈ℤ. lemos-2017 lines 136–139 have no non-CM hypothesis | sound | none |
| `lemos_uniform_surjectivity` (§5.28) | n=1; 11a1 | The identity has degree 1 and is excluded by `1 < n`. 11a1 has a rational 5-isogeny and nonintegral j | sound | none |
| §5.3a (sampled) | d=1, d=2, CM 10⁷+i | 10⁷·985²=9 702 250 000 000. 2√10⁷(985+4 log 2)≈6 247 222<6 895 000. 4·10⁷·989²=39 124 840 000 000<10¹⁴+1 | sound | none |
| §5.10 (sampled) | p=11 | \|N_ns B⁺\|=240·1100/20=13200=\|GL₂(𝔽₁₁)\|. The intersection is 10 scalars plus 10 elements of N∖C | sound | none |
| §5.16 (sampled) | n=5, m=7; ∞ rational | 35φ(P)=0; with ∞ rational, n=1 | sound | none |
| §5.24 (sampled) | p=5, ψ through det | g↦ψ₀(det g)g is a homomorphism (scalars are central) and an involution because det(−g)=det g | sound | none |
| §5.22 Checks | r=2,3,5,7,13 | Signed divisors: 26, 14, 8, 6, 4. Distinct j: 25, 13, 8, 6, 4. t=8 and t=−64 both give 1728. J₁₃ = {−39091613782464, 576, 2101248, 2045023375454208} | sound | none |
| §5.4a Checks | p=17, D=51; p=37 | H₋₅₁≡X²+X+13=(X−8)² mod 17, and 54000≡8. Over 𝔽₁₃₆₉ the trace is −74 at j=8 and j=3±10t, and −65 at j=1. (3+10t)³⁷=3−10t | sound | none |
| §1.1 (sampled) | p=2, c=2√2; p=1, c=2, s=1 | α=3−2√2≈0.17; α=0 at the forbidden p=1 | math sound | R02 |
| Conventions checks | y²+y=x³−x over 𝔽₂; q+2q² | #E=5, a₂=−2, X²+2X+2 with root product 2 (the inverse has 1/2). Mellin value 2, ∫=−2, W=i/π, −2πiW=2 | sound | none |
| §1.3 example | c=100−70√2 | The conjugates are ≈1.005 and ≈198.995. Norm(3−c)=97²−2·70²=−391, and 391>(√2+1)⁴≈33.97 | sound | none |
| Sibling vs here (R01) | `martin_bound`/`martin_sharp_bound`; `lemos_surjectivity`/`lemos_uniform_surjectivity`; `NonCM`/`GeometricallyNonCM`; `HasCyclicIsogeny`/`CyclicIsogenyDegree`; `GeometricTorsion` | The bodies of the three definition pairs are identical, and so are the conclusions of the two theorem pairs. The only binder difference is `[Fact p.Prime]` against `(hp : p.Prime)` (sibling `Suggested.lean` lines 96–98, 141–152, 174–175 and 251–254) | duplicate | R01 |

## Not verifiable

- kenku-1979, kenku-1980a, kenku-1980b, kenku-1981, kenku-169-corrigendum and kenku-1982 (§§4.10–4.17) are settled as uncertified (paywalled). banwait-najman-padurariu lines 56–59 was read in their place.
- These computer verifications were not rerun: bilu-parent-rebolledo's Proposition 5.9 range, Lemos's LMFDB checks (lemos-2017 lines 206–213) and Martin's general proof beyond the N≤4000 recomputation.

## Source issues

- **Gap** in bennett-siksek-2020 at proof of Lemma 2.2, printed page 359: the source says ℓ divides Norm(p+1∓c_p) and then bounds ℓ by that norm; it should note the norm is nonzero, since |σ(c_p)|≤2√p<p+1 in every embedding; affects nothing.
- **Misprint** in bilu-parent-rebolledo at Proposition 5.9, printed page 979: the source says the range starts at 11⩽p; it should be 11<p, since Corollary 5.7 (p.976), on which it rests, assumes p>11, as do Theorem 1.1 and Corollary 5.10; affects nothing.
