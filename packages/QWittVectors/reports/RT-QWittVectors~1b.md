<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/81#issuecomment-6308655512 -->
Red team round 1 pass b (claude) of c5fd3cd

Verdict: needs_changes

1. **F01** (P2) gap:cyclotomic-contract asks for a radical/completion clause that Mathlib, DerivedModuleAlgebra and §6.2 already provide

   Location: `packages/QWittVectors/README.md:76`, "and, for every d>0, equality of the derived completion functors for (p,Φ_d) and `(p,Phi_{pd})`, using the radical identity deduced from Mathlib"; `packages/QWittVectors/design/plan.json`, gap `cyclotomic-contract`, "and the radical identity √(p,Φ_d)=√(p,Φ_{pd}) for every d>0 giving the same derived completion topology".

   Claim: the supplier HabiroCyclotomicCompletions must supply the equal-radical statement and the equality of the two derived completion functors.

   Witness: the radical identity follows in one line from `Polynomial.cyclotomic_mul_prime_eq_pow_of_not_dvd` and `Polynomial.cyclotomic_mul_prime_dvd_eq_pow` (`Mathlib/RingTheory/Polynomial/Cyclotomic/Expand.lean:131,145`, verified at the pin), which the same paragraph already imports; the completion consequence is DerivedModuleAlgebra §1.2 `isDerivedCompleteRadical` and §1.3 (`TauCetiRoadmap/DerivedModuleAlgebra/README.md:1693-1760`), already imported at `README.md:48`; and §6.2 states the same fact as this roadmap's own target `cyclotomicCompletedFrobenius_ideals` (`README.md:780`). The gap therefore asks for what is provided, and the object has two owners.

   Repair: in `README.md:76` delete the clause from "and, for every d>0, equality of the derived completion functors" through "radical invariance." and end the sentence after `Phi_d(q^(p^alpha))`; make the same deletion in the `needs` of gap `cyclotomic-contract` in `design/plan.json` (drop "and the radical identity … derived completion topology"). In §6.2 `cyclotomicCompletedFrobenius_ideals` add "by Mathlib `Polynomial.cyclotomic_mul_prime_eq_pow_of_not_dvd`, `Polynomial.cyclotomic_mul_prime_dvd_eq_pow` and DerivedModuleAlgebra §1.2 `isDerivedCompleteRadical`", and remove `gap:cyclotomic-contract` from the §6.2 *Needs:* line and the Layer 6 Dependencies list if nothing else in §6.2 uses it (the remaining §6.2 uses are Mathlib and DerivedModuleAlgebra).

2. **F02** (P3) Borger reference entry misnumbers the étale theorems

   Location: `packages/QWittVectors/README.md:1285`, "Theorem 9.1 (p. 39, line 1995); Corollary 9.3 (p. 40, line 2095)".

   Claim: Borger's étale base-change theorem and étale-pushout corollary are Theorem 9.1 and Corollary 9.3.

   Witness: borger line 1995 reads "9.2. Theorem. For any étale map … is étale" and borger line 2095 reads "9.4. Corollary"; `packages/QWittVectors/sources.toml` already records "Theorem 9.2 (p. 39, line 1995); Corollary 9.4 (p. 40, line 2095)", and Wagner Remark 2.49 (wagner line 1671–1674) cites Bor11 Theorem 9.2 and Corollary 9.4 for exactly the §1.6 pushout.

   Repair: in `README.md:1285` replace "Theorem 9.1 (p. 39, line 1995); Corollary 9.3 (p. 40, line 2095)" by "Theorem 9.2 (p. 39, borger line 1995); Corollary 9.4 (p. 40, borger line 2095)"; in §1.6 (`README.md:206`) append "borger Theorem 9.2 and Corollary 9.4, borger lines 1995 and 2095" to the locator, since these are the results Wagner Remark 2.49 uses for the F-pushout of ordinary Witt vectors that §1.6 states.

