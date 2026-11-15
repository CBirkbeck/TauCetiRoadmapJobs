<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13121#issuecomment-6899652287 -->
Red team round 2 pass a (claude) of 371b193

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) Four supplier-contract entries that no target consumes

   **Location.** `packages/RefinedTraceMethodsPartII/README.md:147` ("StableHomotopyKTheory §§7.9–7.10 and 7.14–7.18: towers, Milnor sequences and p-completion"), `:148` ("§E5:presentability.2: presentable ∞-categories and their limits and colimits"), `:143` and `:24` ("§6.28: `ℤ_p(i)` is discrete and p-torsion-free as a quasisyntomic sheaf").

   **Claim.** These sections are suppliers of the roadmap.

   **Witness.** `StableHomotopyKTheory §` occurs only at line 147, `presentability` only at line 148, `6.28` only at lines 24 and 143. No `*Needs:*` line and no layer `Dependencies` line names any of them, so each contract has no consumer.

   **Repair.** Attach each to the target that uses it, or delete the row:

   - §5.1 `*Needs:*`, append: "StableHomotopyKTheory §§7.9–7.10 (the Milnor sequence of the tower over R, whose lim¹ vanishes by the stabilization)". Add the same to the Layer 5 Dependencies line.
   - §9.2 `*Needs:*`, append: "StableHomotopyKTheory §§7.14–7.18 (derived p-completion, for the finiteness statement)". Add the same to the Layer 9 Dependencies line.
   - §8.2 `*Needs:*`, append: "EnhancedDerivedSheaves §E5:presentability.2 (presentable ∞-categories, for the colimits of G_A and C_A)". Add it to the Layer 8 Dependencies line.
   - Delete "§6.28: `ℤ_p(i)` is discrete and p-torsion-free as a quasisyntomic sheaf." from line 143 and ", 6.28" from line 24: no statement of Layers 3, 7, 8 or 9 uses it.

   Tested: after the edit every supplier row is named by one `*Needs:*` line; all three roadmaps are already edges of the dependency check, so no new edge arises.

2. **F02** (P3) "How to read the build" gives Layer 9 a dependency it does not have

   **Location.** `packages/RefinedTraceMethodsPartII/README.md:152`: "Layer 9 applies Layers 3, 7 and 8 to finite chain rings."

   **Claim.** Layer 9 uses Layer 3.

   **Witness.** README 906: "Layers 1, 7 and 8." The six `*Needs:*` lines of Layer 9 (README 811, 828, 840, 860, 879, 892) cite §§1.5, 7.2, 8.1–8.6 and 9.x only; none cites §3.x. Layer 1 (§1.5) is used and is missing from line 152.

   **Repair.** Line 152: "Layer 9 applies Layers 1, 7 and 8 to finite chain rings." Tested against the six `*Needs:*` lines: all cited local sections lie in Layers 1, 7, 8, 9.

3. **F03** (P3) Connectivity off by one against §2.3's own convention

   **Location.** `packages/RefinedTraceMethodsPartII/README.md:454`: "the weight-m summand for m ≥ 1 is `THH(k) ⊗ (T/C_m)_+` (§2.2 Checks), of connectivity 0 for every m."

   **Claim.** The summand has connectivity 0.

   **Witness.** README 305 fixes the convention: "`Σ^{2j}(T/C_m)_+`, of connectivity 2j − 1". With j = 0, `(T/C_m)_+` has connectivity −1, and `π_0(THH(k) ⊗ (T/C_m)_+) = k ≠ 0`. The same object has two values in the two places.

   **Repair.** Line 454: "…is `THH(k) ⊗ (T/C_m)_+` (§2.2 Checks), of connectivity −1 for every m (its π_0 is k)." The conclusion (the connectivity does not grow, so §2.3 does not apply) is unchanged. Tested on m = 1, k = 𝔽_p: `π_0 = 𝔽_p`.

4. **F04** (P3) One locator off by a line

   **Location.** `packages/RefinedTraceMethodsPartII/README.md:57`: "`ℤ_p(1)` is the derived p-completion of `G_m[−1]` (akn-delta line 119)".

   **Witness.** akn-delta line 118 carries the weight-one statement (as the p-adic Tate module of `G_m`); line 119 is the vanishing in negative weights.

   **Repair.** "(akn-delta line 118, where it is written as the p-adic Tate module of `G_m`)".

