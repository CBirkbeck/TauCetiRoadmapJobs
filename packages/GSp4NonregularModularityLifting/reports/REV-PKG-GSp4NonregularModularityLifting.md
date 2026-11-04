<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1219#issuecomment-6388690836 -->
Review (claude) of f7b2dd9

Verdict: needs changes

1. **F01** (P2) Target headings carry an `NR` prefix, so the board reads zero targets

   - **Location.** Line 150 `## Layer NR0: Conventions, residual data and tame levels`; line 154 `### NR0.1 Nondegenerate ordinary roots`; the same form appears on all 12 layer headings and all 64 target subsections (lines 154–1650), and in `Suggested.lean` line 46 `/-! ## Layer NR10: Characteristic-zero higher-Hida patching -/`.
   - **Claim.** The package's targets are its `### NRk.n` subsections.
   - **Witness.** The board's target reader matches only `### k.n Title` with digits (`^###\s+(\d+\.\d+[a-z]?\b.*)$`). On this README it returns no targets, and the gate's target-id scan reports all 64 headings. That explains the submission log's "0 targets" and the empty seeded sample.
   - **Repair.**
     - Rename `## Layer NRk: Title` to `## Layer k: Title` and `### NRk.n Title` to `### k.n Title`. Keep the letter suffixes as `### 3.1a`, `### 11.0a` and `### 11.0b`: the reader's `[a-z]?` accepts them.
     - Rewrite every in-text label the same way: `NRk.n` becomes `k.n` (or `§k.n`), and `NRk` becomes `Layer k`. There are 290 such labels in the README and 17 in `Suggested.lean`, including the section comment on line 46.
     - Two gap `needs` sentences contain labels: "NR1.1" in gap:normalized-integral-siegel-p-actions and "NR11.0a" in gap:dyadic-polarized-ordinary-global-data. Edit them identically in the README contract and in `design/plan.json` `gaps`, so that the two copies stay equal.
     - **Tested.** I applied the two heading substitutions to a scratch copy and ran the gate's own functions. The reader then returns 64 targets ("0.1 Nondegenerate ordinary roots" … "11.6 Ordinary weight-two modularity lifting"), and both the target-id scan and the layer-id scan return nothing.

2. **F02** (P2) NR10.5 restates IntegralHeckeAndGaloisDeterminants §1.5 with one hypothesis dropped

   - **Location.** Line 7: "NR10.5 owns prescribed-multiplier symplectic descent in every residue characteristic; it extends the odd-characteristic statement of IntegralHeckeAndGaloisDeterminants §1.5." The same ownership is asserted in §NR10.5 (lines 1388–1432) and on lines 23, 90, 1293, 1430, 1436 and 1440.
   - **Claim.** This roadmap owns symplectic coefficient descent in all residue characteristics.
   - **Witness.**
     - IntegralHeckeAndGaloisDeterminants is earlier in the merge order (ORDER.txt line 29). Its §1.5 "Symplectic coefficient descent with prescribed multiplier" and the `symplectic_coefficient_descent` in its `Suggested.lean` give the same conclusion: an A-valued representation with the same form and multiplier, and a conjugating similitude congruent to 1. The only extra hypothesis is `(hp : 2 < p)`.
     - BCGP25 line 7772 introduces Lemma 7.4.8 as Gee–Geraghty Lemma 7.1.1 adapted to p=2. That is the very lemma IntegralHeckeAndGaloisDeterminants cites.
     - NR10.5's proof route cites "Carayol's lemma (same layer)" and "the same supplier's integral Schur comparison". Neither name occurs in that roadmap; its Schur input is CHT Lemma 2.1.8 (BCGP25 line 7786).
   - **Repair.**
     - Delete §NR10.5 as a target, together with the ownership clauses on lines 7, 23 (its last two sentences), 90, 1293 (the parenthesis), 1430, 1436 and 1440.
     - Add to `design/plan.json` `gaps`, with supplier IntegralHeckeAndGaloisDeterminants and section §1.5, and state under "From TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants": "What IntegralHeckeAndGaloisDeterminants must provide (gap:symplectic-descent-every-residue-characteristic): Remove the residue-characteristic p>2 hypothesis from `symplectic_coefficient_descent`, keeping the continuous A-valued representation with the same alternating form and full multiplier and the similitude conjugator congruent to 1 modulo m_B (BCGP25 Lemma 7.4.8)."
     - Repoint NR10.6's Needs item "NR10 (symplectic coefficient descent in every residue characteristic)" (line 1450) to that gap.
     - **Tested.** After the repair the odd-p case is cited from §1.5 rather than restated, and the p=2 instance (the S=R=𝔽₂ Check, line 1426) becomes the content of the gap.