3. **F03** (P3) README points at a board path and at the private source extraction

   Location: `packages/QWittVectors/README.md:1288`, "All locators use the stated arXiv version and the numbered source extraction … The source manifest is `packages/QWittVectors/sources.toml`."

   Claim: readers can resolve `packages/QWittVectors/sources.toml` and the "numbered source extraction".

   Witness: the folder becomes `TauCetiRoadmap/QWittVectors/` on merge, so the `packages/` path is a board-only path; no roadmap README on main refers to its manifest by a `packages/` path (grep of `TauCetiRoadmap/*/README.md` for `sources.toml`: no hits). The "wagner line N" numbers refer to the worker's extraction, which is not part of the repository.

   Repair: replace the sentence at `README.md:1288` by "Printed pages refer to the stated arXiv versions; the source manifest is `sources.toml` in this folder." Keep theorem and page numbers as the primary locators (the "source line N" references may stay as secondary pointers but must not be described as the locator scheme).

4. **F04** (P3) plan.json gap text cites a section number the package renumbered

   Location: `packages/QWittVectors/design/plan.json`, gap `prismatic-frobenius`, "identify the C□ coordinate Frobenius of §8.5 with prismatic Frobenius" (and dependency ids `target:8.5`).

   Claim: the framed Frobenius is §8.5.

   Witness: the package renumbered Layer 8 consecutively (`reports/PKG-QWittVectors.md:9`); the README gap paragraph at `README.md:82` and the target at `README.md:1044` say §8.4, and there is no §8.5 in the README. The intake announces the plan.json `needs` text to the supplier.

   Repair: in `design/plan.json` change "§8.5" to "§8.4" in the `needs` of gap `prismatic-frobenius`, and renumber the `target:8.5`…`target:8.4` ids to the README's §§8.1–8.4 so the two files name the same sections.

5. **F05** (P3) Statable Checks and a statable target with no Lean mirror

   Location: `packages/QWittVectors/README.md:1098-1112` (§9.2) and `README.md:790-791` (§6.2 Checks); `packages/QWittVectors/Suggested.lean` has no declaration beyond §1.1–1.2.

   Claim (rule): every README Check statable at the pins has an `example`, and end theorems whose carriers exist at the pins may be stated.

   Witness: §9.2 is stated on `S_α = ℤ_p[[h]]/(q^{p^α}−1)`, i.e. on `PowerSeries ℤ_[p]` and `Ideal.Quotient`, both pinned; its Check "p=2, α=1, e=0: H⁰=(h+2)S_α and H¹=S_α/(h) are both ℤ₂" and its unit clause `[u]_{q^{p^e}}` unit are statable as kernel/cokernel of multiplication and `IsUnit` of a power series with constant coefficient u. The §6.2 Checks "Φ_3 mod 3=(q−1)²" and "(3,Φ_3)≠(3,q−1) in ℤ[q] with equal radicals" are statable with `Polynomial.cyclotomic 3 (ZMod 3)` and `Ideal.radical`.

   Repair: add to `Suggested.lean` a Layer 9 section with a sorry'd `theorem framedTwoTermCohomology_unit (p : ℕ) [Fact p.Prime] (e u : ℕ) (hu : ¬ p ∣ u) : IsUnit (∑ j ∈ Finset.range u, (1 + PowerSeries.X : PowerSeries ℤ_[p]) ^ (p ^ e * j))` and a sorry'd kernel statement for `K_{α,e}` (kernel of multiplication by `(1+X)^(p^e) − 1` on `PowerSeries ℤ_[p] ⧸ Ideal.span {(1+X)^(p^α) − 1}` equals the span of `∑_{j<p^(α−e)} (1+X)^(p^e j)`), plus a proved `example : Polynomial.cyclotomic 3 (ZMod 3) = (Polynomial.X - 1) ^ 2` if it elaborates at the pin; otherwise record these as named sorry'd targets in §9.2/§6.2 and say in the README which Checks have no mirror.

