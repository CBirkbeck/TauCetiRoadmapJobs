<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13121#issuecomment-6898644427 -->
Red team round 1 pass b (claude) of b83e78b

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) Layer 3 Examples: `TC_1(k[t],(t))` is zero, not `W(k)`

   **Location.** `packages/RefinedTraceMethodsPartII/README.md:453`: "the kernel of φ − can is
   `lim_R W_{v+1}(k) = W(k) ≠ 0`. So the relative TC of the non-henselian pair `(k[t],(t))` is nonzero
   in degree 1".

   **Claim.** For a perfect field k, relative TC of `(k[t],(t))` has a nonzero group `W(k)` in degree 1.

   **Witness.** `TC_1(k[t];ℤ_p) = 0`: its motivic graded pieces (PrismaticCohomologyPartIII §7.0) are
   `H¹(ℤ_p(1)(k[t])) = (k[t]^×)^∧_p = (k^×)^∧_p = 0` (k^× is uniquely p-divisible) and
   `H³(ℤ_p(2)(k[t])) = H¹_ét(WΩ²_log) = 0` (Ω²_{k[t]} = 0); `H^{2i−1}(ℤ_p(i)) = 0` for i = 0 and
   i ≥ 3. Also `TC_1(k) = TC_2(k) = 0`, so the relative group is 0. Second route: `TR_2 = WΩ²_{k[t]} = 0`
   and `ker(1 − F | WΩ¹_{k[t]}) = lim_n k[t]^×/p^n = 0`.

   The error is the step `TC^-(m′) = ∏_v X_v^{hT}`: `THH(k[t]) = ⊕_m THH(k) ⊗ (T/C_m)_+` is a sum of
   pieces of connectivity 0, so the product decomposition of §2.3 (fourth bullet, which requires
   connectivity tending to infinity) does not hold. The example contradicts §2.3 of the same README.

   **Repair.** Replace the paragraph under `### Examples` of Layer 3 by:

   > For a perfect field k, `THH(k[t]) ≃ ⊕_{m≥0} THH(k) ⊗ (T/C_m)_+` is a sum of pieces whose
   > connectivity is 0 for every m, so the convergence statement of §2.3 does not apply: `TC^-(k[t])` is
   > not the product of the `(THH(k) ⊗ (T/C_m)_+)^{hT}`, and the staircase lemma cannot be run weight by
   > weight. Reading the sum as a product gives a wrong answer. In degree 1 the weights p^v would have
   > `A_v = W_{v+1}(k)`, `B_v = W_v(k)`, φ an isomorphism and can the restriction, hence kernel
   > `lim_R W_{v+1}(k) = W(k)`; but `TC_1(k[t];ℤ_p) = 0`, because `H¹(ℤ_p(1)(k[t])) = (k^×)^∧_p = 0` and
   > `H³(ℤ_p(2)(k[t])) = 0` (PrismaticCohomologyPartIII §7.0). The pair `(k[t],(t))` still shows that
   > relative K is not relative TC without the hypotheses of Layer 4: `K_{−1}(k[t],(t)) = 0`, while
   > through `gr^0TC = ℤ_p(0)` (§8.2 Checks) `TC_{−1}(k[t];ℤ_p) = coker(1 − F : W(k[t]) → W(k[t]))`,
   > which for k = 𝔽_p contains the class of the Teichmüller lift of t, not in the image of
   > `TC_{−1}(𝔽_p) = ℤ_p`: modulo p, `t − c` is never `a − a^p` (compare degrees).

   Tested on the refuting instance k = 𝔽_p: degree 1 gives 0 on both sides of the new text; degree −1
   gives `𝔽_p[t]/(a − a^p) ∋ t ≠ const`, nonzero. Add `PrismaticCohomologyPartIII §7.0` to the
   Layer 3 Dependencies line (it is already a supplier of Layers 7 and 9).

