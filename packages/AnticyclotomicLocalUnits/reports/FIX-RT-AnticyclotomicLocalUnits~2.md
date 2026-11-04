# Mathematical repair report

The first finding section refers to RT-AnticyclotomicLocalUnits_r2a.md and the second to RT-AnticyclotomicLocalUnits_r2b.md. Both identifiers are F01, so the order and review attribution are kept. The two findings concern different statements (§4.3 and §4.1) and do not overlap.

## F01 (P3) — applied

Review a. Missing reciprocity conversion → the PadicHodgeRegulators contract now fixes rec_geo(u)=Art_Φ(u)⁻¹, P(κ_Kum(u),ψ)=ψ(rec_geo(u))=−ψ(Art_Φ(u)), the swapped P(ψ,κ_Kum(u))=ψ(Art_Φ(u)), and that exp* does not depend on the normalization. §4.3 states the conversion and its route applies it. A new Check gives the u=6 witness. Conventions add χ_cyc(Art_Φ(u))=N(u)⁻¹.

## F01 (P3) — applied

Review b. `(hp5 : 5 ≤ p)` → `(hp2 : p ≠ 2)` in `exists_auxiliaryQuadraticField`. The Lean docstring and module docstring now say "every odd prime". §4.1 now covers every odd prime, notes that the source assumes p≥5, and still applies the CM contracts at the standing p≥5. The route range is now 3≤p≤47. A new Check covers p=3 (D=−7) and p=2 (impossible), and the worked example adds p=3.

## Evidence for each finding

**Review a, F01.** The supplier is PadicHodgeRegulators at the head given in the brief. Its README:24 fixes geometric reciprocity with ⟨κ(u),ψ⟩=ψ(rec_K(u)). It also says that the arithmetic convention needs a sign conversion and that swapping two degree-one entries changes the sign. Its README:528 (§1.4) gives the positive adjunction Q_W(x,exp*y)=P_W(exp x,y). Its README:779–780 computes P_{ℚ₅(1)}(κ(6),logχ)=log₅(6), and over the unramified quadratic field logχ(rec_K(6))=2log₅(6).

Our arithmetic side follows ClassFieldTheory §2.6 on main, which states χ_cyc(Art_K(u))=N_(K/ℚ_p)(u)⁻¹. LubinTateFormalModulesAndQuasiCanonicalLifts (design README:12, :451) and NonordinaryCMSpecialValues (design README:374) also use arithmetic Frobenius. So the conversion is needed only where PadicHodgeRegulators is consumed.

I searched for the same construction across the whole README (`PadicHodgeRegulators`, `geometric`, `Art_Φ`, `log χ`, `ordered`). The only consumers are the supplier contract (README:106) and §4.3, plus the Layer 4 dependency line; all are repaired. §§2.1–2.5 use ClassFieldTheory's arithmetic Artin map and the Cartier evaluation, which need no conversion.

I also added ClassFieldTheory Layer 7, which supplies the absolute Artin map and its normalization, to the §4.3 *Needs:* line and the Layer 4 dependency list. The conversion uses it.

The reviewer's suggested wording was kept in substance and written in our own words, with one change. "Replacing reciprocity does not itself rescale exp*" became an exact statement: renormalizing the invariant changes the sign of P, and so the sign of the duality side of the adjunction, but leaves exp* unchanged. The reason is that exp* is cup product with log χ_cyc.

**Review b, F01.** The theorem is true for every odd prime.

