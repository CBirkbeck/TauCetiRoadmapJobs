# Review of RankOneConverse (pull request #1805 at 9b5c88a)

**Verdict:** accepted

Incremental re-review of the 14 changed lines since a182f85 (all in `TauCetiRoadmap/RankOneConverse/README.md` §3.1 and its first Check). No finding remains, new or carried.

## Previous findings

- R01 — repaired: §3.1 now reads "Assume exactly these arithmetic hypotheses, lettered (a)–(e) as in the source and cited elsewhere in this roadmap as B(a)–B(e)", followed by bullets (a)–(e); the first Check says "condition B(d) is vacuous".

The repair introduced no new problem: the lettering agrees item by item with skinner-2020 lines 106–114 ((a) p∤N and λ-ordinary; (b) residual irreducibility and ramification at an odd inert-or-ramified prime; (c) 2 and p split; (d) St⊗ξ at primes of (D,N), the rest split; (e) dim 1 and injective restriction to ∏_{v|p}H¹_f(K_v,V)), and with the roles §2.9 of the source assigns them (skinner-2020 lines 764–769: (a) ⇒ (flt),(ord); (b) ⇒ (irr),(res); (c) = (spl); (d) = (ram); (e) ⇒ (sgn) and H¹_𝔭(K,V)=0). Every citation of a lettered hypothesis in the README now resolves to the right item: lines 211, 271, 455, 526, 542, 544 cite B(e) for the Selmer-line-plus-injectivity hypothesis; lines 447 and 525 cite B(b) for the residual-ramified nonsplit prime; line 381 cites B(d) for the (D,N)>1 local pattern, which is indeed vacuous when (D,N)=1. No sentence of the README still refers to the hypotheses by number (grep for "condition/hypothesis/item/assumption 1–5": no hit), and no other theorem's hypotheses are cited by letter (no "A(…)", "C(…)", "E(…)").

## Verified sound

**Gate and build.** The worker's gate at 9b5c88a passes every check (`scratch/gate.md`: set_option=0, sorry-data=0, imports=0, readme-ids-missing=0, target-ids=0, depcheck=0, stray-files=0, outside-folder=0, build=0). I re-ran the gate on this head (`gate RankOneConverse: … OK`, every counter 0) and the dependency check:

```text
depcheck: 234 roadmaps, 2161 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line; RankOneConverse is line 355 of `ORDER.txt`, after every supplier it cites (the supplier positions listed in the previous report are unchanged). `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/RankOneConverse'` lists 0 paths. The worktree is clean.

**Lean elaboration.** `Suggested.lean` is byte-identical to a182f85 (`git diff a182f85 HEAD --stat` on it is empty). `lake env lean` on it at this head gives exactly two warnings (`declaration uses sorry` at lines 69 and 84). The `#check @name` probe on the scratch copy (`scratch/signatures/SignatureCheck.lean`, lines 96–98) elaborated with the same two warnings and prints the three types of `scratch/signatures.md`: `IsPrimitiveQuadraticTwist` keeps `{N M : ℕ} [NeZero N] [NeZero M] {k : ℤ}`, and both headlines keep `(hχ : f.χ = 1) (hk : 0 < k) (ε : ℤ)`, the Fricke-sign equation, `(S₀ : Finset ℕ)` with its primality and level-divisor hypotheses; no section binder is lost, and the types agree with README §4.1. Headline inventory, padding probe and the 21 pinned declarations are as in the previous report; nothing in the diff touches them.

**Sources: the seeded sample.** Of the fifteen sampled targets only “3.1 Theorem B” falls in the changed lines; it was re-read at skinner-2020 lines 104–116 (Theorem B, p.331) and 762–782 (§2.9, p.348): the five lettered hypotheses and the three conclusions (ord₁L(f/K,s)=1, rank_ℤ A_f(K)=[M_f:ℚ]=ord₁L(A_f/K,s), Sha(A_f/K) finite) match the README's statement as written. The other fourteen targets (0.1, 1.1–1.4, 2.2–2.4, 4.2–4.4, 5.1–5.2, 6.1–6.2) are untouched since a182f85 and stand as verified in the previous report at the locators it gives.