2. **F02** (P3) `K_1(A_d,I_d) = 0` is attributed to Milnor's sequence and to a locator that do not give it

   **Location.** `packages/RefinedTraceMethodsPartII/README.md:506`: "Milnor's Mayer–Vietoris sequence
   gives `K_1(A_d) = k^×`, so `K_1(A_d,I_d) = 0`"; line 474: "`K_1(A_2,B_2,I_2) = 0` … (Dennis–Krusemeyer,
   hesselholt-axes line 31)"; used as the witness at line 556.

   **Claim.** Milnor's sequence yields `K_1(A_d) = k^×`; hesselholt-axes line 31 supports the K_1 value.

   **Witness.** Milnor's sequence starts `K_1(A) → K_1(k) ⊕ K_1(B) → K_1(k^d)` and is not exact on the
   left (k → k^d is not surjective; that failure is `K_2(A_d,B_d,I_d) ≠ 0`, line 474). It gives only the
   image `k^×`. hesselholt-axes line 31 speaks of `K_2(A,I)` alone.

   **Repair.** Line 506: "For a field k and d ≥ 2, Milnor's Mayer–Vietoris sequence shows that the image
   of `K_1(A_d)` in `K_1(k) ⊕ K_1(B_d)` is `k^×` and that `K_0(A_d,I_d) = 0`. That the kernel
   `K_1(A_d,I_d)` vanishes is not a consequence of that sequence: for a perfect field of positive
   characteristic it is the case q = 1 of §5.3 and in characteristic 0 of §5.4 (every term carries the
   factor `cyc_d(1) = 0` or an empty index set). These are the values in degrees 1 and 0 that Layer 5
   reproduces." Line 536: replace "This agrees with Milnor's Mayer–Vietoris computation of Layer 4
   (Examples)" by "This is the value that Layer 4 (Examples) expects in degree 1". Line 474: drop "`K_1(A_2,B_2,I_2) = 0` and".
   Line 556: replace the K_1 witness by the one that needs no K_1 input: "The printed version is an
   infinite product for every r (for m′ > 2r, t_ev = 0 and the index 0 ≤ v ≤ 0 keeps one copy of
   `k^{cyc_d(s′)}`), against the finiteness stated at speirs-axes line 69 and against Proposition 28
   (line 982), where the v = 0 term is nonzero only in degrees 2r + 1 ≥ m′." Tested: d = 3, r = 0,
   m′ = 3, 5, 7, … each contribute `k^{cyc_3(m′)} ≠ 0` in the printed formula; the README formula gives
   the empty product.

3. **F03** (P3) the conductor bullet restates a pinned Mathlib theorem

   **Location.** `packages/RefinedTraceMethodsPartII/README.md:167`: "*Conductor.* For coprime a, b ≥ 2,
   the least c such that every m ≥ c is a nonnegative combination of a and b is `(a−1)(b−1)`".

   **Claim.** A target of §1.1.

   **Witness.** `frobeniusNumber_pair` (Mathlib/NumberTheory/FrobeniusNumber.lean:59, at the pin):
   `Coprime m n → 1 < m → 1 < n → FrobeniusNumber (m * n - m - n) {m, n}`; `ab − a − b + 1 = (a−1)(b−1)`.

   **Repair.** Replace the bullet by: "*Conductor.* For coprime a, b ≥ 2 the largest integer that is not
   a nonnegative combination of a and b is `ab − a − b`: Mathlib's `frobeniusNumber_pair`. So every
   m ≥ `(a−1)(b−1)` is such a combination and `(a−1)(b−1) − 1` is not (hesselholt-cusp-polytopes
   Remark 1.5, line 373)." Add `frobeniusNumber_pair` (Mathlib/NumberTheory/FrobeniusNumber.lean) to
   "From Mathlib" and to the §1.1 `*Needs:*` line. Tested on (2,3): 6 − 5 = 1 is not representable,
   2 = (2−1)(3−1) and every larger integer is.

Three findings: one P1 (a worked example whose value is false) and two P3. No finding re-raises a
settled one (no repair report marks a finding `not actionable in this package`).

## The adversarial pass: record

Suggested.lean (namespace `TauCetiRoadmap.RefinedTraceMethodsPartII`, no `variable` block, no
instance context; every binder is in the signature).

