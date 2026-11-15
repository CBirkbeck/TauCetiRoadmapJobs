# Review of RefinedTraceMethodsPartII (pull request #2410 at 8f5975b)

**Verdict:** needs changes

## R01 (P3) — §7.2 route cites §4.19 for a Nygaard comparison it does not state

**Location:** `TauCetiRoadmap/RefinedTraceMethodsPartII/README.md` line 666: "the relative Nygaard graded pieces of `S[x]/x^e` are finite extensions of conjugate pieces `∧^mL_{(S[x]/x^e)/P}[−m]`, which lie in cohomological degrees [0,1] (PrismaticCohomologyPartII §§3.15, 4.19)."

**Claim:** The motivic graded pieces are built from the absolute Nygaard filtration. To apply §3.15, which is about the relative filtration over `A_inf(P)`, the route needs the absolute and relative Nygaard filtrations to agree over a perfect prism. §4.19 compares only the underlying complexes.

**Witness:** PrismaticCohomologyPartII §4.30(1) at its open head: over a perfect prism (A,I), `Fil_NΔ_R{n} ≃ Fil_N F*(Δ_{R/A}{n})` for animated R over Ā. Its proof route uses §4.19 only for the case m = 0.

**Repair:** On line 666, write "(PrismaticCohomologyPartII §§3.15, 4.19, 4.30)". Add §4.30 to the PrismaticCohomologyPartII entries of the §7.2 *Needs* line and of the Layer 7 Dependencies. On line 145, write "the absolute Nygaard filtration (§§4.25, 4.29) and its comparison with the relative one over a perfect prism (§4.30)".

## R02 (P3) — bouis-motivic Theorem 3.9 states the motivic form, not the syntomic one

**Location:** `TauCetiRoadmap/RefinedTraceMethodsPartII/README.md` line 666: "is `(W_{ei}(R)/V_eW_i(R))[−1]` (sulyma-slopes Theorem 1.1 and Remark 1.3, lines 43 and 52; bouis-motivic Theorem 3.9, line 263)."

**Claim:** bouis-motivic Theorem 3.9 is about Bouis's relative motivic complex `ℤ_p(i)^mot(R[x]/(x^e),(x))`. Its identification with the reduced syntomic complex is a separate corollary, which the locator leaves out.

**Witness:** bouis-motivic line 265 states the equivalence for `ℤ_p(i)^mot`. Corollary 3.2 (line 157) identifies the relative `ℤ_p(i)^mot` of `R[x]/(x^e)` with relative BMS syntomic cohomology, and the proof on line 268 uses it.

**Repair:** On line 666, write "bouis-motivic Theorem 3.9 with Corollary 3.2, lines 263 and 157".

## Previous findings

- R01 — repaired: "Prove also the syntomic form: for every perfectoid ring R and i ≥ 1, the reduced syntomic complex … is `(W_{ei}(R)/V_eW_i(R))[−1]`". The route for general R is added. Its two citation slips are R01 and R02 above.
- R02 — repaired: "(RefinedTraceMethods, Layer 2 Examples)". The computation is in the RefinedTraceMethods README at line 1257, at its open head.
- R03 — repaired: "… where `ω^{⋆p}` has length pm and the same period (speirs-axes lines 527–531)."
- R04 — repaired: "with the big Witt vectors `W_N(R) = W_{{1,…,N}}(R)` of the Conventions"; "`|K_5(𝔽_2[z]/z³;ℤ_2)| = 4·16 = 64`".

## Verified sound