- At p=3, K=ℚ(√−7) works. −7≡1 mod 8, so 2 splits. (−7/3)=(2/3)=−1, so 3 is inert. h=1.
- The route also produces this field at p=3: a=1 since (−1/3)=−1, and k=2 since 1+2·3=7≡7 mod 8, giving d=−7.
- At p=2 the statement is false. If (2)=PQ with P and Q prime and (2) also prime, then (2) contains P or Q. Since PQ lies in both, (2) equals that factor. Cancelling the nonzero principal ideal (2) then makes the other factor the unit ideal, which is not prime. So p≠2 is the sharp hypothesis.
- BKO21 line 334 shows the source's p≥5 is its standing assumption, and Lemma 3.1 (BKO21 line 339) does not use it otherwise.
- No roadmap cites the name or its signature: `roadmaps grep exists_auxiliaryQuadraticField` finds no match on main or in any open pull request, and the board packages mention it only here.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `exists_auxiliaryQuadraticField`, p≠2 (Lean and §4.1) | p=2, 3, 5, 7, 23, 47, 53 | p=2: the clauses are incompatible (argument above). p=3, 5: D=−7 has D mod 8=1, (D/p)=−1, h=1. p=7: D=−15 has (−15/7)=−1, h=2. p=23: D=−31 has (−31/23)=−1, h=3. p=47: D=−7 has (−7/47)=−1. p=53: bound √424(2+log 424)/π_real≈52.7612<53. | true for every odd p; false at p=2 | hypothesis weakened to p≠2 |
| Small-prime table, worked example | the 14 odd primes ≤47 | −7 for 3,5,13,17,19,31,41,47; −15 for 7,11,29,37,43; −31 for 23. For all 14 pairs: Euler criterion gives −1, D≡1 mod 8, and p∤h with h∈{1,2,3}. Reduced-form counts 1, 2, 3 recomputed by a short script. | complete | p=3 added |
| §4.1 route at p=3 | a∈{1,2}, k∈0..7 | (−1/3)=−1 gives a=1; 1+3k≡7 mod 8 gives k=2; m=7<24=8p; d=−7; p∤c since c=1 | route valid | range changed to 3≤p≤47 |
| p=2 negative Check | (2)=P² ramified; (2)=PQ split | prime (2) forces P=(2), then Q=(1) after cancellation; the ramified case (P=Q) fails the same way | the hypothesis cannot be dropped | Check added |
| Conventions: χ_cyc(Art_Φ(u))=N(u)⁻¹ | u=6; u=ζ∈μ₂₄ at p=5 | κ(Art 6)=6⁻¹, N(6⁻¹)=36⁻¹=χ_cyc(Art 6). On Δ: N∘κ=ω^(1+p)=ω⁶, which matches the tame cyclotomic character recorded in §0.3 | consistent with ClassFieldTheory §2.6 and LT.2 | clause added |
| Contract: P(κ_Kum(u),ψ)=ψ(rec_geo u)=−ψ(Art_Φ u); P(ψ,κ_Kum u)=ψ(Art_Φ u) | u=1; u=6 with ψ=logχ; u=p with ψ=ψ_ur (ψ_ur(Frob_arith)=1); u=ζ torsion | u=1: 0=0. u=6: 2log₅6 and the swap −2log₅6. u=p: P(κ(p),ψ_ur)=ψ_ur(Frob_arith⁻¹)=−1, swap +1. u=ζ: κ(ζ)=0 in ℚ_p coefficients and logχ(Art ζ)=log(root of unity)=0 | consistent with PadicHodgeRegulators README:24 and graded commutativity | contract added |
| Contract: exp*(logχ_cyc)=1 under either normalization | K=Φ, V=ℚ_p | Kato's map sends x to the cocycle g↦logχ(g)x, so 1↦logχ and exp*(logχ)=1. A sign change of the invariant changes P only | consistent with PadicHodgeRegulators §1.4 Check | stated |
| §4.3 Check, u=6 at p=5 | arithmetic vs geometric; de Rham vs duality side | N(6)=36. log₅6=5−25/2+125/3−⋯ has 5-adic valuation 1 (partial sum to 40 terms). logχ(Art_Φ 6)=−2log₅6. P(κ(6),logχ)=+2log₅6. Swap gives −2log₅6. De Rham side: Tr_(Φ/ℚ₅)(log₅6)=2log₅6=P. The wrong model (Art_Φ read as rec_geo) gives −2log₅6≠+2log₅6. | the Check discriminates the wrong model | Check added |
| §4.3 statement and route | consistency with §2.1 and §2.5 | §2.1 and §2.5 keep the arithmetic Artin convention of the Conventions. The π^(−n−1) coefficients −1/5 and 1/25 at n=0,1 are unchanged | no change to those formulas | conversion sentence added |