**Adversarial pass.** Rows for untouched statements carry forward from the previous report (r1); the changed statement has a new row.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 3.1 Theorem B, lettered hypotheses (lines 363–369, 381) — changed | (D,N)=1 with two inert level primes against (d); E=37a1, p=5, D=−111 against (a)–(d); K with p inert against (c); each B(x) citation against its letter | (d): (D,N)=1 so the premise "(D,N)>1" fails, (d) vacuous, sign (−1)·(−1)·(−1)=−1 as the Check says; 37a1: a_5(37a1)=−2 ≢ 0 mod 5 so ordinary (a); 37 ∥ (D,N) with a_37=−1 i.e. St⊗ξ and N/(D,N)=1 (d) holds; (−111/5)=(4/5)=+1 so 5 split, −111≡1 mod 8 so 2 split (c); p inert violates (c) only, not (d) ; the 9 citations resolve to (b),(d),(e) as computed above | matches skinner-2020 lines 106–114 and §2.9; no renumbering slip | none |
| Conventions, local signs (lines 39–40) | as r1 | (−1)·(−1)²=−1; (−1)·(+1)=−1; St ramified (−1)(−1)=+1 (r1) | agree with skinner-2020 lines 885–890 | none |
| Base-change root numbers (gap:squarefree-base-change-signs) | as r1 | split +1, inert −1, ramified −μ(q) (r1) | agrees with the gap's formula | none |
| Euler polynomials (line 42) | q=5, a_q=1 (r1) | 1−T+5T²; 1−T/5+T²/5 (r1) | correct | none |
| Logarithmic p-factor (lines 45, 128) | p=5, a_p∈{1,0,6} (r1) | 1, (6/5)², 0 only at a_p=6>2√5 (r1) | correct | none |
| S finiteness witness (line 44) | 37a1, p=5, D=−111 (r1) | S⊇{2,3,5,37,∞} (r1) | consistent with B(d) | none |
| 0.1 unipotent square (lines 195–197) | 𝔽₅, char 2, S₃↓C₃ (r1) | U²=(1 2;0 1); U²=1 in char 2; eigenvalues ω,ω² (r1) | correct | none |
| 1.1 condition and transport (lines 224–226) | id, 0, ℚ², loc(x)=(x,2x) (r1) | ker 0 / ℚ / dims 0,2; h∘loc∘e⁻¹ injective (r1) | correct | none |
| 1.3 dimensions (lines 249–251) | dim H²∈{0,1} (r1) | dim H¹−dim H_str=2; local 2·1+0+0=2, H¹_f dim 1 (r1) | correct | none |
| 1.4 kernels (lines 268–271) | diagonal, axes, dim 2, B(e) (r1) | dims 1, 2 (or 0), 1+1, 1−1=0 (r1) | correct; B(e) now resolves to (e) | none |
| 2.1 conventions (lines 301–306) | n=2; Λ; Λ/(γ−a), a=1+p (r1) | weights (2,1),(−2,−3); a²≠1 (r1) | correct | none |
| 2.2 Wan parameters (lines 316, 323–325) | p=5, n₀=8; n₀=4 (r1) | κ=16, 8∣16; 4≤6 fails (r1) | correct | none |
| 2.3 control (lines 335–337) | ℤ/p², ℚ_p/ℤ_p (r1) | Tate modules 0, ℤ_p (r1) | correct | none |
| 2.4 obstruction (lines 347–349) | Λ/(t²), Λ/(t−p), Λ/(p,t), Λ (r1) | ranks 1, 0, 0, 1 (r1) | correct | none |
| 3.1 remaining Checks (lines 382–385) | d=2; orders (0,1),(1,0),(1,1); ℤ/5⊕ℚ₇/ℤ₇ (r1) | 1+1=2; sums 1,1,2; 5-part finite, group infinite (r1) | correct | none |
| 4.1 BFH, Lean form | k odd; D=1; D=0; ε (r1) | vacuous; one element; excluded; ε∈{±1} (r1) | well formed | none |
| 4.1 predicate witnesses (lines 419–427) | D₀=−7, δ=17; 13 at 3; level 11; Δ, δ=5; 27a; 2g′ (r1) | −119 fundamental; χ_{−4}(11)=−1, χ_5(11)=1; τ(2)=−24,τ(3)=252 twisted to 24,−252; a₁=2≠1 (r1) | correct | none |
| 4.1 construction (lines 405, 418) | δ>0 square at S₀ (r1) | D₀δ≡1 mod 4, sign unchanged (r1) | correct | none |
| 4.2 field selection (lines 445–449) | St⊗ξ ramified; two inert; one inert (r1) | −1; −1; +1 fails (r1) | correct; B(b) now resolves to (b) | none |
| 4.3 / 4.4 (lines 461–475) | d=1,2; conductor 2q; a_q=±1 (r1) | orders 1, 1+1; split↔1−X↔St (r1) | correct; B(e) now resolves to (e) | none |
| 5.1 torsion and pairing (lines 497–501) | p=5,3,2; ℤ/25 (r1) | #E(𝔽₅)≤10<25; p=2 counterexample [2](−2)=0 (r1) | correct | none |
| 5.2 genus (line 511) | levels 1, 2 (r1) | 0, 0 (r1) | correct | none |
| 6.1 / 6.2 (lines 550–565) | signs; orders (r1) | (+1)(−1)=−1; 1−1=0; (2,1) excluded (r1) | correct; B(e) now resolves to (e) | none |
| Worked examples 1–6 | as r1 | −1, 2, 1, 0 (r1) | consistent | none |

**Citations and ownership.** The diff adds no citation, name or section; `scratch/citations.md` lists no unresolved cross-roadmap citation or Lean name. The supplier citations and declared gaps are those of a182f85 and were resolved in the previous report at the heads this brief names; the merge-order positions it lists are unchanged. The two notes for the human recorded there stand and are not findings: RankZeroOneBSDPartII cites "RankOneConverse §§PC.0–PC.6", labels this README does not have, and RankZeroOneBSDPartII's `gap:complementary-heegner-twists` on ArithmeticStatisticsPartVI names a statement this README's Downstream consumers paragraph treats as the k=2, d=1 case of §4.1.

**Shape and style of the changed passage.** The new sentence "lettered (a)–(e) as in the source and cited elsewhere in this roadmap as B(a)–B(e)" is timeless prose with no process word; the five items are a Markdown bullet list, each a complete hypothesis; the gate's text scanners pass on it. `Suggested.lean` is unchanged, so the Lean form findings of the previous report (module header, two existing `TauCeti.*` imports, one docstring, `theorem` only, no `set_option`) stand.

## Not verifiable

- none. The only source consulted this round, skinner-2020, is certified in `sources.toml` and was read from the cache at lines 104–116 and 762–782.

## Source issues

- none