3. **F03** (P2) The only theorem in Suggested.lean is a supporting lemma, not a headline

   - **Location.** `Suggested.lean` lines 50–95 (`standardAlternatingMatrix`, `HasPrescribedMultiplier`, `symplecticCoefficientDescent`), and docstring line 39: "NR10.5 is stated below on native four-dimensional matrix representations."
   - **Claim.** NR10.5 is a headline theorem that is statable at the pins.
   - **Witness.**
     - The README Summary (line 3) names the end results: minimal R=T with freeness, ordinary family lifting, and weight-two modularity.
     - BCGP25 line 7772 introduces 7.4.8 as a lemma for the proof of Proposition 7.4.10, and NR10.6 consumes it as one step.
     - The two definitions exist only to state it.
   - **Repair.**
     - Delete all three declarations. Keep `import Mathlib`, the namespace, and a docstring saying that no headline is statable at the pins, listing each end theorem (renumbered NR8.2–8.3, 8.5, 9.2–9.4, 10.8, 11.3–11.6, …) with its missing carrier; lines 10–37 already give them. A file that states nothing, with its docstring saying why, is the correct form here.
     - In the README, remove the backticked names `standardAlternatingMatrix`, `HasPrescribedMultiplier` and `symplecticCoefficientDescent` (lines 9 and 1396).
     - Remove the "From Mathlib" sentence on line 36 that describes this signature. That sentence also lists `IsLocalRing.ResidueField` and `IsLocalRing.residue`, which the signature never uses.
     - The prose API and Checks of NR10.5 move to the gap request of R02.
     - **Tested.** The one-tactic probe (`simp`, `rfl`, `infer_instance`, `exact?`) does not close the theorem, so this is not one-tactic padding. It is removed because it is not a headline.

4. **F04** (P1) NR7.4 needs a "selected characteristic-zero rank inequality" that nothing owns

   - **Location.** Line 1066: "*Needs:* … AutomorphicBundlesPartII (gap:normalized-integral-siegel-p-actions); selected characteristic-zero rank inequality." Line 1052 repeats it: "together with the characteristic-zero rank inequality on this very summand".
   - **Claim.** Every input of NR7.4, and hence of NR8.1–NR8.3 and NR8.5, has an owner.
   - **Witness.**
     - The item is not a target here, not a supplier section, and not a slug in `design/plan.json` `gaps`.
     - AutomorphicBundlesPartII's coherent-dimension equality (IC.8) concerns the whole localized module.
     - CG20 Theorem 7.11 (CG20 line 2056) likewise proves balance only for the whole module.
   - **Repair.** Either option closes the gap:
     - **New target.** Add "### 7.5 Selected characteristic-zero rank inequality": for non-Eisenstein m, dim_E e_αβH¹(X₀(Q),L)_{m,E} ≤ dim_E e_αβH⁰(X₀(Q),L)_{m,E}, under the classification input of AutomorphicBundlesPartII IC.6–IC.8. Give as its route grouping IC.8's multiplicity-counted summands by π_f (which fixes the p-eigenvalues), using the degree-one p-action of gap:normalized-integral-siegel-p-actions. Then cite 7.5 in NR7.4.
     - **Declared gap.** Declare the same sentence as a gap on AutomorphicBundlesPartII IC.8.
     - **Tested.** On the refuting instance S⊕k (line 1060), the new target supplies exactly the selected rank bound that the whole-module theorem cannot.

5. **F05** (P1) The comparison with Mathlib's standard symplectic form has the wrong sign

   - **Location.** Line 9: "The elementary `standardAlternatingMatrix` specializes Mathlib’s standard block form by exchanging the last two coordinates". Line 1402: "Exchanging the last two coordinates identifies it with Mathlib’s standard block form."
   - **Witness.** Mathlib defines `Matrix.J l R := Matrix.fromBlocks 0 (-1) 1 0` (`Mathlib/LinearAlgebra/SymplecticGroup.lean` line 58). In a scratch file elaborated at the pins, swapping indices 2 and 3 of `standardAlternatingMatrix ℚ` equals `-(Matrix.reindex finSumFinEquiv finSumFinEquiv (Matrix.J (Fin 2) ℚ))`. For example, entry (1,3) is 1 against −1.
   - **Repair.** Delete both sentences along with R02 and R03. If any comparison is kept, write: "exchanging the last two coordinates carries it to −`Matrix.J (Fin 2) A` = `(Matrix.J (Fin 2) A)ᵀ` under `finSumFinEquiv`; both give the same symplectic group and multiplier equation." Tested by the same elaboration.

6. **F06** (P2) Three declared gaps are compound, partly provided, or rely on this roadmap's own target

   - **Location.** Line 134 (gap:gsp4-local-blocks-and-monodromy); line 58 (gap:normalized-integral-siegel-p-actions): "Extend the normalized H⁰ actions constructed in NR1.1 to the needed cuspidal coherent complexes"; line 80 (gap:gsp4-global-patching-data).
   - **Witness.**
     - (a) Line 134 bundles six distinct local results. One of them, adjoint-L holomorphy at s=1 for generic packets, is ModularityAndLanglandsExtensions §3.5 item (vii): a generic member exists exactly when L(s,adφ) is holomorphic at 1. That roadmap is earlier in the order.
     - (b) The supplier AutomorphicBundlesPartII (ORDER.txt line 231) precedes this roadmap (line 260), yet the gap asks it to extend this roadmap's NR1.1. The phrase "the needed" complexes is unspecified.
     - (c) Line 80 bundles the CG Selmer presentation (used by NR8.1), the BCGP two-torus data (NR10) and the variable-weight data (NR9.2).
   - **Repair.**
     - (a) Cite ModularityAndLanglandsExtensions §3.5(vii) for adjoint holomorphy in NR2.6 (line 481) and drop it from the gap. Split the rest into one gap per result: the Steinberg U-eigenvalue; Klingen no-newforms and the spherical-to-refinement constant; generic paramodular newvector uniqueness at the conductor; the ordinary and neat-prime refinement lines; and pure-monodromy uniqueness.
     - (b) Make the gap self-contained: "Construct normalized integral Siegel p-operators T_{p,1}, Q_{p,2} on RΓ(X₁(Q),ω(a,2)(−D)) in degrees 0 and 1, agreeing in degree 0 with CG20's q-expansion operators (§8.4), with commuting idempotents compatible with coefficient change, Serre duality and deck descent."
     - (c) Split into gap:gsp4-cg-selmer-presentation (fixed-multiplier Selmer presentation with qTW≥1 and labelled Klingen Taylor–Wiles sets), gap:gsp4-torus-tw-data (the two-torus auxiliary sets and uniform marked cotangent bounds, including p=2) and the P12 variable-weight data. Cite each only where it is used.
     - **Tested.** Each resulting `needs` names one deliverable and cites no target of this roadmap.

