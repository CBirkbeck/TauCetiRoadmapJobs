<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/39#issuecomment-6306700460 -->
Review (claude) of e288743

Verdict: accepted
Conditional on the announced gaps: `cyclotomic-contract`, `ordinary-derham`, `cohomology-completion`, `prismatic-frobenius`, `pd-presentation`, `dga-bockstein`, `dga-quotient`

1. **F01** (P3) Cite Mathlib's cyclotomic mod-p and expand lemmas inside the cyclotomic gap

   **Location:** `packages/QWittVectors/design/README.md:72` (and the `cyclotomic-contract` entry of `plan.json`): “the radical identity √(p,Φ_d)=√(p,Φ_{pd}) for every d>0 … beyond the polynomial product identities imported from Mathlib.”

   **Claim:** the radical identity and the factorization of Φ_d(q^(p^α)) used in the p-local Chinese remainder clause are supplier work.

   **Witness:** `Mathlib/RingTheory/Polynomial/Cyclotomic/Expand.lean` has `Polynomial.cyclotomic_mul_prime_eq_pow_of_not_dvd` (Φ_{np}=Φ_n^(p−1) over any `CharP R p` ring), `Polynomial.cyclotomic_mul_prime_dvd_eq_pow` (Φ_{np}=Φ_n^p when p∣n), and `Polynomial.cyclotomic_expand_eq_cyclotomic_mul`, `Polynomial.cyclotomic_expand_eq_cyclotomic` (Φ_n(X^p) equals Φ_{np}Φ_n or Φ_{np}).

   These four give, after reduction to 𝔽_p[q], that Φ_{pd} is a power of Φ_d modulo p, which is the whole content of the radical identity, and they give the factor decomposition Φ_d(q^(p^α))=∏_{j≤α}Φ_{dp^j} for p∤d used in the Chinese remainder clause. The gap should ask only for what remains (the m>1 prime-generator identity, the distinct-index quotient, comaximality and the completion-topology consequence).

   **Exact repair:** add the four declarations with their file to the From Mathlib list (line 36), and in both copies of the gap replace the radical clause by “the radical identity √(p,Φ_d)=√(p,Φ_{pd}), deduced from Mathlib's `cyclotomic_mul_prime_eq_pow_of_not_dvd` and `cyclotomic_mul_prime_dvd_eq_pow`, together with the resulting equality of derived completion functors”, and note that the expand lemmas supply the Φ_d(q^(p^α)) factorization. No supplier owner changes.

2. **F02** (P3) Garbled hypothesis sentence in §1.1

   **Location:** `packages/QWittVectors/design/README.md:94`: “R is a commutative ring, possibly without identity n > 0.”

   **Claim:** the hypotheses of `BigWitt.TruncationSet`.

   **Witness:** `plan.json` target 1.1 lists two hypotheses, “R is a commutative ring, possibly without identity” and “n > 0.”, which were joined without punctuation.

   **Exact repair:** write “R is a commutative ring, possibly without identity; n > 0.”

3. **F03** (P3) Line locators missing for Wagner Remarks 2.32 and 2.43 in §2.2

   **Location:** `packages/QWittVectors/design/README.md:258`: “wagner Remarks 2.32 and 2.43; printed … wagner v5 pp. 26, 31”; same in the `plan.json` 2.2 locator.

   **Claim:** the Λ_m-structure remark and the truncated relative universal property support the prime-set construction.

   **Witness:** wagner line 1332 (Remark 2.32, printed p. 26) and wagner line 1556 (Remark 2.43, printed p. 31) state exactly these; every other locator in the design carries its extraction line.

   **Exact repair:** write “wagner Remark 2.32, wagner line 1332; Remark 2.43, wagner line 1556”.

