## H01 (roed-math) — applied differently

PeriodsAndSpecialValues has moved since the head that was checked. At its current head c45d237 the new target PS.3.3a ("Borel's theorem as a proved case") consumes §§5.3–5.4, so those sections stay. Its contract heading now reads "BorelRegulators §§2.1–2.3, 5.3–5.4, 6.0a–6.3", and its PS.3.3a *Needs* line cites §§5.3–5.4 and §§6.1–6.2. The defect in our note was "6.1–6.3" where the consumer cites 6.0a–6.3, plus no mapping from consumer sections to our sections. `TauCetiRoadmap/BorelRegulators/README.md:847` changes from "§§2.1–2.3, 5.3–5.4 and 6.1–6.3 provide inputs…" to: PS.3.2a ← §§2.1–2.3, 6.0a–6.3; PS.3.3a ← §§5.3–5.4, 6.1–6.2; PS.9.8–PS.9.9 ← §§2.3, 6.3. At `:851`, "§§2.1–2.3, 5.1–5.5 and 6.1–6.3" becomes "… 6.0a–6.3".

The same defect, repaired in the other downstream notes:
- **Polylogarithms** (`:846`). Our note said its §§2.3, 3.7–3.8, 4.4 consume §§2.1–2.3, 5.2–5.4 and 6.2, and that it declares a "borel-period-contract gap". At head fc00043 that roadmap has no such gap. Its §§2.3, 4.4, 4.7 and 5.15 cite only §§2.3 and 5.1–5.4 (its README lines 199, 655, 717, 1356), and its supplier contract cites §3.4 (line 104). The bullet now lists exactly those sections as direct supplier contracts.
- **PadicHodgeRegulators** (`:848`). Its §4.7 consumes §§2.1–2.3, 6.0a and 6.2 (head b4b7727, README lines 74 and 1061), but it was missing from our list. Added.

## H02 (roed-math) — applied

This uses the reviewer's first option. ArithmeticKTheory has added the finite-stage statement to §3.4: at its head 3f68345, §3.4 constructs borelInvariantFormComparison H^q(Lie G(ℝ),K;ℝ)→H^q(Γ;ℝ) for every connected semisimple ℚ-group with connected real points, every arithmetic Γ and every q≥0. It is natural for finite-index and block inclusions. It is bijective when 4q is less than the ℚ-rank of each almost simple factor, which for Res_(F/ℚ)SL_a means 4q<a−1 for every F. Its scope paragraph now claims this as its own. Changes:
- The "What ArithmeticKTheory must provide (gap:stable-finite-range)" paragraph becomes a direct contract (`TauCetiRoadmap/BorelRegulators/README.md:80`). The contract shows that our ranges lie inside the supplied one: a−1>4N(2n−1) for §§4.5–5.1 (borel1977 line 481) and a>4N(j+1)² for §4.4 (borel1977 line 493). Under both, every degree up to the cumulative wedge degree is below (a−1)/4.
- Each "gap:stable-finite-range" in a *Needs* line becomes "ArithmeticKTheory §3.4" or is dropped where §3.4 was already listed: §2.3 `:307`, §4.4 `:542`, §4.5 `:565`, §4.6 `:584`, §5.1 `:615`. The Layer 4 Dependencies line `:592` now reads "finite-stage and stable arithmetic comparison". The Scope paragraph `:11` names the finite-stage comparison as ArithmeticKTheory's.
- The §2.3 range Checks (`:303–304`) had "F=ℚ(i), q=3: a=25 outside the range". This is false for the supplied comparison, which holds from a=14 (12<13). The Checks now test the supplier's range 4q<a−1 and keep 4Nq only as the narrower sufficient range. This agrees with ArithmeticKTheory §3.4's own check.
- Repairing the pattern: §4.2 built its own invariant-form map to H*(Γ,ℝ), the same object §3.4 now owns. jℝ is now defined as i^q times ArithmeticKTheory §3.4's comparison, complexified, composed with the identical-extension identification H*(Xᵘ,ℂ)≅H*(Lie G(ℝ),K;ℂ) (`:483`). The proof route `:485` and the *Needs* line `:501` were updated to match.

## H03 (roed-math) — answered

This roadmap neither owns nor consumes the weight-two Bloch–Wigner comparison or its scalar κ₂. Polylogarithms (§§2.3, 4.4, 4.7, 5.15) and PadicHodgeRegulators (§4.7) both consume BorelRegulators, so whichever of them owns that evaluation, no statement or proof here changes. One line was made neutral so that it cannot contradict the outcome. `TauCetiRoadmap/BorelRegulators/README.md:13` said "Polylogarithms §§2.3,3.7–3.8,4.4 owns explicit symbol comparisons…". It now says that those comparisons and calibrations (Polylogarithms §§2.3,3.7–3.8,4.4) and the de Jeu–Bloch weight-two comparison (PadicHodgeRegulators §4.7) lie downstream of this roadmap and supply no input to its proof.