6. **F06** (P3) §2.2 faithful-flatness claim cites locators that do not contain it

   Location: `packages/QWittVectors/README.md:306`, "Adams operations have faithfully flat underlying maps" (`LambdaP.free_polynomial`), with locators borger §§1.16–1.18, pridham Definition 2.1, wagner Remarks 2.32 and 2.43.

   Claim: the free Λ_P-ring on a set has faithfully flat Adams operations, supported by the cited passages.

   Witness: borger lines 603–640 define Λ_{R,E}-rings and the free functor without any flatness statement; pridham line 506 and wagner lines 1332, 1556 concern Λ_m-structures. The statement is supported by bhatt-scholze Lemma 2.11, line 594 ("ℤ_(p){x} … its Frobenius endomorphism is faithfully flat") for one prime and by wagner-habiro §1.22(e), line 493–497 ("it holds … for any free Λ-ring ℤ{x_i}") for all primes.

   Repair: append to the §2.2 locator "bhatt-scholze Lemma 2.11, p. 15, bhatt-scholze line 594 (single prime); wagner-habiro §1.22(e), p. 12, wagner-habiro line 493 (all primes)" and add `"2.2"` to the `cited_for` of `bhatt-scholze` and `wagner-habiro` in `sources.toml`.

No false statement, unowned prerequisite, upward dependency or sorry'd data was found. The findings below are one redundant gap clause (P2) and locator, policy and Lean-mirror defects (P3). The package report states that `Suggested.lean` was never compiled; elaboration could not be checked in this pass either (see Not verifiable).

## Verified sound

Dependency check (run read-only, output verbatim):