| Target | Instances | Values computed (roadmap side / check side) | Result |
|---|---|---|---|
| §7.2 syntomic form, degenerate | e = 1 | `fib(ℤ_p(i)(R) → ℤ_p(i)(R)) = 0`; `W_i/V_1W_i = 0` | holds |
| §7.2 syntomic form, characteristic p | 𝔽₂, e=2, i=1; 𝔽₃, e=2, i=2 | H¹ = `1+x𝔽₂` = ℤ/2, and ℤ/4 / 2ℤ/4 = ℤ/2; T={1,3}, s_T(1)=2 gives ℤ/9 = relative K₃ | holds |
| §7.2 O_C Check (new) | O_C, e=2, i=1 | relative G_m is `1+xO_C ≅ O_C` in degree 0; §6.24(4) shifts it to O_C[−1]; `W_{T_{1,2}} = W_{{1}}(O_C)` = O_C | holds |
| §7.2 route, index shift | riggenbach-trunc lines 943, 1285–1316 | Riggenbach's gr^j is in degree 2j+1, computed with index e(j+1); j = i−1 gives `(W_{ei}/V_eW_i)[2i−1]` = motivic gr^i | holds |
| §7.2 route, degrees | qrsp S, perfectoid P ↠ S | L = flat[1] plus free rank-1 part dx, so `∧^mL[−m]` lies in [0,1], and in [0,2] after lim; d_r lands in degree ≤ 2i−1 < 2(i+r)−2, so E₁ = E∞ | holds |
| §7.2 Nygaard step (R01) | perfect prism `A_inf(P)` | §4.19 gives the underlying `Δ_R ≅ Δ_{R/A}` only; the Nygaard comparison is §4.30(1) | citation gap |
| §7.2 bouis locator (R02) | bouis-motivic lines 157, 263–268 | Theorem 3.9 is about `ℤ_p(i)^mot`; Corollary 3.2 identifies it with syntomic | citation incomplete |
| §7.2 K-theory form, `W_N` wording | 𝔽₂, e=2, r=1 | `W_2(𝔽₂)/V_2W_1(𝔽₂)` = ℤ/4 / (2) = ℤ/2 = `(1+x𝔽₂)^×` | holds |
| §2.5 Frobenius (sample) | ω = x₁x₂x₃, p = 2 | `ω^{⋆2}` has length 6 and period 3; speirs-axes lines 527–531 give the homeomorphism `B(ω) → B(ω^{⋆p})^{C_p}` | holds |
| §4.1 non-example | ℤ → ℤ/p, I = pℤ | bottom row is `IK(ℤ/p)` → itself, so the total fibre is K(ℤ,pℤ); p^k ≠ 0, so not nilpotent; RefinedTraceMethods §4.17 records the failure | holds |
| Tate-grading witness | Hℤ, trivial C_p | ℤ/p in even degrees, 0 in odd degrees; RefinedTraceMethods README line 1257 | holds |
| §9.3 Check (sample) | 𝔽₂[z]/z³, i=3, n=3 | 2-part of K₅ is (ℤ/2)²⊕ℤ/16, of order 64; K₄ = 0; 64 = 2^{3·2}, against q^{in} = 2⁹ (akn24 line 149) | holds |
| §3.15 supplier contract | PrismaticCohomologyPartII §3.15 | `gr_N^nΔ^{(1)} ≃ Fil_n^conj Δ̄{n}`, matching "graded pieces of relative Nygaard = conjugate pieces" | holds |

The rows for statements the diff does not touch stand as in the previous review, of e827f77.

- Source locators checked against the text: 10 locators in 5 sources: sulyma-slopes lines 43 and 52; bouis-motivic lines 157, 263 and 268; riggenbach-trunc lines 939–945, 1037 and 1279–1323; speirs-axes lines 527–531; akn24 lines 144–149. Of the seeded sample, the diff touches §2.5 and §9.3, and both were checked.
- Cross-roadmap citations resolved at the open heads: 10. PrismaticCohomologyPartII §§3.15, 4.19, 4.30; PrismaticCohomologyPartIII §§6.8, 6.24, 7.0 (`gr^nTC(R;ℤ_p) ≃ ℤ_p(n)(R)[2n]`); RefinedTraceMethods Layer 2 Examples (line 1255) and §4.17 (line 2226); DerivedDeRhamCohomology Layer 5 (§§5.1–5.6); AInfCohomology §AI.7.2 (its quasisyntomic unfolding block).
- Gate re-run at this head: every check passes. Dependency check: `depcheck: 238 roadmaps, 2254 edges, 0 problem(s)`. There is no change outside the folder.
- Elaboration: `lake env lean` on Suggested.lean gives three `sorry` warnings and nothing else. Suggested.lean is unchanged since e827f77, so the `#check @` comparison of its six declarations stands. Its docstring does not mention the scope of the syntomic form.
- Ownership: `roadmaps grep` for truncated polynomials, `R[x]/x`, Sulyma and Riggenbach finds only KTheoryFiniteLocalFields §§5.16–5.17 (perfect fields, already imported). No other roadmap owns the syntomic form over perfectoid rings.
- Declared gaps `bigwitt-ptypical-decomposition` and `perfect-homotopy-invariance` are untouched by the diff. The new route uses the first through §1.2, as before.
- Pull request text: the title, the summary block and the prose ("Riggenbach's theorem … over every perfectoid ring") agree with this head. The diff adds no supplier roadmap and removes no section or declaration.

Overlap check: read RefinedTraceMethods, PrismaticCohomologyPartII and PrismaticCohomologyPartIII (open, closest in vocabulary) and EnhancedDerivedSheaves (main); the third list is empty. Shared objects and their owners are as in the previous review. The syntomic form of §7.2 over perfectoid rings is owned here, and syntomic complexes stay with PrismaticCohomologyPartIII §6.8.

Source independence: changed passages only. 8 passages compared with 5 sources (riggenbach-trunc, sulyma-slopes, bouis-motivic, speirs-axes, akn24); nothing is shared beyond forced formulas, the longest common run being 4 words (speirs-axes line 528, a dozen-word statement). Largest share: akn24, 44 of about 190 line locators by mechanical count (akn-delta 43). The contents were not compared again, since no layer was added, removed or reordered; the previous comparison with akn-delta found them independent.

## Not verifiable

- None in the changed passages. larsen-mixed and bach-hypersurfaces remain settled as uncertified, as in the previous review.

## Source issues

- none

## For the human reviewers

- none