| Declaration | Instances tried | Left / right | Result |
|---|---|---|---|
| `cuspCount a b m` | (2,3,m), m = 1..13 | 0,0,0,0,1,0,1,1,1,1,2,1,2 | agrees with README ℓ; for a, b ≥ 1 the bound i, j ≤ m loses no pair |
| `cuspTruncationSet` | (2,3,0), (2,3,1), (2,5,0) | {1,2,3,4,6}; {1..10,12}; {1,2,3,4,5,6,8,10} | as README Checks |
| `cuspCoprimeSet` | (2,3,0..2), (2,5,0) | {1}; {1,5,7}; {1,5,7,11,13}; {1,3} | as README Checks |
| `ncard_cuspTruncationSet` | (2,3,0): 2·5+2 = 12 = 3·4; (2,3,1): 24 = 12+12; (2,5,0): 18 = 3·6; general: #{ℓ=0} = (ab+a+b−1)/2, #{ℓ=r} = ab for r ≥ 1 (recomputed); a = 1: 2(r+1)b + 2 = 2(b+1) + 2rb | equal | true; (a+1)(b+1) even since a, b not both even. Note: holds also for a = 1 (the hypothesis 2 ≤ a is the source's, not needed) |
| `ncard_cuspCoprimeSet` | (2,3,0): 2 = 1·1·2; (2,3,1): 6 = 3·2; (2,3,2): 10 = 5·2; (2,5,0): 4 = 1·4; general: each level removes a+b−1 multiples (recomputed) | equal | true; ℕ-subtraction safe under a, b ≥ 2 |
| `card_noCyclicRepetition` | m = 1 (finRotate 1 = id): 0 = (d−1) − (d−1); m = 2: d(d−1) = (d−1)² + (d−1); d = 0: 0 = (−1)^m − (−1)^m; d = 1: 0 = 0; d = 3, m = 3, 4, 6: 6, 18, 66; m = 0 excluded (1 ≠ d) | equal | true as typed |

Elaborated signatures: no Lean was run in this pass (read-only); the six elaborated types in the
worker's `signatures.md` were compared with the README statements of §1.1 and §1.4 and agree; nothing
changed. One-tactic probe (by reading): none of the three theorems follows from one tactic or one
library lemma (Mathlib has `frobeniusNumber_pair` but neither count; no chromatic polynomial of a
cycle). No padding found. Headline theorems (README Summary): Hesselholt §5.2, Speirs §§5.3–5.4,
Hesselholt–Nikolaus §6.2, Riggenbach §7.2, Antieau–Krause–Nikolaus §§9.2–9.6, Layer 8; each is
named in the module docstring as not statable with the missing carrier, and none is statable at the
pins (no K-theory, THH, big Witt vectors, syntomic complexes).

README targets (values computed in this pass).