7. **F07** (P3) Blanket "gaps above" items in Needs lines add dependencies the targets do not have

   - **Location.** Lines 219 (NR0.3), 652 (NR3.4) and 881 (NR5.2): "the ordered-flag and dyadic gaps above". Lines 417 (NR2.2) and 937 (NR6.2): "the local-block and projective-Satake gaps above". Line 1344 (NR10.2): "PadicFamiliesPartII F8 (gap:p12-ordinary-horizontal-control in NR9)".
   - **Witness.**
     - NR0.3, NR3.4 and NR5.2 are the odd-p CG branch (line 23: p≥5), yet they cite the P12 flag gap and the dyadic gaps.
     - NR2.2 (the Steinberg eigenvalue) cites the BCGP25 Lemmas 7.4.11–7.4.12 Satake gap.
     - NR10.2 cites the P12 Borel/parabolic gap.
     - Duplicates: line 194 lists ShimuraData §§5.9–5.10, 5.18 twice, and line 1630 lists EndoscopicTransferAndUnitaryTraceComparison §13.2 twice.
   - **Repair.** Name the specific slug each target uses, and drop the rest along with the duplicates. For example: NR0.3 keeps only gap:gsp4-global-patching-data; NR2.2 keeps only the Steinberg part of gap:gsp4-local-blocks-and-monodromy; NR10.2 drops gap:p12-ordinary-horizontal-control.

8. **F08** (P3) Process narrative, stale labels and a target outside every layer

   - **Location.**
     - Line 1628: "The regular lifting theorems are an explicit missing interface (regular ordinary support gate) and the solvable descent is requested from EndoscopicTransferAndUnitaryTraceComparison ET.7".
     - Line 1169: "classification registry ML.0". Line 1036: "imported under the ownership amendment". Line 184: "in the source ledger".
     - Line 767: "until proved". Line 813: "remains an explicit verification obligation". Line 1486: "remain open supplier contracts".
     - Line 983: heading "selected balance gate". Line 1078: "proof gates".
     - Line 1678: "is a separate target", although that target lives in no layer.
     - Line 1686: "endpoints recorded in ModularityAndLanglandsExtensions".
   - **Witness.**
     - EndoscopicTransferAndUnitaryTraceComparison has no ET.7: its Layer 7 is algebraic isocrystals, and the descent is §13.2, as line 1630 cites. NR11.0a–NR11.0b now supply the regular support that line 1628 calls missing.
     - ModularityAndLanglandsExtensions' Layer 0 is realization comparisons, not a classification registry, and that roadmap never consumes this one.
   - **Repair.**
     - Line 1628: "The regular ordinary support is NR11.0a–NR11.0b and the solvable descent is EndoscopicTransferAndUnitaryTraceComparison §13.2."
     - Delete the ML.0 sentence (line 1169) and the phrases "imported under the ownership amendment" and "in the source ledger".
     - On lines 767, 813 and 1486, state each dependency without time words (for example, "NR8.2 has NR4.5 among its premises").
     - Rename Layer 7 to "Coherent defect and selected balance", and drop "proof gates" from line 1078.
     - Make the p-polynomial equality of line 1678 a numbered Layer 3 target, or delete the sentence.
     - On line 1686, name only later consumers (AbelianSurfacesModularity).

9. **F09** (P3) NR11.0a's definite-unitary ordinary tower overlaps PotentialModularityAndCompatibleSystems §8.3 without citing it

   - **Location.** Line 1508: "Construct the ordinary definite-unitary integral tower on the group over F⁺ compact at infinity and quasi-split at finite places…".
   - **Witness.** PotentialModularityAndCompatibleSystems §8.3 is earlier in the order. For odd l it already builds the rank-two case: the definite U(2) ordinary idempotent, the big ordinary Hecke algebra over Λ, and Λ-freeness at levels without l-torsion stabilizers.
   - **Repair.** Add to Scope and to NR11.0a: "The rank-two odd-characteristic tower is PotentialModularityAndCompatibleSystems §8.3; NR11.0a differs by arbitrary rank n and by allowing p=2 (upper-Iwahori level above 2)." Cite §8.3 in NR11.0a's Needs for n=2.

10. **F10** (P3) Three Checks do not discriminate as written

   - **Location.**
     - Line 1185 (NR8.5): "An ordinary semistable extension with N of rank 1 is not crystalline (N has rank 0 there)".
     - Line 629 (NR3.3): "diag(1,2,−2,−1) … fails the prescribed common multiplier despite determinant 4".
     - Line 775 (NR4.5): "the determinant multipliers are 1 and 1".
   - **Witness.**
     - (a) N lowers the Frobenius slope by exactly 1. The slopes here are 0,0,a−1,a−1 with a−1≥3, so N=0 for every such semistable lift; a non-crystalline example exists only at a=2.
     - (b) Pairing the eigenvalues as {1,2},{−2,−1} gives products 2 and 2, so the element is GSp₄-conjugate with multiplier 2.
     - (c) det(diag(1,2))=2. Only the Legendre symbol (2/7) equals 1.
   - **Repair.**
     - (a) "At a=2 a semistable extension of 1 by ε with N≠0 is not crystalline; at a≥4 the slope gap forces N=0, so the crystalline hypothesis is automatic."
     - (b) Use diag(1,2,3,4) over 𝔽₇. The three pairings give products (4,6), (3,1) and (2,5), never equal, while det=3 and trace=3.
     - (c) Write "the Legendre symbols (det Q/7) are 1 and 1".