Round 2. The whole of `packages/RefinedTraceMethodsPartII/README.md` (934 lines) and of `packages/RefinedTraceMethodsPartII/Suggested.lean` (84 lines) was read. Four new findings, all P3 (S01–S04). No P1 or P2. No finding re-raises a settled one (the repair report marks none `not actionable in this package`). The two declared supplier gaps are precise, minimal and carry the same slugs in `design/plan.json` and in the README; they are not raised.

## Round 1 findings: state at this head

| Id | State | Witness at 371b193 |
| --- | --- | --- |
| 1a/F01 = 1b/F01 (P1), Layer 3 example on `k[t]` | repaired | README 454: "Reading the sum as a product gives a wrong answer … In fact `TC_1(k[t],(t)) = 0`"; README 456 gives the degree −1 witness. Recomputed: i = 0 gives `H^{−1} = 0`; i = 1 gives `(k^×)^∧_p = 0` (unique p-divisibility, `Pic(k[t]) = 0`); i ≥ 2 gives 0; `[t] ↦ t ∉ {f^p − f}` (degree 0 or divisible by p); `K_0(k[t]) → K_0(k)` iso so `K_{−1}(k[t],(t)) = 0`. One residue of the repair: S03. |
| 1a/F02 (P2), pre-prismatic | repaired | README 680: "A δ-pair (A′, R) is pre-prismatic if the kernel of A′ → R contains an invertible ideal I such that…"; matches akn-delta lines 307–309 and 1846–1847. Check at README 694 recomputed: `δ(p^m u) = p^{m−1}u − p^{mp−1}u^p ∈ pℤ_p` for m ≥ 2; `δ(p) = 1 − p^{p−1}` is 1 in 𝔽_p. |
| 1a/F03 (P3), T(1) sentence | repaired | README 29: "This roadmap does not state `L_{T(1)}K(ℤ/p^n) = 0`"; akn24 lines 2356–2360 confirm Corollary 6.4 uses more than Theorem 6.3. |
| 1a/F04 (P3), two meanings of j | repaired | README 801: "F-weights are written j′, as in §1.5"; README 823–824, 838 use j′ throughout. |
| 1a/F05 (P3), window Check | repaired | README 833: "the smaller window [1, in − 2] = [1,0] is empty and would give 0 instead of H¹ = ℤ/2"; akn24 lines 388–399 support both ends. |
| 1a/F06 (P3), library sentence | repaired | README 70 and `Suggested.lean` 17–21; the three Tau Ceti folders exist at the pin. |
| 1b/F02 (P3), `K_1(A_d,I_d) = 0` attribution | repaired | README 509: "It says nothing about the kernel of that map…"; README 559 uses the finiteness witness. Recomputed `cyc_3(3) = 2`, `cyc_3(5) = 6`. |
| 1b/F03 (P3), conductor | repaired | README 66 and 168; `frobeniusNumber_pair` at Mathlib/NumberTheory/FrobeniusNumber.lean:59. |

No repair introduced a false statement. The new supplier citations of the repair (RefinedTraceMethods §§2.13, 2.16; PrismaticCohomologyPartIII §§6.16, 6.24, 7.0; SchemeKTheoryOperations §5.2) exist at the suppliers' heads with the statements used.

## The adversarial pass: Suggested.lean declarations

No section `variable`, no instance context; all binders are explicit. The elaborated types in the worker's signature file were compared with README §§1.1 and 1.4: all six agree; nothing changed in this pass (no Lean was run, as the pass is read-only).