| Statement | Instances | Values | Result |
|---|---|---|---|
| §1.1 Lemma bullets, `#(S/a)`, `#(S/b)`, `#(S/ab)` | ℓ(ak) = ⌈k/b⌉ − 1 | (r+1)b, (r+1)a, r+1 | true |
| §1.2 kernel of restriction | S={1,2}, n=2, 𝔽_2; S={1..4}, n=2 | 2 = 2; T={1,3}, 4 elements | true |
| §1.3 h = s_T(m′) | (2,3,0,2): 1,0,0; (2,3,0,5): 1; (2,3,1,5): 2,1; (2,3,1,3): 1,1,1 | sums 1, 1, 3, 3 = #T | true |
| §1.4 Möbius, c_{d−1}, t_ev/t_od | cyc_3(2..6) = 3,2,3,6,9; cyc_2(s) = [s=2]; (2,1,3): t_od=1, t_ev=0 | as stated | true |
| §1.5 ε-sum, B | Σε = (in−1) − (i−1); ℤ/4: B = 12; 𝔽_2[z]/z³, e=3: B = 4; n ≤ e: p²n/((p−1)e) | as stated | true; matches akn24 line 2075 |
| Pinned witnesses | (1−t)^{−2} = 1+2t+3t²; (1−2t)^{−1}(1+t²)^{−1} = 1+2t+3t²; ghost (2,2) | equal | true |
| §2.1, §2.2 Checks | ranks e vs e+1; Π_2 weight 2, d = ⌊1/2⌋ = 0 | as stated | true |
| §2.3 negative control | k = ℚ[β^{±1}], Π_2, m = 2j+1 | π_0X_m ⊇ ℚβ^{−j}; sum ≠ product | true |
| §2.5 homology of B(ω) | three cases | degrees m−1, m; RP²(i): R/2, R[2] | matches speirs-axes lines 426–464 |
| §2.6 total cofibre | (2,3), m = 1, 6 | ℤ⊗T_+; ℤ →(3,2) ℤ² →(2,−3) ℤ exact | true |
| §3.1–§3.3 Checks | C_{p+}; S⁰; S⁰ ∨ EC_{p+}; Thom spectrum of C(1) | 0 = 0; id; ℤ/p → (ℤ/p)²; cells 2,4 joined by η vs split | true |
| §3.4 tower | 𝔽_p: π_0 hC_{p^n} = ℤ/p^{n+1}, π_{−2} = ℤ/p^n, tC_{p^n}: ℤ/p^n; n = 0: R[u] | as stated | true |
| §3.5 staircase | s = 0, s = 1, s = 2, all-zero maps | kernel A_0, A_0, A_1; ∏ℤ/p | true |
| §3.6 bound | fibre of φ_p in degrees ≤ −3; B of dimension N | iso for j ≥ N−1 ⊇ j ≥ N; N = 3: π_1 source 0, target π_{−2} ≠ 0 | true |
| Layer 3 Examples | k perfect field, degree 1 | README: W(k); computed: 0 | **false, R01** |
| §4.1–§4.3 | ℤ → ℤ/p; conductor (2,3): t²k[t]; 𝔽_p[ε]/ε² | total fibre K(ℤ,pℤ); A/c = k, B/c = k[t]/t²; NK_1 ≠ 0 | true; K_1 justification R02 |
| §5.1 Checks | q ≤ 1; q = 2 | dim λ^{C_{p^{r−1}}} = d; k | true |
| §5.2 | q = 2, 4, 6; 𝔽_3 | k; Ω²⊕k² or Ω²⊕W_2; ℤ/9⊕𝔽_3; ℓ_s = p^{r−1−s}d | true |
| §5.3 | d = 2 against §5.2 (p odd and p = 2); d = 3: q = 2: k³ (p odd and p = 2); q = 3: k² (p = 2, 3, 5); q = 5: k⁸ (p = 2, 3, 5, 7) | all primes agree | true; printed p = 2 formula refuted (Source issues) |
| §5.4 | d = 2; q = 3, d = 3: c_2(3) = 2; third summand = HH_q^{⊕d} per weight | as stated | true |
| §6.1, §6.2, Examples | (2,3,1): 𝔽_5: ℤ/25⊕𝔽_5, 𝔽_3: 𝔽_3³; (2,5,0), 𝔽_3: ℤ/9; (2,3,2): 𝔽_2⁵, 𝔽_5: ℤ/25⊕𝔽_5³ | lengths 3, 2, 5 | true |
| §7.1, §7.2, Examples | e = 1; e = p, k = 1: cofibre π_0 = ℤ/p; (𝔽_3, e=2, r=2): ℤ/9; O_C; 𝔽_p, e = p: order p^{p−1} | as stated | true |
| §8.1 Checks | δ(p) = 1 − p^{p−1}; ℤ_p{y} → ℤ_p, y ↦ p | 1 ≠ 0; z_n of order p^n | true |
| §8.2 finite-stage formula | 𝔽_2, i=1: j=1, 3; (ℤ_2⟦z⟧, ℤ_2), i=1: direct H⁰ = k, H¹ = k² (b_0=b_1, b_2=0); j=3: k, k²; j=2: 0, k | strict bound needed | true; printed bound refuted (Source issues) |
| §8.2 G_A vs C_A; ℤ_p(0)(𝔽_p) | c = 2·id; fib(0) | 0 vs ℤ_p⊕ℤ_p[−1] | true |
| §8.4 Check | Tor_1^{ℤ_p⟦x⟧}(ℤ_p,ℤ_p) | ℤ_p | true |
| §8.6 Checks | K_3(ℤ/4;ℤ_2) = ℤ/8 vs W_{{1,3}}(𝔽_2) = 𝔽_2²; units of ℤ_p⟨z⟩ | as stated | true |
| §9.2 | gr^j of PD de Rham: coefficient j (n ∤ j) or n (n | j) | {j,n} | true |
| §9.3 | ℤ/4 i=2: 8/2 = 4; ℤ/8 i=2: 32/2 = 16; i=3: 128/2 = 64; 𝔽_2[z]/z³ i=3: 64/1 | q^{i(n−1)} | true; table akn24 lines 144–153 |
| §9.4 | ℤ/4, i=1: ranks 1, 2, 1; p=2, n=3 intervals [2,2], [3,3] | as stated | true |
| §9.5 | ℤ/4 exponents 6 and 3, i ≥ 3; weaker bound p²/(p−1) ≥ 4 | as akn24 lines 2105–2154 | true |
| §9.6, Examples | 𝔽_2[z]/z³: K_1 = ℤ/4, K_3: ℤ/8⊕ℤ/2, K_5: ℤ/16⊕(ℤ/2)² | as table | true |