11. **F11** (P3) NR3.1a's order-two claim cites pages that do not contain it

   - **Location.** Line 577: "the secondary section has order two on the reduced divisor … (P20 §§6.3.3–6.4, pp.31–36; …)".
   - **Witness.** The order-two vanishing along the p-rank-zero locus is P20 Remark 6.4.1, author p.37 (P20 line 1652). Lemma 6.4.2's extension also continues onto p.37. CG20 line 1936 records the same order-two fact.
   - **Repair.** Change the locator to "(P20 §§6.3.3–6.4 and Remark 6.4.1, pp.31–37; CG20 proof of Lemma 7.5, pp.849–850; P20 line 1374 and line 1652, CG20 line 1910)".

12. **F12** (P3) Layer Examples repeat a Check word for word; two stray lines

   - **Location.** The Examples sections at lines 271, 373, 656, 837, 977, 1070, 1193, 1285, 1492 and 1670. Stray continuation lines at 304 and 1521.
   - **Witness.** Line 271 repeats NR0.1's first Check (line 170), and line 1492 repeats NR10.1's first Check (line 1311). Line 1521 opens "that term" with no antecedent, inside a Checks list.
   - **Repair.**
     - Give each layer a worked example that combines two of its targets and is not already a Check. For example, Layer 0: the roots 2,3 in 𝔽₁₁ with p=11 and a=4, which passes both the NR0.1 predicate and the NR0.3 weight range.
     - Fold line 304 into NR1.1's prose, and attach line 1521 to NR11.0a's paragraph with its antecedent (the h³ term) named.

Six blocking findings (R01–R06) and six non-blocking ones (R07–R12). The mathematics of the README is careful, and the 15 sampled locators all resolve to the cited theorem and page. The blocking problems are structural: the headings are invisible to the board, NR10.5 restates an earlier roadmap's theorem and is the only declaration in `Suggested.lean` although it is not a headline, one prerequisite has no owner, one comparison has the wrong sign, and three declared gaps are malformed. Line numbers refer to `packages/GSp4NonregularModularityLifting/README.md` unless another file is named.

## Verified sound

### Elaboration, binders, probe and dependency check

- **Elaboration.** `lake env lean` on `packages/GSp4NonregularModularityLifting/Suggested.lean` from the content checkout exits 0. The only message is "declaration uses `sorry`" (line 65). No Tau Ceti import, so no module had to be built.
- **Binders.** A scratch file with `#check @` for all three declarations elaborates. Every binder is in the theorem's own signature (no section variables); the definitions keep `[CommRing A]` and `[Group Γ] [CommRing A]`. The elaborated types match the README prose of NR10.5 (lines 1390 and 1396).
- **Truth of the statement.** I checked that the theorem as stated is true. The descended representation keeps the multiplier, because CᵀJC=cJ gives C⁻ᵀJC⁻¹=c⁻¹J. The conjugator can be taken congruent to 1 by lifting along GSp₄(S)→GSp₄(k). ι(S) is closed in R by Chevalley's lemma, so continuity of ρS follows.
- **One-tactic probe.** `simp`, `rfl`, `infer_instance` and `exact?` each fail to close the theorem.
- **J facts.** J²=−I is checked in Lean over ℚ. The Check C=I+εE₁₄ over k[ε]/(ε²) satisfies CᵀJC=J, since E₄₁J+JE₁₄=E₄₄−E₄₄=0.
- **Dependency check.** Output, with no UPWARD, CYCLE or `moved:` line:

```text
depcheck: 34 roadmaps, 326 edges, 0 problem(s)
```

### Seeded sample (15 targets, all locators resolve)

The rule is the worker's `seeded_sample` (seeded by the job id) applied to the 64 renamed `### k.n` headings.