---

**Other repairs made while gating.**
- *Statement hygiene, `Suggested.lean`.* The gate flagged `letI : Algebra F ℝ := σ.toAlgebra` in the signature of `exists_divisionAlgebra_split_at_infinity`. The real-splitting clause changes from `∀ σ : F →+* ℝ, letI … ; IsSplittingField F D ℝ` to `∀ v : NumberField.InfinitePlace F, v.IsReal → TauCeti.Algebra.IsSplittingField F D v.Completion`, using Mathlib's completion and its native `Algebra F` instance. The two statements are equivalent. Real places correspond bijectively to real embeddings. `ringEquivRealOfIsReal` identifies `v.Completion` with ℝ, and the composite F→v.Completion→ℝ is v's real embedding. Splitting is invariant under F-algebra isomorphism of the extension field. README §3.2 (`:344`, `:360`, *Needs* `:362`) and the Mathlib and Tau Ceti contracts (`:51`, `:66`) were updated to match.
- *Pins.* The README recorded Mathlib 6b7abb3 and Tau Ceti a91d3aa, but the pins in `lake-manifest.json` are Mathlib 1b1ccf4 and Tau Ceti 2fd255d. I checked every cited `file:line` at the pins and updated 21 moved locators and both baseline hashes (`:43`, `:62` and the contract lines `:15`, `:45–58`, `:62–68`). Every declaration is still present, and its cited content (statement, hypotheses, the existential matrix size of `IsSplittingField`, the `Re s>1−1/N` remainder) still holds.

**Signatures.** Suggested.lean has 4 declarations. I appended `#check @name` for all four, elaborated them once with the allowed `lake build`, then restored the file byte-for-byte from a scratch copy before committing. The elaborated types match README §§1.3, 3.1, 3.2 and 5.1. The only type that changed is the one above, and it now quantifies over `v : NumberField.InfinitePlace F` with `v.IsReal`. No binder was lost. `[NumberField F]` is unused in the types of `period_eq_index` and `exists_divisionAlgebra_split_at_infinity`, but it is needed for their truth (over ℝ there is no central division algebra of degree 3) and stays explicit.

**Ownership, citations and merge order.** I added no new construction. The finite-stage comparison now has a single owner, ArithmeticKTheory §3.4, which is earlier in the merge order. §4.2 consumes it instead of rebuilding it. The cited heads were confirmed with `roadmaps list`: ArithmeticKTheory 3f68345, PeriodsAndSpecialValues c45d237, Polylogarithms fc00043, PadicHodgeRegulators b4b7727, K3BlochGroups c9ca311. No cited id is defined only by an open revision. ArithmeticKTheory is a new-roadmap pull request already earlier in the merge order. The consumers are cited only in Scope and Downstream consumers, never in *Needs* or supplier rows. `roadmaps resolve` reports no unresolved cross-roadmap citation or Lean name. No other open pull request changes this roadmap. The review's request to switch the label back to awaiting-review is for the worker to act on; the review contains no other instruction.

**Sources.** I read borel1977 at lines 459–461 (the β* isomorphism range (n−1)/4 in §5.2, independent of [F:ℚ]), line 481 (Theorem 5.5 hypothesis n−1>4d(2m+1)) and line 493 (n>4d(m+1)² in its proof). No new source was needed, and no needs-references file was written.

