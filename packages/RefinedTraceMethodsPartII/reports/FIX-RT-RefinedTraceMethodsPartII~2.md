# FIX-RT-RefinedTraceMethodsPartII~2: repair of red-team round 2 (passes a and b)

Six P3 findings, all verified against the README, the cited sources and the supplier roadmaps. Five applied as asked, one (2a/F01) applied with a different supplier section for one of its attachments. Only `packages/RefinedTraceMethodsPartII/README.md` changed; `Suggested.lean`, `sources.toml`, `metadata.toml` and `design/plan.json` are unchanged (no new gap is needed).

## RT-RefinedTraceMethodsPartII~2a/F01 (P3) — applied differently

Verified: no `*Needs:*` or Dependencies line named these sections, and every other contract row has a consumer. Changes: §6.28 deleted (Scope, contracts). §E5:presentability.2 attached to §8.2. The StableHomotopyKTheory row is narrowed to: §7.9 → §5.1 (new Milnor clause); §§7.14–7.15, 7.17 → §4.1 (new route for its p-adic bullet); §7.11, not §§7.14–7.18, → §9.2.

Why §9.2 takes a different section: its finiteness argument ("a divisible part would contribute a nonzero Tate module one degree up") is the extension `0 → lim π_nE/p^r → lim π_n(E/p^r) → T_pπ_{n−1}E → 0`. That extension is StableHomotopyKTheory §7.11 (on main). §§7.14–7.18 are criteria for p-completeness, which §9.2 does not use. Their real consumer is §4.1: "for p nilpotent in A, `TC(A,B,I) ≃ TC(A,B,I;ℤ_p)`". §7.10 (an example tower with nonzero lim¹) and §§7.16, 7.18 have no consumer, so they left the row. The Scope import list now names the narrowed StableHomotopyKTheory sections and §E5:presentability.2. Layer 4, 5 and 9 Dependencies were updated to match.

## RT-RefinedTraceMethodsPartII~2a/F02 (P3) — applied

How to read the build: "Layer 9 applies Layers 3, 7 and 8" → "Layers 1, 7 and 8". This matches Layer 9's Dependencies line and its six `*Needs:*` lines: §§1.5, 7.2, 8.1–8.6 and 9.x, with no §3.x. Layer 3 is still used, but only through Layer 7. The other claims of that paragraph were checked against the Dependencies lines and are right: Layers 5–7 are mutually independent, and Layer 8 depends only on suppliers.

## RT-RefinedTraceMethodsPartII~2a/F03 (P3) — applied

Layer 3 Examples: "of connectivity 0 for every m" → "of connectivity −1 for every m (its π_0 is `π_0THH(k) = k`), in the convention of the §2.3 Checks". The §2.3 Check gives `Σ^{2j}(T/C_m)_+` connectivity 2j − 1; at j = 0 that is −1. Witness: m = 1, k = 𝔽_p, `THH(𝔽_p) ⊗ T_+ = THH(𝔽_p) ⊕ ΣTHH(𝔽_p)`, with π_0 = 𝔽_p and π_{−1} = 0. The conclusion is unchanged. The other uses of "connectivity" (§§2.3, 3.5) only say that it tends to infinity, so they are convention-free.

## RT-RefinedTraceMethodsPartII~2a/F04 (P3) — applied

Pinned witness *Syntomic degrees*: "(akn-delta line 119)" → "(akn-delta line 118, where it is written as the p-adic Tate module of `G_m`)". Line 118 carries `ℤ_p(1)(R) ≃ T_pG_m`; line 119 is the vanishing for i < 0. As flat sheaves, T_pG_m is the derived p-completion of `G_m[−1]`, because G_m is p-divisible flat-locally. No other locator cites lines 118–119.

## RT-RefinedTraceMethodsPartII~2b/F01 (P3) — applied

§5.1 *Needs:* appended "KTheoryFiniteLocalFields … §5.16 (the pointed-monoid equivalence in genuine cyclotomic spectra, which gives the F-equivalence its genuine form)". Layer 5 Dependencies: "§§4.0, 4.4, 5.1, 5.17" → "§§4.0, 4.4, 5.1, 5.16, 5.17". Verified at the supplier's head: §5.16 proves the circle-equivariant equivalence `T(A) ∧ N^cy(Π) → T(A[Π])`, compatible with the cyclotomic structure, for every pointed monoid Π.

## RT-RefinedTraceMethodsPartII~2b/F02 (P3) — applied

§5.4 route: "`K_q(A_d,B_d,I_d) ≃ HC_{q−1}`, which is rational because …" → "`K_q ⊗ ℚ ≅ HC_{q−1}`", followed by the proof that birelative K is already rational. Excision for `K^inv` gives K ≃ TC. Every corner C is a ℚ-algebra, so `THH(C)^{tC_p} = 0` (RefinedTraceMethods §2.3) and `TC(C) ≃ THH(C)^{hT}` (§2.9). RefinedTraceMethods §§2.3 and 2.9 were added to the *Needs* line and Dependencies. A negative-control Check was added (k = 𝔽_p gives 𝔽_p).

Verified: RefinedTraceMethods §4.18 at its head states the rational case only ("the obstruction to excision in K⊗ℚ equals that in HC⊗ℚ"). Pattern search: the other K-to-HC identifications (Layer 4 Examples, §9.1) already carry `⊗ ℚ`.

## Checks run