| Target | Locator checked | Finding at the locator |
| --- | --- | --- |
| NR0.3 | CG20 Assumptions 4.1–4.3, Definition 4.6, pp.812–816 (line 519); Definition 6.15, p.844 | H1–H3, the U1/U2/U3/P/H types, the shape at p, and Remark 4.4 (P empty) all match. Definition 6.15 lacks nonzeroness (source issue). |
| NR0.4 | Assumption 4.2 p.813; §5.1–5.2 pp.820–822; §6.3 pp.840–841 | Levels paramodular/Klingen/Iwahori/Π⁺/full match. q≥3 is consistent with the §5.2 neatness condition (line 904). |
| NR3.1 | Definition 6.1, Definition 6.3, Lemma 6.4, Remark 6.5, pp.836–837; P20 Theorem 11.2.1 p.70 | p^{m−1}∣s and away-p equivariance only: matches. |
| NR3.1a | P20 §6.3.2 pp.30–31 (line 1345); §6.3.3; §6.4; CG20 Lemma 7.5 | The construction Ha(Gᵐ)^{p+1}⊗Ha′(Gᵒᵒ) in (det ω)^{p²−1} and Cartier duality match. Page range short (R11). |
| NR3.2 | Remark 6.5 p.837; proof of Theorem 6.13 pp.842–843 | The selected-annihilator point is confirmed (source gap recorded). |
| NR4.6 | Lemma 8.17, pp.868–871 (line 2660) | j>2 and j=2 systems match. UF₀=0 follows from UX₂=0 even when α+β=0. |
| NR5.2 | Theorem 6.17 pp.845–846; Definition 4.6 | Matches, including p−1>a and the root condition. |
| NR6.2 | Theorem 7.3 pp.847–848 (line 1859) | The vanishing hypothesis matches. The source's d_Q⁻¹tr inverse is wrong (source issue). |
| NR8.2 | Theorem 9.1 pp.878–880 (line 2999) | Hypotheses (1)–(6) match. Step (c) gap recorded. |
| NR8.3 | Theorem 1.2 p.803; Theorem 9.1; Assumption 4.2 | Neatness does follow from H1 through a scalar r̄(σ), since ζ_p is not in Q(ad⁰r̄). |
| NR8.4 | Remark 4.12 pp.819–820; §5.4 pp.831–832 (Iwahori at 5, paramodular at 3 and 19); §1.2; Remark 6.14; Remark 8.18 | Matches. The K̄-nonisogeny correction is right (source issue). |
| NR8.5 | Theorem 1.1 p.802 (line 38) | Matches. The Euler factors are restricted to good primes. One Check is vacuous (R10). |
| NR9.3 | P12 Theorem 7.1 p.36 (line 1795) | iκ′=(0,2−k₂′,1−k₁′,3−k₁′−k₂′) and inertia/residual matching agree. |
| NR11.2 | BCGP25 Proposition 7.5.10 (A1)–(A5), (B1)–(B5), p.177 (line 8129) | All ten conditions match. |
| NR11.3 | BCGP25 Proposition 7.5.1, Lemma 7.5.2 pp.174–175; (7.5.5); Lemma 7.5.8 pp.176–177 | K_ℓ=Par(ℓ^{a(ρ)}); a common component with q; nonzero fiber; purity in Lemma 7.5.2. |

No locator was flagged as unverified by the author.

### Adversarial table (every statement)

Values are computed by hand or in Lean, as stated.