4. **F04** (P3) Section numbering betrays revision history

   **Location:** `packages/QWittVectors/design/README.md:847` (“### 8.2 Framed coordinate automorphisms” opens Layer 8), `:931` (“### 9.2 Framed Frobenius decomposition” opens Layer 9), `:982` (“### 9.4a Product homotopy for framed cochains”).

   **Claim:** sections are numbered `k.n` in build order.

   **Witness:** there is no §8.1 or §9.1, and `9.4a` is an insertion label; the house style asks that a reader cannot tell which parts were revised.

   **Exact repair:** renumber Layer 8 as 8.1–8.4 and Layer 9 as 9.1–9.7 (the homotopy becoming 9.4 and the subsequent sections shifting), consistently in the README headings, “This interface is used by” lines, Dependencies lines and proof routes, and in `plan.json` ids, `prerequisites`, `usedBy`, `neededBy` and the manifest `cited_for` lists. Do this in one pass with the agreement script rerun afterwards; nothing else changes.

5. **F05** (P3) Each gap paragraph states its contract twice

   **Location:** `packages/QWittVectors/design/README.md:72–84`; e.g. line 74 follows the `needs` sentence with “Required over every commutative unital base: Ω* as exterior algebra of Mathlib KaehlerDifferential … with the initial extension property”, and line 76 ends “Required extension: DerivedModuleAlgebra, Part II.” after the same request.

   **Claim:** one precise contract per gap.

   **Witness:** in every one of the seven paragraphs the `needs` sentence is followed by a near-verbatim restatement from the former `detail` field; two copies of one contract can drift (the ordinary-derham copies already differ in wording about the Cartier twist).

   **Exact repair:** keep the `needs` sentence, then only what the restatement adds (the Mathlib/Tau Ceti inputs that are already supplied, the explicit exclusions, and the source locators). Mirror the same trimming in the `detail` fields of `plan.json`.

Reviewed on 2026-10-21. Five findings, none blocking (all P3). Acceptance is conditional on the seven declared supplier gaps (`cyclotomic-contract`, `ordinary-derham`, `cohomology-completion`, `prismatic-frobenius`, `pd-presentation`, `dga-bockstein`, `dga-quotient`), which are contracts with named owners and are not findings. The design files and the source manifest were not changed; no source fetch was needed, since every cited text is in the cache and readable.

## Reconciliation of the round-4 findings

The round-4 review is `packages/QWittVectors/reports/REV-DESIGN-QWittVectors~4.md`; its repair report is `packages/QWittVectors/reports/FIX-DESIGN-QWittVectors~5.md`.

| Round-4 finding | Status | Repaired passage and independent check |
| --- | --- | --- |
| F01 (P1): a closed form need not be fixed coefficientwise by γ | Repaired | `packages/QWittVectors/design/README.md:984`: “Construct a continuous A[[h]]-bilinear map H of total degree −1 such that … αβ−(−1)^(kℓ)βα=d_H H(α,β)+H(d_Hα,β)+(−1)^k H(α,d_Hβ)”. §9.5 (line 1006) now derives graded commutativity from this boundary identity. I recomputed the formula at line 986: in rank 1 all four pairs (a,b), (ae,b), (a,be), (ae,be) satisfy μ₀−μ₁=d_H H+H d_⊗; in rank 2 the pairs (ae₁,be₂) for i=1,2, (a,be₁₂), (ae₁,be₁), (ae₁₂,be₁); in rank 3 the pair (ae₁₂,be₁), where the j≠i contributions cancel exactly by the twisted Leibniz rule hD₃(aγ₂b)=aγ₂(hD₃b)+γ₂γ₃(b)hD₃(a). Each μ_s is a chain map by the two Leibniz forms (checked for j≤s and j>s). All three Checks (line 996–998) compute as stated: (γ_X−id)ω=hXdY, H(dX,ω)=−XYdX, dX·ω+ω·dX=hX dX∧dY=d_H(−XYdX); H(a dT,b dT)=−Tab dT; H(dX∧dY, ZdX+XdZ)=XZ dX∧dY with αβ−βα=hX dX∧dY∧dZ. |
| F02 (P2): étale differential extension stated for noncommutative DGAs | Repaired | `README.md:74`: “for each nonnegative graded-commutative, strictly odd-alternating DG B-algebra P and étale B-algebra map P⁰→S supply the unique B-linear differential on S⊗_{P⁰}P extending d”; `README.md:824` restates `QWitt.differential_etaleDifferential` as the specialization P=Q_mΩ*, B=A[q], S=Q_m(R′/A). The contract is correct in this class: d² on S is a P⁰-linear derivation into (S⊗P)², hence zero by Ω_{S/P⁰}=0; the Leibniz rule for the extended d uses graded commutativity exactly once (moving d(t) past x). The excluded skew square-zero example is Check 4 at line 835, and its contradiction u=(ux)x⁻¹=0 is valid. Layer 8 keeps its skew associative product (line 890). |
| F03 (P2): intake gap sentences omit the hypotheses | Repaired | All seven `needs` sentences (`README.md:72–84`, `plan.json` `gaps`) are self-contained with hypotheses and conclusions; e.g. line 76: “for every possibly unbounded ℤ[q]-cochain complex M, h=q−1 and prime p, if each M^i and H^i(M) has bounded h-power torsion, is p-torsion-free and has mod-p reduction with bounded h-power torsion, with bounds allowed to depend on i …”. `gap:pd-presentation` is split out with §9.7 as its sole consumer and `gap:prismatic-frobenius` serves §9.6 only; the script below confirms slugs, suppliers, `needs` text and `neededBy` agree between the two files. |

Settled items from `FIX-DESIGN-QWittVectors~4.md` are not re-raised: the external supplier contracts (its F01) are now declared gaps, and the merge-position objection (its F02) is disposed of by the gate output below.

## Verified sound

**Principles.** No route-specific shortcut: §9.7 exports Wagner Proposition 4.2 for every smooth A-algebra, every prime and every positive index, and §§10.1–10.2 are stated for all m and all p including 2. No existing roadmap is re-planned: Mathlib's p-typical `WittVector` carriers are imported (§1.5 compares, does not rebuild), characteristic-p perfection is explicitly left to SchemeAndStackFoundations §§0.24, 0.29 (both headings exist), scalar Koszul complexes and completion theory to DerivedModuleAlgebra, DG carriers to DGAInfinity. No copied passages, no algorithms, no `set_option`, no sorry'd data (no Lean file exists yet). Every supplier is earlier in the merge order; no consumer is cited as a supplier.

**Dependency gate.** The prescribed command with the design README:

```text
candidate: QWittVectors is not in the merge order yet; checked as if placed after HabiroCyclotomicCompletions (the intake inserts it when its design is accepted)
depcheck: 3 roadmaps, 12 edges, 0 problem(s)
```

Exit 0, no UPWARD or CYCLE line. The literal invocation with `packages/QWittVectors/README.md` fails with a file-not-found error because the package README does not exist at the design stage; this is expected and not a defect.

**Supplier sections exist and say what is cited.** SchemeAndStackFoundations §0.23a (étale topological invariance), §0.29 (scheme Frobenius, relative Frobenius for étale maps), §4.1 (formally étale lifting, unique lifts for étale); DerivedModuleAlgebra §0.K.1 (finite-sequence Koszul complex via Mathlib's linear-functional interface), §0.2, §§1.1–1.3, §1.5 (bounded-torsion principal completion comparison), §1.7 (complete flatness), §1.8 (bounded torsion and Tor-amplitude), §1.9 (complete faithful-flat descent); DGAInfinity Layers 0–1 (signed graded modules, associative DG algebras, cohomology); EnhancedDerivedSheaves §0.3 (derived tensor, limits, Milnor sequence) and Layer E5:abstract (algebras in monoidal ∞-categories). None of them states the differential-ideal quotient, the regular-parameter DGA Bockstein, the unbounded cochain completion lemma, the exterior de Rham DGA with étale extension, the integral cyclotomic ideal theory or the prismatic Frobenius inputs, so the seven gaps are genuine and correctly owned. All gap `needs` sentences are precise and single-purpose; the only minimality note is R01.

**Pinned declarations.** Tau Ceti at `a91d3aaf…` (read on GitHub): `WittVector.isAdicComplete_span_p_teichmuller` is an instance with `[CharP R p] [PerfectRing R p] (ϖ : R) [IsAdicComplete (span {ϖ}) R]` in `TauCeti/RingTheory/WittVector/Complete.lean`; `TauCeti.WittVector.continuous_frobenius` and `continuous_frobeniusEquiv_symm` take `IsAdic (span {p, teichmuller p ϖ})`, the latter also `[PerfectRing R p]`, in `TauCeti/RingTheory/WittVector/Frobenius.lean`; `TauCeti.explicitBockstein1 : H1 G (ZMod 2) →+ H2 G (ZMod 2)` in `TauCeti/RepresentationTheory/Homological/ContCohomology/Bockstein/Basic.lean`; `TauCeti.kaehlerBasisOfFormallyEtale` and `_apply` in `TauCeti/RingTheory/Kaehler/FormallyEtale.lean`. The README's descriptions of their hypotheses (line 40, line 11) are accurate. Mathlib: all 24 names cited in lines 31–36 exist in `Mathlib/RingTheory/WittVector/{Defs,Basic,Truncated,Frobenius,Verschiebung,Teichmuller}.lean`, `TensorProduct/Basic.lean`, `Etale/Basic.lean`, `Kaehler/Basic.lean`, `PowerSeries/Basic.lean` and `Polynomial/Cyclotomic/Basic.lean`, with the hypotheses stated (`frobeniusEquiv` needs `PerfectRing`, `frobenius_eq_map_frobenius` needs `CharP`).

**Duplication audit by object.** Searched Mathlib and Tau Ceti for big Witt vectors, Λ-rings, Adams operations, q-Witt vectors, Jackson derivatives, q-de Rham complexes and exterior de Rham complexes: none exists (Mathlib has only p-typical Witt vectors and `Mathlib/RingTheory/Perfectoid/BDeRham.lean`, unrelated; Tau Ceti mentions λ-rings only in a reference in `TauCeti/RingTheory/Binomial.lean`). Searched every README under `TauCetiRoadmap/` and `Completed/` on main, the board packages and the two open heads (ArithmeticDynamics, ErdosProgressionPowers) for big Witt, Λ-ring, q-Witt, q-de Rham, q-Hodge: the only hit outside this design is a passing mention in ClassicalArithmeticCompletion, which states no such object. Mathlib's cyclotomic product identities are already imported (line 36); the mod-p and expand lemmas are R01.

**README and plan agreement.** A script over both files: 53 targets, 165 API clauses, 161 Checks; every target name, API name and `### k.n` heading appears in the README; every `target:` prerequisite is strictly earlier; every definition and construction (28) has at least three Checks; every `gap:` prerequisite is declared, each declared gap's `neededBy` equals its set of consumers, and slug, supplier and `needs` text agree between the files. No LaTeX delimiters, pull-request numbers, machine paths, process words or `lemma` as a Lean keyword.

**Seeded source sample (15 of 15 pass).** Printed pages are those of the recorded arXiv versions.

| Target | Locator read | Result |
| --- | --- | --- |
| 1.1 Truncation sets | hesselholt lines 217–268 (Lemma 1.1 at 223, Prop. 1.2 at 268, pp. 6–7); wagner lines 432–440 (§2.6, p. 10) | Divisor-closed S, nonunital R, ghost polynomial w_n=∑_{e|n}e·a_e^(n/e) as stated. |
| 1.7 Koszul of commuting endomorphisms | wagner lines 602–619 (Remark 2.16, pp. 13–14); lines 2847–2857 (§4.7, p. 57) | Koszul complex of commuting endomorphisms with the Koszul sign rule; the design adds the module bridge, as claimed. |
| 2.2 Prime sets | borger lines 603–638 (§§1.16–1.18, pp. 12–13); pridham lines 506–513 (Def. 2.1, p. 12); wagner lines 1332–1336 (Remark 2.32), 1556–1559 (Remark 2.43) | Λ_P-rings as coalgebras, free objects by adjoint, Λ_m suffices for Div(m). Lines missing in the locator: R03. |
| 2.3 Arithmetic perfection | wagner lines 1621–1643 (Remark 2.47 and footnote 2.3, p. 32); bhatt-scholze line 775 (Remark 2.27, p. 20) | Colimit perfection along Adams operations; universal property as stated. |
| 2.5 Relative perfection | wagner lines 1573–1582 (§2.45), 1626–1628 (Remark 2.47) | Linearized ψ_{p/A}: R⊗_{A,ψ_p}A→R, r⊗a↦ψ_p(r)a; relative perfection for all primes. |
| 3.1 Absolute q-FV systems | wagner lines 475–482 (Def. 2.8, p. 11), 546–551 (Remark 2.12) | ℤ[q]-algebra F, ℤ[q]-linear V, FV=m/d, VF=[m/d]_{q^d}, nonunital R, truncated variants. |
| 3.2 Absolute q-Witt rings | wagner lines 483–507 (Lemma 2.9, Def. 2.10, Remark 2.11) | Ideal generators (q^d−1)V_{m/d} and [d/e]_{q^e}V_{m/d}−V_{m/e}F_{d/e}; Q_1=R. |
| 3.7 Witt injectivity | wagner lines 1194–1219 (Prop. 2.28, Cor. 2.29, Lemma 2.30), 1258–1311 | Injectivity for all nonunital R, kernel exactness, p-local decomposition with twist q↦q^d. |
| 5.2 Étale ghost pushouts | wagner lines 1715–1730 (Cor. 2.51, p. 34) | Pushout in both senses for étale R→R′ and all d|m; reduction to d=m as in the proof route. |
| 5.4 Finite type | wagner lines 1485–1495 (Cor. 2.39, p. 29), 1588–1618 (Lemma 2.46 proof) | Finite type over ℤ[q]/(q^m−1), monomial subring finiteness, polynomial image for every Λ-ring A (I checked the cokernel of the image is torsion-free, so the tensor description is exact). |
| 6.1 Completed étale Frobenius | wagner-habiro lines 645–658 (§2.7, pp. 15–16) | Standing perfectly covered A (line 646), étale R (line 647), unique Frobenius lift and linearized equivalence checked mod p; completions static. |
| 7.4 Prime Verschiebung identities | wagner lines 1849–1874 (§3.3, Lemma 3.4, p. 38); langer-zink lines 601–644 (Lemma 1.5, pp. 19–20) | dV_p(x^p)=V_p(x^(p−1))dV_p(x) by the three-step V-only argument; γ_p with pγ_p(v)=v^p on im V_p. |
| 7.7 Differential base change | wagner lines 2044–2050 (Lemma 3.16, p. 42), 2552–2572 (Prop. 3.31, Lemma 3.32, pp. 50–51) | Λ-base change and étale base change as stated; the design's narrowing of Lemma 3.32 to graded-commutative P is the correct scope. |
| 8.3 Jackson derivatives | wagner lines 2842–2859 (§§4.7–4.8, p. 57); scholze lines 290–305 (§3, p. 6) | hT_iD_i=γ_i−id, twisted Leibniz D_i(fg)=fD_i(g)+γ_i(g)D_i(f), [n]_q T^(n−1). |
| 9.6 Simultaneous induction | wagner lines 2690–2720 (Props. 4.1–4.2, §4.3), 2756–2808 (Lemma 4.5 and (d)⇒(a)), 3278–3282 (Thm. 4.27), 3341–3362 (Lemma 4.29), 3584–3608 ((c)⇒(d)) | The four assertions and the implication chain match; (c) is an equivalence, (d) is for polynomial R, p-torsion-freeness of A derived from perfect coverage. |

Also read against the design: hesselholt 811–827 (Thm. 1.25) and borger 1323 for §1.6; wagner 552–580 (§2.13) for §3.3; 1006–1020, 1083–1130, 1150–1190 (Cors. 2.20, 2.24, 2.26, Lemma 2.27) for §§3.5–3.6; 1420–1468 (Cor. 2.35, Prop. 2.36, Cor. 2.37) for §4.1; 1513–1552 (Lemma 2.41) for §4.3; 1651–1712 (Prop. 2.48, Lemma 2.50) for §5.1; 1822–1838, 1893–1929 (Defs. 3.1, 3.6, Lemma 3.7) for §§7.1, 7.3; 1956–1985 (Prop. 3.12) for §7.2; 2011–2041 (§3.15) for §7.6; 2053 (Prop. 3.17) for §7.5; 2858–2872, 2882–2920, 3292–3300 for §§8.4–8.5, 9.2; 2948–3012 (Lemmas 4.13–4.15) for §9.3; 3022–3032, 3178–3196 for §9.4; 3033–3052 (Lemma 4.17) for §9.4a; 2692–2702, 3492–3520, 3645–3654 (Prop. 4.2, §4.34, Lemma 4.36) for §9.7; 2690, 2810–2822 for Layer 10; 305–335 (Lemmas 2.1–2.2), 3198–3227 (Lemma 4.25), 3455–3474 (Lemma 4.32), 3584–3608 and wagner-habiro 493–498 for the gaps. All support the statements with the stated hypotheses. The design corrects two source infelicities rather than copying them: Lemma 3.7's display (the proof gives dF_n=nF_nd) and Lemma 4.13's tensor (over S_α, not over ℤ_p[[h]]).

**Adversarial pass.** Statement, instances tried, result, change.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions | n=0,1,2; q=1; zero ring; Laurent frame; p=2 | [0]_q=0, [2]_q=1+q; q unit in A[[h]]; ordered-wedge and Bockstein signs pinned by Checks in §§1.7, 9.4 | None |
| 1.1 | ∅, {1}, {2}, Div(6) | {2} not divisor closed; w₆ correct | R02 (wording) |
| 1.2 | ℤ with φ₂=id, 𝔽₂, ∅; infinite S with all n units | (0,1) over 𝔽₂ has zero ghosts; bijectivity recursion is well founded for infinite S | None |
| 1.3 | τ(1)+τ(1), W_∅, W_S(0), zero-product ℤ | Coordinates (2,−1) recomputed from ghosts (2,2); nonunital case via unitization kernel | None |
| 1.4 | F₂V₂, gcd formula at a=b and coprime, τ(−1) | τ(−1)=(−1,0), −τ(1)+V₂τ(1) has ghost (−1,1): equal | None |
| 1.5 | p=2,a=1; p=3,a=2; length 0 | Ghost x₀⁹+3x₁³+9x₂; length 0 is the zero ring | None |
| 1.6 | S=∅, S={1}, coprime 2,3; infinite S | Finite S retained as in Hesselholt 1.25; Borger 5.4 for the composite | None |
| 1.7 | r=0,1,2; M=0; noncommuting pair | d²(u₁)=u₁⊗e₁∧e₂ recomputed; d¹(a,b)=D₁b−D₂a | None |
| 1.8 | N=1,2; M=ℤ, ℤ[1/2]; ℓ≠p on p-complete objects | M^∧_p[1/N]=M^∧_p[1/p] since ℓ acts invertibly on derived p-complete objects | None |
| 2.1 | ℤ, toric ℤ[T], identity Adams on 𝔽₂ | δ₂(2)=−1≠0 in 𝔽₂ excludes the torsion ring | None |
| 2.2 | P=∅, {2}; empty generator set; faithful flatness of ψ on free rings | Free Λ-rings perfectly covered per wagner-habiro 1.22(e) | R03 (locator) |
| 2.3 | ℤ, ℤ[T], perfect A | Rational exponents; T has no ψ₂-preimage | None |
| 2.4 | ℤ[T] (ψ₂ basis 1,T), ℤ[ε]/ε² with ψ_n(ε)=nε | ψ₂ mod 2 sends ε to 0 on a nonzero target, not flat; equivalences (i)⇔(ii)⇔(iii) verified via footnote 2.3 and injective transition maps | None |
| 2.5 | R=A nonperfect; ℤ[T]/ℤ; perfect R over ℤ | ofPerfect: twist trivialized by ψ_p⁻¹ on A | None |
| 3.1 | R=ℤ, zero ring, V₂=2 | VF=1+q fails for V₂=2 | None |
| 3.2 | Q₁, Q₂(ℤ), q=1 | V₂(1)=[2]_q, F₂(1+q)=2 | None |
| 3.3 | m=1,2; V₂(1); reduction q↦1 | Prime V-images generate the same ideal as all proper V-images | None |
| 3.4 | m=6 (both maps), m=1, m=2^a | Deletion sign rule reproduces x↦(−V₃x,V₂x) then (a,b)↦V₂a+V₃b; composite zero | None |
| 3.5 | ℤ,m=2 joint ghosts; 𝔽₂,m=2 | a+bq↦(a−b,a+b) injective; V₂(1) killed by ghosts over 𝔽₂ | None |
| 3.6 | m=1; static R̂_p; bounded torsion | Hypotheses match Cors. 2.24, 2.26 exactly | None |
| 3.7 | R=0, 𝔽₂; m=1; p-local twist | Twist is q↦q^d per Lemma 2.30 | None |
| 4.1 | ℤ,m=2; toric ℤ[T] image; m=1 | Image ℤ[T²,q]+(1+q)ℤ[T,q] recomputed from Prop. 2.36 | None |
| 4.2 | R=A, R=0, toric scalar | F fixes right scalars (A[q]-linear) | None |
| 4.3 | Dual-number detector, A=ℤ[T], R=A[X], m=2 | Ring-map property (cross terms divisible by 4) and values ε, 0 recomputed | None |
| 4.4 | Toric A=R=ℤ[T], m=d=2; m=1 | a⊗1=1⊗ψ_m(a) gives T² both ways; reversed formula would give T⁴=T | None |
| 4.5 | A′=A, A′=0; torsion A | polynomial_image exact for torsion A: cokernel of the image in A[T,q]/(q^m−1) is ⊕ℤ[q]/([e]_{q^(m/e)}), torsion-free | None |
| 4.6 | R=A; toric ℤ[T]/ℤ; A=ℤ with torsion R | Existence separated from isomorphism hypotheses | None |
| 5.1 | R′=R; m=1; nonflat quotient | Ordinary=derived by flatness of étale leg | None |
| 5.2 | m=d=1; R=A; R′=R/(x) | Non-étale quotient excluded | None |
| 5.3 | R=A, m=1; A=ℤ; p invertible | Zero completions allowed | None |
| 5.4 | r=0,1; m=2; infinitely many variables | Rank m at r=0; no Noetherian claim for infinite variables | None |
| 6.1 | R=A; ℤ×ℤ at p=2; ℤ[T]/ℤ | Only the identity lift reduces to Frobenius on 𝔽₂×𝔽₂; polynomial lift not an equivalence mod 2 | None |
| 6.2 | (p,d)=(2,1),(3,1); R=0,A | Φ₃≡(q−1)² mod 3; radicals equal, ideals differ | None |
| 6.3 | m=p,d=1; A=R=ℤ,p=2 | q fixed, not q² | None |
| 7.1 | Ω*_{A[T]/A}; 𝔽₂ with u²≠0; ℤ[u]/(u²), |u|=2; ideal (T) | Even squares may vanish; (T) not d-stable | None |
| 7.2 | m=1; R=A; R=0; characteristic 2 | Degree zero preserved; strict alternation at 2 | None |
| 7.3 | m=2,3 Teichmüller forms; m=1 | dF_n=nF_nd from the proof, not the misprinted display | None |
| 7.4 | p=2; x=0; first ghost | p^(p−2)=1 at p=2; (V₂x)²=2V₂(x²) | None |
| 7.5 | θ₂τ₂(T), θ₂(τ₂(T)²), V_ℓ relations | pθ_pV_ℓ=dF_pV_ℓ and ℓθ_pV_ℓ=V_ℓθ_p consistent with V_ℓd=ℓdV_ℓ and dF_p=pF_pd | None |
| 7.6 | V₂(T), V₂(dT); differentialGhost_F on V_nη and dτ_m(r) | n^(i+1) coefficient; n^i gh(F_nω)=gh(ω) checked on both generators | None |
| 7.7 | A′=A; m=1; Laurent localization; skew square-zero DGA | d(T⁻¹)=−T⁻²dT; skew example excluded by the scoped contract | None |
| 8.2 | T²; r=0; polynomial q | hT_i regular by flatness of the frame | None |
| 8.3 | n=0,2,3; characteristic 2 at q=1; T⁻¹ | D(T⁻¹)=−q⁻¹T⁻² recomputed from γ(T⁻¹)=q⁻¹T⁻¹ | None |
| 8.4 | T², r=0, dT·T; Leibniz for the skew product | Leibniz verified from the twisted rule; j∈I terms vanish by e_j∧e_I=0 | None |
| 8.5 | p=2 on h, dT, d_H(T); φγ_i=γ_iφ; DGA property for the skew product | φ(dT_i·f)=φ(dT_i)φ(f) uses commutation with γ_i | None |
| 9.2 | r=1,p=2,α=1 bases; α=0; r=0 | One-form basis T dT (v=0), dT (v=1) | None |
| 9.3 | p=2,α=1,e=0; e=α; tensor over S_α vs ℤ_p[[h]] | H⁰=(h+2)S_α, H¹=S_α/(h); tensor must be over S_α (ranks 2^n) | None |
| 9.4 | β₁(T); r=0; β₂([T²]) | T dT not a boundary mod h(h+2) (set h=0) | None |
| 9.4a | Ranks 1–3, all basis pairs listed above; closed inputs of degrees 1 and 2 | Identity holds; Checks recomputed | None |
| 9.5 | m=1; T² versus T at m=2; r=0 | Commutativity on cohomology only; torsion-freeness gives odd squares zero at 2 | None |
| 9.6 | α=0; R=A[T],p=2; im V_p alone | Base case is Ω*; dV_p needed in the kernel | None |
| 9.7 | m=1; p=2,m=6 twists ψ₂,ψ₆; p=3,m=2 CRT; tensor over C_α | Lemma 4.36 holds for every A-algebra R; ψ_d factors through C_α so ordinary tensors over A[q] and C_α agree | None |
| 10.1 | R=A; m=1; ℤ[x]/(x²) | x dx is 2-torsion in the singular case | None |
| 10.2 | m=1; R=A,m=2; polynomial over ℤ | (q−1)(q+1)=0 compatible with ℤ-torsion-freeness | None |
| gap:cyclotomic-contract | m=1 excluded; m=6, 12, 30 for the prime-generator identity; (a,b)=(2,4),(3,6),(5,10); p∣d radicals | Ideal identity verified at m=30 by checking all residue characteristics; distinct-index quotient 𝔽_p[q]/Φ_min by the norm argument; radical identity from Φ_{pd}≡Φ_d^k mod p | R01 (cite Mathlib) |
| gap:ordinary-derham | r=0; characteristic 2; nonperfect base; skew DGA | Extension exists and is unique in the graded-commutative class (d² is a P⁰-linear derivation); skew example excluded | None |
| gap:cohomology-completion | Zero complex; unbounded degrees; p-torsion | Matches Lemma 4.25 conditions (a)–(c) with degree-dependent bounds | None |
| gap:prismatic-frobenius | α=0 (empty décalage product); p=2; D/I=Â_p[ζ_p] | Direction φ^*Δ≃Lη_IΔ as in Bhatt–Scholze 15.3; (p,[p]_q) and (p,h) have equal radicals | None |
| gap:pd-presentation | R=A; polynomial R | Matches §4.34 | None |
| gap:dga-bockstein | f=g=h; f=h²,g=h | For dx=gy, d(ax)=fy so Fβ_f V[x]=[y]=β_g[x] | None |
| gap:dga-quotient | J=0, P, (T), (T,dT) | (T) not differential; quotient keeps graded commutativity | None |

## Not verifiable

- **Lean elaboration:** not available. The design has no `Suggested.lean`, so no elaboration, example or `#check` outcome can be certified; the Lean form will be checked at the package stage.
- **Mathlib at the exact pin.** The cited Mathlib names were verified in a local checkout at a different commit (all are longstanding declarations from 2020–2022 files), not at `6b7abb3c…`; the Tau Ceti names were verified at the exact pin on GitHub.
- **Supplier texts without a roadmap on main.** HabiroCyclotomicCompletions, DerivedDeRhamCohomology and PrismaticCohomology have no README on main or on the board; their interfaces are declared gaps, which are contracts, so nothing was checked against supplier text. The consumer roadmaps named in Scope and Downstream consumers (HabiroRings, HabiroCohomologyFoundations and its Part II, RefinedTraceMethods) do not exist on main, the board or the merge order; they are consumers, not suppliers, and the names come from the triage report `packages/QWittVectors/reports/TARGET-QWittVectors.md`.
- **The author's 5,268 polynomial specializations of the product homotopy** (claimed in the repair report) were not rerun; the identity was instead re-derived by hand in ranks 1–3 as recorded above.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "e288743fca5f2436fc051f922291fecdfcf00a40", "job": "REV-DESIGN-QWittVectors~5", "model": "fable", "worker": "chris-f"} -->