```
depcheck: 3 roadmaps, 20 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every supplier named is on main or earlier in `merge-order/ORDER.txt` (SchemeAndStackFoundations, DerivedModuleAlgebra, EnhancedDerivedSheaves, DGAInfinity on main; DerivedDeRhamCohomology, PrismaticCohomology, HabiroCyclotomicCompletions earlier in the order, cited only through declared gaps). The seven gap slugs in `design/plan.json` match the seven in the README; every gap names a supplier (none is `none`). The pull request changes only `packages/QWittVectors/` (`git diff --stat origin/main...HEAD`: README.md, Suggested.lean, metadata.toml, sources.toml, reports/PKG-QWittVectors.md).

Lean (5 declarations, 4 examples read line by line): `TruncationSet` (positivity and divisor closure, empty set allowed), `ghostPolynomial` (divisor sum on `ℕ → R`), `ghost_image` (Dwork criterion; matches hesselholt Lemma 1.1, line 223–228 exactly: lifts only for primes in S, no commutation, modulus `p^{v_p(n)}`; necessity and sufficiency re-derived for an arbitrary commutative ring, including ℤ/4 and 𝔽₂ instances), `ghost_injective`, `ghost_equiv_of_units` (existence by divisor recursion, uniqueness only on S). All binders explicit; no `set_option`, `lemma`, `True` placeholder, sorry'd data, or process comment; single `import Mathlib`. README generality equals the Lean generality (unital commutative coefficients, nonunital extension stated in prose only).

Targets read: all 53, with every API clause, proof route, *Needs:* line and Check (161 Checks). Build order: every *Needs:* entry is an earlier target, a listed supplier section, a pinned declaration or a declared gap; no layer-level cycle.

Adversarial pass (statement; instances tried; result):

| Statement | Instances | Result |
|---|---|---|
| 1.1–1.2 ghost polynomials, Dwork criterion | S=∅, Div(2), Div(6); ℤ, 𝔽₂, ℤ/4; p=2,3 | true; Lean examples' values recomputed (w₆, (1,1)↦(1,3), (0,1) no preimage, 𝔽₂ witness) |
| 1.3 nonunital Checks | (ℤ,+) with zero multiplication, Div(2) | componentwise addition, zero multiplication: true |
| 1.4 F_aV_b=cV_{b/c}F_{a/c}; τ(−1)=−τ(1)+V₂τ(1) | Div(2) over ℤ | ghosts (−1,1) on both sides: true |
| 1.8 fracture square | N=1; M=ℤ, N=2; M=ℤ[1/p]; M=ℚ/ℤ | true (wagner §4.18, line 3081–3095 gives the square as stated) |
| 2.1 𝔽₂ negative control | identity lifts on 𝔽₂ | δ₂(2)=−1≠δ₂(0): true |
| 2.4 ℤ[ε]/ε² with ψ_n(ε)=nε | p=2 reduction | Λ-ring, ψ₂ not flat (ε acts by 0 on A/2): true |
| 3.1–3.3 Q₂(ℤ)=ℤ[q]/(q²−1), V₂(1)=1+q, ghosts | m=1,2; q=1 | true |
| 3.4 resolution signs | m=6, m=2^a, m=1 | sign rule equals wagner Remark 2.16 (counts i∈S, i<j); composite zero: true |
| 3.5–3.7 torsion, completion, decomposition | 𝔽₂ V₂(1); R=0; m=1 | true (Cor 2.22–2.30) |
| 4.1 image formula, toric example | A=ℤ[T], m=2 | image ℤ[T²,q]+(1+q)ℤ[T,q], T missing: true; uniqueness of V–s expansion holds for all A by coordinate triangularity (Wagner proves it only for flat A) |
| 4.3 V-linearity ideal Check | A=ℤ[T], R=A[X], m=2 | the displayed map B→𝔽₂[ε]/ε² is a well-defined ring map (odd-exponent coefficients even, cross terms divisible by 4) separating V₂(TX)⊗1 from V₂(X)⊗T: true |
| 4.3 Q_m(A/A) | arbitrary Λ-ring A | A[q]/(q^m−1) since c_d is multiplicative: true |
| 4.4 ghost twist direction | toric ℤ[T], m=2 | r⊗b↦ψ₂(r)b gives T²: true |
| 5.2 R=A Check | d|m | pushout is Q_m(R′/A)⊗A[ζ_d]: true |
| 6.2 radical Checks | p=2,3, d=1 | Φ₃≡(q−1)² mod 3, ideals unequal: true |
| 6.3 bottom map | r⊗a↦r^p⊗a | well defined on ψ_{pd}-twisted tensor: true |
| 7.1 V_n d=n dV_n | ω=1 | uses (q^d−1)P_d=0 only: true |
| 7.3 dF_n=nF_nd | m=2,3; R=ℤ[T] | true; the source's "n(d∘V_n)" at wagner line 1921 is a misprint not copied |
| 7.4 γ_p | p=2 | γ₂(V₂x)=V₂(x²), (V₂x)²=2V₂(x²): true |
| 7.5–7.6 θ_p, ghost coefficients | R=ℤ[T], m=p=2 | θ₂(τ₂T)=TdT, θ₂(τ₂T²)=2T³dT, gh coefficient n^{i+1} (2, 4): true |
| 8.1–8.3 γ, D, skew product | T², T³, T⁻¹; r=0; char 2 | true |
| 8.4 φ□ on C□ and H□ | p=2 | factor [p]_qT^{p−1} on C□, T^{p−1} on H□: true |
| 9.1–9.2 decomposition, two-term complexes | r=1,p=2,α=1; e=α; tensor over S_α | bases and H⁰,H¹ as stated; tensor must be over S_α (Wagner's ⊗_{ℤ_p[[h]]} is corrected by the README): true |
| 9.3 Bockstein, Fβ_mV=β_d | m=1,2; R=ℤ[T] | true |
| 9.4 product homotopy | all four cases i∈I∩J, i∈I∖J, i∈J∖I, i∉I∪J; j<i and j>i; the three Checks | μ_{i−1}−μ_i=d_HH_i+H_i(d⊗1)+(−1)^kH_i(1⊗d) holds in every case using the two twisted Leibniz forms; Checks' values (−XYdX, hXdX∧dY, XZdX∧dY) recomputed: true. This roadmap-original proof closes the coefficientwise gap in wagner Lemma 4.17 (line 3042–3052) |
| 9.5–9.7, 10.1–10.2 | α=0; m=1; p=2,m=6; p=3,m=2; R=ℤ[x]/x² | true; 10.2's complex-level completion holds without degree boundedness (termwise short exact sequences 0→Hom(ℤ[q][1/h],M^i)→M^i→ΛM^i→0) |

Locators verified against the extractions (81): hesselholt Lemmas 1.1, 1.3–1.5, 1.9, Proposition 1.2, 1.19, Definitions 1.21, 1.23, Theorem 1.25; wagner 2.1, 2.2, 2.4, 2.5, 2.8–2.16, 2.20–2.30, 2.33–2.37, 2.39–2.51, 3.1, 3.3, 3.4, 3.6, 3.7, 3.12–3.17, 3.20–3.22, 3.31–3.34, 4.1–4.3, 4.5–4.19, 4.21–4.25, 4.27–4.36; borger Corollary 5.4, Theorem 9.2, Corollary 9.4, §§1.16–1.18; bhatt-scholze Remark 2.27, Lemma 2.28, Lemma 2.11, Theorem 15.3, Constructions 16.19–16.20, Theorem 16.22; wagner-habiro §1.22(e), §2.7, Theorem 2.9 proof; pridham Definitions 1.22, 2.1, Lemma 2.9; scholze §3; langer-zink Proposition 1.3, Lemma 1.5. All cited statements support the targets at the stated generality (nonunital coefficients, arbitrary Λ-bases, perfectly covered bases where stated).

Pinned declarations grepped at the pins (31): all 17 `WittVector`/`TruncatedWittVector` names, `Algebra.TensorProduct.includeRight`, `Algebra.Etale`, `Algebra.FormallyEtale`, `KaehlerDifferential.D`, `KaehlerDifferential.linearMapEquivDerivation`, `PowerSeries.coeff`, `PowerSeries.constantCoeff`, the six cyclotomic lemmas with the hypotheses as described at `README.md:38-40`, `WittVector.isAdicComplete_span_p_teichmuller`, `TauCeti.WittVector.continuous_frobenius`, `continuous_frobeniusEquiv_symm`, `TauCeti.kaehlerBasisOfFormallyEtale`, `_apply` (hypotheses as described at `README.md:44`).

Supplier sections checked on main (17): DerivedModuleAlgebra §§0.K.1, 0.2, 1.1–1.9 (Koszul with homotopy; radical invariance; Nakayama; bounded-torsion ordinary comparison for principal ideals; complete flatness; complete faithfully flat descent); DGAInfinity Layers 0–1 (cochain DG algebras over a commutative ground ring); EnhancedDerivedSheaves §0.3 and E5:abstract; SchemeAndStackFoundations §§0.23a, 0.24, 0.29, 4.1. Duplication grep of main and of Mathlib/Tau Ceti for big Witt, Λ-rings, δ-rings, q-Witt, Jackson derivatives, Dwork and arithmetic fracture: no owner elsewhere (BordismFormalGroups' chromatic fracture is a different object).

Declared gaps: all seven are precise and declared in both files; apart from R01 none asks for something provided; `gap:ordinary-derham` correctly restricts the étale-extension contract to graded-commutative strictly alternating algebras (the §7.7 noncentral counterexample is correct).

## Not verifiable

- Lean elaboration. The brief allows no Lean command, and `reports/PKG-QWittVectors.md:142` states the file was never compiled. Specific risks for the proved examples: `norm_num` closing `(2 : ZMod 2) * 1 = 0` and `(1 : ZMod 2) ≠ 0` at `Suggested.lean:114`, and `decide` evaluating `Nat.divisors 6` at `Suggested.lean:99`. The build gate must confirm.
- The supplier sections named by the gaps (HabiroCyclotomicCompletions, DerivedDeRhamCohomology, PrismaticCohomology) are neither on main nor in the open pull-request checkouts; the gaps are contracts and were checked only for precision and minimality.
- Wagner Corollary 3.33 (étale sheaf property, used by §7.7 `differential_etaleDescent`) was read only in statement and proof outline.
- Borger Theorem 9.2 is stated for a general E-typical Witt functor; its specialization to the big Witt functor of §1.6 was taken from wagner Remark 2.49.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "c5fd3cd2a89e3209819240e33e83f7b0b8d9d898", "job": "RT-QWittVectors~1b", "model": "fable", "worker": "chris-g"} -->