| Statement | Instance | Values computed | Result |
| --- | --- | --- | --- |
| Conventions: WD relation | r(F)=diag(1,3), N=E₁₂ | rNr⁻¹=(1/3)N | holds |
| Conventions: ε, det | a=2, ℓ=3 | ε(Frob₃)=1/3; ν=ε⁻¹→3; det=ν²=9 | holds |
| Conventions: Pilloni parameter | Ω(0,2), Ω(2,2) | (1−k−r,2−r;k+2r)=(−1,0;4) and (−3,0;6) | holds |
| Conventions: discriminant | Q=diag(1,1), p=7 | d=−4≡3, not in {1,2,4}; det=1 is a square | holds |
| Conventions: polynomials | eigenvalues 2,3 | X²−5X+6 and 1−5X+6X² | holds |
| Conventions: P12 list | κ=(2,2) | iκ=(0,0,−1,−1), HT 0,0,1,1 | holds |
| Layer 2 example: dual-spin | HT {0,0,1,1}, ν=ε⁻¹ | dual {0,0,−1,−1} → +3 gives {2,2,3,3}; ν: ε→ε·ε⁻⁶=ε⁻⁵ | holds |
| NR0.1 | 𝔽₁₁ (2,3); (2,6); (1,3); (2,9) | 3·8·(−1)·35≡7; αβ=12≡1→0; 1−1=0; (2,−2) passes (α+β=0 allowed) | holds; α+β=0 tested in NR4.6 |
| NR0.2 | Ω(0,2), Ω(2,2) | ω(2,2), ω(4,2); λ as above | holds |
| NR0.3 | p=7, a=4,5,6 | 4<6 passes; 6<6 fails; a=5: ν(c)=(−1)^{−4}=1, not odd | holds |
| NR0.4 | q=2; Q=∅ | full level 2 is not neat (needs ≥3, CG20 line 904); trivial cover | holds |
| NR0.5 | 𝔽₁₃ (2,4,11,9) | αδ=18≡5=βγ=44≡5; αβ=8=γδ=99≡8 | rejected, as stated |
| NR1.1 | d=0, r=2; b=2 | sums 4,3,3; pT+(p+p³)S = p^{3−b}T+(1+p²)p^{3−b}S (CG20 Lemma 6.2) | holds |
| NR1.2 | k², T=diag(c,c+1), Q=diag(d+1,d) | e(T,c)e(Q,d)=diag(1,0)diag(0,1)=0; union 1−0=I | holds |
| NR1.3 | zero form | satisfies both eigen-equations; excluded by "nonzero" | holds (fixes CG20) |
| NR2.1 | [[0,2],[1,0]] | X²−2, roots ±√2, degree 2 | holds |
| NR2.2 | (2,2), (4,2), (3,3) | (j+k−6)/2 = −1, 0, 0; x=3 gives 1/3, valuation −1 | holds |
| NR2.3 | diag(1,2,3,6) | e₁..e₄=12,47,72,36 | holds |
| NR2.4 | (1,0,0); roots (1,1,2,3) | 1≡1; w=1 gives 2 vs 1; one zero difference | holds |
| NR2.5 | α,β,β⁻¹ε⁻¹,α⁻¹ε⁻¹ | paired products ε⁻¹, ε⁻¹; det ε⁻²; ℓ=3 gives 3, 9 | holds |
| NR2.6 | N=0, E₁₂ | both satisfy rNr⁻¹=q⁻¹N; ranks 0, 1 | holds |
| NR2.7 | w=0, 2; χ₂(u)=ζ₃ | −1,−1,−2,−2 / −2,−2,−3,−3; third entry ζ₃⁻¹u^{−2−w/2} | holds |
| NR2.8 | dim W=1, 2, and 3 | 4, 8; 3 is not a multiple of 4; E[t]/t² quotient and socle of dimension 1 | holds |
| NR3.1 | p=5, m=3; p=2 | s∈25ℤ; 3²=9≡1 mod 4; (1+ϖ)²−1=ϖ²(ϖ+1) | holds |
| NR3.1a | p=5; k[x,y]/(xy) | (p−1)(p+1)=24; x·y=0 | holds |
| NR3.2 | k×k on k², select e₁ | Ann_sel=0×k, full Ann=0 | holds |
| NR3.3 | (1,2,3,6); 𝔽₅ diag(1,2,−2,−1) | ν=6, det 36, (−6)²=36; pairing {1,2},{3,4} gives 2=2 | Check 2 weak (R10) |
| NR3.4 | (a,b)=(4,3); b=2 | 0,−1,−3,−4 with sums −4; 0,0 | holds |
| NR4.1 | 𝔽₅; Q=(1,0,p) | (1/5)=1, (2/5)=−1; d=−4p; disc(pQ)=p²disc(Q) gives UX₂=0 | holds |
| NR4.2 | p=7, k=8; k=p−1=6 | 8·15≡1; Θ(h)=0 with h≠0 while 6·11≡3 is not excluded | holds (needs the explicit exclusion) |
| NR4.3 | β-eigenvector | π_β=1, (U−α)^m=(β−α)^m | holds |
| NR4.4 | c=6 in 𝔽₁₁ | 6³−6≡7−6=1 | holds |
| NR4.5 | Q=(1,0,7), diag(1,1), diag(1,2) | d=−28, det 7; (3/7)=(6/7)=−1; det 1, 2 | Check 3 wording (R10) |
| NR4.6 | j=2 system; α=2, β=9 in 𝔽₁₁ | Z₂F=αβF_α, Q₂F=αβF; with α+β=0, ZF=βF_α=βF+αF₀ | holds |
| NR4.7 | β=3 in 𝔽₁₁; p=7 | 3·4≡1; weights (8,8) and (6,6) | holds |
| NR4.8 | O/ϖ² torsion layer | a kernel vector ϖv≠0 gives a residual kernel vector | holds |
| NR5.1 | e₁,e₂ vs e₁,e₁; a<p−1 | minors 1, 0; ε̄^{1−a} trivial on inertia only if p−1∣a−1 | holds |
| NR5.2 | diag(χ,χ,χ⁻¹,χ⁻¹) | products 1, 1 | holds |
| NR6.1 | Q=∅; αβ=γδ | pr=1; separation fails | holds |
| NR6.2 | q=11, p=5, δ²=−43 | αβ=11; (qα−β)/((q+1)δ)=1/2−5δ/516≡3; v=6−5δ/43≡1; 1+x+x²+x³≡4 | holds |
| NR6.3 | k×k; k[x,y]/(xy) | (1,0)(0,1)=0; xy=0 | holds |
| NR6.4 | m=2 | lengths 1+1=2 | holds |
| NR7.1 | a=4 | L=ω(1,−1); L∨=Sym²⊗det⁻¹; ω(3,3)⊗L∨=ω(4,2) | holds |
| NR7.2 | E/O; summand k | divisible with dual O; ϖ acts by 0 on k | holds |
| NR7.3 | S=O[C_p] | (1+T)^p−1∈m², cotangent 2; d(S)=1, d(k)=−1, d(S⊕k)=0 | holds |
| NR7.4 | projection S⊕k→k | selected −1, total 0 | holds; input unowned (R04) |
| NR8.1 | diag(χ,χ,χ⁻¹,χ⁻¹); diag(1,1,u,u) | multipliers 1 and u | holds |
| NR8.2 | T¹ vs T⁰; O[ε]/ε²→O | annihilators 0 and T; kernel (ε) | holds |
| NR8.3 | (p,a)=(7,4), (5,4) | 4<6 holds; 4<4 fails; vanishing p≥a≥4 holds (CG20 Remark 7.8) | holds |
| NR8.4 | Sp₄(𝔽₂); (12); (123) | 16·15·3=720; 8 fixed vectors (dim 3); 4 fixed vectors (dim 2) | holds |
| NR8.5 | a=4; slopes | HT 0,0,3,3 with sums 3=ε⁻³; N=0 forced for a≥4 | Check 3 vacuous (R10) |
| NR9.1 | p=5: ε̄ vs ε̄⁻¹ | 2 vs 3 | holds |
| NR9.2 | Λ at (0,0); κ=(2,2) | O; 0,0,−1,−1 | holds |
| NR9.3 | κ′=(4,2), (1,1) | (0,0,−3,−3), (0,1,0,1) | holds |
| NR9.4 | k′=2, 3 | (0,0,−1,−1), (0,−1,−2,−3) | holds |
| NR10.1 | p=2, r=7 | 7≡3 mod 4 | holds |
| NR10.2 | one prime, cyclic p-part of order p^N | two torus directions give p^{2N} | holds |
| NR10.3 | rank d | Λ-rank d·p^{2N}; 8 is not a unit at p=2 | holds |
| NR10.4 | zero module; ±ν | zero ring; equal squares | holds |
| NR10.5 | J²; C=I+εE₁₄; swap(2,3) | −I (Lean); CᵀJC=J; swapped J = −Matrix.J (Lean) | true theorem; comparison false (R05) |
| NR10.6 | zero module; u vs u⁻¹ | unique map to 0; differ unless u²=1 | holds |
| NR10.7 | k[C₂] in characteristic 2 | regular: N[1]=1+g, an isomorphism; trivial: N=1+1=0 | holds |
| NR10.8 | (1+t)^{p^N}−1; E[[x]]/(x²) | t-coefficient p^N≠0; kernel (x²) | holds |
| NR11.0a | n=4, F⁺=ℚ; [F_v:ℚ₂]=7, 8 | 4∣4; bound n(n−1)/2+1=7 fails at 7, passes at 8; 1+16+80=97; 3⁻¹ at diag(1,3) | holds |
| NR11.0b | p=3: q_v=7, 19 | 7≡7 mod 9 fails; 19≡1 passes | holds |
| NR11.1 | R=3: (−4,−1), (0,3), (−1,−4) | (3,3) passes; (3,−5) fails; −3 fails | holds (BCGP25 Definition 7.5.7) |
| NR11.2 | (A1)–(B5) | against BCGP25 Proposition 7.5.10 | holds |
| NR11.3 | fiber 1 vs 0 | Lemma 7.5.8 needs a nonzero fiber | holds |
| NR11.4 | E×E, M=E×0; E[ε]/ε², M=E | support is one component; annihilator (ε) | holds |
| NR11.5 | four fibers of dimension 1 | total 4, individual rank 1 | holds |
| NR11.6 | 4n=4; [[a,1],[0,a]] | n=1; nilpotent part of rank 1 | holds |