Dependency check output:

    depcheck: 246 roadmaps, 2253 edges, 0 problem(s)

No UPWARD or CYCLE line. StableHomotopyKTheoryPartII §2.7 and GeneralAlgebraicKTheoryPartII §5.5 are
later in the merge order and are named only under "What is left out" as owners of excluded results,
not as suppliers; both exist at their open heads.

## Verified sound

- Declarations read: 6 of 6 (3 definitions, 3 theorems); README lines read: 930 of 930; bold targets
  and sections read: 46 sections in 9 layers.
- Locators verified against the cached texts: 104 (speirs-axes 16, hn-cusp 8, hesselholt-cusp-polytopes 8,
  hesselholt-axes 8, akn24 32, akn-delta 30, riggenbach-trunc 1, amm-perfectoid 1); all point at the
  cited statement.
- Checks recomputed: 71; one false value (R01), none vacuous. Every definition has at least three Checks.
- Sibling citations checked: at the open heads with files, RefinedTraceMethods (§§1.2–1.4, 1.9, 2.1,
  2.3–2.6, 2.8–2.10, 2.13, 2.16, 4.12, 4.17, 4.18: headings and the statements of §§2.3, 2.4, 2.10,
  4.18 read), QWittVectors (§§1.1–1.5, 1.4a; `BigWitt.TruncationSet` is declared in its Suggested.lean,
  so the one lead of the citation tool is not a defect), StableHomotopyKTheoryPartII §2.7,
  GeneralAlgebraicKTheoryPartII §5.5; by `roadmaps show`, KTheoryFiniteLocalFields (§§2.1, 4.0, 4.4,
  5.1, 5.16, 5.17, Layer 6), SchemeKTheoryOperations §5.2 (NK_n = 0 in every degree for regular
  noetherian X), PrismaticCohomologyPartII §§4.29, 4.31. The citation tool reports no cross-roadmap
  citation unresolved.
- Declared gaps: both slugs are in `design/plan.json` and under the supplier's subsection with the
  same `needs`; each is precise and minimal (QWittVectors §1.5 has only the `Div(p^a)` comparison;
  SchemeKTheoryOperations §5.2 covers regular noetherian X only; amm-perfectoid line 558 states the
  cited proposition).
- Ownership: `roadmaps grep` for the cusp, coordinate-axes, Angeltveit and finite-chain-ring objects
  finds no other owner on main or at the open heads; no fully qualified name of Suggested.lean occurs
  in another roadmap (`cuspCount` in MaassForms and AdelicImagesAndModularCurves is in other namespaces).
- Policy: the pull request changes only the package folder; no `set_option`, `lemma`, `#eval`, process
  words or pull-request numbers in README or Suggested.lean; single `import Mathlib`.