| Declaration | Context | Instances tried | Values on each side | Result |
| --- | --- | --- | --- | --- |
| `cuspCount` (def) | none | (2,3,m), m = 1…18; (2,5,m) | ℓ(2,3,·) = 0,0,0,0,1,0,1,1,1,1,2,1,2,2,2,2,3,2; ℓ(2,5,7) = ℓ(2,5,9) = 1, ℓ(2,5,10) = 0 | bound `i, j ≤ m` holds for a, b ≥ 1 |
| `cuspTruncationSet` (def) | none | (2,3,0), (2,3,1), (2,5,0) | {1,2,3,4,6}; {1,…,10,12}; {1,2,3,4,5,6,8,10} | matches README 174–176; wrong model "ℓ < r" excluded at r = 0 |
| `cuspCoprimeSet` (def) | none | (2,3,0), (2,3,1), (2,3,2), (2,5,0) | {1}; {1,5,7}; {1,5,7,11,13}; {1,3} | matches |
| `ncard_cuspTruncationSet` | `2 ≤ a`, `2 ≤ b`, coprime | (2,3,0), (2,3,1), (2,5,0) | 2·5+2 = 12 = 3·4; 2·11+2 = 24 = 12+12; 2·8+2 = 18 = 3·6 | true; not one-tactic |
| `ncard_cuspCoprimeSet` | same | (2,3,0), (2,3,1), (2,3,2), (2,5,0) | 2·1 = 1·1·2; 2·3 = 3·1·2; 2·5 = 5·1·2; 2·2 = 1·1·4 | true; ℕ-subtraction harmless since a, b ≥ 2 |
| `card_noCyclicRepetition` | `1 ≤ m` | (d,m) = (0,1), (0,2), (1,2), (2,1), (2,2), (3,3), (3,4), (3,6); m = 0 excluded | 0 = −1+1; 0 = 1−1; 0 = 0; 0 = 1−1; 2 = 1+1; 6 = 8−2; 18 = 16+2; 66 = 64+2; at m = 0 left 1, right d | true; hypothesis needed |

Headline theorems (README Summary): Hesselholt's axes formula (§5.2), Speirs' formulas (§§5.3–5.4), Hesselholt–Nikolaus (§6.2), Riggenbach (§7.2), the four Antieau–Krause–Nikolaus theorems (§§9.2, 9.3, 9.5, 9.6), and the relative and filtered prismatic package (Layer 8). None is statable at the pins (no higher or relative K-groups, big Witt vectors, de Rham–Witt complex, δ-rings or syntomic complexes at the pins; checked by grep), and each is named in the module docstring with what it lacks. Padding probe: none of the three theorems follows from one tactic or one library lemma (no chromatic-polynomial or cycle-colouring count, no Sylvester count in the pinned Mathlib or Tau Ceti), none restates a definition, mirrors a Check or computes a small value.