### Library declarations opened at the pins

All paths are within the Mathlib and Tau Ceti pins of the content checkout's manifest.

- `Mathlib/LinearAlgebra/SymplecticGroup.lean`: `Matrix.J` (line 58), `Matrix.symplecticGroup` (line 101).
- `Mathlib/LinearAlgebra/Eigenspace/Basic.lean`: `Module.End.genEigenspace` (line 71), `mem_genEigenspace_nat` (line 89).
- `Mathlib/Algebra/Group/Idempotent.lean`: `IsIdempotentElem` (line 37).
- `Mathlib/Algebra/Algebra/Subalgebra/Lattice.lean`: `Algebra.adjoin` (line 32).
- `Mathlib/RingTheory/AdicCompletion/Basic.lean`: `IsAdicComplete` (line 56).
- `Mathlib/Topology/Algebra/Nonarchimedean/AdicTopology.lean`: `IsAdic` (line 158).
- `Mathlib/RingTheory/LocalRing/MaximalIdeal/Defs.lean`: `IsLocalRing.maximalIdeal` (line 30).
- `Mathlib/RingTheory/LocalRing/ResidueField/Defs.lean`: `IsLocalRing.ResidueField` (line 28) and `IsLocalRing.residue` (line 36).
- `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`: `Matrix.GeneralLinearGroup` (line 42).
- `Mathlib/Data/ZMod/Defs.lean`: `ZMod` (line 138).
- `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean`: `TauCeti.ContCohomology.H1` (line 712).
- Neither Mathlib nor Tau Ceti has a GSp or Siegel-form carrier, which confirms the docstring's "not statable" list.

### Cross-roadmap citations resolved

Each was checked at the open head through `roadmaps show`, or in the board's design packages:

- ArithmeticGaloisRepresentations §§5.11, 6.4, 7.3–7.12 (§7.6 "Semisimplicity criteria" = BCGP25 Propositions 4.11.1–4.11.2).
- AutomorphicBundles B3–B5, B3.HT.
- AutomorphicBundlesPartII IC.1–IC.8 (board design; IC.4 asserts no integral p-operator, so NR1.1 is not duplicated).
- AutomorphicGaloisRepresentationsPartII AG2.P, AG2.5, AG2.6 and their three named GSp₄ items.
- AutomorphicLFunctionsAndLocalFactors AL.4.
- DeformationAndDerivedPatchingAlgebra §§3.1–3.3, 5.1–5.9 (§5.9 norms without division), 6.1–6.7, 7.6–7.10.
- EndoscopicTransferAndUnitaryTraceComparison §§11.1, 13.2 (BCGP25 Proposition 7.5.3).
- GlobalGaloisDeformations R04.3–R04.6, G7, §8.1.
- HodgeTateAndCanonicalSubgroups §§0.2–0.5, 0.14–0.15.
- IntegralHeckeAndGaloisDeterminants §§0.7, 1.1–1.7 (p>2 confirmed in §1.5), 2.1–2.3, 3a, 3b, 4.
- LocalGaloisDeformationRings §§2.7, 2.12, 2.17, 6.3, 6.24, 6.26–6.29 (§6.27 has p>2).
- ModularityAndLanglandsExtensions §§3.2, 3.5, 3.9, 3.26 and GSp4ClassificationInputs.
- PadicFamiliesPartII E6, S7, F8 and K2, including every named item (board design).
- OverconvergentAutomorphicForms §§8.6–8.7.
- PadicHodgeTheory §§3.2–3.6, 4.4, 5.3–5.4.
- ShimuraCompactifications C3.9–C3.10, C5.13–C5.18.
- ShimuraData §§5.9, 5.10, 5.18.
- SmoothRepresentationsOfLocalGroups SR.2.1–2.3, SR.4.1–4.5.
- AutomorphicFormsOnReductiveGroups §§7.4–7.6.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1–R07.2.