**Adversarial pass on added or changed statements.**

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Supplied range for Res_(F/ℚ)SL_a: bijective iff-range 4q<a−1 | a=2,q=0; a=2,q=1 (Γ(3)⊂SL₂(ℤ)); F=ℚ(i),a=2,q=3; a=14,q=3 | 0<1 and 1↦1; 4<1 false, and indeed H¹(Γ(3))=ℝ³ but compact-dual H¹=0; 12<1 false, and vcd SL₂(ℤ[i])=2 kills the volume class; 12<13 true | Exclusions match genuine failures | Contract `:80` |
| ℚ-rank input | Res_(F/ℚ)SL_a, a=2,3 | ℚ-rank = F-rank = a−1 = 1,2; almost ℚ-simple for a≥2 | Range independent of N | Contract `:80` |
| §§4.5–5.1 range inside the supplied range | N=1,n=2,a=14; N=2,n=2,a=26; N=2,n=3,a=42 | top degree N(2n−1)=3,6,10; 4·top=12,24,40 against a−1=13,25,41 | Strict in each case; at minimal a, 4·top=a−2 | Contract `:80` |
| §4.4 range inside the supplied range | N=1,j=1,a=17; N=2,j=1,a=33; N=1,j=2,a=37 | N(j²+2j)=3,6,8; 4·that=12,24,32 against a−1=16,32,36 | Holds; in general 4N(j+1)²−4N ≤ a−1−4N | Contract `:80` |
| §2.3 Check, F=ℚ, q=5 | a=21,22 | 4q=20 against a−1=20,21; 4Nq=20, the same | First value a=22 | Rewritten `:303` |
| §2.3 Check, F=ℚ(i), q=3 | a=13,14,25,26 | 4q=12 against 12,13; 4Nq=24 against 24,25 | Supplied range starts at 14, Borel's at 26; old text called a=25 "outside" | Rewritten `:304` |
| §2.3 Check, q=0 | a=2 | 0<1; constant 1↦1 | Retained | None |
| §4.2 jℝ=i^q·(j_Γ⊗ℂ)∘ι, degree 0 | constant 1 | ι(1)=1, j_Γ(1)=1, i⁰=1 → 1 | Zero map fails | `:483` |
| §4.2 reality of jℝ | real q-form ω on ip, evaluated on v_k∈p | ω_ℂ(v)=(−i)^q ω(iv) ∈ (−i)^qℝ; i^q(−i)^q=1, so real; without i^q, q=3 gives iℝ | The correction is needed and sufficient | `:483` |
| §4.2 multiplicativity | degrees 1 and 2 | i·i²=i·(−1)=−i=i³; the supplied map is a graded-algebra map | Retained | `:485` |
| §4.2 outside the range | SL₂/ℚ, q=2, Γ(3) | map defined; area class ↦ 0 in H²(Γ(3))=0 | No isomorphism asserted | `:485` |
| `exists_divisionAlgebra_split_at_infinity`, degree | a=0,1,2 | finrank of a division ring ≥1 ≠ 0²; D=F gives 1=1²; quaternion 4=2² | a=0 excluded by `1 ≤ a` | Lean `:89` |
| real-place splitting | F=ℚ, D=(−1,3) and Hamilton ℍ_ℚ at the real place | v.Completion≅ℝ; ℝ⊗(−1,3)≅M₂(ℝ); ℝ⊗ℍ_ℚ=ℍ, dimension 4 forces n=2 but ℍ≇M₂(ℝ) (no zero divisors) | Indefinite algebra passes, Hamilton fails | Lean `:89`, README `:359` |
| real-place count | ℚ(i); ℚ(√2) | real places 0 (condition vacuous); 2 real places ↔ 2 real embeddings | Bijection with the old σ-quantifier | README `:360` |
| equivalence with the old statement | real v with embedding σ_v | F→v.Completion→ℝ equals σ_v; IsSplittingField transported along the F-algebra isomorphism | Same proposition | Lean `:89` |
| downstream mapping, PeriodsAndSpecialValues | its README lines 836/859, 915, 2208, 2228 | §§2.1–2.3, 6.0a–6.3; §§5.3–5.4, 6.1–6.2; §6.3; §§2.3, 6.3 | Matches the new bullet | `:847` |
| downstream mapping, Polylogarithms | its README lines 104, 199, 655, 717, 1356 | §3.4; §§2.3, 5.1–5.4; same; §5.1; §2.3 | §§2.1–2.2, 6.2 not cited; no gap | `:846` |
| downstream mapping, PadicHodgeRegulators | its README lines 74, 1061 | §§2.1–2.3, §6.0a, §6.2 | Was missing | `:848` |
| Scope line on symbol comparisons | Polylogarithms §§2.3, 3.7, 3.8, 4.4; PadicHodgeRegulators §4.7 | headings exist at the heads ("Borel normalization…", "Primitive K-theory…", "Cycle lifting…", "Three Zagier assertions…"; "de Jeu's weight-two classes and Suslin's Bloch group") | Neutral and accurate | `:13` |
| Pin locators | 47 file:line citations | 26 matched; 21 moved by 1–14 lines (e.g. `det_fin_zero` 798→804, `IsSplittingField` 120→113, `brauerCohomologyEquiv` 267→274) | All declarations present | 21 locators and 2 hashes |

**Dependency check** (after the final edits):

    depcheck: 239 roadmaps, 2350 edges, 0 problem(s)

No UPWARD, CYCLE or moved line.

**Build.** `lake build TauCetiRoadmap.BorelRegulators.Suggested` completed successfully (9010 jobs). The only diagnostics are the 4 expected `declaration uses 'sorry'` warnings, at lines 51, 77, 89 and 105.

**Commit.** c564441 "BorelRegulators: review repairs (downstream sections, finite-stage comparison supplied, real-place completions, pin locators)". Not pushed.

**Gate.**

    gate BorelRegulators: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