- **Elaboration.** `lake env lean packages/RefinedTraceMethodsPartII/Suggested.lean`, run from the content checkout, succeeded. The only output is three warnings, "declaration uses `sorry`", at lines 62, 70 and 78. The file is unchanged this round.
- **Signatures.** I put `#check @name` for all six declarations into one scratch file and elaborated it once. `cuspCount, cuspTruncationSet, cuspCoprimeSet : ℕ → ℕ → ℕ → …` and the three theorems have exactly the binders and hypotheses of README §§1.1 and 1.4: `2 ≤ a`, `2 ≤ b`, `a.Coprime b`, r for the cusp counts, and `1 ≤ m` for `card_noCyclicRepetition`. Nothing changed. The `and` entry in the worker's signature file is a parsing artifact of the docstring phrase "theorem and" at line 35; it is not a declaration.
- **Dependency check.**

```text
depcheck: 245 roadmaps, 2251 edges, 0 problem(s)
```

  No UPWARD, CYCLE or moved line. Every supplier newly cited in a `*Needs:*` line already had a contract row: StableHomotopyKTheory and EnhancedDerivedSheaves on main, KTheoryFiniteLocalFields and RefinedTraceMethods earlier in the merge order.
- **Citation resolver** on the edited README: no cross-roadmap citation and no Lean name found nowhere.
- **Supplier sections read at their current text:** StableHomotopyKTheory §§7.9, 7.10, 7.11, 7.14–7.18 (main); EnhancedDerivedSheaves §E5:presentability.2, "Limits in PrL" (main); PrismaticCohomologyPartIII §6.28 (head); KTheoryFiniteLocalFields §§4.4, 5.16 (head); RefinedTraceMethods §§2.3, 2.9, 4.17, 4.18 (head).

## Adversarial pass on the changed and added statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §4.1 route: p nilpotent in A ⇒ TC(A,B,I) p-complete | A = 𝔽_p; A = ℤ/4 (p = 2); A = 0; control A = ℚ | `π_*THH(𝔽_p) = 𝔽_p[u]`, killed by p; for ℓ ≠ p, `Ĥ(C_ℓ;𝔽_p[u]) = 0`. `π_0THH(ℤ/4) = ℤ/4`, killed by 4. All terms 0. `TC(ℚ) ≃ THH(ℚ)^{hT}` has π_0 = ℚ, whose p-completion is 0 ≠ ℚ | true; the hypothesis is needed. Nilpotence passes to B, A/I, B/I because the maps are unital (`p^N·1_B = f(p^N·1_A) = 0`) | new route sentence |
| §5.1 Milnor clause | q = 2, d = 1; degree-3 tower, p = 2, 3 | R is an iso for `2 < 2p^{r−1}`, i.e. r ≥ 2, so the tower is constant with value `TR^1_{2−λ_1} = k` (matches the Check); `3 < 2p^{r−1}` for r ≥ 2, so lim¹ = 0 | true | new clause |
| §5.4 rationality of birelative K | k = ℚ, d = 2; control k = 𝔽_p | `K_2(A_2,B_2,I_2) = ℚ = HC_1`, `HC_2 = 0`; `TC(ℚ)` has `π_{−2j} = ℚ`, all rational. Over 𝔽_p, `K_2 = 𝔽_p` and `π_0THH(𝔽_p)^{tC_p} = 𝔽_p ≠ 0` | true; the ℚ-algebra hypothesis is needed | route restated; new Check |
| §9.2 finiteness through §7.11 | R = ℤ/4, r = 1; control E = H(ℚ_p/ℤ_p) | `T_2K_1(ℤ/4)` is a quotient of `K_2(ℤ/4;ℤ_2) = ℤ/2`, and a Tate module is torsion-free, so it is 0; for the control, `π_1(E^∧_p) = T_p(ℚ_p/ℤ_p) = ℤ_p`, infinite | consistent | supplier attached |
| §8.2 colimits through §E5:presentability.2 | the zero object of G_A; the unit package | the colimit of the empty diagram is the zero package (computed by projections); the unit package is initial in C_A, as the existing Check says | consistent | supplier attached |
| Layer 3 Examples connectivity | m = 1, 2; k = 𝔽_p | π_0 = 𝔽_p, π_{−1} = 0, so connectivity −1, matching 2j − 1 at j = 0 | true | value corrected |
| Syntomic-degrees witness locator | akn-delta lines 118–119 | 118: weight 1 (`T_pG_m`); 119: i < 0 | locator now right | locator |
| Contract rows | every supplier row against every `*Needs:*` and Dependencies line | the only unconsumed rows were the four named; each now has a consumer: §7.9 → §5.1, §7.11 → §9.2, §§7.14–7.15 and 7.17 → §4.1, §E5:presentability.2 → §8.2 | complete | rows narrowed |

## Ownership and overlaps

No new object is stated. The changes only attach existing supplier sections, add two route sentences and add one Check. The overlap file lists no open pull request that changes this roadmap and no cited id that an open pull request drops. The closest roadmaps were not re-examined, because no ownership changed.

## For the maintainer

- No name that another roadmap cites changed. No Lean name changed.
- The citation of StableHomotopyKTheory §§7.9–7.10 and 7.14–7.18 is now §§7.9, 7.11, 7.14–7.15 and 7.17. PrismaticCohomologyPartIII §6.28 is no longer cited.
- The reviews' "Source issues" sections are not findings, and nothing was changed for them. The README already handles three of those errata: speirs-axes Theorem 2 (§5.3), speirs-axes Lemma 15 (Scope) and akn-delta Proposition 8.6 (§8.2). The others were not assessed this round.