## Not verifiable

- `larsen-mixed` and `bach-hypersurfaces` are uncertified (settled): the mixed-complex input of §2.6
  was checked only through hn-cusp Theorem 1 (line 131).
- The contents (as opposed to the headings) of the cited sections of PrismaticCohomology,
  PrismaticCohomologyPartIII, AInfCohomology, CrystallineCohomology, DerivedDeRhamCohomology,
  GeneralAlgebraicKTheory, BordismFormalGroups, EnhancedDerivedSheaves and StableHomotopyKTheory were
  not compared hypothesis by hypothesis; existence rests on the citation tool.
- akn-delta §10 and akn24 §§3–4 (§8.5, §9.4): locators and the statements' shape were checked, the
  basis and recursion formulas of §9.4 against akn24 lines 670–682 only; the proofs were not re-derived.
- No Lean elaboration was run (read-only pass); signatures rest on the worker's `signatures.md`.
- The claim at README line 706 on the Frobenius cofibre of the absolute prismatic cohomology of ℤ_p
  rests on the supplier's Check and was not recomputed.

Source independence: 16 passages compared with 8 sources, none shared beyond forced formulas and case
lists (longest shared run 8 words, speirs-axes line 20); largest share akn-delta, 46 of 193 locators;
contents compared with akn-delta (§§2, 7, 8, 9, 10 against §§8.1–8.5, where the package of its §8
precedes the construction of its §§3–7) and with akn24 (§§2–6 against §§9.1–9.6, three README
sections for its §2 and one for its §§2.3–4; the order 9.4 → 9.5 → 9.6 is forced by the `*Needs:*`
lines of §9.5 and §9.6): independent.

## Source issues

- **Error** in speirs-axes at Theorems 1 and 2, the case p = 2 and q = 2r + 1, printed pages 1 and 4 (and the last display of §5, page 28): the source says the product runs over all odd m′ and all 0 ≤ v ≤ t_ev, which is an infinite product; it should be one copy of the summand for each odd m′ ≤ 2r + 1; affects a stated result.
- **Error** in speirs-axes at Lemma 15, printed page 13: the source says the lax map from the tensor product of the two Tate constructions is an equivalence for bounded-below T; it should say so after p-completion of the source (T the sphere, X a point fails); affects the proof.
- **Error** in akn-delta at Proposition 8.6, printed page 43: the source says the finite-stage formula holds when (p−1)j ≥ i; it should require (p−1)j > pi as in its Lemma 8.5 (p = 2, i = 1, j = 2 fails); affects a stated result.
- **Error** in hesselholt-cusp-polytopes at Corollary 1.7, printed page 8: the source says the quotient has finite length ½(2r+1)(a−1)(b−1) over W(k) for every commutative ring k; it should require k a field (a product of two fields doubles the length); affects a stated result.
- **Error** in hn-cusp at the paragraph after Theorem A, printed page 1: the source says the group has that finite length for the perfect algebras of the theorem; it should say so for perfect fields; affects nothing.
- **Misprint** in akn24 at Remark 5.3, printed page 46: the source says j = ⌈n/e⌉ is the exponent of the additive group; it should be p^j; affects nothing.

## For the human reviewers

- **Scope.** `Suggested.lean` states three elementary counting theorems only (two from hesselholt-cusp-polytopes Corollaries 1.6–1.7, one from speirs-axes Lemma 33); every K-theoretic headline is listed as not statable at the pins (`Suggested.lean` lines 17–37).
- **Licence.** `bouis-motivic` (arXiv 2026 preprint) is cited only under Downstream consumers (README line 908); `lurie-ha` is an author-page text (sources.toml, `licence_class = "author-page"`).
- **Not tested.** `larsen-mixed` and `bach-hypersurfaces` are uncertified and unread; wording and contents were not compared with them (README line 341 cites them through hn-cusp Theorem 1).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b83e78b97709c5eafec3751710a105ca5339f01e", "job": "RT-RefinedTraceMethodsPartII~1b", "model": "fable", "worker": "chris-x79"} -->