## Verification outcomes

- Required elaboration, run from the content checkout on the absolute path of the final `Suggested.lean`: exit 0. The only diagnostic was `packages/AnticyclotomicLocalUnits/Suggested.lean:58:8: warning: declaration uses sorry`. The file has one theorem, no definitions or instances, one `import Mathlib`, and no `set_option`.
- Mechanical signature audit: a scratch copy of the final file plus `#check @TauCetiRoadmap.AnticyclotomicLocalUnits.exists_auxiliaryQuadraticField` elaborated with exit 0. The elaborated type is `∀ (p : ℕ), Nat.Prime p → p ≠ 2 → ∃ K hK, ∃ (hNF : NumberField K), Module.finrank ℚ K = 2 ∧ NumberField.IsTotallyComplex K ∧ ∃ P Q, P.IsPrime ∧ Q.IsPrime ∧ P ≠ Q ∧ Ideal.span {2} = P * Q ∧ (Ideal.span {↑p}).IsPrime ∧ ¬p ∣ NumberField.classNumber K`. It matches the README §4.1 statement clause for clause. There are no section variables, and the only change from the previous signature is `5 ≤ p` → `p ≠ 2`.
- Required dependency command with `--movable`: exit 0, output exactly:

```text
depcheck: 56 roadmaps, 651 edges, 0 problem(s)
```

  There is no UPWARD, CYCLE or moved line. The only new supplier citation is ClassFieldTheory Layer 7, which is on main and was already cited elsewhere in the README.
- Citation resolver lead: `TauCeti.Iwasawa.exists_completedCoordinate` (README:70) is not a pinned declaration. It is a planned target of PadicMeasuresIwasawaAlgebras §4.5 on main (its Suggested.lean:650 and README:2660), and the README attributes it to that roadmap, so no edit was made.
- `git diff --check`: exit 0. Changed files: README.md, Suggested.lean and this report. `design/plan.json`, `metadata.toml` and `sources.toml` are unchanged; no gap was added or changed.
- No gate failures were listed in the brief.

## Ownership, sources and scope

- **Ownership and suppliers.** No new construction was introduced. The ownership of the auxiliary field existence is unchanged (§4.1, BKO21 Lemma 3.1); no roadmap on main, at an open head or in the board's packages states it. PadicHodgeRegulators and ClassFieldTheory are both earlier than this roadmap in the merge order. Supplier text was read at PadicHodgeRegulators README:24, :528 and :779–780 (head given in the brief), at ClassFieldTheory §2.6 on main, and in the LubinTateFormalModulesAndQuasiCanonicalLifts and NonordinaryCMSpecialValues design packages.
- **Sources.** No new source was cited or requested. BKO21 lines 334 and 339 were re-read. Wiles78 and Kato93 keep their settled uncertified status.
- **Untrusted text.** Neither review contained suspicious instructions.

## Notes for the maintainer

- `exists_auxiliaryQuadraticField` keeps its name. Its hypothesis is now `p ≠ 2`, which is strictly weaker than `5 ≤ p`. No other roadmap cites it, so no consumer changes.
- The geometric/arithmetic conversion now pinned in this roadmap is the one PadicHodgeRegulators asks of every arithmetic-convention consumer at its README:24. InertAnticyclotomicCMMainConjecture imports §4.3's reciprocity values. Its signed reciprocity laws should apply the same conversion if it consumes PadicHodgeRegulators directly.