## The adversarial pass: README targets

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §1.1 divisor monotonicity, `#(S/a)`, `#(S/b)`, `#(S/ab)` | (2,3,0) | S/2 = {1,2,3}, S/3 = {1,2}, S/6 = {1}; 5 − 3 − 2 + 1 = 1 = #T | true |
| §1.2 restriction kernel | S = {1,2}, n = 2, 𝔽_2; S = {1,…,4}, n = 2; n = 1 | 4/2 = 2 = #𝔽_2; `W_{{1,3}}(𝔽_2)` has 4 elements, wrong model 8; both sides 0 | true |
| §1.3 `h = s_T(m′)` | (2,3,0,2), (2,3,0,5), (3,2,0,3) after relabelling | m′ = 1: min{3,1} = 1; m′ = 1: s = 1, others 0; min{2,1} = 1 = `s_{{1}}(1)` | true in all three cases of h |
| §1.4 `cyc_d`, `c_{d−1}`, t_ev, t_od | d = 3, s ≤ 6; d = 2; (2,1,3) | 0,3,2,3,6,9 (speirs-axes line 1282 table); `c_1` = 1 on evens; t_od = 1, t_ev = 0 | true |
| §1.5 threshold B, ε count | ℤ/4; `𝔽_2[z]/z³` with e = 3; i = n = 2 | 12; 4; {1,3} gives 2 = 2·1 | matches akn24 lines 2074–2079, 443–452 |
| Conventions witnesses | Witt sign; `V_2` on 𝔽_2; circle cells | `(1−t)^{−2} = 1+2t+3t²` forces a_2 = −1; ℤ/4 mod 2; `ΣHℤ` | true |
| §2.1, §2.2 | Π_0, Π_e (e = 1, 2), cusp monoid | ranks 1, e versus e+1; `y^a = t^{ab} = x^b` | true |
| §2.3 convergence and its negative control | k = `ℚ[β^{±1}]`, Π_2, m = 2j+1; k = 𝔽_p | `π_0X_m ⊇ ℚβ^{−j}`; 0 for j ≥ 1 | true |
| §2.4–2.5 homology and Connes operator | `RP²(i)`; s even; ℚ[t] weight m | R/2 in m−1, R[2] in m; degrees m−1, m; `HC` weight m is ℚ in degree 0 | matches speirs-axes lines 456–464 |
| §2.6 cusp square | (2,3), m = 1, 5, 6 | `ℤ ⊗ T_+`; one term shifted by 2; `ℤ →(3,2) ℤ² →(2,−3) ℤ` exact, so contractible | true |
| §3.1–3.3 | Z = `C_{p+}`, S⁰, `S⁰ ∨ EC_{p+}`; E = Hℤ, 𝕊 | 0 = 0; identity; `ℤ/p → (ℤ/p)²`; null; `Sq²` distinguishes | true |
| §3.4 coefficient tower | n = 0, 1, 2 over 𝔽_p | `R[u]`; `π_0` hC: `ℤ/p^{n+1}`, tC: `ℤ/p^n`; `d·d̃_n = φ^n(ξ_{n+1})` | true |
| §3.5 staircase lemma | s = 0, s = 2, all maps 0 | kernel `A_0`; kernel `A_1`; kernel the full product | true; hypotheses needed |
| §3.6 Frobenius bound | B = `S^{λ_1} ∧ T_+` (N = 3) | fibre in degrees ≤ N − 3; `π_1` source 0, target ≠ 0 | true |
| §4.1–4.3 | B = A; product square; ℤ → ℤ/p; `𝔽_p[ε]/ε²`; d = 2, 3 over a field | 0; 0; `K(ℤ,pℤ)`; `NK_1 ≠ 0`; `K_0(A_d) = ℤ` | true |
| §5.1–5.2 | q ≤ 1, 2, 4, 6; p = 2, 3 | 0; k; `Ω² ⊕ W_2(k)` or `Ω² ⊕ k²`; ℤ/9 ⊕ 𝔽_3 over 𝔽_3 | matches hesselholt-axes lines 21–41, 70–85, 107–111 |
| §5.3 four formulas, cross-prime lengths | d = 2 all q; d = 3, q = 2,…,7, p = 2, 3, 5 | d = 2 reduces to §5.2; lengths 3, 2, 9, 8, 21, 26 for each of p = 2, 3, 5 (q = 7: p = 2, 3) | consistent; the corrected p = 2 odd formula agrees with the odd primes |
| §5.4 | d = 2, k = ℚ, q = 1, 2, 4; ℚ(t), q = 3 | 0, ℚ, ℚ; `Ω¹` | matches speirs-axes lines 1163–1245 |
| §6.1–6.2 | (2,3,r) for r = 0, 1, 2 over 𝔽_2, 𝔽_3, 𝔽_5; (2,5,0) over 𝔽_3, 𝔽_3² | 𝔽_2, 𝔽_2³, 𝔽_2⁵; 𝔽_3³; ℤ/25 ⊕ 𝔽_5; ℤ/9; length 4 | true; lengths ½(2r+1)(a−1)(b−1) over fields |
| §7.1–7.2 | e = 1; (𝔽_2, 2, 1); (𝔽_3, 2, 2); (𝔽_p, p, 1); `O_C` | 0; ℤ/2; ℤ/9; `𝔽_p^{p−1}` (units have exponent p); `O_C` | true |
| §8.1 Checks | `(ℤ_p,𝔽_p)`, `(ℤ_p,ℤ/p²)`, `(ℤ_p,ℚ_p)`, unbounded examples | qrsp; not pre-prismatic; not p-complete; order `p^n` elements | true |
| §8.2 finite-stage formula | 𝔽_2 absolute, i = 1, j = 1, 3; `(ℤ_2⟦z⟧, ℤ_2)`, j = 2, 3 | j = 1: `𝔽_2 ⊕ 𝔽_2[−1]` ≠ 0; j = 3: 0; direct `H⁰ = k`, `H¹ = k²` (b₀ = b₁, b₂ = 0); j = 3 agrees, j = 2 gives `H¹ = k` | strict bound needed and sufficient on the instances |
| §8.3–8.6 Checks | A = R = ℤ_p; BK pair; `ℤ_p⟦x⟧ → ℤ_p`; `ℤ_p⟨z⟩` | `ℤ_p ⊕ ℤ_p[−1]`; `W(k)⟦z⟧`; `Tor_1 = ℤ_p`; 1 + z not a unit | true |
| §9.1–9.3 | 𝔽_q; ℤ/4; ℤ/8; `𝔽_2[z]/z³` | ratios 4 = 2², 16 = 2⁴, 64 = 2⁶, 64 = 2⁶; `W_{{1,2,4,5}}(𝔽_2) = ℤ/8 ⊕ ℤ/2` | matches akn24 lines 144–153 |
| §9.4 bases | p = 2, n = 3, s = 0, windows [2,2], [3,3] | `z_0²`; `f_0` with w = 0; relation `x^p = R_0 + (−p + d^pλ_0)δ(x)` rederived from `δ(dx) = δ(r)` | true |
| §9.5–9.6 | ℤ/4; n ≤ e; n = 1 | exponents 6 and 3; B = `p²n/((p−1)e) → 0`; `[1]_p = 1` | matches akn24 lines 2074–2164, 2321–2331 |