Two labels are wrong: ET.7 and ML.0 (R08). All twelve declared gaps carry the same slug in `design/plan.json` and in the README contract sentences; the gaps not named in R06 are precise and minimal.

### Ownership against open work

I searched by object with `roadmaps grep` over main and all 338 open roadmap pull requests at their heads, and over the board packages.

- Owners exist and are already imported for: factorial projectors, Cayley–Hamilton reconstruction, patching algebra, the four Hida modules, solvable descent and the semisimplicity criteria.
- Owners exist but are not cited: NR10.5 (R02), the U(2) tower (R09) and adjoint-L holomorphy (R06).
- S₆≅Sp₄(𝔽₂) (NR8.4) is used without being stated by AbelianSchemesAndArithmeticModuli A3.12, so owning it here is acceptable.
- HigherHidaAndColemanTheory (board) is general higher Hida theory and plans no GSp₄ lifting target.
- No `Suggested.lean` name collides with a readable roadmap.

### Shape

- Every layer has Examples and Dependencies sections.
- All 69 Checks blocks have at least 3 bullets (213 bullets in total). I read every bullet and recomputed every one that states a value (see the table).
- There are no LaTeX delimiters, no `set_option`, no `lemma`, and a single `import Mathlib`.
- Sources: I fetched nothing new and `sources.toml` is unchanged. All seven texts were read at their locators in the sources cache.

## Not verifiable

- No cited text was unreadable.
- Outside the seeded sample, I did not re-read the source behind the author's correction claims in NR0.2 (P20 §5.3 sign), NR2.7 (BCGP25 Lemma 4.12.1 inverses), NR4.2 (vector θ₁ normalization: CG20 Proposition 8.9(2) prints a det(Q) factor that pp.876–877 do not use, and Yamauchi's paper was not consulted), NR10.1 (BCGP25 Definition 7.4.1) or NR10.8 (BCGP25 §7.2). They are neither confirmed nor refuted here.
- The GSp₄ Klingen constant "each prime contributes d_x·(1/4)≡1" (NR6.2) was checked through the GL₂ analogue and the identity Σc_i=d_x. The explicit four Klingen constants were not computed.

## Source issues

- **Misprint** in CG20 at §6.3 (definition of e_β), p.841, and §6.4 (e_{α,β}), p.845: the source says the idempotent is the limit of n!-th powers of the product of both shifted p-operators, which projects where both shifts are units; it should be the product of the two separate generalized-eigenspace projectors 1−lim(T−c)^{n!}; affects nothing.
- **Misprint** in CG20 at Definition 6.15, p.844: the source says Katz modularity needs a form in the m-torsion with the two p-eigenvalues, not required to be nonzero, so the zero form qualifies; it should be a nonzero form, as the deduction after Assumption 6.16 requires; affects a stated result.
- **Gap** in CG20 at proof of Theorem 6.13, pp.842–843: the source says multiplication by A^s maps β-parts to β-parts modulo ϖ^m and transfers the p-polynomial factorization, citing Lemmas 6.2(2) and 6.4; it should be justified separately, since those lemmas give p-operator equivariance only modulo ϖ and use the full-space annihilator; affects the proof.
- **Misprint** in CG20 at proof of Theorem 6.13, p.843: the source says the third linear factor of Q_p(X) involves d_{p,1}; it should be d_{p,3}, as in Theorem 6.13(3); affects nothing.
- **Error** in CG20 at Theorem 7.3, p.847: the source says d_Q⁻¹∘tr is an explicit inverse of pr_Q∘i; it should be (tr∘pr_Q∘i)⁻¹∘tr, because tr∘pr_Q∘i is a Hecke operator congruent to 1 modulo m, not d_Q (GL₂ analogue gives 1/2 mod 5); affects the proof.
- **Error** in CG20 at proof of Lemma 7.4, p.849: the source says the smooth special fibres of X and X₀(Q) are in particular irreducible; it should say each connected component is integral, which suffices for injectivity of multiplication by h; affects nothing.
- **Misprint** in CG20 at Theorem 7.11, p.853: the source says the weight bound is p−2>a; it should be p>a−2, the bound that §7.2 (p.851) states and uses for the duality of Sym^{a−2}; affects nothing.
- **Gap** in CG20 at proof of Theorem 9.1, step (c), p.880: the source says H_N is balanced by Theorem 7.11; it should be justified for the α,β-summand, since Theorem 7.11 treats the full localized module and a summand of a balanced module can have negative defect; affects the proof.
- **Error** in CG20 at Remark 4.12, pp.819–820: the source says Example 4.11 applies when E is non-CM and not isogenous over K to its conjugate; it should assume no isogeny over the algebraic closure, since a twist E₀^ψ with ψ^c≠ψ defeats the argument; affects a stated result.
- **Error** in CG20 at Theorem 8.10, p.861: the source says Θ is injective for k≤p+1 with p∤k(2k−1), a range containing k=p−1; it should exclude k=p−1, where the Hasse invariant (q-expansion 1) is nonzero with Θ of it zero; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f7b2dd9", "job": "REV-PKG-GSp4NonregularModularityLifting", "model": "opus", "worker": "fable-rev67"} -->