## Dependency check

```text
depcheck: 246 roadmaps, 2253 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. GeneralAlgebraicKTheoryPartII and StableHomotopyKTheoryPartII, which are later in the merge order, are named only under "What is left out" as owners of excluded results (README 29, 34); no `*Needs:*`, contract row or Dependencies line cites them, and the cited targets exist there (§5.5 "The chromatic purity theorem" in its Layer 5; §2.7 on the Segal theorem).

## Copyright, licences and scope

Wording: 22 passages were set beside their sources (the statements at akn24 lines 108–112, 156–158, 388–399, 419–452, 457–460, 2074–2094, 2131–2135, 2321–2331; akn-delta lines 89–100, 126–152, 307–312, 1701–1716, 1759–1774; speirs-axes lines 17–26, 360–366, 456–464, 976–982; hn-cusp lines 20–30, 43–57, 131–142; hesselholt-cusp-polytopes lines 329–336 and 373–397). None reproduces a sentence. The closest is §8.6's two-clause statement of akn24 Theorem 2.20 (about ten consecutive words in clause (1)), a list of hypotheses with one natural wording.

Arrangement: akn24 has the largest share (51 of about 220 source mentions; akn-delta 50). Its sections are §2 (syntomic cohomology and degeneration), §3 (envelopes), §4 (orientations and the finite model), §5 (even vanishing), §6 (v₁), §7 (algorithm). The roadmap uses it in §8.6 and Layer 9 only: §9.4 merges its §§2.3, 3 and 4, §7 is excluded, and the order 9.2 → 9.3 → 9.4 → 9.5 → 9.6 is forced by the `*Needs:*` lines at README 840, 860, 879 and 892. Layers 1–7 have no counterpart in it.

Reuse: the table values at README 834, 844–846 and 902 are single facts used as Checks with locators; no table, figure or list is taken over.

Source independence: 22 passages compared with 5 sources, none shared; largest share akn24, 51 of about 220 source mentions; contents compared with akn24: independent.

## Verified sound

- Declarations read: 6 of 6 in `Suggested.lean` (3 definitions, 3 theorems); form checks pass (single `import Mathlib`, one module docstring, namespace `TauCetiRoadmap.RefinedTraceMethodsPartII`, `theorem` only, no `set_option`, no sorry'd data, no `#eval`, every declaration has a docstring and appears in the README).
- Targets read: all sections of all 9 layers (40 numbered sections), with Conventions, the pinned witnesses and every Examples paragraph.
- Locators verified against the cached texts: 113 (akn24 24, akn-delta 44, speirs-axes 14, hn-cusp 11, hesselholt-axes 9, hesselholt-cusp-polytopes 6, riggenbach-trunc 5; distinct cited lines opened). One is off by a line (S04).
- Checks tested: all 140 Check bullets and the 9 Examples paragraphs were evaluated against the statements of their sections, with the values in the table above; none is false, vacuous or a restatement. Every definition has at least three.
- Sibling citations checked at the suppliers' current heads: 94 section ids (several are numbered items under a grouped heading, for example PrismaticCohomology §0.56 under 0.55 and PrismaticCohomologyPartII §§4.4–4.8 under 4.3) across RefinedTraceMethods, KTheoryFiniteLocalFields, QWittVectors, CrystallineCohomology, DerivedDeRhamCohomology, GeneralAlgebraicKTheory, SchemeKTheoryOperations, AInfCohomology, PrismaticCohomology, PartII and PartIII (open pull requests, all earlier in the merge order) and BordismFormalGroups, EnhancedDerivedSheaves, StableHomotopyKTheory (on main). All exist. Content read for KTheoryFiniteLocalFields §§5.16, 5.17 and Conventions, QWittVectors §§1.1, 1.4, 1.5, RefinedTraceMethods §2.4, BordismFormalGroups §F6.5, AInfCohomology §AI.7.2, SchemeKTheoryOperations §5.2, PrismaticCohomologyPartII §4.3 and PrismaticCohomologyPartIII §7.0: each states what the contract says.
- Pinned declarations and files: all 9 Mathlib and Tau Ceti paths of "From Mathlib" and "From Tau Ceti" exist; `frobeniusNumber_pair`, `ArithmeticFunction.moebius_mul_coe_zeta`, `finRotate`, `WittVector.verschiebung`, `WittVector.frobenius`, `WittVector.teichmuller`, `TauCeti.NodeAlgebra` with `coord`, `coord_zero_mul_coord_one`, `lift`, and `TauCeti.Perfectoid.IsIntegralPerfectoid` are at the pins.
- Ownership: searched the open heads and main for the cusp sets, cyclic-word counts, pointed-monoid algebras, the staircase lemma, δ-pairs, filtered prisms and finite chain rings. No second owner. `cuspCount` also occurs in MaassForms, in the namespace `TauCetiRoadmap.MaassForms`, so the fully qualified names differ.
- Policy: `git diff --stat origin/main...HEAD` touches only `packages/RefinedTraceMethodsPartII/`; no pull-request number or process word in the README or the Lean file.
- `BigWitt.TruncationSet` (the resolver's one lead) is a declared target of QWittVectors §1.1, not a pinned name; the README cites it as such.

## Not verifiable

- larsen-mixed and bach-hypersurfaces are uncertified; §2.6's mixed-complex input was checked only against hn-cusp Theorem 1 (lines 131–153).
- hn-cusp lines 294–311 and 330–349, riggenbach-double, speirs-trunc, sulyma-slopes, amm-perfectoid, riggenbach-cusp and lurie-ha locators were not reopened in this pass; round 1 verified them and the text is unchanged there.
- The nonvanishing halves of akn24 Lemma 5.9 (§9.5 step 1) and the exactness of the nilpotence degree in §9.6 were compared with the source statements only, not recomputed.
- The elaborated signatures were read from the worker's signature file; no Lean was run in this pass.

## Source issues

- **Error** in speirs-axes at Theorems 1 and 2, printed pp. 1 and 4: the source says the p = 2 odd-degree group is a product over all odd m′ and all indices from 0 to t_ev of copies of k; it should be one copy of the cyc-weighted power of k for each odd m′ ≤ 2r + 1 and each divisor s′; affects a stated result.
- **Error** in speirs-axes at Lemma 15, printed p. 13: the source says the lax structure map of the C_p-Tate construction is an equivalence for bounded-below T and finite X; it should p-complete the source (it fails for T = 𝕊, X = S⁰); affects the proof.
- **Error** in akn-delta at Proposition 8.6, printed p. 43: the source says the finite-stage formula holds when (p−1)j ≥ i; it should require (p−1)j > pi as in Lemma 8.5 (p = 2, i = 1, j = 1 or 2 give wrong groups); affects a stated result.
- **Misprint** in akn24 at the footnote to Theorem 1.4 and Remark 5.3, printed pp. 4 and 46: the source says ⌈n/e⌉ is the exponent of the additive group of the quotient ring; it should be p raised to that number; affects nothing.
- **Error** in hesselholt-cusp-polytopes at Corollary 1.7, printed p. 8: the source says the Witt quotient has the stated finite length over every commutative ring k; it should assume k is a field (a product of two fields doubles it); affects a stated result.
- **Error** in hn-cusp at the paragraph after Theorem A, printed p. 1: the source says the K-group has the stated finite length for the perfect algebras of the theorem; it should say for perfect fields; affects nothing.

## For the human reviewers

- **Scope.** Layers 8 and 9 rest on akn24 (arXiv:2405.04329v1) and akn-delta (arXiv:2310.12770v2), cited at `packages/RefinedTraceMethodsPartII/README.md` lines 919–920 as arXiv preprints with no journal reference; likewise hn-cusp, speirs-trunc, riggenbach-trunc and riggenbach-cusp.
- **Scope.** bouis-motivic (arXiv:2608.05220v1, 2026) is cited only for an unnamed future roadmap (`packages/RefinedTraceMethodsPartII/README.md` line 912).
- **Licence.** lurie-ha is cited from the author-page version of 18 September 2017 (`packages/RefinedTraceMethodsPartII/README.md` line 933), not from a published edition.
- **Not tested.** larsen-mixed and bach-hypersurfaces (uncertified) were not read; the mixed-complex input of §2.6 rests on hn-cusp's restatement of them.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "371b193f5629b7d599c2b7a29ee57abab0c8f960", "job": "RT-RefinedTraceMethodsPartII~2a", "model": "fable", "worker": "chris-x88"} -->
